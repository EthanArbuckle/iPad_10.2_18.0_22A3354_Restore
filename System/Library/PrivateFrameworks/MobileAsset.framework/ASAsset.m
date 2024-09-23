@implementation ASAsset

+ (BOOL)nonUserInitiatedDownloadsAllowed
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ASAsset identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ASAsset *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (ASAsset *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ASAsset maAsset](self, "maAsset");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASAsset maAsset](v4, "maAsset");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      LOBYTE(v8) = 0;
      if (self->maAsset)
      {
        if (v6)
        {
          objc_msgSend(v5, "assetType");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            objc_msgSend(v7, "assetType");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "assetType");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v9, "isEqualToString:", v10);

            if (!v11)
              goto LABEL_12;
            objc_msgSend(v5, "assetId");
            v12 = objc_claimAutoreleasedReturnValue();
            if (!v12)
              goto LABEL_12;
            v13 = (void *)v12;
            objc_msgSend(v7, "assetId");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "assetId");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isEqualToString:", v15);

            if ((v16 & 1) != 0)
              LOBYTE(v8) = 1;
            else
LABEL_12:
              LOBYTE(v8) = 0;
          }
        }
      }

    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return (char)v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asset type: %@\nAsset attributes: %@"), self->_assetType, self->_attributes);
}

- (id)assetServerUrl
{
  void *v3;
  id v4;
  NSString *assetType;
  void *v6;
  void *v7;
  id v8;
  id v10;

  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("__RelativePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = 0;
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("__BaseURL"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    assetType = self->_assetType;
    v10 = 0;
    MAGetServerUrl(assetType, &v10);
    v4 = v10;
    if (!v4)
      goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v8 = v7;

  return v8;
}

- (NSURL)localURL
{
  return (NSURL *)-[ASAsset _getLocalAttribute:](self, "_getLocalAttribute:", CFSTR("LocalURL"));
}

- (NSDictionary)attributes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSDictionary allKeys](self->_attributes, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "hasPrefix:", CFSTR("__")) & 1) == 0)
        {
          -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v10, v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (int64_t)assetStateForStateString:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("NotDownloaded")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Downloaded")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Paused")) & 1) != 0)
    {
      v5 = 3;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Stalled")) & 1) != 0)
    {
      v5 = 4;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Downloading")) & 1) != 0
           || (objc_msgSend(v4, "isEqualToString:", CFSTR("Verifying")) & 1) != 0
           || (objc_msgSend(v4, "isEqualToString:", CFSTR("Unarchiving")) & 1) != 0
           || (objc_msgSend(v4, "isEqualToString:", CFSTR("Backgrounded")) & 1) != 0)
    {
      v5 = 2;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Queued")))
    {
      v5 = 5;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)state
{
  void *v3;
  int64_t v4;

  -[ASAsset _getLocalAttribute:](self, "_getLocalAttribute:", CFSTR("__DownloadState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASAsset assetStateForStateString:](self, "assetStateForStateString:", v3);

  return v4;
}

- (int64_t)garbageCollectionBehavior
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset garbageCollectionBehavior]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), v2, v3, v4, v5, (uint64_t)"-[ASAsset garbageCollectionBehavior]");
  return 1;
}

- (void)setGarbageCollectionBehavior:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset setGarbageCollectionBehavior:]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), v3, v4, v5, v6, (uint64_t)"-[ASAsset setGarbageCollectionBehavior:]");
  _ASErrorForV1Deprecation(CFSTR("setGarbageCollectionBehavior"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 6, (uint64_t)"-[ASAsset setGarbageCollectionBehavior:]", CFSTR("Could not send garbage collection behavior message: %@"), v7, v8, v9, v10, (uint64_t)v11);

}

- (NSDate)installDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset installDate]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), v2, v3, v4, v5, (uint64_t)"-[ASAsset installDate]");
  return (NSDate *)(id)objc_opt_new();
}

