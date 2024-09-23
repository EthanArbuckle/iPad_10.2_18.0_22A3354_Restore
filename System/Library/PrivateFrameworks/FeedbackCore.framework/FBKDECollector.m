@implementation FBKDECollector

- (FBKDECollector)initWithRequirements:(id)a3 forDevice:(id)a4 filerForm:(id)a5 extensionsFromURL:(id)a6 listener:(id)a7 shouldGetSessionStatus:(BOOL)a8 shouldCheckDeferredLogs:(BOOL)a9 attachmentDescriptors:(id)a10
{
  id v15;
  id v16;
  id v17;
  FBKDECollector *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  _BOOL4 v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  BOOL v41;
  objc_super v42;
  uint8_t buf[4];
  _BYTE v44[14];
  __int16 v45;
  void *v46;
  uint64_t v47;

  v31 = a8;
  v47 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v33 = a6;
  v34 = a7;
  v32 = a10;
  v42.receiver = self;
  v42.super_class = (Class)FBKDECollector;
  v18 = -[FBKDECollector init](&v42, sel_init);
  if (v18)
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v17, "filerFormID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "intValue");
      objc_msgSend(v16, "publicLogDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v44 = v21;
      *(_WORD *)&v44[4] = 2114;
      *(_QWORD *)&v44[6] = v22;
      _os_log_impl(&dword_21D9A9000, v19, OS_LOG_TYPE_INFO, "Initializing DE collector for filerForm [%i] device [%{public}@]", buf, 0x12u);

    }
    objc_storeStrong((id *)&v18->_attachmentDescriptors, a10);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 2);
    -[FBKDECollector set_attachments:](v18, "set_attachments:", v23);

    objc_storeStrong((id *)&v18->_device, a4);
    -[FBKDECollector setForm:](v18, "setForm:", v17);
    -[FBKDECollector setLoadingBugSession:](v18, "setLoadingBugSession:", 1);
    v18->_alreadyHandledURL = 0;
    -[FBKDECollector setListener:](v18, "setListener:", v34);
    +[FBKDEDHelper bugSessionIDForForm:device:](FBKDEDHelper, "bugSessionIDForForm:device:", v17, v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDECollector setBugSessionIdentifier:](v18, "setBugSessionIdentifier:", v24);

    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "valueForKeyPath:", CFSTR("name"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "filerFormID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "intValue");
      objc_msgSend(v16, "publicLogDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v44 = v26;
      *(_WORD *)&v44[8] = 1024;
      *(_DWORD *)&v44[10] = v28;
      v45 = 2114;
      v46 = v29;
      _os_log_impl(&dword_21D9A9000, v25, OS_LOG_TYPE_DEFAULT, "init DE collector. Reqs: %{public}@ Form: [%i] Device: [%{public}@] ", buf, 0x1Cu);

    }
    objc_initWeak((id *)buf, v18);
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __155__FBKDECollector_initWithRequirements_forDevice_filerForm_extensionsFromURL_listener_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors___block_invoke;
    v35[3] = &unk_24E158610;
    v41 = a9;
    objc_copyWeak(&v40, (id *)buf);
    v36 = v16;
    v37 = v17;
    v38 = v15;
    v39 = v33;
    +[FBKDEDHelper getSessionForForm:device:shouldGetSessionStatus:completion:](FBKDEDHelper, "getSessionForForm:device:shouldGetSessionStatus:completion:", v37, v36, v31, v35);

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
  }

  return v18;
}

void __155__FBKDECollector_initWithRequirements_forDevice_filerForm_extensionsFromURL_listener_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  id WeakRetained;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v17;
    _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_DEFAULT, "Bug session started for session [%{public}@]", buf, 0xCu);

  }
  if (v12 && *(_BYTE *)(a1 + 72))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __155__FBKDECollector_initWithRequirements_forDevice_filerForm_extensionsFromURL_listener_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors___block_invoke_11;
    v22[3] = &unk_24E1585E8;
    v23 = v14;
    objc_copyWeak(&v30, (id *)(a1 + 64));
    v24 = v13;
    v25 = *(id *)(a1 + 32);
    v26 = *(id *)(a1 + 40);
    v27 = *(id *)(a1 + 48);
    v28 = v15;
    v29 = *(id *)(a1 + 56);
    objc_msgSend(v12, "getStateWithCompletion:", v22);

    objc_destroyWeak(&v30);
    WeakRetained = v23;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v20 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    v21 = (void *)objc_opt_new();
    objc_msgSend(WeakRetained, "finishInitializationWithCollected:device:error:form:ongoing:deferred:requirements:sessionCapabilities:urlExtensions:", v13, v20, v11, v19, v14, v21, *(_QWORD *)(a1 + 48), v15, *(_QWORD *)(a1 + 56));

  }
}

void __155__FBKDECollector_initWithRequirements_forDevice_filerForm_extensionsFromURL_listener_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors___block_invoke_11(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __155__FBKDECollector_initWithRequirements_forDevice_filerForm_extensionsFromURL_listener_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors___block_invoke_2;
  v8[3] = &unk_24E1585C0;
  v17[1] = a2;
  v9 = a1[4];
  objc_copyWeak(v17, a1 + 11);
  v10 = a1[5];
  v11 = a1[6];
  v12 = v6;
  v13 = a1[7];
  v14 = a1[8];
  v15 = a1[9];
  v16 = a1[10];
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

  objc_destroyWeak(v17);
}

