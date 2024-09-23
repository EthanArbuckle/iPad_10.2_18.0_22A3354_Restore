@implementation PAVideoConversionServiceClient

- (void)setupServiceConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.photos.VideoConversionService"), 0);
  -[PAVideoConversionServiceClient setServiceConnection:](self, "setServiceConnection:", v3);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFF17968);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAVideoConversionServiceClient serviceConnection](self, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v4);

  -[PAVideoConversionServiceClient serviceConnection](self, "serviceConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedObject:", self);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFF11670);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAVideoConversionServiceClient serviceConnection](self, "serviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedInterface:", v7);

  -[PAVideoConversionServiceClient serviceConnection](self, "serviceConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (NSXPCConnection)serviceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (PAVideoConversionServiceClient)init
{
  PAVideoConversionServiceClient *v2;
  void *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAVideoConversionServiceClient;
  v2 = -[PAVideoConversionServiceClient init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PAVideoConversionServiceClient setPendingRequestIdentifierToProgressMap:](v2, "setPendingRequestIdentifierToProgressMap:", v3);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.photos.mediaconversion.client.isolation", v4);
    -[PAVideoConversionServiceClient setIsolationQueue:](v2, "setIsolationQueue:", v5);

    -[PAVideoConversionServiceClient setupServiceConnection](v2, "setupServiceConnection");
    -[PAVideoConversionServiceClient setState:](v2, "setState:", 1);
  }
  return v2;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)convertVideoAtSourceURL:(id)a3 toDestinationURL:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAVideoConversionServiceClient.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceURL"));

  }
  +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:](PAMediaConversionServiceResourceURLCollection, "collectionWithMainResourceURL:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:](PAMediaConversionServiceResourceURLCollection, "collectionWithMainResourceURL:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  -[PAVideoConversionServiceClient convertVideoAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:](self, "convertVideoAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v15, v16, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)convertVideoAtSourceURLCollection:(id)a3 toDestinationURLCollection:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  os_signpost_id_t v23;
  id v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v27;
  char v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  NSObject *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  _QWORD v62[5];
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  PAVideoConversionServiceClient *v68;
  id v69;
  _QWORD block[5];
  id v71;
  id v72;
  _BYTE *v73;
  _QWORD v74[4];
  id v75;
  PAVideoConversionServiceClient *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  os_signpost_id_t v83;
  os_activity_scope_state_s state;
  uint8_t v85[4];
  id v86;
  _BYTE buf[24];
  char v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v58 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  v61 = v12;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAVideoConversionServiceClient.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inputOptions"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAVideoConversionServiceClient.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalCompletionHandler"));

