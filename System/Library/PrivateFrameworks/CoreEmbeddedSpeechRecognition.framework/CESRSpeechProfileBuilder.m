@implementation CESRSpeechProfileBuilder

- (CESRSpeechProfileBuilder)initWithDirectory:(id)a3 locale:(id)a4 userId:(id)a5 dataProtectionClass:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  CESRSpeechProfileBuilder *v14;
  CESRSpeechProfileBuilder *v15;
  NSMutableArray *v16;
  NSMutableArray *pendingItems;
  NSMutableArray *v18;
  NSMutableArray *isBoosted;
  uint64_t v20;
  NSXPCConnection *connection;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSXPCConnection *v26;
  CESRSpeechProfileBuilder *v27;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CESRSpeechProfileBuilder;
  v14 = -[CESRSpeechProfileBuilder init](&v29, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_4;
  objc_storeStrong((id *)&v14->_directory, a3);
  objc_storeStrong((id *)&v15->_locale, a4);
  objc_storeStrong((id *)&v15->_userId, a5);
  v15->_dataProtectionClass = a6;
  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  pendingItems = v15->_pendingItems;
  v15->_pendingItems = v16;

  v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  isBoosted = v15->_isBoosted;
  v15->_isBoosted = v18;

  v20 = -[CESRSpeechProfileBuilder _newConnection](v15, "_newConnection");
  connection = v15->_connection;
  v15->_connection = (NSXPCConnection *)v20;

  v15->_summedCommittedItemsMemoryInBytes = 0;
  v15->_uncommittedItemsMemoryInBytes = 0;
  objc_msgSend(v12, "localeIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRUtilities languageStringForLocaleString:](CESRUtilities, "languageStringForLocaleString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[CESRSpeechProfileBuilder _setProfileConfigWithLanguage:profileDir:userId:dataProtectionClass:](v15, "_setProfileConfigWithLanguage:profileDir:userId:dataProtectionClass:", v23, v24, v13, a6);

  v26 = v15->_connection;
  v27 = 0;
  if (v26)
  {
    if (v25)
LABEL_4:
      v27 = v15;
  }

  return v27;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  CESRSpeechProfileBuilder *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[CESRSpeechProfileBuilder dealloc]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1B3E5F000, v3, OS_LOG_TYPE_INFO, "%s %@ deallocating", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)CESRSpeechProfileBuilder;
  -[CESRSpeechProfileBuilder dealloc](&v4, sel_dealloc);
}

- (id)_newConnection
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.siri.embeddedspeech"));
  CESRSpeechProfileBuilderServiceGetXPCInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &CoreEmbeddedSpeechRecognizerInstanceUUIDSpeechProfileBuilder);
  objc_msgSend(v3, "_setUUID:", v5);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = dispatch_queue_create("CESRSpeechProfileBuilder", v7);
  objc_msgSend(v3, "_setQueue:", v8);
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __42__CESRSpeechProfileBuilder__newConnection__block_invoke;
  v14 = &unk_1E6734800;
  objc_copyWeak(&v15, &location);
  v9 = _Block_copy(&v11);
  objc_msgSend(v3, "setInterruptionHandler:", v9, v11, v12, v13, v14);
  objc_msgSend(v3, "setInvalidationHandler:", v9);
  objc_msgSend(v3, "resume");

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v3;
}

- (BOOL)_setProfileConfigWithLanguage:(id)a3 profileDir:(id)a4 userId:(id)a5 dataProtectionClass:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSXPCConnection *connection;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1328;
  v19[4] = __Block_byref_object_dispose__1329;
  v20 = 0;
  v13 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__CESRSpeechProfileBuilder__setProfileConfigWithLanguage_profileDir_userId_dataProtectionClass___block_invoke;
  v18[3] = &unk_1E6734C40;
  v18[4] = v19;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __96__CESRSpeechProfileBuilder__setProfileConfigWithLanguage_profileDir_userId_dataProtectionClass___block_invoke_247;
  v17[3] = &unk_1E6734200;
  v17[4] = &v21;
  objc_msgSend(v15, "setProfileConfigWithLanguage:profileDir:userId:dataProtectionClass:completion:", v10, v11, v12, a6, v17);

  LOBYTE(a6) = *((_BYTE *)v22 + 24);
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(&v21, 8);
  return a6;
}