void __155__FBKDECollector_initWithRequirements_forDevice_filerForm_extensionsFromURL_listener_shouldGetSessionStatus_shouldCheckDeferredLogs_attachmentDescriptors___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;
  id v5;

  if (*(_QWORD *)(a1 + 104) == 3)
  {
    v5 = (id)objc_opt_new();
    v2 = *(id *)(a1 + 32);
  }
  else
  {
    v5 = *(id *)(a1 + 32);
    v2 = (id)objc_opt_new();
  }
  v3 = v2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  objc_msgSend(WeakRetained, "finishInitializationWithCollected:device:error:form:ongoing:deferred:requirements:sessionCapabilities:urlExtensions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v5, v3, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));

}

- (void)finishInitializationWithCollected:(id)a3 device:(id)a4 error:(id)a5 form:(id)a6 ongoing:(id)a7 deferred:(id)a8 requirements:(id)a9 sessionCapabilities:(id)a10 urlExtensions:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;

  v16 = a3;
  v33 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __134__FBKDECollector_finishInitializationWithCollected_device_error_form_ongoing_deferred_requirements_sessionCapabilities_urlExtensions___block_invoke;
  block[3] = &unk_24E158638;
  block[4] = self;
  v36 = v22;
  v37 = v18;
  v38 = v33;
  v39 = v21;
  v40 = v17;
  v41 = v16;
  v42 = v19;
  v43 = v20;
  v44 = v23;
  v24 = v23;
  v25 = v20;
  v26 = v19;
  v27 = v16;
  v28 = v17;
  v29 = v21;
  v30 = v33;
  v31 = v18;
  v32 = v22;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __134__FBKDECollector_finishInitializationWithCollected_device_error_form_ongoing_deferred_requirements_sessionCapabilities_urlExtensions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setSessionCapabilities:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setLoadingBugSession:", 0);
  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "filerFormID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "intValue");
    objc_msgSend(*(id *)(a1 + 56), "publicLogDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 67109378;
    v23 = v4;
    v24 = 2114;
    v25 = v5;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_DEFAULT, "finished getting bug session for filerForm [%i] device [%{public}@]", (uint8_t *)&v22, 0x12u);

  }
  objc_msgSend(*(id *)(a1 + 32), "listener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "popPendingRequirements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if (!v7)
    v8 = *(void **)(a1 + 64);
  v9 = v8;
  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "filerFormID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");
    objc_msgSend(*(id *)(a1 + 56), "publicLogDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 67109634;
    v23 = v12;
    v24 = 2114;
    v25 = v13;
    v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "finished getting bug session for filerForm [%i] device [%{public}@] with requirements [%{public}@]", (uint8_t *)&v22, 0x1Cu);

  }
  if (*(_QWORD *)(a1 + 72))
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __134__FBKDECollector_finishInitializationWithCollected_device_error_form_ongoing_deferred_requirements_sessionCapabilities_urlExtensions___block_invoke_cold_1(a1, (id *)(a1 + 72), v14);

    objc_msgSend(*(id *)(a1 + 32), "_updateAttachmentsWithRequirements:alreadyCollectedGroups:alreadyStartedCollections:deferredCollections:", v9, 0, 0, 0);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 80), "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 80));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    if (objc_msgSend(*(id *)(a1 + 88), "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 88));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    if (objc_msgSend(*(id *)(a1 + 96), "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 96));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "_updateAttachmentsWithRequirements:alreadyCollectedGroups:alreadyStartedCollections:deferredCollections:", v9, v15, v16, v17);
    v18 = *(_QWORD *)(a1 + 104);
    if (v18)
      objc_msgSend(*(id *)(a1 + 32), "processURLExtensions:withMatcherPredicates:", v18, v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "listener");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(void **)(a1 + 32);
  objc_msgSend(v20, "attachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "attachmentProvider:didFinishLoadingWithAttachments:error:", v20, v21, *(_QWORD *)(a1 + 72));

}

- (id)gatherFilesForExtension:(id)a3 answers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  FBKAttachment *v9;
  void *v10;
  void *v11;
  void *v12;
  FBKAttachment *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FBKDECollector gatherFilesForExtension:answers:].cold.1(v8);

  v9 = [FBKAttachment alloc];
  -[FBKDECollector identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDECollector device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FBKAttachment initWithCollectorIdentifier:deviceUUID:](v9, "initWithCollectorIdentifier:deviceUUID:", v10, v12);

  -[FBKAttachment setExtension:](v13, "setExtension:", v7);
  -[FBKAttachment setAttachmentType:](v13, "setAttachmentType:", 5);
  -[FBKDECollector attachmentDescriptors](self, "attachmentDescriptors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKAttachment descriptorForAttachment:given:](FBKAttachment, "descriptorForAttachment:given:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKAttachment setLocalizedAttachmentInfo:](v13, "setLocalizedAttachmentInfo:", v16);

  -[FBKDECollector _addAttachment:](self, "_addAttachment:", v13);
  -[FBKDECollector gatherFilesForAttachment:answers:](self, "gatherFilesForAttachment:answers:", v13, v6);

  return v13;
}

