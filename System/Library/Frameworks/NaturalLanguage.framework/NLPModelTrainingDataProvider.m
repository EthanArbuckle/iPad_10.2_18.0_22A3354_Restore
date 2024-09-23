@implementation NLPModelTrainingDataProvider

- (NLPModelTrainingDataProvider)initWithConfiguration:(id)a3 numberOfInstances:(unint64_t)a4 dataSource:(void *)a5 instanceDataProvider:(id)a6
{
  id v10;
  NLPModelTrainingDataProvider *v11;
  NLPModelTrainingDataProvider *v12;
  uint64_t v13;
  id instanceDataProvider;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NLPModelTrainingDataProvider;
  v11 = -[NLDataProvider initWithConfiguration:dataURL:](&v16, sel_initWithConfiguration_dataURL_, a3, 0);
  v12 = v11;
  if (v11)
  {
    v11->_numberOfInstances = a4;
    v11->_dataSource = a5;
    v13 = MEMORY[0x1A8592F80](v10);
    instanceDataProvider = v12->_instanceDataProvider;
    v12->_instanceDataProvider = (id)v13;

  }
  return v12;
}

- (unint64_t)numberOfInstances
{
  return self->_numberOfInstances;
}

- (id)instanceAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NLSequenceModelDataInstance *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (void *)(*((uint64_t (**)(void))self->_instanceDataProvider + 2))();
  if (!v5)
    goto LABEL_41;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_41;
  -[NLDataProvider configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 == 1)
  {
    objc_msgSend(v5, "objectForKey:", kNLPTokenArrayKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", kNLPLabelArrayKey);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      v10 = 0;
      if ((objc_opt_isKindOfClass() & 1) == 0 || !v12)
      {
LABEL_40:

        if (v10)
          goto LABEL_42;
LABEL_41:
        NSLog(CFSTR("Skipping invalid sample at index %llu"), a3);
        v10 = 0;
        goto LABEL_42;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v11, "count");
        if (v13 == objc_msgSend(v12, "count"))
        {
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v14 = v11;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v32;
            while (2)
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v32 != v17)
                  objc_enumerationMutation(v14);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v26 = 0;
                  goto LABEL_28;
                }
                ++v18;
              }
              while (v16 != v18);
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
              if (v16)
                continue;
              break;
            }
          }
          v26 = 1;
LABEL_28:
          v25 = v14;

          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v19 = v12;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v28;
            while (2)
            {
              v23 = 0;
              do
              {
                if (*(_QWORD *)v28 != v22)
                  objc_enumerationMutation(v19);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  goto LABEL_39;
                }
                ++v23;
              }
              while (v21 != v23);
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v21)
                continue;
              break;
            }
          }

          if (v26)
          {
            v10 = -[NLSequenceModelDataInstance initWithTokens:labels:]([NLSequenceModelDataInstance alloc], "initWithTokens:labels:", v25, v19);
            goto LABEL_40;
          }
        }
      }
    }
LABEL_39:
    v10 = 0;
    goto LABEL_40;
  }
  if (v7)
    goto LABEL_41;
  objc_msgSend(v5, "objectForKey:", kNLPStringKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", kNLPLabelKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_24:
    v10 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  v10 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[NLClassifierModelDataInstance initWithString:label:tokenizer:]([NLClassifierModelDataInstance alloc], "initWithString:label:tokenizer:", v8, v9, -[NLDataProvider tokenizer](self, "tokenizer"));
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_25:

  if (!v10)
    goto LABEL_41;
LABEL_42:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_instanceDataProvider, 0);
}

@end
