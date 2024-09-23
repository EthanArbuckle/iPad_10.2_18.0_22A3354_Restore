@implementation MSSubscribeMMCSProtocol

- (MSSubscribeMMCSProtocol)initWithPersonID:(id)a3
{
  id v4;
  void *v5;
  MSSubscribeMMCSProtocol *v6;
  objc_super v8;

  v4 = a3;
  MSPathSubscribeMMCSLibraryForPersonID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)MSSubscribeMMCSProtocol;
  v6 = -[MSMMCSProtocol initWithPersonID:path:](&v8, sel_initWithPersonID_path_, v4, v5);

  return v6;
}

- (void)deactivate
{
  NSMutableDictionary *itemIDToAssetDict;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSSubscribeMMCSProtocol;
  -[MSMMCSProtocol deactivate](&v4, sel_deactivate);
  itemIDToAssetDict = self->_itemIDToAssetDict;
  self->_itemIDToAssetDict = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[MSSubscribeMMCSProtocol deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)MSSubscribeMMCSProtocol;
  -[MSMMCSProtocol dealloc](&v3, sel_dealloc);
}

- (void)_tellDelegateProtocolDidFinishRetrievingAssetParams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("asset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[MSMMCSProtocol personID](self, "personID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "MSVerboseDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Failed to get asset with hash %{public}@\nError: %{public}@", (uint8_t *)&v12, 0x2Au);

  }
  -[MSSubscribeStorageProtocolDelegate subscribeStorageProtocol:didFinishRetrievingAsset:error:](self->_delegate, "subscribeStorageProtocol:didFinishRetrievingAsset:error:", self, v5, v6);

}

- (void)retrieveAssets:(id)a3
{
  unint64_t v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *itemIDToAssetDict;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  const char *v27;
  size_t v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  __CFString *v36;
  NSMutableDictionary *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t i;
  void *v43;
  id v44;
  NSMutableDictionary *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  char **authTokens;
  _BYTE *v53;
  void *v54;
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD block[5];
  id v64;
  id v65;
  _BYTE v66[128];
  _BYTE buf[12];
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v4 = objc_msgSend(v55, "count");
  self->_itemCount = v4;
  if (!v4)
    goto LABEL_38;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v49 = (void *)objc_opt_class();
    v50 = v49;
    -[MSMMCSProtocol personID](self, "personID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v49;
    v68 = 2112;
    v69 = v51;
    v70 = 2114;
    v71 = v55;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Begin retrieving assets %{public}@", buf, 0x20u);

  }
  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_itemCount);
  itemIDToAssetDict = self->_itemIDToAssetDict;
  self->_itemIDToAssetDict = v5;

  self->_itemIDs = (unint64_t *)malloc_type_calloc(self->_itemCount, 8uLL, 0x100004000313F17uLL);
  self->_signatures = (const char **)malloc_type_calloc(self->_itemCount, 8uLL, 0x10040436913F5uLL);
  self->_authTokens = (char **)malloc_type_calloc(self->_itemCount, 8uLL, 0xC0040B8AA526DuLL);
  MSPlatform();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    MSPlatform();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMMCSProtocol personID](self, "personID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentURLForPersonID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v12 = (void *)objc_opt_class();
        v13 = v12;
        -[MSMMCSProtocol personID](self, "personID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v12;
        v68 = 2112;
        v69 = v14;
        v70 = 2114;
        v71 = v11;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Using contentURL %{public}@ from MSPlatform for download", buf, 0x20u);

      }
      goto LABEL_11;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get contentURL from MSPlatform. Using URL from asset metadata for download", buf, 2u);
    }
  }
  objc_msgSend(v55, "objectAtIndex:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "MMCSURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_itemCount)
    goto LABEL_41;
