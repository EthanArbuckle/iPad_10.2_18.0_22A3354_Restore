@implementation NTHeadlineFromFCHeadline

id __NTHeadlineFromFCHeadline_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "remoteURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48))
  {
    if (v5 && (v6 = *(void **)(a1 + 32)) != 0 && *(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v5, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NTAssetFileURLWithFile(v8, *(void **)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v4);

        NTSharedLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = *(_QWORD *)(a1 + 40);
          v15 = 138412802;
          v16 = v4;
          v17 = 2112;
          v18 = v5;
          v19 = 2112;
          v20 = v11;
          _os_log_impl(&dword_2197E6000, v10, OS_LOG_TYPE_INFO, "Copying asset with remoteURL: %@ and assetInternalFilePath: %@ to assetsDirectoryFileURL: %@", (uint8_t *)&v15, 0x20u);
        }

        goto LABEL_15;
      }
    }
    else
    {
      NTSharedLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl(&dword_2197E6000, v12, OS_LOG_TYPE_INFO, "Failed to copy asset with remoteURL: %@, missing internalFilePath", (uint8_t *)&v15, 0xCu);
      }

    }
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v5, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v4);
LABEL_15:

    }
  }

  return v4;
}

void __NTHeadlineFromFCHeadline_block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v5 = *(unsigned int *)(a1 + 40);
  v6 = a2;
  objc_msgSend(a3, "cohortWithPreferredType:", v5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "impressions");
  v8 = v7;
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = 0.0;
  if (v8 != 0.0)
  {
    objc_msgSend(v13, "clicks", 0.0);
    v10 = v11 / v8;
  }
  objc_msgSend(v9, "numberWithDouble:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v6);

}

@end