LABEL_3:
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v56 = _os_activity_create(&dword_1D51DF000, "mediaconversion-video", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v56, &state);
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceJobIdentifierKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  v19 = MEMORY[0x1E0C81028];
  v20 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v11, "logMessageSummary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v21;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ for %@", buf, 0x16u);

  }
  v22 = (void *)MEMORY[0x1E0C81028];
  v23 = os_signpost_id_make_with_pointer(MEMORY[0x1E0C81028], v17);
  v24 = v22;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v17;
    _os_signpost_emit_with_name_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v23, "com.apple.photos.mediaconversion.client.video", "Video conversion request %{public}@", buf, 0xCu);
  }

  v25 = MEMORY[0x1E0C809B0];
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke;
  v81[3] = &unk_1E9953500;
  v83 = v23;
  v55 = v14;
  v82 = v55;
  v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D8270520](v81);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v12);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  objc_msgSend(v11, "bookmarkDataDictionaryRepresentationWithError:", &v80);
  v27 = objc_claimAutoreleasedReturnValue();
  v59 = v80;
  v57 = (void *)v27;
  if (v27)
  {
    if (v58)
    {
      v79 = 0;
      v28 = objc_msgSend(v58, "ensureFilesExistWithError:", &v79);
      v29 = v79;
      if ((v28 & 1) == 0)
      {
        ((void (**)(_QWORD, uint64_t, _QWORD, id))v26)[2](v26, 2, 0, v29);
        v31 = 0;
LABEL_38:

        v32 = v57;
        goto LABEL_39;
      }
      v78 = v59;
      objc_msgSend(v58, "bookmarkDataDictionaryRepresentationWithError:", &v78);
      v54 = objc_claimAutoreleasedReturnValue();
      v30 = v78;

      v59 = v30;
      if (!v54)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v30;
          _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video conversion request %{public}@ unable to generate destination bookmark data: %{public}@", buf, 0x16u);
        }
        ((void (**)(_QWORD, uint64_t, _QWORD, id))v26)[2](v26, 2, 0, v30);
        v31 = 0;
        goto LABEL_38;
      }

    }
    else
    {
      objc_msgSend(v60, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PAMediaConversionServiceOptionWantsResultAsDataKey"));
      v54 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setUserInfoObject:forKey:", v17, CFSTR("PAMediaConversionServiceJobIdentifierKey"));
    v74[0] = v25;
    v74[1] = 3221225472;
    v74[2] = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_81;
    v74[3] = &unk_1E9953868;
    v34 = v17;
    v75 = v34;
    v76 = self;
    v35 = v26;
    v77 = v35;
    objc_msgSend(v33, "setCancellationHandler:", v74);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v88 = 0;
    -[PAVideoConversionServiceClient isolationQueue](self, "isolationQueue");
    v36 = objc_claimAutoreleasedReturnValue();
    block[0] = v25;
    block[1] = 3221225472;
    block[2] = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_85;
    block[3] = &unk_1E9953140;
    block[4] = self;
    v37 = v34;
    v71 = v37;
    v53 = v33;
    v72 = v53;
    v73 = buf;
    dispatch_sync(v36, block);

    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      objc_msgSend(v60, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PAMediaConversionServiceOptionWantsProgressKey"));
      objc_msgSend(v60, "setObject:forKeyedSubscript:", v37, CFSTR("PAMediaConversionServiceJobIdentifierKey"));
      -[PAVideoConversionServiceClient serviceConnection](self, "serviceConnection");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v25;
      v66[1] = 3221225472;
      v66[2] = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_87;
      v66[3] = &unk_1E9953168;
      v39 = v37;
      v67 = v39;
      v68 = self;
      v40 = v35;
      v69 = v40;
      objc_msgSend(v38, "remoteObjectProxyWithErrorHandler:", v66);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v25;
      v62[1] = 3221225472;
      v62[2] = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_90;
      v62[3] = &unk_1E9953190;
      v62[4] = self;
      v42 = v39;
      v63 = v42;
      v43 = v41;
      v64 = v43;
      v65 = v40;
      v44 = (void *)MEMORY[0x1D8270520](v62);
      objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceOptionTargetFileSizeKey"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceOptionIsGIFExportConversionKey"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "BOOLValue");

      if (v45)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v85 = 138543362;
          v86 = v42;
          _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ sending single pass export request", v85, 0xCu);
        }
        objc_msgSend(v52, "singlePassConvertVideoAtSourceBookmarkDictionary:toDestinationBookmarkDictionary:options:replyHandler:", v57, v54, v60, v44);
      }
      else if (v47)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v85 = 138543362;
          v86 = v42;
          _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ sending GIF export request", v85, 0xCu);
        }
        objc_msgSend(v52, "generateGIFForVideoAtSourceBookmarkDictionary:toDestinationBookmarkDictionary:options:replyHandler:", v57, v54, v60, v44);
      }
      else
      {
        objc_msgSend(v52, "convertVideoAtSourceBookmarkDictionary:toDestinationBookmarkDictionary:options:replyHandler:", v57, v54, v60, v44);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v85 = 138543362;
          v86 = v42;
          _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ sending export request", v85, 0xCu);
        }
      }
      v31 = v53;

      v48 = v67;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAMediaConversionServiceErrorDomain"), 10, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, _QWORD, void *))v35 + 2))(v35, 2, 0, v48);
      v31 = 0;
    }

    _Block_object_dispose(buf, 8);
    v29 = (id)v54;
    goto LABEL_38;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v59;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video conversion request %{public}@ unable to generate source bookmark data: %{public}@", buf, 0x16u);
  }
  ((void (**)(_QWORD, uint64_t, _QWORD, id))v26)[2](v26, 2, 0, v59);
  v31 = 0;
  v32 = 0;
LABEL_39:

  os_activity_scope_leave(&state);
  return v31;
}

- (BOOL)canMarkPendingRequestAsOptionalForProgress:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceJobIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 != 0;
}

