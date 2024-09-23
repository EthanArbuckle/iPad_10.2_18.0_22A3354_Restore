@implementation ASDTestFlightFeedback

+ (id)interface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE391FB0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_getFeedbackMetadataForBundleID_withCompletionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_getLaunchInfoForBundleID_withCompletionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getLaunchInfoForVersion_withCompletionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getLaunchInfoForVersion_withCompletionHandler_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_setFeedbackEnabled_forVersion_withCompletionHandler_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_setLaunchScreenEnabled_forVersion_withCompletionHandler_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_setLaunchInfo_withCompletionHandler_, 0, 0);

  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ASDTestFlightFeedback_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFA9E0 != -1)
    dispatch_once(&qword_1ECFFA9E0, block);
  return (id)_MergedGlobals_27;
}

void __39__ASDTestFlightFeedback_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_27;
  _MergedGlobals_27 = (uint64_t)v1;

}

- (ASDTestFlightFeedback)init
{
  void *v3;
  id v4;
  ASDTestFlightFeedback *v5;
  objc_super v7;

  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDTestFlightFeedback;
    v5 = -[ASDTestFlightFeedback init](&v7, sel_init);
    self = v5;
    if (v5)
      objc_storeStrong((id *)&v5->_serviceBroker, v3);
  }

  return self;
}

- (id)getDisplayNamesForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31[3];

  v31[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(37);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEBUG, "getDisplayNamesForBundleID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31[0] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithError:](serviceBroker, "getTestFlightFeedbackServiceWithError:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v31, obj);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__ASDTestFlightFeedback_getDisplayNamesForBundleID___block_invoke;
  v15[3] = &unk_1E37BDFB0;
  v15[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __52__ASDTestFlightFeedback_getDisplayNamesForBundleID___block_invoke_2;
  v14[3] = &unk_1E37BE420;
  v14[4] = &v17;
  objc_msgSend(v9, "getDisplayNamesForBundleID:withCompletionHandler:", v4, v14);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ASDLogHandleForCategory(37);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v23 = 138543618;
      v24 = v4;
      v25 = 2114;
      v26 = v13;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "Error in getDisplayNamesForBundleID:%{public}@ - %{public}@", v23, 0x16u);
    }

  }
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __52__ASDTestFlightFeedback_getDisplayNamesForBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__ASDTestFlightFeedback_getDisplayNamesForBundleID___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getDisplayNamesForBundleURL:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31[3];

  v31[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(37);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEBUG, "getDisplayNamesForBundleURL: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31[0] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithError:](serviceBroker, "getTestFlightFeedbackServiceWithError:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v31, obj);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__ASDTestFlightFeedback_getDisplayNamesForBundleURL___block_invoke;
  v15[3] = &unk_1E37BDFB0;
  v15[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __53__ASDTestFlightFeedback_getDisplayNamesForBundleURL___block_invoke_2;
  v14[3] = &unk_1E37BE420;
  v14[4] = &v17;
  objc_msgSend(v9, "getDisplayNamesForBundleURL:withCompletionHandler:", v4, v14);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ASDLogHandleForCategory(37);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v23 = 138543618;
      v24 = v4;
      v25 = 2114;
      v26 = v13;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "Error in getDisplayNamesForBundleURL:%{public}@ - %{public}@", v23, 0x16u);
    }

  }
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __53__ASDTestFlightFeedback_getDisplayNamesForBundleURL___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __53__ASDTestFlightFeedback_getDisplayNamesForBundleURL___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getEmailAddressForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31[3];

  v31[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(37);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEBUG, "getEmailAddressForBundleID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31[0] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithError:](serviceBroker, "getTestFlightFeedbackServiceWithError:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v31, obj);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__ASDTestFlightFeedback_getEmailAddressForBundleID___block_invoke;
  v15[3] = &unk_1E37BDFB0;
  v15[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __52__ASDTestFlightFeedback_getEmailAddressForBundleID___block_invoke_2;
  v14[3] = &unk_1E37BE448;
  v14[4] = &v17;
  objc_msgSend(v9, "getEmailAddressForBundleID:withCompletionHandler:", v4, v14);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ASDLogHandleForCategory(37);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v23 = 138543618;
      v24 = v4;
      v25 = 2114;
      v26 = v13;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "Error in getEmailAddressForBundleID:%{public}@ - %{public}@", v23, 0x16u);
    }

  }
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __52__ASDTestFlightFeedback_getEmailAddressForBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __52__ASDTestFlightFeedback_getEmailAddressForBundleID___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getEmailAddressForBundleURL:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31[3];

  v31[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(37);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEBUG, "getEmailAddressForBundleURL: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31[0] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithError:](serviceBroker, "getTestFlightFeedbackServiceWithError:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v31, obj);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__ASDTestFlightFeedback_getEmailAddressForBundleURL___block_invoke;
  v15[3] = &unk_1E37BDFB0;
  v15[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __53__ASDTestFlightFeedback_getEmailAddressForBundleURL___block_invoke_2;
  v14[3] = &unk_1E37BE448;
  v14[4] = &v17;
  objc_msgSend(v9, "getEmailAddressForBundleURL:withCompletionHandler:", v4, v14);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ASDLogHandleForCategory(37);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v23 = 138543618;
      v24 = v4;
      v25 = 2114;
      v26 = v13;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "Error in getEmailAddressForBundleURL:%{public}@ - %{public}@", v23, 0x16u);
    }

  }
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __53__ASDTestFlightFeedback_getEmailAddressForBundleURL___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __53__ASDTestFlightFeedback_getEmailAddressForBundleURL___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)getFeedbackMetadataForBundleID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ASDServiceBroker *serviceBroker;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(37);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_debug_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEBUG, "getFeedbackMetadataForBundleID: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E37BE498;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithCompletionHandler:](serviceBroker, "getTestFlightFeedbackServiceWithCompletionHandler:", v12);

}

