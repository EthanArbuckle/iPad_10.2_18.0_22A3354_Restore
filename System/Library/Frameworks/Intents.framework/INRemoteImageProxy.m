@implementation INRemoteImageProxy

- (id)_URLRepresentation
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v3, "setScheme:", CFSTR("intents-remote-image-proxy"));
  -[INRemoteImageProxy _proxyIdentifier](self, "_proxyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("proxyIdentifier"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  else
  {
    v5 = 0;
  }
  -[INRemoteImageProxy _storageServiceIdentifier](self, "_storageServiceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("storageServiceIdentifier"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  objc_msgSend(v3, "setQueryItems:", v5);
  objc_msgSend(v3, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)_storageServiceIdentifier
{
  return self->_storageServiceIdentifier;
}

- (NSString)_proxyIdentifier
{
  return self->_proxyIdentifier;
}

- (id)_identifier
{
  void *v2;
  void *v3;

  -[INRemoteImageProxy _URLRepresentation](self, "_URLRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyIdentifier, 0);
  objc_storeStrong((id *)&self->_storageServiceIdentifier, 0);
}

- (id)_initWithURLRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  INRemoteImageProxy *v21;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v6 = 0;
LABEL_20:
    v21 = 0;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_20;
  objc_msgSend(v5, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("intents-remote-image-proxy"));

  if (!v8)
    goto LABEL_20;
  v29.receiver = self;
  v29.super_class = (Class)INRemoteImageProxy;
  v9 = -[INImage _initWithIdentifier:](&v29, sel__initWithIdentifier_, 0);
  if (!v9)
    goto LABEL_18;
  v23 = v6;
  v24 = v4;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v6, "queryItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (!v11)
    goto LABEL_17;
  v12 = v11;
  v13 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("proxyIdentifier"));

      if (v17)
      {
        objc_msgSend(v15, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_setProxyIdentifier:", v18);
      }
      else
      {
        objc_msgSend(v15, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("storageServiceIdentifier"));

        if (!v20)
          continue;
        objc_msgSend(v15, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_setStorageServiceIdentifier:", v18);
      }

    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  }
  while (v12);
LABEL_17:

  v6 = v23;
  v4 = v24;
LABEL_18:
  self = (INRemoteImageProxy *)v9;
  v21 = self;
LABEL_21:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v11.receiver = self,
        v11.super_class = (Class)INRemoteImageProxy,
        -[INImage isEqual:](&v11, sel_isEqual_, v4)))
  {
    -[INRemoteImageProxy _proxyIdentifier](self, "_proxyIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_proxyIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[INRemoteImageProxy _storageServiceIdentifier](self, "_storageServiceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_storageServiceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)requestProxyByStoringImage:(id)a3 qualityOfService:(unsigned int)a4 scaled:(BOOL)a5 storeType:(unint64_t)a6 error:(id *)a7
{
  _BOOL4 v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  id *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  INRemoteImageProxy *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  unsigned int v44;
  _BOOL4 v45;
  id *v46;
  id obj;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  id v54;
  uint8_t v55[128];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v9 = a5;
  v62 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (v11)
  {
    v44 = a4;
    v45 = v9;
    v46 = a7;
    +[INImageServiceRegistry sharedInstance](INImageServiceRegistry, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageStorageServices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      objc_msgSend(v11, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v57 = "+[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:error:]";
      v58 = 2112;
      v59 = v13;
      v60 = 2112;
      v61 = v16;
      _os_log_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_INFO, "%s Evaluating storage services %@ for image %@", buf, 0x20u);

    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v13;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v50;
LABEL_6:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v50 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v20);
        v22 = objc_msgSend(v21, "canStoreImage:", v11);
        v23 = (void *)INSiriLogContextIntents;
        v24 = os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO);
        if (v22)
          break;
        if (v24)
        {
          v25 = v23;
          objc_msgSend(v11, "description");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v57 = "+[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:error:]";
          v58 = 2112;
          v59 = v26;
          _os_log_impl(&dword_18BEBC000, v25, OS_LOG_TYPE_INFO, "%s Storage service cannot store image %@", buf, 0x16u);

        }
        if (v18 == ++v20)
        {
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
          if (v18)
            goto LABEL_6;
          goto LABEL_14;
        }
      }
      if (v24)
      {
        v28 = v23;
        objc_msgSend(v11, "description");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v57 = "+[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:error:]";
        v58 = 2112;
        v59 = v21;
        v60 = 2112;
        v61 = v29;
        _os_log_impl(&dword_18BEBC000, v28, OS_LOG_TYPE_INFO, "%s Found preferred storage service %@ for image %@", buf, 0x20u);

      }
      v30 = v21;

      v27 = v46;
      if (v30)
      {
        v31 = (void *)INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          v32 = v31;
          objc_msgSend(v11, "description");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v57 = "+[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:error:]";
          v58 = 2112;
          v59 = v33;
          v60 = 2112;
          v61 = v30;
          _os_log_impl(&dword_18BEBC000, v32, OS_LOG_TYPE_INFO, "%s Attempting to store image %@ with storage service %@", buf, 0x20u);

        }
        v48 = 0;
        objc_msgSend(v30, "storeImage:scaled:qualityOfService:storeType:error:", v11, v45, v44, a6, &v48);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v48;
        v36 = v35;
        if (v35)
        {
          v37 = 0;
          if (v46)
            *v46 = objc_retainAutorelease(v35);
        }
        else
        {
          v39 = [INRemoteImageProxy alloc];
          objc_msgSend(v11, "_identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[INImage _initWithIdentifier:](v39, "_initWithIdentifier:", v40);

          objc_msgSend(v37, "_setProxyIdentifier:", v34);
          objc_msgSend(v30, "serviceIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "_setStorageServiceIdentifier:", v41);

          objc_msgSend(v37, "_setRenderingMode:", objc_msgSend(v11, "_renderingMode"));
          v42 = INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v57 = "+[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:error:]";
            v58 = 2112;
            v59 = v37;
            v60 = 2112;
            v61 = v11;
            _os_log_impl(&dword_18BEBC000, v42, OS_LOG_TYPE_INFO, "%s Created remote image proxy %@ for image %@", buf, 0x20u);
          }
        }

        goto LABEL_30;
      }
    }
    else
    {
LABEL_14:

      v27 = v46;
    }
    if (v27)
    {
      v38 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No storage service was able to store image %@"), v11);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v54 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6001, v36);
      v37 = 0;
      *v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

    }
    else
    {
      v37 = 0;
    }

  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)_copyWithSubclass:(Class)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)INRemoteImageProxy;
  v4 = -[INImage _copyWithSubclass:](&v11, sel__copyWithSubclass_, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[INRemoteImageProxy _proxyIdentifier](self, "_proxyIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setProxyIdentifier:", v6);

    -[INRemoteImageProxy _storageServiceIdentifier](self, "_storageServiceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setStorageServiceIdentifier:", v7);

  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v8 = v5;
  else
    v8 = v4;
  v9 = v8;

  return v9;
}

