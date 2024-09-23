@implementation DESDodMLTaskSchedulingPolicy

- (DESDodMLTaskSchedulingPolicy)init
{
  return -[DESDodMLTaskSchedulingPolicy initWithPolicyDict:](self, "initWithPolicyDict:", 0);
}

- (DESDodMLTaskSchedulingPolicy)initWithAssetURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  DESDodMLTaskSchedulingPolicy *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 8, &v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;
    if (v7)
    {
      v19 = v8;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v19;

      if (v9)
      {
        self = -[DESDodMLTaskSchedulingPolicy initWithPolicyDict:](self, "initWithPolicyDict:", v9);
        v8 = v10;
        v11 = self;
      }
      else
      {
        if (a4)
        {
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v21[0] = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fail to decode JSON object from URL = (%@)"), v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21[1] = *MEMORY[0x1E0CB3388];
          v22[0] = v16;
          v22[1] = v10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 5005, v17);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        v11 = 0;
        v8 = v10;
      }
    }
    else
    {
      if (!a4)
      {
        v11 = 0;
        goto LABEL_13;
      }
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v23[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fail to read URL = (%@)"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = *MEMORY[0x1E0CB3388];
      v24[0] = v9;
      v24[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 5005, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v11 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  if (!a4)
  {
    v11 = 0;
    goto LABEL_15;
  }
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v25 = *MEMORY[0x1E0CB2D50];
  v26[0] = CFSTR("Nil policy URL");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 5002, v8);
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_15:
  return v11;
}

- (DESDodMLTaskSchedulingPolicy)initWithPolicyDict:(id)a3
{
  id v4;
  DESDodMLTaskSchedulingPolicy *v5;
  DESDodMLTaskSchedulingPolicy *v6;
  uint64_t v7;
  NSDictionary *recipes;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  DESDodMLTaskSchedulingPolicy *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  double v40;
  double v41;
  NSNumber *v42;
  DESDodMLTaskSchedulingPolicy *v43;
  NSObject *p_super;
  DESDodMLTaskSchedulingPolicy *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  DESDodMLTaskSchedulingPolicy *v58;
  NSObject *v60;
  id v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  uint8_t buf[4];
  NSObject *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)DESDodMLTaskSchedulingPolicy;
  v5 = -[DESDodMLTaskSchedulingPolicy init](&v67, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_recipeCountLimit = 1;
    *(_OWORD *)&v5->_timeLimit = xmmword_1B970E210;
    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recipes"));
      v7 = objc_claimAutoreleasedReturnValue();
      recipes = v6->_recipes;
      v6->_recipes = (NSDictionary *)v7;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("evaluation_limits"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("time_seconds"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "doubleValue");
          v12 = v11;
          v13 = 0x4072C00000000000;
          if (v12 < 300.0)
            objc_msgSend(v10, "doubleValue");
          *(_QWORD *)&v6->_timeLimit = v13;
        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("recipe_count"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6->_recipeCountLimit = objc_msgSend(v14, "unsignedIntegerValue");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("period_in_seconds"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (allowCustomWakeUpPeriod())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[DESLogging coreChannel](DESLogging, "coreChannel");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              -[DESDodMLTaskSchedulingPolicy initWithPolicyDict:].cold.3(v15, v16);

            v6->_period = (double)(unint64_t)objc_msgSend(v15, "unsignedIntegerValue");
          }
        }

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("return_routes"));
      v17 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v62 = v9;
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v18 = v17;
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
        if (v19)
        {
          v20 = v19;
          v60 = v17;
          v61 = v4;
          v21 = *(_QWORD *)v64;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v64 != v21)
                objc_enumerationMutation(v18);
              v23 = *(NSObject **)(*((_QWORD *)&v63 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (-[NSObject isEqualToString:](v23, "isEqualToString:", CFSTR("parsec")))
                {
                  +[DESLogging coreChannel](DESLogging, "coreChannel");
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B96E5000, v24, OS_LOG_TYPE_INFO, "Enabling Parsec return route", buf, 2u);
                  }

                  v6->_parsecReturnRouteEnabled = 1;
                }
                else if (-[NSObject isEqualToString:](v23, "isEqualToString:", CFSTR("origin")))
                {
                  +[DESLogging coreChannel](DESLogging, "coreChannel");
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B96E5000, v26, OS_LOG_TYPE_INFO, "Enabling Origin return route", buf, 2u);
                  }

                  v6->_originReturnRouteEnabled = 1;
                }
                else if (-[NSObject isEqualToString:](v23, "isEqualToString:", CFSTR("dedisco")))
                {
                  +[DESLogging coreChannel](DESLogging, "coreChannel");
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B96E5000, v27, OS_LOG_TYPE_INFO, "Enabling Dedisco return route", buf, 2u);
                  }

                  v6->_dediscoReturnRouteEnabled = 1;
                }
              }
              else
              {
                +[DESLogging coreChannel](DESLogging, "coreChannel");
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v69 = v23;
                  _os_log_impl(&dword_1B96E5000, v25, OS_LOG_TYPE_INFO, "Ignoring invalid return route: %@", buf, 0xCu);
                }

              }
            }
            v20 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
          }
          while (v20);
          v4 = v61;
          v9 = v62;
          v17 = v60;
        }
      }
      else
      {
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v17;
          _os_log_impl(&dword_1B96E5000, v18, OS_LOG_TYPE_INFO, "Ignoring invalid or blank return routes: %@", buf, 0xCu);
        }
      }

      if (!v6->_originReturnRouteEnabled && !v6->_parsecReturnRouteEnabled && !v6->_dediscoReturnRouteEnabled)
        v6->_originReturnRouteEnabled = 1;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("host"));
      v29 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@"), v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "URLWithString:", v31);
        v32 = objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v69 = v32;
            _os_log_impl(&dword_1B96E5000, v33, OS_LOG_TYPE_INFO, "Setting _postback base URL to %@", buf, 0xCu);
          }

          objc_storeStrong((id *)&v6->_postbackBaseURL, v32);
        }
      }
      else
      {
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v29;
          _os_log_impl(&dword_1B96E5000, v32, OS_LOG_TYPE_INFO, "Ignoring invalid policy host: %@", buf, 0xCu);
        }
      }

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("telemetry"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v9;
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("href"));
        v36 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("sampling_rate"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v38 = v17;
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v36);
          v39 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)&v6->_telemetryURL, v39);
          if (v37 && (objc_msgSend(v37, "doubleValue"), v40 <= 1.0) && (objc_msgSend(v37, "doubleValue"), v41 > 0.0))
          {
            v42 = v37;
            v43 = v6;
            p_super = &v6->_telemetrySamplingRate->super.super;
            v45 = v43;
            v43->_telemetrySamplingRate = v42;
          }
          else
          {
            v45 = v6;
            +[DESLogging coreChannel](DESLogging, "coreChannel");
            p_super = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
              -[DESDodMLTaskSchedulingPolicy initWithPolicyDict:].cold.1((uint64_t)v34, p_super, v52, v53, v54, v55, v56, v57);
          }

          v6 = v45;
          v17 = v38;
        }
        else
        {
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            -[DESDodMLTaskSchedulingPolicy initWithPolicyDict:].cold.2((uint64_t)v34, v39, v46, v47, v48, v49, v50, v51);
        }

        v9 = v35;
      }
      else
      {
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B96E5000, v36, OS_LOG_TYPE_INFO, "Skipping telemetry because none was specified in the policy", buf, 2u);
        }
      }

      v58 = v6;
    }
    else
    {
      v28 = v5;
    }
  }

  return v6;
}