void __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_4;
    v7[3] = &unk_1E37BE470;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "getFeedbackMetadataForBundleID:withCompletionHandler:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_5;
  block[3] = &unk_1E37BDF10;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getFeedbackMetadataForBundleURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ASDServiceBroker *serviceBroker;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(37);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_debug_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEBUG, "getFeedbackMetadataForBundleURL: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E37BE498;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithCompletionHandler:](serviceBroker, "getTestFlightFeedbackServiceWithCompletionHandler:", v12);

}

void __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_4;
    v7[3] = &unk_1E37BE470;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "getFeedbackMetadataForBundleURL:withCompletionHandler:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_5;
  block[3] = &unk_1E37BDF10;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)getLaunchInfoForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31[3];

  v31[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(37);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEBUG, "getLaunchInfoForBundleID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31[0] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithError:](serviceBroker, "getTestFlightFeedbackServiceWithError:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v31, obj);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__ASDTestFlightFeedback_getLaunchInfoForBundleID___block_invoke;
  v15[3] = &unk_1E37BDFB0;
  v15[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __50__ASDTestFlightFeedback_getLaunchInfoForBundleID___block_invoke_2;
  v14[3] = &unk_1E37BE4C0;
  v14[4] = &buf;
  v14[5] = &v17;
  objc_msgSend(v9, "getLaunchInfoForBundleID:withCompletionHandler:", v4, v14);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ASDLogHandleForCategory(37);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v23 = 138543618;
      v24 = v4;
      v25 = 2114;
      v26 = v13;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "Error in getLaunchInfoForBundleID: %{public}@ - %{public}@", v23, 0x16u);
    }

  }
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __50__ASDTestFlightFeedback_getLaunchInfoForBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__ASDTestFlightFeedback_getLaunchInfoForBundleID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)getLaunchInfoForBundleURL:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31[3];

  v31[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(37);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEBUG, "getLaunchInfoForBundleURL: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31[0] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithError:](serviceBroker, "getTestFlightFeedbackServiceWithError:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v31, obj);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__ASDTestFlightFeedback_getLaunchInfoForBundleURL___block_invoke;
  v15[3] = &unk_1E37BDFB0;
  v15[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __51__ASDTestFlightFeedback_getLaunchInfoForBundleURL___block_invoke_2;
  v14[3] = &unk_1E37BE4C0;
  v14[4] = &buf;
  v14[5] = &v17;
  objc_msgSend(v9, "getLaunchInfoForBundleURL:withCompletionHandler:", v4, v14);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ASDLogHandleForCategory(37);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v23 = 138543618;
      v24 = v4;
      v25 = 2114;
      v26 = v13;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "Error in getLaunchInfoForBundleID: %{public}@ - %{public}@", v23, 0x16u);
    }

  }
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __51__ASDTestFlightFeedback_getLaunchInfoForBundleURL___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51__ASDTestFlightFeedback_getLaunchInfoForBundleURL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)getLaunchInfoForBundleID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ASDServiceBroker *serviceBroker;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(37);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_debug_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEBUG, "getLaunchInfoForBundleID: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E37BE498;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithCompletionHandler:](serviceBroker, "getTestFlightFeedbackServiceWithCompletionHandler:", v12);

}