- (void)_setStorageServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)_setProxyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

+ (void)requestProxyByStoringImage:(id)a3 qualityOfService:(unsigned int)a4 scaled:(BOOL)a5 storeType:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  double v15;
  NSObject *v16;
  double v17;
  INWatchdogTimer *v18;
  uint64_t v19;
  id v20;
  id v21;
  INWatchdogTimer *v22;
  INWatchdogTimer *v23;
  dispatch_block_t v24;
  unint64_t v25;
  _QWORD block[4];
  id v27;
  INWatchdogTimer *v28;
  id v29;
  id v30;
  unint64_t v31;
  unsigned int v32;
  BOOL v33;
  _QWORD v34[4];
  id v35;
  id v36;
  double v37;

  v12 = a3;
  v13 = a7;
  v14 = v13;
  if (v12)
  {
    v15 = 0.5;
    INImageProxyInjectionQueue();
    v25 = a6;
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = 5.0;
    if (((1 << a4) & 0x220200) == 0)
      v17 = 0.5;
    if (a4 <= 0x15)
      v15 = v17;
    v18 = [INWatchdogTimer alloc];
    v19 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __94__INRemoteImageProxy_requestProxyByStoringImage_qualityOfService_scaled_storeType_completion___block_invoke;
    v34[3] = &unk_1E228DC58;
    v37 = v15;
    v20 = v12;
    v35 = v20;
    v21 = v14;
    v36 = v21;
    v22 = -[INWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:](v18, "initWithTimeoutInterval:onQueue:timeoutHandler:", v16, v34, v15);
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __94__INRemoteImageProxy_requestProxyByStoringImage_qualityOfService_scaled_storeType_completion___block_invoke_15;
    block[3] = &unk_1E228DC80;
    v30 = a1;
    v32 = a4;
    v33 = a5;
    v31 = v25;
    v27 = v20;
    v28 = v22;
    v29 = v21;
    v23 = v22;
    v24 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, (dispatch_qos_class_t)a4, 0, block);
    dispatch_async(v16, v24);

    -[INWatchdogTimer start](v23, "start");
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }

}

