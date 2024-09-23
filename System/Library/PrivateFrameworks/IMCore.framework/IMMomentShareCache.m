@implementation IMMomentShareCache

- (IMMomentShareCache)init
{
  IMMomentShareCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *completionHandlers;
  NSMutableDictionary *v5;
  NSMutableDictionary *cache;
  dispatch_queue_t v7;
  OS_dispatch_queue *libraryRegistrationQueue;
  NSObject *v9;
  _QWORD block[4];
  IMMomentShareCache *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IMMomentShareCache;
  v2 = -[IMMomentShareCache init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cache = v2->_cache;
    v2->_cache = v5;

    v7 = dispatch_queue_create("com.apple.messages.MomentShareLibraryRegistration", 0);
    libraryRegistrationQueue = v2->_libraryRegistrationQueue;
    v2->_libraryRegistrationQueue = (OS_dispatch_queue *)v7;

    v9 = v2->_libraryRegistrationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A216771C;
    block[3] = &unk_1E471E348;
    v12 = v2;
    dispatch_async(v9, block);

  }
  return v2;
}

+ (IMMomentShareCache)sharedInstance
{
  if (qword_1EE65F378 != -1)
    dispatch_once(&qword_1EE65F378, &unk_1E471DC58);
  return (IMMomentShareCache *)(id)qword_1ECF12568;
}

- (void)momentShareForURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_completionHandlers, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1A2198DF4();

    v10 = _Block_copy(v7);
    objc_msgSend(v8, "addObject:", v10);
  }
  else
  {
    v22 = 0;
    -[IMMomentShareCache _momentShareForURLString:error:](self, "_momentShareForURLString:error:", v6, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;
    v10 = v12;
    if (v11)
    {
      (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v11, 0);
    }
    else if (IMMomentShareCacheErrorIsPermanent(v12))
    {
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);
    }
    else
    {
      if (!v8)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_completionHandlers, "setObject:forKeyedSubscript:", v8, v6);
      }
      v13 = _Block_copy(v7);
      objc_msgSend(v8, "addObject:", v13);

      IMLogHandleForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_1A2198D94();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMomentShareCache _ensureLibraryRegistration](self, "_ensureLibraryRegistration");
      objc_msgSend(sub_1A21677AC(), "sharedMomentSharePhotoLibrary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "librarySpecificFetchOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = sub_1A2167C6C();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_1A2167D24;
      v19[3] = &unk_1E4723C58;
      v19[4] = self;
      v20 = v6;
      v8 = v8;
      v21 = v8;
      objc_msgSend(v18, "fetchMomentShareFromShareURL:options:completionHandler:", v15, v17, v19);

    }
  }

}

- (id)momentShareForURLString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_completionHandlers, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    v12 = 0;
    -[IMMomentShareCache _momentShareForURLString:error:](self, "_momentShareForURLString:error:", v6, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1A2198E54();

  sub_1A2167F38(-1000, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (a4)
  {
LABEL_7:
    if (!v10)
      *a4 = objc_retainAutorelease(v9);
  }
LABEL_9:

  return v10;
}

- (void)_ensureLibraryRegistration
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!self->_hasRegisteredForLibraryChanges)
    dispatch_sync((dispatch_queue_t)self->_libraryRegistrationQueue, &unk_1E471C210);
}

- (id)_momentShareForURLString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  _QWORD v25[6];
  id v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  void *v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1A200AF24;
  v37 = sub_1A200AD04;
  v38 = 0;
  v27 = 0;
  v28 = (id *)&v27;
  v29 = 0x3032000000;
  v30 = sub_1A200AF24;
  v31 = sub_1A200AD04;
  v32 = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "first");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      IMLogHandleForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = v10;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v9, "uuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1A2198F14(v12, (uint64_t)v6, (uint64_t)buf, v11);
        }

      }
      v13 = v34;
      v9 = v9;
      v14 = (id)v13[5];
      v13[5] = (uint64_t)v9;
    }
    else
    {
      objc_msgSend(v8, "second");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        IMLogHandleForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v41 = v14;
          v42 = 2112;
          v43 = v6;
          _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_DEFAULT, "Returning cached permanent error: %@, for URL: %@", buf, 0x16u);
        }

        objc_storeStrong(v28 + 5, v14);
      }
    }
  }
  else
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_1A2198EB4();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[IMMomentShareCache _ensureLibraryRegistration](self, "_ensureLibraryRegistration");
    objc_msgSend(sub_1A21677AC(), "sharedMomentSharePhotoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "librarySpecificFetchOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0;
    objc_msgSend(sub_1A2167C6C(), "fetchLocalMomentShareFromShareURL:error:options:", v9, &v26, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v26;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1A216842C;
    v25[3] = &unk_1E4723C80;
    v25[4] = &v33;
    v25[5] = &v27;
    v19 = _Block_copy(v25);
    v39 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMomentShareCache _processFetchedMomentShare:forURLString:error:completionHandlers:](self, "_processFetchedMomentShare:forURLString:error:completionHandlers:", v18, v6, v14, v20);

  }
  v22 = (void *)v34[5];
  if (a4 && !v22)
  {
    *a4 = objc_retainAutorelease(v28[5]);
    v22 = (void *)v34[5];
  }
  v23 = v22;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v23;
}

- (void)_processFetchedMomentShare:(id)a3 forURLString:(id)a4 error:(id)a5 completionHandlers:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    sub_1A21686F0(v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v14, v11);

    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_1A2199058(v10, (uint64_t)v11, v15);

    v16 = v10;
    v17 = 0;
  }
  else
  {
    v18 = v12;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v19 = off_1EE65F990;
    v34 = off_1EE65F990;
    if (!off_1EE65F990)
    {
      v20 = (void *)sub_1A2168CE4();
      v19 = dlsym(v20, "PXIsMomentShareErrorPermanent");
      v32[3] = (uint64_t)v19;
      off_1EE65F990 = v19;
    }
    _Block_object_dispose(&v31, 8);
    if (!v19)
      sub_1A2198F70();
    v21 = ((uint64_t (*)(id))v19)(v18);

    if (v21)
      v22 = -1001;
    else
      v22 = -1000;
    sub_1A2167F38(v22, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v23;
    if (v21)
    {
      sub_1A2168730(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v24, v11);

    }
    IMLogHandleForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1A2198FE4();

  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1A2168770;
  v28[3] = &unk_1E4723CA8;
  v29 = v10;
  v30 = v17;
  v26 = v17;
  v27 = v10;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v28);

}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1A2168800;
  v6[3] = &unk_1E471E7C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryRegistrationQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end
