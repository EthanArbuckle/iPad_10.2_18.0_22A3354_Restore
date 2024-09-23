@implementation MRNowPlayingController

+ (id)localRouteController
{
  MRNowPlayingController *v2;
  void *v3;
  MRNowPlayingController *v4;

  v2 = [MRNowPlayingController alloc];
  +[MRDestination localDestination](MRDestination, "localDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MRNowPlayingController initWithDestination:](v2, "initWithDestination:", v3);

  return v4;
}

+ (id)userSelectedEndpointController
{
  return -[MRNowPlayingController initWithUID:]([MRNowPlayingController alloc], "initWithUID:", CFSTR("userSelectedEndpoint"));
}

+ (id)proactiveEndpointController
{
  return -[MRNowPlayingController initWithUID:]([MRNowPlayingController alloc], "initWithUID:", CFSTR("proactiveEndpoint"));
}

- (MRNowPlayingController)initWithUID:(id)a3
{
  id v4;
  MRDestination *v5;
  MRDestination *v6;
  MRNowPlayingController *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("proactiveEndpoint")))
  {
    +[MRDestination proactiveDestination](MRDestination, "proactiveDestination");
    v5 = (MRDestination *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("userSelectedEndpoint")))
  {
    +[MRDestination userSelectedDestination](MRDestination, "userSelectedDestination");
    v5 = (MRDestination *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = -[MRDestination initWithOutputDeviceUID:]([MRDestination alloc], "initWithOutputDeviceUID:", v4);
  }
  v6 = v5;
  v7 = -[MRNowPlayingController initWithDestination:](self, "initWithDestination:", v5);

  return v7;
}

- (MRNowPlayingController)initWithDestination:(id)a3
{
  id v4;
  MRNowPlayingControllerConfiguration *v5;
  MRNowPlayingController *v6;

  v4 = a3;
  v5 = -[MRNowPlayingControllerConfiguration initWithDestination:]([MRNowPlayingControllerConfiguration alloc], "initWithDestination:", v4);

  -[MRNowPlayingControllerConfiguration setRequestPlaybackQueue:](v5, "setRequestPlaybackQueue:", 1);
  -[MRNowPlayingControllerConfiguration setRequestSupportedCommands:](v5, "setRequestSupportedCommands:", 1);
  -[MRNowPlayingControllerConfiguration setRequestPlaybackState:](v5, "setRequestPlaybackState:", 1);
  v6 = -[MRNowPlayingController initWithConfiguration:](self, "initWithConfiguration:", v5);

  return v6;
}

- (MRNowPlayingController)initWithConfiguration:(id)a3
{
  id v5;
  MRNowPlayingController *v6;
  uint64_t v7;
  NSDate *allocationDate;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workerQueue;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRNowPlayingController;
  v6 = -[MRNowPlayingController init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = objc_claimAutoreleasedReturnValue();
    allocationDate = v6->_allocationDate;
    v6->_allocationDate = (NSDate *)v7;

    objc_storeStrong((id *)&v6->_configuration, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.MediaRemote.MRNowPlayingController.workerQueue", v9);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v10;

    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addNowPlayingController:", v6);

  }
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  MRNowPlayingController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingController] <%@> Deallocating.", buf, 0xCu);
  }

  -[MRNowPlayingController endLoadingUpdates](self, "endLoadingUpdates");
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeNowPlayingController:", self);

  v5.receiver = self;
  v5.super_class = (Class)MRNowPlayingController;
  -[MRNowPlayingController dealloc](&v5, sel_dealloc);
}

- (id)description
{
  MRNowPlayingController *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRNowPlayingController configuration](v2, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@ %@"), v4, v2, v5, v2->_impl);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v6;
}

- (id)debugDescription
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v35 = objc_alloc(MEMORY[0x1E0CB3940]);
  v33 = objc_opt_class();
  -[MRNowPlayingController configuration](self, "configuration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v38);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingController allocationDate](self, "allocationDate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingController allocationDate](self, "allocationDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "timeIntervalSinceNow");
  v4 = -v3;
  -[MRNowPlayingController beginDate](self, "beginDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingController beginDate](self, "beginDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "timeIntervalSinceNow");
  v6 = -v5;
  -[MRNowPlayingController endDate](self, "endDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingController endDate](self, "endDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "timeIntervalSinceNow");
  v8 = -v7;
  -[MRNowPlayingController lastInitialLoadDate](self, "lastInitialLoadDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingController lastInitialLoadDate](self, "lastInitialLoadDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "timeIntervalSinceNow");
  v10 = -v9;
  -[MRNowPlayingController lastUpdateDate](self, "lastUpdateDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingController lastUpdateDate](self, "lastUpdateDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "timeIntervalSinceNow");
  v12 = -v11;
  -[MRNowPlayingController lastInvalidationDate](self, "lastInvalidationDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingController lastInvalidationDate](self, "lastInvalidationDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "timeIntervalSinceNow");
  v14 = -v13;
  -[MRNowPlayingController lastErrorDate](self, "lastErrorDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingController lastErrorDate](self, "lastErrorDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceNow");
  v18 = -v17;
  -[MRNowPlayingController lastError](self, "lastError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingController impl](self, "impl");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingController response](self, "response");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("<%@ %p {\n   configuration=      %@   allocationDate=     %@ (%lf seconds ago)\n   beginDate=          %@ (%lf seconds ago)\n   endDate=            %@ (%lf seconds ago)\n   intialLoadDate=     %@ (%lf seconds ago)\n   updateDate=         %@ (%lf seconds ago)\n   invalidationDate=   %@ (%lf seconds ago)\n   lastErrorDate=      %@ (%lf seconds ago)\n   lastError=          %@\n   impl=               %@\n   response=           %@\n}>\n"), v33, self, v32, v41, *(_QWORD *)&v4, v30, *(_QWORD *)&v6, v40, *(_QWORD *)&v8, v39, *(_QWORD *)&v10, v27, *(_QWORD *)&v12, v26, *(_QWORD *)&v14, v15,
                  *(_QWORD *)&v18,
                  v19,
                  v21,
                  v23);

  return v24;
}

- (void)setDelegate:(id)a3
{
  id v4;
  MRNowPlayingController *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (MRNowPlayingControllerImpl)impl
{
  MRNowPlayingController *v2;
  MRNowPlayingControllerImpl *impl;
  uint64_t v4;
  MRNowPlayingControllerImpl *v5;
  void *v6;
  MRNowPlayingControllerImpl *v7;

  v2 = self;
  objc_sync_enter(v2);
  impl = v2->_impl;
  if (!impl)
  {
    -[MRNowPlayingController _createImplWithConfiguration:](v2, "_createImplWithConfiguration:", v2->_configuration);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_impl;
    v2->_impl = (MRNowPlayingControllerImpl *)v4;

    -[MRNowPlayingController _makeHelper](v2, "_makeHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRNowPlayingControllerImpl setHelper:](v2->_impl, "setHelper:", v6);

    impl = v2->_impl;
  }
  v7 = impl;
  objc_sync_exit(v2);

  return v7;
}

- (void)beginLoadingUpdates
{
  uint64_t v2;
  NSDate *beginDate;
  void *v4;
  MRNowPlayingController *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = objc_claimAutoreleasedReturnValue();
  beginDate = obj->_beginDate;
  obj->_beginDate = (NSDate *)v2;

  -[MRNowPlayingController impl](obj, "impl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginLoadingUpdates");

  objc_sync_exit(obj);
}

- (void)endLoadingUpdates
{
  uint64_t v2;
  NSDate *endDate;
  MRNowPlayingControllerImpl *impl;
  MRNowPlayingController *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = objc_claimAutoreleasedReturnValue();
  endDate = obj->_endDate;
  obj->_endDate = (NSDate *)v2;

  -[MRNowPlayingControllerImpl setHelper:](obj->_impl, "setHelper:", 0);
  impl = obj->_impl;
  obj->_impl = 0;

  objc_sync_exit(obj);
}

- (void)performRequestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[MRNowPlayingController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__MRNowPlayingController_performRequestWithCompletion___block_invoke;
  v8[3] = &unk_1E30C99E8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "performRequest:withCompletion:", v6, v8);

}

void __55__MRNowPlayingController_performRequestWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);

}

