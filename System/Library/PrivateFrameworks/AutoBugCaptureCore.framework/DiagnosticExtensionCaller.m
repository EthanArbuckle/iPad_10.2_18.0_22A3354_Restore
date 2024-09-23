@implementation DiagnosticExtensionCaller

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__DiagnosticExtensionCaller_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_pred_0 != -1)
    dispatch_once(&sharedInstance_pred_0, block);
  return (id)sharedInstance_sharedInstance_1;
}

void __43__DiagnosticExtensionCaller_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v1;

}

- (DiagnosticExtensionCaller)init
{
  DiagnosticExtensionCaller *v2;
  uint64_t v3;
  NSMutableArray *liveDEs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DiagnosticExtensionCaller;
  v2 = -[DiagnosticExtensionCaller init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    liveDEs = v2->_liveDEs;
    v2->_liveDEs = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)_getDEExtensionWithIdentifier:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__0;
    v20 = __Block_byref_object_dispose__0;
    v21 = 0;
    v4 = dispatch_semaphore_create(0);
    v5 = *MEMORY[0x1E0CB2A08];
    v22[0] = *MEMORY[0x1E0CB2A28];
    v22[1] = v5;
    v23[0] = CFSTR("com.apple.diagnosticextensions-service");
    v23[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB35D8];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__DiagnosticExtensionCaller__getDEExtensionWithIdentifier___block_invoke;
    v12[3] = &unk_1EA3B5360;
    v15 = &v16;
    v13 = v3;
    v8 = v4;
    v14 = v8;
    objc_msgSend(v7, "extensionsWithMatchingAttributes:completion:", v6, v12);
    v9 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v8, v9);
    v10 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __59__DiagnosticExtensionCaller__getDEExtensionWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v14 = objc_alloc(MEMORY[0x1E0D1D200]);
          v15 = (void *)objc_msgSend(v14, "initWithNSExtension:", v13, (_QWORD)v27);
          -[NSObject addObject:](v7, "addObject:", v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v10);
    }

    v16 = (id)-[NSObject sortedArrayUsingComparator:](v7, "sortedArrayUsingComparator:", &__block_literal_global_4);
    if (-[NSObject count](v7, "count"))
    {
      -[NSObject firstObject](v7, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      if ((unint64_t)-[NSObject count](v7, "count") < 2)
      {
LABEL_19:
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
        goto LABEL_20;
      }
      diagextLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = -[NSObject count](v7, "count");
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        v32 = v21;
        v33 = 2112;
        v34 = v22;
        v23 = "Found %ld DEs that matched with the identifier %@.";
        v24 = v20;
        v25 = 22;
LABEL_17:
        _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
      }
    }
    else
    {
      diagextLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v32 = v26;
        v23 = "Did not find DE that matched with the identifier %@.";
        v24 = v20;
        v25 = 12;
        goto LABEL_17;
      }
    }

    goto LABEL_19;
  }
  diagextLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = (uint64_t)v6;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEFAULT, "Error discovering extensions: %@", buf, 0xCu);
  }
LABEL_20:

}

