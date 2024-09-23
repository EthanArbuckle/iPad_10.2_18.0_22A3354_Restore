@implementation DEDAttachmentHandler

- (DEDAttachmentHandler)init
{
  DEDAttachmentHandler *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DEDAttachmentHandler;
  v2 = -[DEDAttachmentHandler init](&v5, sel_init);
  if (v2)
  {
    +[DEDUtils sharedLog](DEDUtils, "sharedLog");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDAttachmentHandler setLog:](v2, "setLog:", v3);

    -[DEDAttachmentHandler setCompressOnAttach:](v2, "setCompressOnAttach:", 0);
  }
  return v2;
}

- (id)processAttachments:(id)a3 withSessionIdentifier:(id)a4 extension:(id)a5 shouldAddClassBDataProtection:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[DEDAttachmentHandler dedDirectory](self, "dedDirectory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDAttachmentHandler _processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:rootDir:](self, "_processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:rootDir:", v12, v11, v10, v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_processAttachments:(id)a3 withSessionIdentifier:(id)a4 extension:(id)a5 rootDir:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[DEDAttachmentHandler dedDirectory](self, "dedDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDAttachmentHandler _processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:rootDir:](self, "_processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:rootDir:", v11, v10, v9, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_processAttachments:(id)a3 withSessionIdentifier:(id)a4 extension:(id)a5 shouldAddClassBDataProtection:(BOOL)a6 rootDir:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v55;
  _BOOL4 v56;
  id v57;
  id v58;
  id v59;
  id v60;
  NSObject *v61;
  id obj;
  id obja;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE v76[128];
  char v77[16];
  uint8_t buf[4];
  NSObject *v79;
  __int16 v80;
  id v81;
  _BYTE v82[128];
  uint64_t v83;

  v8 = a6;
  v83 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v13)
  {
    v56 = v8;
    v58 = v14;
    v59 = v13;
    v57 = v15;
    -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:](self, "directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:", v13, v14, v15, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v60 = v12;
    obj = v12;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v71;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v71 != v19)
            objc_enumerationMutation(obj);
          v21 = *(NSObject **)(*((_QWORD *)&v70 + 1) + 8 * v20);
          v69 = 0;
          -[NSObject sandboxExtensionHandleWithErrorOut:](v21, "sandboxExtensionHandleWithErrorOut:", &v69);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v69;
          if (v23)
          {
            -[DEDAttachmentHandler log](self, "log");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v79 = v21;
              v80 = 2114;
              v81 = v23;
              _os_log_error_impl(&dword_21469E000, v24, OS_LOG_TYPE_ERROR, "Failed to get sandboxing handle on item [%{public}@] with error %{public}@", buf, 0x16u);
            }

          }
          -[NSObject shouldCompress](v21, "shouldCompress");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "BOOLValue");

          if (v26)
          {
            -[DEDAttachmentHandler log](self, "log");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              -[DEDAttachmentHandler _processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:rootDir:].cold.3((uint64_t)v77, (uint64_t)v21);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DEDAttachmentHandler compressOnAttach](self, "compressOnAttach"));
            v27 = objc_claimAutoreleasedReturnValue();
            -[NSObject setShouldCompress:](v21, "setShouldCompress:", v27);
          }

          -[NSObject shouldCompress](v21, "shouldCompress");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "BOOLValue");

          if (v29)
          {
            -[DEDAttachmentHandler log](self, "log");
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              -[NSObject path](v21, "path");
              v31 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v79 = v31;
              _os_log_impl(&dword_21469E000, v30, OS_LOG_TYPE_INFO, "Will compress while attaching [%@]", buf, 0xCu);

            }
          }
          v32 = (id)-[NSObject attachToDestinationDir:](v21, "attachToDestinationDir:", v16);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
      }
      while (v18);
    }

    if (v56)
    {
      -[DEDAttachmentHandler log](self, "log");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v79 = v16;
        _os_log_impl(&dword_21469E000, v33, OS_LOG_TYPE_INFO, "Setting NSURLFileProtectionKey on [%{public}@]", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BE2C9A0], "enumeratorForAllItems:", v16);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v34)
      {
        -[DEDAttachmentHandler log](self, "log");
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          -[DEDAttachmentHandler _processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:rootDir:].cold.2();

        v46 = 0;
        goto LABEL_38;
      }
      v61 = v16;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      obja = v34;
      v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v66;
        v38 = *MEMORY[0x24BDBCC20];
        v39 = *MEMORY[0x24BDBCC10];
        do
        {
          v40 = 0;
          do
          {
            if (*(_QWORD *)v66 != v37)
              objc_enumerationMutation(obja);
            v41 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v40);
            v42 = (void *)MEMORY[0x2199D3FEC]();
            v74 = v38;
            v75 = v39;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = 0;
            objc_msgSend(v41, "setResourceValues:error:", v43, &v64);
            v44 = v64;

            if (v44)
            {
              -[DEDAttachmentHandler log](self, "log");
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v79 = v61;
                _os_log_error_impl(&dword_21469E000, v45, OS_LOG_TYPE_ERROR, "Failed to set ProtectionCompleteUnlessOpen on [%{public}@]", buf, 0xCu);
              }

            }
            objc_autoreleasePoolPop(v42);
            ++v40;
          }
          while (v36 != v40);
          v36 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
        }
        while (v36);
      }

      v16 = v61;
    }
    v16 = v16;
    v46 = v16;
