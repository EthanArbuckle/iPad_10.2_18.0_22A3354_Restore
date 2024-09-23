@implementation CalDAVMultiMoveWithFallbackTaskGroup

- (CalDAVMultiMoveWithFallbackTaskGroup)initWithSourceURLs:(id)a3 destinationURL:(id)a4 overwrite:(BOOL)a5 useFallback:(BOOL)a6 sourceEntityDataPayloads:(id)a7 sourceEntityDataContentTypes:(id)a8 sourceEntityETags:(id)a9 sourceEntityScheduleTags:(id)a10 accountInfoProvider:(id)a11 taskManager:(id)a12 isAutoScheduleSupported:(BOOL)a13
{
  _BOOL8 v14;
  _BOOL8 v15;
  CalDAVMultiMoveWithFallbackTaskGroup *v19;
  CalDAVMultiMoveWithFallbackTaskGroup *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *destinationEntityScheduleTags;
  id v27;
  objc_super v28;

  v14 = a6;
  v15 = a5;
  v27 = a10;
  v28.receiver = self;
  v28.super_class = (Class)CalDAVMultiMoveWithFallbackTaskGroup;
  v19 = -[CoreDAVMultiMoveWithFallbackTaskGroup initWithSourceURLs:destinationURL:overwrite:useFallback:sourceEntityDataPayloads:sourceEntityDataContentTypes:sourceEntityETags:accountInfoProvider:taskManager:](&v28, sel_initWithSourceURLs_destinationURL_overwrite_useFallback_sourceEntityDataPayloads_sourceEntityDataContentTypes_sourceEntityETags_accountInfoProvider_taskManager_, a3, a4, v15, v14, a7, a8, a9, a11, a12);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sourceEntityScheduleTags, a10);
    v20->_isAutoScheduleSupported = a13;
    v21 = (void *)MEMORY[0x24BDBCED8];
    -[CoreDAVMultiMoveWithFallbackTaskGroup sourceURLs](v20, "sourceURLs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
    v23 = objc_claimAutoreleasedReturnValue();
    destinationEntityScheduleTags = v20->_destinationEntityScheduleTags;
    v20->_destinationEntityScheduleTags = (NSMutableDictionary *)v23;

  }
  return v20;
}

- (void)_setTagsForDestinationEntityAtURL:(id)a3 fromTaskResponseHeaders:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  id WeakRetained;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(void);
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  CalDAVMultiMoveWithFallbackTaskGroup *v34;
  void (**v35)(void);
  id v36;
  id v37;
  id location;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v29 = (void (**)(void))a5;
  -[CoreDAVMultiMoveWithFallbackTaskGroup filenameFromURL:](self, "filenameFromURL:", v8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVMultiMoveWithFallbackTaskGroup _eTagFromTaskResponseHeaders:](self, "_eTagFromTaskResponseHeaders:", v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CDVObjectForKeyCaseInsensitive:", CFSTR("schedule-tag"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]);
  WeakRetained = objc_loadWeakRetained(v12);
  objc_msgSend(v11, "logHandleForAccountInfoProvider:", WeakRetained);
  v14 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v27;
      _os_log_impl(&dword_2096EB000, v14, OS_LOG_TYPE_INFO, "[multi-move] ~ Response included etag %{public}@, but we're ignoring it and nilling etag because we got a schedule-tag.", buf, 0xCu);
    }

    -[CalDAVMultiMoveWithFallbackTaskGroup destinationEntityScheduleTags](self, "destinationEntityScheduleTags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v10, v28);

    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_loadWeakRetained(v12);
    objc_msgSend(v16, "logHandleForAccountInfoProvider:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2096EB000, v18, OS_LOG_TYPE_INFO, "[multi-move] ~ Finished setting tags for moved CalDAV entity", buf, 2u);
    }

    if (v29)
      v29[2]();
  }
  else
  {
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2096EB000, v14, OS_LOG_TYPE_INFO, "[multi-move] ~ No schedule-tag returned! PROPFINDing for the etag/schedule-tag...", buf, 2u);
    }

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 2);
    v20 = objc_alloc(MEMORY[0x24BE1AB20]);
    v21 = (void *)objc_msgSend(v20, "initWithNameSpace:name:parseClass:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE58], objc_opt_class());
    objc_msgSend(v19, "addObject:", v21);
    if (-[CalDAVMultiMoveWithFallbackTaskGroup isAutoScheduleSupported](self, "isAutoScheduleSupported"))
    {
      v22 = objc_alloc(MEMORY[0x24BE1AB20]);
      v23 = (void *)objc_msgSend(v22, "initWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ACF8], CFSTR("schedule-tag"), objc_opt_class());
      objc_msgSend(v19, "addObject:", v23);

    }
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1ABA0]), "initWithPropertiesToFind:atURL:withDepth:", v19, v8, 2);
    -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAccountInfoProvider:", v25);

    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v24);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __114__CalDAVMultiMoveWithFallbackTaskGroup__setTagsForDestinationEntityAtURL_fromTaskResponseHeaders_completionBlock___block_invoke;
    v30[3] = &unk_24C1FB768;
    objc_copyWeak(&v36, (id *)buf);
    objc_copyWeak(&v37, &location);
    v31 = v27;
    v32 = 0;
    v33 = v28;
    v34 = self;
    v35 = v29;
    objc_msgSend(v24, "setCompletionBlock:", v30);
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC90]), "addObject:", v24);
    -[CoreDAVTaskGroup taskManager](self, "taskManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "submitQueuedCoreDAVTask:", v24);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

  }
}

