@implementation BRCNonLocalVersionsSender

+ (id)senderWithLookup:(id)a3 client:(id)a4 XPCReceiver:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "byIDLocalItem");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v9, "relpath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "byIDServerItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "faultedLocalItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "faultedServerItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "faultedRelpath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v13, "isDocument") & 1) != 0)
  {
    objc_msgSend(v13, "st");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ckInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_alloc((Class)objc_opt_class());
      objc_msgSend(v13, "asDocument");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithDocument:serverItem:relpath:client:XPCReceiver:error:", v19, v15, v14, v10, v11, a6);

      goto LABEL_22;
    }
    if (!v13)
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        __104__BRCXPCRegularIPCsClient_LegacyAdditions__getPublishedURLForItemAtURL_forStreaming_requestedTTL_reply___block_invoke_83_cold_1();

    }
    v37 = v14;
    v21 = v15;
    v22 = v11;
    v23 = v10;
    v33 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v9, "url");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "brc_errorNotInCloud:", v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, (os_log_type_t)0x90u))
        goto LABEL_18;
      v30 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v39 = "+[BRCNonLocalVersionsSender senderWithLookup:client:XPCReceiver:error:]";
      v40 = 2080;
      if (!a6)
        v30 = "(ignored by caller)";
      goto LABEL_25;
    }
  }
  else
  {
    v37 = v14;
    v21 = v15;
    v22 = v11;
    v23 = v10;
    v24 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v9, "url");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "brc_errorNoDocument:underlyingPOSIXError:", v26, 21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, (os_log_type_t)0x90u))
      {
LABEL_18:

        goto LABEL_19;
      }
      v30 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v39 = "+[BRCNonLocalVersionsSender senderWithLookup:client:XPCReceiver:error:]";
      v40 = 2080;
      if (!a6)
        v30 = "(ignored by caller)";
LABEL_25:
      v41 = v30;
      v42 = 2112;
      v43 = v27;
      v44 = 2112;
      v45 = v28;
      _os_log_error_impl(&dword_1CBD43000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      goto LABEL_18;
    }
  }
LABEL_19:
  v10 = v23;
  if (a6)
    *a6 = objc_retainAutorelease(v27);

  v20 = 0;
  v11 = v22;
  v15 = v21;
  v14 = v37;
LABEL_22:

  return v20;
}