LABEL_38:
    v13 = v59;
    v12 = v60;
    v15 = v57;
    v14 = v58;
    goto LABEL_42;
  }
  -[DEDAttachmentHandler log](self, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    -[DEDAttachmentHandler _processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:rootDir:].cold.1(v16, v47, v48, v49, v50, v51, v52, v53);
  v46 = 0;
LABEL_42:

  return v46;
}

- (void)removeDEFiles:(id)a3 withSessionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[DEDAttachmentHandler dedDirectory](self, "dedDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:](self, "directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:", v7, v6, v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE2C9A0], "removeFile:", v9);
    }
    else
    {
      -[DEDAttachmentHandler log](self, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[DEDAttachmentHandler removeDEFiles:withSessionIdentifier:].cold.2();

    }
  }
  else
  {
    -[DEDAttachmentHandler log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[DEDAttachmentHandler removeDEFiles:withSessionIdentifier:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (id)extensionsWithFilesAttachedToSessionWithID:(id)a3 allExtensions:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[5];
  id v36;

  v6 = a4;
  if (a3)
  {
    -[DEDAttachmentHandler directoryForBugSessionIdentifier:](self, "directoryForBugSessionIdentifier:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject path](v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

    if ((v10 & 1) != 0)
    {
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", v7);
        v11 = objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke;
        v35[3] = &unk_24D1E44B8;
        v35[4] = self;
        v36 = v6;
        -[NSObject ded_mapWithBlock:](v11, "ded_mapWithBlock:", v35);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
        goto LABEL_14;
      }
      -[DEDAttachmentHandler log](self, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[DEDAttachmentHandler extensionsWithFilesAttachedToSessionWithID:allExtensions:].cold.2(v11, v27, v28, v29, v30, v31, v32, v33);
    }
    else
    {
      -[DEDAttachmentHandler log](self, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[DEDAttachmentHandler extensionsWithFilesAttachedToSessionWithID:allExtensions:].cold.3(v11, v20, v21, v22, v23, v24, v25, v26);
    }
    v12 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_13;
  }
  -[DEDAttachmentHandler log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    -[DEDAttachmentHandler extensionsWithFilesAttachedToSessionWithID:allExtensions:].cold.1(v7, v13, v14, v15, v16, v17, v18, v19);
  v12 = (void *)MEMORY[0x24BDBD1A8];
LABEL_14:

  return v12;
}

id __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  DEDExtensionIdentifier *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke_cold_2();

  objc_msgSend(v3, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v5);
  -[DEDExtensionIdentifier extensionIdentifier](v6, "extensionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke_20;
  v15[3] = &unk_24D1E4490;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v8, "ded_findWithBlock:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke_cold_1();

  }
  return v11;
}

uint64_t __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke_20(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)collectedGroupsWithSessionIdentifier:(id)a3 matchingExtensions:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  DEDExtensionIdentifier *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v39;
  void *v40;
  id obj;
  NSObject *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[16];
  uint8_t buf[4];
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v44 = a4;
  if (!a3)
  {
    -[DEDAttachmentHandler log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[DEDAttachmentHandler collectedGroupsWithSessionIdentifier:matchingExtensions:].cold.1(v6, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_30;
  }
  -[DEDAttachmentHandler directoryForBugSessionIdentifier:](self, "directoryForBugSessionIdentifier:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject path](v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if (!v9)
  {
LABEL_30:
    v30 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_35;
  }
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
  if (objc_msgSend(v44, "count"))
  {
    +[DEDDevice currentDevice](DEDDevice, "currentDevice");
    v42 = objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v39 = v6;
    objc_msgSend(MEMORY[0x24BE2C9A0], "lsDir:", v6);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v45)
    {
      v43 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v50 != v43)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          -[DEDAttachmentHandler log](self, "log");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v11;
            _os_log_debug_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEBUG, "inspecting DE dir %@", buf, 0xCu);
          }

          objc_msgSend(v11, "lastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", v13);
          -[DEDExtensionIdentifier extensionIdentifier](v14, "extensionIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = MEMORY[0x24BDAC760];
          v47[1] = 3221225472;
          v47[2] = __80__DEDAttachmentHandler_collectedGroupsWithSessionIdentifier_matchingExtensions___block_invoke;
          v47[3] = &unk_24D1E4490;
          v16 = v15;
          v48 = v16;
          objc_msgSend(v44, "ded_findWithBlock:", v47);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            v46 = v13;
            objc_msgSend(v17, "name");
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = (void *)v19;
            if (v19)
              v21 = (void *)v19;
            else
              v21 = v16;
            v22 = v21;

            objc_msgSend(MEMORY[0x24BE2C980], "createWithName:rootURL:", v22, v11);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[DEDAttachmentGroup groupWithDEGroup:identifier:](DEDAttachmentGroup, "groupWithDEGroup:identifier:", v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSObject identifier](v42, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setDeviceID:", v26);

            -[DEDAttachmentHandler log](self, "log");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v55 = v25;
              _os_log_debug_impl(&dword_21469E000, v27, OS_LOG_TYPE_DEBUG, "created group %@", buf, 0xCu);
            }

            if (v25)
            {
              objc_msgSend(v40, "addObject:", v25);
            }
            else
            {
              -[DEDAttachmentHandler log](self, "log");
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                -[DEDAttachmentHandler collectedGroupsWithSessionIdentifier:matchingExtensions:].cold.3((uint64_t)v53, (uint64_t)v11);

            }
            v13 = v46;
          }
          else
          {
            -[DEDAttachmentHandler log](self, "log");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v55 = v11;
              _os_log_error_impl(&dword_21469E000, v22, OS_LOG_TYPE_ERROR, "could not match de directory [%{public}@] to known extensions", buf, 0xCu);
            }
          }

        }
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v45);
    }

    v29 = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v40);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v39;
  }
  else
  {
    -[DEDAttachmentHandler log](self, "log");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[DEDAttachmentHandler collectedGroupsWithSessionIdentifier:matchingExtensions:].cold.2();
    v30 = (void *)MEMORY[0x24BDBD1A8];
    v29 = v40;
  }

