@implementation MRAVReconnaissanceSession

- (MRAVReconnaissanceSession)initWithOutputDeviceUIDs:(id)a3 outputDeviceGroupID:(id)a4 features:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  MRRequestDetails *v10;
  MRAVReconnaissanceSession *v11;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  v10 = -[MRRequestDetails initWithName:requestID:reason:]([MRRequestDetails alloc], "initWithName:requestID:reason:", CFSTR("ReconSession"), 0, 0);
  v11 = -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:details:](self, "initWithOutputDeviceUIDs:outputDeviceGroupID:features:details:", v9, v8, v5, v10);

  return v11;
}

- (MRAVReconnaissanceSession)initWithOutputDeviceUIDs:(id)a3 outputDeviceGroupID:(id)a4 features:(unsigned int)a5 details:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  MRAVReconnaissanceSession *v13;
  NSObject *v14;
  qos_class_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *serialQueue;
  NSMutableDictionary *v19;
  NSMutableDictionary *matchingDevicesFound;
  NSMutableArray *v21;
  NSMutableArray *matchingEndpointsFound;
  NSMutableDictionary *v23;
  NSMutableDictionary *localMatchingDevicesFound;
  uint64_t v25;
  NSSet *matchingOutputDeviceUIDsSet;
  uint64_t v27;
  NSString *matchingOutputDeviceGroupID;
  uint64_t v29;
  MRAVRoutingDiscoverySession *discoverySession;
  MRAVRoutingDiscoverySession *v31;
  uint64_t v32;
  uint64_t v33;
  id discoverySessionCallbackToken;
  MRAVRoutingDiscoverySession *v35;
  id v36;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  objc_super v43;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v43.receiver = self;
  v43.super_class = (Class)MRAVReconnaissanceSession;
  v13 = -[MRAVReconnaissanceSession init](&v43, sel_init);
  if (v13)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(v14, v15, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.MediaRemote.MRAVReconnaissanceSession", v16);
    serialQueue = v13->_serialQueue;
    v13->_serialQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v13->_details, a6);
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    matchingDevicesFound = v13->_matchingDevicesFound;
    v13->_matchingDevicesFound = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    matchingEndpointsFound = v13->_matchingEndpointsFound;
    v13->_matchingEndpointsFound = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    localMatchingDevicesFound = v13->_localMatchingDevicesFound;
    v13->_localMatchingDevicesFound = v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v10);
    matchingOutputDeviceUIDsSet = v13->_matchingOutputDeviceUIDsSet;
    v13->_matchingOutputDeviceUIDsSet = (NSSet *)v25;

    v27 = objc_msgSend(v11, "copy");
    matchingOutputDeviceGroupID = v13->_matchingOutputDeviceGroupID;
    v13->_matchingOutputDeviceGroupID = (NSString *)v27;

    +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:](MRAVRoutingDiscoverySession, "discoverySessionWithEndpointFeatures:", v7);
    v29 = objc_claimAutoreleasedReturnValue();
    discoverySession = v13->_discoverySession;
    v13->_discoverySession = (MRAVRoutingDiscoverySession *)v29;

    v13->_shouldWaitForUnanimousEndpoints = (v7 & 8) != 0;
    v13->_updatesReceived = 0;
    v13->_returnPartialResults = -[NSString length](v13->_matchingOutputDeviceGroupID, "length") != 0;
    objc_initWeak(&location, v13);
    v31 = v13->_discoverySession;
    v32 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke;
    v40[3] = &unk_1E30C7050;
    objc_copyWeak(&v41, &location);
    -[MRAVRoutingDiscoverySession addEndpointsChangedCallback:](v31, "addEndpointsChangedCallback:", v40);
    v33 = objc_claimAutoreleasedReturnValue();
    discoverySessionCallbackToken = v13->_discoverySessionCallbackToken;
    v13->_discoverySessionCallbackToken = (id)v33;

    v35 = v13->_discoverySession;
    v38[0] = v32;
    v38[1] = 3221225472;
    v38[2] = __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke_3;
    v38[3] = &unk_1E30C7050;
    objc_copyWeak(&v39, &location);
    v36 = -[MRAVRoutingDiscoverySession addOutputDevicesChangedCallback:](v35, "addOutputDevicesChangedCallback:", v38);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke_2;
    v7[3] = &unk_1E30C5F40;
    v8 = WeakRetained;
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

void __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke_2(uint64_t a1)
{
  -[MRAVReconnaissanceSession _onQueue_updateCachedOutputDevices:endpoints:](*(_QWORD *)(a1 + 32), 0, *(void **)(a1 + 40));
}

- (void)_onQueue_updateCachedOutputDevices:(void *)a3 endpoints:
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (a1)
  {
    if (v7)
      objc_storeStrong((id *)(a1 + 136), a2);
    if (v6)
      objc_storeStrong((id *)(a1 + 144), a3);
    ++*(_QWORD *)(a1 + 152);
    objc_storeStrong((id *)(a1 + 160), *(id *)(a1 + 136));
    objc_storeStrong((id *)(a1 + 168), *(id *)(a1 + 144));
    -[MRAVReconnaissanceSession _onQueue_processSearchLoop](a1);
  }

}

void __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke_4;
    v7[3] = &unk_1E30C5F40;
    v8 = WeakRetained;
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