- (id)bugSession
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE2CA50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDECollector bugSessionIdentifier](self, "bugSessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)gatherFilesForAttachment:(id)a3 answers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
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
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "extension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FBKDECollector gatherFilesForAttachment:answers:].cold.1(v6, v11);

    -[FBKDECollector _updateAttachment:withState:](self, "_updateAttachment:withState:", v6, 5);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKDECollector bugSession](self, "bugSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v12;
      v39 = 2114;
      v40 = v14;
      _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_DEFAULT, "Gathering attachment [%{public}@] for [%{public}@]", buf, 0x16u);

    }
    -[FBKDECollector _updateAttachment:withState:](self, "_updateAttachment:withState:", v6, 1);
    if (v7)
    {
      v15 = objc_msgSend(v7, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;
    -[FBKDECollector form](self, "form");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[FBKDECollector form](self, "form");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "filerFormType") == 0;

      if (v19)
      {
        -[FBKDECollector form](self, "form");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "answersDictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR(":de_parameter"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR(":de_parameter"));

      }
    }
    v23 = (void *)objc_opt_class();
    objc_msgSend(v6, "extension");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDECollector bugSession](self, "bugSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlExtension");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "parameters");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "parametersForGatheringExtension:answers:session:givenParameters:", v24, v16, v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "extension");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v30;
      v39 = 2114;
      v40 = v28;
      _os_log_impl(&dword_21D9A9000, v29, OS_LOG_TYPE_DEFAULT, "Gathering DE [%{public}@] with parameters [%{public}@]", buf, 0x16u);

    }
    -[FBKDECollector bugSession](self, "bugSession");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extension");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __51__FBKDECollector_gatherFilesForAttachment_answers___block_invoke;
    v33[3] = &unk_24E158660;
    objc_copyWeak(&v35, &location);
    v34 = v6;
    objc_msgSend(v31, "startDiagnosticExtension:parameters:completion:", v32, v28, v33);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);

  }
}

void __51__FBKDECollector_gatherFilesForAttachment_answers___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_didCollectGroup:forAttachment:", v4, *(_QWORD *)(a1 + 32));

}

+ (id)parametersForGatheringExtension:(id)a3 answers:(id)a4 session:(id)a5 givenParameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _DWORD v37[2];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    objc_msgSend(a1, "parametersFromAnswers:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  }
  objc_msgSend(MEMORY[0x24BE2CA38], "DEDExtensionHostAppKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Feedback Assistant"), v16);

  objc_msgSend(MEMORY[0x24BE2CA38], "DEDAddEmptyFile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v17);

  if (v13)
  {
    objc_msgSend(v15, "addEntriesFromDictionary:", v13);
  }
  else
  {
    objc_msgSend(v10, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.DiagnosticExtensions.sysdiagnose"));

    if (v19)
    {
      objc_msgSend(v12, "deviceIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v12, "deviceIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[FBKGroupedDevice currentGroupedDevice](FBKGroupedDevice, "currentGroupedDevice");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v21, "isEqualToString:", v23) ^ 1;

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, CFSTR("shouldCreateTarBall"));

        +[FBKLog attachHandle](FBKLog, "attachHandle");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v37[0] = 67109120;
          v37[1] = v24;
          _os_log_impl(&dword_21D9A9000, v26, OS_LOG_TYPE_INFO, "sysdiagnose shouldCreateTarBall [%i]", (uint8_t *)v37, 8u);
        }

        objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("shouldDisplayTarBall"));
      }
      else
      {
        +[FBKLog attachHandle](FBKLog, "attachHandle");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          +[FBKDECollector parametersForGatheringExtension:answers:session:givenParameters:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

      }
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v15);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (id)requirements
{
  void *v2;
  void *v3;

  -[FBKDECollector _attachments](self, "_attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ded_flatMapWithBlock:", &__block_literal_global_20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __30__FBKDECollector_requirements__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requirement");
}

- (void)updateRequirements:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  FBKDECollector *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[FBKDECollector loadingBugSession](self, "loadingBugSession"))
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "update requirements came in while loading session on [%{public}@] will defer update", (uint8_t *)&v6, 0xCu);
    }

  }
  else
  {
    -[FBKDECollector _updateAttachmentsWithRequirements:alreadyCollectedGroups:alreadyStartedCollections:deferredCollections:](self, "_updateAttachmentsWithRequirements:alreadyCollectedGroups:alreadyStartedCollections:deferredCollections:", v4, 0, 0, 0);
  }

}

- (BOOL)hasFilePromises
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[FBKDECollector _attachments](self, "_attachments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v7, "hasFiles") & 1) != 0 || (objc_msgSend(v7, "isCollecting") & 1) != 0)
        {
          v8 = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (BOOL)hasUnmetRequirements
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FBKDECollector _attachments](self, "_attachments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v6, "state") != 8)
        {
          v7 = (objc_msgSend(v6, "hasFiles") & 1) != 0 ? 1 : objc_msgSend(v6, "isCollecting");
          objc_msgSend(v6, "requirement");
          v8 = objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = (void *)v8;
            objc_msgSend(v6, "requirement");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "isAdditional") | v7;

            if (v11 != 1)
            {
              LOBYTE(v3) = 1;
              goto LABEL_16;
            }
          }
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_16:

  return v3;
}