- (BOOL)requiredDiskSpaceIsAvailable:(int64_t *)a3 error:(id *)a4
{
  void *v6;
  char v7;

  -[ASAsset maAsset](self, "maAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "spaceCheck:", a3);

  if (a4)
    *a4 = 0;
  return v7;
}

- (BOOL)requiredDiskSpaceIsAvailableForDownloadOptions:(id)a3 requiredBytes:(int64_t *)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset requiredDiskSpaceIsAvailableForDownloadOptions:requiredBytes:error:]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), (uint64_t)a5, v5, v6, v7, (uint64_t)"-[ASAsset requiredDiskSpaceIsAvailableForDownloadOptions:requiredBytes:error:]");
  _ASErrorForV1Deprecation(CFSTR("requiredDiskSpaceIsAvailableForDownloadOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 6, (uint64_t)"-[ASAsset requiredDiskSpaceIsAvailableForDownloadOptions:requiredBytes:error:]", CFSTR("Could not get space available for downloading as downloading an ASAsset is deprecated, use MAAsset: %@"), v10, v11, v12, v13, (uint64_t)v9);

  if (a5)
  {
    _ASErrorForV1Deprecation(CFSTR("requiredDiskSpaceIsAvailableForDownloadOptions"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)adjustDownloadOptions:(id)a3 completion:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a4;
  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset adjustDownloadOptions:completion:]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), v4, v5, v6, v7, (uint64_t)"-[ASAsset adjustDownloadOptions:completion:]");
  if (v9)
  {
    _ASErrorForV1Deprecation(CFSTR("adjustDownloadOptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v8);

  }
}

- (void)_downloadWithOptions:(id)a3 shouldFireCallback:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  MAAsset *maAsset;
  id v12;
  _QWORD v13[5];
  id v14;

  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset _downloadWithOptions:shouldFireCallback:]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), v4, v5, v6, v7, (uint64_t)"-[ASAsset _downloadWithOptions:shouldFireCallback:]");
  if (self->_maAsset)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setDiscretionary:", -[ASAsset userInitiatedDownload](self, "userInitiatedDownload") ^ 1);
    -[ASAsset identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    maAsset = self->_maAsset;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__ASAsset__downloadWithOptions_shouldFireCallback___block_invoke;
    v13[3] = &unk_1E5D5DBE8;
    v13[4] = self;
    v14 = v10;
    v12 = v10;
    -[MAAsset startDownload:completionWithError:](maAsset, "startDownload:completionWithError:", v9, v13);

  }
}

void __51__ASAsset__downloadWithOptions_shouldFireCallback___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1AF44EFD8](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  if (v8)
  {
    if (v12)
    {
      _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset _downloadWithOptions:shouldFireCallback:]_block_invoke", CFSTR("Deprecated V1 download failed"), v4, v5, v6, v7, v11);
      progressDictionaryForAssetIdAndState(*(void **)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "state"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _ASErrorForMAError(v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v8)[2](v8, v9, v10);

    }
    else
    {
      _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset _downloadWithOptions:shouldFireCallback:]_block_invoke", CFSTR("Deprecated V1 download succeeded using V2"), v4, v5, v6, v7, v11);
      progressDictionaryForAssetIdAndState(*(void **)(a1 + 40), 2uLL);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v9, 0);
    }

  }
}

- (void)beginDownloadWithOptions:(id)a3
{
  -[ASAsset _downloadWithOptions:shouldFireCallback:](self, "_downloadWithOptions:shouldFireCallback:", a3, 1);
}

- (void)pauseDownload:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v3 = a3;
  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset pauseDownload:]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), v4, v5, v6, v7, (uint64_t)"-[ASAsset pauseDownload:]");
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__ASAsset_pauseDownload___block_invoke;
  block[3] = &unk_1E5D5DB30;
  v11 = v3;
  v9 = v3;
  dispatch_async(v8, block);

}

void __25__ASAsset_pauseDownload___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    _ASErrorForV1Deprecation(CFSTR("pauseDownload"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (BOOL)pauseDownloadAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset pauseDownloadAndReturnError:]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), v3, v4, v5, v6, (uint64_t)"-[ASAsset pauseDownloadAndReturnError:]");
  _ASErrorForV1Deprecation(CFSTR("pauseDownloadAndReturnError"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 4, (uint64_t)"-[ASAsset pauseDownloadAndReturnError:]", CFSTR("Could not pause asset download: %@"), v9, v10, v11, v12, (uint64_t)v8);
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return 0;
}

