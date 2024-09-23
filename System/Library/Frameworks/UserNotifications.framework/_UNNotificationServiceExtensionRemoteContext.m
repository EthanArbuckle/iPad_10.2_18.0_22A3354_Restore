@implementation _UNNotificationServiceExtensionRemoteContext

- (_UNNotificationServiceExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  _UNNotificationServiceExtensionRemoteContext *v5;
  _UNNotificationServiceExtensionRemoteContext *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)_UNNotificationServiceExtensionRemoteContext;
  v5 = -[_UNNotificationServiceExtensionRemoteContext initWithInputItems:listenerEndpoint:contextUUID:](&v11, sel_initWithInputItems_listenerEndpoint_contextUUID_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    atomic_store(0, (unsigned __int8 *)&v5->_hasRepliedFlag);
    v7 = (void *)UNLogServiceExtension;
    if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[_UNNotificationServiceExtensionRemoteContext _UUID](v6, "_UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Service extension context initialized", buf, 0xCu);

    }
  }
  return v6;
}

- (void)didReceiveNotificationRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_UNNotificationServiceExtensionRemoteContext extensionInstance](self, "extensionInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)UNLogServiceExtension;
  if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[_UNNotificationServiceExtensionRemoteContext _UUID](self, "_UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "un_logDigest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v11;
    v21 = 2114;
    v22 = v13;
    _os_log_impl(&dword_1AA8E4000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request replacement content for notification request %{public}@", buf, 0x16u);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E57EF988;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v14 = v7;
  v15 = v6;
  objc_msgSend(v8, "didReceiveNotificationRequest:withContentHandler:", v15, v16);

}

- (void)deleteAttachmentFilesInContentIfNecessary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a3;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = a3;
    objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UNAttachmentUtilities deleteAttachmentFilesInContentsIfNecessary:](UNAttachmentUtilities, "deleteAttachmentFilesInContentsIfNecessary:", v5, v6, v7);

  }
}

- (void)serviceExtensionTimeWillExpire
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[_UNNotificationServiceExtensionRemoteContext extensionInstance](self, "extensionInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)UNLogServiceExtension;
  if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[_UNNotificationServiceExtensionRemoteContext _UUID](self, "_UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Service extension time will expire", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(v3, "serviceExtensionTimeWillExpire");

}

- (void)serviceExtensionPerformCleanup
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)UNLogServiceExtension;
  if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[_UNNotificationServiceExtensionRemoteContext _UUID](self, "_UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cleaning up extension", (uint8_t *)&v6, 0xCu);

  }
  -[_UNNotificationServiceExtensionRemoteContext setExtensionInstance:](self, "setExtensionInstance:", 0);
  -[_UNNotificationServiceExtensionRemoteContext completeRequestReturningItems:completionHandler:](self, "completeRequestReturningItems:completionHandler:", 0, 0);
}

- (id)_stageAttachmentsForNotificationContent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  UNNotificationAttachment *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UNNotificationAttachment *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  int v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  objc_msgSend(v34, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v42;
    v37 = *(_QWORD *)v42;
    v38 = v8;
    v35 = v9;
    do
    {
      v13 = 0;
      v39 = v11;
      do
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v13);
        objc_msgSend(v14, "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 2;
        objc_msgSend(v4, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v40, v7, v15, 0);
        if (v40)
        {
          objc_msgSend(v8, "addObject:", v14);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "URLByAppendingPathComponent:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "pathExtension");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "URLByAppendingPathExtension:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = objc_msgSend(v4, "moveItemAtURL:toURL:error:", v15, v20, 0);
          if (v21)
          {
            v22 = [UNNotificationAttachment alloc];
            objc_msgSend(v14, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "type");
            v24 = v7;
            v25 = v4;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "options");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = -[UNNotificationAttachment initWithIdentifier:URL:type:options:](v22, "initWithIdentifier:URL:type:options:", v23, v20, v26, v27);

            v4 = v25;
            v7 = v24;
            v9 = v35;

            v8 = v38;
            objc_msgSend(v38, "addObject:", v28);

          }
          v29 = (void *)UNLogServiceExtension;
          if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
          {
            v30 = v29;
            -[_UNNotificationServiceExtensionRemoteContext _UUID](self, "_UUID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v46 = v31;
            v47 = 1024;
            v48 = v21;
            _os_log_impl(&dword_1AA8E4000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handled temporary attachment %{BOOL}d", buf, 0x12u);

            v8 = v38;
          }

          v12 = v37;
          v11 = v39;
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v11);
  }

  v32 = (void *)objc_msgSend(v34, "mutableCopy");
  objc_msgSend(v32, "setAttachments:", v8);

  return v32;
}

- (UNNotificationServiceExtension)extensionInstance
{
  return self->_extensionInstance;
}

- (void)setExtensionInstance:(id)a3
{
  objc_storeStrong((id *)&self->_extensionInstance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionInstance, 0);
}

@end