void __91__MRAVReconnaissanceSession_initWithOutputDeviceUIDs_outputDeviceGroupID_features_details___block_invoke_4(uint64_t a1)
{
  -[MRAVReconnaissanceSession _onQueue_updateCachedOutputDevices:endpoints:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  MRAVReconnaissanceSession *v8;

  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __36__MRAVReconnaissanceSession_dealloc__block_invoke;
  v7 = &unk_1E30C5CA8;
  v8 = self;
  msv_dispatch_sync_on_queue();
  -[MRAVRoutingDiscoverySession removeEndpointsChangedCallback:](self->_discoverySession, "removeEndpointsChangedCallback:", self->_discoverySessionCallbackToken);
  v3.receiver = self;
  v3.super_class = (Class)MRAVReconnaissanceSession;
  -[MRAVReconnaissanceSession dealloc](&v3, sel_dealloc);
}

void __36__MRAVReconnaissanceSession_dealloc__block_invoke(uint64_t a1)
{
  -[MRAVReconnaissanceSession _onQueue_cancelSearch](*(_QWORD *)(a1 + 32));
}

- (void)_onQueue_cancelSearch
{
  NSObject *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(_BYTE *)(a1 + 44))
    {
      _MRLogForCategory(0);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 138543362;
        v5 = a1;
        _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Cancelling search for session %{public}@", (uint8_t *)&v4, 0xCu);
      }

      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 25, CFSTR("Operation was manually canceled via a explict call to CancelSearch"));
      -[MRAVReconnaissanceSession _onQueue_invokeCompletionWithMatchingDevices:matchingEndpoints:unanimousEndpoint:error:]((id *)a1, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA60], 0, v3);

    }
    -[MRAVReconnaissanceSession _onQueue_endSearch](a1);
  }
}

- (NSArray)matchingOutputDeviceUIDs
{
  return -[NSSet allObjects](self->_matchingOutputDeviceUIDsSet, "allObjects");
}

- (NSString)matchingOutputDeviceGroupID
{
  return self->_matchingOutputDeviceGroupID;
}

- (unsigned)endpointFeatures
{
  return -[MRAVRoutingDiscoverySession endpointFeatures](self->_discoverySession, "endpointFeatures");
}

- (void)beginSearchWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__MRAVReconnaissanceSession_beginSearchWithTimeout_completion___block_invoke;
  v8[3] = &unk_1E30D0060;
  v9 = v6;
  v7 = v6;
  -[MRAVReconnaissanceSession beginSearchWithTimeout:endpointsCompletion:](self, "beginSearchWithTimeout:endpointsCompletion:", v8, a3);

}

uint64_t __63__MRAVReconnaissanceSession_beginSearchWithTimeout_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4, a5);
  return result;
}

- (void)beginSearchWithTimeout:(double)a3 endpointsCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__MRAVReconnaissanceSession_beginSearchWithTimeout_endpointsCompletion___block_invoke;
  v8[3] = &unk_1E30D0088;
  v9 = v6;
  v7 = v6;
  -[MRAVReconnaissanceSession beginSearchWithTimeout:mapCompletion:](self, "beginSearchWithTimeout:mapCompletion:", v8, a3);

}

void __72__MRAVReconnaissanceSession_beginSearchWithTimeout_endpointsCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  if (*(_QWORD *)(a1 + 32))
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = a5;
    v11 = a4;
    v12 = a3;
    objc_msgSend(a2, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v13);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v16, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id, id, id))(v14 + 16))(v14, v15, v12, v11, v10);

  }
}

- (void)beginSearchWithTimeout:(double)a3 mapCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  NSObject *serialQueue;
  id v26;
  _QWORD block[5];
  id v28;
  double v29;
  _QWORD v30[4];
  id v31;
  MRAVReconnaissanceSession *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[MRAVReconnaissanceSession details](self, "details");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("ReconnaissanceSession.search"), v10);

  -[MRAVReconnaissanceSession matchingOutputDeviceUIDs](self, "matchingOutputDeviceUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
    -[MRAVReconnaissanceSession matchingOutputDeviceUIDs](self, "matchingOutputDeviceUIDs");
  else
    -[MRAVReconnaissanceSession matchingOutputDeviceGroupID](self, "matchingOutputDeviceGroupID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MRAVReconnaissanceSession matchingOutputDeviceUIDs](self, "matchingOutputDeviceUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
      -[MRAVReconnaissanceSession matchingOutputDeviceUIDs](self, "matchingOutputDeviceUIDs");
    else
      -[MRAVReconnaissanceSession matchingOutputDeviceGroupID](self, "matchingOutputDeviceGroupID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR(" for %@"), v15);

  }
  -[MRAVReconnaissanceSession details](self, "details");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reason");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[MRAVReconnaissanceSession details](self, "details");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reason");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR(" because %@"), v19);

  }
  _MRLogForCategory(0xAuLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v11;
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v21 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __66__MRAVReconnaissanceSession_beginSearchWithTimeout_mapCompletion___block_invoke;
  v30[3] = &unk_1E30D00B0;
  v31 = v7;
  v32 = self;
  v33 = v6;
  v22 = v6;
  v23 = v7;
  v24 = (void *)MEMORY[0x194036C44](v30);
  serialQueue = self->_serialQueue;
  block[0] = v21;
  block[1] = 3221225472;
  block[2] = __66__MRAVReconnaissanceSession_beginSearchWithTimeout_mapCompletion___block_invoke_22;
  block[3] = &unk_1E30C77F0;
  block[4] = self;
  v28 = v24;
  v29 = a3;
  v26 = v24;
  dispatch_async(serialQueue, block);

}

