@implementation GEOExperimentServerRemoteProxy

- (GEOExperimentServerRemoteProxy)initWithDelegate:(id)a3
{
  id v4;
  GEOExperimentServerRemoteProxy *v5;
  GEOExperimentServerRemoteProxy *v6;
  NSObject *global_queue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GEOABAssignmentResponse *v12;
  GEOABAssignmentResponse *experimentsInfo;
  GEOExperimentServerRemoteProxy *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GEOExperimentServerRemoteProxy;
  v5 = -[GEOExperimentServerRemoteProxy init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GEOExperimentServerRemoteProxy setDelegate:](v5, "setDelegate:", v4);
    v6->_experimentsInfoLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v6);
    global_queue = geo_get_global_queue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __51__GEOExperimentServerRemoteProxy_initWithDelegate___block_invoke;
    v19 = &unk_1E1C05280;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch("com.apple.GeoServices.experimentsChanged", &v6->_experimentsChangedToken, global_queue, &v16);

    GEOExperimentConfigurationPath();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0C99D50];
      GEOExperimentConfigurationPath();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataWithContentsOfFile:", v10, v16, v17, v18, v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "length"))
      {
        v12 = -[GEOABAssignmentResponse initWithData:]([GEOABAssignmentResponse alloc], "initWithData:", v11);
        experimentsInfo = v6->_experimentsInfo;
        v6->_experimentsInfo = v12;

      }
    }
    v14 = v6;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GEOABAssignmentResponse)experimentsInfo
{
  os_unfair_lock_s *p_experimentsInfoLock;
  GEOABAssignmentResponse *v4;

  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_experimentsInfo;
  os_unfair_lock_unlock(p_experimentsInfoLock);
  return v4;
}

void __51__GEOExperimentServerRemoteProxy_initWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  GEOABAssignmentResponse *v5;
  void *v6;
  GEOABAssignmentResponse *v7;
  void *v8;
  uint8_t v9[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "Experiments");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_DEBUG, "Received experiments change notification. Informing delegate.", v9, 2u);
    }

    GEOExperimentConfigurationPath();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "length"))
        v5 = -[GEOABAssignmentResponse initWithData:]([GEOABAssignmentResponse alloc], "initWithData:", v4);
      else
        v5 = 0;
      os_unfair_lock_lock_with_options();
      v6 = (void *)*((_QWORD *)WeakRetained + 2);
      *((_QWORD *)WeakRetained + 2) = v5;
      v7 = v5;

      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
      objc_msgSend(WeakRetained, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serverProxy:didChangeExperimentsInfo:", WeakRetained, v7);

    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[GEOExperimentServerRemoteProxy setDelegate:](self, "setDelegate:", 0);
  notify_cancel(self->_experimentsChangedToken);
  v3.receiver = self;
  v3.super_class = (Class)GEOExperimentServerRemoteProxy;
  -[GEOExperimentServerRemoteProxy dealloc](&v3, sel_dealloc);
}

- (void)refreshDatasetABStatus:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "hasDatasetId"))
  {
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 5, CFSTR("Experiments"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("datasetABStatus");
    objc_msgSend(v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = CFSTR("message");
    v10[1] = CFSTR("userInfo");
    v11[0] = CFSTR("experiments.refreshDataset");
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    objc_msgSend(v5, "sendMessage:", v9);

  }
}

- (void)abAssignUUIDWithCompletionHandler:(id)a3
{
  void (**v3)(id, void *, void *, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;
  void *global_queue;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(id, void *, void *, _QWORD);

  v3 = (void (**)(id, void *, void *, _QWORD))a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend((id)qword_1ECDBCA48, "dateByAddingTimeInterval:", GEOConfigGetDouble(GeoServicesConfig_ExperimentBucketGUIDExpireInterval, (uint64_t)off_1EDF4D088));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)qword_1ECDBCA48, "compare:", v4);
  v6 = (void *)qword_1ECDBCA48;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  v9 = (void *)qword_1ECDBCA50;
  if (qword_1ECDBCA50)
    v10 = v5 == -1;
  else
    v10 = 0;
  if (v10 && v8 == -1)
  {
    v16 = (void *)objc_msgSend((id)qword_1ECDBCA48, "copy");
    v17 = (void *)objc_msgSend((id)qword_1ECDBCA50, "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_317);
    v3[2](v3, v17, v16, 0);

  }
  else
  {
    qword_1ECDBCA50 = 0;

    v12 = (void *)qword_1ECDBCA48;
    qword_1ECDBCA48 = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_317);
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 5, CFSTR("Experiments"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("experiments.fetchAssignUUID"), CFSTR("message"), 0);
    global_queue = (void *)geo_get_global_queue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__GEOExperimentServerRemoteProxy_abAssignUUIDWithCompletionHandler___block_invoke;
    v18[3] = &unk_1E1C02190;
    v19 = v3;
    objc_msgSend(v13, "sendDictionary:withReply:handler:", v14, global_queue, v18);

  }
}