- (int64_t)getVersionForCategory:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  int64_t v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = -1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1328;
  v25 = __Block_byref_object_dispose__1329;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1328;
  v19 = __Block_byref_object_dispose__1329;
  v20 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__CESRSpeechProfileBuilder_getVersionForCategory_error___block_invoke;
  v14[3] = &unk_1E6734C40;
  v14[4] = &v21;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __56__CESRSpeechProfileBuilder_getVersionForCategory_error___block_invoke_249;
  v13[3] = &unk_1E6734228;
  v13[4] = &v15;
  v13[5] = &v27;
  objc_msgSend(v9, "getVersionForCategory:completion:", v6, v13);

  if (a4)
  {
    v10 = (void *)v22[5];
    if (!v10)
      v10 = (void *)v16[5];
    *a4 = objc_retainAutorelease(v10);
  }
  v11 = v28[3];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

- (BOOL)addCodepathId:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1328;
  v26 = __Block_byref_object_dispose__1329;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1328;
  v20 = __Block_byref_object_dispose__1329;
  v21 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__CESRSpeechProfileBuilder_addCodepathId_error___block_invoke;
  v15[3] = &unk_1E6734C40;
  v15[4] = &v22;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __48__CESRSpeechProfileBuilder_addCodepathId_error___block_invoke_251;
  v14[3] = &unk_1E6734DD0;
  v14[4] = &v16;
  v14[5] = &v28;
  objc_msgSend(v9, "addCodepathId:completion:", v6, v14);

  v10 = *((unsigned __int8 *)v29 + 24);
  if (a4 && !*((_BYTE *)v29 + 24))
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = *((unsigned __int8 *)v29 + 24);
  }
  v12 = v10 != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (BOOL)removeCodepathId:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1328;
  v26 = __Block_byref_object_dispose__1329;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1328;
  v20 = __Block_byref_object_dispose__1329;
  v21 = 0;
  v7 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__CESRSpeechProfileBuilder_removeCodepathId_error___block_invoke;
  v15[3] = &unk_1E6734C40;
  v15[4] = &v22;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __51__CESRSpeechProfileBuilder_removeCodepathId_error___block_invoke_252;
  v14[3] = &unk_1E6734DD0;
  v14[4] = &v16;
  v14[5] = &v28;
  objc_msgSend(v9, "removeCodepathId:completion:", v6, v14);

  v10 = *((unsigned __int8 *)v29 + 24);
  if (a4 && !*((_BYTE *)v29 + 24))
  {
    v11 = (void *)v23[5];
    if (!v11)
      v11 = (void *)v17[5];
    *a4 = objc_retainAutorelease(v11);
    v10 = *((unsigned __int8 *)v29 + 24);
  }
  v12 = v10 != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (id)getCodepathIdsWithError:(id *)a3
{
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1328;
  v29 = __Block_byref_object_dispose__1329;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1328;
  v23 = __Block_byref_object_dispose__1329;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1328;
  v17 = __Block_byref_object_dispose__1329;
  v18 = 0;
  v5 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__CESRSpeechProfileBuilder_getCodepathIdsWithError___block_invoke;
  v12[3] = &unk_1E6734C40;
  v12[4] = &v19;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __52__CESRSpeechProfileBuilder_getCodepathIdsWithError___block_invoke_254;
  v11[3] = &unk_1E6734250;
  v11[4] = &v13;
  v11[5] = &v25;
  objc_msgSend(v7, "getCodepathIdsWithCompletion:", v11);

  if (a3)
  {
    v8 = (void *)v20[5];
    if (!v8)
      v8 = (void *)v14[5];
    *a3 = objc_retainAutorelease(v8);
  }
  v9 = (id)v26[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v9;
}

- (BOOL)beginWithCategoriesAndVersions:(id)a3 bundleId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSXPCConnection *connection;
  void *v12;
  int v13;
  void *v14;
  BOOL v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1328;
  v29 = __Block_byref_object_dispose__1329;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1328;
  v23 = __Block_byref_object_dispose__1329;
  v24 = 0;
  v10 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__CESRSpeechProfileBuilder_beginWithCategoriesAndVersions_bundleId_error___block_invoke;
  v18[3] = &unk_1E6734C40;
  v18[4] = &v25;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __74__CESRSpeechProfileBuilder_beginWithCategoriesAndVersions_bundleId_error___block_invoke_256;
  v17[3] = &unk_1E6734DD0;
  v17[4] = &v31;
  v17[5] = &v19;
  objc_msgSend(v12, "beginWithCategoriesAndVersions:bundleId:completion:", v8, v9, v17);

  v13 = *((unsigned __int8 *)v32 + 24);
  if (a5 && !*((_BYTE *)v32 + 24))
  {
    v14 = (void *)v26[5];
    if (!v14)
      v14 = (void *)v20[5];
    *a5 = objc_retainAutorelease(v14);
    v13 = *((unsigned __int8 *)v32 + 24);
  }
  v15 = v13 != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

- (BOOL)addVocabularyItem:(id)a3 isBoosted:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSMutableArray *isBoosted;
  void *v16;
  BOOL v17;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "metaContent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 += objc_msgSend(v13, "length");

  }
  v14 = self->_uncommittedItemsMemoryInBytes + v11 + self->_summedCommittedItemsMemoryInBytes;
  if (v14 < -[CESRSpeechProfileBuilder getGlobalItemsMemoryLimitInBytes](self, "getGlobalItemsMemoryLimitInBytes"))
  {
    -[NSMutableArray addObject:](self->_pendingItems, "addObject:", v8);
    isBoosted = self->_isBoosted;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](isBoosted, "addObject:", v16);

    self->_uncommittedItemsMemoryInBytes += v11;
  }
  v17 = (unint64_t)-[NSMutableArray count](self->_pendingItems, "count") < 0x32
     || -[CESRSpeechProfileBuilder _flushItemsWithError:](self, "_flushItemsWithError:", a5);

  return v17;
}