void __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_4;
    v7[3] = &unk_1E37BE4E8;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "getLaunchInfoForBundleID:withCompletionHandler:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_5;
  block[3] = &unk_1E37BDF10;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getLaunchInfoForBundleURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ASDServiceBroker *serviceBroker;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(37);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_debug_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEBUG, "getLaunchInfoForBundleURL: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E37BE498;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithCompletionHandler:](serviceBroker, "getTestFlightFeedbackServiceWithCompletionHandler:", v12);

}

void __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_4;
    v7[3] = &unk_1E37BE4E8;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "getLaunchInfoForBundleURL:withCompletionHandler:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_5;
  block[3] = &unk_1E37BDF10;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_5(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)getLaunchInfoForVersion:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31[3];

  v31[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(37);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEBUG, "getLaunchInfoForVersion %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31[0] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithError:](serviceBroker, "getTestFlightFeedbackServiceWithError:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v31, obj);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__ASDTestFlightFeedback_getLaunchInfoForVersion___block_invoke;
  v15[3] = &unk_1E37BDFB0;
  v15[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __49__ASDTestFlightFeedback_getLaunchInfoForVersion___block_invoke_2;
  v14[3] = &unk_1E37BE4C0;
  v14[4] = &buf;
  v14[5] = &v17;
  objc_msgSend(v9, "getLaunchInfoForVersion:withCompletionHandler:", v4, v14);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ASDLogHandleForCategory(37);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v23 = 138543618;
      v24 = v4;
      v25 = 2114;
      v26 = v13;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "Error in getLaunchInfoForVersion %{public}@: %{public}@", v23, 0x16u);
    }

  }
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __49__ASDTestFlightFeedback_getLaunchInfoForVersion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __49__ASDTestFlightFeedback_getLaunchInfoForVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)isFeedbackEnabledForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t v21[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29[3];

  v29[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(37);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEBUG, "isFeedbackEnabledForBundleID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29[0] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithError:](serviceBroker, "getTestFlightFeedbackServiceWithError:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v29, obj);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__ASDTestFlightFeedback_isFeedbackEnabledForBundleID___block_invoke;
  v15[3] = &unk_1E37BDFB0;
  v15[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __54__ASDTestFlightFeedback_isFeedbackEnabledForBundleID___block_invoke_2;
  v14[3] = &unk_1E37BE510;
  v14[4] = &v17;
  objc_msgSend(v9, "isFeedbackEnabledForBundleID:withCompletionHandler:", v4, v14);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ASDLogHandleForCategory(37);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v21 = 138543618;
      v22 = v4;
      v23 = 2114;
      v24 = v13;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "Error in isFeedbackEnabledForBundleID:%{public}@ - %{public}@", v21, 0x16u);
    }

    v11 = 0;
    *((_BYTE *)v18 + 24) = 0;
  }
  else
  {
    v11 = *((_BYTE *)v18 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __54__ASDTestFlightFeedback_isFeedbackEnabledForBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __54__ASDTestFlightFeedback_isFeedbackEnabledForBundleID___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isFeedbackEnabledForBundleURL:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t v21[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29[3];

  v29[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(37);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEBUG, "isFeedbackEnabledForBundleURL: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29[0] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithError:](serviceBroker, "getTestFlightFeedbackServiceWithError:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v29, obj);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__ASDTestFlightFeedback_isFeedbackEnabledForBundleURL___block_invoke;
  v15[3] = &unk_1E37BDFB0;
  v15[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __55__ASDTestFlightFeedback_isFeedbackEnabledForBundleURL___block_invoke_2;
  v14[3] = &unk_1E37BE510;
  v14[4] = &v17;
  objc_msgSend(v9, "isFeedbackEnabledForBundleURL:withCompletionHandler:", v4, v14);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ASDLogHandleForCategory(37);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v21 = 138543618;
      v22 = v4;
      v23 = 2114;
      v24 = v13;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "Error in isFeedbackEnabledForBundleURL:%{public}@ - %{public}@", v21, 0x16u);
    }

    v11 = 0;
    *((_BYTE *)v18 + 24) = 0;
  }
  else
  {
    v11 = *((_BYTE *)v18 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __55__ASDTestFlightFeedback_isFeedbackEnabledForBundleURL___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __55__ASDTestFlightFeedback_isFeedbackEnabledForBundleURL___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isLaunchScreenEnabledForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t v21[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29[3];

  v29[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(37);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEBUG, "isLaunchScreenEnabledForBundleID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29[0] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithError:](serviceBroker, "getTestFlightFeedbackServiceWithError:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v29, obj);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleID___block_invoke;
  v15[3] = &unk_1E37BDFB0;
  v15[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __58__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleID___block_invoke_2;
  v14[3] = &unk_1E37BE510;
  v14[4] = &v17;
  objc_msgSend(v9, "isLaunchScreenEnabledForBundleID:withCompletionHandler:", v4, v14);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ASDLogHandleForCategory(37);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v21 = 138543618;
      v22 = v4;
      v23 = 2114;
      v24 = v13;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "Error in isLaunchScreenEnabledForBundleID:%{public}@ - %{public}@", v21, 0x16u);
    }

    v11 = 0;
    *((_BYTE *)v18 + 24) = 0;
  }
  else
  {
    v11 = *((_BYTE *)v18 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __58__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __58__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleID___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isLaunchScreenEnabledForBundleURL:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t v21[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29[3];

  v29[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(37);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEBUG, "isLaunchScreenEnabledForBundleURL: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29[0] = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  serviceBroker = self->_serviceBroker;
  obj = 0;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithError:](serviceBroker, "getTestFlightFeedbackServiceWithError:", &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v29, obj);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleURL___block_invoke;
  v15[3] = &unk_1E37BDFB0;
  v15[4] = &buf;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __59__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleURL___block_invoke_2;
  v14[3] = &unk_1E37BE510;
  v14[4] = &v17;
  objc_msgSend(v9, "isLaunchScreenEnabledForBundleURL:withCompletionHandler:", v4, v14);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ASDLogHandleForCategory(37);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v21 = 138543618;
      v22 = v4;
      v23 = 2114;
      v24 = v13;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "Error in isLaunchScreenEnabledForBundleURL:%{public}@ - %{public}@", v21, 0x16u);
    }

    v11 = 0;
    *((_BYTE *)v18 + 24) = 0;
  }
  else
  {
    v11 = *((_BYTE *)v18 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __59__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleURL___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __59__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleURL___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setFeedbackEnabled:(BOOL)a3 forVersion:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  ASDServiceBroker *serviceBroker;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  ASDLogHandleForCategory(37);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v8;
    _os_log_debug_impl(&dword_19A03B000, v10, OS_LOG_TYPE_DEBUG, "setFeedbackEnabled:forVersion: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E37BE538;
  v17 = a3;
  v15 = v8;
  v16 = v9;
  v12 = v8;
  v13 = v9;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithCompletionHandler:](serviceBroker, "getTestFlightFeedbackServiceWithCompletionHandler:", v14);

}

void __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E37BDB60;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int8 *)(a1 + 48);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E37BDB60;
    v7 = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setFeedbackEnabled:forVersion:withCompletionHandler:", v6, v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setLaunchScreenEnabled:(BOOL)a3 forVersion:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  ASDServiceBroker *serviceBroker;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  ASDLogHandleForCategory(37);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v8;
    _os_log_debug_impl(&dword_19A03B000, v10, OS_LOG_TYPE_DEBUG, "setLaunchScreenEnabled:forVersion: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E37BE538;
  v17 = a3;
  v15 = v8;
  v16 = v9;
  v12 = v8;
  v13 = v9;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithCompletionHandler:](serviceBroker, "getTestFlightFeedbackServiceWithCompletionHandler:", v14);

}

void __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E37BDB60;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int8 *)(a1 + 48);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E37BDB60;
    v7 = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setLaunchScreenEnabled:forVersion:withCompletionHandler:", v6, v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setLaunchInfo:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ASDServiceBroker *serviceBroker;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(37);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "version");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_debug_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEBUG, "setLaunchInfo: %{public}@", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E37BE498;
  v14 = v6;
  v15 = v7;
  v10 = v6;
  v11 = v7;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithCompletionHandler:](serviceBroker, "getTestFlightFeedbackServiceWithCompletionHandler:", v13);

}