void __68__GEOExperimentServerRemoteProxy_abAssignUUIDWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  if (!v5)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!qword_1ECDBCA48)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)qword_1ECDBCA50;
        qword_1ECDBCA50 = v7;

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuidDate"));
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)qword_1ECDBCA48;
        qword_1ECDBCA48 = v9;

      }
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("reply type is not a dictionary"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  v11 = (void *)objc_msgSend((id)qword_1ECDBCA48, "copy");
  v12 = (void *)objc_msgSend((id)qword_1ECDBCA50, "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_317);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)abAssignUUIDWithSyncCompletionHandler:(id)a3
{
  void (**v3)(id, void *, void *, id);
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v3 = (void (**)(id, void *, void *, id))a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend((id)qword_1ECDBCA48, "dateByAddingTimeInterval:", GEOConfigGetDouble(GeoServicesConfig_ExperimentBucketGUIDExpireInterval, (uint64_t)off_1EDF4D088));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)qword_1ECDBCA48, "compare:", v4);
  v6 = (void *)qword_1ECDBCA48;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  v9 = (void *)qword_1ECDBCA50;
  if (qword_1ECDBCA50)
    v10 = v5 == -1;
  else
    v10 = 0;
  if (v10 && v8 == -1)
  {
    v16 = 0;
  }
  else
  {
    qword_1ECDBCA50 = 0;

    v12 = (void *)qword_1ECDBCA48;
    qword_1ECDBCA48 = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_317);
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 5, CFSTR("Experiments"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("experiments.fetchAssignUUIDSync"), CFSTR("message"), 0);
    v24 = 0;
    objc_msgSend(v13, "sendDictionaryWithReplySync:error:", v14, &v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v24;
    os_unfair_lock_lock_with_options();
    if (!v16)
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("userInfo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (!qword_1ECDBCA48)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("uuid"));
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)qword_1ECDBCA50;
          qword_1ECDBCA50 = v18;

          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("uuidDate"));
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)qword_1ECDBCA48;
          qword_1ECDBCA48 = v20;

        }
        v16 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("reply type is not a dictionary"));
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  v22 = (void *)objc_msgSend((id)qword_1ECDBCA48, "copy");
  v23 = (void *)objc_msgSend((id)qword_1ECDBCA50, "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_317);
  v3[2](v3, v23, v22, v16);

}

- (void)forceUpdate
{
  void *v2;
  void *v3;
  id v4;

  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 5, CFSTR("Experiments"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("experiments.update"), CFSTR("message"), 0);
  v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  objc_msgSend(v4, "sendMessage:", v3);

}

- (void)_debug_setQuerySubstring:(id)a3 forExperimentType:(int64_t)a4 dispatcherRequestType:(int)a5
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = *(_QWORD *)&a5;
  v14 = a3;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 5, CFSTR("Experiments"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, CFSTR("type"), v10, CFSTR("placeRequestType"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
    objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("querySubstring"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("experiments.setQuerySubstring"), CFSTR("message"), v11, CFSTR("userInfo"), 0);
  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  objc_msgSend(v7, "sendMessage:", v13);

}

- (void)_debug_fetchAllAvailableExperiments:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *global_queue;
  id v8;
  _QWORD v9[4];
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 5, CFSTR("Experiments"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("message");
  v12[0] = CFSTR("experiments.fetchAllExperiments");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  global_queue = (void *)geo_get_global_queue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__GEOExperimentServerRemoteProxy__debug_fetchAllAvailableExperiments___block_invoke;
  v9[3] = &unk_1E1C093D0;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v4, "sendMessage:withReply:handler:", v6, global_queue, v9);

}

void __70__GEOExperimentServerRemoteProxy__debug_fetchAllAvailableExperiments___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  GEOABAssignmentResponse *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C81310])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Could not connect to geod on %s"), "-[GEOExperimentServerRemoteProxy _debug_fetchAllAvailableExperiments:]_block_invoke", "com.apple.geod");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@"), v3);
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_15:

    goto LABEL_16;
  }
  v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("userInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_geo_errorForKey:", CFSTR("err"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("response data is not NSData");
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("response"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = -[GEOABAssignmentResponse initWithData:]([GEOABAssignmentResponse alloc], "initWithData:", v6);
        if (v9)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
          v10 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("response is nil"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }

LABEL_12:
        if (v10)
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        goto LABEL_15;
      }
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("response is nil");
    }
    objc_msgSend(v7, "GEOErrorWithCode:reason:", -11, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  NSLog(CFSTR("%s: Unexpected response type from geod on %s"), "-[GEOExperimentServerRemoteProxy _debug_fetchAllAvailableExperiments:]_block_invoke", "com.apple.geod");
LABEL_16:

}

- (void)_debug_setActiveExperimentBranchDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 5, CFSTR("Experiments_Debug"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("abdr"));
  v9[0] = CFSTR("message");
  v9[1] = CFSTR("userInfo");
  v10[0] = CFSTR("experiments.setActiveBranch");
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  objc_msgSend(v4, "sendMessage:", v8);

}

- (void)_debug_setBucketIdDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 5, CFSTR("Experiments"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("bucketIdDR"));
  v9[0] = CFSTR("message");
  v9[1] = CFSTR("userInfo");
  v10[0] = CFSTR("experiments.setBucketId");
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  objc_msgSend(v4, "sendMessage:", v8);

}

- (GEOExperimentServerProxyDelegate)delegate
{
  return (GEOExperimentServerProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentsInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