- (void)markPendingRequestAsOptionalForProgress:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v5 = a3;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceJobIdentifierKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAVideoConversionServiceClient.m"), 214, CFSTR("Unexpected nil request identifier"));

  }
  -[PAVideoConversionServiceClient isolationQueue](self, "isolationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PAVideoConversionServiceClient_markPendingRequestAsOptionalForProgress___block_invoke;
  block[3] = &unk_1E99531B8;
  block[4] = self;
  v13 = v7;
  v14 = v5;
  v9 = v5;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)modifyRequestWithIdentifier:(id)a3 modifications:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  PAVideoConversionServiceClient *v17;

  v6 = a3;
  v7 = a4;
  -[PAVideoConversionServiceClient isolationQueue](self, "isolationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[PAVideoConversionServiceClient serviceConnection](self, "serviceConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __76__PAVideoConversionServiceClient_modifyRequestWithIdentifier_modifications___block_invoke;
  v15 = &unk_1E99531E0;
  v16 = v6;
  v17 = self;
  v10 = v6;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "modifyJobWithIdentifier:modifications:", v10, v7, v12, v13, v14, v15);
}

- (void)extractStillImageFromVideoAtSourceURL:(id)a3 toDestinationURL:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _BYTE *v17;
  NSObject *v18;
  id v19;
  void *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void (**v39)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  id v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  id v52;
  void (**v53)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v54[5];
  id v55;
  id v56;
  _QWORD block[5];
  id v58;
  _BYTE *v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  os_signpost_id_t v65;
  os_activity_scope_state_s state;
  _BYTE buf[24];
  char v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v48 = a4;
  v11 = a5;
  v12 = a6;
  v50 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAVideoConversionServiceClient.m"), 251, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceURL"));

  }
  v49 = v11;
  if (v11)
  {
    if (v12)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAVideoConversionServiceClient.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inputOptions"));

    if (v12)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAVideoConversionServiceClient.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalCompletionHandler"));

LABEL_5:
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v46 = _os_activity_create(&dword_1D51DF000, "mediaconversion-video-still", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v46, &state);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceJobIdentifierKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  v17 = buf;
  v18 = MEMORY[0x1E0C81028];
  v19 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v50, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v20;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Video still extraction request %{public}@ for %@", buf, 0x16u);

  }
  v21 = os_signpost_id_make_with_pointer(v18, v15);
  v22 = v18;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v15;
    _os_signpost_emit_with_name_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v21, "com.apple.photos.mediaconversion.client.video-still", "Video still extraction request %{public}@", buf, 0xCu);
  }

  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke;
  v63[3] = &unk_1E9953500;
  v65 = v21;
  v45 = v12;
  v64 = v45;
  v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D8270520](v63);
  +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:](PAMediaConversionServiceResourceURLCollection, "collectionWithMainResourceURL:", v50);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  objc_msgSend(v24, "bookmarkDataDictionaryRepresentationWithError:", &v62);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v62;
  if (v25)
  {
    if (v48)
    {
      +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:](PAMediaConversionServiceResourceURLCollection, "collectionWithMainResourceURL:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      v28 = objc_msgSend(v27, "ensureFilesExistWithError:", &v61);
      v29 = v61;
      if ((v28 & 1) != 0)
      {
        v60 = v26;
        objc_msgSend(v27, "bookmarkDataDictionaryRepresentationWithError:", &v60);
        v44 = objc_claimAutoreleasedReturnValue();
        v30 = v60;

        v26 = v30;
        if (v44)
        {

LABEL_22:
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v68 = 0;
          -[PAVideoConversionServiceClient isolationQueue](self, "isolationQueue");
          v31 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_96;
          block[3] = &unk_1E9953208;
          block[4] = self;
          v32 = v15;
          v58 = v32;
          v59 = buf;
          dispatch_sync(v31, block);

          if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v49);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceJobIdentifierKey"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34;
            if (!v34)
            {
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v17 = (_BYTE *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "UUIDString");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("PAMediaConversionServiceJobIdentifierKey"));
            if (!v34)
            {

            }
            objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v36, CFSTR("PAMediaConversionServiceOptionOutputFileTypeKey"));

            -[PAVideoConversionServiceClient serviceConnection](self, "serviceConnection");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v54[0] = MEMORY[0x1E0C809B0];
            v54[1] = 3221225472;
            v54[2] = __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_97;
            v54[3] = &unk_1E9953168;
            v54[4] = self;
            v38 = v32;
            v55 = v38;
            v39 = v23;
            v56 = v39;
            objc_msgSend(v37, "remoteObjectProxyWithErrorHandler:", v54);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v51[0] = MEMORY[0x1E0C809B0];
            v51[1] = 3221225472;
            v51[2] = __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_98;
            v51[3] = &unk_1E9953AE8;
            v51[4] = self;
            v52 = v38;
            v53 = v39;
            objc_msgSend(v40, "extractStillImageFromVideoAtSourceBookmarkDictionary:toDestinationBookmarkDictionary:options:replyHandler:", v25, v44, v33, v51);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAMediaConversionServiceErrorDomain"), 10, 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, uint64_t, _QWORD, void *))v23)[2](v23, 2, 0, v33);
          }

          _Block_object_dispose(buf, 8);
          v27 = (void *)v44;
          goto LABEL_35;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v30;
          _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video still extraction request %{public}@ unable to generate destination bookmark data: %{public}@", buf, 0x16u);
        }
        ((void (**)(_QWORD, uint64_t, _QWORD, id))v23)[2](v23, 2, 0, v30);
      }
      else
      {
        ((void (**)(_QWORD, uint64_t, _QWORD, id))v23)[2](v23, 2, 0, v29);
      }

