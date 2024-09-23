@implementation PHContentEditingInput

- (PHContentEditingInput)initWithAppropriateURL:(id)a3
{
  id v5;
  PHContentEditingInput *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *avAssetIsolationQueue;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHContentEditingInput;
  v6 = -[PHContentEditingInput init](&v10, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.photos.contenteditinginput.avasset", 0);
    avAssetIsolationQueue = v6->_avAssetIsolationQueue;
    v6->_avAssetIsolationQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_appropriateURLForDerivingRenderedContentURLs, a3);
  }

  return v6;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_sandboxExtensionHandles;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "integerValue");
        sandbox_extension_release();
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)PHContentEditingInput;
  -[PHContentEditingInput dealloc](&v9, sel_dealloc);
}

- (BOOL)isMediaSubtype:(unint64_t)a3
{
  return (a3 & ~self->_mediaSubtypes) == 0;
}

- (void)loadFullSizeImageDataWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PHContentEditingInput_loadFullSizeImageDataWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E35DDA78;
  v7 = v4;
  v5 = v4;
  -[PHContentEditingInput requestFullSizeImageURLWithCompletionHandler:](self, "requestFullSizeImageURLWithCompletionHandler:", v6);

}

- (id)audioMix
{
  return 0;
}

- (id)videoComposition
{
  return 0;
}

- (void)requestFullSizeImageURLWithCompletionHandler:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[PHContentEditingInput fullSizeImageURL](self, "fullSizeImageURL");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, -[PHContentEditingInput fullSizeImageOrientation](self, "fullSizeImageOrientation"));

  }
}

- (void)consumeSandboxExtensionToken:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *sandboxExtensionHandles;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!self->_sandboxExtensionHandles)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    sandboxExtensionHandles = self->_sandboxExtensionHandles;
    self->_sandboxExtensionHandles = v5;

    v4 = v9;
  }
  if (objc_msgSend(v4, "length"))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    objc_msgSend(v7, "numberWithLongLong:", sandbox_extension_consume());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_sandboxExtensionHandles, "addObject:", v8);

  }
}

- (void)setVideoURL:(id)a3
{
  NSURL *v4;
  NSURL *v5;
  char v6;
  NSURL *v7;
  NSURL *videoURL;
  NSURL *v9;

  v4 = (NSURL *)a3;
  v5 = v4;
  if (self->_videoURL != v4)
  {
    v9 = v4;
    v6 = -[NSURL isEqual:](v4, "isEqual:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSURL *)-[NSURL copy](v9, "copy");
      videoURL = self->_videoURL;
      self->_videoURL = v7;

      -[PHContentEditingInput _invalidateAVAsset](self, "_invalidateAVAsset");
      v5 = v9;
    }
  }

}

- (AVAsset)audiovisualAsset
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__33083;
  v8 = __Block_byref_object_dispose__33084;
  v9 = 0;
  pl_dispatch_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (AVAsset *)v2;
}

- (void)_invalidateAVAsset
{
  pl_dispatch_sync();
}

- (id)description
{
  void *v3;
  PHAssetMediaType v4;
  PHAssetMediaSubtype v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHContentEditingInput;
  -[PHContentEditingInput description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PHContentEditingInput mediaType](self, "mediaType");
  v5 = -[PHContentEditingInput mediaSubtypes](self, "mediaSubtypes");
  -[PHContentEditingInput creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHContentEditingInput location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHContentEditingInput adjustmentData](self, "adjustmentData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" mediaType=%ld/%ld, creationDate=%@, location=%d, adjustmentData=%@"), v4, v5, v6, v7 != 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PHAssetMediaType)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (PHAssetMediaSubtype)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (void)setMediaSubtypes:(unint64_t)a3
{
  self->_mediaSubtypes = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setUniformTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (PHAssetPlaybackStyle)playbackStyle
{
  return self->_playbackStyle;
}

- (void)setPlaybackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- (PHAdjustmentData)adjustmentData
{
  return self->_adjustmentData;
}

- (void)setAdjustmentData:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentData, a3);
}

- (UIImage)displaySizeImage
{
  return self->_displaySizeImage;
}

- (void)setDisplaySizeImage:(id)a3
{
  objc_storeStrong((id *)&self->_displaySizeImage, a3);
}

- (NSURL)fullSizeImageURL
{
  return self->_fullSizeImageURL;
}

- (void)setFullSizeImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int)fullSizeImageOrientation
{
  return self->_fullSizeImageOrientation;
}

