@implementation INImageServiceConnection

- (unint64_t)servicePriority
{
  if (INThisProcessIsSiri_onceToken != -1)
    dispatch_once(&INThisProcessIsSiri_onceToken, &__block_literal_global_27);
  if (INThisProcessIsSiri_isSiri)
    return 25;
  if (INThisProcessIsCarousel_onceToken != -1)
    dispatch_once(&INThisProcessIsCarousel_onceToken, &__block_literal_global_29);
  if (INThisProcessIsCarousel_isCarousel)
    return 25;
  else
    return 75;
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_62898);
  return (id)sharedConnection_sImageServiceConnection;
}

void __45__INImageServiceConnection_serviceIdentifier__block_invoke()
{
  objc_class *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (objc_class *)objc_opt_class();
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@.%@"), v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)serviceIdentifier_sServiceIdentifier;
  serviceIdentifier_sServiceIdentifier = v4;

}

void __44__INImageServiceConnection_sharedConnection__block_invoke()
{
  INImageServiceConnection *v0;
  void *v1;

  v0 = objc_alloc_init(INImageServiceConnection);
  v1 = (void *)sharedConnection_sImageServiceConnection;
  sharedConnection_sImageServiceConnection = (uint64_t)v0;

}

- (NSString)serviceIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__INImageServiceConnection_serviceIdentifier__block_invoke;
  block[3] = &unk_1E2294DE0;
  block[4] = self;
  if (serviceIdentifier_onceToken != -1)
    dispatch_once(&serviceIdentifier_onceToken, block);
  return (NSString *)(id)serviceIdentifier_sServiceIdentifier;
}

- (id)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 error:(id *)a7
{
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  const char *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v32;
  void *v33;
  int *v34;
  char *v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v40;
  _QWORD v42[6];
  _QWORD v43[5];
  _QWORD v44[4];
  id v45;
  id v46;
  _BYTE *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t v55[4];
  const char *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  _BYTE buf[24];
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;

  LODWORD(v36) = a4;
  HIDWORD(v36) = a5;
  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[INImageServiceConnection storeImage:scaled:qualityOfService:storeType:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s Storing image %@ over XPC in intents_helper", buf, 0x16u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_11;
  -[INImageServiceConnection _localStorageCache](self, "_localStorageCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v62 = __Block_byref_object_copy__62826;
  v63 = __Block_byref_object_dispose__62827;
  v64 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__62826;
  v53 = __Block_byref_object_dispose__62827;
  v54 = 0;
  objc_msgSend(v10, "mapTableRepresentation");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __79__INImageServiceConnection_storeImage_scaled_qualityOfService_storeType_error___block_invoke;
  v44[3] = &unk_1E228ECD8;
  v47 = buf;
  v14 = v10;
  v45 = v14;
  v15 = v8;
  v46 = v15;
  v48 = &v49;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v44);

  v16 = (void *)v50[5];
  if (v16)
  {
    v17 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v55 = 136315650;
      v56 = "-[INImageServiceConnection storeImage:scaled:qualityOfService:storeType:error:]";
      v57 = 2112;
      v58 = v15;
      v59 = 2112;
      v60 = v16;
      _os_log_impl(&dword_18BEBC000, v17, OS_LOG_TYPE_INFO, "%s Found image %@ in the local cache with identifier %@, returning w/ optimistic success", v55, 0x20u);
      v18 = (void *)v50[5];
    }
    else
    {
      v18 = v16;
    }
    v11 = v18;
  }

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(buf, 8);

  if (!v16)
  {
LABEL_11:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "imageURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        if (objc_msgSend(v19, "isFileURL"))
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "path");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "fileExistsAtPath:", v22);

          if (v23)
          {
            objc_msgSend(v20, "path");
            v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v24, "fileSystemRepresentation");
            v25 = (const char *)sandbox_extension_issue_file();

            if (v25)
            {
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v25, strlen(v25) + 1);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "_setSandboxExtensionData:", v26);

            }
            else
            {
              v27 = (void *)INSiriLogContextIntents;
              if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
              {
                v32 = v27;
                objc_msgSend(v20, "path");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = __error();
                v35 = strerror(*v34);
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)&buf[4] = "-[INImageServiceConnection storeImage:scaled:qualityOfService:storeType:error:]";
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v33;
                *(_WORD *)&buf[22] = 2080;
                v62 = (uint64_t (*)(uint64_t, uint64_t))v35;
                _os_log_error_impl(&dword_18BEBC000, v32, OS_LOG_TYPE_ERROR, "%s Couldn't issue sandbox extension for '%@': %s", buf, 0x20u);

              }
            }
          }
        }
      }

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v62 = __Block_byref_object_copy__62826;
    v63 = __Block_byref_object_dispose__62827;
    v64 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__62826;
    v53 = __Block_byref_object_dispose__62827;
    v54 = 0;
    v28 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __79__INImageServiceConnection_storeImage_scaled_qualityOfService_storeType_error___block_invoke_69;
    v43[3] = &unk_1E228EB28;
    v43[4] = &v49;
    -[INImageServiceConnection synchronousServiceProxyWithErrorHandler:](self, "synchronousServiceProxyWithErrorHandler:", v43, v36, a6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v28;
    v42[1] = 3221225472;
    v42[2] = __79__INImageServiceConnection_storeImage_scaled_qualityOfService_storeType_error___block_invoke_2;
    v42[3] = &unk_1E228ED00;
    v42[4] = buf;
    v42[5] = &v49;
    objc_msgSend(v29, "storeImage:scaled:qualityOfService:storeType:completion:", v8, v37, v38, v40, v42);

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && !v50[5])
    {
      -[INImageServiceConnection _localStorageCache](self, "_localStorageCache");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v8, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

    }
    if (a7)
      *a7 = objc_retainAutorelease((id)v50[5]);
    v11 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(&v49, 8);

    _Block_object_dispose(buf, 8);
  }

  return v11;
}