- (void)removeAllAttachments
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[FBKDECollector attachments](self, "attachments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[FBKDECollector removeAttachment:](self, "removeAttachment:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)cancelCollection:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;

  v4 = a3;
  -[FBKDECollector _attachments](self, "_attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    objc_msgSend(v4, "extension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[FBKDECollector bugSession](self, "bugSession");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "extension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject cancelDiagnosticExtension:](v8, "cancelDiagnosticExtension:", v9);

    }
    else
    {
      +[FBKLog attachHandle](FBKLog, "attachHandle");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[FBKDECollector cancelCollection:].cold.1(v8, v11, v12, v13, v14, v15, v16, v17);
    }

    if (objc_msgSend(v4, "hasFiles") && objc_msgSend(v4, "hasGroup"))
      objc_msgSend(v4, "remove");
    objc_msgSend(v4, "requirement");
    v18 = objc_claimAutoreleasedReturnValue();
    v10 = v18;
    if (v18 && (-[NSObject isAdditional](v18, "isAdditional") & 1) == 0)
      -[FBKDECollector _updateAttachment:withState:](self, "_updateAttachment:withState:", v4, 0);
    else
      -[FBKDECollector _removeAttachment:](self, "_removeAttachment:", v4);
  }
  else
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FBKDECollector cancelCollection:].cold.2();
  }

}

- (void)removeAttachment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  FBKDECollector *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 138543618;
    v13 = v4;
    v14 = 2114;
    v15 = self;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_INFO, "Will remove [%{public}@] in [%{public}@]", (uint8_t *)&v12, 0x16u);
  }

  -[FBKDECollector _attachments](self, "_attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = v4;
      v14 = 2114;
      v15 = self;
      _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "removing [%{public}@] in [%{public}@]", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(v4, "remove");
    objc_msgSend(v4, "requirement");
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (v10 && (-[NSObject isAdditional](v10, "isAdditional") & 1) == 0)
    {
      objc_msgSend(v4, "setUrlExtension:", 0);
      objc_msgSend(v4, "setState:", 0);
      -[FBKDECollector listener](self, "listener");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attachmentProvider:didUpdateAttachment:", self, v4);

    }
    else
    {
      -[FBKDECollector _removeAttachment:](self, "_removeAttachment:", v4);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[FBKDECollector removeAttachment:].cold.1();
  }

}

- (id)platform
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[FBKDECollector device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[FBKDECollector device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "platform");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (id)*MEMORY[0x24BE2CA00];
  }

  return v6;
}

- (id)attachments
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[FBKDECollector _attachments](self, "_attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)fetchTextDataOnMatcherPredicates:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[FBKDECollector sessionCapabilities](self, "sessionCapabilities");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        -[FBKDECollector sessionCapabilities](self, "sessionCapabilities"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v9,
        !v11))
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FBKDECollector fetchTextDataOnMatcherPredicates:completion:].cold.1(v15, v16, v17);

    goto LABEL_11;
  }
  -[FBKDECollector sessionCapabilities](self, "sessionCapabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", *MEMORY[0x24BE2C9B0]);

  if ((v13 & 1) == 0)
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[FBKDECollector bugSession](self, "bugSession");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v20;
      v23 = 2082;
      v24 = "-[FBKDECollector fetchTextDataOnMatcherPredicates:completion:]";
      _os_log_impl(&dword_21D9A9000, v18, OS_LOG_TYPE_DEFAULT, "Session [%{public}@] does not have the required capability. Cannot [%{public}s]", (uint8_t *)&v21, 0x16u);

    }
LABEL_11:
    v7[2](v7);
    goto LABEL_12;
  }
  -[FBKDECollector bugSession](self, "bugSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKDEDHelper fetchTextDataOnMatcherPredicates:fromSession:completion:](FBKDEDHelper, "fetchTextDataOnMatcherPredicates:fromSession:completion:", v6, v14, v7);

LABEL_12:
}

- (void)_addAttachment:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKDECollector _attachments](self, "_attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[FBKDECollector bugSessionIdentifier](self, "bugSessionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v4;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "DE Collector did add attachment [%{public}@] for collector [%{public}@]", (uint8_t *)&v9, 0x16u);

  }
  -[FBKDECollector listener](self, "listener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attachmentProvider:didAddAttachment:", self, v4);

}

- (void)_updateAttachment:(id)a3 withState:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "setState:", a4);
  -[FBKDECollector _attachments](self, "_attachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if ((v8 & 1) == 0)
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FBKDECollector _updateAttachment:withState:].cold.1();

  }
  -[FBKDECollector listener](self, "listener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachmentProvider:didUpdateAttachment:", self, v6);

}

- (void)_removeAttachment:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FBKDECollector _attachments](self, "_attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[FBKDECollector listener](self, "listener");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentProvider:didRemoveAttachment:", self, v4);

}