- (void)purgeStoredImageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSString *proxyIdentifier;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[INImageServiceRegistry sharedInstance](INImageServiceRegistry, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageStorageServiceForServiceIdentifier:", self->_storageServiceIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      -[INImage _description](self, "_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v15 = "-[INRemoteImageProxy purgeStoredImageWithCompletion:]";
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s Attempting to purge image from storage service %@ for proxy %@", buf, 0x20u);

    }
    proxyIdentifier = self->_proxyIdentifier;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__INRemoteImageProxy_purgeStoredImageWithCompletion___block_invoke;
    v11[3] = &unk_1E228ED28;
    v13 = v4;
    v11[4] = self;
    v12 = v6;
    objc_msgSend(v12, "purgeImageWithIdentifier:completion:", proxyIdentifier, v11);

  }
}

- (void)filePathFromService:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSString *proxyIdentifier;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!-[INRemoteImageProxy isValid](self, "isValid"))
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2938];
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[INImage _description](self, "_description");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Image proxy %@ is invalid"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    v15 = 6006;
LABEL_6:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), v15, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v18);

    goto LABEL_7;
  }
  if (!v6)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2938];
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[INImage _description](self, "_description");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("No storage service available for image proxy: %@"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v15 = 6001;
    goto LABEL_6;
  }
  proxyIdentifier = self->_proxyIdentifier;
  v19 = 0;
  objc_msgSend(v6, "filePathForImageWithIdentifier:error:", proxyIdentifier, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  ((void (**)(id, void *, void *))v7)[2](v7, v9, v10);
LABEL_7:

}

- (void)unproxyImageFromService:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSString *proxyIdentifier;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (-[INRemoteImageProxy isValid](self, "isValid"))
    {
      if (v6)
      {
        v8 = (void *)INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          v9 = v8;
          -[INImage _description](self, "_description");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v28 = "-[INRemoteImageProxy unproxyImageFromService:reply:]";
          v29 = 2112;
          v30 = v6;
          v31 = 2112;
          v32 = v10;
          _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s Attempting to retrieve image from storage service %@ for proxy %@", buf, 0x20u);

        }
        proxyIdentifier = self->_proxyIdentifier;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __52__INRemoteImageProxy_unproxyImageFromService_reply___block_invoke;
        v22[3] = &unk_1E228FD98;
        v24 = v7;
        v22[4] = self;
        v23 = v6;
        objc_msgSend(v23, "retrieveImageWithIdentifier:completion:", proxyIdentifier, v22);

        v12 = v24;
        goto LABEL_10;
      }
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2938];
      v20 = (void *)MEMORY[0x1E0CB3940];
      -[INImage _description](self, "_description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("No storage service available for image proxy: %@"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v19;
      v18 = 6001;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2938];
      v14 = (void *)MEMORY[0x1E0CB3940];
      -[INImage _description](self, "_description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Image proxy %@ is invalid"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v13;
      v18 = 6006;
    }
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), v18, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v21);

LABEL_10:
  }

}

- (BOOL)isValid
{
  return self->_proxyIdentifier && self->_storageServiceIdentifier != 0;
}

- (id)retrieveProxiedImageSynchronouslyUsingService:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "serviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRemoteImageProxy _storageServiceIdentifier](self, "_storageServiceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[INRemoteImageProxy _proxyIdentifier](self, "_proxyIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "retrieveImageSynchronouslyForIdentifier:error:", v10, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  else
  {

  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6004, 0);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_8:

  return v11;
}

- (void)_retrieveImageDataWithReply:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    +[INImageServiceRegistry sharedInstance](INImageServiceRegistry, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageStorageServiceForServiceIdentifier:", self->_storageServiceIdentifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__INRemoteImageProxy__retrieveImageDataWithReply___block_invoke;
    v7[3] = &unk_1E228FDE8;
    v8 = v4;
    -[INRemoteImageProxy unproxyImageFromService:reply:](self, "unproxyImageFromService:reply:", v6, v7);

  }
}