- (BRCNonLocalVersionsSender)initWithDocument:(id)a3 serverItem:(id)a4 relpath:(id)a5 client:(id)a6 XPCReceiver:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BRCNonLocalVersionsSender *v23;
  uint64_t v24;
  BRCServerZone *serverZone;
  uint64_t v26;
  BRCAppLibrary *appLibrary;
  uint64_t v28;
  BRCItemID *itemID;
  uint64_t v30;
  CKRecordID *recordID;
  uint64_t v32;
  NSURL *physicalURL;
  void *v34;
  void *v35;
  uint64_t v36;
  NSURL *logicalURL;
  uint64_t v38;
  BRCStatInfo *st;
  void *v40;
  void *v41;
  uint64_t v42;
  void *currentEtag;
  uint64_t v44;
  NSString *v45;
  void *v46;
  uint64_t v47;
  GSAdditionStoring *storage;
  BRCNonLocalVersionsSender *v49;
  id obj;
  id v53;
  _QWORD v54[4];
  BRCNonLocalVersionsSender *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  objc_super v63;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  obj = a7;
  v53 = a7;
  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v13, "itemID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("non-local-versions for %@"), v18);

  objc_msgSend(v13, "currentVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "syncContextUsedForTransfers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "session");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v63.receiver = self;
  v63.super_class = (Class)BRCNonLocalVersionsSender;
  v23 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v63, sel_initWithName_syncContext_sessionContext_, v19, v21, v22);

  if (v23)
  {
    objc_storeStrong((id *)&v23->_client, a6);
    objc_msgSend(v13, "serverZone");
    v24 = objc_claimAutoreleasedReturnValue();
    serverZone = v23->_serverZone;
    v23->_serverZone = (BRCServerZone *)v24;

    objc_msgSend(v13, "appLibrary");
    v26 = objc_claimAutoreleasedReturnValue();
    appLibrary = v23->_appLibrary;
    v23->_appLibrary = (BRCAppLibrary *)v26;

    objc_msgSend(v13, "itemID");
    v28 = objc_claimAutoreleasedReturnValue();
    itemID = v23->_itemID;
    v23->_itemID = (BRCItemID *)v28;

    objc_msgSend(v13, "documentRecordID");
    v30 = objc_claimAutoreleasedReturnValue();
    recordID = v23->_recordID;
    v23->_recordID = (CKRecordID *)v30;

    objc_msgSend(v15, "physicalURL");
    v32 = objc_claimAutoreleasedReturnValue();
    physicalURL = v23->_physicalURL;
    v23->_physicalURL = (NSURL *)v32;

    objc_msgSend(v13, "st");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "logicalName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logicalURLWithLogicalName:", v35);
    v36 = objc_claimAutoreleasedReturnValue();
    logicalURL = v23->_logicalURL;
    v23->_logicalURL = (NSURL *)v36;

    objc_msgSend(v13, "st");
    v38 = objc_claimAutoreleasedReturnValue();
    st = v23->_st;
    v23->_st = (BRCStatInfo *)v38;

    objc_msgSend(MEMORY[0x1E0C94F88], "br_fetchNonLocalVersions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v23, "setGroup:", v40);

    if (v20)
    {
      objc_msgSend(v20, "ckInfo");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "etag");
      v42 = objc_claimAutoreleasedReturnValue();
      currentEtag = v23->_currentEtag;
      v23->_currentEtag = (NSString *)v42;
    }
    else
    {
      objc_msgSend(v14, "latestVersion");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "ckInfo");
      currentEtag = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(currentEtag, "etag");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = v23->_currentEtag;
      v23->_currentEtag = (NSString *)v44;

    }
    if (v23->_itemID)
    {
      v57 = 0;
      v58 = &v57;
      v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__60;
      v61 = __Block_byref_object_dispose__60;
      v62 = 0;
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __90__BRCNonLocalVersionsSender_initWithDocument_serverItem_relpath_client_XPCReceiver_error___block_invoke;
      v54[3] = &unk_1E87685B0;
      v55 = v23;
      v56 = &v57;
      objc_msgSend(v15, "performOnOpenFileDescriptor:error:", v54, 0);
      if (a8)
        *a8 = objc_retainAutorelease((id)v58[5]);

      _Block_object_dispose(&v57, 8);
    }
    if (!v23->_storagePathPrefix)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0D25D48], "manager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "permanentStorageForItemAtURL:allocateIfNone:error:", v23->_physicalURL, 0, a8);
    v47 = objc_claimAutoreleasedReturnValue();
    storage = v23->_storage;
    v23->_storage = (GSAdditionStoring *)v47;

    if (!v23->_storage)
    {
LABEL_13:
      v49 = 0;
      goto LABEL_14;
    }
    objc_storeStrong((id *)&v23->_receiver, obj);
  }
  -[_BRCOperation setNonDiscretionary:](v23, "setNonDiscretionary:", 1);
  v49 = v23;
LABEL_14:

  return v49;
}

uint64_t __90__BRCNonLocalVersionsSender_initWithDocument_serverItem_relpath_client_XPCReceiver_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(MEMORY[0x1E0D25D40], "storagePrefixForFileDescriptor:error:", a2, &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 536);
  *(_QWORD *)(v5 + 536) = v4;

  return 0;
}