- (id)synchronousServiceProxyWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *v5;
  pid_t v6;
  NSXPCConnection *connection;
  id v8;
  NSXPCConnection *v9;
  void *v10;
  _QWORD v12[4];
  NSXPCConnection *v13;
  id v14;
  pid_t v15;

  v4 = a3;
  v5 = self->_connection;
  v6 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  connection = self->_connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__INImageServiceConnection_synchronousServiceProxyWithErrorHandler___block_invoke;
  v12[3] = &unk_1E228EB78;
  v15 = v6;
  v13 = v5;
  v14 = v4;
  v8 = v4;
  v9 = v5;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)canStoreImage:(id)a3
{
  return a3 != 0;
}

- (id)_localStorageCache
{
  NSCache *localStorageCache;
  NSCache *v4;
  NSCache *v5;

  localStorageCache = self->_localStorageCache;
  if (!localStorageCache)
  {
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v5 = self->_localStorageCache;
    self->_localStorageCache = v4;

    localStorageCache = self->_localStorageCache;
  }
  return localStorageCache;
}

- (INImageServiceConnection)init
{
  INImageServiceConnection *v2;
  id v3;
  uint64_t v4;
  NSXPCConnection *connection;
  NSXPCConnection *v6;
  void *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  INImageServiceConnection *v11;
  _QWORD v13[4];
  int v14;
  _QWORD v15[4];
  int v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)INImageServiceConnection;
  v2 = -[INImageServiceConnection init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v4 = objc_msgSend(v3, "initWithServiceName:", INHelperServiceName);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    v6 = v2->_connection;
    INHelperServingXPCInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    LODWORD(v6) = -[NSXPCConnection processIdentifier](v2->_connection, "processIdentifier");
    v8 = MEMORY[0x1E0C809B0];
    v9 = v2->_connection;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __32__INImageServiceConnection_init__block_invoke;
    v15[3] = &__block_descriptor_36_e5_v8__0l;
    v16 = (int)v6;
    -[NSXPCConnection setInterruptionHandler:](v9, "setInterruptionHandler:", v15);
    v10 = v2->_connection;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __32__INImageServiceConnection_init__block_invoke_2;
    v13[3] = &__block_descriptor_36_e5_v8__0l;
    v14 = (int)v6;
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v13);
    -[NSXPCConnection resume](v2->_connection, "resume");
    v11 = v2;
  }

  return v2;
}

void __79__INImageServiceConnection_storeImage_scaled_qualityOfService_storeType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)INImageServiceConnection;
  -[INImageServiceConnection dealloc](&v3, sel_dealloc);
}

- (void)loadImageDataAndSizeForImage:(id)a3 reply:(id)a4
{
  -[INImageServiceConnection loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:](self, "loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:", a3, 0, a4, 0.0, 0.0);
}

