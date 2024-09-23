@implementation PHContentEditingInputResult

- (BOOL)containsValidData
{
  PHImageResult *imageResult;
  int v4;
  PHCompositeMediaResult *videoResult;
  BOOL v6;
  BOOL v7;

  imageResult = self->_imageResult;
  if (imageResult)
  {
    v4 = -[PHImageResult containsValidData](imageResult, "containsValidData");
    videoResult = self->_videoResult;
  }
  else
  {
    videoResult = self->_videoResult;
    if (!videoResult)
      return 0;
    v4 = 1;
  }
  if (videoResult)
    v6 = 0;
  else
    v6 = v4;
  if (videoResult)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (!v7)
    return -[PHCompositeMediaResult containsValidData](videoResult, "containsValidData");
  return v6;
}

- (id)errorInfoKey
{
  __CFString *v2;

  v2 = CFSTR("PHContentEditingInputErrorKey");
  return CFSTR("PHContentEditingInputErrorKey");
}

- (id)cancelledInfoKey
{
  __CFString *v2;

  v2 = CFSTR("PHContentEditingInputCancelledKey");
  return CFSTR("PHContentEditingInputCancelledKey");
}

- (id)inCloudInfoKey
{
  __CFString *v2;

  v2 = CFSTR("PHContentEditingInputResultIsInCloudKey");
  return CFSTR("PHContentEditingInputResultIsInCloudKey");
}

- (id)adjustmentData
{
  return self->_adjustmentData;
}

- (id)adjustmentSecondaryDataURL
{
  return -[PHCompositeMediaResult adjustmentSecondaryDataURL](self->_adjustmentSecondaryDataResult, "adjustmentSecondaryDataURL");
}

- (CGImage)imageRef
{
  return -[PHImageResult imageRef](self->_imageResult, "imageRef");
}

- (id)imageURL
{
  return -[PHImageResult imageURL](self->_imageResult, "imageURL");
}

- (id)imageData
{
  return -[PHImageResult imageData](self->_imageResult, "imageData");
}

- (id)exifOrientation
{
  return -[PHImageResult exifOrientation](self->_imageResult, "exifOrientation");
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
  void *imageResult;

  imageResult = self->_imageResult;
  if (imageResult || (imageResult = self->_videoResult) != 0)
  {
    objc_msgSend(imageResult, "uniformTypeIdentifier");
    imageResult = (void *)objc_claimAutoreleasedReturnValue();
  }
  return imageResult;
}

- (id)imagePropertiesLoadIfNeeded:(BOOL)a3
{
  return -[PHCompositeMediaResult imagePropertiesLoadIfNeeded:](self->_imageResult, "imagePropertiesLoadIfNeeded:", a3);
}

- (void)setError:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._mutableInfo, "setObject:forKeyedSubscript:", a3, CFSTR("PHContentEditingInputErrorKey"));
}

- (id)error
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mutableInfo, "objectForKeyedSubscript:", CFSTR("PHContentEditingInputErrorKey"));
}

- (id)imageSandboxExtensionToken
{
  return -[PHCompositeMediaResult sandboxExtensionToken](self->_imageResult, "sandboxExtensionToken");
}

- (id)videoSandboxExtensionToken
{
  return -[PHCompositeMediaResult sandboxExtensionToken](self->_videoResult, "sandboxExtensionToken");
}

- (void)mergeInfoDictionaryFromResult:(id)a3
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
    -[PHContentEditingInputResult error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(v8, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingInputResult setError:](self, "setError:", v7);

    }
  }
  if (objc_msgSend(v8, "isInCloud"))
    -[PHCompositeMediaResult setIsInCloud:](self, "setIsInCloud:", 1);
  if (objc_msgSend(v8, "isCancelled"))
    -[PHCompositeMediaResult setCancelled:](self, "setCancelled:", 1);

}

- (void)addAdjustmentDataResult:(id)a3
{
  PHAdjustmentData *v4;
  PHAdjustmentData *adjustmentData;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "adjustmentData");
  v4 = (PHAdjustmentData *)objc_claimAutoreleasedReturnValue();
  adjustmentData = self->_adjustmentData;
  self->_adjustmentData = v4;

  -[PHContentEditingInputResult mergeInfoDictionaryFromResult:](self, "mergeInfoDictionaryFromResult:", v6);
}

- (void)addAdjustmentSecondaryDataResult:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_adjustmentSecondaryDataResult, a3);
  v5 = a3;
  -[PHContentEditingInputResult mergeInfoDictionaryFromResult:](self, "mergeInfoDictionaryFromResult:", v5);

}

- (void)clearAdjustmentData
{
  PHAdjustmentData *adjustmentData;

  adjustmentData = self->_adjustmentData;
  self->_adjustmentData = 0;

}

