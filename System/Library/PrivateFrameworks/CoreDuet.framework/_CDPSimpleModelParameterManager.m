@implementation _CDPSimpleModelParameterManager

- (_CDPSimpleModelParameterManager)initWithSettings:(id)a3
{
  id v3;
  _CDPSimpleModelParameterManager *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *accountStateKey;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_CDPSimpleModelParameterManager;
  v3 = a3;
  v4 = -[_CDPSimpleModelParameterManager init](&v10, sel_init);
  objc_msgSend(v3, "constrainAccounts", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = objc_claimAutoreleasedReturnValue();
  accountStateKey = v4->_accountStateKey;
  v4->_accountStateKey = (NSString *)v7;

  -[_CDPSimpleModelParameterManager loadAccountState](v4, "loadAccountState");
  return v4;
}

- (id)accountIdentifierForSettings:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "constrainAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)modelTuner:(id)a3 heartBeatWithlambda:(float)a4 w0:(float)a5 threshold:(float)a6 score:(float)a7 progress:(float)a8
{
  id v14;
  _CDPSimpleModelParameterManagerTuningValue *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _CDPSimpleModelParameterManagerTuningValue *v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  float v34;
  uint64_t i;
  void *v36;
  float v37;
  float v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = [_CDPSimpleModelParameterManagerTuningValue alloc];
  *(float *)&v16 = a4;
  *(float *)&v17 = a5;
  *(float *)&v18 = a6;
  *(float *)&v19 = a7;
  v20 = -[_CDPSimpleModelParameterManagerTuningValue initWithLambda:w0:threshold:score:](v15, "initWithLambda:w0:threshold:score:", v16, v17, v18, v19);
  -[_CDPSimpleModelParameterManagerAccountState tuningValues](self->_accountState, "tuningValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v20);

  -[_CDPSimpleModelParameterManagerTuningValue score](v20, "score");
  v23 = v22;
  -[_CDPSimpleModelParameterManagerAccountState previousBestTuningValue](self->_accountState, "previousBestTuningValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "score");
  v26 = v25;

  if (v23 > v26)
    -[_CDPSimpleModelParameterManagerAccountState setPreviousBestTuningValue:](self->_accountState, "setPreviousBestTuningValue:", v20);
  objc_msgSend(v14, "currentState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  -[_CDPSimpleModelParameterManagerAccountState setLastTuningState:](self->_accountState, "setLastTuningState:", v28);

  if (a8 == 1.0)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[_CDPSimpleModelParameterManagerAccountState tuningValues](self->_accountState, "tuningValues", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v30)
    {
      v31 = v30;
      v32 = 0;
      v33 = *(_QWORD *)v42;
      v34 = -1.0;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v42 != v33)
            objc_enumerationMutation(v29);
          v36 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v36, "score");
          if (v37 > v34)
          {
            objc_msgSend(v36, "score");
            v34 = v38;
            v39 = v36;

            v32 = v39;
          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v31);
    }
    else
    {
      v32 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDPSimpleModelParameterManagerAccountState setTuningValues:](self->_accountState, "setTuningValues:", v40);

    -[_CDPSimpleModelParameterManagerAccountState setPreviousBestTuningValue:](self->_accountState, "setPreviousBestTuningValue:", v32);
    -[_CDPSimpleModelParameterManagerAccountState setLastTuningState:](self->_accountState, "setLastTuningState:", 0);

  }
}

- (void)getLambda:(float *)a3 w0:(float *)a4 threshold:(float *)a5
{
  void *v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  id v14;

  -[_CDPSimpleModelParameterManagerAccountState previousBestTuningValue](self->_accountState, "previousBestTuningValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lambda");
  *(_DWORD *)a3 = v10;

  -[_CDPSimpleModelParameterManagerAccountState previousBestTuningValue](self->_accountState, "previousBestTuningValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "w0");
  *(_DWORD *)a4 = v12;

  -[_CDPSimpleModelParameterManagerAccountState previousBestTuningValue](self->_accountState, "previousBestTuningValue");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "threshold");
  *(_DWORD *)a5 = v13;

}

- (void)loadAccountState
{
  uint64_t v3;
  _CDPSimpleModelParameterManagerAccountState *v4;
  _CDPSimpleModelParameterManagerAccountState *v5;
  _CDPSimpleModelParameterManagerAccountState *accountState;
  _CDPSimpleModelParameterManagerAccountState *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_accountStateKey && (objc_msgSend(v8, "objectForKey:"), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (_CDPSimpleModelParameterManagerAccountState *)v3;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
    v5 = (_CDPSimpleModelParameterManagerAccountState *)objc_claimAutoreleasedReturnValue();
    accountState = self->_accountState;
    self->_accountState = v5;

  }
  else
  {
    v7 = objc_alloc_init(_CDPSimpleModelParameterManagerAccountState);
    v4 = self->_accountState;
    self->_accountState = v7;
  }

}

- (void)saveAccountState
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18DDBE000, log, OS_LOG_TYPE_DEBUG, "Account state did synchronize.", v1, 2u);
}

- (_CDPModelTuningState)lastTuningState
{
  return -[_CDPSimpleModelParameterManagerAccountState lastTuningState](self->_accountState, "lastTuningState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStateKey, 0);
  objc_storeStrong((id *)&self->_accountState, 0);
}

@end