- (void)resumeDownload:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v3 = a3;
  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset resumeDownload:]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), v4, v5, v6, v7, (uint64_t)"-[ASAsset resumeDownload:]");
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__ASAsset_resumeDownload___block_invoke;
  block[3] = &unk_1E5D5DB30;
  v11 = v3;
  v9 = v3;
  dispatch_async(v8, block);

}

void __26__ASAsset_resumeDownload___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    _ASErrorForV1Deprecation(CFSTR("resumeDownload"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (BOOL)resumeDownloadAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset resumeDownloadAndReturnError:]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), v3, v4, v5, v6, (uint64_t)"-[ASAsset resumeDownloadAndReturnError:]");
  _ASErrorForV1Deprecation(CFSTR("resumeDownloadAndReturnError"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (a3)
    *a3 = objc_retainAutorelease(v8);
  _MobileAssetLog(0, 4, (uint64_t)"-[ASAsset resumeDownloadAndReturnError:]", CFSTR("Could not resume asset download: %@"), v9, v10, v11, v12, (uint64_t)v13);

  return 0;
}

- (void)cancelDownload:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset cancelDownload:]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), v5, v6, v7, v8, (uint64_t)"-[ASAsset cancelDownload:]");
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__ASAsset_cancelDownload___block_invoke;
  block[3] = &unk_1E5D5CC20;
  block[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, block);

}

void __26__ASAsset_cancelDownload___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v1)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __26__ASAsset_cancelDownload___block_invoke_2;
    v4[3] = &unk_1E5D5DC10;
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v1, "cancelDownload:", v4);

  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      _ASErrorForV1Deprecation(CFSTR("cancelDownload"));
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

    }
  }
}

void __26__ASAsset_cancelDownload___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = MAIsCancelDownloadResultFailure(a2);
  MAStringForMACancelDownloadResult(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    _MobileAssetLog(0, 4, (uint64_t)"-[ASAsset cancelDownload:]_block_invoke_2", CFSTR("Could not cancel v1 download: %lld %@"), v5, v6, v7, v8, a2);
  else
    _MobileAssetLog(0, 6, (uint64_t)"-[ASAsset cancelDownload:]_block_invoke_2", CFSTR("Successful cancel v1 download: %lld %@"), v5, v6, v7, v8, a2);

  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    _ASErrorForV1Deprecation(CFSTR("cancelDownload"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);

  }
}

