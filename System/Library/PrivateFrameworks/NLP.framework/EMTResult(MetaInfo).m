@implementation EMTResult(MetaInfo)

- (double)score
{
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;

  objc_msgSend(a1, "metaInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "dataUsingEncoding:", 4);
    v3 = objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v23);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v23;
    if (v4)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("norm_cost"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = v6;
          -[NSObject doubleValue](v7, "doubleValue");
          v9 = v8 * -0.434294482;
        }
        else
        {
          _nlpDefaultLog();
          v7 = objc_claimAutoreleasedReturnValue();
          v9 = -15.6535598;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            -[EMTResult(MetaInfo) score].cold.4((uint64_t)v6, v7, v16, v17, v18, v19, v20, v21);
        }
      }
      else
      {
        _nlpDefaultLog();
        v7 = objc_claimAutoreleasedReturnValue();
        v9 = -15.6535598;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[EMTResult(MetaInfo) score].cold.3((uint64_t)v4, v7, v10, v11, v12, v13, v14, v15);
      }

    }
    else
    {
      _nlpDefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      v9 = -15.6535598;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[EMTResult(MetaInfo) score].cold.2((uint64_t)v3, (uint64_t)v5, v6);
    }

  }
  else
  {
    _nlpDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v9 = -15.6535598;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[EMTResult(MetaInfo) score].cold.1(v3);
  }

  return v9;
}

- (void)score
{
  OUTLINED_FUNCTION_0_0(&dword_1A1802000, a2, a3, "Failed to get seq2seq score, normCost is not of string class type: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