+ (void)performRequest:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MRNowPlayingController *v14;
  MRNowPlayingControllerHelper *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  MRNowPlayingControllerHelper *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  MRNowPlayingController *v26;
  void *v27;
  MRBlockGuard *v28;
  id v29;
  MRBlockGuard *v30;
  id v31;
  id v32;
  MRBlockGuard *v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  MRBlockGuard *v38;
  id v39;
  _QWORD v40[4];
  MRBlockGuard *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  MRNowPlayingController *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  MRNowPlayingControllerHelper *v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MRNowPlayingController.m"), 422, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v12, "setSingleShot:", 1);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("performRequestWithCompletion<%@>"), v10);
  objc_msgSend(v12, "setLabel:", v13);

  v14 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v12);
  v15 = objc_alloc_init(MRNowPlayingControllerHelper);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NowPlayingController<%p>.performRequestWithCompletion"), v14);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v16, v10);
  v18 = v17;
  if (v7)
    objc_msgSend(v17, "appendFormat:", CFSTR(" for %@"), v7);
  _MRLogForCategory(0xAuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v18;
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v36 = v18;
  v20 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __56__MRNowPlayingController_performRequest_withCompletion___block_invoke;
  v45[3] = &unk_1E30C8EA0;
  v46 = v14;
  v47 = v7;
  v48 = v16;
  v49 = v10;
  v51 = v15;
  v52 = v8;
  v50 = v11;
  v21 = v15;
  v35 = v8;
  v22 = v11;
  v23 = v10;
  v24 = v16;
  v25 = v7;
  v26 = v14;
  v27 = (void *)MEMORY[0x194036C44](v45);
  v28 = [MRBlockGuard alloc];
  v43[0] = v20;
  v43[1] = 3221225472;
  v43[2] = __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_217;
  v43[3] = &unk_1E30C6798;
  v29 = v27;
  v44 = v29;
  v40[0] = v20;
  v40[1] = 3221225472;
  v40[2] = __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_2;
  v40[3] = &unk_1E30CE918;
  v30 = -[MRBlockGuard initWithTimeout:reason:handler:](v28, "initWithTimeout:reason:handler:", v24, v43, 30.0);
  v41 = v30;
  v31 = v29;
  v42 = v31;
  -[MRNowPlayingControllerHelper setDidLoadResponse:](v21, "setDidLoadResponse:", v40);
  v37[0] = v20;
  v37[1] = 3221225472;
  v37[2] = __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_3;
  v37[3] = &unk_1E30C75E8;
  v38 = v30;
  v39 = v31;
  v32 = v31;
  v33 = v30;
  -[MRNowPlayingControllerHelper setDidFailWithError:](v21, "setDidFailWithError:", v37);
  -[MRNowPlayingController setDelegate:](v26, "setDelegate:", v21);
  -[MRNowPlayingController beginLoadingUpdates](v26, "beginLoadingUpdates");

}

void __56__MRNowPlayingController_performRequest_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "endLoadingUpdates");
  v7 = *(_QWORD *)(a1 + 40);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        v12 = *(_QWORD *)(a1 + 48);
        v11 = *(_QWORD *)(a1 + 56);
        v13 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
        v35 = 138544386;
        v36 = v12;
        v37 = 2114;
        v38 = v11;
        v39 = 2112;
        v40 = v5;
        v41 = 2114;
        v42 = v13;
        v43 = 2048;
        v44 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v9;
        v18 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v35, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10)
      goto LABEL_22;
    v29 = *(_QWORD *)(a1 + 48);
    v30 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    v35 = 138544130;
    v36 = v29;
    v37 = 2114;
    v38 = v30;
    v39 = 2112;
    v40 = v5;
    v41 = 2048;
    v42 = v31;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v17 = v9;
    v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        v21 = *(_QWORD *)(a1 + 48);
        v20 = *(_QWORD *)(a1 + 56);
        v22 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
        v35 = 138544386;
        v36 = v21;
        v37 = 2114;
        v38 = v20;
        v39 = 2114;
        v40 = v6;
        v41 = 2114;
        v42 = v22;
        v43 = 2048;
        v44 = v23;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v35, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_cold_1(a1);
    }
    goto LABEL_22;
  }
  v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24)
      goto LABEL_22;
    v32 = *(_QWORD *)(a1 + 48);
    v33 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    v35 = 138543874;
    v36 = v32;
    v37 = 2114;
    v38 = v33;
    v39 = 2048;
    v40 = v34;
    v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v17 = v9;
    v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    v26 = *(_QWORD *)(a1 + 48);
    v25 = *(_QWORD *)(a1 + 56);
    v27 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    v35 = 138544130;
    v36 = v26;
    v37 = 2114;
    v38 = v25;
    v39 = 2114;
    v40 = v27;
    v41 = 2048;
    v42 = v28;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  objc_msgSend(*(id *)(a1 + 72), "setDidLoadResponse:", 0);
  objc_msgSend(*(id *)(a1 + 72), "setDidFailWithError:", 0);

}