- (NSArray)allRecipeIDs
{
  return -[NSDictionary allKeys](self->_recipes, "allKeys");
}

- (id)_policyForRecipeID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_recipes, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a4 = v7;
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid policy for recipeID=%@, policy=%@"), v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1513, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (id)samplingRateForRecipeID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[DESDodMLTaskSchedulingPolicy _policyForRecipeID:error:](self, "_policyForRecipeID:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sampling_rate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      objc_msgSend(v10, "doubleValue");
      if (v11 <= 1.0 && v11 > 0.0)
      {
        v10 = v10;
        a4 = (id *)v10;
LABEL_12:

        goto LABEL_13;
      }
      if (!a4)
        goto LABEL_12;
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid sampling rate=%f, recipeID=%@"), *(_QWORD *)&v11, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1513, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!a4)
      {
LABEL_13:

        goto LABEL_14;
      }
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid sampling rate in policy for recipeID: %@"), v6);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v20[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1513, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    a4 = 0;
    goto LABEL_12;
  }
  a4 = 0;
LABEL_14:

  return a4;
}

- (id)predicateForRecipeID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[DESDodMLTaskSchedulingPolicy _policyForRecipeID:error:](self, "_policyForRecipeID:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("predicate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      a4 = v9;
    }
    else if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid predicate in recipeID=%@"), v6, *MEMORY[0x1E0CB2D68]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1513, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }

  }
  else
  {
    a4 = 0;
  }

  return a4;
}

- (unint64_t)recipeCountLimit
{
  return self->_recipeCountLimit;
}

- (double)timeLimit
{
  return self->_timeLimit;
}

- (double)period
{
  return self->_period;
}

- (BOOL)originReturnRouteEnabled
{
  return self->_originReturnRouteEnabled;
}

- (BOOL)parsecReturnRouteEnabled
{
  return self->_parsecReturnRouteEnabled;
}

- (BOOL)dediscoReturnRouteEnabled
{
  return self->_dediscoReturnRouteEnabled;
}

- (NSURL)postbackBaseURL
{
  return self->_postbackBaseURL;
}

- (NSURL)telemetryURL
{
  return self->_telemetryURL;
}

- (NSNumber)telemetrySamplingRate
{
  return self->_telemetrySamplingRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetrySamplingRate, 0);
  objc_storeStrong((id *)&self->_telemetryURL, 0);
  objc_storeStrong((id *)&self->_postbackBaseURL, 0);
  objc_storeStrong((id *)&self->_recipes, 0);
}

- (void)initWithPolicyDict:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B96E5000, a2, a3, "Skipping never-valid telemetry %@", a5, a6, a7, a8, 2u);
}

- (void)initWithPolicyDict:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B96E5000, a2, a3, "Ignoring malformed telemetry %@", a5, a6, a7, a8, 2u);
}

- (void)initWithPolicyDict:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "unsignedIntegerValue");
  _os_log_debug_impl(&dword_1B96E5000, a2, OS_LOG_TYPE_DEBUG, "Custom period = %lu in policy.", (uint8_t *)&v3, 0xCu);
}

@end