- (void)setFullSizeImageOrientation:(int)a3
{
  self->_fullSizeImageOrientation = a3;
}

- (PHLivePhoto)livePhoto
{
  return self->_livePhoto;
}

- (void)setLivePhoto:(id)a3
{
  objc_storeStrong((id *)&self->_livePhoto, a3);
}

- (int64_t)baseVersion
{
  return self->_baseVersion;
}

- (void)setBaseVersion:(int64_t)a3
{
  self->_baseVersion = a3;
}

- (NSNumber)originalResourceChoice
{
  return self->_originalResourceChoice;
}

- (void)setOriginalResourceChoice:(id)a3
{
  objc_storeStrong((id *)&self->_originalResourceChoice, a3);
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (NSURL)overCapturePhotoURL
{
  return self->_overCapturePhotoURL;
}

- (void)setOverCapturePhotoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSURL)overCaptureVideoURL
{
  return self->_overCaptureVideoURL;
}

- (void)setOverCaptureVideoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSURL)frontSwappingImageRenderURL
{
  return self->_frontSwappingImageRenderURL;
}

- (void)setFrontSwappingImageRenderURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSURL)backSwappingImageRenderURL
{
  return self->_backSwappingImageRenderURL;
}

- (void)setBackSwappingImageRenderURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSURL)frontSwappingVideoRenderURL
{
  return self->_frontSwappingVideoRenderURL;
}

- (void)setFrontSwappingVideoRenderURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSURL)backSwappingVideoRenderURL
{
  return self->_backSwappingVideoRenderURL;
}

- (void)setBackSwappingVideoRenderURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (PHAdjustmentData)originalAdjustmentData
{
  return self->_originalAdjustmentData;
}

- (void)setOriginalAdjustmentData:(id)a3
{
  objc_storeStrong((id *)&self->_originalAdjustmentData, a3);
}

- (NSURL)adjustmentSecondaryDataURL
{
  return self->_adjustmentSecondaryDataURL;
}

- (void)setAdjustmentSecondaryDataURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSURL)appropriateURLForDerivingRenderedContentURLs
{
  return self->_appropriateURLForDerivingRenderedContentURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appropriateURLForDerivingRenderedContentURLs, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_adjustmentSecondaryDataURL, 0);
  objc_storeStrong((id *)&self->_originalAdjustmentData, 0);
  objc_storeStrong((id *)&self->_backSwappingVideoRenderURL, 0);
  objc_storeStrong((id *)&self->_frontSwappingVideoRenderURL, 0);
  objc_storeStrong((id *)&self->_backSwappingImageRenderURL, 0);
  objc_storeStrong((id *)&self->_frontSwappingImageRenderURL, 0);
  objc_storeStrong((id *)&self->_overCaptureVideoURL, 0);
  objc_storeStrong((id *)&self->_overCapturePhotoURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_originalResourceChoice, 0);
  objc_storeStrong((id *)&self->_livePhoto, 0);
  objc_storeStrong((id *)&self->_fullSizeImageURL, 0);
  objc_storeStrong((id *)&self->_displaySizeImage, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_avAsset, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionHandles, 0);
  objc_storeStrong((id *)&self->_avAssetIsolationQueue, 0);
}

void __43__PHContentEditingInput__invalidateAVAsset__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C89EE8], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
}

void __41__PHContentEditingInput_audiovisualAsset__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[4];
  if (!v3)
  {
    objc_msgSend(v2, "videoURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3C0]), "initWithURL:options:", v4, 0);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 32);
      *(_QWORD *)(v6 + 32) = v5;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__invalidateAVAsset, *MEMORY[0x1E0C89EE8], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

    }
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

void __68__PHContentEditingInput_loadFullSizeImageDataWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a2, 1, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