- (BOOL)addVocabularyItem:(id)a3 error:(id *)a4
{
  return -[CESRSpeechProfileBuilder addVocabularyItem:isBoosted:error:](self, "addVocabularyItem:isBoosted:error:", a3, 0, a4);
}

- (BOOL)_flushItemsWithError:(id *)a3
{
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  NSMutableArray *pendingItems;
  NSMutableArray *isBoosted;
  int v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[6];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_pendingItems, "count"))
    return 1;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1328;
  v36 = __Block_byref_object_dispose__1329;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1328;
  v30 = __Block_byref_object_dispose__1329;
  v31 = 0;
  v5 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __49__CESRSpeechProfileBuilder__flushItemsWithError___block_invoke;
  v25[3] = &unk_1E6734C40;
  v25[4] = &v32;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  pendingItems = self->_pendingItems;
  isBoosted = self->_isBoosted;
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __49__CESRSpeechProfileBuilder__flushItemsWithError___block_invoke_259;
  v24[3] = &unk_1E6734DD0;
  v24[4] = &v38;
  v24[5] = &v26;
  objc_msgSend(v7, "addVocabularyItems:isBoosted:completion:", pendingItems, isBoosted, v24);

  v10 = *((unsigned __int8 *)v39 + 24);
  if (a3 && !*((_BYTE *)v39 + 24))
  {
    v11 = (void *)v33[5];
    if (!v11)
      v11 = (void *)v27[5];
    *a3 = objc_retainAutorelease(v11);
    v10 = *((unsigned __int8 *)v39 + 24);
  }
  if (!v10)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = self->_pendingItems;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v42, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "content", (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "data");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          self->_uncommittedItemsMemoryInBytes -= objc_msgSend(v17, "length");

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v42, 16);
      }
      while (v13);
    }

  }
  -[NSMutableArray removeAllObjects](self->_pendingItems, "removeAllObjects", (_QWORD)v20);
  -[NSMutableArray removeAllObjects](self->_isBoosted, "removeAllObjects");
  v18 = *((_BYTE *)v39 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
  return v18;
}