LABEL_35:
      goto LABEL_36;
    }
    v44 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v26;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video still extraction request %{public}@ unable to generate source bookmark data: %{public}@", buf, 0x16u);
  }
  ((void (**)(_QWORD, uint64_t, _QWORD, id))v23)[2](v23, 2, 0, v26);
LABEL_36:

  os_activity_scope_leave(&state);
}

- (void)handleRequestCompletionForIdentifier:(id)a3
{
  NSObject *v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PAVideoConversionServiceClient isolationQueue](self, "isolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[PAVideoConversionServiceClient state](self, "state");
  if (v6 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAVideoConversionServiceClient.m"), 339, CFSTR("Unexpected client state %tu"), v6);

    -[NSMutableDictionary removeObjectForKey:](self->_pendingRequestIdentifierToProgressMap, "removeObjectForKey:", v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_pendingRequestIdentifierToProgressMap, "removeObjectForKey:", v8);
    if (v6 == 2 && !-[NSMutableDictionary count](self->_pendingRequestIdentifierToProgressMap, "count"))
      -[PAVideoConversionServiceClient transitionToInvalidatedState](self, "transitionToInvalidatedState");
  }

}

- (void)transitionToInvalidatedState
{
  NSObject *v3;
  id v4;

  -[PAVideoConversionServiceClient isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PAVideoConversionServiceClient setState:](self, "setState:", 3);
  -[PAVideoConversionServiceClient serviceConnection](self, "serviceConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)updateProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceJobIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceProgressKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v5)
  {
    objc_msgSend(v6, "doubleValue");
    v8 = v7;
    -[PAVideoConversionServiceClient isolationQueue](self, "isolationQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PAVideoConversionServiceClient_updateProgress___block_invoke;
    block[3] = &unk_1E9953890;
    block[4] = self;
    v11 = v5;
    v12 = v8;
    dispatch_async(v9, block);

  }
}

- (void)invalidateAfterPendingRequestCompletion
{
  NSObject *v3;
  _QWORD block[5];

  -[PAVideoConversionServiceClient isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PAVideoConversionServiceClient_invalidateAfterPendingRequestCompletion__block_invoke;
  block[3] = &unk_1E9953C20;
  block[4] = self;
  dispatch_async(v3, block);

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
  PAVideoConversionServiceClient *v12;
  id v13;

  v4 = a3;
  -[PAVideoConversionServiceClient serviceConnection](self, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __69__PAVideoConversionServiceClient_requestStatusWithCompletionHandler___block_invoke;
  v11 = &unk_1E99535A8;
  v12 = self;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestStatusWithReply:", v6, v8, v9, v10, v11, v12);

}

- (void)setServiceConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)pendingRequestIdentifierToProgressMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPendingRequestIdentifierToProgressMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)isolationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIsolationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequestIdentifierToProgressMap, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __69__PAVideoConversionServiceClient_requestStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video conversion status request error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __73__PAVideoConversionServiceClient_invalidateAfterPendingRequestCompletion__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingRequestIdentifierToProgressMap");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v4 = *(void **)(a1 + 32);
      v7 = 138543618;
      v8 = v4;
      v9 = 2048;
      v10 = v3;
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Invalidating client %{public}@ with pending request count %tu", (uint8_t *)&v7, 0x16u);
    }
    v5 = *(void **)(a1 + 32);
    if (v3)
      objc_msgSend(v5, "setState:", 2);
    else
      objc_msgSend(v5, "transitionToInvalidatedState");
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2048;
    v10 = objc_msgSend(v6, "state");
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Ignoring invalidation request for client %{public}@ in non-running state %tu", (uint8_t *)&v7, 0x16u);
  }
}