uint64_t __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_217(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)sendCommand:(unsigned int)a3 toDestination:(id)a4 options:(id)a5 appOptions:(unsigned int)a6 withCompletion:(id)a7
{
  id v9;
  id v10;
  id v11;
  MRNowPlayingControllerConfiguration *v12;
  MRNowPlayingController *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  qos_class_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  MRBlockGuard *v30;
  id v31;
  id v32;
  MRBlockGuard *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  MRNowPlayingControllerConfiguration *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  unsigned int v50;
  unsigned int v51;
  _QWORD v52[4];
  MRBlockGuard *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a7;
  v12 = -[MRNowPlayingControllerConfiguration initWithDestination:]([MRNowPlayingControllerConfiguration alloc], "initWithDestination:", v9);
  -[MRNowPlayingControllerConfiguration setSingleShot:](v12, "setSingleShot:", 1);
  v45 = v12;
  v13 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v12);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NowPlayingController<%p>.sendCommand"), v13);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v19, v16);
  v21 = v20;
  if (v9)
    objc_msgSend(v20, "appendFormat:", CFSTR(" for %@"), v9);
  _MRLogForCategory(0xAuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v65 = v21;
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v23 = qos_class_self();
  dispatch_get_global_queue(v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v21;
  v25 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke;
  v57[3] = &unk_1E30CE940;
  v58 = v9;
  v59 = v19;
  v60 = v16;
  v61 = v18;
  v26 = v24;
  v62 = v26;
  v63 = v11;
  v41 = v11;
  v40 = v18;
  v39 = v16;
  v27 = v19;
  v28 = v9;
  v29 = (void *)MEMORY[0x194036C44](v57);
  v30 = [MRBlockGuard alloc];
  v55[0] = v25;
  v55[1] = 3221225472;
  v55[2] = __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_2;
  v55[3] = &unk_1E30C6798;
  v31 = v29;
  v56 = v31;
  v52[0] = v25;
  v52[1] = 3221225472;
  v52[2] = __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_3;
  v52[3] = &unk_1E30CB220;
  v53 = -[MRBlockGuard initWithTimeout:reason:handler:](v30, "initWithTimeout:reason:handler:", v27, v55, 45.0);
  v54 = v31;
  v32 = v31;
  v33 = v53;
  v34 = (void *)MEMORY[0x194036C44](v52);
  -[MRNowPlayingController impl](v13, "impl");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v25;
  v46[1] = 3221225472;
  v46[2] = __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_4;
  v46[3] = &unk_1E30CE968;
  v50 = a3;
  v51 = a6;
  v47 = v10;
  v48 = v26;
  v49 = v34;
  v36 = v34;
  v37 = v26;
  v38 = v10;
  objc_msgSend(v35, "destinationWithCompletion:", v46);

}

void __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    _MRLogForCategory(0xAuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        v9 = *(_QWORD *)(a1 + 40);
        v8 = *(_QWORD *)(a1 + 48);
        v10 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544386;
        v40 = v9;
        v41 = 2114;
        v42 = v8;
        v43 = 2112;
        v44 = v3;
        v45 = 2114;
        v46 = v10;
        v47 = 2048;
        v48 = v12;
        v13 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v14 = v6;
        v15 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v7)
      goto LABEL_22;
    v30 = *(_QWORD *)(a1 + 40);
    v31 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v40 = v30;
    v41 = 2114;
    v42 = v31;
    v43 = 2112;
    v44 = v3;
    v45 = 2048;
    v46 = v32;
    v13 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v14 = v6;
    v15 = 42;
    goto LABEL_16;
  }
  objc_msgSend(v3, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v18 = objc_claimAutoreleasedReturnValue();
  v6 = v18;
  if (v16)
  {
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
      {
        v20 = *(_QWORD *)(a1 + 40);
        v21 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v3, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544386;
        v40 = v20;
        v41 = 2114;
        v42 = v21;
        v43 = 2114;
        v44 = v11;
        v45 = 2114;
        v46 = v22;
        v47 = 2048;
        v48 = v24;
        _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);

LABEL_17:
        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_cold_1(a1, v3);
    }
    goto LABEL_22;
  }
  v25 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (!v17)
  {
    if (!v25)
      goto LABEL_22;
    v33 = *(_QWORD *)(a1 + 40);
    v34 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138543874;
    v40 = v33;
    v41 = 2114;
    v42 = v34;
    v43 = 2048;
    v44 = v35;
    v13 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v14 = v6;
    v15 = 32;
    goto LABEL_16;
  }
  if (v25)
  {
    v27 = *(_QWORD *)(a1 + 40);
    v26 = *(_QWORD *)(a1 + 48);
    v28 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v40 = v27;
    v41 = 2114;
    v42 = v26;
    v43 = 2114;
    v44 = v28;
    v45 = 2048;
    v46 = v29;
    v13 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  v37 = v3;
  v38 = *(id *)(a1 + 72);
  v36 = v3;
  msv_dispatch_async_on_queue();

}

uint64_t __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_222(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  MRCommandResult *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = -[MRCommandResult initWithWithSendError:description:]([MRCommandResult alloc], "initWithWithSendError:description:", 5, CFSTR("Timedout waiting for command result"));
  (*(void (**)(uint64_t, MRCommandResult *))(v1 + 16))(v1, v2);

}