- (BOOL)cancelCategoriesWithError:(id *)a3
{
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  int v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[6];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1328;
  v34 = __Block_byref_object_dispose__1329;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1328;
  v28 = __Block_byref_object_dispose__1329;
  v29 = 0;
  v5 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __54__CESRSpeechProfileBuilder_cancelCategoriesWithError___block_invoke;
  v23[3] = &unk_1E6734C40;
  v23[4] = &v30;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __54__CESRSpeechProfileBuilder_cancelCategoriesWithError___block_invoke_260;
  v22[3] = &unk_1E6734DD0;
  v22[4] = &v36;
  v22[5] = &v24;
  objc_msgSend(v7, "cancelWithCompletion:", v22);

  v8 = *((unsigned __int8 *)v37 + 24);
  if (a3 && !*((_BYTE *)v37 + 24))
  {
    v9 = (void *)v31[5];
    if (!v9)
      v9 = (void *)v25[5];
    *a3 = objc_retainAutorelease(v9);
    v8 = *((unsigned __int8 *)v37 + 24);
  }
  if (v8)
  {
    self->_uncommittedItemsMemoryInBytes = 0;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = self->_pendingItems;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v40, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "content", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "data");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          self->_uncommittedItemsMemoryInBytes -= objc_msgSend(v15, "length");

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v40, 16);
      }
      while (v11);
    }

  }
  -[NSMutableArray removeAllObjects](self->_pendingItems, "removeAllObjects", (_QWORD)v18);
  -[NSMutableArray removeAllObjects](self->_isBoosted, "removeAllObjects");
  v16 = *((_BYTE *)v37 + 24) != 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
  return v16;
}

- (BOOL)finishAndSaveProfile:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSXPCConnection *connection;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v5 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1328;
  v26 = __Block_byref_object_dispose__1329;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1328;
  v20 = __Block_byref_object_dispose__1329;
  v21 = 0;
  if (-[CESRSpeechProfileBuilder _flushItemsWithError:](self, "_flushItemsWithError:", a4))
  {
    connection = self->_connection;
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__CESRSpeechProfileBuilder_finishAndSaveProfile_error___block_invoke;
    v15[3] = &unk_1E6734C40;
    v15[4] = &v22;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __55__CESRSpeechProfileBuilder_finishAndSaveProfile_error___block_invoke_261;
    v14[3] = &unk_1E6734DD0;
    v14[4] = &v28;
    v14[5] = &v16;
    objc_msgSend(v9, "finishAndSaveProfile:completion:", v5, v14);

    v10 = *((unsigned __int8 *)v29 + 24);
    if (a4 && !*((_BYTE *)v29 + 24))
    {
      v11 = (void *)v23[5];
      if (!v11)
        v11 = (void *)v17[5];
      *a4 = objc_retainAutorelease(v11);
      v10 = *((unsigned __int8 *)v29 + 24);
    }
    if (v10)
    {
      if (v5)
        self->_summedCommittedItemsMemoryInBytes = 0;
      else
        self->_summedCommittedItemsMemoryInBytes += self->_uncommittedItemsMemoryInBytes;
      self->_uncommittedItemsMemoryInBytes = 0;
    }
    v12 = v10 != 0;
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v12;
}

- (unint64_t)getGlobalItemsMemoryLimitInBytes
{
  return 104857600;
}

- (NSURL)directory
{
  return self->_directory;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSString)userId
{
  return self->_userId;
}

