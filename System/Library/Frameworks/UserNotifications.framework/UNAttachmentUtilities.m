@implementation UNAttachmentUtilities

+ (void)deleteAttachmentFilesInRequestsIfNecessary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "content", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "deleteAttachmentFilesInContentsIfNecessary:", v5);
}

+ (void)deleteAttachmentFilesInContentsIfNecessary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "attachments");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v15;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v15 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(a1, "_processAttachment:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

}

+ (void)_processAttachment:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (v35 = 2,
          -[NSObject getRelationship:ofDirectoryAtURL:toItemAtURL:error:](v6, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v35, v8, v5, 0), !v35))
    {
      v26 = UNLogAttachmentsService;
      if (os_log_type_enabled((os_log_t)UNLogAttachmentsService, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v5;
        _os_log_impl(&dword_1AA8E4000, v26, OS_LOG_TYPE_DEFAULT, "Contained in the bundle: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v30 = a1;
      objc_msgSend(v7, "dataContainerURL");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "groupContainerURLs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allValues");
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v9)
        objc_msgSend(v12, "addObject:", v9);
      v29 = (void *)v9;
      if (v11)
        objc_msgSend(v13, "addObjectsFromArray:", v11);
      v28 = (void *)v11;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            v35 = 2;
            -[NSObject getRelationship:ofDirectoryAtURL:toItemAtURL:error:](v6, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v35, v19, v5, 0);
            if (!v35)
            {
              v25 = UNLogAttachmentsService;
              if (os_log_type_enabled((os_log_t)UNLogAttachmentsService, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v38 = v5;
                _os_log_impl(&dword_1AA8E4000, v25, OS_LOG_TYPE_DEFAULT, "Contained in a group container. Deleting file: %{public}@", buf, 0xCu);
              }
              objc_msgSend(v30, "_deleteFile:", v5);
              v20 = v14;
              goto LABEL_26;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (v16)
            continue;
          break;
        }
      }

      objc_msgSend(v30, "_systemDirectoryURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 2;
      -[NSObject getRelationship:ofDirectoryAtURL:toItemAtURL:error:](v6, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v35, v20, v5, 0);
      if (v35)
      {
        objc_msgSend(v5, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[NSObject isWritableFileAtPath:](v6, "isWritableFileAtPath:", v21);

        if (v22)
        {
          v23 = UNLogAttachmentsService;
          if (os_log_type_enabled((os_log_t)UNLogAttachmentsService, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v38 = v5;
            _os_log_impl(&dword_1AA8E4000, v23, OS_LOG_TYPE_DEFAULT, "File is writable. Deleting file: %{public}@", buf, 0xCu);
          }
          objc_msgSend(v30, "_deleteFile:", v5);
        }
      }
      else
      {
        v27 = UNLogAttachmentsService;
        if (os_log_type_enabled((os_log_t)UNLogAttachmentsService, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v38 = v5;
          _os_log_impl(&dword_1AA8E4000, v27, OS_LOG_TYPE_DEFAULT, "Contained in the System directory: %{public}@", buf, 0xCu);
        }
      }
LABEL_26:

    }
    goto LABEL_28;
  }
  v24 = (void *)UNLogAttachmentsService;
  if (os_log_type_enabled((os_log_t)UNLogAttachmentsService, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v24;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v7;
    _os_log_impl(&dword_1AA8E4000, v6, OS_LOG_TYPE_DEFAULT, "No attachment URL for %{public}@", buf, 0xCu);
LABEL_28:

  }
}

+ (id)_systemDirectoryURL
{
  if (_systemDirectoryURL_onceToken != -1)
    dispatch_once(&_systemDirectoryURL_onceToken, &__block_literal_global);
  return (id)_systemDirectoryURL_systemDirectoryURL;
}

void __44__UNAttachmentUtilities__systemDirectoryURL__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99E98];
  BSSystemRootDirectory();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("System"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_systemDirectoryURL_systemDirectoryURL;
  _systemDirectoryURL_systemDirectoryURL = v2;

}

+ (void)_deleteFile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "removeItemAtURL:error:", v3, &v9);
  v5 = v9;

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundlePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)UNLogAttachmentsService;
    if (os_log_type_enabled((os_log_t)UNLogAttachmentsService, OS_LOG_TYPE_FAULT))
      +[UNAttachmentUtilities _deleteFile:].cold.1((uint64_t)v7, v8, v3);

  }
}

+ (void)_deleteFile:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_fault_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_FAULT, "[Notification Attachment] Failed to delete an attachment file. Bundle: '%{public}@', Attachment: '%{public}@'", (uint8_t *)&v7, 0x16u);

}

@end