void __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  MRCommandResult *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v9, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    MRMediaRemoteSendCommandToPlayerWithResult(*(unsigned int *)(a1 + 56), *(void **)(a1 + 32), v9, *(unsigned int *)(a1 + 60), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = -[MRCommandResult initWithError:]([MRCommandResult alloc], "initWithError:", v5);
    (*(void (**)(uint64_t, MRCommandResult *))(v7 + 16))(v7, v8);

  }
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 completion:(id)a5
{
  -[MRNowPlayingController sendCommand:options:appOptions:completion:](self, "sendCommand:options:appOptions:completion:", *(_QWORD *)&a3, a4, 0, a5);
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 appOptions:(unsigned int)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  MRBlockGuard *v28;
  id v29;
  MRBlockGuard *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v42;
  _QWORD v43[4];
  MRBlockGuard *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a6;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NowPlayingController<%p>.sendCommand"), self);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v10, v13);
  -[MRNowPlayingController configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "destination");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[MRNowPlayingController configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "destination");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendFormat:", CFSTR(" for %@"), v20);

  }
  v42 = v8;
  _MRLogForCategory(0xAuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v16;
    _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }
  v39 = v16;

  v22 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __68__MRNowPlayingController_sendCommand_options_appOptions_completion___block_invoke;
  v48[3] = &unk_1E30CB0C0;
  v48[4] = self;
  v23 = v10;
  v49 = v23;
  v24 = v13;
  v50 = v24;
  v25 = v15;
  v51 = v25;
  v26 = v9;
  v52 = v26;
  v27 = (void *)MEMORY[0x194036C44](v48);
  v28 = [MRBlockGuard alloc];
  v46[0] = v22;
  v46[1] = 3221225472;
  v46[2] = __68__MRNowPlayingController_sendCommand_options_appOptions_completion___block_invoke_229;
  v46[3] = &unk_1E30C6798;
  v29 = v27;
  v47 = v29;
  v43[0] = v22;
  v43[1] = 3221225472;
  v43[2] = __68__MRNowPlayingController_sendCommand_options_appOptions_completion___block_invoke_2;
  v43[3] = &unk_1E30CB220;
  v30 = -[MRBlockGuard initWithTimeout:reason:handler:](v28, "initWithTimeout:reason:handler:", v23, v46, 45.0);
  v44 = v30;
  v31 = v29;
  v45 = v31;
  v32 = (void *)MEMORY[0x194036C44](v43);
  -[MRNowPlayingController playerPath](self, "playerPath");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "origin");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[MRNowPlayingController workerQueue](self, "workerQueue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v42;
    MRMediaRemoteSendCommandToPlayerWithResult(a3, v42, v33, a5, v35, v32);
  }
  else
  {
    v37 = objc_opt_class();
    -[MRNowPlayingControllerConfiguration destination](self->_configuration, "destination");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    v36 = v42;
    objc_msgSend(v38, "sendCommand:toDestination:options:appOptions:withCompletion:", a3, v35, v42, a5, v32);
  }

}

void __68__MRNowPlayingController_sendCommand_options_appOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "destination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    _MRLogForCategory(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v8)
        goto LABEL_23;
      v10 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "destination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      v41 = 138544386;
      v42 = v10;
      v43 = 2114;
      v44 = v9;
      v45 = 2112;
      v46 = v3;
      v47 = 2114;
      v48 = v12;
      v49 = 2048;
      v50 = v14;
      v15 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v16 = v7;
      v17 = 52;
LABEL_13:
      _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v41, v17);
LABEL_14:

LABEL_22:
      goto LABEL_23;
    }
    if (!v8)
      goto LABEL_23;
    v31 = *(_QWORD *)(a1 + 40);
    v32 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v41 = 138544130;
    v42 = v31;
    v43 = 2114;
    v44 = v32;
    v45 = 2112;
    v46 = v3;
    v47 = 2048;
    v48 = v33;
    v34 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    v35 = v7;
    v36 = 42;
    goto LABEL_21;
  }
  objc_msgSend(v3, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "destination");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory(0xAuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  v7 = v21;
  if (!v18)
  {
    v27 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (!v27)
        goto LABEL_23;
      v29 = *(_QWORD *)(a1 + 40);
      v28 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "destination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      v41 = 138544130;
      v42 = v29;
      v43 = 2114;
      v44 = v28;
      v45 = 2114;
      v46 = v12;
      v47 = 2048;
      v48 = v30;
      v15 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v16 = v7;
      v17 = 42;
      goto LABEL_13;
    }
    if (!v27)
      goto LABEL_23;
    v37 = *(_QWORD *)(a1 + 40);
    v38 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v41 = 138543874;
    v42 = v37;
    v43 = 2114;
    v44 = v38;
    v45 = 2048;
    v46 = v39;
    v34 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v35 = v7;
    v36 = 32;
LABEL_21:
    _os_log_impl(&dword_193827000, v35, OS_LOG_TYPE_DEFAULT, v34, (uint8_t *)&v41, v36);
    goto LABEL_22;
  }
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
  if (v20)
  {
    if (!v22)
      goto LABEL_23;
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "destination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v41 = 138544386;
    v42 = v23;
    v43 = 2114;
    v44 = v24;
    v45 = 2114;
    v46 = v11;
    v47 = 2114;
    v48 = v13;
    v49 = 2048;
    v50 = v26;
    _os_log_error_impl(&dword_193827000, v7, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v41, 0x34u);

    goto LABEL_14;
  }
  if (v22)
    __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_cold_1(a1, v3);
LABEL_23:

  v40 = *(_QWORD *)(a1 + 64);
  if (v40)
    (*(void (**)(uint64_t, id))(v40 + 16))(v40, v3);

}

void __68__MRNowPlayingController_sendCommand_options_appOptions_completion___block_invoke_229(uint64_t a1)
{
  uint64_t v1;
  MRCommandResult *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = -[MRCommandResult initWithWithSendError:description:]([MRCommandResult alloc], "initWithWithSendError:description:", 5, CFSTR("Timedout waiting for command result"));
  (*(void (**)(uint64_t, MRCommandResult *))(v1 + 16))(v1, v2);

}