- (int64_t)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_isBoosted, 0);
  objc_storeStrong((id *)&self->_pendingItems, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __55__CESRSpeechProfileBuilder_finishAndSaveProfile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[CESRSpeechProfileBuilder CESRErrorForXPCError:](CESRSpeechProfileBuilder, "CESRErrorForXPCError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315394;
      v9 = "-[CESRSpeechProfileBuilder finishAndSaveProfile:error:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __55__CESRSpeechProfileBuilder_finishAndSaveProfile_error___block_invoke_261(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[CESRSpeechProfileBuilder finishAndSaveProfile:error:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v9, 0x16u);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

void __54__CESRSpeechProfileBuilder_cancelCategoriesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[CESRSpeechProfileBuilder CESRErrorForXPCError:](CESRSpeechProfileBuilder, "CESRErrorForXPCError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315394;
      v9 = "-[CESRSpeechProfileBuilder cancelCategoriesWithError:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __54__CESRSpeechProfileBuilder_cancelCategoriesWithError___block_invoke_260(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[CESRSpeechProfileBuilder cancelCategoriesWithError:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v9, 0x16u);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

void __49__CESRSpeechProfileBuilder__flushItemsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[CESRSpeechProfileBuilder CESRErrorForXPCError:](CESRSpeechProfileBuilder, "CESRErrorForXPCError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315394;
      v9 = "-[CESRSpeechProfileBuilder _flushItemsWithError:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __49__CESRSpeechProfileBuilder__flushItemsWithError___block_invoke_259(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[CESRSpeechProfileBuilder _flushItemsWithError:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v9, 0x16u);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

void __74__CESRSpeechProfileBuilder_beginWithCategoriesAndVersions_bundleId_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[CESRSpeechProfileBuilder CESRErrorForXPCError:](CESRSpeechProfileBuilder, "CESRErrorForXPCError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315394;
      v9 = "-[CESRSpeechProfileBuilder beginWithCategoriesAndVersions:bundleId:error:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __74__CESRSpeechProfileBuilder_beginWithCategoriesAndVersions_bundleId_error___block_invoke_256(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[CESRSpeechProfileBuilder beginWithCategoriesAndVersions:bundleId:error:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v9, 0x16u);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

void __52__CESRSpeechProfileBuilder_getCodepathIdsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[CESRSpeechProfileBuilder CESRErrorForXPCError:](CESRSpeechProfileBuilder, "CESRErrorForXPCError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315394;
      v9 = "-[CESRSpeechProfileBuilder getCodepathIdsWithError:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __52__CESRSpeechProfileBuilder_getCodepathIdsWithError___block_invoke_254(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    v8 = a1 + 40;
    a3 = a2;
  }
  else
  {
    v9 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[CESRSpeechProfileBuilder getCodepathIdsWithError:]_block_invoke";
      v12 = 2112;
      v13 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v10, 0x16u);
    }
    v8 = a1 + 32;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 40), a3);

}

void __51__CESRSpeechProfileBuilder_removeCodepathId_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[CESRSpeechProfileBuilder CESRErrorForXPCError:](CESRSpeechProfileBuilder, "CESRErrorForXPCError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315394;
      v9 = "-[CESRSpeechProfileBuilder removeCodepathId:error:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __51__CESRSpeechProfileBuilder_removeCodepathId_error___block_invoke_252(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[CESRSpeechProfileBuilder removeCodepathId:error:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v10, 0x16u);
    }
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

void __48__CESRSpeechProfileBuilder_addCodepathId_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[CESRSpeechProfileBuilder CESRErrorForXPCError:](CESRSpeechProfileBuilder, "CESRErrorForXPCError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315394;
      v9 = "-[CESRSpeechProfileBuilder addCodepathId:error:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __48__CESRSpeechProfileBuilder_addCodepathId_error___block_invoke_251(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[CESRSpeechProfileBuilder addCodepathId:error:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v10, 0x16u);
    }
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

void __56__CESRSpeechProfileBuilder_getVersionForCategory_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[CESRSpeechProfileBuilder CESRErrorForXPCError:](CESRSpeechProfileBuilder, "CESRErrorForXPCError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315394;
      v9 = "-[CESRSpeechProfileBuilder getVersionForCategory:error:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __56__CESRSpeechProfileBuilder_getVersionForCategory_error___block_invoke_249(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[CESRSpeechProfileBuilder getVersionForCategory:error:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

void __96__CESRSpeechProfileBuilder__setProfileConfigWithLanguage_profileDir_userId_dataProtectionClass___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    +[CESRSpeechProfileBuilder CESRErrorForXPCError:](CESRSpeechProfileBuilder, "CESRErrorForXPCError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 136315394;
      v9 = "-[CESRSpeechProfileBuilder _setProfileConfigWithLanguage:profileDir:userId:dataProtectionClass:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t __96__CESRSpeechProfileBuilder__setProfileConfigWithLanguage_profileDir_userId_dataProtectionClass___block_invoke_247(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __42__CESRSpeechProfileBuilder__newConnection__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  id *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v3 = (void *)MEMORY[0x1E0CB3B58];
      v4 = v2;
      objc_msgSend(v3, "_UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315650;
      v8 = "-[CESRSpeechProfileBuilder _newConnection]_block_invoke";
      v9 = 2112;
      v10 = WeakRetained;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s %@ cancelling instance %@", (uint8_t *)&v7, 0x20u);

    }
    objc_msgSend(WeakRetained[1], "invalidate");
    v6 = WeakRetained[1];
    WeakRetained[1] = 0;

  }
}

+ (id)categoryToLimitHintMap
{
  _QWORD v3[24];
  _QWORD v4[25];

  v4[24] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("\\NT-contact");
  v3[1] = CFSTR("\\NT-action");
  v4[0] = &unk_1E6745018;
  v4[1] = &unk_1E6745030;
  v3[2] = CFSTR("\\NT-payaccount");
  v3[3] = CFSTR("\\NT-savedactivity");
  v4[2] = &unk_1E6745030;
  v4[3] = &unk_1E6745030;
  v3[4] = CFSTR("\\NT-notetitle");
  v3[5] = CFSTR("\\NT-notefolder");
  v4[4] = &unk_1E6745030;
  v4[5] = &unk_1E6745030;
  v3[6] = CFSTR("\\NT-phototag");
  v3[7] = CFSTR("\\NT-photoalbum");
  v4[6] = &unk_1E6745030;
  v4[7] = &unk_1E6745030;
  v3[8] = CFSTR("\\NT-house");
  v3[9] = CFSTR("\\NT-room");
  v4[8] = &unk_1E6745030;
  v4[9] = &unk_1E6745030;
  v3[10] = CFSTR("\\NT-zone");
  v3[11] = CFSTR("\\NT-group");
  v4[10] = &unk_1E6745030;
  v4[11] = &unk_1E6745030;
  v3[12] = CFSTR("\\NT-device");
  v3[13] = CFSTR("\\NT-scene");
  v4[12] = &unk_1E6745030;
  v4[13] = &unk_1E6745030;
  v3[14] = CFSTR("\\NT-playlist");
  v3[15] = CFSTR("\\NT-artist");
  v4[14] = &unk_1E6745048;
  v4[15] = &unk_1E6745048;
  v3[16] = CFSTR("\\NT-appname");
  v3[17] = CFSTR("\\NT-searchterm");
  v4[16] = &unk_1E6745030;
  v4[17] = &unk_1E6745030;
  v3[18] = CFSTR("\\NT-location");
  v3[19] = CFSTR("\\NT-calevent");
  v4[18] = &unk_1E6745030;
  v4[19] = &unk_1E6745030;
  v3[20] = CFSTR("\\NT-unknown");
  v3[21] = CFSTR("\\NT-entity");
  v4[20] = &unk_1E6745030;
  v4[21] = &unk_1E6745030;
  v3[22] = CFSTR("\\NT-correction");
  v3[23] = CFSTR("\\NT-appvocab");
  v4[22] = &unk_1E6745030;
  v4[23] = &unk_1E6745030;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 24);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)supportedCategories
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[CESRSpeechProfileBuilder categoryToFieldTypeMap](CESRSpeechProfileBuilder, "categoryToFieldTypeMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithArray:", v4);

  return v5;
}