LABEL_35:
  return v30;
}

uint64_t __80__DEDAttachmentHandler_collectedGroupsWithSessionIdentifier_matchingExtensions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)createEmptyMessageFileForDE:(id)a3 extensionName:(id)a4 withSessionIdentifier:(id)a5 device:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[DEDAttachmentHandler dedDirectory](self, "dedDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDAttachmentHandler _createEmptyMessageFileForDE:extensionName:withSessionIdentifier:device:withRootDir:](self, "_createEmptyMessageFileForDE:extensionName:withSessionIdentifier:device:withRootDir:", v13, v12, v11, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_createEmptyMessageFileForDE:(id)a3 extensionName:(id)a4 withSessionIdentifier:(id)a5 device:(id)a6 withRootDir:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v13)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("EMPTY_%@.txt"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BDD1500];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringFromDate:dateStyle:timeStyle:", v20, 3, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v14, "publicLogDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "build");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Diagnostic Extension [%@] ran on [%@] with build [%@] on [%@] and returned no files."), v12, v23, v24, v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:](self, "directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:", v13, v12, v15, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "URLByAppendingPathComponent:", v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "writeToFile:atomically:encoding:error:", v28, 1, 4, 0);

  }
  else
  {
    -[DEDAttachmentHandler log](self, "log");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[DEDAttachmentHandler _createEmptyMessageFileForDE:extensionName:withSessionIdentifier:device:withRootDir:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("/"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

- (id)directoryForBugSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  if (v4)
  {
    -[DEDAttachmentHandler dedDirectory](self, "dedDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[DEDAttachmentHandler log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[DEDAttachmentHandler directoryForBugSessionIdentifier:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    v6 = 0;
  }

  return v6;
}

- (id)directoryForBugSessionIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  int v18;
  id v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[DEDAttachmentHandler directoryForBugSessionIdentifier:](self, "directoryForBugSessionIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_12:
    v16 = v7;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  -[DEDAttachmentHandler log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[DEDAttachmentHandler directoryForBugSessionIdentifier:createIfNeeded:].cold.1();

    goto LABEL_12;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543362;
    v19 = v6;
    _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_DEFAULT, "Bug session directory for session: [%{public}@] does not exist. Creating now", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE2C9A0], "createDirectoryWithClassCDataProtection:", v7);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_12;
  v14 = (void *)v13;
  -[DEDAttachmentHandler log](self, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[DEDAttachmentHandler directoryForBugSessionIdentifier:createIfNeeded:].cold.2();

  v16 = 0;
LABEL_13:

  return v16;
}

- (void)removeDirectoryForBugSessionIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDAttachmentHandler log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v4;
      _os_log_impl(&dword_21469E000, v6, OS_LOG_TYPE_DEFAULT, "removing bug session directory [%{public}@]", (uint8_t *)&v17, 0xCu);
    }

    -[DEDAttachmentHandler directoryForBugSessionIdentifier:](self, "directoryForBugSessionIdentifier:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject path](v6, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

      if (v9)
        objc_msgSend(MEMORY[0x24BE2C9A0], "removeFile:", v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    -[DEDAttachmentHandler removeDirectoryForBugSessionIdentifier:].cold.1(v6, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (unint64_t)directorySizeForBugSessionIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;

  v4 = a3;
  if (!v4)
  {
    -[DEDAttachmentHandler log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[DEDAttachmentHandler directorySizeForBugSessionIdentifier:].cold.1(v5, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_9;
  }
  -[DEDAttachmentHandler directoryForBugSessionIdentifier:](self, "directoryForBugSessionIdentifier:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[DEDAttachmentHandler log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[DEDAttachmentHandler directorySizeForBugSessionIdentifier:].cold.2();

LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v6 = objc_msgSend(MEMORY[0x24BE2C9A0], "getDirectorySize:", v5);
LABEL_10:

  return v6;
}

- (id)identifierForAdoptingFile:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dedDirectory
{
  if (dedDirectory_onceToken != -1)
    dispatch_once(&dedDirectory_onceToken, &__block_literal_global_0);
  return (id)dedDirectory_dedDirectory;
}

void __36__DEDAttachmentHandler_dedDirectory__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dedDirectory");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)dedDirectory_dedDirectory;
  dedDirectory_dedDirectory = v1;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)dedDirectory_dedDirectory, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) == 0)
    v6 = (id)objc_msgSend(MEMORY[0x24BE2C9A0], "createDirectoryWithClassCDataProtection:", dedDirectory_dedDirectory);
}

- (id)directoryForBugSessionWithIdentifier:(id)a3 rootDirectory:(id)a4 createIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int v26;
  void *v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "fileExistsAtPath:", v12);

    if (v5)
    {
      -[DEDAttachmentHandler log](self, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if ((v13 & 1) != 0)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:rootDirectory:createIfNeeded:].cold.2();
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v26 = 138543362;
          v27 = v11;
          _os_log_impl(&dword_21469E000, v15, OS_LOG_TYPE_INFO, "creating bug session directory: [%{public}@]", (uint8_t *)&v26, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BE2C9A0], "createDirectoryWithClassCDataProtection:", v11);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[DEDAttachmentHandler log](self, "log");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:rootDirectory:createIfNeeded:].cold.3(v15, v24);

        }
      }

    }
  }
  else
  {
    -[DEDAttachmentHandler log](self, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:rootDirectory:createIfNeeded:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)directoryForBugSessionWithIdentifier:(id)a3 extension:(id)a4 rootDirectory:(id)a5 createIfNeeded:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v29;
  void *v30;
  uint64_t v31;

  v6 = a6;
  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSObject fileExistsAtPath:](v13, "fileExistsAtPath:", v16);

    -[DEDAttachmentHandler log](self, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if ((v17 & 1) != 0 || !v6)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:].cold.2((uint64_t)v10, v15, v19);
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v29 = 138543362;
        v30 = v15;
        _os_log_impl(&dword_21469E000, v19, OS_LOG_TYPE_INFO, "creating extension directory: [%{public}@]", (uint8_t *)&v29, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BE2C9A0], "createDirectoryWithClassCDataProtection:", v15);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[DEDAttachmentHandler log](self, "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:].cold.3(v15, v19, v20);

      }
    }

  }
  else
  {
    -[DEDAttachmentHandler log](self, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:].cold.1(v13, v21, v22, v23, v24, v25, v26, v27);
    v15 = 0;
  }

  return v15;
}