void __68__MRNowPlayingController_sendCommand_options_appOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)playerPath
{
  void *v2;
  void *v3;

  -[MRNowPlayingController destination](self, "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MRDestination)destination
{
  MRNowPlayingController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  -[MRNowPlayingPlayerResponse destination](v2->_response, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    -[MRNowPlayingControllerConfiguration destination](v2->_configuration, "destination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)objc_msgSend(v4, "copy");
  if (!v3)

  objc_sync_exit(v2);
  return (MRDestination *)v5;
}

- (MRNowPlayingPlayerResponse)response
{
  MRNowPlayingController *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[MRNowPlayingPlayerResponse copy](v2->_response, "copy");
  objc_sync_exit(v2);

  return (MRNowPlayingPlayerResponse *)v3;
}

- (MRNowPlayingControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)_notifyDelegateOfNewResponse:(id)a3
{
  id v5;
  MRNowPlayingController *v6;
  MRNowPlayingPlayerResponse *v7;
  uint64_t v8;
  NSDate *lastInitialLoadDate;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  float v27;
  float v28;
  float v29;
  float v30;
  void *v31;
  char v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  uint8_t buf[4];
  MRNowPlayingController *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v6 = self;
  objc_sync_enter(v6);
  v7 = v6->_response;
  objc_storeStrong((id *)&v6->_response, a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = objc_claimAutoreleasedReturnValue();
  lastInitialLoadDate = v6->_lastInitialLoadDate;
  v6->_lastInitialLoadDate = (NSDate *)v8;

  objc_sync_exit(v6);
  if (!-[MRNowPlayingControllerConfiguration isSingleShot](v6->_configuration, "isSingleShot"))
  {
    _MRLogForCategory(1uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v52 = v6;
      v53 = 2112;
      v54 = v11;
      _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingController] %@ NotifyLoadResponse %@", buf, 0x16u);

    }
  }
  -[MRNowPlayingController delegate](v6, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[MRNowPlayingController delegate](v6, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRNowPlayingController response](v6, "response");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "controller:didLoadResponse:", v6, v15);

  }
  if (-[MRNowPlayingControllerConfiguration wantsChangeCallbacksDuringInitialLoad](v6->_configuration, "wantsChangeCallbacksDuringInitialLoad"))
  {
    v16 = -[MRNowPlayingPlayerResponse playbackState](v7, "playbackState");
    v17 = objc_msgSend(v5, "playbackState");
    if ((_DWORD)v16 != (_DWORD)v17)
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) != 0)
      {
        -[MRNowPlayingController delegate](v6, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "controller:playbackStateDidChangeFrom:to:", v6, v16, v17);

      }
    }
    -[MRNowPlayingPlayerResponse playbackQueue](v7, "playbackQueue");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playbackQueue");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = v21;
    if (v21 != v22)
    {
      v24 = objc_msgSend(v21, "isEqual:", v22);

      if ((v24 & 1) != 0)
        goto LABEL_16;
      -[MRNowPlayingController delegate](v6, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0)
        goto LABEL_16;
      -[MRNowPlayingController delegate](v6, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "controller:playbackQueueDidChangeFrom:to:", v6, v21, v22);
    }

LABEL_16:
    -[MRNowPlayingPlayerResponse playbackRate](v7, "playbackRate");
    v28 = v27;
    objc_msgSend(v5, "playbackRate");
    v30 = v29;
    if (vabds_f32(v29, v28) > 0.001)
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_opt_respondsToSelector();

      if ((v32 & 1) != 0)
      {
        -[MRNowPlayingController delegate](v6, "delegate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v34 = v28;
        *(float *)&v35 = v30;
        objc_msgSend(v33, "controller:playbackRateDidChangeFrom:to:", v6, v34, v35);

      }
    }
    -[MRNowPlayingPlayerResponse supportedCommands](v7, "supportedCommands");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "supportedCommands");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRNowPlayingController delegate](v6, "delegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_opt_respondsToSelector();

    if ((v38 & 1) != 0)
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "controller:supportedCommandsDidChangeFrom:to:", v6, v50, v36);

    }
    v40 = -[MRNowPlayingPlayerResponse repeatMode](v7, "repeatMode");
    v41 = objc_msgSend(v5, "repeatMode");
    if ((_DWORD)v40 != (_DWORD)v41)
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_opt_respondsToSelector();

      if ((v43 & 1) != 0)
      {
        -[MRNowPlayingController delegate](v6, "delegate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "controller:repeatModeDidChangeFrom:to:", v6, v40, v41);

      }
    }
    v45 = -[MRNowPlayingPlayerResponse shuffleMode](v7, "shuffleMode");
    v46 = objc_msgSend(v5, "shuffleMode");
    if ((_DWORD)v45 != (_DWORD)v46)
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_opt_respondsToSelector();

      if ((v48 & 1) != 0)
      {
        -[MRNowPlayingController delegate](v6, "delegate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "controller:shuffleModeDidChangeFrom:to:", v6, v45, v46);

      }
    }
    -[MRNowPlayingController _notifyDelegateOfUpdate](v6, "_notifyDelegateOfUpdate");

  }
}

- (void)_notifyDelegateOfPlaybackStateChange:(unsigned int)a3
{
  uint64_t v3;
  MRNowPlayingPlayerResponse *response;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  MRNowPlayingController *obj;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  obj = self;
  objc_sync_enter(obj);
  response = obj->_response;
  if (!response)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, obj, CFSTR("MRNowPlayingController.m"), 633, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_response"));

    response = obj->_response;
  }
  v7 = -[MRNowPlayingPlayerResponse playbackState](response, "playbackState");
  if ((_DWORD)v7 == (_DWORD)v3)
  {
    objc_sync_exit(obj);

  }
  else
  {
    -[MRNowPlayingPlayerResponse setPlaybackState:](obj->_response, "setPlaybackState:", v3);
    objc_sync_exit(obj);

    -[MRNowPlayingController delegate](obj, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[MRNowPlayingController delegate](obj, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "controller:playbackStateDidChangeFrom:to:", obj, v7, v3);

    }
    -[MRNowPlayingController _notifyDelegateOfUpdate](obj, "_notifyDelegateOfUpdate");
  }
}

- (void)_notifyDelegateOfPlaybackQueueChange:(id)a3
{
  id v5;
  MRNowPlayingController *v6;
  MRNowPlayingPlayerResponse *response;
  void *v8;
  float v9;
  float v10;
  id v11;
  id v12;
  char v13;
  float v14;
  float v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v6 = self;
  objc_sync_enter(v6);
  response = v6->_response;
  if (!response)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MRNowPlayingController.m"), 660, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_response"));

    response = v6->_response;
  }
  -[MRNowPlayingPlayerResponse playbackQueue](response, "playbackQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingPlayerResponse playbackRate](v6->_response, "playbackRate");
  v10 = v9;
  v11 = v8;
  v12 = v5;
  v25 = v12;
  if (v11 == v12)
  {

    goto LABEL_12;
  }
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) != 0)
  {
LABEL_12:
    objc_sync_exit(v6);

    goto LABEL_13;
  }
  -[MRNowPlayingPlayerResponse setPlaybackQueue:](v6->_response, "setPlaybackQueue:", v25);
  -[MRNowPlayingPlayerResponse playbackRate](v6->_response, "playbackRate");
  v15 = v14;
  objc_sync_exit(v6);

  -[MRNowPlayingController delegate](v6, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[MRNowPlayingController delegate](v6, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "controller:playbackQueueDidChangeFrom:to:", v6, v11, v25);

  }
  if (vabds_f32(v15, v10) > 0.001)
  {
    -[MRNowPlayingController delegate](v6, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v22 = v10;
      *(float *)&v23 = v15;
      objc_msgSend(v21, "controller:playbackRateDidChangeFrom:to:", v6, v22, v23);

    }
  }
  -[MRNowPlayingController _notifyDelegateOfUpdate](v6, "_notifyDelegateOfUpdate");