- (void)_updateAttachmentsWithRequirements:(id)a3 alreadyCollectedGroups:(id)a4 alreadyStartedCollections:(id)a5 deferredCollections:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  char v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint8_t v87[128];
  uint8_t buf[4];
  void *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithSet:", v10);
  else
    v14 = objc_opt_new();
  v15 = (void *)v14;
  if (v12)
  {
    -[FBKDECollector processOngoingDECollections:withRequirements:isDeferred:](self, "processOngoingDECollections:withRequirements:isDeferred:", v12, v14, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  if (v13)
  {
    -[FBKDECollector processOngoingDECollections:withRequirements:isDeferred:](self, "processOngoingDECollections:withRequirements:isDeferred:", v13, v15, 1);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }
  v67 = v10;
  v65 = v12;
  v66 = v11;
  v64 = v13;
  if (v11)
  {
    -[FBKDECollector processAlreadyCollectedGroups:withRequirements:](self, "processAlreadyCollectedGroups:withRequirements:", v11, v15);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v18;
  }
  objc_msgSend(v15, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  -[FBKDECollector _attachments](self, "_attachments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v83 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        objc_msgSend(v26, "requirement");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v20, "containsObject:", v27);

        if (v28)
        {
          objc_msgSend(v26, "requirement");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeObject:", v29);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    }
    while (v23);
  }

  -[FBKDECollector _attachments](self, "_attachments");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = MEMORY[0x24BDAC760];
  v80[1] = 3221225472;
  v80[2] = __122__FBKDECollector__updateAttachmentsWithRequirements_alreadyCollectedGroups_alreadyStartedCollections_deferredCollections___block_invoke;
  v80[3] = &unk_24E158408;
  v63 = v15;
  v81 = v63;
  objc_msgSend(v30, "ded_selectItemsPassingTest:", v80);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKDECollector bugSession](self, "bugSession");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    v61 = v31;
    -[FBKDECollector bugSession](self, "bugSession");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "knownExtensions");
    v33 = objc_claimAutoreleasedReturnValue();

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v34 = v20;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v77;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v77 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
          objc_msgSend(v39, "deBundleIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v33, "objectForKeyedSubscript:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            -[FBKDECollector attachmentFromRequirement:withExtension:](self, "attachmentFromRequirement:withExtension:", v39, v41);
            v42 = objc_claimAutoreleasedReturnValue();
            if (v42)
              -[FBKDECollector _addAttachment:](self, "_addAttachment:", v42);
          }
          else
          {
            +[FBKLog attachHandle](FBKLog, "attachHandle");
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v39, "name");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v89 = v43;
              _os_log_impl(&dword_21D9A9000, v42, OS_LOG_TYPE_INFO, "requirements updated, no extension found for requirement [%{public}@]", buf, 0xCu);

            }
          }

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
      }
      while (v36);
    }

    v31 = v61;
  }
  else
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v33, OS_LOG_TYPE_DEFAULT, "requirements updated, no bug session found. Did not build Attachments", buf, 2u);
    }
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v44 = v31;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v73;
    do
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v73 != v47)
          objc_enumerationMutation(v44);
        -[FBKDECollector _removeAttachment:](self, "_removeAttachment:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * k));
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
    }
    while (v46);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  -[FBKDECollector _attachments](self, "_attachments");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v69;
    do
    {
      for (m = 0; m != v51; ++m)
      {
        if (*(_QWORD *)v69 != v52)
          objc_enumerationMutation(v49);
        v54 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * m);
        objc_msgSend(v54, "requirement");
        v55 = objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          v56 = (void *)v55;
          objc_msgSend(v54, "requirement");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v67, "containsObject:", v57);

          if ((v58 & 1) == 0)
          {
            +[FBKLog attachHandle](FBKLog, "attachHandle");
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v54, "displayName");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v89 = v60;
              _os_log_impl(&dword_21D9A9000, v59, OS_LOG_TYPE_INFO, "Attachment [%{public}@] is not longer required", buf, 0xCu);

            }
            objc_msgSend(v54, "setRequirement:", 0);
          }
        }
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    }
    while (v51);
  }

}

BOOL __122__FBKDECollector__updateAttachmentsWithRequirements_alreadyCollectedGroups_alreadyStartedCollections_deferredCollections___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "state") == 8 || (objc_msgSend(v3, "isCollecting") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "requirement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_msgSend(v5, "containsObject:", v6) & 1) == 0
      && (objc_msgSend(v3, "hasFiles") & 1) == 0
      && objc_msgSend(v3, "attachmentType") == 1;

  }
  return v4;
}

