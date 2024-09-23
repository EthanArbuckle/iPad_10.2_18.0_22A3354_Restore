@implementation MRRapportTransportConnection

- (MRRapportTransportConnection)initWithCompanionLinkClient:(id)a3 device:(id)a4 sessionUID:(id)a5
{
  id v9;
  id v10;
  id v11;
  MRRapportTransportConnection *v12;
  MRRapportTransportConnection *v13;
  NSString **p_sessionUID;
  uint64_t v15;
  NSString *eventID;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MRRapportTransportConnection;
  v12 = -[MRRapportTransportConnection init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    p_sessionUID = &v12->_sessionUID;
    objc_storeStrong((id *)&v12->_sessionUID, a5);
    objc_storeStrong((id *)&v13->_connection, a3);
    -[RPCompanionLinkClient setDestinationDevice:](v13->_connection, "setDestinationDevice:", v10);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.mediaremote.remotecontrol.event.%@"), *p_sessionUID);
    eventID = v13->_eventID;
    v13->_eventID = (NSString *)v15;

    -[MRRapportTransportConnection _registerCallbacks](v13, "_registerCallbacks");
  }

  return v13;
}

- (MRRapportTransportConnection)initWithDeviceUID:(id)a3 sessionUID:(id)a4 targetDevice:(id *)a5 error:(id *)a6
{
  id v7;
  NSObject *v8;
  dispatch_queue_t v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  void *v15;
  dispatch_semaphore_t v16;
  MRRapportTransportConnection *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  dispatch_time_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  MRRapportTransportConnection *v30;
  id v33;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  MRRapportTransportConnection *v42;
  id v43;
  NSObject *v44;
  uint64_t *v45;
  _QWORD v46[4];
  NSObject *v47;
  uint64_t *v48;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v33 = a4;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__51;
  v59 = __Block_byref_object_dispose__51;
  v60 = 0;
  v49 = 0;
  v50 = (id *)&v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__51;
  v53 = __Block_byref_object_dispose__51;
  v54 = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0D83900]);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.mediaremote.MRRapportTransportConnection.rapport", v8);
  objc_msgSend(v7, "setDispatchQueue:", v9);

  v10 = dispatch_semaphore_create(0);
  v11 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __80__MRRapportTransportConnection_initWithDeviceUID_sessionUID_targetDevice_error___block_invoke;
  v46[3] = &unk_1E30C5D70;
  v48 = &v55;
  v12 = v10;
  v47 = v12;
  objc_msgSend(v7, "activateWithCompletion:", v46);
  v13 = dispatch_time(0, 7000000000);
  if (dispatch_semaphore_wait(v12, v13) >= 1)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 26, CFSTR("Failed to activate companionLinkClient in %d seconds"), 7);
    v15 = (void *)v56[5];
    v56[5] = v14;

  }
  if (v56[5])
    goto LABEL_16;
  v16 = dispatch_semaphore_create(0);
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __80__MRRapportTransportConnection_initWithDeviceUID_sessionUID_targetDevice_error___block_invoke_2;
  v41[3] = &unk_1E30CFFC8;
  v17 = self;
  v42 = v17;
  v18 = v36;
  v43 = v18;
  v45 = &v49;
  v19 = v16;
  v44 = v19;
  objc_msgSend(v7, "setDeviceFoundHandler:", v41);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v7, "activeDevices");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v65, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (-[MRRapportTransportConnection _targetDeviceMatch:deviceUID:](v17, "_targetDeviceMatch:deviceUID:", v24, v18))
        {
          objc_storeStrong(v50 + 5, v24);
          dispatch_semaphore_signal(v19);
        }
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v65, 16);
    }
    while (v21);
  }

  v25 = dispatch_time(0, 7000000000);
  if (dispatch_semaphore_wait(v19, v25) >= 1)
  {
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 26, CFSTR("Failed to discover companionLinkDevice for %@ in %d seconds"), v18, 7);
    v27 = (void *)v56[5];
    v56[5] = v26;

  }
  if (v56[5])
  {
LABEL_16:
    MRLogCategoryConnections();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = v56[5];
      *(_DWORD *)buf = 138543618;
      v62 = v29;
      v63 = 2112;
      v64 = v36;
      _os_log_impl(&dword_193827000, v28, OS_LOG_TYPE_ERROR, "[MRRapportTransportConnection] Error %{public}@ creating rapportTransportConnection for %@", buf, 0x16u);
    }

    v30 = 0;
    if (a6)
      *a6 = objc_retainAutorelease((id)v56[5]);
  }
  else
  {
    if (a5)
      *a5 = objc_retainAutorelease(v50[5]);
    v30 = -[MRRapportTransportConnection initWithCompanionLinkClient:device:sessionUID:](v17, "initWithCompanionLinkClient:device:sessionUID:", v7, v50[5], v33);
    self = v30;
  }

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v30;
}