- (id)createActivity
{
  return _os_activity_create(&dword_1CBD43000, "non-local-versions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (id)_fetchThumbnailOperationForVersionRecord:(id)a3 physicalURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  BRCItemID *itemID;
  _QWORD v25[4];
  id v26;
  BRCNonLocalVersionsSender *v27;
  id v28;
  id v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _BYTE buf[24];
  void *v37;
  __int16 v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "etag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0C94E18]);
  v40[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithRecordIDs:", v11);

  v32 = 0uLL;
  v33 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCNonLocalVersionsSender _fetchThumbnailOperationForVersionRecord:physicalURL:]", 163, &v32);
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    itemID = self->_itemID;
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v32;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = itemID;
    *(_WORD *)&buf[22] = 2112;
    v37 = v9;
    v38 = 2112;
    v39 = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx Fetching thumbnail for non-local version %@ etag %@%@", buf, 0x2Au);
  }

  *(_OWORD *)buf = v32;
  *(_QWORD *)&buf[16] = v33;
  objc_msgSend(v12, "callbackQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v15, v16);

  objc_msgSend(MEMORY[0x1E0C95048], "desiredKeysWithMask:", 16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDesiredKeys:", v17);

  v34 = v8;
  v35 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRecordIDsToVersionETags:", v18);

  objc_msgSend(MEMORY[0x1E0C94F88], "br_fetchNonLocalVersions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setGroup:", v19);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke;
  v25[3] = &unk_1E87685D8;
  v30 = *(_OWORD *)buf;
  v31 = *(_QWORD *)&buf[16];
  v26 = v8;
  v27 = self;
  v28 = v9;
  v29 = v6;
  v20 = v6;
  v21 = v9;
  v22 = v8;
  objc_msgSend(v12, "setFetchRecordsCompletionBlock:", v25);

  return v12;
}

void __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  __CFString *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *(_OWORD *)(a1 + 64);
  v45 = *(_QWORD *)(a1 + 80);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "debugDescription");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    v32 = CFSTR("success");
    *(_DWORD *)buf = 134218754;
    if (v6)
      v32 = v6;
    v49 = v44;
    v50 = 2112;
    v51 = v30;
    v52 = 2112;
    v53 = v32;
    v54 = 2112;
    v55 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Received non local thumbnail record: %@ result: %@%@", buf, 0x2Au);

  }
  if (!v6)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "finishIfCancelled") & 1) != 0)
    {
      v6 = 0;
      goto LABEL_28;
    }
    if (v7)
    {
      objc_msgSend(v7, "etag");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 48));

      if ((v11 & 1) != 0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("thumb1024"));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString fileURL](v12, "fileURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (v14)
        {
          brc_bread_crumbs();
          v23 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_2((uint64_t)v23, v33, v34, v35, v36, v37, v38, v39);
          v6 = 0;
        }
        else
        {
          v15 = (void *)MEMORY[0x1E0CD32B0];
          v46 = *MEMORY[0x1E0C998A8];
          -[__CFString fileURL](v12, "fileURL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("thumbQLMetadata"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *(_QWORD *)(a1 + 56);
          v43 = 0;
          v20 = objc_msgSend(v15, "associateThumbnailImagesDictionary:serializedQuickLookMetadata:withImmutableDocument:atURL:error:", v17, v18, 1, v19, &v43);
          v6 = (__CFString *)v43;

          if (v20)
          {
            brc_bread_crumbs();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_3();

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 504), "newThumbnailForVersionWithEtag:", *(_QWORD *)(a1 + 48));
            goto LABEL_27;
          }
          brc_bread_crumbs();
          v23 = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
            __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_4();
        }

LABEL_26:
LABEL_27:

        goto LABEL_28;
      }
      brc_bread_crumbs();
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v7, "etag");
        v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v41 = objc_msgSend(v40, "UTF8String");
        v42 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String");
        *(_DWORD *)buf = 136315650;
        v49 = v41;
        v50 = 2080;
        v51 = v42;
        v52 = 2112;
        v53 = v12;
        _os_log_fault_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: CK sent a bogus ETag: %s != %s%@", buf, 0x20u);

      }
    }
    else
    {
      brc_bread_crumbs();
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_1((uint64_t)v12, v23, v24, v25, v26, v27, v28, v29);
    }
    v6 = 0;
    goto LABEL_26;
  }
