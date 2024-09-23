@implementation PAImageConversionServiceClient

- (PAImageConversionServiceClient)init
{
  PAImageConversionServiceClient *v2;
  PAImageConversionServiceClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAImageConversionServiceClient;
  v2 = -[PAImageConversionServiceClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PAImageConversionServiceClient setupServiceConnection](v2, "setupServiceConnection");
  return v3;
}

- (void)setupServiceConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  id v8;

  if (self->_serviceConnection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAImageConversionServiceClient.m"), 42, CFSTR("Unexpected non-nil service connection during connection setup"));

  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.photos.ImageConversionService"), 0);
  -[PAImageConversionServiceClient setServiceConnection:](self, "setServiceConnection:", v3);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFF179C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAImageConversionServiceClient serviceConnection](self, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v4);

  -[PAImageConversionServiceClient serviceConnection](self, "serviceConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

}

- (NSXPCConnection)serviceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PAImageConversionServiceClient serviceConnection](self, "serviceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)PAImageConversionServiceClient;
  -[PAImageConversionServiceClient dealloc](&v4, sel_dealloc);
}

- (void)convertImageAtSourceURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v15;
  v12 = v10;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAImageConversionServiceClient.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceURL"));

    v11 = 0;
  }
  +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:](PAMediaConversionServiceResourceURLCollection, "collectionWithMainResourceURL:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAImageConversionServiceClient convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:](self, "convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v13, 0, v9, v12);

}

- (void)convertImageAtSourceURLCollection:(id)a3 toDestinationURLCollection:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  os_signpost_id_t v24;
  id v25;
  id v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v46[4];
  id v47;
  os_signpost_id_t v48;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v42 = a4;
  v11 = a5;
  v12 = a6;
  v44 = v10;
  if (objc_msgSend(v10, "urlCount"))
  {
    if (v11)
      goto LABEL_3;
LABEL_32:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAImageConversionServiceClient.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageConversionOptions"));

    if (v12)
      goto LABEL_4;
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAImageConversionServiceClient.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalCompletionHandler"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAImageConversionServiceClient.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceURLCollection.urlCount > 0"));

  if (!v11)
    goto LABEL_32;
LABEL_3:
  if (!v12)
    goto LABEL_33;
LABEL_4:
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceOptionApplyOrientationTransformKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceOptionOrientationKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAImageConversionServiceClient.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!(imageConversionOptions[PAMediaConversionServiceOptionApplyOrientationTransformKey] && imageConversionOptions[PAMediaConversionServiceOptionOrientationKey])"));

    }
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceOptionMaximumPixelCountKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceOptionScaleFactorKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceOptionMaximumLongSideLengthKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAImageConversionServiceClient.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!(imageConversionOptions[PAMediaConversionServiceOptionMaximumPixelCountKey] && imageConversionOptions[PAMediaConversionServiceOptionScaleFactorKey] && imageConversionOptions[PAMediaConversionServiceOptionMaximumLongSideLengthKey])"));
      goto LABEL_11;
    }
  }
LABEL_12:
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceOptionOutputFileTypeKey"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAImageConversionServiceClient.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:NSString.class]"));

    }
  }
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v40 = _os_activity_create(&dword_1D51DF000, "mediaconversion-image", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v40, &state);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceJobIdentifierKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = (void *)MEMORY[0x1E0C81028];
  v24 = os_signpost_id_make_with_pointer(MEMORY[0x1E0C81028], v21);
  v25 = v23;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_DWORD *)buf = 138543362;
    v51 = v21;
    _os_signpost_emit_with_name_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v24, "com.apple.photos.mediaconversion.client.image", "Image conversion request %{public}@", buf, 0xCu);
  }

  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __121__PAImageConversionServiceClient_convertImageAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke;
  v46[3] = &unk_1E9953500;
  v48 = v24;
  v26 = v12;
  v47 = v26;
  v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D8270520](v46);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v21, CFSTR("PAMediaConversionServiceJobIdentifierKey"));
  v45 = 0;
  objc_msgSend(v44, "bookmarkDataDictionaryRepresentationWithError:", &v45);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v45;
  if (v29)
  {
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("PAMediaConversionServiceSourceBookmarkCollectionKey"));
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceOptionRequestReasonKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31 == 0;

    if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "valueForKey:", CFSTR("stringValue"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsJoinedByString:", CFSTR(" "));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v35;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Caller did not provide a request reason string, using stack addresses: %@", buf, 0xCu);
      }
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, CFSTR("PAMediaConversionServiceOptionRequestReasonKey"));

    }
    -[PAImageConversionServiceClient sendRequestWithOptions:sourceURLCollection:destinationURLCollection:jobIdentifier:attemptCount:completionHandler:](self, "sendRequestWithOptions:sourceURLCollection:destinationURLCollection:jobIdentifier:attemptCount:completionHandler:", v28, v44, v42, v21, 1, v27);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v51 = v21;
      v52 = 2114;
      v53 = v30;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Image conversion request %{public}@ unable to generate source bookmark data: %{public}@", buf, 0x16u);
    }
    ((void (**)(_QWORD, uint64_t, _QWORD, id))v27)[2](v27, 2, 0, v30);
  }

  os_activity_scope_leave(&state);
}