- (id)loadDataImageFromImage:(id)a3 scaledSize:(id)a4 error:(id *)a5
{
  double var1;
  double var0;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  uint64_t v15;
  void *v16;
  INPortableImageLoader *v17;
  id v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  __int128 v30;
  uint64_t v31;

  var1 = a4.var1;
  var0 = a4.var0;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = v10;
    objc_msgSend(v11, "numberWithDouble:", var0);
    v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", var1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[INImageServiceConnection loadDataImageFromImage:scaledSize:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v29 = v13;
    LOWORD(v30) = 2112;
    *(_QWORD *)((char *)&v30 + 2) = v14;
    _os_log_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_INFO, "%s Loading image %@ over XPC in intents_helper (scaledWidth = %@, scaledHeight = %@)", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__62826;
  *(_QWORD *)&v30 = __Block_byref_object_dispose__62827;
  *((_QWORD *)&v30 + 1) = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__62826;
  v26 = __Block_byref_object_dispose__62827;
  v15 = MEMORY[0x1E0C809B0];
  v27 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__INImageServiceConnection_loadDataImageFromImage_scaledSize_error___block_invoke;
  v21[3] = &unk_1E228EB28;
  v21[4] = &v22;
  -[INImageServiceConnection synchronousServiceProxyWithErrorHandler:](self, "synchronousServiceProxyWithErrorHandler:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(INPortableImageLoader);
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __68__INImageServiceConnection_loadDataImageFromImage_scaledSize_error___block_invoke_2;
  v20[3] = &unk_1E228EB50;
  v20[4] = buf;
  v20[5] = &v22;
  objc_msgSend(v16, "loadDataImageForImage:scaledWidth:scaledHeight:usingPortableImageLoader:completion:", v9, v17, v20, var0, var1);

  if (a5)
    *a5 = objc_retainAutorelease((id)v23[5]);
  v18 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(buf, 8);
  return v18;
}

- (id)serviceProxyWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *v5;
  pid_t v6;
  void *v7;
  NSXPCConnection *connection;
  NSXPCConnection *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  NSXPCConnection *v19;
  id v20;
  pid_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_connection;
  v6 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  -[NSXPCConnection serviceName](v5, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__INImageServiceConnection_serviceProxyWithErrorHandler___block_invoke;
  v18[3] = &unk_1E228EB78;
  v9 = v5;
  v19 = v9;
  v21 = v6;
  v10 = v4;
  v20 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EE0B8590))
  {
    v12 = v11;
  }
  else
  {
    v12 = 0;
    if (v10 && v11)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get a valid service proxy for service %@"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6000, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v10 + 2))(v10, v16);

      v12 = 0;
    }
  }

  return v12;
}

- (BOOL)canLoadImageDataForImage:(id)a3
{
  return a3 != 0;
}

- (void)loadDataImageFromImage:(id)a3 usingPortableImageLoader:(id)a4 scaledSize:(id)a5 completion:(id)a6
{
  double var1;
  double var0;
  id v11;
  INPortableImageLoader *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  var1 = a5.var1;
  var0 = a5.var0;
  v11 = a3;
  v12 = (INPortableImageLoader *)a4;
  v13 = a6;
  if (v13)
  {
    if (!v12)
      v12 = objc_alloc_init(INPortableImageLoader);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __98__INImageServiceConnection_loadDataImageFromImage_usingPortableImageLoader_scaledSize_completion___block_invoke;
    v16[3] = &unk_1E228EBA0;
    v14 = v13;
    v17 = v14;
    -[INImageServiceConnection serviceProxyWithErrorHandler:](self, "serviceProxyWithErrorHandler:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "loadDataImageForImage:scaledWidth:scaledHeight:usingPortableImageLoader:completion:", v11, v12, v14, var0, var1);

  }
}

- (void)filePathForImage:(id)a3 usingPortableImageLoader:(id)a4 completion:(id)a5
{
  id v8;
  INPortableImageLoader *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = (INPortableImageLoader *)a4;
  v10 = a5;
  if (v10)
  {
    if (!v9)
      v9 = objc_alloc_init(INPortableImageLoader);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__INImageServiceConnection_filePathForImage_usingPortableImageLoader_completion___block_invoke;
    v13[3] = &unk_1E228EBA0;
    v11 = v10;
    v14 = v11;
    -[INImageServiceConnection serviceProxyWithErrorHandler:](self, "serviceProxyWithErrorHandler:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filePathForImage:usingPortableImageLoader:completion:", v8, v9, v11);

  }
}

- (id)_availableBundleIdentifiers
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x18D7810F0]();
        objc_msgSend(v8, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v10);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v5);
  }

  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58E0]), "initWithIdentifier:error:", CFSTR("com.apple.intents-service"), 0);
  objc_msgSend(MEMORY[0x1E0CA5848], "enumeratorWithExtensionPointRecord:options:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x18D7810F0]();
        objc_msgSend(v16, "containingBundleRecord");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v2, "containsObject:", v19);

        if ((v20 & 1) == 0)
        {
          objc_msgSend(v16, "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v21);

        }
        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v13);
  }

  objc_msgSend(_INVCIntentDefinitionManagerClass(), "allBundleIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v2, "addObjectsFromArray:", v22);

  return v2;
}

- (id)schemaURLsForBundleIdentifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v16 = v3;
    v17 = (id)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v3;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
          v9 = (void *)MEMORY[0x18D7810F0]();
          objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v8, 0, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "appProtectionHidden") & 1) == 0)
          {
            v11 = (void *)MEMORY[0x1E0C99E60];
            if (v10)
            {
              objc_msgSend(v10, "intentDefinitionURLs");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "allValues");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setWithArray:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(_INVCIntentDefinitionManagerClass(), "intentDefinitionURLsForBundleID:", v8);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setWithArray:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }

            if (objc_msgSend(v14, "count"))
              objc_msgSend(v17, "setObject:forKey:", v14, v8);

          }
          objc_autoreleasePoolPop(v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v5);
    }

    v3 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)imageServiceSchemaURLsForBundleIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__62826;
  v24 = __Block_byref_object_dispose__62827;
  v7 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke;
  v19[3] = &unk_1E228EB28;
  v19[4] = &v20;
  -[INImageServiceConnection synchronousServiceProxyWithErrorHandler:](self, "synchronousServiceProxyWithErrorHandler:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__62826;
  v17 = __Block_byref_object_dispose__62827;
  v18 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke_3;
    v11[3] = &unk_1E228EBC8;
    v11[4] = &v13;
    v11[5] = &v20;
    objc_msgSend(v8, "loadSchemaURLsForBundleIdentifiers:completion:", v6, v11);
  }
  else
  {
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke_2;
    v12[3] = &unk_1E228EBC8;
    v12[4] = &v13;
    v12[5] = &v20;
    objc_msgSend(v8, "loadSchemaURLsWithCompletion:", v12);
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  objc_msgSend((id)v14[5], "if_compactMap:", &__block_literal_global_55);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (id)availableSchemasWithError:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReadableFileAtPath:", CFSTR("/private/var/containers/Bundle/"));

  if (v6)
  {
    -[INImageServiceConnection _availableBundleIdentifiers](self, "_availableBundleIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INImageServiceConnection schemaURLsForBundleIdentifiers:](self, "schemaURLsForBundleIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v12 = 0;
  -[INImageServiceConnection imageServiceSchemaURLsForBundleIdentifiers:error:](self, "imageServiceSchemaURLsForBundleIdentifiers:error:", 0, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (a3)
LABEL_5:
    *a3 = objc_retainAutorelease(v9);
LABEL_6:
  _INSchemasByIdentifierWithSchemaURLsByIdentifier(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)loadSchemasForBundleIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isReadableFileAtPath:", CFSTR("/private/var/containers/Bundle/"));

    if (v8)
    {
      -[INImageServiceConnection schemaURLsForBundleIdentifiers:](self, "schemaURLsForBundleIdentifiers:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      if (!a4)
        goto LABEL_8;
    }
    else
    {
      v13 = 0;
      -[INImageServiceConnection imageServiceSchemaURLsForBundleIdentifiers:error:](self, "imageServiceSchemaURLsForBundleIdentifiers:error:", v6, &v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      if (!a4)
      {
LABEL_8:
        _INSchemasByIdentifierWithSchemaURLsByIdentifier(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
    *a4 = objc_retainAutorelease(v10);
    goto LABEL_8;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)accessBundleContentForBundleIdentifiers:(id)a3 withBlock:(id)a4 error:(id *)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v7, "count"))
  {
    +[INBundleAccessManager sharedManager](INBundleAccessManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "grantForBundleIdentifiers:error:", v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11 != 0;
    if (v11)
    {
      objc_msgSend(v11, "acquire");
      v8[2](v8);
      objc_msgSend(v11, "relinquish");
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)securityScopedURLsForBundleIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__62826;
    v24 = __Block_byref_object_dispose__62827;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__62826;
    v18 = __Block_byref_object_dispose__62827;
    v7 = MEMORY[0x1E0C809B0];
    v19 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__INImageServiceConnection_securityScopedURLsForBundleIdentifiers_error___block_invoke;
    v13[3] = &unk_1E228EB28;
    v13[4] = &v20;
    -[INImageServiceConnection synchronousServiceProxyWithErrorHandler:](self, "synchronousServiceProxyWithErrorHandler:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __73__INImageServiceConnection_securityScopedURLsForBundleIdentifiers_error___block_invoke_2;
    v12[3] = &unk_1E228EBC8;
    v12[4] = &v14;
    v12[5] = &v20;
    objc_msgSend(v8, "loadBundleURLsForBundleIdentifiers:completion:", v6, v12);

    v9 = (void *)v15[5];
    if (v9)
    {
      objc_msgSend(v9, "if_compactMap:", &__block_literal_global_62);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
      if (a4)
        *a4 = objc_retainAutorelease((id)v21[5]);
    }
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v10;
}

- (id)fetchShareExtensionIntentForExtensionContextUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__62826;
  v13 = __Block_byref_object_dispose__62827;
  v14 = 0;
  -[INImageServiceConnection synchronousServiceProxyWithErrorHandler:](self, "synchronousServiceProxyWithErrorHandler:", &__block_literal_global_63_62834);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__INImageServiceConnection_fetchShareExtensionIntentForExtensionContextUUID___block_invoke_64;
  v8[3] = &unk_1E228ECB0;
  v8[4] = &v9;
  objc_msgSend(v5, "fetchShareExtensionIntentForExtensionContextUUID:completion:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void (**v13)(id, void *, _QWORD);
  void *v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(id, void *, _QWORD);
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if (v7)
  {
    v8 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[INImageServiceConnection retrieveImageWithIdentifier:completion:]";
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s Retrieving image with identifier %@ over XPC in intents_helper", buf, 0x16u);
    }
    -[INImageServiceConnection _localStorageCache](self, "_localStorageCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "-[INImageServiceConnection retrieveImageWithIdentifier:completion:]";
        v22 = 2112;
        v23 = v10;
        v24 = 2112;
        v25 = v6;
        _os_log_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_INFO, "%s Found image %@ in the local cache with identifier %@, returning it", buf, 0x20u);
      }
      v7[2](v7, v10, 0);
    }
    else
    {
      v12 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __67__INImageServiceConnection_retrieveImageWithIdentifier_completion___block_invoke;
      v18[3] = &unk_1E228EBA0;
      v13 = v7;
      v19 = v13;
      -[INImageServiceConnection serviceProxyWithErrorHandler:](self, "serviceProxyWithErrorHandler:", v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __67__INImageServiceConnection_retrieveImageWithIdentifier_completion___block_invoke_2;
      v15[3] = &unk_1E228FD98;
      v15[4] = self;
      v16 = v6;
      v17 = v13;
      objc_msgSend(v14, "retrieveImageWithIdentifier:completion:", v16, v15);

    }
  }

}

- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  INImageServiceConnection *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[INImageServiceConnection purgeImageWithIdentifier:completion:]";
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s Purging image with identifier %@ over XPC in intents_helper", buf, 0x16u);
  }
  -[INImageServiceConnection serviceProxyWithErrorHandler:](self, "serviceProxyWithErrorHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__INImageServiceConnection_purgeImageWithIdentifier_completion___block_invoke;
  v12[3] = &unk_1E228ED28;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "purgeImageWithIdentifier:completion:", v11, v12);

}

- (void)storeUserContext:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "-[INImageServiceConnection storeUserContext:forBundleIdentifier:]";
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s Storing UserContext:%@ for bundle:%@ over XPC in intents_helper", (uint8_t *)&v11, 0x20u);
  }
  -[INImageServiceConnection serviceProxyWithErrorHandler:](self, "serviceProxyWithErrorHandler:", &__block_literal_global_71);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "storeUserContext:forBundleIdentifier:", v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localStorageCache, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __65__INImageServiceConnection_storeUserContext_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[INImageServiceConnection storeUserContext:forBundleIdentifier:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_18BEBC000, v3, OS_LOG_TYPE_ERROR, "%s Error storing UserContext - %@", (uint8_t *)&v4, 0x16u);
  }

}

void __64__INImageServiceConnection_purgeImageWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  if (!v3 && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_localStorageCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    v3 = 0;
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    v6 = v3;
    (*(void (**)(void))(v5 + 16))();
    v3 = v6;
  }

}