LABEL_28:
  __brc_leave_section((uint64_t *)&v44);

}

- (id)_fetchVersionsOperationWithDepsOp:(id)a3
{
  id v4;
  BRNonLocalVersionReceiving *v5;
  BRCAppLibrary *v6;
  void *v7;
  CKRecordID *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CKRecordID *v15;
  id v16;
  BRNonLocalVersionReceiving *v17;
  id v18;
  BRCAppLibrary *v19;
  CKRecordID *v20;
  id v21;
  _QWORD v23[4];
  CKRecordID *v24;
  BRCNonLocalVersionsSender *v25;
  _QWORD v26[4];
  BRCAppLibrary *v27;
  BRCNonLocalVersionsSender *v28;
  CKRecordID *v29;
  id v30;
  BRNonLocalVersionReceiving *v31;
  id v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_receiver;
  v6 = self->_appLibrary;
  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_recordID;
  v9 = objc_alloc(MEMORY[0x1E0C94DD0]);
  v34[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithRecordIDs:", v10);

  objc_msgSend(MEMORY[0x1E0C95048], "desiredKeysWithMask:", 153);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDesiredKeys:", v12);

  objc_msgSend(MEMORY[0x1E0C94F88], "br_fetchNonLocalVersions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setGroup:", v13);

  v14 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke;
  v26[3] = &unk_1E8768628;
  v27 = v6;
  v28 = self;
  v15 = v8;
  v32 = v4;
  v33 = v11;
  v29 = v15;
  v30 = v7;
  v31 = v5;
  v16 = v4;
  v17 = v5;
  v18 = v7;
  v19 = v6;
  objc_msgSend(v11, "setFetchRecordVersionsProgressBlock:", v26);
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_26;
  v23[3] = &unk_1E875E948;
  v24 = v15;
  v25 = self;
  v20 = v15;
  objc_msgSend(v11, "setFetchRecordVersionsCompletionBlock:", v23);
  v21 = v11;

  return v21;
}

void __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  int v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  unsigned int v82;
  void *v83;
  void *v84;
  int v85;
  id v86;
  id obj;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  _QWORD v92[6];
  id v93;
  uint64_t *v94;
  _QWORD block[4];
  id v96;
  id v97;
  id v98;
  uint64_t v99;
  id v100;
  _BYTE *v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  id v109;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115[3];
  uint8_t v116[4];
  id v117;
  __int16 v118;
  id v119;
  __int16 v120;
  void *v121;
  uint8_t v122[128];
  _BYTE buf[24];
  uint64_t (*v124)(uint64_t, uint64_t);
  _BYTE v125[20];
  __int16 v126;
  void *v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v75 = a2;
  v76 = a4;
  v8 = a5;
  objc_msgSend(*(id *)(a1 + 32), "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v10);

  if ((objc_msgSend(*(id *)(a1 + 40), "finishIfCancelled") & 1) == 0)
  {
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "completedWithResult:error:", 0, v8);
      goto LABEL_84;
    }
    memset(v115, 0, sizeof(v115));
    __brc_create_section(0, (uint64_t)"-[BRCNonLocalVersionsSender _fetchVersionsOperationWithDepsOp:]_block_invoke", 233, v115);
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v69 = v115[0];
      v70 = objc_msgSend(v76, "count");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 600), "path");
      v71 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      v72 = *(_QWORD *)(a1 + 48);
      v73 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 134219266;
      *(_QWORD *)&buf[4] = v69;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v70;
      *(_WORD *)&buf[22] = 2112;
      v124 = v71;
      *(_WORD *)v125 = 2112;
      *(_QWORD *)&v125[2] = v72;
      *(_WORD *)&v125[10] = 2112;
      *(_QWORD *)&v125[12] = v73;
      v126 = 2112;
      v127 = v11;
      _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Got %lu versions for %@ (recordID:%@ %@)%@", buf, 0x3Eu);

    }
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    obj = v76;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
    if (!v13)
    {
      v91 = 0;
      goto LABEL_83;
    }
    v90 = v13;
    v91 = 0;
    v89 = *(_QWORD *)v112;
    v79 = *MEMORY[0x1E0D25D00];
    v77 = *MEMORY[0x1E0D25D30];
