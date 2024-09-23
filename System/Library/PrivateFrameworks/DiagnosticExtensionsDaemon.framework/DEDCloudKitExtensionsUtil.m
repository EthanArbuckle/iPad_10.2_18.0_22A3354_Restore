@implementation DEDCloudKitExtensionsUtil

+ (id)getCompletedExtensionFromAllExtensions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "stringValue", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)getVerifiedExtensionDirectoriesFromCompletedExtensions:(id)a3 forSession:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v21 = v6;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "directoryForBugSessionIdentifier:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)v9;
  objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    v15 = *MEMORY[0x24BE2F340];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "containsObject:", v18)
          && (objc_msgSend(MEMORY[0x24BE2C9A0], "isValidDirectory:", v17) & 1) != 0)
        {
          objc_msgSend(v22, "setValue:forKey:", v17, v18);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BE2F380], "createLoggingEventWith:postfix:", v15, v18);
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  return v22;
}

+ (id)getOutputDirectories:(id)a3 withProcessingMap:(id)a4
{
  return (id)objc_msgSend(a1, "getOutputDirectories:withProcessingMap:progressHandler:", a3, a4, 0);
}

+ (id)getOutputDirectories:(id)a3 withProcessingMap:(id)a4 progressHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  os_log_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id obj;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  NSObject *v36;
  id v37;
  id v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD v41[4];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v29 = a4;
  v26 = a5;
  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = os_log_create((const char *)objc_msgSend(v7, "loggingSubsystem"), "ded-cloudkit-finisher");

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v27;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16, v24, v25);
    if (v30)
    {
      v8 = 0;
      v28 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v47 != v28)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(obj, "objectForKey:", v10);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKey:", v10);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKey:", CFSTR("package"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("parent-directory")))
          {
            if (objc_msgSend(MEMORY[0x24BE2C9A0], "isValidDirectory:", v33))
              v8 += objc_msgSend(MEMORY[0x24BE2C978], "directorySizeOf:", v33);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", v33);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v43;
              do
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v43 != v14)
                    objc_enumerationMutation(v12);
                  v16 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
                  if (objc_msgSend(MEMORY[0x24BE2C9A0], "isValidDirectory:", v16))
                    v8 += objc_msgSend(MEMORY[0x24BE2C978], "directorySizeOf:", v16);
                }
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
              }
              while (v13);
            }

          }
        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v30);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __84__DEDCloudKitExtensionsUtil_getOutputDirectories_withProcessingMap_progressHandler___block_invoke;
  v34[3] = &unk_24D1E6A90;
  v17 = v29;
  v35 = v17;
  v18 = v24;
  v36 = v18;
  v19 = v26;
  v38 = v19;
  v39 = v41;
  v40 = v8;
  v20 = v25;
  v37 = v20;
  objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v34);
  v21 = v37;
  v22 = v20;

  _Block_object_dispose(v41, 8);
  return v22;
}

void __84__DEDCloudKitExtensionsUtil_getOutputDirectories_withProcessingMap_progressHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id obj;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[4];
  uint64_t v51;
  _BYTE buf[24];
  uint64_t v53;
  _BYTE v54[128];
  _QWORD v55[4];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v35 = a3;
  v37 = v5;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKey:", CFSTR("package"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKey:", CFSTR("compression"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v30, "isEqualToString:", CFSTR("flat-directories"));
  if ((v39 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", v35);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v55[0] = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v47;
    v34 = *MEMORY[0x24BE2F338];
    v33 = *MEMORY[0x24BE2F330];
    v32 = *MEMORY[0x24BE2F328];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        v11 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v10;
          _os_log_impl(&dword_21469E000, v11, OS_LOG_TYPE_DEFAULT, "Processing file/directory (%{public}@)", buf, 0xCu);
        }
        if (v39 && (objc_msgSend(MEMORY[0x24BE2C9A0], "isValidDirectory:", v10) & 1) == 0)
        {
          v20 = *(NSObject **)(a1 + 40);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v10;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v37;
            _os_log_impl(&dword_21469E000, v20, OS_LOG_TYPE_DEFAULT, "Skipping file compression when flatterned directory requested (%{public}@) (%@)", buf, 0x16u);
          }
          goto LABEL_21;
        }
        if (v40 && (objc_msgSend(v40, "BOOLValue") & 1) == 0)
        {
          v21 = *(NSObject **)(a1 + 40);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v10;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v37;
            _os_log_impl(&dword_21469E000, v21, OS_LOG_TYPE_DEFAULT, "Skipping file/directory compression when not requested (%{public}@) (%@)", buf, 0x16u);
          }
