@implementation DESDecimalEncoder

- (id)encodeDecimalData:(id)a3 forKey:(id)a4 withSchemas:(id)a5 errorOut:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  float v28;
  float v29;
  double v30;
  float v31;
  void *v32;
  void *v33;
  float v34;
  void *v35;
  float v36;
  double v37;
  void *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  NSObject *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  NSObject *v50;
  id v51;
  void *v53;
  id v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v16)
  {
    v17 = v16;
    v18 = sqrtf((float)v13);
    v19 = *(_QWORD *)v57;
    v53 = v15;
    v54 = v10;
    v51 = v9;
    v55 = v14;
LABEL_3:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v57 != v19)
        objc_enumerationMutation(v15);
      v21 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v20);
      objc_msgSend(v10, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
        break;
      v23 = v22;
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("upperBound"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("lowerBound"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24 || (objc_msgSend(v24, "floatValue"), objc_msgSend(v24, "floatValue"), fabsf(v26) == INFINITY))
      {
        v9 = v51;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key=%@, missing or malformed '%@' in encoding schema for data '%@', must be a real or integer number"), v51, CFSTR("upperBound"), v21);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v33;
          goto LABEL_41;
        }
LABEL_22:

LABEL_23:
        if (a6)
        {
          objc_msgSend((id)objc_opt_class(), "constructErrorWith:", v33);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_30:

        v10 = v54;
        v14 = v55;
LABEL_31:

        v40 = 0;
        goto LABEL_32;
      }
      if (!v25 || (objc_msgSend(v25, "floatValue"), objc_msgSend(v25, "floatValue"), fabsf(v27) == INFINITY))
      {
        v9 = v51;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key=%@, missing or malformed '%@' in encoding schema for data '%@', must be a real or integer number"), v51, CFSTR("lowerBound"), v21);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v33;
LABEL_41:
          _os_log_error_impl(&dword_1B96E5000, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
        goto LABEL_22;
      }
      objc_msgSend(v25, "floatValue");
      v29 = v28;
      objc_msgSend(v24, "floatValue");
      v31 = *(float *)&v30;
      if (v29 >= *(float *)&v30)
      {
        v46 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v48 = v29;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v51;
        objc_msgSend(v46, "stringWithFormat:", CFSTR("key=%@, malformed encoding schema for data '%@', '%@'=%@ must be higher than '%@'=%@"), v51, v21, CFSTR("upperBound"), v47, CFSTR("lowerBound"), v49);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v33;
          _os_log_error_impl(&dword_1B96E5000, v50, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        v15 = v53;
        goto LABEL_23;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", v21);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (!v32 || (objc_msgSend(v32, "floatValue"), objc_msgSend(v33, "floatValue"), fabsf(v34) == INFINITY))
      {
        v9 = v51;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key=%@, malformed data for '%@', must be a valid real number"), v51, v21);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v42;
          _os_log_error_impl(&dword_1B96E5000, v43, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        if (a6)
        {
          objc_msgSend((id)objc_opt_class(), "constructErrorWith:", v42);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }

        v15 = v53;
        goto LABEL_30;
      }
      v35 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v33, "floatValue");
      *(float *)&v37 = (float)((float)((float)((float)(v36 - v29) + (float)(v36 - v29)) / (float)(v31 - v29)) + -1.0)
                     / v18;
      objc_msgSend(v35, "numberWithFloat:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v61 = v51;
        v62 = 2112;
        v63 = v21;
        v64 = 2112;
        v65 = v38;
        _os_log_debug_impl(&dword_1B96E5000, v39, OS_LOG_TYPE_DEBUG, "key=%@, encoded metric '%@' to value '%@'", buf, 0x20u);
      }

      objc_msgSend(v55, "addObject:", v38);
      ++v20;
      v15 = v53;
      v10 = v54;
      if (v17 == v20)
      {
        v17 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        v9 = v51;
        v14 = v55;
        if (v17)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    v9 = v51;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key=%@, data element '%@' has no schema"), v51, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      -[DESSparsification reportErrorWithErrorStr:error:].cold.1((uint64_t)v23, v45);

    v14 = v55;
    if (a6)
    {
      objc_msgSend((id)objc_opt_class(), "constructErrorWith:", v23);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_31;
  }
LABEL_18:

  v40 = v14;
LABEL_32:

  return v40;
}

uint64_t __67__DESDecimalEncoder_encodeDecimalData_forKey_withSchemas_errorOut___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 64);
}

+ (id)constructErrorWith:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2013, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
