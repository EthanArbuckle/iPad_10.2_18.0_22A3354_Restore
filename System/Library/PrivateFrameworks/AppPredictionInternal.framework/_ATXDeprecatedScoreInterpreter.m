@implementation _ATXDeprecatedScoreInterpreter

- (unint64_t)instructionCount
{
  NSDictionary *varPrograms;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  varPrograms = self->_varPrograms;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50___ATXDeprecatedScoreInterpreter_instructionCount__block_invoke;
  v5[3] = &unk_1E82E9310;
  v5[4] = &v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](varPrograms, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSSet)subscoreNames
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[NSDictionary allKeys](self->_varPrograms, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  return (NSSet *)v5;
}

- (_ATXDeprecatedScoreInterpreter)initWithParseRoot:(id)a3
{
  id v4;
  _ATXDeprecatedScoreInterpreter *v5;
  _ATXDeprecatedScoreInterpreter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_ATXDeprecatedScoreInterpreter;
  v5 = -[_ATXDeprecatedScoreInterpreter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_ATXDeprecatedScoreInterpreter _compileRoot:](v5, "_compileRoot:", v4);

  return v6;
}

- (void)_compileRoot:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *varPrograms;
  _ATXDeprecatedScoreInterpreter *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id location;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v18 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  v15 = self;
  objc_initWeak(&location, self);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v6)
  {
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v5);
        v8 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v25 = 0;
        v26 = (id *)&v25;
        v27 = 0x3042000000;
        v28 = __Block_byref_object_copy__95;
        v29 = __Block_byref_object_dispose__95;
        v30 = 0;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke;
        aBlock[3] = &unk_1E82E9438;
        v21 = v18;
        v22 = v17;
        objc_copyWeak(&v24, &location);
        v23 = &v25;
        v9 = _Block_copy(aBlock);
        objc_storeWeak(v26 + 5, v9);
        WeakRetained = objc_loadWeakRetained(v26 + 5);
        objc_msgSend(v5, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        compiledExpressionInstructions(WeakRetained, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v12, v8);

        objc_destroyWeak(&v24);
        _Block_object_dispose(&v25, 8);
        objc_destroyWeak(&v30);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v6);
  }

  v13 = objc_msgSend(v19, "copy");
  varPrograms = v15->_varPrograms;
  v15->_varPrograms = (NSDictionary *)v13;

  objc_destroyWeak(&location);
}

- (double)_evalVariable:(id)a3 withCtx:(id)a4
{
  id v6;
  id *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  void *v29;

  v6 = a3;
  v7 = (id *)a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _evalVariable:withCtx:]");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 644, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("varName"));

  }
  -[NSDictionary objectForKeyedSubscript:](self->_varPrograms, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_ATXDeprecatedScoreInterpreter _evalVariable:withCtx:].cold.2((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXDeprecatedScoreInterpreter _evalVariable:withCtx:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("_ATXDeprecatedScoreInterpreter.m"), 649, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instructions"));

  }
  v18 = runInstructionsAndPopResult(v8, v7);
  v19 = fabs(v18);
  if (v19 >= INFINITY && v19 <= INFINITY)
  {
    __atxlog_handle_default();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[_ATXScoreInterpreter _evalVariable:withCtx:].cold.1((uint64_t)v6, v20, v21, v22, v23, v24, v25, v26);

  }
  objc_msgSend(v7[503], "setScore:forKey:", v6, v18);

  return v18;
}

- (id)evaluateWithInputScores:(id)a3 intentType:(id)a4
{
  id v6;
  id v7;
  _ATXDeprecatedScoreInterpreterCtx *v8;
  void *v9;
  id *v10;
  NSDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [_ATXDeprecatedScoreInterpreterCtx alloc];
  +[ATXScoreDict scoreDictFromDictionary:](ATXScoreDict, "scoreDictFromDictionary:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_ATXDeprecatedScoreInterpreterCtx initWithInputScores:intentType:](v8, "initWithInputScores:intentType:", v9, v7);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_varPrograms;
  v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[_ATXDeprecatedScoreInterpreter _evalVariable:withCtx:](self, "_evalVariable:withCtx:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++), v10, (_QWORD)v18);
      }
      while (v13 != v15);
      v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  objc_msgSend(v10[503], "toDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)evaluateWithInputScoreDict:(id)a3 intentType:(id)a4
{
  id v6;
  id v7;
  _ATXDeprecatedScoreInterpreterCtx *v8;
  NSDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ATXScoreDict *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[_ATXDeprecatedScoreInterpreterCtx initWithInputScores:intentType:]([_ATXDeprecatedScoreInterpreterCtx alloc], "initWithInputScores:intentType:", v6, v7);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_varPrograms;
  v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[_ATXDeprecatedScoreInterpreter _evalVariable:withCtx:](self, "_evalVariable:withCtx:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++), v8, (_QWORD)v16);
      }
      while (v11 != v13);
      v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  v14 = v8->subscores;
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_varPrograms, 0);
}

- (void)_evalVariable:(uint64_t)a3 withCtx:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Could not find instructions to evaluate %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
