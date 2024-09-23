@implementation NTKArgonExtractor

- (NSString)sourcePath
{
  return self->_sourcePath;
}

- (NSString)extractionPath
{
  return self->_extractionPath;
}

+ (BOOL)_createUnprotectedDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB2AD8];
    v13[0] = *MEMORY[0x1E0CB2AE0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, v10, a4);

  }
  return v8;
}

- (NTKArgonExtractor)initWithSourcePath:(id)a3 inProgressPath:(id)a4 extractionPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTKArgonExtractor *v11;
  uint64_t v12;
  NSString *extractionPath;
  NSString *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  NSString *inProgressPath;
  NSString *v20;
  BOOL v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  NSString *sourcePath;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *workQueue;
  uint64_t v29;
  NSMapTable *extractionCallbacksByDescriptor;
  uint64_t v31;
  NSMapTable *removalCallbacksByDescriptor;
  uint64_t v33;
  NSMutableOrderedSet *queuedKeyDescriptorOperations;
  id v36;
  id v37;
  objc_super v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)NTKArgonExtractor;
  v11 = -[NTKArgonExtractor init](&v38, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    extractionPath = v11->_extractionPath;
    v11->_extractionPath = (NSString *)v12;

    v14 = v11->_extractionPath;
    v37 = 0;
    v15 = +[NTKArgonExtractor _createUnprotectedDirectoryAtPath:error:](NTKArgonExtractor, "_createUnprotectedDirectoryAtPath:error:", v14, &v37);
    v16 = v37;
    if (!v15)
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[NTKArgonExtractor initWithSourcePath:inProgressPath:extractionPath:].cold.2();

    }
    v18 = objc_msgSend(v9, "copy");
    inProgressPath = v11->_inProgressPath;
    v11->_inProgressPath = (NSString *)v18;

    v20 = v11->_inProgressPath;
    v36 = 0;
    v21 = +[NTKArgonExtractor _createUnprotectedDirectoryAtPath:error:](NTKArgonExtractor, "_createUnprotectedDirectoryAtPath:error:", v20, &v36);
    v22 = v36;
    if (!v21)
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[NTKArgonExtractor initWithSourcePath:inProgressPath:extractionPath:].cold.1();

    }
    v24 = objc_msgSend(v8, "copy");
    sourcePath = v11->_sourcePath;
    v11->_sourcePath = (NSString *)v24;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create("com.apple.nanotimekit.facesupport.extractor", v26);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v27;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v29 = objc_claimAutoreleasedReturnValue();
    extractionCallbacksByDescriptor = v11->_extractionCallbacksByDescriptor;
    v11->_extractionCallbacksByDescriptor = (NSMapTable *)v29;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v31 = objc_claimAutoreleasedReturnValue();
    removalCallbacksByDescriptor = v11->_removalCallbacksByDescriptor;
    v11->_removalCallbacksByDescriptor = (NSMapTable *)v31;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v33 = objc_claimAutoreleasedReturnValue();
    queuedKeyDescriptorOperations = v11->_queuedKeyDescriptorOperations;
    v11->_queuedKeyDescriptorOperations = (NSMutableOrderedSet *)v33;

  }
  return v11;
}

- (void)removeExtractedKeyDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      -[NTKArgonExtractor workQueue](self, "workQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__NTKArgonExtractor_removeExtractedKeyDescriptor_completion___block_invoke;
      block[3] = &unk_1E6BCD820;
      block[4] = self;
      v11 = v6;
      v12 = v7;
      dispatch_async(v8, block);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKArgonExtractorErrorDomain"), 300, &unk_1E6CA8690);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);

    }
  }

}

