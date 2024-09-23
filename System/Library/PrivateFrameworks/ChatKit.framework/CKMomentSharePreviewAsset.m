@implementation CKMomentSharePreviewAsset

- (CKMomentSharePreviewAsset)init
{
  abort();
}

- (CKMomentSharePreviewAsset)initWithConfiguration:(id)a3
{
  id v3;

  v3 = a3;
  abort();
}

- (CKMomentSharePreviewAsset)initWithMomentShare:(id)a3
{
  id v5;
  CKMomentSharePreviewAsset *v6;
  CKMomentSharePreviewAsset *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKMomentSharePreviewAsset;
  v6 = -[CKMomentSharePreviewAsset initWithConfiguration:](&v9, sel_initWithConfiguration_, &__block_literal_global_128);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_momentShare, a3);

  return v7;
}

- (Class)defaultImageProviderClass
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Implemented by subclasses"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (int64_t)isContentEqualTo:(id)a3
{
  id v4;
  PHMomentShare *momentShare;
  void *v6;
  int64_t v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    momentShare = self->_momentShare;
    objc_msgSend(v4, "momentShare");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(momentShare) = -[PHMomentShare isEqual:](momentShare, "isEqual:", v6);

    if ((_DWORD)momentShare)
      v7 = 2;
    else
      v7 = 1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)isPreviewImageDataAvailable
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  -[PHMomentShare preview](self->_momentShare, "preview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[PHMomentShare preview](self->_momentShare, "preview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewImageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8 != 0;

  }
  return v5;
}

- (NSData)previewImageData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[PHMomentShare preview](self->_momentShare, "preview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[PHMomentShare preview](self->_momentShare, "preview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "thumbnailImageData");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSData *)v7;
}

- (UIImage)previewImage
{
  id v3;
  void *v4;
  UIImage *v5;
  UIImage *cachedImage;

  if (!self->_cachedImage
    && -[CKMomentSharePreviewAsset isPreviewImageDataAvailable](self, "isPreviewImageDataAvailable"))
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA638]);
    -[CKMomentSharePreviewAsset previewImageData](self, "previewImageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIImage *)objc_msgSend(v3, "initWithData:", v4);
    cachedImage = self->_cachedImage;
    self->_cachedImage = v5;

  }
  return self->_cachedImage;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[CKMomentSharePreviewAsset bestCropRectForAspectRatio:verticalContentMode:cropMode:](self, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 0, 3, a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)size
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CKMomentSharePreviewAsset previewImage](self, "previewImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)aspectRatio
{
  double v2;
  double v3;
  double result;

  -[CKMomentSharePreviewAsset size](self, "size");
  result = v2 / v3;
  if (v3 <= 0.0)
    return 1.0;
  return result;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3 verticalContentMode:(int64_t)a4 cropMode:(int64_t)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  BOOL IsEmpty;
  double *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  -[CKMomentSharePreviewAsset aspectRatio](self, "aspectRatio", a4, a5);
  if (PXFloatApproximatelyEqualToFloat())
  {
    v6 = *MEMORY[0x1E0D7C730];
    v7 = *(double *)(MEMORY[0x1E0D7C730] + 8);
    v8 = *(double *)(MEMORY[0x1E0D7C730] + 16);
    v9 = *(double *)(MEMORY[0x1E0D7C730] + 24);
  }
  else
  {
    -[CKMomentSharePreviewAsset size](self, "size");
    v11 = v10;
    v13 = v12;
    -[PHMomentShare preview](self->_momentShare, "preview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cropRect");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v33.origin.x = v16;
    v33.origin.y = v18;
    v33.size.width = v20;
    v33.size.height = v22;
    IsEmpty = CGRectIsEmpty(v33);
    v24 = (double *)MEMORY[0x1E0D7C730];
    if (IsEmpty)
    {
      v25 = *MEMORY[0x1E0C9D648];
      v26 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v27 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      PXRectFlippedVertically();
      PXRectFlippedVertically();
      PXLargestSalientAspectFilledCropRect();
      v25 = v29;
      v26 = v30;
      v27 = v31;
      v28 = v32;
    }
    v34.origin.x = v25;
    v34.origin.y = v26;
    v34.size.width = v27;
    v34.size.height = v28;
    if (CGRectIsEmpty(v34)
      || (v35.origin.x = 0.0, v35.origin.y = 0.0, v35.size.width = v11, v35.size.height = v13, CGRectIsEmpty(v35)))
    {
      v6 = *v24;
      v7 = v24[1];
      v8 = v24[2];
      v9 = v24[3];
    }
    else
    {
      PXRectNormalize();
    }
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
}

@end
