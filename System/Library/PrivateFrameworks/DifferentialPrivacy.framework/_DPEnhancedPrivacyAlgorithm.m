@implementation _DPEnhancedPrivacyAlgorithm

+ (id)allowedDataTypesForKey:(id)a3 withMetadata:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AllowedDataTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "namespaceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[_DPNamespaceParameters initParametersForNamespace:](_DPNamespaceParameters, "initParametersForNamespace:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject allowedDataTypes](v10, "allowedDataTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && objc_msgSend(v11, "count"))
    {
      if (!objc_msgSend(v7, "count"))
      {
        +[_DPLog framework](_DPLog, "framework");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D3FAA000, v20, OS_LOG_TYPE_INFO, "No allowed data types passed; default is selected",
            buf,
            2u);
        }

        v17 = v12;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v7, "isSubsetOfSet:", v13);

      if (v14)
      {
        v15 = (void *)MEMORY[0x1E0C99D20];
        objc_msgSend(v7, "allObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "arrayWithArray:", v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
        goto LABEL_13;
      }
      +[_DPLog framework](_DPLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allObjects");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR(", "));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v28 = v21;
        v29 = 2112;
        v30 = v22;
        v31 = 2112;
        v32 = v23;
        v33 = 2112;
        v34 = v9;
        v35 = 2112;
        v36 = v6;
        _os_log_error_impl(&dword_1D3FAA000, v18, OS_LOG_TYPE_ERROR, "%@: Recieved data types [%@] are not a subset of approved data types [%@] for namespace %@ with key %@", buf, 0x34u);

LABEL_20:
      }
    }
    else
    {
      +[_DPLog framework](_DPLog, "framework");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v28 = v21;
        v29 = 2112;
        v30 = v9;
        v31 = 2112;
        v32 = v6;
        _os_log_error_impl(&dword_1D3FAA000, v18, OS_LOG_TYPE_ERROR, "%@: No allowed list of data types found for namespace %@ with key %@", buf, 0x20u);
        goto LABEL_20;
      }
    }

    v17 = 0;
    goto LABEL_9;
  }
  +[_DPLog framework](_DPLog, "framework");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertiesName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = v24;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v25;
    _os_log_error_impl(&dword_1D3FAA000, v10, OS_LOG_TYPE_ERROR, "%@: No namespace name found for key: %@ with property name: %@", buf, 0x20u);

  }
  v17 = 0;
LABEL_13:

  return v17;
}

+ (BOOL)isEnhancedPrivacyAlgorithm:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint8_t v12[16];

  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("EnhancedDifferentialPrivacyParameters"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useEnhancedDifferentialPrivacyAlgorithm"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;

      if (!v6)
      {
        +[_DPLog framework](_DPLog, "framework");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          +[_DPEnhancedPrivacyAlgorithm isEnhancedPrivacyAlgorithm:].cold.1(a2, v10);
        goto LABEL_11;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("useEnhancedDifferentialPrivacyAlgorithm"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      if (v9)
      {
        +[_DPLog framework](_DPLog, "framework");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1D3FAA000, v10, OS_LOG_TYPE_INFO, "Enhanced differential privacy budget control is set", v12, 2u);
        }
LABEL_11:

        goto LABEL_12;
      }
    }
    v7 = 0;
LABEL_12:

    return v7;
  }
  return 0;
}

+ (BOOL)isMetadataValid:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v25[0] = CFSTR("EnhancedDifferentialPrivacyParameters");
    v25[1] = CFSTR("AllowedDataTypes");
    v25[2] = CFSTR("DonationID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v3, "objectForKeyedSubscript:", v9, (_QWORD)v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
          {
            +[_DPLog framework](_DPLog, "framework");
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              +[_DPEnhancedPrivacyAlgorithm isMetadataValid:].cold.1(v9, v12, v13, v14, v15, v16, v17, v18);

            v11 = 0;
            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v6)
          continue;
        break;
      }
    }
    v11 = 1;
LABEL_14:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)verifyEnhancedDPParamsForKey:(id)a3 withMetadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  float v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  NSObject *v37;
  id v40;
  id v41;
  NSObject *obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  double v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  double v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[7];

  v59[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EnhancedDifferentialPrivacyParameters"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = CFSTR("localDifferentialPrivacyBudget");
  v59[1] = CFSTR("cohortAggregateDifferentialPrivacyBudget");
  v59[2] = CFSTR("minCohortSize");
  v59[3] = CFSTR("useEnhancedDifferentialPrivacyAlgorithm");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v48;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v48 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          +[_DPLog framework](_DPLog, "framework");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            +[_DPEnhancedPrivacyAlgorithm verifyEnhancedDPParamsForKey:withMetadata:].cold.1((uint64_t)v6, v20, v30, v31, v32, v33, v34, v35);
          v29 = 0;
          v15 = v9;
          goto LABEL_29;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
      if (v11)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "allowedDataTypesForKey:withMetadata:", v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EnhancedDifferentialPrivacyParameters"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("localDifferentialPrivacyBudget"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v18;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v20 = v15;
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    if (v21)
    {
      v22 = v21;
      v40 = v7;
      v41 = v6;
      v23 = 0;
      v24 = *(_QWORD *)v44;
      obj = v20;
      while (2)
      {
        v25 = 0;
        v26 = v23;
        do
        {
          if (*(_QWORD *)v44 != v24)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v25);
          +[_DPDataTypeParameters initParametersForDataType:](_DPDataTypeParameters, "initParametersForDataType:", v27);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "localPrivacyBudget");
          v29 = v19 <= v28;
          if (v19 > v28)
          {
            v36 = v28;
            +[_DPLog framework](_DPLog, "framework");
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218498;
              v52 = v19;
              v53 = 2112;
              v54 = v27;
              v55 = 2048;
              v56 = v36;
              _os_log_error_impl(&dword_1D3FAA000, v37, OS_LOG_TYPE_ERROR, "Query local privacy budget %f is greater than that of %@ data type, %f.", buf, 0x20u);
            }

            v20 = obj;
            goto LABEL_26;
          }
          ++v25;
          v26 = v23;
        }
        while (v22 != v25);
        v20 = obj;
        v22 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
        if (v22)
          continue;
        break;
      }
LABEL_26:

      v15 = v20;
      v7 = v40;
      v6 = v41;
    }
    else
    {
      v29 = 1;
      v15 = v20;
    }
LABEL_29:

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (id)findMultipleDonationForKey:(id)a3 inRecords:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v5 = a4;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "metadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DonationID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v21, v13);
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = v21;
        }
        v15 = v14;
        objc_msgSend(v6, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v17 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v15);

        }
        objc_msgSend(v6, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v11);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  return v6;
}

+ (void)isEnhancedPrivacyAlgorithm:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = CFSTR("useEnhancedDifferentialPrivacyAlgorithm");
  _os_log_error_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_ERROR, "%@: Malformed enhanced differential privacy parameters; no value found for the key; %@",
    (uint8_t *)&v4,
    0x16u);

}

+ (void)isMetadataValid:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Malformed enhanced differential privacy metadata; %@ not found.",
    a5,
    a6,
    a7,
    a8,
    2u);
}

+ (void)verifyEnhancedDPParamsForKey:(uint64_t)a3 withMetadata:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Malformed enhanced differential privacy parameters. %@ not found.", a5, a6, a7, a8, 2u);
}

@end
