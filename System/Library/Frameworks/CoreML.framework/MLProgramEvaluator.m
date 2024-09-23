@implementation MLProgramEvaluator

- (MLProgramEvaluator)initWithProgram:(id)a3 error:(id *)a4
{
  id v6;
  MLProgramEvaluator *v7;
  MLProgramEvaluator *v8;
  NSObject *v9;
  uint8_t v11[16];
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLProgramEvaluator;
  v7 = -[MLProgramEvaluator init](&v12, sel_init);
  if (!v7)
    goto LABEL_4;
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EE441718) & 1) != 0)
  {
    objc_storeStrong((id *)&v7->_program, a3);
LABEL_4:
    v8 = v7;
    goto LABEL_8;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "The program argument to MLProgramEvaluator is not conforming to some internal requirements. Do not implement MLProgram protocol by yourself. Use the one returned by MLModel's .program property.", v11, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The program argument to MLProgramEvaluator is not conforming to some internal requirements. Do not implement MLProgram protocol by yourself. Use the one returned by MLModel's .program property."));
  v8 = 0;
LABEL_8:

  return v8;
}

- (void)updateContext:(id)a3 functionName:(id)a4 result:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  MLDictionaryFeatureProvider *v40;
  char v41;
  void *v42;
  id obja;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v45 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executionState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "featureNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "functionNameToInputLayersNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "train");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "intersectsSet:", v16) & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(v7, "executionState");
    obja = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "featureNames");
    v42 = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "featureNames");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v18, "intersectsSet:", v19);

    if ((v41 & 1) == 0)
      goto LABEL_18;
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v7, "executionState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "featureNames");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v21;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v47 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v7, "executionState");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "featureValueForName:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, v26);

        objc_msgSend(v7, "functionNameToInputLayersNames");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v45);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "containsObject:", v26);

        if (v31)
        {
          objc_msgSend(v7, "functionNameToStateMap");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", v45);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v26);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "featureNames");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v33) = objc_msgSend(v35, "containsObject:", v34);

          if ((_DWORD)v33)
          {
            objc_msgSend(v8, "featureValueForName:", v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v36, v26);

          }
        }
        objc_msgSend(v8, "featureNames");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "containsObject:", v26);

        if (v38)
        {
          objc_msgSend(v8, "featureValueForName:", v26);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v39, v26);

        }
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v23);
  }

  v40 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v9, 0);
  objc_msgSend(v7, "setExecutionState:", v40);

LABEL_18:
}

- (id)prepareArgumentsFromFeatures:(id)a3 context:(id)a4 forFunctionName:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  MLDictionaryFeatureProvider *v27;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v30 = a4;
  v29 = a5;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v7, "featureNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v7, "featureValueForName:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v11);
  }

  objc_msgSend(v30, "functionNameToInputLayersNames");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v30, "executionState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "featureNames");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        if (objc_msgSend(v17, "containsObject:", v24))
        {
          objc_msgSend(v30, "executionState");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "featureValueForName:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, v24);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v21);
  }

  v27 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v8, 0);
  return v27;
}

- (id)evaluateFunction:(id)a3 arguments:(id)a4 context:(id)a5 updateContext:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v14)
  {
    -[MLProgramEvaluator prepareArgumentsFromFeatures:context:forFunctionName:](self, "prepareArgumentsFromFeatures:context:forFunctionName:", v13, v14, v12);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v15;
  }
  -[MLProgramEvaluator program](self, "program");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "evaluateFunction:arguments:error:", v12, v13, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v8)
      -[MLProgramEvaluator updateContext:functionName:result:](self, "updateContext:functionName:result:", v14, v12, v17);
    v18 = v17;
  }

  return v17;
}

- (id)evaluateFunction:(id)a3 arguments:(id)a4 context:(id)a5 error:(id *)a6
{
  return -[MLProgramEvaluator evaluateFunction:arguments:context:updateContext:error:](self, "evaluateFunction:arguments:context:updateContext:error:", a3, a4, a5, 1, a6);
}

- (id)newContextAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v11;

  v5 = (void *)MEMORY[0x1A1AD6ED8](self, a2);
  -[MLProgramEvaluator program](self, "program");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = (void *)objc_msgSend(v6, "newContextAndReturnError:", &v11);
  v8 = v11;

  objc_autoreleasePoolPop(v5);
  if (v7)
  {
    v9 = v7;
  }
  else if (a3)
  {
    *a3 = objc_retainAutorelease(v8);
  }

  return v7;
}

- (MLModeling)model
{
  NSObject *v2;
  uint8_t v4[16];

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19C486000, v2, OS_LOG_TYPE_ERROR, ".model property is not implemented yet. See rdar://86160890.", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR(".model property is not implemented yet. See rdar://86160890."));
  return 0;
}

- (MLProgramInternal)program
{
  return self->_program;
}

- (void)setProgram:(id)a3
{
  objc_storeStrong((id *)&self->_program, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_program, 0);
}

@end