- (id)_dictionaryRepresentation
{
  NSString *proxyIdentifier;
  void *v4;
  NSString *storageServiceIdentifier;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("proxyIdentifier");
  proxyIdentifier = self->_proxyIdentifier;
  v4 = proxyIdentifier;
  if (!proxyIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("storageServiceIdentifier");
  v10[0] = v4;
  storageServiceIdentifier = self->_storageServiceIdentifier;
  v6 = storageServiceIdentifier;
  if (!storageServiceIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!storageServiceIdentifier)
  {

    if (proxyIdentifier)
      return v7;
LABEL_9:

    return v7;
  }
  if (!proxyIdentifier)
    goto LABEL_9;
  return v7;
}

- (INRemoteImageProxy)initWithCoder:(id)a3
{
  id v4;
  INRemoteImageProxy *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INRemoteImageProxy;
  v5 = -[INImage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_storageServiceIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INRemoteImageProxy _setStorageServiceIdentifier:](v5, "_setStorageServiceIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxyIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INRemoteImageProxy _setProxyIdentifier:](v5, "_setProxyIdentifier:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INRemoteImageProxy;
  v4 = a3;
  -[INImage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_storageServiceIdentifier, CFSTR("_storageServiceIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_proxyIdentifier, CFSTR("_proxyIdentifier"));

}

uint64_t __50__INRemoteImageProxy__retrieveImageDataWithReply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), 0);
  else
    return objc_msgSend(a2, "_retrieveImageDataWithReply:", v3);
}

void __52__INRemoteImageProxy_unproxyImageFromService_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_8:
    v7();
    goto LABEL_9;
  }
  if (!objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v6, "_imageSize");
    v17 = v16;
    v19 = v18;
    v20 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v21 = (void *)MEMORY[0x1E0CB37E8];
      v22 = v20;
      objc_msgSend(v21, "numberWithDouble:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v27 = "-[INRemoteImageProxy unproxyImageFromService:reply:]_block_invoke";
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v25;
      _os_log_impl(&dword_18BEBC000, v22, OS_LOG_TYPE_INFO, "%s Retrieved image %@ of size {%@, %@} from storage service %@", buf, 0x34u);

    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_8;
  }
  v8 = *(_QWORD *)(a1 + 48);
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v36 = *MEMORY[0x1E0CB2938];
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "_description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Image proxy %@ proxied itself: %@"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6005, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v15);

LABEL_9:
}

void __53__INRemoteImageProxy_purgeStoredImageWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(void);
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      v5 = *(void (**)(void))(v4 + 16);
LABEL_8:
      v5();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setProxyIdentifier:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_setStorageServiceIdentifier:", 0);
    v6 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = v6;
      objc_msgSend(v7, "_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[INRemoteImageProxy purgeStoredImageWithCompletion:]_block_invoke";
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s Purged stored image from storage service %@ for remote image proxy %@", (uint8_t *)&v12, 0x20u);

    }
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
    {
      v5 = *(void (**)(void))(v11 + 16);
      goto LABEL_8;
    }
  }

}

+ (id)proxyImageSynchronously:(id)a3 usingService:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  INRemoteImageProxy *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "storeImageSynchronously:error:", v7, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v9, "length"))
  {
    if (!a5 || !*a5)
    {
LABEL_12:
      v12 = [INRemoteImageProxy alloc];
      objc_msgSend(v7, "_identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[INImage _initWithIdentifier:](v12, "_initWithIdentifier:", v13);

      objc_msgSend(v11, "_setProxyIdentifier:", v9);
      objc_msgSend(v8, "serviceIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_setStorageServiceIdentifier:", v14);

      goto LABEL_13;
    }
  }
  else if (!a5 || !*a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6002, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    *a5 = v10;
    if (!v10)
      goto LABEL_12;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __94__INRemoteImageProxy_requestProxyByStoringImage_qualityOfService_scaled_storeType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Timing out after %@ seconds during proxy request for image %@"), v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "+[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:completion:]_block_invoke";
    v14 = 2112;
    v15 = v4;
    _os_log_error_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2D50];
  v11 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6007, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v9);

}

void __94__INRemoteImageProxy_requestProxyByStoringImage_qualityOfService_scaled_storeType_completion___block_invoke_15(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned int *)(a1 + 72);
  v4 = *(unsigned __int8 *)(a1 + 76);
  v5 = *(void **)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v10 = 0;
  objc_msgSend(v5, "requestProxyByStoringImage:qualityOfService:scaled:storeType:error:", v2, v3, v4, v6, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (objc_msgSend(*(id *)(a1 + 40), "cancelIfNotAlreadyCanceled"))
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v7, v8);
  }

}

- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  INImageFilePersistence *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(INImageFilePersistence);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104__INRemoteImageProxy_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke;
  v15[3] = &unk_1E228FD98;
  v17 = v9;
  v18 = v10;
  v16 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[INRemoteImageProxy unproxyImageFromService:reply:](self, "unproxyImageFromService:reply:", v11, v15);

}

- (void)_retrieveFilePathWithCompletion:(id)a3
{
  id v4;
  INImageFilePersistence *v5;

  v4 = a3;
  v5 = objc_alloc_init(INImageFilePersistence);
  -[INRemoteImageProxy filePathFromService:reply:](self, "filePathFromService:reply:", v5, v4);

}

uint64_t __104__INRemoteImageProxy_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(double, double))(a1[6] + 16))(0.0, 0.0);
  else
    return objc_msgSend(a2, "_loadImageDataAndSizeWithHelper:accessSpecifier:completion:", a1[4], a1[5], a1[6]);
}

@end