void __49__PAVideoConversionServiceClient_updateProgress___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pendingRequestIdentifierToProgressMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "willChangeValueForKey:", CFSTR("fractionCompleted"));
    objc_msgSend(v3, "setCompletedUnitCount:", (uint64_t)(*(double *)(a1 + 48) * 100.0));
    objc_msgSend(v3, "didChangeValueForKey:", CFSTR("fractionCompleted"));
  }

}

void __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
    _os_signpost_emit_with_name_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_SIGNPOST_EVENT, v9, "com.apple.photos.mediaconversion.client.video-still.pre-completion", (const char *)&unk_1D5204966, buf, 2u);
  }
  v10 = (void *)MEMORY[0x1E0C81028];

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 40);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v12, "com.apple.photos.mediaconversion.client.video-still", (const char *)&unk_1D5204966, v13, 2u);
  }

}

void __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_96(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pendingRequestIdentifierToProgressMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "pendingRequestIdentifierToProgressMap");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v4;
      v11 = 2048;
      v12 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ added to request map (pending request count now %ld)", (uint8_t *)&v9, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = a1 + 32;
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(v8 + 8);
    v9 = 138543874;
    v10 = v7;
    v11 = 2114;
    v12 = (uint64_t)v6;
    v13 = 2048;
    v14 = objc_msgSend(v6, "state");
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Rejecting video conversion request %{public}@ on client %{public}@ in non-running state %tu", (uint8_t *)&v9, 0x20u);
  }
}

