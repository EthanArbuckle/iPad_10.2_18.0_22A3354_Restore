@implementation PHLivePhotoResult

- (BOOL)containsValidData
{
  return (-[PHCompositeMediaResult containsValidData](self->_imageResult, "containsValidData")
       || !self->_requiresImageResult)
      && -[PHCompositeMediaResult containsValidData](self->_videoResult, "containsValidData");
}

- (id)allowedInfoKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PHLivePhotoResult_allowedInfoKeys__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = self;
  if (allowedInfoKeys_onceToken_33925 != -1)
    dispatch_once(&allowedInfoKeys_onceToken_33925, block);
  return (id)allowedInfoKeys_allowedKeys_33926;
}

- (id)sanitizedInfoDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHLivePhotoResult;
  -[PHCompositeMediaResult sanitizedInfoDictionary](&v6, sel_sanitizedInfoDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHLivePhotoResult isDegraded](self, "isDegraded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PHImageResultIsDegradedKey"));

  return v3;
}

- (CGImage)imageRef
{
  return -[PHCompositeMediaResult imageRef](self->_imageResult, "imageRef");
}

- (id)imageURL
{
  return -[PHCompositeMediaResult imageURL](self->_imageResult, "imageURL");
}

- (id)imageData
{
  return -[PHCompositeMediaResult imageData](self->_imageResult, "imageData");
}

- (id)exifOrientation
{
  return -[PHCompositeMediaResult exifOrientation](self->_imageResult, "exifOrientation");
}

- (int64_t)uiOrientation
{
  return -[PHCompositeMediaResult uiOrientation](self->_imageResult, "uiOrientation");
}

- (unsigned)cgOrientation
{
  return -[PHCompositeMediaResult cgOrientation](self->_imageResult, "cgOrientation");
}

- (id)videoURL
{
  return -[PHCompositeMediaResult videoURL](self->_videoResult, "videoURL");
}

- (id)videoAdjustmentData
{
  return -[PHCompositeMediaResult videoAdjustmentData](self->_videoResult, "videoAdjustmentData");
}

- (id)uniformTypeIdentifier
{
  return -[PHCompositeMediaResult uniformTypeIdentifier](self->_imageResult, "uniformTypeIdentifier");
}

- (BOOL)isPlaceholder
{
  return -[PHCompositeMediaResult isPlaceholder](self->_imageResult, "isPlaceholder");
}

- (void)setDegraded:(BOOL)a3
{
  self->_isDegraded = a3;
}

- (BOOL)isDegraded
{
  return self->_isDegraded;
}

- (void)setRequiresImageResult:(BOOL)a3
{
  self->_requiresImageResult = a3;
}

- (void)_mergeInfoDictionaryFromResult:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "error");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PHCompositeMediaResult error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(v8, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHCompositeMediaResult setError:](self, "setError:", v7);

    }
  }
  if (objc_msgSend(v8, "isInCloud"))
    -[PHCompositeMediaResult setIsInCloud:](self, "setIsInCloud:", 1);
  if (objc_msgSend(v8, "isCancelled"))
    -[PHCompositeMediaResult setCancelled:](self, "setCancelled:", 1);

}

- (void)addImageResult:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  if (self->_imageResult)
  {
    PLImageManagerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Cannot set more than 1 image on a live photo result", v7, 2u);
    }

  }
  else
  {
    objc_storeStrong((id *)&self->_imageResult, a3);
    -[PHLivePhotoResult _mergeInfoDictionaryFromResult:](self, "_mergeInfoDictionaryFromResult:", v5);
  }

}

- (void)addVideoResult:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  if (self->_videoResult)
  {
    PLImageManagerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Cannot set more than 1 video on a live photo result", v7, 2u);
    }

  }
  else
  {
    objc_storeStrong((id *)&self->_videoResult, a3);
    -[PHLivePhotoResult _mergeInfoDictionaryFromResult:](self, "_mergeInfoDictionaryFromResult:", v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoResult, 0);
  objc_storeStrong((id *)&self->_imageResult, 0);
}

void __36__PHLivePhotoResult_allowedInfoKeys__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E20]);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)PHLivePhotoResult;
  objc_msgSendSuper2(&v7, sel_allowedInfoKeys);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithSet:", v3);

  v8[0] = CFSTR("PHImageResultIsDegradedKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = (void *)allowedInfoKeys_allowedKeys_33926;
  allowedInfoKeys_allowedKeys_33926 = (uint64_t)v4;

}

@end
