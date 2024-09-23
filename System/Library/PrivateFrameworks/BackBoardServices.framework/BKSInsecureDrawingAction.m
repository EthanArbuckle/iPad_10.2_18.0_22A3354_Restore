@implementation BKSInsecureDrawingAction

- (BKSInsecureDrawingAction)initWithPidToContextIdsDictionary:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  BKSInsecureDrawingAction *v18;
  void *v20;
  BKSInsecureDrawingAction *v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSInsecureDrawingAction.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pidToContextIdsDictionary"));

  }
  v21 = self;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v22 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v7, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v15);
        }

        objc_msgSend(v23, "setObject:forKeyedSubscript:", v12, v11);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }

  v18 = -[BKSInsecureDrawingAction _initWithPidToContextInfoDictionary:](v21, "_initWithPidToContextInfoDictionary:", v23);
  return v18;
}

- (BKSInsecureDrawingAction)initWithSecureModeViolations:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  BKSInsecureDrawingAction *v18;
  void *v20;
  BKSInsecureDrawingAction *v21;
  id obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSInsecureDrawingAction.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secureModeViolations"));

  }
  v21 = self;
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v33;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(obj);
        v27 = v6;
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v6);
        objc_msgSend(v7, "processId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v7, "layerNamesByContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v7, "contextIds");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v29 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v9, "objectForKeyedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v15);
              }
              else
              {
                v17 = objc_alloc_init(MEMORY[0x1E0C99E60]);
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v15);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v12);
        }

        objc_msgSend(v24, "setObject:forKeyedSubscript:", v8, v26);
        v6 = v27 + 1;
      }
      while (v27 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v25);
  }

  v18 = -[BKSInsecureDrawingAction _initWithPidToContextInfoDictionary:](v21, "_initWithPidToContextInfoDictionary:", v24);
  return v18;
}

- (id)_initWithPidToContextInfoDictionary:(id)a3
{
  id v5;
  id v6;
  BKSInsecureDrawingAction *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSInsecureDrawingAction.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pidToContextInfoDictionary"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v6, "setObject:forSetting:", v5, 1);
  v10.receiver = self;
  v10.super_class = (Class)BKSInsecureDrawingAction;
  v7 = -[BKSInsecureDrawingAction initWithInfo:responder:](&v10, sel_initWithInfo_responder_, v6, 0);

  return v7;
}

- (BKSInsecureDrawingAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{

  return 0;
}

- (BKSInsecureDrawingAction)initWithInfo:(id)a3 responder:(id)a4
{

  return 0;
}

- (NSArray)secureModeViolations
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  -[BKSInsecureDrawingAction pidToContextInfoDictionary](self, "pidToContextInfoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__BKSInsecureDrawingAction_secureModeViolations__block_invoke;
  v7[3] = &unk_1E1EA1310;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

- (NSDictionary)pidToContextInfoDictionary
{
  void *v2;
  void *v3;

  -[BKSInsecureDrawingAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSArray)processIds
{
  void *v2;
  void *v3;

  -[BKSInsecureDrawingAction pidToContextInfoDictionary](self, "pidToContextInfoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 1)
  {
    v5 = CFSTR("pidToContextInfoDictionary");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)BKSInsecureDrawingAction;
    -[BKSInsecureDrawingAction keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

void __48__BKSInsecureDrawingAction_secureModeViolations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BKSSecureModeViolation *v7;
  void *v8;
  BKSSecureModeViolation *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v5 = a2;
  v6 = a3;
  v7 = [BKSSecureModeViolation alloc];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BKSSecureModeViolation initWithProcessId:contextIds:](v7, "initWithProcessId:contextIds:", v5, v8);

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__BKSInsecureDrawingAction_secureModeViolations__block_invoke_2;
  v10[3] = &unk_1E1EA12E8;
  v10[4] = &v11;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  if (*((_BYTE *)v12 + 24))
    -[BKSSecureModeViolation setLayerNamesByContext:](v9, "setLayerNamesByContext:", v6);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  _Block_object_dispose(&v11, 8);

}

uint64_t __48__BKSInsecureDrawingAction_secureModeViolations__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end
