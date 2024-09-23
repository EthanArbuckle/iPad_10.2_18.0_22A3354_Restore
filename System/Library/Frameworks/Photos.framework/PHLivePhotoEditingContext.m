@implementation PHLivePhotoEditingContext

- (PHLivePhotoEditingContext)init
{

  return 0;
}

- (PHLivePhotoEditingContext)initWithLivePhotoEditingInput:(PHContentEditingInput *)livePhotoInput
{
  PHContentEditingInput *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  PFLivePhotoEditSession *v10;
  PFLivePhotoEditSession *editSession;
  __int128 v13;
  uint64_t v14;
  objc_super v15;
  __int128 v16;
  uint64_t v17;

  v4 = livePhotoInput;
  -[PHContentEditingInput livePhoto](v4, "livePhoto");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0uLL;
  v17 = 0;
  if (v5)
    objc_msgSend(v5, "photoTime");
  if (-[PHContentEditingInput mediaSubtypes](v4, "mediaSubtypes") == 8
    && -[PHContentEditingInput playbackStyle](v4, "playbackStyle") == 5)
  {
    v16 = *MEMORY[0x1E0CA2E68];
    v17 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  }
  if (v5)
  {
    if (v6)
    {
      if (v7)
      {
        if ((BYTE12(v16) & 1) != 0)
        {
          v15.receiver = self;
          v15.super_class = (Class)PHLivePhotoEditingContext;
          self = -[PHLivePhotoEditingContext init](&v15, sel_init);
          if (self)
          {
            v8 = objc_alloc(MEMORY[0x1E0D75118]);
            v9 = -[PHContentEditingInput fullSizeImageOrientation](v4, "fullSizeImageOrientation");
            v13 = v16;
            v14 = v17;
            v10 = (PFLivePhotoEditSession *)objc_msgSend(v8, "initWithPhotoURL:videoURL:photoTime:photoOrientation:", v6, v7, &v13, v9);
            editSession = self->_editSession;
            self->_editSession = v10;

          }
        }
      }
    }
  }

  return self;
}

- (CIImage)fullSizeImage
{
  return (CIImage *)-[PFLivePhotoEditSession inputImage](self->_editSession, "inputImage");
}

- (CMTime)duration
{
  CMTime *result;

  result = (CMTime *)self->_editSession;
  if (result)
    return (CMTime *)-[CMTime duration](result, "duration");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CMTime)photoTime
{
  CMTime *result;

  result = (CMTime *)self->_editSession;
  if (result)
    return (CMTime *)-[CMTime photoTime](result, "photoTime");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (PHLivePhotoFrameProcessingBlock)frameProcessor
{
  return (PHLivePhotoFrameProcessingBlock)-[PFLivePhotoEditSession frameProcessor](self->_editSession, "frameProcessor");
}

- (void)setFrameProcessor:(PHLivePhotoFrameProcessingBlock)frameProcessor
{
  -[PFLivePhotoEditSession setFrameProcessor:](self->_editSession, "setFrameProcessor:", frameProcessor);
}

- (float)audioVolume
{
  float result;

  -[PFLivePhotoEditSession audioVolume](self->_editSession, "audioVolume");
  return result;
}

- (void)setAudioVolume:(float)audioVolume
{
  -[PFLivePhotoEditSession setAudioVolume:](self->_editSession, "setAudioVolume:");
}

- (CGImagePropertyOrientation)orientation
{
  return -[PFLivePhotoEditSession orientation](self->_editSession, "orientation");
}

- (void)prepareLivePhotoForPlaybackWithTargetSize:(CGSize)targetSize options:(NSDictionary *)options completionHandler:(void *)handler
{
  double height;
  double width;
  id v9;
  PFLivePhotoEditSession *editSession;
  id v11;
  _QWORD v12[5];
  id v13;

  height = targetSize.height;
  width = targetSize.width;
  v9 = handler;
  editSession = self->_editSession;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__PHLivePhotoEditingContext_prepareLivePhotoForPlaybackWithTargetSize_options_completionHandler___block_invoke;
  v12[3] = &unk_1E35DF030;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  -[PFLivePhotoEditSession prepareForPlaybackWithTargetSize:options:completionHandler:](editSession, "prepareForPlaybackWithTargetSize:options:completionHandler:", options, v12, width, height);

}

- (void)saveLivePhotoToOutput:(PHContentEditingOutput *)output options:(NSDictionary *)options completionHandler:(void *)handler
{
  PHContentEditingOutput *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PFLivePhotoEditSession *editSession;
  _QWORD v16[4];
  id v17;

  v8 = output;
  v9 = options;
  v10 = handler;
  if (self->_editSession)
  {
    if (-[PHContentEditingOutput isLoopingLivePhoto](v8, "isLoopingLivePhoto"))
    {
      -[PHContentEditingOutput renderURLWithExtensionForMediaType:](v8, "renderURLWithExtensionForMediaType:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingOutput renderedContentURL](v8, "renderedContentURL");
    }
    else
    {
      -[PHContentEditingOutput renderedContentURL](v8, "renderedContentURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHContentEditingOutput renderedVideoComplementContentURL](v8, "renderedVideoComplementContentURL");
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D75120], "destinationWithPhotoURL:videoURL:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    editSession = self->_editSession;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__PHLivePhotoEditingContext_saveLivePhotoToOutput_options_completionHandler___block_invoke;
    v16[3] = &unk_1E35DF058;
    v17 = v10;
    -[PFLivePhotoEditSession exportToDestination:options:completionHandler:](editSession, "exportToDestination:options:completionHandler:", v14, v9, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v10 + 2))(v10, 0, v12);

  }
}

- (void)cancel
{
  -[PFLivePhotoEditSession cancel](self->_editSession, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editSession, 0);
}

uint64_t __77__PHLivePhotoEditingContext_saveLivePhotoToOutput_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__PHLivePhotoEditingContext_prepareLivePhotoForPlaybackWithTargetSize_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  PHLivePhoto *v15;
  uint64_t v16;
  PHLivePhoto *v17;
  uint64_t v18;
  double v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "errorWithUnderlyingError:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "videoAsset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0uLL;
    v23 = 0;
    objc_msgSend(v7, "photoTime");
    objc_msgSend(v8, "videoComposition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v8, "audioVolume");
      v14 = v13;
    }
    else
    {
      v14 = 1.0;
    }
    objc_msgSend(v7, "photoExifOrientation");
    v16 = PLImageOrientationFromExifOrientation();
    v17 = [PHLivePhoto alloc];
    v18 = objc_msgSend(v7, "photo");
    v20 = v22;
    v21 = v23;
    v15 = -[PHLivePhoto initWithImage:uiOrientation:videoAsset:photoTime:asset:options:videoComposition:](v17, "initWithImage:uiOrientation:videoAsset:photoTime:asset:options:videoComposition:", v18, v16, v11, &v20, 0, 0, v12);
    *(float *)&v19 = v14;
    -[PHLivePhoto setAudioVolume:](v15, "setAudioVolume:", v19);

  }
  else
  {
    v15 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)errorWithUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D75420]))
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == 3)
        v7 = 3072;
      else
        v7 = -1;
    }
    else
    {

      v7 = -1;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