void __66__MRAVReconnaissanceSession_beginSearchWithTimeout_mapCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  NSObject *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  double v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  double v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v9, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uid");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v15)
      v20 = v15;
    else
      v20 = v18;
    if (v12)
      v21 = v12;
    else
      v21 = v20;
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
    v22 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v42 = v21;
    v43 = 2048;
    v44 = -v23;
    v45 = 2114;
    v46 = v22;
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "WHAPRO: Discovery found %@ in %f seconds %{public}@", buf, 0x20u);
  }

  if (v12)
  {
    _MRLogForCategory(0xAuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __66__MRAVReconnaissanceSession_beginSearchWithTimeout_mapCompletion___block_invoke_cold_1(a1, (uint64_t)v12, v24);
  }
  else
  {
    v26 = *(void **)(a1 + 40);
    objc_msgSend(v9, "allValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVReconnaissanceSession _descriptionObjectFromResultOfOutputDevices:endpoints:unanimousEndpoint:](v26, v27, v10, v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    _MRLogForCategory(0xAuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (v29)
      {
        objc_msgSend(*(id *)(a1 + 40), "details");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "requestID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(a1 + 40);
        objc_msgSend(v9, "allValues");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRAVReconnaissanceSession _descriptionObjectFromResultOfOutputDevices:endpoints:unanimousEndpoint:](v31, v38, v10, v11);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
        *(_DWORD *)buf = 138544130;
        v42 = CFSTR("ReconnaissanceSession.search");
        v43 = 2114;
        v44 = *(double *)&v30;
        v45 = 2112;
        v46 = v32;
        v47 = 2048;
        v48 = v33;
        _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", buf, 0x2Au);

      }
    }
    else if (v29)
    {
      objc_msgSend(*(id *)(a1 + 40), "details");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "requestID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
      *(_DWORD *)buf = 138543874;
      v42 = CFSTR("ReconnaissanceSession.search");
      v43 = 2114;
      v44 = *(double *)&v34;
      v45 = 2048;
      v46 = v36;
      _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);

    }
  }

  v25 = *(_QWORD *)(a1 + 48);
  if (v25)
    (*(void (**)(uint64_t, id, id, id, __CFString *))(v25 + 16))(v25, v9, v10, v11, v12);

}

- (id)_descriptionObjectFromResultOfOutputDevices:(void *)a3 endpoints:(void *)a4 unanimousEndpoint:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    v11 = v9;
    if (v9 || (v12 = objc_msgSend(v8, "count"), v11 = v8, v12) || (v13 = objc_msgSend(v7, "count"), v11 = v7, v13))
      a1 = v11;
    else
      a1 = 0;
  }

  return a1;
}

void __66__MRAVReconnaissanceSession_beginSearchWithTimeout_mapCompletion___block_invoke_22(uint64_t a1, const char *a2)
{
  _BYTE *v3;

  v3 = *(_BYTE **)(a1 + 32);
  if (!v3[44] || (-[MRAVReconnaissanceSession _onQueue_cancelSearch]((uint64_t)v3), (v3 = *(_BYTE **)(a1 + 32)) != 0))
  {
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 96);
    v3 = *(_BYTE **)(a1 + 32);
  }
  -[MRAVReconnaissanceSession _onQueue_beginSearchWithTimeout:]((uint64_t)v3, *(double *)(a1 + 48));
}