uint64_t __67__INImageServiceConnection_retrieveImageWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__INImageServiceConnection_retrieveImageWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8 && !v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_localStorageCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, *(_QWORD *)(a1 + 40));

  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

void __79__INImageServiceConnection_storeImage_scaled_qualityOfService_storeType_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  *a4 = v12;

}

void __79__INImageServiceConnection_storeImage_scaled_qualityOfService_storeType_error___block_invoke_69(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __77__INImageServiceConnection_fetchShareExtensionIntentForExtensionContextUUID___block_invoke_64(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __77__INImageServiceConnection_fetchShareExtensionIntentForExtensionContextUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[INImageServiceConnection fetchShareExtensionIntentForExtensionContextUUID:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_18BEBC000, v3, OS_LOG_TYPE_ERROR, "%s Error in XPC connection when fetching selected share extension suggestion intent, %@", (uint8_t *)&v4, 0x16u);
  }

}

void __73__INImageServiceConnection_securityScopedURLsForBundleIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __73__INImageServiceConnection_securityScopedURLsForBundleIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

id __73__INImageServiceConnection_securityScopedURLsForBundleIdentifiers_error___block_invoke_3(int a1, id a2, void *a3, _QWORD *a4, _QWORD *a5)
{
  id result;

  *a4 = objc_retainAutorelease(a2);
  objc_msgSend(a3, "url");
  result = (id)objc_claimAutoreleasedReturnValue();
  *a5 = result;
  return result;
}