LABEL_11:
  v54 = v11;
  v16 = 0;
  v17 = 0;
  v18 = MEMORY[0x1E0C80D38];
  do
  {
    objc_msgSend(v55, "objectAtIndex:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fileHash");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const char *)objc_msgSend(v20, "bytes");

    objc_msgSend(v19, "fileHash");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (v23 && v23 == MEMORY[0x1D825595C](v21) && MEMORY[0x1D825598C](v21))
    {
      self->_signatures[v16] = v21;
      objc_msgSend(v19, "MMCSAccessHeader");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24 && objc_msgSend(v24, "length"))
      {
        objc_msgSend(v19, "MMCSAccessHeader");
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v27 = (const char *)objc_msgSend(v26, "cStringUsingEncoding:", 4);

        v28 = strlen(v27);
        self->_authTokens[v16] = (char *)malloc_type_malloc(v28 + 1, 0x2B8B17DBuLL);
        strcpy(self->_authTokens[v16], v27);
      }
      +[MSMMCSProtocol computeItemIDForAsset:](MSMMCSProtocol, "computeItemIDForAsset:", v19);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      self->_itemIDs[v16] = objc_msgSend(v29, "unsignedLongLongValue");
      -[NSMutableDictionary setObject:forKey:](self->_itemIDToAssetDict, "setObject:forKey:", v19, v29);
      ++v16;

    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v31 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_SUBSCRIBER_ASSET_BAD_SIGNATURE"));
      objc_msgSend(v30, "MSErrorWithDomain:code:description:", CFSTR("MSSubscriberErrorDomain"), 2, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__MSSubscribeMMCSProtocol_retrieveAssets___block_invoke;
      block[3] = &unk_1E95BCE30;
      block[4] = self;
      v64 = v19;
      v65 = v32;
      v25 = v32;
      dispatch_async(v18, block);

    }
    ++v17;
  }
  while (v17 < self->_itemCount);
  v11 = v54;
  if (v16)
  {
    *(_QWORD *)buf = 0;
    -[MSMMCSProtocol engine](self, "engine");
    -[MSMMCSProtocol personID](self, "personID");
    MSPMMCSConnectionProperties();
    authTokens = self->_authTokens;
    v53 = buf;
    v33 = MMCSGetItems();
    v34 = *(void **)buf;
    if (!v33)
    {
      if (!*(_QWORD *)buf)
      {
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v36 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_SUBSCRIBER_CANNOT_RETRIEVE"));
        objc_msgSend(v35, "MSErrorWithDomain:code:description:", CFSTR("MSSubscriberErrorDomain"), 5, v36, authTokens, buf);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v37 = self->_itemIDToAssetDict;
      v38 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v60;
        v41 = MEMORY[0x1E0C80D38];
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v60 != v40)
              objc_enumerationMutation(v37);
            -[NSMutableDictionary objectForKey:](self->_itemIDToAssetDict, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i), authTokens, v53);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v56[0] = MEMORY[0x1E0C809B0];
            v56[1] = 3221225472;
            v56[2] = __42__MSSubscribeMMCSProtocol_retrieveAssets___block_invoke_17;
            v56[3] = &unk_1E95BCE30;
            v56[4] = self;
            v57 = v43;
            v58 = v34;
            v44 = v43;
            dispatch_async(v41, v56);

          }
          v39 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
        }
        while (v39);
      }

      v45 = self->_itemIDToAssetDict;
      self->_itemIDToAssetDict = 0;

      free(self->_itemIDs);
      self->_itemIDs = 0;
      free(self->_signatures);
      self->_signatures = 0;
      free(self->_authTokens);
      self->_authTokens = 0;
      v11 = v54;
    }

  }
  else
  {
LABEL_41:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v46 = (void *)objc_opt_class();
      v47 = v46;
      -[MSMMCSProtocol personID](self, "personID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v46;
      v68 = 2112;
      v69 = v48;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Nothing to retrieve.", buf, 0x16u);

    }
  }

LABEL_38:
}