- (void)sendRequestWithOptions:(id)a3 sourceURLCollection:(id)a4 destinationURLCollection:(id)a5 jobIdentifier:(id)a6 attemptCount:(int64_t)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t, _QWORD, id);
  void *v17;
  char v18;
  id v19;
  int64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void (**v29)(id, uint64_t, _QWORD, id);
  void (**v30)(id, uint64_t, _QWORD, id);
  void *v31;
  void *v32;
  id v33;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  PAImageConversionServiceClient *v41;
  void (**v42)(id, uint64_t, _QWORD, id);
  int64_t v43;
  _QWORD v44[4];
  id v45;
  id v46;
  PAImageConversionServiceClient *v47;
  id v48;
  id v49;
  id v50;
  int64_t v51;
  id v52;
  id v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  int64_t v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v35 = a6;
  v16 = (void (**)(id, uint64_t, _QWORD, id))a8;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v14, "logMessageSummary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v55 = v35;
    v56 = 2112;
    v57 = v17;
    v58 = 2048;
    v59 = a7;
    v60 = 1024;
    v61 = 2;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Sending image conversion request %{public}@ for %@ (attempt %ld of %d)", buf, 0x26u);

  }
  if (!v15)
  {
    v20 = a7;
    v23 = v14;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PAMediaConversionServiceOptionWantsResultAsDataKey"));
    goto LABEL_8;
  }
  v53 = 0;
  v18 = objc_msgSend(v15, "ensureFilesExistWithError:", &v53);
  v19 = v53;
  if ((v18 & 1) == 0)
  {
    v16[2](v16, 2, 0, v19);
    goto LABEL_13;
  }
  v20 = a7;
  v52 = 0;
  objc_msgSend(v15, "bookmarkDataDictionaryRepresentationWithError:", &v52);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v52;
  if (v21)
  {
    v23 = v14;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("PAMediaConversionServiceDestinationBookmarkCollectionKey"));

LABEL_8:
    v33 = v13;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAImageConversionServiceClient serviceConnection](self, "serviceConnection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __147__PAImageConversionServiceClient_sendRequestWithOptions_sourceURLCollection_destinationURLCollection_jobIdentifier_attemptCount_completionHandler___block_invoke;
    v44[3] = &unk_1E9953548;
    v25 = v35;
    v45 = v25;
    v51 = v20;
    v26 = v13;
    v46 = v26;
    v47 = self;
    v27 = v23;
    v48 = v23;
    v28 = v15;
    v49 = v28;
    v29 = v16;
    v50 = v29;
    objc_msgSend(v32, "remoteObjectProxyWithErrorHandler:", v44);
    v30 = v16;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __147__PAImageConversionServiceClient_sendRequestWithOptions_sourceURLCollection_destinationURLCollection_jobIdentifier_attemptCount_completionHandler___block_invoke_84;
    v36[3] = &unk_1E9953580;
    v37 = v26;
    v38 = v24;
    v39 = v25;
    v43 = v20;
    v42 = v29;
    v40 = v28;
    v41 = self;
    v19 = v24;
    v14 = v27;
    objc_msgSend(v31, "convertImageWithOptions:reply:", v37, v36);

    v16 = v30;
    v13 = v33;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v55 = v35;
    v56 = 2114;
    v57 = v22;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Image conversion request %{public}@ unable to generate destination bookmark data: %{public}@", buf, 0x16u);
  }
  v16[2](v16, 2, 0, v22);

LABEL_13:
}

