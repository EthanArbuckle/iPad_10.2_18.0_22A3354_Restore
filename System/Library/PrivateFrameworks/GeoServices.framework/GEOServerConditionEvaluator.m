@implementation GEOServerConditionEvaluator

+ (BOOL)evaluateCondition:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  const char *v18;
  _BOOL4 v19;
  char v20;
  _BOOL4 v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  _BOOL4 v28;
  NSObject *v29;
  uint32_t v30;
  const char *v31;
  uint64_t v32;
  const __CFString *v33;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  double v41;
  __int16 v42;
  const __CFString *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_25:
    v8 = 0;
    goto LABEL_61;
  }
  v6 = objc_msgSend(v4, "conditionType");
  switch(v6)
  {
    case 0:
      GEOGetStringConditionEvaluatorLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_43;
      *(_WORD *)buf = 0;
      v23 = "-> FAIL, unknown condition type";
      goto LABEL_41;
    case 1:
    case 2:
    case 3:
      objc_msgSend(v5, "subconditions");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!-[NSObject count](v7, "count"))
      {
        GEOGetStringConditionEvaluatorLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_DEBUG, "-> FAIL, no subconditions", buf, 2u);
        }
        v8 = 0;
        goto LABEL_59;
      }
      v8 = v6 != 2;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v35 = v7;
      v7 = v7;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (!v9)
        goto LABEL_53;
      v10 = v9;
      v11 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(v7);
          v13 = objc_msgSend(a1, "evaluateCondition:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
          v14 = v13;
          if (v6 == 2)
          {
            GEOGetStringConditionEvaluatorLog();
            v15 = objc_claimAutoreleasedReturnValue();
            v19 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
            if (!v14)
            {
              if (!v19)
                goto LABEL_22;
              *(_WORD *)buf = 0;
              v17 = v15;
              v18 = "-> CONTINUE evaluating, OR condition failed";
              goto LABEL_17;
            }
            if (v19)
            {
              *(_WORD *)buf = 0;
              v31 = "-> PASS due to successful OR condition";
LABEL_51:
              _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, v31, buf, 2u);
            }
LABEL_52:
            v8 = v6 == 2;

            goto LABEL_53;
          }
          if (v6 == 3)
          {
            GEOGetStringConditionEvaluatorLog();
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
            if (!v14)
            {
              if (!v16)
                goto LABEL_22;
              *(_WORD *)buf = 0;
              v17 = v15;
              v18 = "-> CONTINUE evaluating, NOT condition failed";
LABEL_17:
              _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 2u);
              goto LABEL_22;
            }
            if (v16)
            {
              *(_WORD *)buf = 0;
              v31 = "-> FAIL due to successful NOT";
              goto LABEL_51;
            }
            goto LABEL_52;
          }
          v20 = v8 & v13;
          GEOGetStringConditionEvaluatorLog();
          v15 = objc_claimAutoreleasedReturnValue();
          v21 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
          if ((v20 & 1) == 0)
          {
            if (v21)
            {
              *(_WORD *)buf = 0;
              v31 = "-> FAIL due to failed AND";
              goto LABEL_51;
            }
            goto LABEL_52;
          }
          if (v21)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "-> CONTINUE evaluating, AND condition passed", buf, 2u);
          }
          v8 = 1;
LABEL_22:

        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v10)
          continue;
        break;
      }
LABEL_53:

      if ((unint64_t)-[NSObject count](v7, "count") < 2)
        goto LABEL_60;
      GEOGetStringConditionEvaluatorLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(double *)&v32 = COERCE_DOUBLE(-[NSObject count](v7, "count"));
        v33 = CFSTR("FAIL");
        if (v8)
          v33 = CFSTR("PASS");
        *(_DWORD *)buf = 134218242;
        v41 = *(double *)&v32;
        v42 = 2112;
        v43 = v33;
        _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_DEBUG, "-> EVALUATED %lu subconditions, %@", buf, 0x16u);
      }
      v7 = v35;
LABEL_59:

LABEL_60:
LABEL_61:

      return v8;
    case 4:
      objc_msgSend(v5, "expirationDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v5, "expirationDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "timeIntervalSinceNow");
        v27 = v26;

        GEOGetStringConditionEvaluatorLog();
        v7 = objc_claimAutoreleasedReturnValue();
        v28 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
        if (v27 <= 0.0)
        {
          if (v28)
          {
            *(_DWORD *)buf = 134217984;
            v41 = -v27;
            _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "-> PASS, expired %#.1lfs ago", buf, 0xCu);
          }
          v8 = 1;
          goto LABEL_60;
        }
        if (v28)
        {
          *(_DWORD *)buf = 134217984;
          v41 = v27;
          v23 = "-> FAIL, expires in %#.1lfs";
          v29 = v7;
          v30 = 12;
LABEL_42:
          _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_DEBUG, v23, buf, v30);
        }
      }
      else
      {
        GEOGetStringConditionEvaluatorLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v23 = "-> FAIL due to missing expiration date";
LABEL_41:
          v29 = v7;
          v30 = 2;
          goto LABEL_42;
        }
      }
LABEL_43:
      v8 = 0;
      goto LABEL_60;
    case 5:
      GEOGetStringConditionEvaluatorLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_43;
      *(_WORD *)buf = 0;
      v23 = "-> FAIL, TokenSubstitutionFailureFallback type must manually attempt to evaluate tokens to determine pass or fail";
      goto LABEL_41;
    default:
      goto LABEL_25;
  }
}

+ (id)serverFormattedStringByEvaluatingConditionsInString:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  GEOGetStringConditionEvaluatorLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "formatStrings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v7;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "Will evaluate string beginning \"%@\", (uint8_t *)&v18, 0xCu);

  }
  objc_msgSend(v4, "alternativeString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend(v4, "alternativeString"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "condition"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(a1, "evaluateCondition:", v10),
        v10,
        v9,
        v11))
  {
    objc_msgSend(v4, "alternativeString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "formattedString");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    GEOGetStringConditionEvaluatorLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "formatStrings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "-> Using alternative string beginning \"%@\", (uint8_t *)&v18, 0xCu);

    }
  }
  else
  {
    v13 = v4;
  }

  return v13;
}

@end