- (void)_onQueue_beginSearchWithTimeout:(uint64_t)a1
{
  id v4;
  void *v5;
  void *v6;
  id LocalEndpoint;
  int IsProxyGroupPlayer;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  double v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2 < 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__onQueue_beginSearchWithTimeout_, a1, CFSTR("MRAVReconnaissanceSession.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeout >= 0"));

    }
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v4;

    v6 = (void *)MRMediaRemoteCopyDeviceUID();
    LocalEndpoint = MRAVEndpointGetLocalEndpoint(0);
    IsProxyGroupPlayer = MRAVEndpointIsProxyGroupPlayer(LocalEndpoint);
    +[MRAVClusterController sharedController](MRAVClusterController, "sharedController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "clusterStatus");

    objc_msgSend(*(id *)(a1 + 80), "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if ((objc_msgSend(v12, "containsObject:", v6) & IsProxyGroupPlayer) == 1
      && (objc_msgSend((id)a1, "endpointFeatures") & 8) != 0
      && v10 != 2)
    {
      objc_msgSend(v12, "removeObject:", v6);
    }
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v12);
    v14 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v13;

    if (objc_msgSend(*(id *)(a1 + 80), "count")
      || objc_msgSend(*(id *)(a1 + 56), "length")
      || objc_msgSend(*(id *)(a1 + 72), "count"))
    {
      _MRLogForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v28 = a2;
        v29 = 2114;
        v30 = a1;
        _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Beginning search with timeout %f %{public}@", buf, 0x16u);
      }

      if (*(_QWORD *)(a1 + 104))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel__onQueue_beginSearchWithTimeout_, a1, CFSTR("MRAVReconnaissanceSession.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_timeoutTimer"));

      }
      if (a2 > 0.0)
      {
        objc_initWeak((id *)buf, (id)a1);
        v16 = objc_alloc(MEMORY[0x1E0D4D110]);
        v17 = *(_QWORD *)(a1 + 16);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __61__MRAVReconnaissanceSession__onQueue_beginSearchWithTimeout___block_invoke;
        v25[3] = &unk_1E30C6AA0;
        objc_copyWeak(&v26, (id *)buf);
        v18 = objc_msgSend(v16, "initWithInterval:queue:block:", v17, v25, a2);
        v19 = *(void **)(a1 + 104);
        *(_QWORD *)(a1 + 104) = v18;

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
      objc_msgSend(*(id *)(a1 + 64), "setDiscoveryMode:", 3);
      *(_BYTE *)(a1 + 44) = 1;
      -[MRAVReconnaissanceSession _onQueue_processSearchLoop](a1);
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 24), "count"))
      {
        +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:](MRAVLocalEndpoint, "sharedLocalEndpointForRoutingContextWithUID:", 0);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(a1 + 128);
        *(_QWORD *)(a1 + 128) = v20;

      }
      _MRLogForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Recon force end: nothing to match", buf, 2u);
      }

      -[MRAVReconnaissanceSession _onQueue_invokeCompletionWithMatchingDevices:matchingEndpoints:unanimousEndpoint:error:]((id *)a1, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA60], 0, 0);
    }

  }
}

- (void)setUnanimousEndpoint:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 128), a2);
}

- (void)_onQueue_invokeCompletionWithMatchingDevices:(void *)a3 matchingEndpoints:(void *)a4 unanimousEndpoint:(void *)a5 error:
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, id, id, id, id);
  SEL v13;
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    v12 = (void (**)(id, id, id, id, id))a1[12];
    objc_setProperty_nonatomic_copy(a1, v13, 0, 96);
    if (v12)
      v12[2](v12, v14, v9, v10, v11);

  }
}

void __61__MRAVReconnaissanceSession__onQueue_beginSearchWithTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[MRAVReconnaissanceSession _onQueue_timeoutTimerFired]((uint64_t)WeakRetained);

}

- (void)_onQueue_timeoutTimerFired
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  NSObject *v32;
  int v33;
  NSObject *v34;
  int v35;
  void *Error;
  void *v37;
  void *v38;
  void *v39;
  id *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(_BYTE *)(a1 + 44))
    {
      *(_BYTE *)(a1 + 44) = 0;
      _MRLogForCategory(0);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(void **)(a1 + 8);
        v4 = *(_QWORD *)(a1 + 152);
        *(_DWORD *)buf = 134218498;
        v52 = v3;
        v53 = 2048;
        v54 = v4;
        v55 = 2114;
        v56 = a1;
        _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Session timed out after %f seconds with %llu updates %{public}@", buf, 0x20u);
      }

      _MRLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Last endpoints:", buf, 2u);
      }

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v6 = *(id *)(a1 + 168);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v46 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            _MRLogForCategory(0);
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v52 = v11;
              _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] %{public}@", buf, 0xCu);
            }

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        }
        while (v8);
      }

      _MRLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Last output devices:", buf, 2u);
      }

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v14 = *(id *)(a1 + 160);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v42 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
            _MRLogForCategory(0);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v52 = v19;
              _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] %{public}@", buf, 0xCu);
            }

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        }
        while (v16);
      }

      _MRLogForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(void **)(a1 + 112);
        *(_DWORD *)buf = 138543362;
        v52 = v22;
        _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Matching devices found: %{public}@", buf, 0xCu);
      }

      _MRLogForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(void **)(a1 + 80);
        *(_DWORD *)buf = 138543362;
        v52 = v24;
        _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Matching UIDs set: %{public}@", buf, 0xCu);
      }

      _MRLogForCategory(0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(void **)(a1 + 72);
        *(_DWORD *)buf = 138543362;
        v52 = v26;
        _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Matching Logical Device IDs set: %{public}@", buf, 0xCu);
      }

      _MRLogForCategory(0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(void **)(a1 + 128);
        *(_DWORD *)buf = 138543362;
        v52 = v28;
        _os_log_impl(&dword_193827000, v27, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Unanimous endpoint: %{public}@", buf, 0xCu);
      }

      _MRLogForCategory(0);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(id *)(a1 + 128);
        NSStringFromMRAVEndpointConnectionType(objc_msgSend(v30, "connectionType"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v52 = v31;
        _os_log_impl(&dword_193827000, v29, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Unanimous endpoint connection type: %{public}@", buf, 0xCu);

      }
      _MRLogForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_msgSend((id)a1, "endpointFeatures");
        *(_DWORD *)buf = 67109120;
        LODWORD(v52) = v33;
        _os_log_impl(&dword_193827000, v32, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Endpoint features: %u", buf, 8u);
      }

      _MRLogForCategory(0);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_msgSend((id)a1, "shouldWaitForUnanimousEndpoints");
        *(_DWORD *)buf = 67109120;
        LODWORD(v52) = v35;
        _os_log_impl(&dword_193827000, v34, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Unanimous endpoint should wait: %{BOOL}u", buf, 8u);
      }

      Error = (void *)MRMediaRemoteCreateError(26);
      if (*(_BYTE *)(a1 + 41))
      {
        v37 = *(void **)(a1 + 112);
        v38 = *(void **)(a1 + 120);
        v39 = *(void **)(a1 + 128);
        v40 = (id *)a1;
      }
      else
      {
        v37 = (void *)MEMORY[0x1E0C9AA70];
        v38 = (void *)MEMORY[0x1E0C9AA60];
        v40 = (id *)a1;
        v39 = 0;
      }
      -[MRAVReconnaissanceSession _onQueue_invokeCompletionWithMatchingDevices:matchingEndpoints:unanimousEndpoint:error:](v40, v37, v38, v39, Error);

    }
    -[MRAVReconnaissanceSession _onQueue_endSearch](a1);
  }
}