- (BOOL)cancelDownloadAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;
  MAAsset *maAsset;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset cancelDownloadAndReturnError:]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), v3, v4, v5, v6, (uint64_t)"-[ASAsset cancelDownloadAndReturnError:]");
  _ASErrorForV1Deprecation(CFSTR("cancelDownloadAndReturnError"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  maAsset = self->maAsset;
  if (maAsset)
  {
    v11 = -[MAAsset cancelDownloadSync](maAsset, "cancelDownloadSync");
    v12 = MAIsCancelDownloadResultFailure(v11);
    MAStringForMACancelDownloadResult(v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      _MobileAssetLog(0, 4, (uint64_t)"-[ASAsset cancelDownloadAndReturnError:]", CFSTR("Could not cancel v1 download: %lld %@"), v13, v14, v15, v16, v11);
    else
      _MobileAssetLog(0, 6, (uint64_t)"-[ASAsset cancelDownloadAndReturnError:]", CFSTR("Successful cancel v1 download: %lld %@"), v13, v14, v15, v16, v11);

  }
  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return 0;
}

- (void)purge:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v3 = a3;
  _MobileAssetLog(0, 3, (uint64_t)"-[ASAsset purge:]", CFSTR("Deprecated ASAsset API is no longer supported: %s"), v4, v5, v6, v7, (uint64_t)"-[ASAsset purge:]");
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __17__ASAsset_purge___block_invoke;
  block[3] = &unk_1E5D5DB30;
  v11 = v3;
  v9 = v3;
  dispatch_async(v8, block);

}

void __17__ASAsset_purge___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    _ASErrorForV1Deprecation(CFSTR("purge"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (BOOL)purgeAndReturnError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _ASErrorForV1Deprecation(CFSTR("purgeAndReturnError"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 4, (uint64_t)"-[ASAsset purgeAndReturnError:]", CFSTR("Could not purge asset: %@"), v5, v6, v7, v8, (uint64_t)v4);
  if (a3)
    *a3 = objc_retainAutorelease(v4);

  return 0;
}

- (id)_getLocalAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[ASAsset maAsset](self, "maAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASAsset maAsset](self, "maAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("LocalURL")))
  {
    -[ASAsset maAsset](self, "maAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getLocalFileUrl");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  if (!v5 && (objc_msgSend(v4, "isEqualToString:", CFSTR("__DownloadState")) & 1) == 0)
    _MobileAssetLog(0, 5, (uint64_t)"-[ASAsset _getLocalAttribute:]", CFSTR("Could not get attribute '%@': %@"), v10, v11, v12, v13, (uint64_t)v4);

  return v5;
}

- (MAAsset)maAsset
{
  return self->maAsset;
}

- (void)setMaAsset:(id)a3
{
  objc_storeStrong((id *)&self->maAsset, a3);
}

- (NSString)assetType
{
  return self->_assetType;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)downloadOptions
{
  return self->_downloadOptions;
}

- (BOOL)userInitiatedDownload
{
  return self->_userInitiatedDownload;
}

- (void)setUserInitiatedDownload:(BOOL)a3
{
  self->_userInitiatedDownload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadOptions, 0);
  objc_storeStrong((id *)&self->maAsset, 0);
  objc_storeStrong((id *)&self->_maAsset, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

- (ASAsset)initWithAssetType:(id)a3 attributes:(id)a4
{
  id v7;
  id v8;
  ASAsset *v9;
  ASAsset *v10;
  MAAsset *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASAsset;
  v9 = -[ASAsset init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetType, a3);
    objc_storeStrong((id *)&v10->_attributes, a4);
    v11 = -[MAAsset initWithAttributes:]([MAAsset alloc], "initWithAttributes:", v8);
    -[ASAsset setMaAsset:](v10, "setMaAsset:", v11);

  }
  return v10;
}

- (ASAsset)initWithMAAsset:(id)a3
{
  id v4;
  ASAsset *v5;
  ASAsset *v6;
  uint64_t v7;
  NSString *assetType;
  void *v9;
  void *v10;
  NSDictionary *v11;
  const __CFString *v12;
  NSDictionary *attributes;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASAsset;
  v5 = -[ASAsset init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ASAsset setMaAsset:](v5, "setMaAsset:", v4);
    objc_msgSend(v4, "assetType");
    v7 = objc_claimAutoreleasedReturnValue();
    assetType = v6->_assetType;
    v6->_assetType = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E0C99E08];
    -[MAAsset attributes](v6->maAsset, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithDictionary:", v10);
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "wasLocal") & 1) != 0)
    {
      v12 = CFSTR("Downloaded");
    }
    else if (objc_msgSend(v4, "state") == 4)
    {
      v12 = CFSTR("Downloading");
    }
    else
    {
      v12 = CFSTR("NotDownloaded");
    }
    -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, CFSTR("__DownloadState"));
    attributes = v6->_attributes;
    v6->_attributes = v11;

  }
  return v6;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  NSString *v5;
  NSString **p_clientName;
  NSString *clientName;
  NSString *v8;

  v5 = (NSString *)a3;
  clientName = self->_clientName;
  p_clientName = &self->_clientName;
  if (clientName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_clientName, a3);
    v5 = v8;
  }

}

- (NSDictionary)fullAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[ASAsset maAsset](self, "maAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASAsset maAsset](self, "maAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _MobileAssetLog(0, 5, (uint64_t)"-[ASAsset(ASAssetInternal) fullAttributes]", CFSTR("Could not get asset attributes: %@"), v4, v5, v6, v7, 0);
    v9 = 0;
  }
  return (NSDictionary *)v9;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[ASAsset maAsset](self, "maAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isPresentOnDisk
{
  void *v2;
  char v3;

  -[ASAsset maAsset](self, "maAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wasLocal");

  return v3;
}

@end
