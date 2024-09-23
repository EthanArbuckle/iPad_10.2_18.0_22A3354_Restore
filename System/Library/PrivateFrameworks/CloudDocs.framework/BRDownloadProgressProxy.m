@implementation BRDownloadProgressProxy

- (BRDownloadProgressProxy)initWithURL:(id)a3
{
  id v4;
  BRDownloadProgressProxy *v5;
  NSMetadataQuery *v6;
  NSMetadataQuery *query;
  NSOperationQueue *v8;
  NSOperationQueue *queue;
  char v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *personaID;
  _QWORD v17[4];
  id v18;
  id location;
  id v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRDownloadProgressProxy;
  v5 = -[BRDownloadProgressProxy init](&v21, sel_init);
  if (v5)
  {
    v6 = (NSMetadataQuery *)objc_alloc_init(MEMORY[0x1E0CB3768]);
    query = v5->_query;
    v5->_query = v6;

    -[NSMetadataQuery br_setupForMonitoringItemAtURL:](v5->_query, "br_setupForMonitoringItemAtURL:", v4);
    -[NSMetadataQuery setNotificationBatchingInterval:](v5->_query, "setNotificationBatchingInterval:", 0.1);
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v5->_queue;
    v5->_queue = v8;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_queue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v5->_queue, "setQualityOfService:", 17);
    -[NSMetadataQuery setOperationQueue:](v5->_query, "setOperationQueue:", v5->_queue);
    -[BRDownloadProgressProxy setKind:](v5, "setKind:", *MEMORY[0x1E0CB30F8]);
    -[BRDownloadProgressProxy setUserInfoObject:forKey:](v5, "setUserInfoObject:forKey:", *MEMORY[0x1E0CB30B8], *MEMORY[0x1E0CB30C8]);
    -[BRDownloadProgressProxy setUserInfoObject:forKey:](v5, "setUserInfoObject:forKey:", v4, *MEMORY[0x1E0CB30F0]);
    v20 = 0;
    v10 = objc_msgSend(v4, "getPromisedItemResourceValue:forKey:error:", &v20, *MEMORY[0x1E0C99A70], 0);
    v11 = v20;
    if ((v10 & 1) == 0)
    {
      objc_msgSend(v4, "lastPathComponent");
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v12;
    }
    objc_initWeak(&location, v5);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __39__BRDownloadProgressProxy_initWithURL___block_invoke;
    v17[3] = &unk_1E3DA5870;
    objc_copyWeak(&v18, &location);
    -[BRDownloadProgressProxy setCancellationHandler:](v5, "setCancellationHandler:", v17);
    if (v11)
      -[BRDownloadProgressProxy setUserInfoObject:forKey:](v5, "setUserInfoObject:forKey:", v11, *MEMORY[0x1E0CB3088]);
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "br_currentPersonaID");
    v14 = objc_claimAutoreleasedReturnValue();
    personaID = v5->_personaID;
    v5->_personaID = (NSString *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __39__BRDownloadProgressProxy_initWithURL___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queryDidReceiveUpdate:", 0);

}