uint64_t __61__NTKArgonExtractor_removeExtractedKeyDescriptor_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeKeyDescriptor:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_removeKeyDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NTKArgonExtractorOperation *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[NTKArgonExtractor workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[NTKArgonExtractor removalCallbacksByDescriptor](self, "removalCallbacksByDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v13);
  }
  v10 = _Block_copy(v6);
  objc_msgSend(v9, "addObject:", v10);

  v11 = -[NTKArgonExtractorOperation initWithKeyDescriptor:operationType:]([NTKArgonExtractorOperation alloc], "initWithKeyDescriptor:operationType:", v13, 2);
  -[NTKArgonExtractor queuedKeyDescriptorOperations](self, "queuedKeyDescriptorOperations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v11);

  -[NTKArgonExtractor _queue_performNextOperationIfNeeded](self, "_queue_performNextOperationIfNeeded");
}

- (void)extractUsingKeyDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      -[NTKArgonExtractor workQueue](self, "workQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__NTKArgonExtractor_extractUsingKeyDescriptor_completion___block_invoke;
      block[3] = &unk_1E6BCD820;
      block[4] = self;
      v11 = v6;
      v12 = v7;
      dispatch_async(v8, block);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKArgonExtractorErrorDomain"), 300, &unk_1E6CA86B8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);

    }
  }

}

uint64_t __58__NTKArgonExtractor_extractUsingKeyDescriptor_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_extractUsingKeyDescriptor:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_extractUsingKeyDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NTKArgonExtractorOperation *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[NTKArgonExtractor workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[NTKArgonExtractor extractionCallbacksByDescriptor](self, "extractionCallbacksByDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v13);
  }
  v10 = _Block_copy(v6);
  objc_msgSend(v9, "addObject:", v10);

  v11 = -[NTKArgonExtractorOperation initWithKeyDescriptor:operationType:]([NTKArgonExtractorOperation alloc], "initWithKeyDescriptor:operationType:", v13, 1);
  -[NTKArgonExtractor queuedKeyDescriptorOperations](self, "queuedKeyDescriptorOperations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v11);

  -[NTKArgonExtractor _queue_performNextOperationIfNeeded](self, "_queue_performNextOperationIfNeeded");
}

- (void)_queue_performNextOperationIfNeeded
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "ERROR: Unknown.", a5, a6, a7, a8, 0);
}

- (void)_queue_extractKeyDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NTKAppleEncryptedArchiveDiskExtractor *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  id v51[2];

  v4 = a3;
  -[NTKArgonExtractor workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[NTKArgonExtractor extractionCallbacksByDescriptor](self, "extractionCallbacksByDescriptor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKArgonExtractor sourcePath](self, "sourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(v4, "key");
  v12 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v11, "initWithBase64EncodedString:options:", v12, 0);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "UUIDString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_inProgressPath, "stringByAppendingPathComponent:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = 0;
  LOBYTE(v12) = +[NTKArgonExtractor _createUnprotectedDirectoryAtPath:error:](NTKArgonExtractor, "_createUnprotectedDirectoryAtPath:error:", v13, v51);
  v14 = v51[0];
  if ((v12 & 1) == 0)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[NTKArgonExtractor _queue_extractKeyDescriptor:].cold.2(v4, (uint64_t)v14, v15);

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  v50 = 0;
  v17 = [NTKAppleEncryptedArchiveDiskExtractor alloc];
  v18 = MEMORY[0x1E0C809B0];
  v19 = *MEMORY[0x1E0CB2AE0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke;
  v39[3] = &unk_1E6BCD870;
  v39[4] = self;
  v20 = v10;
  v40 = v20;
  v21 = v16;
  v41 = v21;
  v44 = &v45;
  v22 = v13;
  v42 = v22;
  v23 = v6;
  v43 = v23;
  v24 = -[NTKAppleEncryptedArchiveDiskExtractor initWithArchiveURL:symmetricKey:outputDirectoryURL:fileProtection:completion:](v17, "initWithArchiveURL:symmetricKey:outputDirectoryURL:fileProtection:completion:", v20, v36, v21, v19, v39);
  v25 = (void *)v46[5];
  v46[5] = v24;

  v26 = (void *)v46[5];
  v38 = 0;
  objc_msgSend(v26, "requiredDiskSpaceWithError:", &v38);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v38;
  if (v27)
  {
    objc_msgSend((id)v46[5], "outputDirectoryURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v18;
    v37[1] = 3221225472;
    v37[2] = __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_50;
    v37[3] = &unk_1E6BCD898;
    v37[4] = &v45;
    NTKRequestFreeSpaceOnVolume(v29, objc_msgSend(v27, "unsignedIntValue"), v37);

  }
  else
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[NTKArgonExtractor _queue_extractKeyDescriptor:].cold.1();

    objc_msgSend((id)v46[5], "resume");
  }

  _Block_object_dispose(&v45, 8);
}

void __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_2;
  v10[3] = &unk_1E6BCD848;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = v5;
  v18 = a2;
  v17 = *(_QWORD *)(a1 + 72);
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = v8;
  v16 = *(id *)(a1 + 64);
  v9 = v5;
  dispatch_async(v6, v10);

}

