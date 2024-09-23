@implementation ICPaths

void __29__ICPaths_persistentStoreURL__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (!_persistentStoreURL)
  {
    objc_msgSend(*(id *)(a1 + 32), "applicationDocumentsURL");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("NoteStore"), 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_persistentStoreURL;
    _persistentStoreURL = v2;

    objc_msgSend((id)_persistentStoreURL, "URLByAppendingPathExtension:", CFSTR("sqlite"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_persistentStoreURL;
    _persistentStoreURL = v4;

  }
}

+ (NSURL)applicationDocumentsURL
{
  void *v3;
  _QWORD block[5];

  if (applicationDocumentsURL_onceToken != -1)
    dispatch_once(&applicationDocumentsURL_onceToken, &__block_literal_global_15);
  v3 = (void *)_applicationDocumentsURL;
  if (!_applicationDocumentsURL)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__ICPaths_applicationDocumentsURL__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)applicationDocumentsURL_creationQueue, block);
    v3 = (void *)_applicationDocumentsURL;
  }
  return (NSURL *)v3;
}

+ (id)URLForGroupContainerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v5 = (void *)getUMUserManagerClass_softClass_0;
  v45 = getUMUserManagerClass_softClass_0;
  if (!getUMUserManagerClass_softClass_0)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __getUMUserManagerClass_block_invoke_0;
    v40 = &unk_1EA823E40;
    v41 = &v42;
    __getUMUserManagerClass_block_invoke_0((uint64_t)&v37);
    v5 = (void *)v43[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v42, 8);
  objc_msgSend(v6, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isProxy");
  v36 = 0;
  v10 = (void *)objc_msgSend(v8, "copyCurrentPersonaContextWithError:", &v36);
  v11 = v36;
  v12 = v11;
  if (v11)
    v13 = 0;
  else
    v13 = v9;
  if (v13 == 1)
  {
    v14 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[ICPaths URLForGroupContainerWithIdentifier:].cold.4();

    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v15 = (void *)getUMUserPersonaAttributesClass_softClass_0;
    v45 = getUMUserPersonaAttributesClass_softClass_0;
    if (!getUMUserPersonaAttributesClass_softClass_0)
    {
      v37 = MEMORY[0x1E0C809B0];
      v38 = 3221225472;
      v39 = __getUMUserPersonaAttributesClass_block_invoke_0;
      v40 = &unk_1EA823E40;
      v41 = &v42;
      __getUMUserPersonaAttributesClass_block_invoke_0((uint64_t)&v37);
      v15 = (void *)v43[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v42, 8);
    objc_msgSend(v16, "personaAttributesForPersonaType:", 0);
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject userPersonaUniqueString](v17, "userPersonaUniqueString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v8, "generateAndRestorePersonaContextWithPersonaUniqueString:", v18);

  }
  else
  {
    if (!v11)
      goto LABEL_16;
    v17 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[ICPaths URLForGroupContainerWithIdentifier:].cold.5();
  }

LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "containerURLForSecurityApplicationGroupIdentifier:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (!v13)
      goto LABEL_18;
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "groupContainerURL", "+[ICPaths URLForGroupContainerWithIdentifier:]", 1, 1, CFSTR("Failed to get group container URL for \"%@\"), v4);
    if (!v13)
    {
LABEL_18:
      if (!v21)
        goto LABEL_32;
      goto LABEL_22;
    }
  }
  v22 = (id)objc_msgSend(v8, "restorePersonaWithSavedPersonaContext:", v10);
  if (!v21)
    goto LABEL_32;
LABEL_22:
  v35 = 0;
  v23 = objc_msgSend(v21, "checkResourceIsReachableAndReturnError:", &v35);
  v24 = v35;
  if ((v23 & 1) == 0)
  {
    v25 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      +[ICPaths URLForGroupContainerWithIdentifier:].cold.3();

    if ((objc_msgSend(a1, "isReadOnlyPersistentStore") & 1) == 0)
    {
      v33 = v10;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attributesForGroupContainerDirectory");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v28 = objc_msgSend(v26, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v21, 1, v27, &v34);
      v29 = v34;

      if ((v28 & 1) == 0)
      {
        v30 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          +[ICPaths URLForGroupContainerWithIdentifier:].cold.2();

      }
      v10 = v33;
    }
  }

LABEL_32:
  v31 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    +[ICPaths URLForGroupContainerWithIdentifier:].cold.1();

  return v21;
}

+ (void)URLForGroupContainerWithIdentifier:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1DDAA5000, v0, OS_LOG_TYPE_DEBUG, "Group container URL: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __34__ICPaths_applicationDocumentsURL__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  if (!_applicationDocumentsURL)
  {
    v1 = *(void **)(a1 + 32);
    ICGroupContainerIdentifier();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "URLForGroupContainerWithIdentifier:", v4);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_applicationDocumentsURL;
    _applicationDocumentsURL = v2;

  }
}

