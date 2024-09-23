@implementation BRCloudDocsCanBeEnabledForCurrentUser

void __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentHomeDir");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v2 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v0, "br_realpath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  v5 = v4;
  brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledStateForURL", 1840);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_4();

  if (!v5)
  {
    brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledStateForURL", 1843);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_2();
    v11 = 0;
    goto LABEL_19;
  }
  v8 = *MEMORY[0x1E0C99D08];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *MEMORY[0x1E0C99D08]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v5, "resourceValuesForKeys:error:", v9, &v29);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v29;
  if (!v10)
  {
    brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledStateForURL", 1855);
    v10 = objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      objc_msgSend(v5, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v31 = v23;
      v32 = 2112;
      v33 = v9;
      v34 = 2112;
      v35 = v11;
      v36 = 2112;
      v37 = v10;
      _os_log_error_impl(&dword_19CBF0000, v18, (os_log_type_t)0x90u, "[ERROR] failed to get %@ resource values for keys %@: %@%@", buf, 0x2Au);

    }
LABEL_19:
    v15 = 0;
    v12 = 0;
    v17 = -1;
    goto LABEL_24;
  }
  -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledStateForURL", 1868);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_3();

  }
  v28 = 0;
  v13 = *MEMORY[0x1E0C99C00];
  v27 = 0;
  v14 = objc_msgSend(v12, "getResourceValue:forKey:error:", &v28, v13, &v27);
  v15 = v28;
  v16 = v27;

  if ((v14 & 1) != 0)
  {
    if (objc_msgSend(v15, "BOOLValue"))
      v17 = 1;
    else
      v17 = -1;
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledStateForURL", 1872);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      objc_msgSend(v12, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v24;
      v32 = 2112;
      v33 = v16;
      v34 = 2112;
      v35 = v19;
      _os_log_error_impl(&dword_19CBF0000, v20, (os_log_type_t)0x90u, "[ERROR] can't find if volume %@ is local: %@%@", buf, 0x20u);

    }
    v17 = -1;
  }
  v11 = v16;
LABEL_24:

  brc_bread_crumbs((uint64_t)"BRCloudDocsCanBeEnabledStateForURL", 1882);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_1((uint64_t)v21, v17, v22);

  BRCloudDocsCanBeEnabledForCurrentUser_canBeEnabled = v17;
}

void __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, a2, a3, "[DEBUG] returning %ld%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] no home%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: volumeURL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __BRCloudDocsCanBeEnabledForCurrentUser_block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] getting CloudDocsCanBeEnabledState for url: %@%@");
  OUTLINED_FUNCTION_1();
}

@end
