@implementation MPAVRouteConnection

- (MPAVRouteConnection)initWithExternalDeviceObject:(id)a3
{
  id v6;
  MPAVRouteConnection *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *calloutQueue;
  void *v12;
  void *v14;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPAVRouteConnection;
  v7 = -[MPAVRouteConnection init](&v15, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("MPAVRouteConnection.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("externalDevice"));

    }
    objc_storeStrong((id *)&v7->_externalDevice, a3);
    v8 = dispatch_queue_create("com.apple.MediaPlayerFramework.MPAVRouteConnection.accessQueue", 0);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.MediaPlayerFramework.MPAVRouteConnection.calloutQueue", 0);
    calloutQueue = v7->_calloutQueue;
    v7->_calloutQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__externalDeviceConnectionStateDidChangeNotification_, *MEMORY[0x1E0D4C6E8], v6);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D4C6E8], self->_externalDevice);

  v4.receiver = self;
  v4.super_class = (Class)MPAVRouteConnection;
  -[MPAVRouteConnection dealloc](&v4, sel_dealloc);
}

- (id)description
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__20533;
  v8 = __Block_byref_object_dispose__20534;
  v9 = 0;
  msv_dispatch_sync_on_queue();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)externalDevice
{
  return self->_externalDevice;
}

- (MRExternalDevice)externalDeviceObject
{
  return self->_externalDevice;
}

- (BOOL)isConnected
{
  return -[MRExternalDevice isConnected](self->_externalDevice, "isConnected");
}

- (BOOL)isConnecting
{
  return -[MRExternalDevice connectionState](self->_externalDevice, "connectionState") == 1;
}

- (void)connectWithCompletion:(id)a3
{
  -[MPAVRouteConnection connectWithOptions:completion:](self, "connectWithOptions:completion:", 0, a3);
}

- (void)connectWithOptions:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("MPAVRouteConnectionReasonUserInfoKey");
  v10[0] = CFSTR("deprecated");
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVRouteConnection connectWithOptions:userInfo:completion:](self, "connectWithOptions:userInfo:completion:", a3, v8, v7);

}

- (void)connectWithUserInfo:(id)a3 completion:(id)a4
{
  -[MPAVRouteConnection connectWithOptions:userInfo:completion:](self, "connectWithOptions:userInfo:completion:", 0, a3, a4);
}

- (void)connectWithOptions:(unint64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *accessQueue;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  _QWORD v20[5];
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke;
  v20[3] = &unk_1E3161878;
  v20[4] = self;
  v21 = v9;
  v11 = v9;
  v12 = (void *)MEMORY[0x19403A810](v20);
  accessQueue = self->_accessQueue;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke_3;
  v16[3] = &unk_1E31582F0;
  v16[4] = self;
  v17 = v8;
  v18 = v12;
  v19 = a3;
  v14 = v8;
  v15 = v12;
  dispatch_async(accessQueue, v16);

}

- (BOOL)isInvalidated
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__MPAVRouteConnection_isInvalidated__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)reset
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MPAVRouteConnection_reset__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)sendCustomData:(id)a3
{
  -[MRExternalDevice sendCustomData:withName:](self->_externalDevice, "sendCustomData:withName:", a3, CFSTR("MPAVRouteConnectionCustomData"));
}

- (void)sendMediaRemoteCommand:(unsigned int)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a5;
  -[MRExternalDevice customOrigin](self->_externalDevice, "customOrigin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v8;
    MRMediaRemoteSendCommandToApp();

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

- (void)_connectionStateDidChange:(unsigned int)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  NSObject *accessQueue;
  id v13;
  id v14;
  _QWORD v15[5];
  _QWORD block[5];
  id v17;

  v6 = a4;
  switch(a3)
  {
    case 1u:
      v14 = v6;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("_MPAVRouteConnectionDidAttemptConnectionNotification");
LABEL_7:
      objc_msgSend(v9, "postNotificationName:object:", v11, self, v14);

      goto LABEL_8;
    case 2u:
      v14 = v6;
      v15[0] = MEMORY[0x1E0C809B0];
      accessQueue = self->_accessQueue;
      v15[1] = 3221225472;
      v15[2] = __55__MPAVRouteConnection__connectionStateDidChange_error___block_invoke_2;
      v15[3] = &unk_1E3163508;
      v15[4] = self;
      dispatch_sync(accessQueue, v15);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("_MPAVRouteConnectionDidConnectNotification");
      goto LABEL_7;
    case 3u:
      v7 = self->_accessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__MPAVRouteConnection__connectionStateDidChange_error___block_invoke;
      block[3] = &unk_1E31635F8;
      block[4] = self;
      v13 = v6;
      v17 = v6;
      dispatch_sync(v7, block);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("_MPAVRouteConnectionDidInvalidateNotification"), self);

LABEL_8:
      v6 = v13;
      break;
  }

}

- (void)_externalDeviceConnectionStateDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *calloutQueue;
  id v11;
  _QWORD block[5];
  id v13;
  int v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D4C6F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MPAVRouteConnection__externalDeviceConnectionStateDidChangeNotification___block_invoke;
  block[3] = &unk_1E3158340;
  v14 = v7;
  block[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(calloutQueue, block);

}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __75__MPAVRouteConnection__externalDeviceConnectionStateDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionStateDidChange:error:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __55__MPAVRouteConnection__connectionStateDidChange_error___block_invoke(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = 1;
  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  if (v1)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(*(_QWORD *)(result + 32) + 40), *(_QWORD *)(result + 40));
  return result;
}

uint64_t __55__MPAVRouteConnection__connectionStateDidChange_error___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = 0;
  return result;
}

uint64_t __76__MPAVRouteConnection_sendMediaRemoteCommand_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

uint64_t __28__MPAVRouteConnection_reset__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = 0;
  return result;
}

uint64_t __36__MPAVRouteConnection_isInvalidated__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

void __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke_2;
    v6[3] = &unk_1E3162560;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke_3(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[24])
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPAVRouteConnectionErrorDomain"), 2, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
  else if (objc_msgSend(v2, "isConnected"))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%p"), objc_opt_class(), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("MPAVRouteConnectionReasonUserInfoKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("MPAVRouteConnectionCorrelationIDUserInfoKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("MPAVRouteConnection"));
    v12 = v11;
    if (v6)
      objc_msgSend(v11, "appendFormat:", CFSTR("-%@"), v6);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("MPRouteConnection.connectWithOptions"), v9);
    v14 = v13;
    if (v5)
      objc_msgSend(v13, "appendFormat:", CFSTR(" for %@"), v5);
    if (v6)
      objc_msgSend(v14, "appendFormat:", CFSTR(" because %@"), v6);
    _MRLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v14;
      _os_log_impl(&dword_193B9B000, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v17 = *(_DWORD *)(a1 + 56) & 1;
    v18 = *MEMORY[0x1E0D4BC48];
    v29[0] = *MEMORY[0x1E0D4BC50];
    v29[1] = v18;
    v30[0] = v12;
    v30[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke_62;
    v24[3] = &unk_1E31582C8;
    v25 = v5;
    v26 = v9;
    v27 = v4;
    v28 = *(id *)(a1 + 48);
    v20 = v4;
    v21 = v9;
    v22 = v5;
    objc_msgSend(v16, "connectWithOptions:userInfo:completion:", v17, v19, v24);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  }
}

void __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke_62(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  const __CFString *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1[4];
  _MRLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v15 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v15)
        goto LABEL_15;
      v17 = (void *)a1[4];
      v16 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", a1[6]);
      v32 = 138544130;
      v33 = CFSTR("MPRouteConnection.connectWithOptions");
      v34 = 2114;
      v35 = v16;
      v36 = 2114;
      v37 = v17;
      v38 = 2048;
      v39 = v18;
      v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v20 = v6;
      v21 = 42;
    }
    else
    {
      if (!v15)
        goto LABEL_15;
      v24 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", a1[6]);
      v32 = 138543874;
      v33 = CFSTR("MPRouteConnection.connectWithOptions");
      v34 = 2114;
      v35 = v24;
      v36 = 2048;
      v37 = v25;
      v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v20 = v6;
      v21 = 32;
    }
    _os_log_impl(&dword_193B9B000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v32, v21);
    goto LABEL_14;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v7)
    {
      v9 = a1[4];
      v8 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", a1[6]);
      v32 = 138544386;
      v33 = CFSTR("MPRouteConnection.connectWithOptions");
      v34 = 2114;
      v35 = v8;
      v36 = 2114;
      v37 = v3;
      v38 = 2114;
      v39 = v9;
      v40 = 2048;
      v41 = v11;
      v12 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      v13 = v6;
      v14 = 52;
LABEL_10:
      _os_log_error_impl(&dword_193B9B000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v32, v14);
LABEL_14:

    }
  }
  else if (v7)
  {
    v22 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", a1[6]);
    v32 = 138544130;
    v33 = CFSTR("MPRouteConnection.connectWithOptions");
    v34 = 2114;
    v35 = v22;
    v36 = 2114;
    v37 = v3;
    v38 = 2048;
    v39 = v23;
    v12 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    v13 = v6;
    v14 = 42;
    goto LABEL_10;
  }
LABEL_15:

  (*(void (**)(_QWORD, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[7] + 16))(a1[7], v3, v26, v27, v28, v29, v30, v31);
}

uint64_t __62__MPAVRouteConnection_connectWithOptions_userInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __34__MPAVRouteConnection_description__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 24))
    v5 = CFSTR("NO");
  else
    v5 = CFSTR("YES");
  if (objc_msgSend(*(id *)(a1 + 32), "isConnected"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p valid: %@, connected: %@ %@>"), v3, v4, v5, v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

@end