void __32__ICPaths_managedObjectModelURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  ICSharedFrameworkBundleIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithIdentifier:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v3 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __32__ICPaths_managedObjectModelURL__block_invoke_cold_2();

      v2 = 0;
    }
  }
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("NoteData"), CFSTR("mom"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)managedObjectModelURL_modelURL;
  managedObjectModelURL_modelURL = v4;

  if (!managedObjectModelURL_modelURL)
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __32__ICPaths_managedObjectModelURL__block_invoke_cold_1();

  }
}

+ (void)setIsReadOnlyPersistentStore:(BOOL)a3
{
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  _isReadOnlyPersistentStore = a3;
  objc_sync_exit(obj);

}

+ (NSURL)persistentStoreURL
{
  void *v3;
  _QWORD block[5];

  if (persistentStoreURL_onceToken != -1)
    dispatch_once(&persistentStoreURL_onceToken, &__block_literal_global_47);
  v3 = (void *)_persistentStoreURL;
  if (!_persistentStoreURL)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__ICPaths_persistentStoreURL__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)persistentStoreURL_creationQueue, block);
    v3 = (void *)_persistentStoreURL;
  }
  return (NSURL *)v3;
}

void __34__ICPaths_applicationDocumentsURL__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("ICPathsCreateApplicationDocumentsURL", v2);
  v1 = (void *)applicationDocumentsURL_creationQueue;
  applicationDocumentsURL_creationQueue = (uint64_t)v0;

}

void __29__ICPaths_persistentStoreURL__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("ICPathsCreatePersistentStoreURL", v2);
  v1 = (void *)persistentStoreURL_creationQueue;
  persistentStoreURL_creationQueue = (uint64_t)v0;

}

+ (NSURL)managedObjectModelURL
{
  if (managedObjectModelURL_onceToken != -1)
    dispatch_once(&managedObjectModelURL_onceToken, &__block_literal_global_40);
  return (NSURL *)(id)managedObjectModelURL_modelURL;
}

+ (void)setApplicationDocumentsURL:(id)a3
{
  void *v4;
  id v5;

  objc_storeStrong((id *)&_applicationDocumentsURL, a3);
  v5 = a3;
  v4 = (void *)_persistentStoreURL;
  _persistentStoreURL = 0;

}

+ (void)resetApplicationDocumentsURL
{
  void *v2;
  void *v3;

  v2 = (void *)_applicationDocumentsURL;
  _applicationDocumentsURL = 0;

  v3 = (void *)_persistentStoreURL;
  _persistentStoreURL = 0;

}

+ (NSURL)importDocumentsURL
{
  void *v3;
  _QWORD block[5];

  if (importDocumentsURL_onceToken != -1)
    dispatch_once(&importDocumentsURL_onceToken, &__block_literal_global_27);
  v3 = (void *)importDocumentsURL_importDocumentsURL;
  if (!importDocumentsURL_importDocumentsURL)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__ICPaths_importDocumentsURL__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)importDocumentsURL_creationQueue, block);
    v3 = (void *)importDocumentsURL_importDocumentsURL;
  }
  return (NSURL *)v3;
}

