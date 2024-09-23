@implementation PHCompositeMediaResult

- (PHCompositeMediaResult)initWithRequestID:(int)a3
{
  uint64_t v3;
  PHCompositeMediaResult *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *mutableInfo;
  void *v7;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PHCompositeMediaResult;
  v4 = -[PHCompositeMediaResult init](&v9, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableInfo = v4->_mutableInfo;
    v4->_mutableInfo = v5;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_mutableInfo, "setObject:forKeyedSubscript:", v7, CFSTR("PHImageResultRequestIDKey"));

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_mutableInfo, 0);
}

void __41__PHCompositeMediaResult_allowedInfoKeys__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = CFSTR("PHImageResultRequestIDKey");
  objc_msgSend(*(id *)(a1 + 32), "errorInfoKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(*(id *)(a1 + 32), "cancelledInfoKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  objc_msgSend(*(id *)(a1 + 32), "inCloudInfoKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  v9[4] = CFSTR("PHImageFileSandboxExtensionTokenKey");
  v9[5] = CFSTR("PHImageResultClientShouldRetryKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)allowedInfoKeys_allowedKeys;
  allowedInfoKeys_allowedKeys = v7;

}

- (id)inCloudInfoKey
{
  __CFString *v2;

  v2 = CFSTR("PHImageResultIsInCloudKey");
  return CFSTR("PHImageResultIsInCloudKey");
}

- (id)cancelledInfoKey
{
  __CFString *v2;

  v2 = CFSTR("PHImageCancelledKey");
  return CFSTR("PHImageCancelledKey");
}

- (id)sanitizedInfoDictionary
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int IsMediaServerDisconnected;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allKeys](self->_mutableInfo, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8);
        -[PHCompositeMediaResult allowedInfoKeys](self, "allowedInfoKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v9);

        if (v11)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableInfo, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v9);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  if (-[PHCompositeMediaResult isCancelled](self, "isCancelled"))
  {
    -[PHCompositeMediaResult cancelledInfoKey](self, "cancelledInfoKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v13);

  }
  if (-[PHCompositeMediaResult isInCloud](self, "isInCloud"))
  {
    -[PHCompositeMediaResult inCloudInfoKey](self, "inCloudInfoKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v14);

  }
  -[PHCompositeMediaResult error](self, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  IsMediaServerDisconnected = PHErrorIsMediaServerDisconnected();

  if (IsMediaServerDisconnected)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PHImageResultClientShouldRetryKey"));
  -[PHCompositeMediaResult _sanitizedError](self, "_sanitizedError");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCompositeMediaResult errorInfoKey](self, "errorInfoKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v18);

  return v3;
}

- (id)errorInfoKey
{
  __CFString *v2;

  v2 = CFSTR("PHImageErrorKey");
  return CFSTR("PHImageErrorKey");
}

- (BOOL)isInCloud
{
  return self->_isInCloud;
}

- (id)error
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mutableInfo, "objectForKeyedSubscript:", CFSTR("PHImageErrorKey"));
}

- (void)setError:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableInfo, "setObject:forKeyedSubscript:", a3, CFSTR("PHImageErrorKey"));
}

- (void)clearError
{
  -[PHCompositeMediaResult setError:](self, "setError:", 0);
}

- (id)_sanitizedError
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PHCompositeMediaResult error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHCompositeMediaResult isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3072, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v3)
  {
    PHPublicImageManagerErrorFromError(v3);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;

    if (v5)
      return v5;
  }
  if (-[PHCompositeMediaResult containsValidData](self, "containsValidData")
    || -[PHCompositeMediaResult isDegraded](self, "isDegraded"))
  {
    return 0;
  }
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = CFSTR("Unknown internal error");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (id)allowedInfoKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PHCompositeMediaResult_allowedInfoKeys__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = self;
  if (allowedInfoKeys_onceToken != -1)
    dispatch_once(&allowedInfoKeys_onceToken, block);
  return (id)allowedInfoKeys_allowedKeys;
}