- (void)_getItemDone:(unint64_t)a3 path:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  MSSubscribeStorageProtocolDelegate *delegate;
  void *v29;
  __CFString *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_itemIDToAssetDict, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v16 = (void *)objc_opt_class();
      v17 = v16;
      -[MSMMCSProtocol personID](self, "personID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "MSVerboseDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138544386;
      v33 = v16;
      v34 = 2112;
      v35 = v18;
      v36 = 2114;
      v37 = (unint64_t)v11;
      v38 = 2112;
      v39 = v8;
      v40 = 2114;
      v41 = v19;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Retrieved file for asset %{public}@ at path %@, error %{public}@", (uint8_t *)&v32, 0x34u);

    }
    objc_msgSend(v11, "setPath:", v8);
    objc_msgSend(v11, "setError:", v9);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v20 = (void *)objc_opt_class();
      v21 = v20;
      -[MSMMCSProtocol personID](self, "personID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "MSVerboseDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138544130;
      v33 = v20;
      v34 = 2112;
      v35 = v22;
      v36 = 2114;
      v37 = (unint64_t)v11;
      v38 = 2114;
      v39 = v23;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Retreived asset %{public}@ with error %{public}@", (uint8_t *)&v32, 0x2Au);

      if (v8)
        goto LABEL_6;
    }
    else if (v8)
    {
LABEL_6:
      -[MSSubscribeStorageProtocolDelegate subscribeStorageProtocol:didFinishRetrievingAsset:error:](self->_delegate, "subscribeStorageProtocol:didFinishRetrievingAsset:error:", self, v11, 0);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeItemAtPath:error:", v8, 0);

LABEL_17:
      -[NSMutableDictionary removeObjectForKey:](self->_itemIDToAssetDict, "removeObjectForKey:", v10);
      goto LABEL_18;
    }
    if (!v9)
    {
      delegate = self->_delegate;
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_SUBSCRIBER_CANNOT_GET_ASSET"));
      objc_msgSend(v29, "MSErrorWithDomain:code:description:", CFSTR("MSSubscriberErrorDomain"), 0, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSSubscribeStorageProtocolDelegate subscribeStorageProtocol:didFinishRetrievingAsset:error:](delegate, "subscribeStorageProtocol:didFinishRetrievingAsset:error:", self, v11, v31);

      v9 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v9, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0D46750]))
    {
      v25 = objc_msgSend(v9, "code");

      if (v25 != 14)
      {
LABEL_15:
        -[MSSubscribeStorageProtocolDelegate subscribeStorageProtocol:didFinishRetrievingAsset:error:](self->_delegate, "subscribeStorageProtocol:didFinishRetrievingAsset:error:", self, v11, v9);
        goto LABEL_17;
      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v24 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_SUBSCRIBER_BAD_TOKEN"));
      objc_msgSend(v26, "MSErrorWithDomain:code:description:", CFSTR("MSSubscribeStorageProtocolErrorDomain"), 0, v24);
      v27 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v27;
    }

    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_opt_class();
    v14 = v13;
    -[MSMMCSProtocol personID](self, "personID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543874;
    v33 = v13;
    v34 = 2112;
    v35 = v15;
    v36 = 2048;
    v37 = a3;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Cannot find asset for item ID %lld", (uint8_t *)&v32, 0x20u);

  }
LABEL_18:

}

- (void)_requestCompleted
{
  unint64_t itemCount;
  unint64_t i;
  char *v5;
  NSMutableDictionary *itemIDToAssetDict;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[MSMMCSProtocol personID](self, "personID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Finished retrieving assets.", (uint8_t *)&v10, 0x16u);

  }
  itemCount = self->_itemCount;
  if (itemCount)
  {
    for (i = 0; i < itemCount; ++i)
    {
      v5 = self->_authTokens[i];
      if (v5)
      {
        free(v5);
        itemCount = self->_itemCount;
      }
    }
  }
  itemIDToAssetDict = self->_itemIDToAssetDict;
  self->_itemIDToAssetDict = 0;

  free(self->_itemIDs);
  self->_itemIDs = 0;
  free(self->_signatures);
  self->_signatures = 0;
  free(self->_authTokens);
  self->_authTokens = 0;
  self->_itemCount = 0;
  -[MSSubscribeStorageProtocolDelegate subscribeStorageProtocolDidFinishRetrievingAllAssets:](self->_delegate, "subscribeStorageProtocolDidFinishRetrievingAllAssets:", self);
}

- (MSSubscribeStorageProtocolDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSSubscribeStorageProtocolDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIDToAssetDict, 0);
}

void __42__MSSubscribeMMCSProtocol_retrieveAssets___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v1 = a1[5];
  v5[0] = CFSTR("asset");
  v5[1] = CFSTR("error");
  v3 = a1[6];
  v6[0] = v1;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_tellDelegateProtocolDidFinishRetrievingAssetParams:", v4);

}

void __42__MSSubscribeMMCSProtocol_retrieveAssets___block_invoke_17(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v1 = a1[5];
  v5[0] = CFSTR("asset");
  v5[1] = CFSTR("error");
  v3 = a1[6];
  v6[0] = v1;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_tellDelegateProtocolDidFinishRetrievingAssetParams:", v4);

}

@end