- (id)attachmentFromRequirement:(id)a3 withExtension:(id)a4 urlExtension:(id)a5
{
  id v8;
  id v9;
  id v10;
  FBKAttachment *v11;
  void *v12;
  void *v13;
  void *v14;
  FBKAttachment *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  FBKAttachment *v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = [FBKAttachment alloc];
  -[FBKDECollector bugSessionIdentifier](self, "bugSessionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDECollector device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[FBKAttachment initWithRequirement:urlExtension:collectorIdentifier:deviceUUID:](v11, "initWithRequirement:urlExtension:collectorIdentifier:deviceUUID:", v10, v9, v12, v14);

  if (-[FBKAttachment attachmentType](v15, "attachmentType") == 1)
  {
    -[FBKAttachment setExtension:](v15, "setExtension:", v8);
    -[FBKDECollector attachmentDescriptors](self, "attachmentDescriptors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKAttachment descriptorForAttachment:given:](FBKAttachment, "descriptorForAttachment:given:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKAttachment setLocalizedAttachmentInfo:](v15, "setLocalizedAttachmentInfo:", v18);

    -[FBKAttachment extension](v15, "extension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      -[FBKAttachment setState:](v15, "setState:", 5);
      +[FBKLog attachHandle](FBKLog, "attachHandle");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[FBKDECollector attachmentFromRequirement:withExtension:urlExtension:].cold.1(v15, v20);

    }
  }
  else if (!-[FBKAttachment attachmentType](v15, "attachmentType"))
  {

    v15 = 0;
  }
  v21 = v15;

  return v21;
}

- (id)attachmentFromRequirement:(id)a3 withExtension:(id)a4
{
  return -[FBKDECollector attachmentFromRequirement:withExtension:urlExtension:](self, "attachmentFromRequirement:withExtension:urlExtension:", a3, a4, 0);
}

- (id)processOngoingDECollections:(id)a3 withRequirements:(id)a4 isDeferred:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  __int128 v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  FBKAttachment *v18;
  void *v19;
  void *v20;
  void *v21;
  FBKAttachment *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  FBKAttachment *v30;
  __int128 v32;
  const __CFString *v33;
  id obj;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  _QWORD v39[4];
  FBKAttachment *v40;
  id v41;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const __CFString *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v5 = a5;
  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v38 = a4;
  v35 = (id)objc_msgSend(v38, "mutableCopy");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v9)
  {
    v11 = CFSTR("ongoing");
    if (v5)
      v11 = CFSTR("deferred");
    v33 = v11;
    v12 = 8;
    if (!v5)
      v12 = 1;
    v36 = v12;
    v37 = *(_QWORD *)v44;
    *(_QWORD *)&v10 = 138543618;
    v32 = v10;
    v13 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v37)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        +[FBKLog attachHandle](FBKLog, "attachHandle", v32);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v32;
          v48 = v33;
          v49 = 2114;
          v50 = v17;
          _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_DEFAULT, "will create attachment for [%{public}@] collection [%{public}@]", buf, 0x16u);

        }
        v18 = [FBKAttachment alloc];
        -[FBKDECollector bugSessionIdentifier](self, "bugSessionIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKDECollector device](self, "device");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[FBKAttachment initWithCollectorIdentifier:deviceUUID:](v18, "initWithCollectorIdentifier:deviceUUID:", v19, v21);

        -[FBKAttachment setExtension:](v22, "setExtension:", v15);
        -[FBKAttachment setAttachmentType:](v22, "setAttachmentType:", 1);
        -[FBKAttachment setState:](v22, "setState:", v36);
        -[FBKDECollector attachmentDescriptors](self, "attachmentDescriptors");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[FBKAttachment descriptorForAttachment:given:](FBKAttachment, "descriptorForAttachment:given:", v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKAttachment setLocalizedAttachmentInfo:](v22, "setLocalizedAttachmentInfo:", v25);

        v42[0] = v13;
        v42[1] = 3221225472;
        v42[2] = __74__FBKDECollector_processOngoingDECollections_withRequirements_isDeferred___block_invoke;
        v42[3] = &unk_24E1586A8;
        v42[4] = v15;
        objc_msgSend(v38, "objectsPassingTest:", v42);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "anyObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          -[FBKAttachment setRequirement:](v22, "setRequirement:", v27);
          objc_msgSend(v35, "removeObject:", v27);
        }
        -[FBKDECollector _addAttachment:](self, "_addAttachment:", v22);
        v28 = objc_initWeak((id *)buf, self);
        -[FBKDECollector bugSession](self, "bugSession");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v13;
        v39[1] = 3221225472;
        v39[2] = __74__FBKDECollector_processOngoingDECollections_withRequirements_isDeferred___block_invoke_2;
        v39[3] = &unk_24E158660;
        objc_copyWeak(&v41, (id *)buf);
        v30 = v22;
        v40 = v30;
        objc_msgSend(v29, "attachCompletionHandlerForOngoingOperation:handler:", v15, v39);

        objc_destroyWeak(&v41);
        objc_destroyWeak((id *)buf);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v9);
  }

  return v35;
}

uint64_t __74__FBKDECollector_processOngoingDECollections_withRequirements_isDeferred___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "deBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __74__FBKDECollector_processOngoingDECollections_withRequirements_isDeferred___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__FBKDECollector_processOngoingDECollections_withRequirements_isDeferred___block_invoke_3;
  block[3] = &unk_24E1586D0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __74__FBKDECollector_processOngoingDECollections_withRequirements_isDeferred___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didCollectGroup:forAttachment:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)processAlreadyCollectedGroups:(id)a3 withRequirements:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  FBKAttachment *v14;
  void *v15;
  void *v16;
  void *v17;
  FBKAttachment *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  FBKAttachment *v27;
  void *v28;
  void *v29;
  id v31;
  id obj;
  uint64_t v33;
  _QWORD v34[4];
  FBKAttachment *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v31 = a4;
  v7 = (void *)objc_msgSend(v31, "mutableCopy");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v8)
  {
    v9 = v8;
    v33 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        +[FBKLog attachHandle](FBKLog, "attachHandle");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "rootURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v13;
          _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_DEFAULT, "will create attachment for already collected group [%{public}@]", buf, 0xCu);

        }
        v14 = [FBKAttachment alloc];
        -[FBKDECollector bugSessionIdentifier](self, "bugSessionIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKDECollector device](self, "device");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[FBKAttachment initWithCollectorIdentifier:deviceUUID:](v14, "initWithCollectorIdentifier:deviceUUID:", v15, v17);

        -[FBKAttachment setGroup:](v18, "setGroup:", v11);
        -[FBKAttachment setAttachmentType:](v18, "setAttachmentType:", 1);
        -[FBKAttachment setState:](v18, "setState:", 2);
        -[FBKDECollector bugSession](self, "bugSession");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "knownExtensions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "extensionID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKAttachment setExtension:](v18, "setExtension:", v22);

        -[FBKDECollector attachmentDescriptors](self, "attachmentDescriptors");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[FBKAttachment descriptorForAttachment:given:](FBKAttachment, "descriptorForAttachment:given:", v18, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[FBKAttachment setLocalizedAttachmentInfo:](v18, "setLocalizedAttachmentInfo:", v25);

        -[FBKAttachment extension](v18, "extension");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __65__FBKDECollector_processAlreadyCollectedGroups_withRequirements___block_invoke;
          v34[3] = &unk_24E1586A8;
          v27 = v18;
          v35 = v27;
          objc_msgSend(v7, "objectsPassingTest:", v34);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "anyObject");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            -[FBKAttachment setRequirement:](v27, "setRequirement:", v29);
            objc_msgSend(v7, "removeObject:", v29);
          }

        }
        -[FBKDECollector _addAttachment:](self, "_addAttachment:", v18);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v9);
  }

  return v31;
}