- (BOOL)containsValidData
{
  void *v2;
  BOOL v3;

  -[PHCompositeMediaResult error](self, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CGImage)imageRef
{
  return 0;
}

- (id)imageURL
{
  return 0;
}

- (id)imageData
{
  return 0;
}

- (id)exifOrientation
{
  return 0;
}

- (int64_t)uiOrientation
{
  return 0;
}

- (unsigned)cgOrientation
{
  void *v3;
  void *v4;
  unsigned int v5;

  -[PHCompositeMediaResult exifOrientation](self, "exifOrientation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[PHCompositeMediaResult exifOrientation](self, "exifOrientation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  return v5;
}

- (id)videoURL
{
  return 0;
}

- (id)videoMediaItemMakerData
{
  return 0;
}

- (id)fingerPrint
{
  return 0;
}

- (id)videoAdjustmentData
{
  return 0;
}

- (id)uniformTypeIdentifier
{
  return 0;
}

- (id)adjustmentData
{
  return 0;
}

- (id)adjustmentSecondaryDataURL
{
  return 0;
}

- (BOOL)canHandleAdjustmentData
{
  return 1;
}

- (id)baseVersionNeeded
{
  return 0;
}

- (id)imageProperties
{
  return -[PHCompositeMediaResult imagePropertiesLoadIfNeeded:](self, "imagePropertiesLoadIfNeeded:", 0);
}

- (id)imagePropertiesLoadIfNeeded:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  CGImageSourceRef v8;
  CGImageSourceRef v9;
  NSDictionary *v10;
  NSDictionary *imageProperties;

  if (a3 && !self->_imageProperties)
  {
    -[PHCompositeMediaResult imageURL](self, "imageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, 0);

      if (v7)
      {
        v8 = CGImageSourceCreateWithURL((CFURLRef)v4, 0);
        if (v8)
        {
          v9 = v8;
          v10 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0D71880], "newImagePropertiesFromImageSource:", v8);
          imageProperties = self->_imageProperties;
          self->_imageProperties = v10;

          CFRelease(v9);
        }
      }
    }

  }
  return self->_imageProperties;
}

- (id)mediaMetadata
{
  return 0;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (BOOL)isDegraded
{
  return 0;
}

- (BOOL)isDerivedFromDeferredPreview
{
  return 0;
}

- (void)setIsInCloud:(BOOL)a3
{
  self->_isInCloud = a3;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (id)info
{
  return self->_mutableInfo;
}

- (void)setInfo:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableInfo, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)addInfoFromDictionary:(id)a3
{
  NSMutableDictionary *mutableInfo;
  id v5;
  void *v6;
  id v7;

  mutableInfo = self->_mutableInfo;
  v5 = a3;
  -[NSMutableDictionary addEntriesFromDictionary:](mutableInfo, "addEntriesFromDictionary:", v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PHImageResultIsInCloudKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCompositeMediaResult setIsInCloud:](self, "setIsInCloud:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PHImageCancelledKey"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PHCompositeMediaResult setCancelled:](self, "setCancelled:", objc_msgSend(v7, "BOOLValue"));
}

- (void)setErrorIfNone:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PHCompositeMediaResult error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6 && !v4)
  {
    -[PHCompositeMediaResult setError:](self, "setError:", v6);
    v5 = v6;
  }

}

- (void)setSandboxExtensionToken:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableInfo, "setObject:forKeyedSubscript:", a3, CFSTR("PHImageFileSandboxExtensionTokenKey"));
}

- (id)sandboxExtensionToken
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mutableInfo, "objectForKeyedSubscript:", CFSTR("PHImageFileSandboxExtensionTokenKey"));
}

+ (id)resultWithRequestID:(int)a3 error:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestID:", v4);
  objc_msgSend(v7, "setError:", v6);

  return v7;
}

@end