void __80__MRRapportTransportConnection_initWithDeviceUID_sessionUID_targetDevice_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __80__MRRapportTransportConnection_initWithDeviceUID_sessionUID_targetDevice_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_targetDeviceMatch:deviceUID:"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

}

- (BOOL)isValid
{
  return 1;
}

- (id)runLoop
{
  return 0;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  RPCompanionLinkClient *connection;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("data"));
  MRLogCategoryConnections();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v6, "length");
    -[RPCompanionLinkClient destinationDevice](self->_connection, "destinationDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "effectiveIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPCompanionLinkClient destinationDevice](self->_connection, "destinationDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRExternalDeviceTransportConnection destinationOutputDeviceUID](self, "destinationOutputDeviceUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRRapportTransportConnection sessionUID](self, "sessionUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v26 = v9;
    v27 = 2114;
    v28 = v10;
    v29 = 2114;
    v30 = v12;
    v31 = 2114;
    v32 = v13;
    v33 = 2114;
    v34 = v14;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "[MRRapportTransportConnection] Writing %llu bytes to device=%{public}@(%{public}@) destination=%{public}@, session=%{public}@", buf, 0x34u);

  }
  objc_initWeak((id *)buf, self);
  connection = self->_connection;
  -[MRRapportTransportConnection eventID](self, "eventID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPCompanionLinkClient destinationDevice](self->_connection, "destinationDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "effectiveIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __58__MRRapportTransportConnection_sendTransportData_options___block_invoke;
  v23[3] = &unk_1E30CEA58;
  objc_copyWeak(&v24, (id *)buf);
  -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:](connection, "sendEventID:event:destinationID:options:completion:", v16, v7, v18, 0, v23);

  v19 = objc_msgSend(v6, "length");
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  return v19;
}

void __58__MRRapportTransportConnection_sendTransportData_options___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 121, CFSTR("companionLinkClient.sendEvent error %@"), v5);
    objc_msgSend(WeakRetained, "closeWithError:", v4);

  }
}

- (void)closeWithError:(id)a3
{
  RPCompanionLinkClient *connection;
  id v5;

  connection = self->_connection;
  v5 = a3;
  -[RPCompanionLinkClient invalidate](connection, "invalidate");
  -[MRExternalDeviceTransportConnection _notifyDelegateDidCloseWithError:](self, "_notifyDelegateDidCloseWithError:", v5);

}

- (BOOL)_targetDeviceMatch:(id)a3 deviceUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "effectiveIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v6) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "mediaRouteIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqualToString:", v6);

  }
  return v8;
}

- (void)_registerCallbacks
{
  uint64_t v3;
  RPCompanionLinkClient *connection;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__MRRapportTransportConnection__registerCallbacks__block_invoke;
  v10[3] = &unk_1E30C6AA0;
  objc_copyWeak(&v11, &location);
  -[RPCompanionLinkClient setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v10);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __50__MRRapportTransportConnection__registerCallbacks__block_invoke_2;
  v8[3] = &unk_1E30CFFF0;
  objc_copyWeak(&v9, &location);
  -[RPCompanionLinkClient setDeviceLostHandler:](self->_connection, "setDeviceLostHandler:", v8);
  connection = self->_connection;
  -[MRRapportTransportConnection eventID](self, "eventID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __50__MRRapportTransportConnection__registerCallbacks__block_invoke_3;
  v6[3] = &unk_1E30D0018;
  objc_copyWeak(&v7, &location);
  -[RPCompanionLinkClient registerEventID:options:handler:](connection, "registerEventID:options:handler:", v5, 0, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__MRRapportTransportConnection__registerCallbacks__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 121, CFSTR("companionLinkClient.invalidation"));
    objc_msgSend(WeakRetained, "closeWithError:", v1);

  }
}

void __50__MRRapportTransportConnection__registerCallbacks__block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[9], "destinationDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "_targetDeviceMatch:deviceUID:", v9, v6);

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 121, CFSTR("companionLinkClient.deviceLost"));
      objc_msgSend(v4, "closeWithError:", v8);

    }
  }

}

void __50__MRRapportTransportConnection__registerCallbacks__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("data"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      MRLogCategoryConnections();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(v5, "length");
        objc_msgSend(WeakRetained[9], "destinationDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "effectiveIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained[9], "destinationDevice");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "destinationOutputDeviceUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "sessionUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v15 = v7;
        v16 = 2114;
        v17 = v8;
        v18 = 2114;
        v19 = v10;
        v20 = 2114;
        v21 = v11;
        v22 = 2114;
        v23 = v12;
        _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[MRRapportTransportConnection] Reading %llu bytes from device=%{public}@(%{public}@) destination=%{public}@, session=%{public}@", buf, 0x34u);

      }
      objc_msgSend(WeakRetained, "_notifyDelegateDidReceiveData:", v5);
    }

  }
}

- (NSString)sessionUID
{
  return self->_sessionUID;
}

- (NSString)eventID
{
  return self->_eventID;
}

- (RPCompanionLinkClient)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
  objc_storeStrong((id *)&self->_sessionUID, 0);
}

@end