- (void)_onQueue_processSearchLoop
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  BOOL v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  uint64_t v53;
  id v54;
  BOOL v55;
  void *v56;
  id v57;
  _BOOL4 v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  void *v62;
  id v63;
  void *v64;
  int v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t n;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  id v73;
  void *v74;
  id v75;
  int v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t ii;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  id obj;
  id v96;
  id v97;
  uint64_t v98;
  id v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  _BOOL4 v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  uint64_t v110;
  void *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint8_t buf[16];
  _QWORD v121[5];
  _QWORD v122[5];
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v89 = *(id *)(a1 + 144);
  if (objc_msgSend(*(id *)(a1 + 56), "length"))
    v105 = objc_msgSend(*(id *)(a1 + 80), "count") == 0;
  else
    v105 = 0;
  v98 = objc_msgSend(*(id *)(a1 + 72), "count");
  if (!*(_BYTE *)(a1 + 44))
    goto LABEL_145;
  v2 = *(id *)(a1 + 136);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  obj = v2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v170, 16);
  if (!v3)
    goto LABEL_24;
  v4 = *(_QWORD *)v158;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v158 != v4)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * i);
      objc_msgSend(v6, "groupID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7 && !objc_msgSend(v6, "isLocalDevice") || !*(_BYTE *)(a1 + 43))
      {

LABEL_18:
        if ((objc_msgSend((id)a1, "endpointFeatures") & 8) == 0
          || (objc_msgSend(v6, "isRemoteControllable") & 1) == 0
          && (objc_msgSend(v6, "canRelayCommunicationChannel") & 1) == 0)
        {
          objc_msgSend(v94, "addObject:", v6);
        }
        continue;
      }
      if ((objc_msgSend(v6, "isGroupLeader") & 1) != 0)
      {

        continue;
      }
      v8 = objc_msgSend(v6, "isAirPlayReceiverSessionActive");

      if ((v8 & 1) == 0)
        goto LABEL_18;
    }
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v170, 16);
  }
  while (v3);
LABEL_24:

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v96 = v89;
  v99 = (id)objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v153, v169, 16);
  if (v99)
  {
    v87 = *(_QWORD *)v154;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v154 != v87)
        {
          v10 = v9;
          objc_enumerationMutation(v96);
          v9 = v10;
        }
        v90 = v9;
        v106 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = 0u;
        v152 = 0u;
        v149 = 0u;
        v150 = 0u;
        v101 = obj;
        v108 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v149, v168, 16);
        if (v108)
        {
          v103 = *(_QWORD *)v150;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v150 != v103)
              {
                v13 = v12;
                objc_enumerationMutation(v101);
                v12 = v13;
              }
              v110 = v12;
              v14 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * v12);
              v145 = 0u;
              v146 = 0u;
              v147 = 0u;
              v148 = 0u;
              objc_msgSend(v106, "outputDevices");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v145, v167, 16);
              if (v16)
              {
                v17 = *(_QWORD *)v146;
                do
                {
                  for (j = 0; j != v16; ++j)
                  {
                    if (*(_QWORD *)v146 != v17)
                      objc_enumerationMutation(v15);
                    v19 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * j);
                    objc_msgSend(v14, "uid");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "uid");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v19) = objc_msgSend(v20, "isEqualToString:", v21);

                    if ((_DWORD)v19)
                      objc_msgSend(v11, "addObject:", v14);
                  }
                  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v145, v167, 16);
                }
                while (v16);
              }

              v12 = v110 + 1;
            }
            while (v110 + 1 != v108);
            v108 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v149, v168, 16);
          }
          while (v108);
        }

        objc_msgSend(MEMORY[0x1E0D4D0B8], "pairWithFirst:second:", v106, v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "addObject:", v22);

        v9 = v90 + 1;
      }
      while ((id)(v90 + 1) != v99);
      v99 = (id)objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v153, v169, 16);
    }
    while (v99);
  }

  v23 = (void *)MEMORY[0x1E0D4D0B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pairWithFirst:second:", v24, v94);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v25);

  v97 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v86 = v92;
  v91 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v141, v166, 16);
  if (v91)
  {
    v88 = *(_QWORD *)v142;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v142 != v88)
        {
          v27 = v26;
          objc_enumerationMutation(v86);
          v26 = v27;
        }
        v93 = v26;
        v28 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v26);
        objc_msgSend(v28, "first");
        v102 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "second");
        v100 = (id)objc_claimAutoreleasedReturnValue();
        v139 = 0u;
        v140 = 0u;
        v137 = 0u;
        v138 = 0u;
        v107 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v137, v165, 16);
        if (!v107)
        {
          if (v105)
            goto LABEL_105;
          v29 = 0;
LABEL_100:
          if (v29 != objc_msgSend(*(id *)(a1 + 80), "count")
            || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
                v57 = (id)objc_claimAutoreleasedReturnValue(),
                v58 = v102 == v57,
                v57,
                v56 = v102,
                v58))
          {
            if (!v29)
              goto LABEL_105;
            v56 = 0;
          }