LABEL_21:
          objc_msgSend(v38, "addObject:", v10);
          continue;
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v53 = 0;
        objc_msgSend(v35, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%@"), v37, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE2F380], "createLoggingEventWith:postfix:", v34, v37);
        v14 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v50 = 138543362;
          v51 = v10;
          _os_log_impl(&dword_21469E000, v14, OS_LOG_TYPE_DEFAULT, "Compressing folder... (%{public}@)", v50, 0xCu);
        }
        v15 = *(void **)(a1 + 56);
        if (v15)
        {
          v41[0] = MEMORY[0x24BDAC760];
          v41[1] = 3221225472;
          v41[2] = __84__DEDCloudKitExtensionsUtil_getOutputDirectories_withProcessingMap_progressHandler___block_invoke_26;
          v41[3] = &unk_24D1E6A68;
          v43 = buf;
          v16 = v15;
          v17 = *(_QWORD *)(a1 + 64);
          v18 = *(_QWORD *)(a1 + 72);
          v42 = v16;
          v44 = v17;
          v45 = v18;
          v19 = (void *)MEMORY[0x2199D4184](v41);

        }
        else
        {
          v19 = 0;
        }
        if (objc_msgSend(MEMORY[0x24BE2C9A0], "isValidDirectory:", v10))
          objc_msgSend(MEMORY[0x24BE2C978], "archiveDirectoryAt:deleteOriginal:progressHandler:", v10, 1, v19);
        else
          objc_msgSend(MEMORY[0x24BE2C978], "archiveFile:deleteOriginal:progressHandler:", v10, 1, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
        v23 = *(NSObject **)(a1 + 40);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v50 = 0;
          _os_log_impl(&dword_21469E000, v23, OS_LOG_TYPE_DEFAULT, "Finished compressing", v50, 2u);
        }
        if (v22)
        {
          objc_msgSend(v38, "addObject:", v22);
          objc_msgSend(MEMORY[0x24BE2F380], "createLoggingEventWith:postfix:", v33, v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BE2F380], "createLoggingEventWith:postfix:", v32, v13);
          v24 = *(NSObject **)(a1 + 40);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v50 = 138543362;
            v51 = v10;
            _os_log_error_impl(&dword_21469E000, v24, OS_LOG_TYPE_ERROR, "Error compressing: %{public}@", v50, 0xCu);
          }
        }

        _Block_object_dispose(buf, 8);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v25 = objc_msgSend(v38, "count");
  v26 = *(NSObject **)(a1 + 40);
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      v28 = v26;
      v29 = objc_msgSend(v38, "count");
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v37;
      _os_log_impl(&dword_21469E000, v28, OS_LOG_TYPE_DEFAULT, "Adding (%lu) files to %@ for upload", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "setValue:forKey:", v38, v37);
  }
  else if (v27)
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v37;
    _os_log_impl(&dword_21469E000, v26, OS_LOG_TYPE_DEFAULT, "No files to %@ for upload", buf, 0xCu);
  }

}

uint64_t __84__DEDCloudKitExtensionsUtil_getOutputDirectories_withProcessingMap_progressHandler___block_invoke_26(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), a1[7]);
}

+ (void)updateELSSnapshotStatus:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE2F388], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setStatus:", a3);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BE2F2F8], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "refreshKeyPaths:", v5);

}

+ (id)getAllFilesInSessionDirectoryForSessionID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "directoryForBugSessionIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(MEMORY[0x24BE2C9A0], "isValidDirectory:", v12) & 1) == 0)
          objc_msgSend(v4, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v4;
}

+ (id)copyFiles:(id)a3 toDirectory:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x24BE2C9A0], "copyFile:toDir:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), v6);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v6;
}

@end