- (id)directoryForBugSessionWithIdentifier:(id)a3 extension:(id)a4 rootDirectory:(id)a5
{
  return -[DEDAttachmentHandler directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:](self, "directoryForBugSessionWithIdentifier:extension:rootDirectory:createIfNeeded:", a3, a4, a5, 1);
}

- (BOOL)compressOnAttach
{
  return self->_compressOnAttach;
}

- (void)setCompressOnAttach:(BOOL)a3
{
  self->_compressOnAttach = a3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)_processAttachments:(uint64_t)a3 withSessionIdentifier:(uint64_t)a4 extension:(uint64_t)a5 shouldAddClassBDataProtection:(uint64_t)a6 rootDir:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21469E000, a1, a3, "[%{public}s] nil bug session identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_processAttachments:withSessionIdentifier:extension:shouldAddClassBDataProtection:rootDir:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Could not create enumerator for dir [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_processAttachments:(uint64_t)a1 withSessionIdentifier:(uint64_t)a2 extension:shouldAddClassBDataProtection:rootDir:.cold.3(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_8(a1, a2), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v5;
  _os_log_debug_impl(&dword_21469E000, v2, OS_LOG_TYPE_DEBUG, "shouldCompress = YES for [%@]", v4, 0xCu);

  OUTLINED_FUNCTION_9();
}