void __29__ICPaths_importDocumentsURL__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("ICPathsCreateImportDocumentsURL", v2);
  v1 = (void *)importDocumentsURL_creationQueue;
  importDocumentsURL_creationQueue = (uint64_t)v0;

}

void __29__ICPaths_importDocumentsURL__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  if (!importDocumentsURL_importDocumentsURL)
  {
    v1 = *(void **)(a1 + 32);
    ICImportGroupContainerIdentifier();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "URLForGroupContainerWithIdentifier:", v4);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)importDocumentsURL_importDocumentsURL;
    importDocumentsURL_importDocumentsURL = v2;

  }
}

+ (NSURL)defaultPreviewImageDirectoryURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "applicationDocumentsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Previews"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (NSURL)applicationDataContainerURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v18;

  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  ICDynamicCast(v3, (uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containingBundleRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  ICDynamicCast(v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataContainerURL");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = v5;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CA5898];
    ICNotesAppBundleIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v11, "bundleRecordWithApplicationIdentifier:error:", v12, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;

    if (v13)
    {
      v14 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[ICPaths applicationDataContainerURL].cold.2();

    }
    else
    {
      objc_msgSend(v10, "dataContainerURL");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v9 = (void *)v16;
        goto LABEL_12;
      }
    }
    v15 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[ICPaths applicationDataContainerURL].cold.1();

    v9 = 0;
  }
LABEL_12:

  return (NSURL *)v9;
}

+ (NSDictionary)attributesForGroupContainerDirectory
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CB2AA8];
  v4[0] = &unk_1EA8322B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isReadOnlyPersistentStore
{
  id v2;
  char v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = _isReadOnlyPersistentStore;
  objc_sync_exit(v2);

  return v3;
}

+ (NSURL)oldManagedObjectModelURL
{
  if (oldManagedObjectModelURL_onceToken != -1)
    dispatch_once(&oldManagedObjectModelURL_onceToken, &__block_literal_global_44);
  return (NSURL *)(id)oldManagedObjectModelURL_modelURL;
}

void __35__ICPaths_oldManagedObjectModelURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  ICSharedFrameworkBundleIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithIdentifier:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v3 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __35__ICPaths_oldManagedObjectModelURL__block_invoke_cold_2();

      v2 = 0;
    }
  }
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("NoteDataOld"), CFSTR("momd"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)oldManagedObjectModelURL_modelURL;
  oldManagedObjectModelURL_modelURL = v4;

  if (!oldManagedObjectModelURL_modelURL)
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __35__ICPaths_oldManagedObjectModelURL__block_invoke_cold_1();

  }
}

+ (void)URLForGroupContainerWithIdentifier:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1DDAA5000, v0, OS_LOG_TYPE_ERROR, "Error creating %@ group container: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)URLForGroupContainerWithIdentifier:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1DDAA5000, v0, OS_LOG_TYPE_DEBUG, "%@ group container URL is not reachable. URL=%@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)URLForGroupContainerWithIdentifier:.cold.4()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(&dword_1DDAA5000, v0, OS_LOG_TYPE_DEBUG, "Temporarily adopting personal persona context instead of system proxy", v1, 2u);
  OUTLINED_FUNCTION_3_0();
}

+ (void)URLForGroupContainerWithIdentifier:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Error saving persona context {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)applicationDataContainerURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1();
}

void __32__ICPaths_managedObjectModelURL__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Unable to find CoreData mom file for object model in %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __32__ICPaths_managedObjectModelURL__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_1DDAA5000, v0, v1, "Unable to find framework/XPC service bundle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __35__ICPaths_oldManagedObjectModelURL__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Unable to find CoreData momd file for old object model in %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __35__ICPaths_oldManagedObjectModelURL__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_1DDAA5000, v0, v1, "Unable to find framework/XPC service bundle when looking for old data model", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
