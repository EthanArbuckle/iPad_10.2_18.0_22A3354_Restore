@implementation PHPTPConversionSourceHints

- (PHPTPConversionSourceHints)initWithPTPAsset:(id)a3 isVideo:(BOOL)a4 isRender:(BOOL)a5
{
  id v8;
  PHPTPConversionSourceHints *v9;
  PHPTPConversionSourceHints *v10;
  uint64_t v11;
  UTType *livePhotoImageContentType;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHPTPConversionSourceHints;
  v9 = -[PHPTPConversionSourceHints init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_isVideo = a4;
    v9->_isRender = a5;
    if (objc_msgSend(v8, "isPhoto"))
    {
      if (objc_msgSend(v8, "isPartOfLivePhoto"))
      {
        v10->_isLivePhoto = 1;
        objc_msgSend(v8, "contentType");
        v11 = objc_claimAutoreleasedReturnValue();
        livePhotoImageContentType = v10->_livePhotoImageContentType;
        v10->_livePhotoImageContentType = (UTType *)v11;

      }
    }
  }

  return v10;
}

- (BOOL)livePhotoImageIsHEIC
{
  return self->_isLivePhoto
      && -[UTType conformsToType:](self->_livePhotoImageContentType, "conformsToType:", *MEMORY[0x1E0CEC508]);
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)isRender
{
  return self->_isRender;
}

- (BOOL)isLivePhoto
{
  return self->_isLivePhoto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhotoImageContentType, 0);
}

+ (id)hintsForPTPAsset:(id)a3 isVideo:(BOOL)a4 isRender:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPTPAsset:isVideo:isRender:", v8, v6, v5);

  return v9;
}

@end