- (void)removeDEFiles:(uint64_t)a3 withSessionIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21469E000, a1, a3, "[%{public}s] nil bug session identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeDEFiles:withSessionIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "directory to remove is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)extensionsWithFilesAttachedToSessionWithID:(uint64_t)a3 allExtensions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21469E000, a1, a3, "[%{public}s] nil bug session identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)extensionsWithFilesAttachedToSessionWithID:(uint64_t)a3 allExtensions:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a1, a3, "[%{public}s] received no extensions.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)extensionsWithFilesAttachedToSessionWithID:(uint64_t)a3 allExtensions:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a1, a3, "[%{public}s] found no session directory.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "could not match de directory [%{public}@] to known extensions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __81__DEDAttachmentHandler_extensionsWithFilesAttachedToSessionWithID_allExtensions___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_21469E000, v0, OS_LOG_TYPE_DEBUG, "Inspecting DE dir %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)collectedGroupsWithSessionIdentifier:(uint64_t)a3 matchingExtensions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21469E000, a1, a3, "[%{public}s] nil bug session identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)collectedGroupsWithSessionIdentifier:matchingExtensions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21469E000, v0, v1, "cannot build ded group list with empty extension, exiting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)collectedGroupsWithSessionIdentifier:(uint64_t)a1 matchingExtensions:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_8(a1, a2), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138543362;
  *v3 = v5;
  _os_log_error_impl(&dword_21469E000, v2, OS_LOG_TYPE_ERROR, "could not create ded group from de dir [%{public}@]", v4, 0xCu);

  OUTLINED_FUNCTION_9();
}