+ (id)categoryToFieldTypeMap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[19];
  _QWORD v24[21];

  v24[19] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("\\NT-contact");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E67456E8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("\\NT-appcontact");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745700);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = CFSTR("\\NT-action");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745718);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = CFSTR("\\NT-payaccount");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745730);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  v23[4] = CFSTR("\\NT-savedactivity");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745748);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  v23[5] = CFSTR("\\NT-notetitle");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745760);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v17;
  v23[6] = CFSTR("\\NT-notefolder");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745778);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v16;
  v23[7] = CFSTR("\\NT-phototag");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745790);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v15;
  v23[8] = CFSTR("\\NT-photoalbum");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E67457A8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v14;
  v23[9] = CFSTR("\\NT-house");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E67457C0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v13;
  v23[10] = CFSTR("\\NT-room");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E67457D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v2;
  v23[11] = CFSTR("\\NT-zone");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E67457F0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v3;
  v23[12] = CFSTR("\\NT-scene");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745808);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[12] = v4;
  v23[13] = CFSTR("\\NT-group");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745820);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[13] = v5;
  v23[14] = CFSTR("\\NT-device");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745838);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[14] = v6;
  v23[15] = CFSTR("\\NT-artist");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745850);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[15] = v7;
  v23[16] = CFSTR("\\NT-playlist");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745868);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[16] = v8;
  v23[17] = CFSTR("\\NT-appname");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745880);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[17] = v9;
  v23[18] = CFSTR("\\NT-appvocab");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6745898);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[18] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)shouldOverrideDeferralForCategory:(id)a3 updateMode:(unint64_t)a4
{
  char v4;
  id v5;
  BOOL v6;
  char v8;

  v4 = a4;
  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("\\NT-contact")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("\\NT-appname")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("\\NT-appvocab")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("\\NT-device"));
    if ((v4 & 5) != 0)
      v6 = v8;
    else
      v6 = 0;
  }

  return v6;
}

