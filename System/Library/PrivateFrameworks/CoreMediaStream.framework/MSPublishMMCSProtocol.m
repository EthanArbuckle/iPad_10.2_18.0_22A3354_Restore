@implementation MSPublishMMCSProtocol

- (MSPublishMMCSProtocol)initWithPersonID:(id)a3
{
  id v4;
  void *v5;
  MSPublishMMCSProtocol *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *itemIDToAssetDict;
  objc_super v10;

  v4 = a3;
  MSPathPublishMMCSLibraryForPersonID(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)MSPublishMMCSProtocol;
  v6 = -[MSMMCSProtocol initWithPersonID:path:](&v10, sel_initWithPersonID_path_, v4, v5);

  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    itemIDToAssetDict = v6->_itemIDToAssetDict;
    v6->_itemIDToAssetDict = v7;

  }
  return v6;
}

- (void)deactivate
{
  NSMutableDictionary *itemIDToAssetDict;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSPublishMMCSProtocol;
  -[MSMMCSProtocol deactivate](&v4, sel_deactivate);
  itemIDToAssetDict = self->_itemIDToAssetDict;
  self->_itemIDToAssetDict = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[MSPublishMMCSProtocol deactivate](self, "deactivate");
  v3.receiver = self;
  v3.super_class = (Class)MSPublishMMCSProtocol;
  -[MSMMCSProtocol dealloc](&v3, sel_dealloc);
}

- (void)computeHashForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MSMMCSProtocol computeItemIDForAsset:](MSMMCSProtocol, "computeItemIDForAsset:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsignedLongLongValue");
  -[NSMutableDictionary setObject:forKey:](self->_itemIDToAssetDict, "setObject:forKey:", v4, v5);
  -[MSMMCSProtocol engine](self, "engine");
  if (MMCSRegisterFile())
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, MEMORY[0x1D825595C](0));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    free(0);
    objc_msgSend(v4, "setFileHash:", v6);
    objc_msgSend(v4, "setProtocolFileSize:", 0);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_opt_class();
    v15 = v14;
    -[MSMMCSProtocol personID](self, "personID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "MSVerboseDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v21 = v14;
    v22 = 2112;
    v23 = v16;
    v24 = 2114;
    v25 = v4;
    v26 = 2114;
    v27 = v17;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Could not compute signature for asset. Ignoring. %{public}@\nError: %{public}@", buf, 0x2Au);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_itemIDToAssetDict, "removeObjectForKey:", v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MSPublishStorageProtocolDelegate publishStorageProtocol:didFinishUsingFD:forAsset:](self->_delegate, "publishStorageProtocol:didFinishUsingFD:forAsset:", self, 0xFFFFFFFFLL, v4);
  objc_msgSend(v4, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("MSAssetMetadataSHA1HashKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = -[MSPublishStorageProtocolDelegate publishStorageProtocol:didRequestFDForAsset:](self->_delegate, "publishStorageProtocol:didRequestFDForAsset:", self, v4);
    if ((v9 & 0x80000000) != 0)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v18 = (void *)objc_opt_class();
      v11 = v18;
      -[MSMMCSProtocol personID](self, "personID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      v24 = 2114;
      v25 = v4;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Could not compute hash for asset. Ignoring. %{public}@", buf, 0x20u);

    }
    else
    {
      v10 = v9;
      MSSHA1HashForFileDescriptor(v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v4, "metadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "mutableCopy");

        objc_msgSend(v13, "setObject:forKey:", v11, CFSTR("MSAssetMetadataSHA1HashKey"));
        objc_msgSend(v4, "setMetadata:", v13);

      }
      -[MSPublishStorageProtocolDelegate publishStorageProtocol:didFinishUsingFD:forAsset:](self->_delegate, "publishStorageProtocol:didFinishUsingFD:forAsset:", self, v10, v4);
    }

  }
LABEL_14:

}

- (int)_getFileDescriptorFromItem:(unint64_t)a3
{
  NSMutableDictionary *itemIDToAssetDict;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  itemIDToAssetDict = self->_itemIDToAssetDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](itemIDToAssetDict, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[MSPublishStorageProtocolDelegate publishStorageProtocol:didRequestFDForAsset:](self->_delegate, "publishStorageProtocol:didRequestFDForAsset:", self, v7);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      -[MSMMCSProtocol personID](self, "personID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v9;
      v18 = 2112;
      v19 = v11;
      v20 = 2048;
      v21 = a3;
      v22 = 1024;
      v23 = v8;
      _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ retrieving file descriptor for item %llu, returned %d.", (uint8_t *)&v16, 0x26u);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class();
      v14 = v13;
      -[MSMMCSProtocol personID](self, "personID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v15;
      v20 = 2048;
      v21 = a3;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ attempted to get file descriptor for unknown itemID %llu", (uint8_t *)&v16, 0x20u);

    }
    v8 = -1;
  }

  return v8;
}

- (id)_getUTIFromItem:(unint64_t)a3
{
  NSMutableDictionary *itemIDToAssetDict;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  itemIDToAssetDict = self->_itemIDToAssetDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](itemIDToAssetDict, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      -[MSMMCSProtocol personID](self, "personID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "MMCSItemType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v8;
      v19 = 2112;
      v20 = v10;
      v21 = 2048;
      v22 = a3;
      v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ retrieved MMCSItemType for itemID %llu. ItemType: %{public}@", (uint8_t *)&v17, 0x2Au);

    }
    objc_msgSend(v7, "MMCSItemType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      -[MSMMCSProtocol personID](self, "personID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v16;
      v21 = 2048;
      v22 = a3;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ attempted to get UTI for unknown itemID %llu", (uint8_t *)&v17, 0x20u);

    }
    v12 = 0;
  }

  return v12;
}