LABEL_13:

}

- (void)_notifyDelegateOfUpdatedContentItemsWithContentItems:(id)a3
{
  id v5;
  MRNowPlayingController *v6;
  MRNowPlayingPlayerResponse *response;
  float v8;
  float v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v6 = self;
  objc_sync_enter(v6);
  response = v6->_response;
  if (!response)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MRNowPlayingController.m"), 692, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_response"));

    response = v6->_response;
  }
  -[MRNowPlayingPlayerResponse playbackRate](response, "playbackRate");
  v9 = v8;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[MRNowPlayingPlayerResponse playbackQueue](v6->_response, "playbackQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "contentItemForIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v17, "mergeFrom:", v14);
        -[MRNowPlayingPlayerResponse playbackRate](v6->_response, "playbackRate");
        v19 = v18;

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);
  }
  else
  {
    v19 = 0.0;
  }

  objc_sync_exit(v6);
  if (objc_msgSend(v10, "count"))
  {
    -[MRNowPlayingController delegate](v6, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "controller:contentItemsDidUpdateWithContentItemChanges:", v6, v10);

    }
    -[MRNowPlayingController delegate](v6, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      objc_msgSend(v10, "mr_compactMap:", &__block_literal_global_251_0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRNowPlayingController delegate](v6, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "controller:contentItemsDidUpdate:", v6, v25);

    }
    if (vabds_f32(v19, v9) > 0.001)
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_opt_respondsToSelector();

      if ((v28 & 1) != 0)
      {
        -[MRNowPlayingController delegate](v6, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v30 = v9;
        *(float *)&v31 = v19;
        objc_msgSend(v29, "controller:playbackRateDidChangeFrom:to:", v6, v30, v31);

      }
    }
    -[MRNowPlayingController _notifyDelegateOfUpdate](v6, "_notifyDelegateOfUpdate");
  }

}

uint64_t __79__MRNowPlayingController__notifyDelegateOfUpdatedContentItemsWithContentItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)_notifyDelegateOfUpdatedArtwork:(id)a3
{
  id v5;
  MRNowPlayingController *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v6 = self;
  objc_sync_enter(v6);
  if (!v6->_response)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MRNowPlayingController.m"), 728, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_response"));

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
        -[MRNowPlayingPlayerResponse playbackQueue](v6->_response, "playbackQueue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "contentItemForIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v14, "artwork");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "artwork");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v15;
          v18 = v16;
          if (v17 == v18)
          {

          }
          else
          {
            v19 = v18;
            v20 = objc_msgSend(v17, "isEqual:", v18);

            if ((v20 & 1) != 0)
              goto LABEL_14;
            objc_msgSend(v11, "artwork");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setArtwork:", v21);

            objc_msgSend(v11, "identifier");
            v17 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v17);
          }

        }
LABEL_14:

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  if (objc_msgSend(v26, "count"))
  {
    -[MRNowPlayingController delegate](v6, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "controller:didLoadArtworkForContentItems:", v6, v26);

    }
    -[MRNowPlayingController _notifyDelegateOfUpdate](v6, "_notifyDelegateOfUpdate");
  }

}

- (void)_notifyDelegateOfSupportedCommandsChange:(id)a3
{
  id v5;
  MRNowPlayingController *v6;
  MRNowPlayingPlayerResponse *response;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  id v26;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v6 = self;
  objc_sync_enter(v6);
  response = v6->_response;
  if (!response)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MRNowPlayingController.m"), 762, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_response"));

    response = v6->_response;
  }
  -[MRNowPlayingPlayerResponse supportedCommands](response, "supportedCommands");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MRNowPlayingPlayerResponse shuffleMode](v6->_response, "shuffleMode");
  v10 = -[MRNowPlayingPlayerResponse repeatMode](v6->_response, "repeatMode");
  v11 = v8;
  v12 = v5;
  v26 = v12;
  if (v11 == v12)
  {

    goto LABEL_15;
  }
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) != 0)
  {
LABEL_15:
    objc_sync_exit(v6);

    goto LABEL_16;
  }
  -[MRNowPlayingPlayerResponse setSupportedCommands:](v6->_response, "setSupportedCommands:", v26);
  v14 = -[MRNowPlayingPlayerResponse shuffleMode](v6->_response, "shuffleMode");
  v15 = -[MRNowPlayingPlayerResponse repeatMode](v6->_response, "repeatMode");
  objc_sync_exit(v6);

  -[MRNowPlayingController delegate](v6, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[MRNowPlayingController delegate](v6, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "controller:supportedCommandsDidChangeFrom:to:", v6, v11, v26);

  }
  if ((_DWORD)v10 != (_DWORD)v15)
  {
    -[MRNowPlayingController delegate](v6, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "controller:repeatModeDidChangeFrom:to:", v6, v10, v15);

    }
  }
  if ((_DWORD)v9 != (_DWORD)v14)
  {
    -[MRNowPlayingController delegate](v6, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "controller:shuffleModeDidChangeFrom:to:", v6, v9, v14);

    }
  }
  -[MRNowPlayingController _notifyDelegateOfUpdate](v6, "_notifyDelegateOfUpdate");
LABEL_16:

}

- (void)_notifyDelegateOfUpdatedDeviceLastPlayingDate:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  -[MRNowPlayingController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MRNowPlayingController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controller:deviceLastPlayingDateDidChange:", self, v7);

  }
  -[MRNowPlayingController _notifyDelegateOfUpdate](self, "_notifyDelegateOfUpdate");

}

- (void)_notifyDelegateOfUpdatedPlayerLastPlayingDate:(id)a3
{
  MRNowPlayingController *v5;
  MRNowPlayingPlayerResponse *response;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v5 = self;
  objc_sync_enter(v5);
  response = v5->_response;
  if (!response)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("MRNowPlayingController.m"), 807, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_response"), v17);

    response = v5->_response;
  }
  -[MRNowPlayingPlayerResponse playerLastPlayingDate](response, "playerLastPlayingDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5->_response)
    goto LABEL_10;
  v9 = v7;
  v10 = v17;
  v11 = v10;
  if (v9 == v10)
  {

    goto LABEL_10;
  }
  v12 = objc_msgSend(v9, "isEqual:", v10);

  if ((v12 & 1) != 0)
  {
LABEL_10:

    objc_sync_exit(v5);
    goto LABEL_11;
  }
  -[MRNowPlayingPlayerResponse setPlayerLastPlayingDate:](v5->_response, "setPlayerLastPlayingDate:", v11);

  objc_sync_exit(v5);
  -[MRNowPlayingController delegate](v5, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[MRNowPlayingController delegate](v5, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "controller:playerLastPlayingDateDidChange:", v5, v11);

  }
  -[MRNowPlayingController _notifyDelegateOfUpdate](v5, "_notifyDelegateOfUpdate");
LABEL_11:

}