uint64_t __114__CalDAVMultiMoveWithFallbackTaskGroup__setTagsForDestinationEntityAtURL_fromTaskResponseHeaders_completionBlock___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t result;
  uint8_t v12[16];

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "outstandingTasks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(v4, "removeObject:", v5);

  v6 = objc_loadWeakRetained(v2);
  v7 = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(v6, "_completedPropFindTask:intermediateETag:intermediateScheduleTag:destinationFilename:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 56) + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(v8, "logHandleForAccountInfoProvider:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2096EB000, v10, OS_LOG_TYPE_INFO, "[multi-move] ~ Finished setting tags for moved CalDAV entity", v12, 2u);
  }

  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_completedPropFindTask:(id)a3 intermediateETag:(id)a4 intermediateScheduleTag:(id)a5 destinationFilename:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id *v12;
  id WeakRetained;
  NSObject *v14;
  char *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  id v53;
  NSObject *v54;
  id v55;
  NSObject *v56;
  const char *v57;
  NSObject *v58;
  os_log_type_t v59;
  uint32_t v60;
  int v61;
  id v62;
  id v63;
  char *v64;
  void *v65;
  id v66;
  uint8_t buf[4];
  const char *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v66 = a6;
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]);
  WeakRetained = objc_loadWeakRetained(v12);
  objc_msgSend(v11, "logHandleForAccountInfoProvider:", WeakRetained);
  v14 = objc_claimAutoreleasedReturnValue();

  if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v68 = "-[CalDAVMultiMoveWithFallbackTaskGroup _completedPropFindTask:intermediateETag:intermediateScheduleTag:destinationFilename:]";
    _os_log_impl(&dword_2096EB000, v14, OS_LOG_TYPE_INFO, "[multi-move] ~ %{public}s", buf, 0xCu);
  }

  objc_msgSend(v9, "error");
  v15 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_loadWeakRetained(v12);
  objc_msgSend(v16, "logHandleForAccountInfoProvider:", v17);
  v18 = objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2096EB000, v18, OS_LOG_TYPE_DEFAULT, "[multi-move] ~ Error during PROPFIND.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained(v12);
    objc_msgSend(v19, "logHandleForAccountInfoProvider:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = v66;
    if (v21 && os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v15;
      _os_log_impl(&dword_2096EB000, v21, OS_LOG_TYPE_DEFAULT, "[multi-move] ~ %@;", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_loadWeakRetained(v12);
    objc_msgSend(v23, "logHandleForAccountInfoProvider:", v24);
    v25 = objc_claimAutoreleasedReturnValue();

    if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2096EB000, v25, OS_LOG_TYPE_DEFAULT, "[multi-move] ~ Returing ETag and ScheduleTag of nil", buf, 2u);
    }
    goto LABEL_75;
  }
  if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2096EB000, v18, OS_LOG_TYPE_INFO, "[multi-move] ~ PROPFIND success", buf, 2u);
  }

  objc_msgSend(v9, "responseHeaders");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = v10;
  if (!v23)
  {
    v25 = 0;
LABEL_45:
    v48 = CFSTR("No ETag found by PROPFIND");
    goto LABEL_46;
  }
  objc_msgSend(v9, "responseHeaders");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "CDVObjectForKeyCaseInsensitive:", *MEMORY[0x24BE1AA80]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_loadWeakRetained(v12);
    objc_msgSend(v27, "logHandleForAccountInfoProvider:", v28);
    v29 = objc_claimAutoreleasedReturnValue();

    if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v68 = (const char *)v23;
      _os_log_impl(&dword_2096EB000, v29, OS_LOG_TYPE_INFO, "[multi-move] ~ found etag node: %{public}@", buf, 0xCu);
    }

    v30 = v23;
    v10 = v65;
  }
  objc_msgSend(v9, "responseHeaders");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "CDVObjectForKeyCaseInsensitive:", CFSTR("schedule-tag"));
  v25 = objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_loadWeakRetained(v12);
    objc_msgSend(v32, "logHandleForAccountInfoProvider:", v33);
    v34 = objc_claimAutoreleasedReturnValue();

    if (v34 && os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v68 = (const char *)v25;
      _os_log_impl(&dword_2096EB000, v34, OS_LOG_TYPE_INFO, "[multi-move] ~ found scheduleTag node: %{public}@", buf, 0xCu);
    }

    v35 = v25;
    v10 = v65;
  }

  if (!v23)
    goto LABEL_45;
  if (!v10 || objc_msgSend(v23, "isEqualToString:", v10))
  {
    -[CoreDAVMultiMoveWithFallbackTaskGroup sourceEntityETags](self, "sourceEntityETags");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v66;
    objc_msgSend(v36, "objectForKey:", v66);
    v64 = (char *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v23, "length") && !v25)
      goto LABEL_74;
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_loadWeakRetained(v12);
    objc_msgSend(v37, "logHandleForAccountInfoProvider:", v38);
    v39 = objc_claimAutoreleasedReturnValue();

    if (v39 && os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2096EB000, v39, OS_LOG_TYPE_INFO, "[multi-move] ~ Setting etag return value.", buf, 2u);
    }

    -[CoreDAVMultiMoveWithFallbackTaskGroup destinationEntityETags](self, "destinationEntityETags");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v66;
    objc_msgSend(v40, "setObject:forKey:", v23, v66);

    if (v25)
    {
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_loadWeakRetained(v12);
      objc_msgSend(v41, "logHandleForAccountInfoProvider:", v42);
      v43 = objc_claimAutoreleasedReturnValue();

      if (v43 && os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2096EB000, v43, OS_LOG_TYPE_INFO, "[multi-move] ~ We got a scheduleTag, so ignoring etag", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_loadWeakRetained(v12);
      objc_msgSend(v44, "logHandleForAccountInfoProvider:", v45);
      v46 = objc_claimAutoreleasedReturnValue();

      if (v46 && os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2096EB000, v46, OS_LOG_TYPE_INFO, "[multi-move] ~ Setting scheduleTag return value.", buf, 2u);
      }

      -[CalDAVMultiMoveWithFallbackTaskGroup destinationEntityScheduleTags](self, "destinationEntityScheduleTags");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v66;
      objc_msgSend(v47, "setObject:forKey:", v25, v66);
      v10 = v65;
      goto LABEL_73;
    }
    if (objc_msgSend(v64, "isEqualToString:", v23))
    {
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_loadWeakRetained(v12);
      objc_msgSend(v47, "logHandleForAccountInfoProvider:", v55);
      v56 = objc_claimAutoreleasedReturnValue();

      v10 = v65;
      if (!v56 || !os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        goto LABEL_72;
      *(_DWORD *)buf = 138543362;
      v68 = v64;
      v57 = "[multi-move] ~ Resulting etag is unchanged from original: %{public}@";
      v58 = v56;
      v59 = OS_LOG_TYPE_INFO;
      v60 = 12;
LABEL_71:
      _os_log_impl(&dword_2096EB000, v58, v59, v57, buf, v60);
LABEL_72:

LABEL_73:
LABEL_74:

      goto LABEL_75;
    }
    v10 = v65;
    if (v65)
    {
      v61 = objc_msgSend(v65, "isEqualToString:", v23);
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_loadWeakRetained(v12);
      objc_msgSend(v47, "logHandleForAccountInfoProvider:", v62);
      v56 = objc_claimAutoreleasedReturnValue();

      if (!v61)
      {
        v22 = v66;
        if (!v56 || !os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          goto LABEL_72;
        *(_WORD *)buf = 0;
        v57 = "[multi-move] After MOVE and PROPFIND: something is wrong, there's no new etag, there's no schedule tag";
        v58 = v56;
        v59 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_70;
      }
      v22 = v66;
      if (!v56 || !os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        goto LABEL_72;
      *(_WORD *)buf = 0;
      v57 = "[multi-move] ~ New etag differs from old etag -- MOVE returned an ETag and PROPFIND gave us the same one.";
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_loadWeakRetained(v12);
      objc_msgSend(v47, "logHandleForAccountInfoProvider:", v63);
      v56 = objc_claimAutoreleasedReturnValue();

      if (!v56 || !os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        goto LABEL_72;
      *(_WORD *)buf = 0;
      v57 = "[multi-move] ~ New etag differs from old etag -- MOVE returned no ETag, but PROPFIND gave us a good new value.";
    }
    v58 = v56;
    v59 = OS_LOG_TYPE_INFO;
LABEL_70:
    v60 = 2;
    goto LABEL_71;
  }
  v48 = CFSTR("New ETag found by PROPFIND didn't match non-nil intermediate ETag returned by MOVE");
LABEL_46:
  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_loadWeakRetained(v12);
  objc_msgSend(v49, "logHandleForAccountInfoProvider:", v50);
  v51 = objc_claimAutoreleasedReturnValue();

  if (v51 && os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v68 = (const char *)v48;
    _os_log_impl(&dword_2096EB000, v51, OS_LOG_TYPE_DEFAULT, "[multi-move] ~ %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_loadWeakRetained(v12);
  objc_msgSend(v52, "logHandleForAccountInfoProvider:", v53);
  v54 = objc_claimAutoreleasedReturnValue();

  if (v54 && os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2096EB000, v54, OS_LOG_TYPE_DEFAULT, "[multi-move] ~ Returing ETag and ScheduleTag of nil", buf, 2u);
  }

  v10 = v65;
  v22 = v66;
LABEL_75:

}

- (NSDictionary)sourceEntityScheduleTags
{
  return self->_sourceEntityScheduleTags;
}

- (void)setSourceEntityScheduleTags:(id)a3
{
  objc_storeStrong((id *)&self->_sourceEntityScheduleTags, a3);
}

- (BOOL)isAutoScheduleSupported
{
  return self->_isAutoScheduleSupported;
}

- (void)setIsAutoScheduleSupported:(BOOL)a3
{
  self->_isAutoScheduleSupported = a3;
}

- (NSMutableDictionary)destinationEntityScheduleTags
{
  return self->_destinationEntityScheduleTags;
}

- (void)setDestinationEntityScheduleTags:(id)a3
{
  objc_storeStrong((id *)&self->_destinationEntityScheduleTags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationEntityScheduleTags, 0);
  objc_storeStrong((id *)&self->_sourceEntityScheduleTags, 0);
}

@end