- (void)publishAssets:(id)a3 URL:(id)a4
{
  id v6;
  int64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  size_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  char **authTokens;
  unsigned int *itemFlags;
  id v27;
  _QWORD block[5];
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = a4;
  v7 = objc_msgSend(v6, "count");
  self->_itemIDs = (unint64_t *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  self->_signatures = (const char **)malloc_type_malloc(8 * v7, 0x10040436913F5uLL);
  self->_authTokens = (char **)malloc_type_malloc(8 * v7, 0xC0040B8AA526DuLL);
  self->_itemFlags = (unsigned int *)malloc_type_malloc(4 * v7, 0x100004052888210uLL);
  self->_itemsInFlight = v7;
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v6, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "metadata");
      v10 = v6;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("MSAssetMetadataItemID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "MMCSAccessHeader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_itemIDToAssetDict, "setObject:forKey:", v9, v12);
      self->_itemIDs[i] = objc_msgSend(v12, "unsignedLongLongValue");
      objc_msgSend(v9, "fileHash");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      self->_signatures[i] = (const char *)objc_msgSend(v14, "bytes");

      v15 = objc_retainAutorelease(v13);
      v16 = (const char *)objc_msgSend(v15, "cStringUsingEncoding:", 4);
      v17 = strlen(v16);
      self->_authTokens[i] = (char *)malloc_type_malloc(v17 + 1, 0x573C2E15uLL);
      strcpy(self->_authTokens[i], v16);
      self->_itemFlags[i] = 1;

      v6 = v10;
    }
  }
  v29 = 0;
  -[MSMMCSProtocol engine](self, "engine");
  -[MSMMCSProtocol personID](self, "personID");
  MSPMMCSConnectionProperties();
  itemFlags = self->_itemFlags;
  authTokens = self->_authTokens;
  v18 = 0;
  if (!MMCSPutItems())
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISH_STORAGE_CANNOT_PUBLISH"));
    objc_msgSend(v19, "MSErrorWithDomain:code:description:", CFSTR("MSPublishStorageProtocolErrorDomain"), 1, v20, authTokens, itemFlags, &v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v18)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_opt_class();
      v22 = v21;
      -[MSMMCSProtocol personID](self, "personID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "MSVerboseDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v21;
      v32 = 2112;
      v33 = v23;
      v34 = 2114;
      v35 = v6;
      v36 = 2114;
      v37 = v24;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Failed to publish assets: %{public}@\nError: %{public}@", buf, 0x2Au);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__MSPublishMMCSProtocol_publishAssets_URL___block_invoke;
    block[3] = &unk_1E95BCED0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (void)_putItemDone:(unint64_t)a3 putReceipt:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *itemIDToAssetDict;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D46750]))
  {
    v11 = objc_msgSend(v9, "code");

    if (v11 != 28)
      goto LABEL_5;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v10 = (void *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISH_STORAGE_NEED_RESUBMISSION"));
    objc_msgSend(v12, "MSErrorWithDomain:code:description:underlyingError:", CFSTR("MSPublishStorageProtocolErrorDomain"), 2, v10, v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v13;
  }

LABEL_5:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v17 = (void *)objc_opt_class();
    v18 = v17;
    -[MSMMCSProtocol personID](self, "personID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "MSVerboseDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543874;
    v22 = v17;
    v23 = 2112;
    v24 = v19;
    v25 = 2114;
    v26 = v20;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ _putItemDone. Error: %{public}@", (uint8_t *)&v21, 0x20u);

  }
  itemIDToAssetDict = self->_itemIDToAssetDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](itemIDToAssetDict, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (!v9)
      objc_msgSend(v16, "setMMCSReceipt:", v8);
    -[MSPublishStorageProtocolDelegate publishStorageProtocol:didFinishUploadingAsset:error:](self->_delegate, "publishStorageProtocol:didFinishUploadingAsset:error:", self, v16, v9);
  }

}