uint64_t __65__FBKDECollector_processAlreadyCollectedGroups_withRequirements___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "deBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

- (void)processURLExtensions:(id)a3 withMatcherPredicates:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  id obj;
  uint64_t v28;
  FBKDECollector *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  _BYTE v42[16];
  _BYTE v43[16];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __61__FBKDECollector_processURLExtensions_withMatcherPredicates___block_invoke;
  v40[3] = &unk_24E1586F8;
  v26 = v6;
  v41 = v26;
  objc_msgSend(a3, "ded_selectItemsPassingTest:", v40);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v37;
    v29 = self;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(obj);
        v31 = v7;
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v7);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        -[FBKDECollector _attachments](self, "_attachments");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v33;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v33 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_msgSend(v8, "extensionIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "extension");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v15, "isEqualToString:", v17);

              if (v18)
              {
                objc_msgSend(v14, "setUrlExtension:", v8);
                self = v29;
                goto LABEL_18;
              }
            }
            v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
            if (v11)
              continue;
            break;
          }
        }

        self = v29;
        -[FBKDECollector bugSession](v29, "bugSession");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[FBKDECollector bugSession](v29, "bugSession");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "knownExtensions");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "extensionIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", v22);
          v9 = objc_claimAutoreleasedReturnValue();

          -[FBKDECollector attachmentFromRequirement:withExtension:urlExtension:](v29, "attachmentFromRequirement:withExtension:urlExtension:", 0, v9, v8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            -[FBKDECollector _addAttachment:](v29, "_addAttachment:", v23);
          }
          else
          {
            +[FBKLog attachHandle](FBKLog, "attachHandle");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              -[FBKDECollector processURLExtensions:withMatcherPredicates:].cold.2((uint64_t)v43, (uint64_t)v8);

          }
          v24 = v31;

        }
        else
        {
          +[FBKLog attachHandle](FBKLog, "attachHandle");
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            -[FBKDECollector processURLExtensions:withMatcherPredicates:].cold.1((uint64_t)v42, (uint64_t)v29);
LABEL_18:
          v24 = v31;
        }

        v7 = v24 + 1;
      }
      while (v7 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v30);
  }

}

uint64_t __61__FBKDECollector_processURLExtensions_withMatcherPredicates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "deBundleIdentifier", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "extensionIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if (v11)
        {
          objc_msgSend(v8, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setName:", v12);

          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)_didCollectGroup:(id)a3 forAttachment:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  FBKDECollector *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v9;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "collected: %{public}@", buf, 0xCu);

  }
  +[FBKLog attachHandle](FBKLog, "attachHandle");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "extension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 138544130;
    v22 = v12;
    v23 = 2114;
    v24 = v6;
    v25 = 2048;
    v26 = v14;
    v27 = 2114;
    v28 = self;
    _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_INFO, "Collected DE [%{public}@] with group [%{public}@] item count [%lu] from [%{public}@]", buf, 0x2Au);

  }
  -[FBKDECollector attachments](self, "attachments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v7);

  if ((v16 & 1) != 0)
  {
    objc_msgSend(v7, "setGroup:", v6);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __49__FBKDECollector__didCollectGroup_forAttachment___block_invoke;
    v19[3] = &unk_24E157020;
    v19[4] = self;
    v20 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v19);

  }
  else
  {
    +[FBKLog attachHandle](FBKLog, "attachHandle");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v18;
      _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_INFO, "[%{public}@] does not belong to DE Collector. Ignoring collected Attachment Group", buf, 0xCu);

    }
  }

}

uint64_t __49__FBKDECollector__didCollectGroup_forAttachment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAttachment:withState:", *(_QWORD *)(a1 + 40), 2);
}

+ (id)parametersFromAnswers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR(":area"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR(":area"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bundleIDsFromAreas:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE2CA38], "DEDExtensionAttachmentsParamBundleIDKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v9);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR(":de_parameter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR(":de_parameter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR(":de_parameter"));

  }
  return v5;
}