void __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  int AppBooleanValue;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  void *v43;
  __int128 v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v58 = v3;
    v59 = 2114;
    v60 = v4;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "Successfully extracted %{public}@ to %{public}@", buf, 0x16u);
  }

  v5 = *(id *)(a1 + 48);
  if (*(_BYTE *)(a1 + 88))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v55 = v5;
    v7 = objc_msgSend(v6, "verifyExtractedContentsWithError:", &v55);
    v8 = v55;

    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ArgonBugReportShowBugReportAlwaysAfterExtraction"), CFSTR("com.apple.NanoTimeKit.face"), 0);
    if (v7)
      v10 = AppBooleanValue == 1;
    else
      v10 = 1;
    if (v10)
    {
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_2_cold_2();

      NTKArgonExtractorReportExtractionFailure((uint64_t)"Argon verification failed", *(void **)(a1 + 32), v8);
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_2_cold_1();

    NTKArgonExtractorReportExtractionFailure((uint64_t)"Argon extraction failed", *(void **)(a1 + 32), v5);
    v7 = 0;
    v8 = v5;
  }
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v58 = v14;
    _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "Successfully verified extracted bundle at %{public}@", buf, 0xCu);
  }

  if (*(_BYTE *)(a1 + 88))
    v15 = v7;
  else
    v15 = 0;
  v16 = 0x1E0CB3000uLL;
  if (v15 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentsOfDirectoryAtPath:error:", *(_QWORD *)(a1 + 56), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v18;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)v52;
      *(_QWORD *)&v20 = 138543874;
      v44 = v20;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v52 != v22)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 56), "stringByAppendingPathComponent:", v24, v44);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 64), "extractionPath");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringByAppendingPathComponent:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0;
          v29 = objc_msgSend(v28, "moveItemAtPath:toPath:error:", v25, v27, &v50);
          v30 = v50;

          _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if ((v29 & 1) != 0)
          {
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v58 = v25;
              v59 = 2114;
              v60 = v27;
              _os_log_impl(&dword_1B72A3000, v32, OS_LOG_TYPE_DEFAULT, "Successfully moved bundle %{public}@ -> %{public}@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v44;
            v58 = v25;
            v59 = 2114;
            v60 = v27;
            v61 = 2114;
            v62 = v30;
            _os_log_fault_impl(&dword_1B72A3000, v32, OS_LOG_TYPE_FAULT, "Couldn't move %{public}@ to %{public}@ - %{public}@", buf, 0x20u);
          }

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      }
      while (v21);
    }

    objc_msgSend(obj, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "extractionPath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringByAppendingPathComponent:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    v16 = 0x1E0CB3000;
  }
  else
  {
    v35 = 0;
  }
  objc_msgSend(*(id *)(v16 + 1568), "defaultManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "removeItemAtPath:error:", *(_QWORD *)(a1 + 56), 0);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v37 = *(id *)(a1 + 72);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(v37);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j) + 16))();
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v39);
  }

  objc_msgSend(*(id *)(a1 + 72), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 64), "setPerformingOperation:", 0);
  objc_msgSend(*(id *)(a1 + 64), "_queue_performNextOperationIfNeeded");
  v42 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v43 = *(void **)(v42 + 40);
  *(_QWORD *)(v42 + 40) = 0;

}