LABEL_8:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v112 != v89)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v14);
      brc_bread_crumbs();
      v16 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v15, "etag");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "debugDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 2112;
        v124 = v16;
        _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Considering etag %@ %@%@", buf, 0x20u);

      }
      v18 = *(void **)(*(_QWORD *)(a1 + 40) + 528);
      objc_msgSend(v15, "etag");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = objc_msgSend(v18, "isEqualToString:", v19);

      if ((_DWORD)v18)
      {
        brc_bread_crumbs();
        v20 = (id)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v20;
          _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Skipping current version%@", buf, 0xCu);
        }
        goto LABEL_37;
      }
      v22 = *(_QWORD *)(a1 + 56);
      v109 = v91;
      v110 = 0;
      v23 = objc_msgSend(v15, "deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:error:", &v110, 0, 0, v22, &v109);
      v20 = v110;
      v24 = v109;

      if ((v23 & 1) == 0)
      {
        brc_bread_crumbs();
        v21 = objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v21;
          _os_log_error_impl(&dword_1CBD43000, v27, (os_log_type_t)0x90u, "[ERROR] Unable to deserialize record: %@%@", buf, 0x16u);
        }

        goto LABEL_36;
      }
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 512);
      objc_msgSend(*(id *)(a1 + 48), "zoneID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "additionNameForItemID:zoneID:", v25, v26);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 544), "additionWithName:inNameSpace:error:", v88, v79, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 544), "additionWithName:inNameSpace:error:", v88, v77, 0);
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21)
          break;
      }
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 592))
      {
        v85 = 0;
LABEL_28:
        objc_msgSend(v20, "originalPOSIXName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32 == 0;

        if (!v33)
        {
          objc_msgSend(*(id *)(a1 + 32), "session");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stageRegistry");
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject url](v21, "url");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v124 = __Block_byref_object_copy__60;
          *(_QWORD *)v125 = __Block_byref_object_dispose__60;
          v36 = v35;
          v84 = 0;
          *(_QWORD *)&v125[8] = v36;
          if (!v85)
          {
            v91 = v24;
            goto LABEL_47;
          }
          objc_msgSend(MEMORY[0x1E0D25D38], "additionURLForName:storagePrefix:inConflictNamespace:", v88, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 536), 0);
          v86 = (id)objc_claimAutoreleasedReturnValue();

          v103 = 0;
          v104 = &v103;
          v105 = 0x3032000000;
          v106 = __Block_byref_object_copy__60;
          v107 = __Block_byref_object_dispose__60;
          v108 = 0;
          objc_msgSend(*(id *)(a1 + 32), "db");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "serialQueue");
          v38 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_18;
          block[3] = &unk_1E8768600;
          v101 = buf;
          v96 = v83;
          v39 = v88;
          v97 = v39;
          v40 = *(id *)(a1 + 56);
          v41 = *(_QWORD *)(a1 + 40);
          v98 = v40;
          v99 = v41;
          v100 = v20;
          v102 = &v103;
          dispatch_sync(v38, block);

          v91 = (id)v104[5];
          v42 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          if (v42)
          {
            if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 552), "isSandboxed"))
            {
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "brc_issueSandboxExtensionOfClass:error:", "com.apple.clouddocs.version", 0);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v84 = 0;
            }
          }
          else
          {
            brc_bread_crumbs();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
            {
              *(_DWORD *)v116 = 138412802;
              v117 = v39;
              v118 = 2112;
              v119 = v91;
              v120 = 2112;
              v121 = v43;
              _os_log_error_impl(&dword_1CBD43000, v44, (os_log_type_t)0x90u, "[ERROR] Unable to create fault for '%@': %@%@", v116, 0x20u);
            }

            objc_msgSend(*(id *)(a1 + 40), "completedWithResult:error:", 0, v91);
            v84 = 0;
          }

          _Block_object_dispose(&v103, 8);
          if (v42)
          {
            v36 = v86;
LABEL_47:
            v45 = *(void **)(*(_QWORD *)(a1 + 40) + 528);
            objc_msgSend(v15, "etag");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v45) = objc_msgSend(v45, "isEqualToString:", v46);

            if ((_DWORD)v45)
            {
              v86 = *(id *)(*(_QWORD *)(a1 + 40) + 600);

              objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), *(id *)(*(_QWORD *)(a1 + 40) + 608));
            }
            else
            {
              v86 = v36;
            }
            v82 = objc_msgSend(MEMORY[0x1E0CD32B0], "hasThumbnailOnImmutableDocumentAtURL:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
            v103 = 0;
            v104 = &v103;
            v105 = 0x3032000000;
            v106 = __Block_byref_object_copy__60;
            v107 = __Block_byref_object_dispose__60;
            v108 = 0;
            objc_msgSend(*(id *)(a1 + 56), "session");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v15, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", v47);

            if ((v48 & 1) == 0)
            {
              if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 552), "isSandboxed"))
              {
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 560), "session");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "serverDB");
                v50 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v50, "serialQueue");
                v51 = objc_claimAutoreleasedReturnValue();
                v92[0] = MEMORY[0x1E0C809B0];
                v92[1] = 3221225472;
                v92[2] = __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_22;
                v92[3] = &unk_1E87615D0;
                v52 = *(_QWORD *)(a1 + 40);
                v92[4] = v15;
                v92[5] = v52;
                v93 = v50;
                v94 = &v103;
                v53 = v50;
                dispatch_sync(v51, v92);

              }
              else
              {
                +[BRFieldUserIdentity unknownPersonNameComponents](BRFieldUserIdentity, "unknownPersonNameComponents");
                v54 = objc_claimAutoreleasedReturnValue();
                v53 = (id)v104[5];
                v104[5] = v54;
              }

            }
            objc_msgSend(v20, "displayNameWithoutExtension:", 1);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v20, "mtime"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            brc_bread_crumbs();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v86, "path");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v116 = 138412802;
              v117 = v20;
              v118 = 2112;
              v119 = v67;
              v120 = 2112;
              v121 = v55;
              _os_log_debug_impl(&dword_1CBD43000, v56, OS_LOG_TYPE_DEBUG, "[DEBUG] sending %@ at '%@'%@", v116, 0x20u);

            }
            v57 = *(void **)(a1 + 64);
            if ((v85 & 1) != 0)
            {
              v58 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
              objc_msgSend(v15, "etag");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              if (v48)
              {
                objc_msgSend(v15, "brc_lastEditorDeviceName");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = v60;
              }
              else
              {
                v61 = 0;
                v60 = v78;
              }
              objc_msgSend(v57, "newFaultVersionAtURL:faultURL:faultExtension:etag:hasThumbnail:displayName:lastEditorDeviceName:lastEditorNameComponents:modificationDate:", v86, v58, v84, v59, v82, v81, v61, v104[5], v80);
              v78 = v60;
              if (!v48)
              {
LABEL_69:

                if (v82)
                {
                  brc_bread_crumbs();
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v64 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v116 = 138412290;
                    v117 = v63;
                    _os_log_debug_impl(&dword_1CBD43000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] Thumbnail is already present, not downloading twice%@", v116, 0xCu);
                  }

LABEL_75:
                }
                else
                {
                  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("thumb1024"));
                  v65 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v65)
                  {
                    objc_msgSend(*(id *)(a1 + 40), "_fetchThumbnailOperationForVersionRecord:physicalURL:", v15, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(a1 + 72), "addDependency:", v63);
                    objc_msgSend(*(id *)(a1 + 40), "addSubOperation:", v63);
                    goto LABEL_75;
                  }
                }

                _Block_object_dispose(&v103, 8);
                v66 = 1;
                v78 = v60;