- (void)addImageResult:(id)a3
{
  PHImageResult *v4;
  void *v5;
  void *v6;
  PHImageResult *v7;
  PHImageResult *imageResult;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!self->_imageResult)
  {
    v4 = [PHImageResult alloc];
    objc_msgSend(v13, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PHImageResultRequestIDKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHCompositeMediaResult initWithRequestID:](v4, "initWithRequestID:", objc_msgSend(v6, "intValue"));
    imageResult = self->_imageResult;
    self->_imageResult = v7;

  }
  objc_msgSend(v13, "imageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v13, "imageURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImageResult setImageURL:](self->_imageResult, "setImageURL:", v10);

    objc_msgSend(v13, "uniformTypeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImageResult setUniformTypeIdentifier:](self->_imageResult, "setUniformTypeIdentifier:", v11);

    objc_msgSend(v13, "exifOrientation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImageResult setExifOrientation:](self->_imageResult, "setExifOrientation:", v12);

  }
  if (objc_msgSend(v13, "imageRef"))
    -[PHImageResult setImageRef:](self->_imageResult, "setImageRef:", objc_msgSend(v13, "imageRef"));
  -[PHContentEditingInputResult mergeInfoDictionaryFromResult:](self, "mergeInfoDictionaryFromResult:", v13);

}

- (void)addVideoResult:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_videoResult, a3);
  v5 = a3;
  -[PHContentEditingInputResult mergeInfoDictionaryFromResult:](self, "mergeInfoDictionaryFromResult:", v5);

}

- (id)flipImageURLs
{
  return self->_flipImageURLs;
}

- (id)flipVideoURLs
{
  return self->_flipVideoURLs;
}

- (void)addFlipImageURL:(id)a3 forAssetResourceType:(int64_t)a4
{
  NSMutableDictionary *flipImageURLs;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  flipImageURLs = self->_flipImageURLs;
  if (!flipImageURLs)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = self->_flipImageURLs;
    self->_flipImageURLs = v7;

    flipImageURLs = self->_flipImageURLs;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](flipImageURLs, "setObject:forKeyedSubscript:", v10, v9);

}

- (void)addFlipVideoURL:(id)a3 forAssetResourceType:(int64_t)a4
{
  NSMutableDictionary *flipVideoURLs;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  flipVideoURLs = self->_flipVideoURLs;
  if (!flipVideoURLs)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = self->_flipVideoURLs;
    self->_flipVideoURLs = v7;

    flipVideoURLs = self->_flipVideoURLs;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](flipVideoURLs, "setObject:forKeyedSubscript:", v10, v9);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHContentEditingInputResult imageURL](self, "imageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHContentEditingInputResult videoURL](self, "videoURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> imageURL: %@, videoURL: %@"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)canHandleAdjustmentData
{
  return self->_canHandleAdjustmentData;
}

- (void)setCanHandleAdjustmentData:(BOOL)a3
{
  self->_canHandleAdjustmentData = a3;
}

- (NSNumber)baseVersionNeeded
{
  return self->_baseVersionNeeded;
}

- (void)setBaseVersionNeeded:(id)a3
{
  objc_storeStrong((id *)&self->_baseVersionNeeded, a3);
}

- (NSURL)overCapturePhotoURL
{
  return self->_overCapturePhotoURL;
}

- (void)setOverCapturePhotoURL:(id)a3
{
  objc_storeStrong((id *)&self->_overCapturePhotoURL, a3);
}

- (NSURL)overCaptureVideoURL
{
  return self->_overCaptureVideoURL;
}

- (void)setOverCaptureVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_overCaptureVideoURL, a3);
}

- (NSURL)frontSwappingImageRenderURL
{
  return self->_frontSwappingImageRenderURL;
}

- (void)setFrontSwappingImageRenderURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSURL)backSwappingImageRenderURL
{
  return self->_backSwappingImageRenderURL;
}

- (void)setBackSwappingImageRenderURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSURL)frontSwappingVideoRenderURL
{
  return self->_frontSwappingVideoRenderURL;
}

- (void)setFrontSwappingVideoRenderURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSURL)backSwappingVideoRenderURL
{
  return self->_backSwappingVideoRenderURL;
}

- (void)setBackSwappingVideoRenderURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (PHAdjustmentData)originalAdjustmentData
{
  return self->_originalAdjustmentData;
}

- (void)setOriginalAdjustmentData:(id)a3
{
  objc_storeStrong((id *)&self->_originalAdjustmentData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAdjustmentData, 0);
  objc_storeStrong((id *)&self->_backSwappingVideoRenderURL, 0);
  objc_storeStrong((id *)&self->_frontSwappingVideoRenderURL, 0);
  objc_storeStrong((id *)&self->_backSwappingImageRenderURL, 0);
  objc_storeStrong((id *)&self->_frontSwappingImageRenderURL, 0);
  objc_storeStrong((id *)&self->_overCaptureVideoURL, 0);
  objc_storeStrong((id *)&self->_overCapturePhotoURL, 0);
  objc_storeStrong((id *)&self->_baseVersionNeeded, 0);
  objc_storeStrong((id *)&self->_flipVideoURLs, 0);
  objc_storeStrong((id *)&self->_flipImageURLs, 0);
  objc_storeStrong((id *)&self->_adjustmentSecondaryDataResult, 0);
  objc_storeStrong((id *)&self->_videoResult, 0);
  objc_storeStrong((id *)&self->_imageResult, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
}

@end