void __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_50(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (a3)
    {
      if (v11)
      {
        v13 = 138477827;
        v14 = v7;
        v12 = "Purged stale data to ensure free space was available. At least %{private}@ bytes are now available.";
LABEL_9:
        _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
      }
    }
    else if (v11)
    {
      v13 = 138477827;
      v14 = v7;
      v12 = "Enough space available to attempt extraction. At least %{private}@ bytes are available.";
      goto LABEL_9;
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_50_cold_1(a3, (uint64_t)v8, v10);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "resume");
}

- (void)_queue_removeKeyDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void (**v12)(void *, void *, id);
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD aBlock[4];
  id v20;
  NTKArgonExtractor *v21;

  v4 = a3;
  -[NTKArgonExtractor workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[NTKArgonExtractor removalCallbacksByDescriptor](self, "removalCallbacksByDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKArgonExtractor extractionPath](self, "extractionPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__NTKArgonExtractor__queue_removeKeyDescriptor___block_invoke;
  aBlock[3] = &unk_1E6BCD8C0;
  v11 = v7;
  v20 = v11;
  v21 = self;
  v12 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v14 = objc_msgSend(v13, "removeItemAtPath:error:", v10, &v18);
  v15 = v18;

  if ((v14 & 1) != 0)
  {
    v16 = v10;
    v17 = 0;
  }
  else
  {
    v16 = 0;
    v17 = v15;
  }
  v12[2](v12, v16, v17);

}

void __48__NTKArgonExtractor__queue_removeKeyDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB3388];
    v22[0] = CFSTR("description");
    v22[1] = v9;
    v23[0] = CFSTR("filesystem operation failed");
    v23[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("NTKArgonExtractorErrorDomain"), 301, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *(id *)(a1 + 32);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", (_QWORD)v17);
  objc_msgSend(*(id *)(a1 + 40), "setPerformingOperation:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_queue_performNextOperationIfNeeded");

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NTKArgonExtractorOperation)performingOperation
{
  return self->_performingOperation;
}

- (void)setPerformingOperation:(id)a3
{
  objc_storeStrong((id *)&self->_performingOperation, a3);
}

- (NSMutableOrderedSet)queuedKeyDescriptorOperations
{
  return self->_queuedKeyDescriptorOperations;
}

- (NSMapTable)extractionCallbacksByDescriptor
{
  return self->_extractionCallbacksByDescriptor;
}

- (NSMapTable)removalCallbacksByDescriptor
{
  return self->_removalCallbacksByDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removalCallbacksByDescriptor, 0);
  objc_storeStrong((id *)&self->_extractionCallbacksByDescriptor, 0);
  objc_storeStrong((id *)&self->_queuedKeyDescriptorOperations, 0);
  objc_storeStrong((id *)&self->_performingOperation, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sourcePath, 0);
  objc_storeStrong((id *)&self->_extractionPath, 0);
  objc_storeStrong((id *)&self->_inProgressPath, 0);
}

- (void)initWithSourcePath:inProgressPath:extractionPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Error creating progress directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithSourcePath:inProgressPath:extractionPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Error creating extraction directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_extractKeyDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0(&dword_1B72A3000, v0, v1, "Failed to check for free space: %{public}@. Will continue, since space purging is best effort.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_extractKeyDescriptor:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  v8 = a2;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, v6, "Couldn't make temporary path to extract %@ - %@", v7);

}

void __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_1B72A3000, v0, v1, "Argon extraction failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_1B72A3000, v0, v1, "Argon verification failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__NTKArgonExtractor__queue_extractKeyDescriptor___block_invoke_50_cold_1(char a1, uint64_t a2, NSObject *a3)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = "YES";
  if ((a1 & 1) == 0)
    v3 = "NO";
  v4 = 136315394;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, a3, (uint64_t)a3, "Failed to ensure free space available (purge attempted: %s): %{public}@. Will continue, since space purging is best effort.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

@end