- (void)_notifyDelegateOfUpdatedClientProperties:(id)a3
{
  MRNowPlayingController *v5;
  MRNowPlayingPlayerResponse *response;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v5 = self;
  objc_sync_enter(v5);
  response = v5->_response;
  if (!response)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("MRNowPlayingController.m"), 831, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_response"));

    response = v5->_response;
  }
  -[MRNowPlayingPlayerResponse clientProperties](response, "clientProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5->_response)
  {
    objc_msgSend(v7, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = v10;
    if (v11 == v12)
    {

    }
    else
    {
      v13 = v12;
      v14 = objc_msgSend(v11, "isEqual:", v12);

      if ((v14 & 1) == 0)
        -[MRNowPlayingPlayerResponse setClientProperties:](v5->_response, "setClientProperties:", v16);
    }
  }
  objc_sync_exit(v5);

}

- (void)_notifyDelegateOfPlayerPathChange:(id)a3
{
  id v4;
  MRNowPlayingController *v5;
  id v6;
  id v7;
  char v8;
  void *v9;
  char v10;
  MRNowPlayingController *v11;
  id v12;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v5 = self;
  objc_sync_enter(v5);
  -[MRNowPlayingPlayerResponse playerPath](v5->_response, "playerPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v12 = v7;
  if (v6 == v7)
  {

    objc_sync_exit(v5);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v6, "isEqual:", v7);

  objc_sync_exit(v5);
  if ((v8 & 1) == 0)
  {
    -[MRNowPlayingController delegate](v5, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[MRNowPlayingController delegate](v5, "delegate");
      v11 = (MRNowPlayingController *)objc_claimAutoreleasedReturnValue();
      -[MRNowPlayingController controller:playerPathDidChange:](v11, "controller:playerPathDidChange:", v5, v12);
      v5 = v11;
LABEL_6:

    }
  }

}

- (void)_notifyDelegateOfUpdate
{
  NSDate *v3;
  NSDate *lastUpdateDate;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  MRNowPlayingController *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdateDate = self->_lastUpdateDate;
  self->_lastUpdateDate = v3;

  if (!-[MRNowPlayingControllerConfiguration isSingleShot](self->_configuration, "isSingleShot"))
  {
    _MRLogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[MRNowPlayingController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingController] %@ NotifyUpdate %@", (uint8_t *)&v11, 0x16u);

    }
  }
  -[MRNowPlayingController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[MRNowPlayingController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRNowPlayingController response](self, "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "controller:didUpdateResponse:", self, v10);

  }
}

- (void)_notifyDelegateOfError:(id)a3
{
  id v5;
  MRNowPlayingController *v6;
  uint64_t v7;
  NSDate *lastErrorDate;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  MRNowPlayingController *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = objc_claimAutoreleasedReturnValue();
  lastErrorDate = v6->_lastErrorDate;
  v6->_lastErrorDate = (NSDate *)v7;

  objc_storeStrong((id *)&v6->_lastError, a3);
  objc_sync_exit(v6);

  if (!-[MRNowPlayingControllerConfiguration isSingleShot](v6->_configuration, "isSingleShot"))
  {
    _MRLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[MRNowPlayingController delegate](v6, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v6;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingController] %@ NotifyError %@ %@", (uint8_t *)&v14, 0x20u);

    }
  }
  -[MRNowPlayingController delegate](v6, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[MRNowPlayingController delegate](v6, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "controller:didFailWithError:", v6, v5);

  }
}

- (void)_notifyDelegateOfInvalidation
{
  MRNowPlayingController *v3;
  uint64_t v4;
  NSDate *lastInvalidationDate;
  MRNowPlayingPlayerResponse *response;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  MRNowPlayingController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  v3 = self;
  objc_sync_enter(v3);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = objc_claimAutoreleasedReturnValue();
  lastInvalidationDate = v3->_lastInvalidationDate;
  v3->_lastInvalidationDate = (NSDate *)v4;

  response = v3->_response;
  v3->_response = 0;

  objc_sync_exit(v3);
  if (!-[MRNowPlayingControllerConfiguration isSingleShot](v3->_configuration, "isSingleShot"))
  {
    _MRLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[MRNowPlayingController delegate](v3, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingController] %@ NotifyInvalidated %@", (uint8_t *)&v12, 0x16u);

    }
  }
  -[MRNowPlayingController delegate](v3, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[MRNowPlayingController delegate](v3, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "controllerWillReloadForInvalidation:", v3);

  }
}

- (id)_createImplWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  int v5;
  __objc2_class **v6;
  void *v7;

  v3 = a3;
  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "nowPlayingControllerVersion");

  if ((v5 - 1) > 2)
    v6 = off_1E30C20D0;
  else
    v6 = off_1E30CEA78[v5 - 1];
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithConfiguration:", v3);

  return v7;
}