- (void)_queryDidReceiveUpdate:(id)a3
{
  NSString *v4;
  NSString *v5;
  int v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSString *personaID;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint8_t buf[4];
  NSString *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  if (-[NSString isEqualToString:](self->_personaID, "isEqualToString:", CFSTR("__defaultPersonaID__"))
    || (v4 = self->_personaID) == 0)
  {
    if (_queryDidReceiveUpdate____personaOnceToken != -1)
      dispatch_once(&_queryDidReceiveUpdate____personaOnceToken, &__block_literal_global_20);
    v5 = (NSString *)(id)_queryDidReceiveUpdate____personalPersona;
    v6 = 1;
  }
  else
  {
    v5 = v4;
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0;
  objc_msgSend(v54, "userPersonaUniqueString");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == v5 || -[NSString isEqualToString:](v8, "isEqualToString:", v5))
    goto LABEL_9;
  if (voucher_process_can_use_arbitrary_personas())
  {
    v55 = 0;
    v23 = (void *)objc_msgSend(v54, "copyCurrentPersonaContextWithError:", &v55);
    v24 = v55;
    v25 = v56;
    v56 = v23;

    if (v24)
    {
      brc_bread_crumbs((uint64_t)"-[BRDownloadProgressProxy _queryDidReceiveUpdate:]", 54);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
        BRPerformWithPersonaAndError_cold_1((uint64_t)v24, (uint64_t)v26, v27);

    }
    objc_msgSend(v54, "generateAndRestorePersonaContextWithPersonaUniqueString:", v5);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v53)
    {
LABEL_9:
      v53 = 0;
      goto LABEL_10;
    }
    brc_bread_crumbs((uint64_t)"-[BRDownloadProgressProxy _queryDidReceiveUpdate:]", 54);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
    {
      personaID = self->_personaID;
      *(_DWORD *)buf = 138412802;
      v58 = personaID;
      v59 = 2112;
      v60 = v53;
      v61 = 2112;
      v62 = v28;
      _os_log_error_impl(&dword_19CBF0000, v29, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
    }
    goto LABEL_41;
  }
  if (v6 && (objc_msgSend(v54, "isDataSeparatedPersona") & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRDownloadProgressProxy _queryDidReceiveUpdate:]", 54);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      BRPerformWithPersonaAndError_cold_3((uint64_t)v28, v29, v44, v45, v46, v47, v48, v49);
    v53 = 0;
LABEL_41:

    goto LABEL_10;
  }
  brc_bread_crumbs((uint64_t)"-[BRDownloadProgressProxy _queryDidReceiveUpdate:]", 54);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    BRPerformWithPersonaAndError_cold_2((uint64_t)v36, v37, v38, v39, v40, v41, v42, v43);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  -[NSMetadataQuery results](self->_query, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", *MEMORY[0x1E0CB2EF0]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForKey:", CFSTR("BRMetadataUbiquitousItemDownloadingSizeKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRDownloadProgressProxy userInfo](self, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3088]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[BRDownloadProgressProxy isCancelled](self, "isCancelled");
    if (-[BRDownloadProgressProxy isCancelled](self, "isCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        _BRLocalizedStringWithFormat(CFSTR("CANCELLING_DOWNLOAD_ITEM_PROGRESS_WITH_FILENAME"), CFSTR("Localizable"), v21, v16, v17, v18, v19, v20, (uint64_t)v14);
      else
        _BRLocalizedStringWithFormat(CFSTR("CANCELLING_DOWNLOAD_ITEM_PROGRESS"), CFSTR("Localizable"), v21, v16, v17, v18, v19, v20, v50);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        _BRLocalizedStringWithFormat(CFSTR("DOWNLOAD_ITEM_PROGRESS_WITH_FILENAME"), CFSTR("Localizable"), v21, v31, v32, v33, v34, v35, (uint64_t)v14);
      else
        _BRLocalizedStringWithFormat(CFSTR("DOWNLOAD_ITEM_PROGRESS"), CFSTR("Localizable"), v21, v31, v32, v33, v34, v35, v50);
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRDownloadProgressProxy setLocalizedDescription:](self, "setLocalizedDescription:", v22);

    if (v15)
    {
      -[BRDownloadProgressProxy setTotalUnitCount:](self, "setTotalUnitCount:", -1);
    }
    else if (v12)
    {
      -[BRDownloadProgressProxy setTotalUnitCount:](self, "setTotalUnitCount:", objc_msgSend(v12, "longLongValue"));
      -[BRDownloadProgressProxy setCompletedUnitCount:](self, "setCompletedUnitCount:", objc_msgSend(v51, "longLongValue") * objc_msgSend(v12, "longLongValue") / 100);
    }

  }
  _BRRestorePersona(&v56);

}

void __50__BRDownloadProgressProxy__queryDidReceiveUpdate___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_queryDidReceiveUpdate____personalPersona;
  _queryDidReceiveUpdate____personalPersona = v0;

}

- (void)start
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__queryDidReceiveUpdate_, *MEMORY[0x1E0CB2E40], self->_query);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__queryDidReceiveUpdate_, *MEMORY[0x1E0CB2E38], self->_query);
  -[NSMetadataQuery startQuery](self->_query, "startQuery");

}

- (void)stop
{
  NSOperationQueue *queue;
  _QWORD v3[5];

  queue = self->_queue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__BRDownloadProgressProxy_stop__block_invoke;
  v3[3] = &unk_1E3DA4738;
  v3[4] = self;
  -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v3);
}

void __31__BRDownloadProgressProxy_stop__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "stopQuery");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