LABEL_77:

                _Block_object_dispose(buf, 8);
                if (!v66)
                  goto LABEL_83;
                goto LABEL_38;
              }
            }
            else
            {
              -[NSObject size](v21, "size");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "etag");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              if (v48)
              {
                objc_msgSend(v15, "brc_lastEditorDeviceName");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = v74;
              }
              else
              {
                v62 = 0;
              }
              objc_msgSend(v57, "newCachedVersionAtURL:size:etag:hasThumbnail:displayName:lastEditorDeviceName:lastEditorNameComponents:modificationDate:", v86, v59, v60, v82, v81, v62, v104[5], v80);
              if (v48)

            }
            v60 = v78;
            goto LABEL_69;
          }
          v66 = 0;
          goto LABEL_77;
        }
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v28;
          _os_log_error_impl(&dword_1CBD43000, v29, (os_log_type_t)0x90u, "[ERROR] Version is lacking a name%@", buf, 0xCu);
        }
        goto LABEL_35;
      }
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v28;
        _os_log_debug_impl(&dword_1CBD43000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] The version is already cached locally, skip it%@", buf, 0xCu);
      }
LABEL_35:

LABEL_36:
      v91 = v24;
LABEL_37:

LABEL_38:
      if (v90 == ++v14)
      {
        v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
        v90 = v68;
        if (!v68)
        {
LABEL_83:

          __brc_leave_section(v115);
          v8 = v91;
          goto LABEL_84;
        }
        goto LABEL_8;
      }
    }
    v85 = 1;
    goto LABEL_28;
  }