void __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_4;
    v7[3] = &unk_1E37BDB60;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "setLaunchInfo:withCompletionHandler:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)submitFeedback:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ASDServiceBroker *serviceBroker;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(37);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_debug_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEBUG, "submitFeedback: %{public}@", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E37BE498;
  v14 = v6;
  v15 = v7;
  v10 = v6;
  v11 = v7;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithCompletionHandler:](serviceBroker, "getTestFlightFeedbackServiceWithCompletionHandler:", v13);

}

void __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_4;
    v7[3] = &unk_1E37BDB60;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "submitFeedback:withCompletionHandler:", v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)submitFeedback:(id)a3 bundleURL:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ASDServiceBroker *serviceBroker;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ASDLogHandleForCategory(37);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    _os_log_debug_impl(&dword_19A03B000, v11, OS_LOG_TYPE_DEBUG, "submitFeedback:bundleURL: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E37BE560;
  v18 = v9;
  v19 = v10;
  v17 = v8;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithCompletionHandler:](serviceBroker, "getTestFlightFeedbackServiceWithCompletionHandler:", v16);

}

void __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E37BDB60;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "submitFeedback:bundleURL:withCompletionHandler:", v6, v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)updateTestNotes:(id)a3 forVersion:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ASDServiceBroker *serviceBroker;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ASDLogHandleForCategory(37);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    _os_log_debug_impl(&dword_19A03B000, v11, OS_LOG_TYPE_DEBUG, "updateTestNotes:forVersion: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E37BE560;
  v18 = v9;
  v19 = v10;
  v17 = v8;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  -[ASDServiceBroker getTestFlightFeedbackServiceWithCompletionHandler:](serviceBroker, "getTestFlightFeedbackServiceWithCompletionHandler:", v16);

}

void __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E37BDB60;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "updateTestNotes:forVersion:withCompletionHandler:", v6, v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E37BDCC0;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