- (void)requestStatusWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  PAImageConversionServiceClient *v12;
  id v13;

  v4 = a3;
  -[PAImageConversionServiceClient serviceConnection](self, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __69__PAImageConversionServiceClient_requestStatusWithCompletionHandler___block_invoke;
  v11 = &unk_1E99535A8;
  v12 = self;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestStatusWithReply:", v6, v8, v9, v10, v11, v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __69__PAImageConversionServiceClient_requestStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v3;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Image conversion status request error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __147__PAImageConversionServiceClient_sendRequestWithOptions_sourceURLCollection_destinationURLCollection_jobIdentifier_attemptCount_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 80);
    v12 = 138544130;
    v13 = v10;
    v14 = 2048;
    v15 = v11;
    v16 = 1024;
    v17 = 2;
    v18 = 2114;
    v19 = v3;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Image conversion request %{public}@ (attempt %ld of %d) XPC error: %{public}@", (uint8_t *)&v12, 0x26u);
  }
  if (*(uint64_t *)(a1 + 80) > 1)
    goto LABEL_8;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) == 0)
  {

    goto LABEL_8;
  }
  if (objc_msgSend(v3, "code") != 4097)
  {
    v5 = objc_msgSend(v3, "code") == 4099;

    if (v5)
      goto LABEL_11;
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_9;
  }

LABEL_11:
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceOptionUnitTestSupportServiceShouldExitDuringRequestKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", 0, CFSTR("PAMediaConversionServiceOptionUnitTestSupportServiceShouldExitDuringRequestKey"));
  v7 = *(id *)(a1 + 48);
  objc_sync_enter(v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "invalidate");
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = 0;

  objc_msgSend(*(id *)(a1 + 48), "setupServiceConnection");
  objc_sync_exit(v7);

  objc_msgSend(*(id *)(a1 + 48), "sendRequestWithOptions:sourceURLCollection:destinationURLCollection:jobIdentifier:attemptCount:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80) + 1, *(_QWORD *)(a1 + 72));
LABEL_9:

}

void __147__PAImageConversionServiceClient_sendRequestWithOptions_sourceURLCollection_destinationURLCollection_jobIdentifier_attemptCount_completionHandler___block_invoke_84(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void (*v21)(void);
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceOptionWantsResultAsDataKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceOptionIsPhotosAdjustmentsCalculationKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (!v8)
  {
    v14 = 0;
    goto LABEL_8;
  }
  v14 = (void *)objc_msgSend(v8, "mutableCopy");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v15, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("PAMediaConversionServiceConversionTotalDurationTimeIntervalClientSideKey"));

  if (((v11 ^ 1 | v13) & 1) != 0)
  {
    if (v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v18 = *(_QWORD *)(a1 + 80);
        v19 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 56), "fileSizeSummary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138544130;
        v28 = v19;
        v29 = 2048;
        v30 = v18;
        v31 = 1024;
        v32 = 2;
        v33 = 2112;
        v34 = (uint64_t)v20;
        _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Image conversion request %{public}@ (attempt %ld of %d) (url output) successful completion, output image sizes: %@", (uint8_t *)&v27, 0x26u);

      }
      v21 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_11:
      v21();
      goto LABEL_12;
    }
LABEL_8:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 48);
      v26 = *(_QWORD *)(a1 + 80);
      v27 = 138544130;
      v28 = v25;
      v29 = 2048;
      v30 = v26;
      v31 = 1024;
      v32 = 2;
      v33 = 2114;
      v34 = (uint64_t)v9;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Image conversion request %{public}@ (url output) (attempt %ld of %d) unsuccessful completion: %{public}@", (uint8_t *)&v27, 0x26u);
    }
    v21 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_11;
  }
  if (!v7 || !v14)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v7, CFSTR("PAMediaConversionServiceResultDataKey"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v23 = *(_QWORD *)(a1 + 48);
    v24 = *(_QWORD *)(a1 + 80);
    v27 = 138544130;
    v28 = v23;
    v29 = 2048;
    v30 = v24;
    v31 = 1024;
    v32 = 2;
    v33 = 2048;
    v34 = objc_msgSend(v7, "length");
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Image conversion request %{public}@ (attempt %ld of %d) (data output) successful completion, output image size: %lu", (uint8_t *)&v27, 0x26u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

LABEL_12:
}

void __121__PAImageConversionServiceClient_convertImageAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  os_signpost_id_t v9;
  void *v10;
  id v11;
  os_signpost_id_t v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C81028];
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_SIGNPOST_EVENT, v9, "com.apple.photos.mediaconversion.client.image.pre-completion", (const char *)&unk_1D5204966, buf, 2u);
  }
  v10 = (void *)MEMORY[0x1E0C81028];

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 40);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v12, "com.apple.photos.mediaconversion.client.image", (const char *)&unk_1D5204966, v13, 2u);
  }

}

@end