LABEL_104:
          -[MRAVReconnaissanceSession setUnanimousEndpoint:](a1, v56);
          goto LABEL_105;
        }
        v29 = 0;
        v104 = *(_QWORD *)v138;
        v109 = 1;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v138 != v104)
              objc_enumerationMutation(v100);
            v31 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v30);
            objc_msgSend(v31, "uid");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "groupID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v31, "clusterComposition");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "mr_map:", &__block_literal_global_110);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setWithArray:", v36);
            v111 = (void *)objc_claimAutoreleasedReturnValue();

            if (v105)
            {
              if (!objc_msgSend(v33, "isEqualToString:", *(_QWORD *)(a1 + 56)))
                goto LABEL_67;
LABEL_65:
              objc_msgSend(*(id *)(a1 + 112), "setObject:forKeyedSubscript:", v31, v32);
LABEL_66:
              ++v29;
              goto LABEL_67;
            }
            if (v98)
            {
              v37 = *(void **)(a1 + 72);
              objc_msgSend(v31, "logicalDeviceID");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v37) = objc_msgSend(v37, "containsObject:", v38);

              if (!(_DWORD)v37)
                goto LABEL_67;
              v39 = *(void **)(a1 + 112);
              objc_msgSend(v31, "uid");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setObject:forKeyedSubscript:", v31, v40);

              goto LABEL_66;
            }
            v41 = *(void **)(a1 + 80);
            if (*(_BYTE *)(a1 + 40))
            {
              if (objc_msgSend(v41, "mr_containsObjectUsingWeakMatching:", v32))
                goto LABEL_65;
              v135 = 0u;
              v136 = 0u;
              v133 = 0u;
              v134 = 0u;
              v49 = v111;
              v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v133, v164, 16);
              if (v50)
              {
                v51 = *(_QWORD *)v134;
                do
                {
                  for (k = 0; k != v50; ++k)
                  {
                    if (*(_QWORD *)v134 != v51)
                      objc_enumerationMutation(v49);
                    if (objc_msgSend(*(id *)(a1 + 80), "mr_containsObjectUsingWeakMatching:", *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * k)))
                    {
                      objc_msgSend(*(id *)(a1 + 112), "setObject:forKeyedSubscript:", v31, v32);
                      ++v29;
                    }
                  }
                  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v133, v164, 16);
                }
                while (v50);
              }

            }
            else
            {
              if (objc_msgSend(v41, "containsObject:", v32))
              {
                objc_msgSend(*(id *)(a1 + 112), "setObject:forKeyedSubscript:", v31, v32);
                ++v29;
              }
              v44 = (void *)objc_msgSend(v111, "mutableCopy");
              objc_msgSend(v44, "intersectSet:", *(_QWORD *)(a1 + 80));
              v131 = 0u;
              v132 = 0u;
              v129 = 0u;
              v130 = 0u;
              v45 = v44;
              v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v129, v163, 16);
              if (v46)
              {
                v47 = *(_QWORD *)v130;
                do
                {
                  for (m = 0; m != v46; ++m)
                  {
                    if (*(_QWORD *)v130 != v47)
                      objc_enumerationMutation(v45);
                    objc_msgSend(*(id *)(a1 + 112), "setObject:forKeyedSubscript:", v31, *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * m));
                  }
                  v29 += v46;
                  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v129, v163, 16);
                }
                while (v46);
              }

            }
LABEL_67:
            if (((v29 != 0) & v109) == 1)
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v42 = (id)objc_claimAutoreleasedReturnValue();
              v43 = v102 == v42;

              if (v43)
              {
                v109 = 1;
              }
              else
              {
                objc_msgSend(v97, "addObject:", v102);
                v109 = 0;
              }
            }

            ++v30;
          }
          while (v30 != v107);
          v53 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v137, v165, 16);
          v107 = v53;
        }
        while (v53);
        if (!v105)
          goto LABEL_100;
        if (v29)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v54 = (id)objc_claimAutoreleasedReturnValue();
          v55 = v102 == v54;

          v56 = v102;
          if (!v55)
            goto LABEL_104;
        }