- (void)_requestCompleted
{
  unint64_t v3;
  void *v4;
  void *v5;
  char *v6;
  unint64_t *itemIDs;
  const char **signatures;
  char **authTokens;
  unsigned int *itemFlags;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    -[MSMMCSProtocol personID](self, "personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ _requestCompleted", (uint8_t *)&v14, 0x16u);

  }
  if (self->_itemsInFlight)
  {
    v3 = 0;
    do
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", self->_itemIDs[v3]);
      -[NSMutableDictionary objectForKey:](self->_itemIDToAssetDict, "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
        -[MSPublishStorageProtocolDelegate publishStorageProtocol:didFinishUsingFD:forAsset:](self->_delegate, "publishStorageProtocol:didFinishUsingFD:forAsset:", self, 0xFFFFFFFFLL, v5);
      -[NSMutableDictionary removeObjectForKey:](self->_itemIDToAssetDict, "removeObjectForKey:", v4);
      v6 = self->_authTokens[v3];
      if (v6)
      {
        free(v6);
        self->_authTokens[v3] = 0;
      }

      ++v3;
    }
    while (v3 < self->_itemsInFlight);
  }
  itemIDs = self->_itemIDs;
  if (itemIDs)
  {
    free(itemIDs);
    self->_itemIDs = 0;
  }
  signatures = self->_signatures;
  if (signatures)
  {
    free(signatures);
    self->_signatures = 0;
  }
  authTokens = self->_authTokens;
  if (authTokens)
  {
    free(authTokens);
    self->_authTokens = 0;
  }
  itemFlags = self->_itemFlags;
  if (itemFlags)
  {
    free(itemFlags);
    self->_itemFlags = 0;
  }
  -[NSMutableDictionary removeAllObjects](self->_itemIDToAssetDict, "removeAllObjects");
  -[MSPublishStorageProtocolDelegate publishStorageProtocolDidFinishPublishingAllAssets:](self->_delegate, "publishStorageProtocolDidFinishPublishingAllAssets:", self);
}

- (void)_putItemsFailure
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  MSPublishStorageProtocolDelegate *delegate;
  void *v9;
  __CFString *v10;
  void *v11;
  unint64_t *itemIDs;
  const char **signatures;
  char **authTokens;
  unsigned int *itemFlags;
  void *v16;
  id v17;
  void *v18;
  NSMutableDictionary *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v16 = (void *)objc_opt_class();
    v17 = v16;
    -[MSMMCSProtocol personID](self, "personID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v16;
    v27 = 2112;
    v28 = v18;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ _putItemsFailure", buf, 0x16u);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_itemIDToAssetDict;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKey:](self->_itemIDToAssetDict, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        delegate = self->_delegate;
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_PUBLISH_STORAGE_CANNOT_QUEUE"));
        objc_msgSend(v9, "MSErrorWithDomain:code:description:", CFSTR("MSPublishStorageProtocolErrorDomain"), 0, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSPublishStorageProtocolDelegate publishStorageProtocol:didFinishUploadingAsset:error:](delegate, "publishStorageProtocol:didFinishUploadingAsset:error:", self, v7, v11);

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

  itemIDs = self->_itemIDs;
  if (itemIDs)
  {
    free(itemIDs);
    self->_itemIDs = 0;
  }
  signatures = self->_signatures;
  if (signatures)
  {
    free(signatures);
    self->_signatures = 0;
  }
  authTokens = self->_authTokens;
  if (authTokens)
  {
    free(authTokens);
    self->_authTokens = 0;
  }
  itemFlags = self->_itemFlags;
  if (itemFlags)
  {
    free(itemFlags);
    self->_itemFlags = 0;
  }
  -[NSMutableDictionary removeAllObjects](self->_itemIDToAssetDict, "removeAllObjects");
}

- (MSPublishStorageProtocolDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSPublishStorageProtocolDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIDToAssetDict, 0);
}

uint64_t __43__MSPublishMMCSProtocol_publishAssets_URL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_putItemsFailure");
}

@end