uint64_t __59__DiagnosticExtensionCaller__getDEExtensionWithIdentifier___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "attachmentsName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentsName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (BOOL)_getAttachmentsFrom:(id)a3 forBundleID:(id)a4 withParameters:(id)a5 queue:(id)a6 reply:(id)a7
{
  id v12;
  NSObject *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  dispatch_time_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  qos_class_t v25;
  qos_class_t v26;
  dispatch_qos_class_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void (**v31)(_QWORD);
  NSObject *v32;
  void *v34;
  BOOL v35;
  id v36;
  id v37;
  _QWORD block[4];
  NSObject *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  DiagnosticExtensionCaller *v44;
  void (**v45)(_QWORD, _QWORD, _QWORD);
  _BYTE *v46;
  id v47;
  _QWORD handler[4];
  id v49;
  DiagnosticExtensionCaller *v50;
  void (**v51)(_QWORD, _QWORD, _QWORD);
  _BYTE *v52;
  id v53;
  id location;
  uint8_t v55[4];
  _BYTE v56[10];
  id v57;
  _BYTE buf[24];
  char v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v36 = a4;
  v37 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  if (v12 && v14)
  {
    -[DiagnosticExtensionCaller _getDEExtensionWithIdentifier:](self, "_getDEExtensionWithIdentifier:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
    v35 = v16 != 0;
    if (v16)
    {
      -[NSMutableArray addObject:](self->_liveDEs, "addObject:", v16);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v37);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v59 = 0;
      objc_initWeak(&location, v16);
      v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v13);
      v18 = MEMORY[0x1E0C809B0];
      if (v17)
      {
        v19 = dispatch_time(0, 900000000000);
        dispatch_source_set_timer(v17, v19, 0xFFFFFFFFFFFFFFFFLL, 0);
        v20 = v18;
        handler[0] = v18;
        handler[1] = 3221225472;
        handler[2] = __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke;
        handler[3] = &unk_1EA3B5388;
        objc_copyWeak(&v53, &location);
        v52 = buf;
        v49 = v12;
        v50 = self;
        v51 = v15;
        dispatch_source_set_event_handler(v17, handler);
        dispatch_resume(v17);

        objc_destroyWeak(&v53);
      }
      else
      {
        diagextLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        v20 = v18;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v55 = 0;
          _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_ERROR, "Failed to create a timer.", v55, 2u);
        }

      }
      v25 = qos_class_self();
      v26 = v25;
      if (v25 <= QOS_CLASS_DEFAULT)
        v27 = QOS_CLASS_DEFAULT;
      else
        v27 = v25;
      if (v25 <= 0x14)
      {
        diagextLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v55 = 67109376;
          *(_DWORD *)v56 = v27;
          *(_WORD *)&v56[4] = 1024;
          *(_DWORD *)&v56[6] = v26;
          _os_log_impl(&dword_1DBAE1000, v28, OS_LOG_TYPE_INFO, "Enforcing QoS %u over requested QoS %u to ensure timely launch of the diagnostic extension", v55, 0xEu);
        }

      }
      block[0] = v20;
      block[1] = 3221225472;
      block[2] = __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke_52;
      block[3] = &unk_1EA3B5400;
      v39 = v16;
      v23 = v34;
      v40 = v23;
      v29 = v17;
      v41 = v29;
      v42 = v13;
      objc_copyWeak(&v47, &location);
      v30 = v12;
      v43 = v30;
      v46 = buf;
      v44 = self;
      v45 = v15;
      v31 = (void (**)(_QWORD))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v27, 0, block);
      diagextLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v55 = 138412546;
        *(_QWORD *)v56 = v30;
        *(_WORD *)&v56[8] = 2112;
        v57 = v23;
        _os_log_impl(&dword_1DBAE1000, v32, OS_LOG_TYPE_INFO, "Calling DE %@ with parameters: %@", v55, 0x16u);
      }

      v31[2](v31);
      objc_destroyWeak(&v47);

      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      diagextLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_DEFAULT, "DECaller failing to find extension with name: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 45, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v15)[2](v15, 0, v23);
    }

  }
  else
  {
    diagextLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v21 = _Block_copy(v15);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_DEFAULT, "DECaller given a nil name (%@) or nil reply block (%p)", buf, 0x16u);

    }
    v35 = 0;
  }

  return v35;
}

void __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    diagextLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "Diagnostic Extension %@ timed out. Moving on.", (uint8_t *)&v7, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 60, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    if (WeakRetained)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", WeakRetained);
  }

}

void __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke_52(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke_2;
  v6[3] = &unk_1EA3B53D8;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_copyWeak(&v12, (id *)(a1 + 96));
  v9 = *(id *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 80);
  v4 = (id)v5;
  v11 = v5;
  v10 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v2, "attachmentsForParameters:andHandler:", v3, v6);

  objc_destroyWeak(&v12);
}

void __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  id v14;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
    dispatch_source_cancel(v4);
  v5 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke_3;
  block[3] = &unk_1EA3B53B0;
  objc_copyWeak(&v14, (id *)(a1 + 80));
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v8 = *(_OWORD *)(a1 + 64);
  v6 = (id)v8;
  v13 = v8;
  v12 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v14);
}

void __88__DiagnosticExtensionCaller__getAttachmentsFrom_forBundleID_withParameters_queue_reply___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  diagextLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v25 = v4;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEFAULT, "Diagnostic Extension %@ returned with attachments: %@", buf, 0x16u);
  }
  v18 = WeakRetained;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = (_QWORD *)a1;
  v7 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        objc_msgSend(v14, "attachmentType", v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isEqualToString:", CFSTR("DEAttachmentTypeItem")))
        {
          objc_msgSend(v6, "addObject:", v14);
        }
        else
        {
          diagextLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v10;
            _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_DEFAULT, "Attachment type (%@) is not DEAttachmentTypeItem", buf, 0xCu);
          }

        }
        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  v16 = *(_QWORD *)(v17[8] + 8);
  if (!*(_BYTE *)(v16 + 24))
  {
    *(_BYTE *)(v16 + 24) = 1;
    (*(void (**)(void))(v17[7] + 16))();
    if (v18)
      objc_msgSend(*(id *)(v17[6] + 16), "removeObject:", v18);
  }

}

+ (BOOL)getAttachmentsFrom:(id)a3 forBundleID:(id)a4 withParameters:(id)a5 queue:(id)a6 reply:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  uint8_t v21[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  +[DiagnosticExtensionCaller sharedInstance](DiagnosticExtensionCaller, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = objc_msgSend(v16, "_getAttachmentsFrom:forBundleID:withParameters:queue:reply:", v11, v12, v13, v14, v15);
  }
  else
  {
    diagextLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_ERROR, "DECaller: Failed to use DiagnosticExtensionCaller", v21, 2u);
    }

    v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveDEs, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