LABEL_105:
        objc_storeStrong((id *)(a1 + 120), v97);

        v26 = v93 + 1;
      }
      while (v93 + 1 != v91);
      v91 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v141, v166, 16);
    }
    while (v91);
  }

  if (!objc_msgSend((id)a1, "waitForCompleteClusters"))
  {
LABEL_110:
    if (v105)
    {
      v63 = *(id *)(a1 + 128);
      if (v63)
      {
        v64 = v63;
        v65 = objc_msgSend((id)a1, "shouldWaitForUnanimousEndpoints");

        if (v65)
        {
          v118 = 0u;
          v119 = 0u;
          v116 = 0u;
          v117 = 0u;
          objc_msgSend(*(id *)(a1 + 128), "outputDevices");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v116, v162, 16);
          if (v67)
          {
            v68 = *(_QWORD *)v117;
            do
            {
              for (n = 0; n != v67; ++n)
              {
                if (*(_QWORD *)v117 != v68)
                  objc_enumerationMutation(v66);
                v70 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * n);
                if ((objc_msgSend(v70, "isGroupLeader") & 1) == 0)
                {
                  if (!objc_msgSend(v70, "canRelayCommunicationChannel")
                    || objc_msgSend(v70, "isRemoteControllable")
                    && (objc_msgSend(v70, "groupContainsGroupLeader") & 1) != 0)
                  {
                    continue;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    continue;
                }
                -[MRAVReconnaissanceSession _onQueue_concludeSearch](a1);
              }
              v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v116, v162, 16);
            }
            while (v67);
          }

        }
      }
      goto LABEL_144;
    }
    v71 = objc_msgSend(*(id *)(a1 + 112), "count");
    if (v98)
    {
      if (v71 != 2 * objc_msgSend(*(id *)(a1 + 72), "count")
        && (!*(_QWORD *)(a1 + 176) || objc_msgSend(*(id *)(a1 + 112), "count") != *(_QWORD *)(a1 + 176)))
      {
        goto LABEL_144;
      }
    }
    else
    {
      if (v71 != objc_msgSend(*(id *)(a1 + 80), "count"))
        goto LABEL_144;
      v73 = *(id *)(a1 + 128);
      if (v73)
      {
        v74 = v73;
        v75 = *(id *)(a1 + 128);
        if (objc_msgSend(v75, "connectionType") != 1 && (objc_msgSend((id)a1, "endpointFeatures") & 8) != 0)
        {
          v76 = objc_msgSend((id)a1, "shouldWaitForUnanimousEndpoints");

          if (v76)
          {
            v77 = *(id *)(a1 + 128);
            objc_msgSend(v77, "outputDevices");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 128), "designatedGroupLeader");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "arrayByAddingObject:", v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue();

            v114 = 0u;
            v115 = 0u;
            v112 = 0u;
            v113 = 0u;
            v81 = v80;
            v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v112, v161, 16);
            if (v82)
            {
              v83 = *(_QWORD *)v113;
              while (2)
              {
                for (ii = 0; ii != v82; ++ii)
                {
                  if (*(_QWORD *)v113 != v83)
                    objc_enumerationMutation(v81);
                  v85 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * ii);
                  if ((objc_msgSend(v85, "isGroupLeader") & 1) == 0)
                  {
                    if (!objc_msgSend(v85, "canRelayCommunicationChannel")
                      || objc_msgSend(v85, "isRemoteControllable")
                      && (objc_msgSend(v85, "groupContainsGroupLeader") & 1) != 0)
                    {
                      continue;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      continue;
                  }
                  -[MRAVReconnaissanceSession _onQueue_concludeSearch](a1);
                  goto LABEL_162;
                }
                v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v112, v161, 16);
                if (v82)
                  continue;
                break;
              }
            }
LABEL_162:

            goto LABEL_144;
          }
        }
        else
        {

        }
      }
    }
    -[MRAVReconnaissanceSession _onQueue_concludeSearch](a1);
    goto LABEL_144;
  }
  v123 = 0;
  v124 = &v123;
  v125 = 0x3032000000;
  v126 = __Block_byref_object_copy__52;
  v127 = __Block_byref_object_dispose__52;
  v128 = *(id *)(a1 + 32);
  v59 = objc_msgSend((id)v124[5], "count");
  v60 = MEMORY[0x1E0C809B0];
  v122[0] = MEMORY[0x1E0C809B0];
  v122[1] = 3221225472;
  v122[2] = __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke_41;
  v122[3] = &unk_1E30D0100;
  v122[4] = &v123;
  v61 = objc_msgSend(v97, "mr_all:", v122);
  objc_msgSend(*(id *)(a1 + 112), "allValues");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = v60;
  v121[1] = 3221225472;
  v121[2] = __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke_44;
  v121[3] = &unk_1E30CD970;
  v121[4] = &v123;
  LODWORD(v60) = objc_msgSend(v62, "mr_all:", v121);

  if ((v61 & v60 & 1) != 0)
  {
    _Block_object_dispose(&v123, 8);

    goto LABEL_110;
  }
  if (v59 != objc_msgSend((id)v124[5], "count"))
  {
    _MRLogForCategory(0);
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193827000, v72, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Found incomplete clusters among matching devices. Waiting for discovery updates until they are complete.", buf, 2u);
    }

  }
  _Block_object_dispose(&v123, 8);

LABEL_144:
LABEL_145:

}

- (void)cancelSearch
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MRAVReconnaissanceSession_cancelSearch__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __41__MRAVReconnaissanceSession_cancelSearch__block_invoke(uint64_t a1)
{
  -[MRAVReconnaissanceSession _onQueue_cancelSearch](*(_QWORD *)(a1 + 32));
}

uint64_t __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

uint64_t __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "outputDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke_2;
  v9[3] = &unk_1E30D00D8;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  v7 = objc_msgSend(v4, "mr_all:", v9);

  return v7;
}

