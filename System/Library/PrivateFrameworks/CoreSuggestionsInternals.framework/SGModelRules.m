@implementation SGModelRules

+ (id)_modelsAvailabeForMode:(unint64_t)a3 objective:(unint64_t)a4 language:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id result;
  void *v17;
  void *v18;

  v7 = (void *)MEMORY[0x1E0D19EC8];
  v8 = a5;
  objc_msgSend(v7, "rules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SGDetectedAttributeDissector"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *rulesKeyForObjective(SGModelObjective)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("SGModels.m"), 351, CFSTR("Unknown SGModelObjective = %lu"), a4);

  }
  else
  {
    a4 = (unint64_t)off_1E7DA7E68[a4];
  }
  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *rulesKeyForMode(SGModelMode)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("SGModels.m"), 361, CFSTR("Unknown SGModelMode = %lu"), a3);

    __break(1u);
  }
  else
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", off_1E7DA7EA8[a3]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  return result;
}

+ (BOOL)shouldCollectTrainingDataForObjective:(unint64_t)a3 language:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  unint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_modelsAvailabeForMode:objective:language:", 0, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 && (unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v11 = 134218498;
      v12 = a3;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_fault_impl(&dword_1C3607000, v9, OS_LOG_TYPE_FAULT, "Multiple model names specified to turn on data collection (objective: %lu, language: %@, models: %@.", (uint8_t *)&v11, 0x20u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
  }

  return v8 != 0;
}

+ (void)loadBinaryClassificationModelFromMobileAssetForObjective:(unint64_t)a3 language:(id)a4 withBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  unint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(a1, "_modelsAvailabeForMode:objective:language:", 1, a3, v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)-[NSObject count](v11, "count") < 2)
  {
    if (-[NSObject count](v11, "count") == 1)
    {
      -[NSObject firstObject](v11, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();
      +[SGBinaryClassificationModel modelFromMobileAssetForName:language:](SGBinaryClassificationModel, "modelFromMobileAssetForName:language:", v13, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v9[2](v9, v14);
      }
      else
      {
        sgLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          v16 = 134218498;
          v17 = a3;
          v18 = 2112;
          v19 = v8;
          v20 = 2112;
          v21 = v13;
          _os_log_fault_impl(&dword_1C3607000, v15, OS_LOG_TYPE_FAULT, "Failed to load model (objective: %lu, langauge: %@, name: %@)", (uint8_t *)&v16, 0x20u);
        }

        if (_PASEvaluateLogFaultAndProbCrashCriteria())
LABEL_18:
          abort();
      }

    }
    else
    {
      sgLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v16 = 134218242;
        v17 = a3;
        v18 = 2112;
        v19 = v8;
        _os_log_debug_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEBUG, "No prediction model specified for objective %lu, language: %@", (uint8_t *)&v16, 0x16u);
      }
    }

  }
  else
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v16 = 134218498;
      v17 = a3;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v11;
      _os_log_fault_impl(&dword_1C3607000, v12, OS_LOG_TYPE_FAULT, "More than one prediction model specified for objective %lu, language: %@, models: %@", (uint8_t *)&v16, 0x20u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      goto LABEL_18;
  }

  objc_autoreleasePoolPop(v10);
}

@end
