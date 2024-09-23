@implementation MKTransitArtworkManager

+ (id)sharedInstance
{
  if (qword_1ECE2D920 != -1)
    dispatch_once(&qword_1ECE2D920, &__block_literal_global_23);
  return (id)_MergedGlobals_135;
}

void __41__MKTransitArtworkManager_sharedInstance__block_invoke()
{
  MKTransitArtworkManager *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [MKTransitArtworkManager alloc];
  objc_msgSend(MEMORY[0x1E0DC6500], "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[MKTransitArtworkManager initWithIconManager:](v0, "initWithIconManager:", v3);
  v2 = (void *)_MergedGlobals_135;
  _MergedGlobals_135 = v1;

}

- (MKTransitArtworkManager)initWithIconManager:(id)a3
{
  id v5;
  MKTransitArtworkManager *v6;
  MKTransitArtworkManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKTransitArtworkManager;
  v6 = -[MKTransitArtworkManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_iconManager, a3);

  return v7;
}

- (void)purge
{
  id v2;

  -[MKTransitArtworkManager iconManager](self, "iconManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purge");

}

- (BOOL)_isMemoryConstrained
{
  void *v3;
  void *v4;
  int v5;

  -[MKTransitArtworkManager iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MKTransitArtworkManager iconManager](self, "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCachingAtlases") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_vkImageWithShieldDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 widthPaddingMultiple:(double)a8
{
  _BOOL4 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;

  v8 = a7;
  v12 = a3;
  v13 = objc_alloc_init(MEMORY[0x1E0DC6508]);
  objc_msgSend(v12, "shieldText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v14);

  objc_msgSend(v12, "shieldColorString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  VKShieldColorsFromHexString();
  objc_msgSend(v13, "setTransitLineColor:");

  if (v8)
  {
    -[MKTransitArtworkManager iconManager](self, "iconManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setVariant:", objc_msgSend(v16, "darkVariant"));

  }
  -[MKTransitArtworkManager iconManager](self, "iconManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v12, "shieldType");
  objc_msgSend(v12, "shieldText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v20 = a6;
  objc_msgSend(v17, "imageForDataID:text:contentScale:sizeGroup:modifiers:", v18, v19, a4, v13, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)transitArtworkImageWithShieldDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7
{
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  int64_t v18;
  unint64_t v19;
  double v20;
  BOOL v21;

  v12 = a3;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __100__MKTransitArtworkManager_transitArtworkImageWithShieldDataSource_size_featureType_scale_nightMode___block_invoke;
  v16[3] = &unk_1E20D9730;
  v16[4] = self;
  v17 = v12;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v13 = v12;
  -[MKTransitArtworkManager _createImageWithBlockInAutoreleasePoolIfNeeded:](self, "_createImageWithBlockInAutoreleasePoolIfNeeded:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __100__MKTransitArtworkManager_transitArtworkImageWithShieldDataSource_size_featureType_scale_nightMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_vkImageWithShieldDataSource:size:featureType:scale:nightMode:widthPaddingMultiple:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 64), 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_imageFroMVKImage:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)transitArtworkImageWithDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7
{
  return -[MKTransitArtworkManager transitArtworkImageWithDataSource:size:featureType:scale:nightMode:withWidthPaddingMultiple:](self, "transitArtworkImageWithDataSource:size:featureType:scale:nightMode:withWidthPaddingMultiple:", a3, a4, a5, a7, a6, 1.0);
}

- (id)transitArtworkImageWithDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 withWidthPaddingMultiple:(double)a8
{
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  int64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  BOOL v24;

  v14 = a3;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __119__MKTransitArtworkManager_transitArtworkImageWithDataSource_size_featureType_scale_nightMode_withWidthPaddingMultiple___block_invoke;
  v18[3] = &unk_1E20D9758;
  v18[4] = self;
  v19 = v14;
  v20 = a4;
  v21 = a5;
  v24 = a7;
  v22 = a6;
  v23 = a8;
  v15 = v14;
  -[MKTransitArtworkManager _createImageWithBlockInAutoreleasePoolIfNeeded:](self, "_createImageWithBlockInAutoreleasePoolIfNeeded:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __119__MKTransitArtworkManager_transitArtworkImageWithDataSource_size_featureType_scale_nightMode_withWidthPaddingMultiple___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_imageWithDataSource:size:featureType:scale:nightMode:withWidthPaddingMultiple:fullBleedColor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), 0, *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_imageFroMVKImage:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_imageWithDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 withWidthPaddingMultiple:(double)a8 fullBleedColor:(id *)a9
{
  _BOOL8 v11;
  id v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  id v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  id v42;

  v11 = a7;
  v16 = a3;
  v17 = objc_msgSend(v16, "artworkSourceType");
  if (v17 == 2)
  {
    objc_msgSend(v16, "iconDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v18, "iconType");
    if (v22 == 1)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v37 = objc_msgSend(v18, "iconAttributeKey");
        v38 = objc_msgSend(v18, "iconAttributeValue");
        v34 = objc_alloc_init(MEMORY[0x1E0DC6508]);
        if (v11)
        {
          -[MKTransitArtworkManager iconManager](self, "iconManager");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setVariant:", objc_msgSend(v39, "darkVariant"));

        }
        -[MKTransitArtworkManager iconManager](self, "iconManager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v41 = a6;
        objc_msgSend(v40, "imageForKey:value:contentScale:sizeGroup:modifiers:", v37, v38, a4, v34, v41);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
    }
    else if (!v22 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[MKTransitArtworkManager iconManager](self, "iconManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitArtworkManager iconManager](self, "iconManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "styleAttributeTransitSystemTypeKey");
      v26 = objc_msgSend(v18, "cartoID");
      v27 = a6;
      *(float *)&v28 = v27;
      objc_msgSend(v23, "imageForKey:value:contentScale:sizeGroup:modifiers:", v25, v26, a4, 0, v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        goto LABEL_23;
      -[MKTransitArtworkManager iconManager](self, "iconManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKTransitArtworkManager iconManager](self, "iconManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "styleAttributeTransitTypeKey");
      v32 = objc_msgSend(v18, "defaultTransitType");
      *(float *)&v33 = a6;
      objc_msgSend(v29, "imageForKey:value:contentScale:sizeGroup:modifiers:", v31, v32, a4, 0, v33);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
LABEL_23:
        if (a9 && v21)
        {
          if (objc_msgSend(v21, "calloutFillColor"))
          {
            objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", objc_msgSend(v21, "calloutFillColor"));
            v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a9 = v42;

          }
          else
          {
            *a9 = 0;
          }
        }
        goto LABEL_28;
      }
      objc_msgSend(v16, "iconFallbackShieldDataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v16, "iconFallbackShieldDataSource");
        v34 = (id)objc_claimAutoreleasedReturnValue();
        v35 = round(a6 * a8);
        v36 = 1.0;
        if (a8 > 1.0)
          v36 = v35;
        -[MKTransitArtworkManager _vkImageWithShieldDataSource:size:featureType:scale:nightMode:widthPaddingMultiple:](self, "_vkImageWithShieldDataSource:size:featureType:scale:nightMode:widthPaddingMultiple:", v34, a4, a5, v11, a6, v36);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

        goto LABEL_23;
      }
LABEL_28:

      goto LABEL_29;
    }
    v21 = 0;
    goto LABEL_28;
  }
  if (v17 == 1)
  {
    objc_msgSend(v16, "shieldDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = round(a6 * a8);
    v20 = 1.0;
    if (a8 > 1.0)
      v20 = v19;
    -[MKTransitArtworkManager _vkImageWithShieldDataSource:size:featureType:scale:nightMode:widthPaddingMultiple:](self, "_vkImageWithShieldDataSource:size:featureType:scale:nightMode:widthPaddingMultiple:", v18, a4, a5, v11, a6, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v21 = 0;
LABEL_29:

  return v21;
}

- (id)transitArtworkImageWithDataSource:(id)a3 size:(int64_t)a4 featureType:(unint64_t)a5 scale:(double)a6 nightMode:(BOOL)a7 withWidthPaddingMultiple:(double)a8 fullBleedColor:(id *)a9
{
  void *v10;
  void *v11;

  -[MKTransitArtworkManager _imageWithDataSource:size:featureType:scale:nightMode:withWidthPaddingMultiple:fullBleedColor:](self, "_imageWithDataSource:size:featureType:scale:nightMode:withWidthPaddingMultiple:fullBleedColor:", a3, a4, a5, a7, a9, a6, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitArtworkManager _imageFroMVKImage:](self, "_imageFroMVKImage:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_createImageWithBlockInAutoreleasePoolIfNeeded:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;

  v4 = (void (**)(_QWORD))a3;
  if (-[MKTransitArtworkManager _isMemoryConstrained](self, "_isMemoryConstrained"))
  {
    v5 = (void *)MEMORY[0x18D778BE4]();
    v4[2](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v4[2](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_imageFroMVKImage:(id)a3
{
  id v4;
  CGImage *v5;
  CGFloat Width;
  CGFloat Height;
  CGColorSpace *DeviceRGB;
  size_t AlignedBytesPerRow;
  CGContext *v10;
  CGImage *Image;
  void *v12;
  float v13;
  void *v14;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  if (-[MKTransitArtworkManager _isMemoryConstrained](self, "_isMemoryConstrained"))
  {
    v5 = CGImageRetain((CGImageRef)objc_msgSend(v4, "image"));
    Width = (double)CGImageGetWidth(v5);
    Height = (double)CGImageGetHeight(v5);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    v10 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.width = Width;
    v16.size.height = Height;
    CGContextClearRect(v10, v16);
    v17.origin.x = 0.0;
    v17.origin.y = 0.0;
    v17.size.width = Width;
    v17.size.height = Height;
    CGContextDrawImage(v10, v17, v5);
    Image = CGBitmapContextCreateImage(v10);
    v12 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v4, "contentScale");
    objc_msgSend(v12, "imageWithCGImage:scale:orientation:", Image, 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v5);
    CGImageRelease(Image);
    CGColorSpaceRelease(DeviceRGB);
    CGContextRelease(v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageFromVKImage:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (VKIconManager)iconManager
{
  return self->_iconManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconManager, 0);
}

@end