uint64_t __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "deviceSubtype") == 15
    && (objc_msgSend(v3, "clusterComposition"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v6 = objc_msgSend(v3, "configuredClusterSize"),
        v4,
        v5 < v6))
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsObject:", v3) & 1) == 0)
    {
      _MRLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend(v3, "configuredClusterSize");
        objc_msgSend(*(id *)(a1 + 32), "shortDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 134218498;
        v13 = v8;
        v14 = 2114;
        v15 = v3;
        v16 = 2114;
        v17 = v9;
        _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Found incomplete cluster (expected: %lu): %{public}@ in endpoint: %{public}@", (uint8_t *)&v12, 0x20u);

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

uint64_t __55__MRAVReconnaissanceSession__onQueue_processSearchLoop__block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "deviceSubtype") == 15
    && (objc_msgSend(v3, "clusterComposition"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v6 = objc_msgSend(v3, "configuredClusterSize"),
        v4,
        v5 < v6))
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "containsObject:", v3) & 1) == 0)
    {
      _MRLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 134218242;
        v11 = objc_msgSend(v3, "configuredClusterSize");
        v12 = 2114;
        v13 = v3;
        _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Found incomplete cluster device (expected: %lu): %{public}@", (uint8_t *)&v10, 0x16u);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)_onQueue_concludeSearch
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(_BYTE *)(a1 + 44))
    {
      objc_msgSend(*(id *)(a1 + 112), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 24));
      _MRLogForCategory(0);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(a1 + 112);
        v6 = 138543362;
        v7 = v3;
        _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Successfully found matching output devices: %{public}@", (uint8_t *)&v6, 0xCu);
      }

      _MRLogForCategory(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 120);
        v6 = 138543362;
        v7 = v5;
        _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[ReconnaissanceSession] Successfully found matching endpoints: %{public}@", (uint8_t *)&v6, 0xCu);
      }

      -[MRAVReconnaissanceSession _onQueue_invokeCompletionWithMatchingDevices:matchingEndpoints:unanimousEndpoint:error:]((id *)a1, *(void **)(a1 + 112), *(void **)(a1 + 120), *(void **)(a1 + 128), 0);
    }
    -[MRAVReconnaissanceSession _onQueue_endSearch](a1);
  }
}

- (void)_onQueue_endSearch
{
  void *v2;
  void *v3;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(_QWORD *)(a1 + 96))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", sel__onQueue_endSearch, a1, CFSTR("MRAVReconnaissanceSession.m"), 555, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!self.completion"));

    }
    objc_msgSend(*(id *)(a1 + 64), "setDiscoveryMode:", 0);
    *(_BYTE *)(a1 + 44) = 0;
    objc_msgSend(*(id *)(a1 + 104), "invalidate");
    v2 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = 0;

  }
}

- (MRRequestDetails)details
{
  return self->_details;
}

- (MRAVRoutingDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (BOOL)useWeakMatching
{
  return self->_useWeakMatching;
}

- (void)setUseWeakMatching:(BOOL)a3
{
  self->_useWeakMatching = a3;
}

- (BOOL)returnPartialResults
{
  return self->_returnPartialResults;
}

- (void)setReturnPartialResults:(BOOL)a3
{
  self->_returnPartialResults = a3;
}

- (BOOL)waitForCompleteClusters
{
  return self->_waitForCompleteClusters;
}

- (void)setWaitForCompleteClusters:(BOOL)a3
{
  self->_waitForCompleteClusters = a3;
}

- (BOOL)shouldWaitForUnanimousEndpoints
{
  return self->_shouldWaitForUnanimousEndpoints;
}

- (void)setShouldWaitForUnanimousEndpoints:(BOOL)a3
{
  self->_shouldWaitForUnanimousEndpoints = a3;
}

- (NSArray)matchingLogicalDeviceIDs
{
  return self->_matchingLogicalDeviceIDs;
}

- (void)setMatchingLogicalDeviceIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedEndpoints, 0);
  objc_storeStrong((id *)&self->_lastProcessedOutputDevices, 0);
  objc_storeStrong((id *)&self->_availableEndpoints, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
  objc_storeStrong((id *)&self->_unanimousEndpoint, 0);
  objc_storeStrong((id *)&self->_matchingEndpointsFound, 0);
  objc_storeStrong((id *)&self->_matchingDevicesFound, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_discoverySessionCallbackToken, 0);
  objc_storeStrong((id *)&self->_matchingOutputDeviceUIDsSet, 0);
  objc_storeStrong((id *)&self->_matchingLogicalDeviceIDs, 0);
  objc_storeStrong((id *)&self->_discoverySession, 0);
  objc_storeStrong((id *)&self->_matchingOutputDeviceGroupID, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_knownIncompleteClusterMembers, 0);
  objc_storeStrong((id *)&self->_localMatchingDevicesFound, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __66__MRAVReconnaissanceSession_beginSearchWithTimeout_mapCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v10 = 138544130;
  v11 = CFSTR("ReconnaissanceSession.search");
  v12 = 2114;
  v13 = v7;
  v14 = 2114;
  v15 = a2;
  v16 = 2048;
  v17 = v9;
  _os_log_error_impl(&dword_193827000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v10, 0x2Au);

}

@end