- (id)_makeHelper
{
  MRNowPlayingControllerHelper *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location[2];

  v3 = objc_alloc_init(MRNowPlayingControllerHelper);
  objc_initWeak(location, self);
  v4 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __37__MRNowPlayingController__makeHelper__block_invoke;
  v26[3] = &unk_1E30CE990;
  objc_copyWeak(&v27, location);
  -[MRNowPlayingControllerHelper setDidLoadResponse:](v3, "setDidLoadResponse:", v26);
  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __37__MRNowPlayingController__makeHelper__block_invoke_3;
  v24[3] = &unk_1E30CE9B8;
  objc_copyWeak(&v25, location);
  -[MRNowPlayingControllerHelper setPlaybackStateDidChange:](v3, "setPlaybackStateDidChange:", v24);
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __37__MRNowPlayingController__makeHelper__block_invoke_5;
  v22[3] = &unk_1E30CE9E0;
  objc_copyWeak(&v23, location);
  -[MRNowPlayingControllerHelper setPlaybackQueueDidChange:](v3, "setPlaybackQueueDidChange:", v22);
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __37__MRNowPlayingController__makeHelper__block_invoke_7;
  v20[3] = &unk_1E30C7050;
  objc_copyWeak(&v21, location);
  -[MRNowPlayingControllerHelper setContentItemsDidUpdate:](v3, "setContentItemsDidUpdate:", v20);
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __37__MRNowPlayingController__makeHelper__block_invoke_9;
  v18[3] = &unk_1E30C7050;
  objc_copyWeak(&v19, location);
  -[MRNowPlayingControllerHelper setContentItemsDidLoadArtwork:](v3, "setContentItemsDidLoadArtwork:", v18);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __37__MRNowPlayingController__makeHelper__block_invoke_11;
  v16[3] = &unk_1E30C7050;
  objc_copyWeak(&v17, location);
  -[MRNowPlayingControllerHelper setSupportedCommandsDidChange:](v3, "setSupportedCommandsDidChange:", v16);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __37__MRNowPlayingController__makeHelper__block_invoke_13;
  v14[3] = &unk_1E30CEA08;
  objc_copyWeak(&v15, location);
  -[MRNowPlayingControllerHelper setPlayerLastPlayingDateDidChange:](v3, "setPlayerLastPlayingDateDidChange:", v14);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __37__MRNowPlayingController__makeHelper__block_invoke_15;
  v12[3] = &unk_1E30CEA30;
  objc_copyWeak(&v13, location);
  -[MRNowPlayingControllerHelper setClientPropertiesDidChange:](v3, "setClientPropertiesDidChange:", v12);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __37__MRNowPlayingController__makeHelper__block_invoke_17;
  v10[3] = &unk_1E30C9CF0;
  objc_copyWeak(&v11, location);
  -[MRNowPlayingControllerHelper setPlayerPathDidChange:](v3, "setPlayerPathDidChange:", v10);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __37__MRNowPlayingController__makeHelper__block_invoke_19;
  v8[3] = &unk_1E30C6AA0;
  objc_copyWeak(&v9, location);
  -[MRNowPlayingControllerHelper setDidInvalidate:](v3, "setDidInvalidate:", v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __37__MRNowPlayingController__makeHelper__block_invoke_21;
  v6[3] = &unk_1E30CEA58;
  objc_copyWeak(&v7, location);
  -[MRNowPlayingControllerHelper setDidFailWithError:](v3, "setDidFailWithError:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(location);
  return v3;
}

void __37__MRNowPlayingController__makeHelper__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_2;
    v7[3] = &unk_1E30C5F40;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfNewResponse:", *(_QWORD *)(a1 + 40));
}

void __37__MRNowPlayingController__makeHelper__block_invoke_3(uint64_t a1, int a2)
{
  NSObject **WeakRetained;
  NSObject **v4;
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__MRNowPlayingController__makeHelper__block_invoke_4;
    v6[3] = &unk_1E30C9E38;
    v6[4] = v4;
    v7 = a2;
    dispatch_async(v5, v6);
  }

}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfPlaybackStateChange:", *(unsigned int *)(a1 + 40));
}

void __37__MRNowPlayingController__makeHelper__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_6;
    v7[3] = &unk_1E30C5F40;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfPlaybackQueueChange:", *(_QWORD *)(a1 + 40));
}

void __37__MRNowPlayingController__makeHelper__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_8;
    v7[3] = &unk_1E30C5F40;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfUpdatedContentItemsWithContentItems:", *(_QWORD *)(a1 + 40));
}

void __37__MRNowPlayingController__makeHelper__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_10;
    v7[3] = &unk_1E30C5F40;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfUpdatedArtwork:", *(_QWORD *)(a1 + 40));
}

void __37__MRNowPlayingController__makeHelper__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_12;
    v7[3] = &unk_1E30C5F40;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfSupportedCommandsChange:", *(_QWORD *)(a1 + 40));
}

void __37__MRNowPlayingController__makeHelper__block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_14;
    v7[3] = &unk_1E30C5F40;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfUpdatedDeviceLastPlayingDate:", *(_QWORD *)(a1 + 40));
}

void __37__MRNowPlayingController__makeHelper__block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_16;
    v7[3] = &unk_1E30C5F40;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfUpdatedClientProperties:", *(_QWORD *)(a1 + 40));
}

void __37__MRNowPlayingController__makeHelper__block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_18;
    v7[3] = &unk_1E30C5F40;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfPlayerPathChange:", *(_QWORD *)(a1 + 40));
}

void __37__MRNowPlayingController__makeHelper__block_invoke_19(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[5];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__MRNowPlayingController__makeHelper__block_invoke_20;
    block[3] = &unk_1E30C5CA8;
    block[4] = v2;
    dispatch_async(v3, block);
  }

}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfInvalidation");
}

void __37__MRNowPlayingController__makeHelper__block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MRNowPlayingController__makeHelper__block_invoke_22;
    v7[3] = &unk_1E30C5F40;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __37__MRNowPlayingController__makeHelper__block_invoke_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfError:", *(_QWORD *)(a1 + 40));
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (MRNowPlayingControllerDelegate)delegate
{
  return (MRNowPlayingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setImpl:(id)a3
{
  objc_storeStrong((id *)&self->_impl, a3);
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workerQueue, a3);
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
  objc_storeStrong((id *)&self->_lastError, a3);
}

- (NSDate)allocationDate
{
  return self->_allocationDate;
}

- (void)setAllocationDate:(id)a3
{
  objc_storeStrong((id *)&self->_allocationDate, a3);
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void)setBeginDate:(id)a3
{
  objc_storeStrong((id *)&self->_beginDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSDate)lastInitialLoadDate
{
  return self->_lastInitialLoadDate;
}

- (void)setLastInitialLoadDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastInitialLoadDate, a3);
}

- (NSDate)lastInvalidationDate
{
  return self->_lastInvalidationDate;
}

- (void)setLastInvalidationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastInvalidationDate, a3);
}

- (NSDate)lastErrorDate
{
  return self->_lastErrorDate;
}

- (void)setLastErrorDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastErrorDate, a3);
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_lastErrorDate, 0);
  objc_storeStrong((id *)&self->_lastInvalidationDate, 0);
  objc_storeStrong((id *)&self->_lastInitialLoadDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_allocationDate, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_impl, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_response, 0);
}

void __56__MRNowPlayingController_performRequest_withCompletion___block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0();
}

void __86__MRNowPlayingController_sendCommand_toDestination_options_appOptions_withCompletion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend(a2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_6(v4, v5);
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_1(&dword_193827000, v6, v7, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0();
}

@end