+ (id)bundleIDsFromAreas:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!bundleIDsFromAreas__map)
  {
    bundleIDsFromAreas__map = (uint64_t)&unk_24E18D248;

  }
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "componentsSeparatedByString:", CFSTR(":"), (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v10, "count") >= 2)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)bundleIDsFromAreas__map, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend((id)bundleIDsFromAreas__map, "objectForKeyedSubscript:", v11);
            v13 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_15;
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  v13 = v4;
LABEL_15:

  return v13;
}

- (id)collectorError
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleseed.FeedbackAssistant.collector"), -1, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[FBKDECollector identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FBKDECollector;
  -[FBKDECollector description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDECollector form](self, "form");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filerFormID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");
  -[FBKDECollector device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "publicLogDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%d - %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (FBKGroupedDevice)device
{
  return self->_device;
}

- (NSArray)attachmentDescriptors
{
  return self->_attachmentDescriptors;
}

- (void)setAttachmentDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentDescriptors, a3);
}

- (NSString)bugSessionIdentifier
{
  return self->_bugSessionIdentifier;
}

- (void)setBugSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bugSessionIdentifier, a3);
}

- (NSMutableSet)_attachments
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_attachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (FBKFilerForm)form
{
  return (FBKFilerForm *)objc_loadWeakRetained((id *)&self->_form);
}

- (void)setForm:(id)a3
{
  objc_storeWeak((id *)&self->_form, a3);
}

- (FBKAttachmentListenerDelegate)listener
{
  return (FBKAttachmentListenerDelegate *)objc_loadWeakRetained((id *)&self->_listener);
}

- (void)setListener:(id)a3
{
  objc_storeWeak((id *)&self->_listener, a3);
}

- (NSSet)sessionCapabilities
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionCapabilities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)loadingBugSession
{
  return self->_loadingBugSession;
}

- (void)setLoadingBugSession:(BOOL)a3
{
  self->_loadingBugSession = a3;
}

- (BOOL)alreadyHandledURL
{
  return self->_alreadyHandledURL;
}

- (void)setAlreadyHandledURL:(BOOL)a3
{
  self->_alreadyHandledURL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionCapabilities, 0);
  objc_destroyWeak((id *)&self->_listener);
  objc_destroyWeak((id *)&self->_form);
  objc_storeStrong((id *)&self->__attachments, 0);
  objc_storeStrong((id *)&self->_bugSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_attachmentDescriptors, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __134__FBKDECollector_finishInitializationWithCollected_device_error_form_ongoing_deferred_requirements_sessionCapabilities_urlExtensions___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 48), "filerFormID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");
  objc_msgSend(*a2, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109378;
  v8[1] = v6;
  v9 = 2114;
  v10 = v7;
  _os_log_error_impl(&dword_21D9A9000, a3, OS_LOG_TYPE_ERROR, "Could not get bug session for form [%i] Error [%{public}@]", (uint8_t *)v8, 0x12u);

}

- (void)gatherFilesForExtension:(os_log_t)log answers:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[FBKDECollector gatherFilesForExtension:answers:]";
  _os_log_debug_impl(&dword_21D9A9000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_7();
}

- (void)gatherFilesForAttachment:(void *)a1 answers:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "no extension found for attachment %{public}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_1();
}

+ (void)parametersForGatheringExtension:(uint64_t)a3 answers:(uint64_t)a4 session:(uint64_t)a5 givenParameters:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21D9A9000, a1, a3, "bug session has nil device identifier", a5, a6, a7, a8, 0);
}

- (void)cancelCollection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21D9A9000, a1, a3, "cancelling an operation not backed by an extension, this is not supported.", a5, a6, a7, a8, 0);
}

- (void)cancelCollection:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_21D9A9000, v0, v1, "[%{public}@] cannot cancel [%{public}@]: Attachment not found");
  OUTLINED_FUNCTION_7();
}

- (void)removeAttachment:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_21D9A9000, v0, v1, "[%{public}@] cannot remove [%{public}@]: Attachment not found");
  OUTLINED_FUNCTION_7();
}

- (void)fetchTextDataOnMatcherPredicates:(uint64_t)a3 completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136446210;
  v4 = "-[FBKDECollector fetchTextDataOnMatcherPredicates:completion:]";
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a1, a3, "No capabilities found. Cannot [%{public}s]", (uint8_t *)&v3);
  OUTLINED_FUNCTION_7();
}

- (void)_updateAttachment:withState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_21D9A9000, v0, v1, "Tried to update attachment [%{public}@] that does not belong to collector [%{public}@]");
  OUTLINED_FUNCTION_7();
}

- (void)attachmentFromRequirement:(void *)a1 withExtension:(NSObject *)a2 urlExtension:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "Can't gather extension for attachment [%{public}@].", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)processURLExtensions:(uint64_t)a1 withMatcherPredicates:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v4;
  OUTLINED_FUNCTION_4_0(&dword_21D9A9000, v5, v6, "No bug session found while processing URL extensions for collector [%{public}@].");

  OUTLINED_FUNCTION_8();
}

- (void)processURLExtensions:(uint64_t)a1 withMatcherPredicates:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "extensionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v4;
  OUTLINED_FUNCTION_4_0(&dword_21D9A9000, v5, v6, "Could not create attachment for extension [%{public}@] from URLExtension");

  OUTLINED_FUNCTION_8();
}

@end