LABEL_84:

}

void __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_18(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[8];
  v6 = *(_QWORD *)(a1[7] + 520);
  v7 = *(_QWORD *)(a1[10] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v2, "makeNonLocalVersionSideFaultWithAdditionName:clientZone:statInfo:version:sharingOptions:error:", v3, v4, v6, v5, 0, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[9] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_22(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lastModifiedUserRecordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 560), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "userIdentityForName:db:", v3, *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "nameComponentsAcceptUnknownUser:", 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  +[BRFieldUserIdentity unknownPersonNameComponents](BRFieldUserIdentity, "unknownPersonNameComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "isEqual:", v10);

  if ((_DWORD)v9)
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] User has no formatted name%@", (uint8_t *)&v13, 0xCu);
    }

  }
}

void __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id *v6;

  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_26_cold_1();

  if ((objc_msgSend(*(id *)(a1 + 40), "finishIfCancelled") & 1) == 0)
  {
    v6 = *(id **)(a1 + 40);
    if (v3)
      objc_msgSend(v6, "completedWithResult:error:", 0, v3);
    else
      objc_msgSend(v6[63], "versionsDone");
  }

}

- (id)_depsTrackingOperation
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__BRCNonLocalVersionsSender__depsTrackingOperation__block_invoke;
  v3[3] = &unk_1E875D500;
  v3[4] = self;
  +[NSBlockOperation blockOperationWithBlock:](BRCUncancellableBlockOperation, "blockOperationWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __51__BRCNonLocalVersionsSender__depsTrackingOperation__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, 0);
  return result;
}