- (void)_createEmptyMessageFileForDE:(uint64_t)a3 extensionName:(uint64_t)a4 withSessionIdentifier:(uint64_t)a5 device:(uint64_t)a6 withRootDir:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21469E000, a1, a3, "[%{public}s] nil bug session identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)directoryForBugSessionIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21469E000, a1, a3, "[%{public}s] nil bug session identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)directoryForBugSessionIdentifier:createIfNeeded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_21469E000, v0, v1, "Bug session directory already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)directoryForBugSessionIdentifier:createIfNeeded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Could not create bug session directory with error: [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)removeDirectoryForBugSessionIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21469E000, a1, a3, "[%{public}s] nil bug session identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)directorySizeForBugSessionIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21469E000, a1, a3, "[%{public}s] nil bug session identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)directorySizeForBugSessionIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_21469E000, v0, v1, "Failed to get directory for bug session [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)directoryForBugSessionWithIdentifier:(uint64_t)a3 rootDirectory:(uint64_t)a4 createIfNeeded:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21469E000, a1, a3, "[%{public}s] nil bug session identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)directoryForBugSessionWithIdentifier:rootDirectory:createIfNeeded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_21469E000, v0, v1, "bug session directory already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_3();
}

- (void)directoryForBugSessionWithIdentifier:(void *)a1 rootDirectory:(NSObject *)a2 createIfNeeded:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_21469E000, a2, OS_LOG_TYPE_ERROR, "could not create bug session directory with error: [%{public}@]", v4, 0xCu);

}

- (void)directoryForBugSessionWithIdentifier:(uint64_t)a3 extension:(uint64_t)a4 rootDirectory:(uint64_t)a5 createIfNeeded:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21469E000, a1, a3, "[%{public}s] nil bug session identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)directoryForBugSessionWithIdentifier:(NSObject *)a3 extension:rootDirectory:createIfNeeded:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_21469E000, a3, OS_LOG_TYPE_DEBUG, "extension directory for session (%@) already exists: %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_4();
}

- (void)directoryForBugSessionWithIdentifier:(NSObject *)a3 extension:rootDirectory:createIfNeeded:.cold.3(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_21469E000, a3, OS_LOG_TYPE_ERROR, "could not create extension directory (%@) with error: [%{public}@]", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_4();
}

@end
