@implementation DOCInitLogging

void __DOCInitLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;
  os_log_t v26;
  void *v27;
  os_log_t v28;
  void *v29;
  os_log_t v30;
  void *v31;
  os_log_t v32;
  void *v33;
  os_log_t v34;
  void *v35;
  os_log_t v36;
  void *v37;
  os_log_t v38;
  void *v39;
  os_log_t v40;
  void *v41;

  v0 = os_log_create("com.apple.DocumentManager", "DocumentManager");
  v1 = (void *)docLogHandle;
  docLogHandle = (uint64_t)v0;

  v2 = os_log_create("com.apple.DocumentManager", "UI");
  v3 = (void *)docUILogHandle;
  docUILogHandle = (uint64_t)v2;

  v4 = os_log_create("com.apple.DocumentManager", "DocumentCreation");
  v5 = (void *)docDocumentCreationLogHandle;
  docDocumentCreationLogHandle = (uint64_t)v4;

  v6 = os_log_create("com.apple.DocumentManager", "ServicePresentation");
  v7 = (void *)docServicePresentationHandle;
  docServicePresentationHandle = (uint64_t)v6;

  v8 = os_log_create("com.apple.DocumentManager", "Persona");
  v9 = (void *)docPersonaLogHandle;
  docPersonaLogHandle = (uint64_t)v8;

  v10 = os_log_create("com.apple.DocumentManager", "SmartFolders");
  v11 = (void *)docSmartFolderLogHandle;
  docSmartFolderLogHandle = (uint64_t)v10;

  v12 = os_log_create("com.apple.DocumentManager", "Source");
  v13 = (void *)docSourceLogHandle;
  docSourceLogHandle = (uint64_t)v12;

  v14 = os_log_create("com.apple.DocumentManager", "Picker");
  v15 = (void *)docPickerLogHandle;
  docPickerLogHandle = (uint64_t)v14;

  v16 = os_log_create("com.apple.DocumentManager", "Rename");
  v17 = (void *)docRenameLogHandle;
  docRenameLogHandle = (uint64_t)v16;

  v18 = os_log_create("com.apple.DocumentManager", "History");
  v19 = (void *)docBrowserHistoryLogHandle;
  docBrowserHistoryLogHandle = (uint64_t)v18;

  v20 = os_log_create("com.apple.DocumentManager", "Tests");
  v21 = (void *)docTestsLogHandle;
  docTestsLogHandle = (uint64_t)v20;

  v22 = os_log_create("com.apple.DocumentManager", "DownloadService");
  v23 = (void *)docDownloadServiceLogHandle;
  docDownloadServiceLogHandle = (uint64_t)v22;

  v24 = os_log_create("com.apple.DocumentManager", "StateStore");
  v25 = (void *)docStateStoreHandle;
  docStateStoreHandle = (uint64_t)v24;

  v26 = os_log_create("com.apple.DocumentManager", "Analytics");
  v27 = (void *)docAnalyticsLogHandle;
  docAnalyticsLogHandle = (uint64_t)v26;

  v28 = os_log_create("com.apple.DocumentManager", "Application");
  v29 = (void *)docApplicationLogHandle;
  docApplicationLogHandle = (uint64_t)v28;

  v30 = os_log_create("com.apple.DocumentManager", "ProgressUI");
  v31 = (void *)docProgressUILogHandle;
  docProgressUILogHandle = (uint64_t)v30;

  v32 = os_log_create("com.apple.DocumentManager", "Enumeration");
  v33 = (void *)docEnumerationLogHandle;
  docEnumerationLogHandle = (uint64_t)v32;

  v34 = os_log_create("com.apple.DocumentManager", "AppIntents");
  v35 = (void *)docAppIntentsLogHandle;
  docAppIntentsLogHandle = (uint64_t)v34;

  v36 = os_log_create("com.apple.DocumentManager", "FileProviderSyncState");
  v37 = (void *)docFileProviderSyncStateLogHandle;
  docFileProviderSyncStateLogHandle = (uint64_t)v36;

  v38 = os_log_create("com.apple.DocumentManager", "Sidebar");
  v39 = (void *)docSidebarLogHandle;
  docSidebarLogHandle = (uint64_t)v38;

  v40 = os_log_create("com.apple.DocumentManager", "Preview");
  v41 = (void *)docPreviewLogHandle;
  docPreviewLogHandle = (uint64_t)v40;

}

@end