void __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke_4(int a1, id a2, void *a3, _QWORD *a4, _QWORD *a5)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = objc_retainAutorelease(a2);
  *a4 = v8;
  v9 = (void *)MEMORY[0x1E0CF9688];
  v10 = a3;
  objc_msgSend(v9, "applicationWithBundleIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "isHidden");

  if ((_DWORD)v9)
    *a4 = 0;
  objc_msgSend(v10, "if_compactMap:", &__block_literal_global_58);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_retainAutorelease(v12);
  *a5 = v13;

}

uint64_t __77__INImageServiceConnection_imageServiceSchemaURLsForBundleIdentifiers_error___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "url");
}

uint64_t __81__INImageServiceConnection_filePathForImage_usingPortableImageLoader_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__INImageServiceConnection_loadDataImageFromImage_usingPortableImageLoader_scaledSize_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__INImageServiceConnection_serviceProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_DWORD *)(a1 + 48);
    v8 = 136315906;
    v9 = "-[INImageServiceConnection serviceProxyWithErrorHandler:]_block_invoke";
    v10 = 2112;
    v11 = v6;
    v12 = 1024;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_error_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_ERROR, "%s Error (from connection %@; pid: %d) when using image service: %@",
      (uint8_t *)&v8,
      0x26u);
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __68__INImageServiceConnection_synchronousServiceProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_DWORD *)(a1 + 48);
    v7 = 136315906;
    v8 = "-[INImageServiceConnection synchronousServiceProxyWithErrorHandler:]_block_invoke";
    v9 = 2112;
    v10 = v5;
    v11 = 1024;
    v12 = v6;
    v13 = 2112;
    v14 = v3;
    _os_log_error_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_ERROR, "%s Error (from connection %@; pid: %d) when using image service: %@",
      (uint8_t *)&v7,
      0x26u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __68__INImageServiceConnection_loadDataImageFromImage_scaledSize_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68__INImageServiceConnection_loadDataImageFromImage_scaledSize_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __32__INImageServiceConnection_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_DWORD *)(a1 + 32);
    v4 = 136315650;
    v5 = "-[INImageServiceConnection init]_block_invoke";
    v6 = 2112;
    v7 = INHelperServiceName;
    v8 = 1024;
    v9 = v3;
    _os_log_error_impl(&dword_18BEBC000, v2, OS_LOG_TYPE_ERROR, "%s INImageServiceConnection to %@ interrupted; pid: %d",
      (uint8_t *)&v4,
      0x1Cu);
  }
}

void __32__INImageServiceConnection_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 32);
    v4 = 136315650;
    v5 = "-[INImageServiceConnection init]_block_invoke";
    v6 = 2112;
    v7 = INHelperServiceName;
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_18BEBC000, v2, OS_LOG_TYPE_INFO, "%s INImageServiceConnection to %@ invalidated; pid: %d",
      (uint8_t *)&v4,
      0x1Cu);
  }
}

@end