void __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "isolationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_2;
  v8[3] = &unk_1E9953840;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  dispatch_async(v4, v8);

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v3;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video still extraction request %{public}@ XPC error: %{public}@", buf, 0x16u);
  }
  (*(void (**)(_QWORD, uint64_t, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 2, 0, v3, v6);

}

void __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_98(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)a1[4];
  v9 = a3;
  objc_msgSend(v8, "isolationQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_2_99;
  v17[3] = &unk_1E9953840;
  v11 = (void *)a1[5];
  v17[4] = a1[4];
  v18 = v11;
  dispatch_async(v10, v17);

  if (a2 == 1)
  {
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
    v14 = v9;
    if (v12)
    {
      v15 = a1[5];
      *(_DWORD *)buf = 138543362;
      v20 = v15;
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Video still extraction request %{public}@ successful completion", buf, 0xCu);
      v14 = v9;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = a1[5];
      *(_DWORD *)buf = 138543874;
      v20 = v16;
      v21 = 2048;
      v22 = a2;
      v23 = 2114;
      v24 = v7;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video still extraction request %{public}@ unsuccessful completion, status = %ld, error = %{public}@", buf, 0x20u);
    }
    v14 = 0;
  }
  (*(void (**)(_QWORD, uint64_t, id, id, uint64_t))(a1[6] + 16))(a1[6], a2, v14, v7, v13);

}

uint64_t __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_2_99(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleRequestCompletionForIdentifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __115__PAVideoConversionServiceClient_extractStillImageFromVideoAtSourceURL_toDestinationURL_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleRequestCompletionForIdentifier:", *(_QWORD *)(a1 + 40));
}

void __76__PAVideoConversionServiceClient_modifyRequestWithIdentifier_modifications___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 138543618;
    v5 = v2;
    v6 = 2114;
    v7 = v3;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "XPC error during modification of request %{public}@ on client %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

void __74__PAVideoConversionServiceClient_markPendingRequestAsOptionalForProgress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingRequestIdentifierToProgressMap");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 48));

    if ((v4 & 1) != 0)
    {
      v11 = CFSTR("PAMediaConversionServiceOptionJobPriorityKey");
      v12 = &unk_1E995B788;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "modifyRequestWithIdentifier:modifications:", *(_QWORD *)(a1 + 40), v5);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Ignoring modification for request %{public}@ on client %{public}@ that is not or no longer in pending request map", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = a1 + 32;
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(v8 + 8);
    *(_DWORD *)buf = 138543874;
    v14 = v7;
    v15 = 2114;
    v16 = v6;
    v17 = 2048;
    v18 = objc_msgSend(v6, "state");
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Rejecting modification for request %{public}@ on client %{public}@ in non-running state %tu", buf, 0x20u);
  }
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
    _os_signpost_emit_with_name_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_SIGNPOST_EVENT, v9, "com.apple.photos.mediaconversion.client.video.pre-completion", (const char *)&unk_1D5204966, buf, 2u);
  }
  v10 = (void *)MEMORY[0x1E0C81028];

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 40);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, v12, "com.apple.photos.mediaconversion.client.video", (const char *)&unk_1D5204966, v13, 2u);
  }

}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_81(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = a1[4];
    *(_DWORD *)buf = 138543362;
    v12 = v2;
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Video conversion request %{public}@ requesting cancellation", buf, 0xCu);
  }
  objc_msgSend(a1[5], "serviceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_82;
  v8 = &unk_1E99535A8;
  v9 = a1[4];
  v10 = a1[6];
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelJobWithIdentifier:", a1[4], v5, v6, v7, v8);

}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_85(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "pendingRequestIdentifierToProgressMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "pendingRequestIdentifierToProgressMap");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v4;
      v11 = 2048;
      v12 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ added to request map (pending request count now %ld)", (uint8_t *)&v9, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = a1 + 32;
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(v8 + 8);
    v9 = 138543874;
    v10 = v7;
    v11 = 2114;
    v12 = (uint64_t)v6;
    v13 = 2048;
    v14 = objc_msgSend(v6, "state");
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Rejecting video conversion request %{public}@ on client %{public}@ in non-running state %tu", (uint8_t *)&v9, 0x20u);
  }
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  int8x16_t v7;
  _QWORD block[4];
  int8x16_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v3;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video conversion request %{public}@ XPC error: %{public}@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "isolationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_88;
  block[3] = &unk_1E9953840;
  v7 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v7.i64[0];
  v9 = vextq_s8(v7, v7, 8uLL);
  dispatch_async(v4, block);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_90(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "isolationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_2;
  v20 = &unk_1E99538E0;
  v10 = *(void **)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 32);
  v22 = v10;
  v24 = a2;
  v11 = v8;
  v23 = v11;
  dispatch_async(v9, &v17);

  if (v7)
  {
    v12 = (void *)objc_msgSend(v7, "mutableCopy", v17, v18, v19, v20, v21, v22);
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v13, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("PAMediaConversionServiceConversionTotalDurationTimeIntervalClientSideKey"));

  }
  else
  {
    v12 = 0;
  }
  if (a2 == 1)
    v16 = v12;
  else
    v16 = 0;
  (*(void (**)(_QWORD, uint64_t, void *, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), a2, v16, v11);

}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "handleRequestCompletionForIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "pendingRequestIdentifierToProgressMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = *(_QWORD *)(a1 + 56);
  if (v4 == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v5;
      v10 = 2048;
      v11 = v3;
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ removed from request map after successful completion (pending request count now %tu)", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 138544130;
    v9 = v6;
    v10 = 2048;
    v11 = v3;
    v12 = 2048;
    v13 = v4;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video conversion request %{public}@ removed from request map after unsuccessful completion (pending request count now %tu) - status = %zd, error = %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_88(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "handleRequestCompletionForIdentifier:", *(_QWORD *)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "pendingRequestIdentifierToProgressMap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543618;
    v5 = v2;
    v6 = 2048;
    v7 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Video conversion request %{public}@ removed from request map after error (pending request count now %tu)", (uint8_t *)&v4, 0x16u);

  }
}

void __121__PAVideoConversionServiceClient_convertVideoAtSourceURLCollection_toDestinationURLCollection_options_completionHandler___block_invoke_82(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543618;
    v6 = v4;
    v7 = 2114;
    v8 = v3;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video conversion request %{public}@ Unable to send cancellation request: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)ut_invalidateServiceConnection
{
  id v2;

  -[PAVideoConversionServiceClient serviceConnection](self, "serviceConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

@end