+ (id)getSpeechLocaleForLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRUtilities languageStringForLocaleString:](CESRUtilities, "languageStringForLocaleString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1B5E32344](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v3;
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99DC8]);
    +[CESRUtilities localeStringForLanguageString:](CESRUtilities, "localeStringForLanguageString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithLocaleIdentifier:", v9);

  }
  return v7;
}

+ (id)speechProfilePathsForLocale:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "localeIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CESRUtilities languageStringForLocaleString:](CESRUtilities, "languageStringForLocaleString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[CESRUtilities speechProfilePathsWithLanguage:](CESRUtilities, "speechProfilePathsWithLanguage:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
          v13 = objc_alloc(MEMORY[0x1E0C99E98]);
          v14 = (void *)objc_msgSend(v13, "initFileURLWithPath:", v12, (_QWORD)v16);
          objc_msgSend(v6, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)deleteProfileAtDirectory:(id)a3 locale:(id)a4 userId:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v19;

  v9 = a5;
  v10 = a3;
  objc_msgSend(a4, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRUtilities languageStringForLocaleString:](CESRUtilities, "languageStringForLocaleString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[CESRSpeechProfileBuilder profileDirPathFromBasePath:language:userId:](CESRSpeechProfileBuilder, "profileDirPathFromBasePath:language:userId:", v13, v12, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v16 = objc_msgSend(v15, "removeItemAtPath:error:", v14, &v19);
  v17 = v19;

  if (a6 && v17)
    *a6 = objc_retainAutorelease(v17);

  return v16;
}

+ (void)deleteLegacyProfiles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AFLibraryDirectoryWithSubPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SpeechProfile"), "stringByAppendingString:", CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasPrefix:", v5, (_QWORD)v13))
        {
          objc_msgSend(v3, "stringByAppendingPathComponent:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "removeItemAtPath:error:", v12, 0);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

+ (id)profileDirPathFromBasePath:(id)a3 language:(id)a4 userId:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    SFUserIdHash();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SFUserIdHashToString();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("0000000000000000");
    if (v11)
      v13 = (__CFString *)v11;
    v14 = v13;

    objc_msgSend(v7, "stringByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "stringByAppendingPathComponent:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)profileFilePathFromBasePath:(id)a3 language:(id)a4 userId:(id)a5
{
  void *v5;
  void *v6;

  +[CESRSpeechProfileBuilder profileDirPathFromBasePath:language:userId:](CESRSpeechProfileBuilder, "profileDirPathFromBasePath:language:userId:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("SpeechProfile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)CESRErrorForXPCError:(id)a3
{
  id v3;
  id v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v4;
  v6 = CFSTR("Connection to the profile builder service was interrupted");
  if (v3)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB3388]);
    v7 = objc_msgSend(v3, "code");
    if (v7 == 4099)
      v8 = 1;
    else
      v8 = 2;
    if (v7 == 4099)
      v6 = CFSTR("Connection to the profile builder service was rejected");
  }
  else
  {
    v8 = 2;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CESRProfileErrorDomain"), v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
