@implementation SGConversationFlatteningTransformer

- (SGConversationFlatteningTransformer)initWithPerMessageTransformer:(id)a3
{
  id v5;
  SGConversationFlatteningTransformer *v6;
  SGConversationFlatteningTransformer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGConversationFlatteningTransformer;
  v6 = -[SGConversationFlatteningTransformer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_perMessageTranformer, a3);

  return v7;
}

- (id)transform:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v45;
  void *v46;
  void *context;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  const __CFString *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGConversationFlatteningTransformer.m"), 47, CFSTR("Unexpected input type for %@: %@, "), v4, v40);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("INPUT_CONVERSATION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SG_MODEL_INPUT_TARGET_MESSAGE_INDEX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v45 = v6;
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "integerValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v9, "senderIsAccountOwner");

  v10 = objc_msgSend(v5, "count");
  if (v10 <= 3)
    v11 = 3;
  else
    v11 = v10;
  v12 = (v11 - 3);
  if (objc_msgSend(v5, "count") > v12)
  {
    v43 = v5;
    do
    {
      v13 = MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "text");
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "objectAtIndexedSubscript:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "message");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "senderIsAccountOwner");

      v19 = objc_alloc(MEMORY[0x1E0C99E08]);
      v54 = CFSTR("INPUT_TEXT");
      v55[0] = v15;
      v46 = (void *)v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithDictionary:", v20);

      context = (void *)v13;
      v48 = v21;
      if (v12 == objc_msgSend(v45, "intValue"))
      {
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("DD_MATCHES"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("DD_MATCHES"));

        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("TARGET_MATCH"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("TARGET_MATCH"));

        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("SG_MODEL_INPUT_TARGET_RANGE"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("SG_MODEL_INPUT_TARGET_RANGE"));

      }
      else
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "detectedData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("DD_MATCHES"));

        objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SG_MODEL_DISABLE_TARGET_MAPPING"));
      }
      -[PMLTransformerProtocol transform:](self->_perMessageTranformer, "transform:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v28 = v27;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v29)
      {
        v30 = v29;
        v31 = v42 ^ v18;
        v32 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v50 != v32)
              objc_enumerationMutation(v28);
            v34 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
            v35 = (void *)MEMORY[0x1C3BD4F6C]();
            if ((v31 & 1) != 0)
            {
              objc_msgSend(v7, "addObject:", v34);
            }
            else
            {
              objc_msgSend(CFSTR("SG_FEATURE_TARGET_SENT__"), "stringByAppendingString:", v34);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v36);

            }
            objc_autoreleasePoolPop(v35);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        }
        while (v30);
      }

      objc_msgSend(v7, "addObject:", CFSTR("SG_FEATURE_END_OF_MESSAGE"));
      objc_autoreleasePoolPop(context);
      ++v12;
      v5 = v43;
    }
    while (objc_msgSend(v43, "count") > v12);
  }

  return v7;
}

- (id)toPlistWithChunks:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D81058];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithClassNameKey:", *MEMORY[0x1E0D810A0]);
  v11 = CFSTR("PER_MESSAGE_TRANSFORMER");
  objc_msgSend(v7, "writeToPlistWithObject:andChunks:", self->_perMessageTranformer, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SGConversationFlatteningTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  SGConversationFlatteningTransformer *v16;

  v8 = (objc_class *)MEMORY[0x1E0D81058];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  v13 = (void *)objc_msgSend(v12, "initWithClassNameKey:", *MEMORY[0x1E0D810A0]);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PER_MESSAGE_TRANSFORMER"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "readObjectWithPlist:chunks:context:", v14, v10, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SGConversationFlatteningTransformer initWithPerMessageTransformer:](self, "initWithPerMessageTransformer:", v15);
  return v16;
}

- (BOOL)isEqualToConversationFlatteningTransformer:(id)a3
{
  _QWORD *v4;
  PMLTransformerProtocol *v5;
  PMLTransformerProtocol *v6;
  char v7;

  v4 = a3;
  if (v4)
  {
    v5 = self->_perMessageTranformer;
    v6 = v5;
    if (v5 == (PMLTransformerProtocol *)v4[1])
      v7 = 1;
    else
      v7 = -[PMLTransformerProtocol isEqual:](v5, "isEqual:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SGConversationFlatteningTransformer *v4;
  SGConversationFlatteningTransformer *v5;
  BOOL v6;

  v4 = (SGConversationFlatteningTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGConversationFlatteningTransformer isEqualToConversationFlatteningTransformer:](self, "isEqualToConversationFlatteningTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  return -[PMLTransformerProtocol hash](self->_perMessageTranformer, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perMessageTranformer, 0);
}

+ (id)withPerMessageTransformer:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPerMessageTransformer:", v4);

  return v5;
}

@end