- (void)main
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] scheduling operation %@%@");
  OUTLINED_FUNCTION_2();
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (**reply)(id, id);
  id v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  reply = (void (**)(id, id))self->_reply;
  if (reply)
  {
    reply[2](reply, v7);
    v9 = self->_reply;
    self->_reply = 0;

  }
  if (v7)
    -[_BRCOperation cancel](self, "cancel");
  v10.receiver = self;
  v10.super_class = (Class)BRCNonLocalVersionsSender;
  -[_BRCOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (NSURL)logicalURL
{
  return self->_logicalURL;
}

- (NSURL)physicalURL
{
  return self->_physicalURL;
}

- (BOOL)includeCachedVersions
{
  return self->_includeCachedVersions;
}

- (void)setIncludeCachedVersions:(BOOL)a3
{
  self->_includeCachedVersions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalURL, 0);
  objc_storeStrong((id *)&self->_logicalURL, 0);
  objc_storeStrong(&self->_reply, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_storagePathPrefix, 0);
  objc_storeStrong((id *)&self->_currentEtag, 0);
  objc_storeStrong((id *)&self->_st, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
}

- (void)listNonLocalVersionsWithReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  qos_class_t v8;
  void *v9;
  BRCXPCClient *client;
  uint64_t v11;
  id v12;
  void *v13;
  id reply;
  BRCXPCClient *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20[3];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  BRCNonLocalVersionsSender *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(1, (uint64_t)"-[BRCNonLocalVersionsSender(IPCs) listNonLocalVersionsWithReply:]", 423, v20);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v20[0];
    v8 = qos_class_self();
    BRCPrettyPrintEnumWithContext(v8, (uint64_t)&brc_qos_entries, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v22 = v7;
    v23 = 2112;
    v24 = self;
    v25 = 2112;
    v26 = v9;
    v27 = 2080;
    v28 = "-[BRCNonLocalVersionsSender(IPCs) listNonLocalVersionsWithReply:]";
    v29 = 2112;
    v30 = v5;
    _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ (%@) %s %@", buf, 0x34u);

  }
  client = self->_client;
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__BRCNonLocalVersionsSender_IPCs__listNonLocalVersionsWithReply___block_invoke;
  v18[3] = &unk_1E875FCF8;
  v18[4] = self;
  v12 = v4;
  v19 = v12;
  LODWORD(client) = _brc_ipc_check_logged_status(client, 0, v18);

  if ((_DWORD)client)
  {
    v13 = (void *)MEMORY[0x1D17A6DB0](v12);
    reply = self->_reply;
    self->_reply = v13;

    v15 = self->_client;
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __65__BRCNonLocalVersionsSender_IPCs__listNonLocalVersionsWithReply___block_invoke_128;
    v16[3] = &unk_1E8768650;
    v16[4] = self;
    v17 = v12;
    -[BRCXPCClient performBlock:withSessionFromURL:](v15, "performBlock:withSessionFromURL:", v16, self->_physicalURL);

  }
  __brc_leave_section(v20);

}

void __65__BRCNonLocalVersionsSender_IPCs__listNonLocalVersionsWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __65__BRCNonLocalVersionsSender_IPCs__listNonLocalVersionsWithReply___block_invoke_128(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "schedule");
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = v5;
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorLoggedOut");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = 138412802;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@)%@", (uint8_t *)&v12, 0x20u);
      if (!v5)

    }
    v10 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorLoggedOut");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

    }
  }

}

- (void)invalidate
{
  BRCXPCClient *client;

  -[_BRCOperation cancel](self, "cancel");
  client = self->_client;
  self->_client = 0;

}

void __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] UNREACHABLE: CK sent us no results and no error%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] UNREACHABLE: CK couldn't fetch the thumbnail and set no error%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Successfully added thumbnail to version at %@%@");
  OUTLINED_FUNCTION_2();
}

void __82__BRCNonLocalVersionsSender__fetchThumbnailOperationForVersionRecord_physicalURL___block_invoke_cold_4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to attach thumbnail to version: %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __63__BRCNonLocalVersionsSender__fetchVersionsOperationWithDepsOp___block_invoke_26_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] completed fetching non-local versions of %@%@");
  OUTLINED_FUNCTION_2();
}

@end
