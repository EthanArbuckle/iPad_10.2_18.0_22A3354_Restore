@implementation _NTKPhotosPhotoFaceUpgradeItemContext

- (_NTKPhotosPhotoFaceUpgradeItemContext)initWithPhoto:(id)a3 timeAlignment:(int64_t)a4
{
  id v7;
  _NTKPhotosPhotoFaceUpgradeItemContext *v8;
  _NTKPhotosPhotoFaceUpgradeItemContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NTKPhotosPhotoFaceUpgradeItemContext;
  v8 = -[_NTKPhotosPhotoFaceUpgradeItemContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photo, a3);
    v9->_timeAlignment = a4;
  }

  return v9;
}

- (NSString)localIdentifier
{
  return -[NTKPhoto localIdentifier](self->_photo, "localIdentifier");
}

- (NSDate)modificationDate
{
  return -[NTKPhoto modificationDate](self->_photo, "modificationDate");
}

- (CGRect)originalCrop
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSURL)imageURL
{
  return -[NTKPhoto imageURL](self->_photo, "imageURL");
}

- (NSURL)maskURL
{
  return 0;
}

- (int64_t)timeAlignment
{
  return self->_timeAlignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
}

@end
