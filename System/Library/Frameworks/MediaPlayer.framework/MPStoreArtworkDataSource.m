@implementation MPStoreArtworkDataSource

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return (id)objc_msgSend(a3, "token");
}

- (id)sortedSupportedSizesForCatalog:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;

  v4 = a3;
  objc_msgSend(v4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFittingSize");
  v7 = v6;
  v9 = v8;

  MSVGetMaximumScreenSize();
  v11 = v10;
  v13 = v12;
  v14 = MGGetBoolAnswer();
  v15 = 3384.0;
  if (!v14)
    v15 = v13;
  v16 = 6016.0;
  if (!v14)
    v16 = v11;
  if (v16 >= v15)
    v15 = v16;
  v17 = (uint64_t)v15;
  if (!(uint64_t)v15)
    v17 = 1024;
  -[MPStoreArtworkDataSource _clampImageSize:toMaxSupportedSize:](self, "_clampImageSize:toMaxSupportedSize:", v7, v9, (double)(unint64_t)v17, (double)(unint64_t)v17);
  v19 = v18;
  v21 = v20;
  objc_msgSend(v5, "imageArtworkInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sizeInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "type");
  switch(v24)
  {
    case 2:
      objc_msgSend(v23, "supportedSizes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 1:
      if (objc_msgSend(v23, "hasMaxSupportedSize"))
      {
        objc_msgSend(v23, "maxSupportedSize");
        -[MPStoreArtworkDataSource _clampImageSize:toMaxSupportedSize:](self, "_clampImageSize:toMaxSupportedSize:", v19, v21, v26, v27);
        v19 = v28;
        v21 = v29;
      }
      goto LABEL_16;
    case 0:
LABEL_16:
      v30 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v19, v21);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "arrayWithObject:", v31);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
  }
  v25 = 0;
LABEL_17:

  return v25;
}

- (CGSize)_bestSizeForImageSizeInfo:(id)a3 catalog:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGSize result;

  v6 = a3;
  objc_msgSend(a4, "scaledFittingSize");
  v8 = v7;
  v10 = v9;
  MSVGetMaximumScreenSize();
  v12 = v11;
  v14 = v13;
  v15 = MGGetBoolAnswer();
  v16 = 3384.0;
  if (!v15)
    v16 = v14;
  v17 = 6016.0;
  if (!v15)
    v17 = v12;
  if (v17 >= v16)
    v16 = v17;
  v18 = (uint64_t)v16;
  if (!(uint64_t)v16)
    v18 = 1024;
  -[MPStoreArtworkDataSource _clampImageSize:toMaxSupportedSize:](self, "_clampImageSize:toMaxSupportedSize:", v8, v10, (double)(unint64_t)v18, (double)(unint64_t)v18);
  v20 = v19;
  v22 = v21;
  v23 = objc_msgSend(v6, "type");
  if (v23 == 2)
  {
    objc_msgSend(v6, "supportedSizes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MPArtworkRepresentationBestSizeMatchingSize(v24, v20, v22);
    v22 = v25;

  }
  else if (v23 == 1)
  {
    if (objc_msgSend(v6, "hasMaxSupportedSize"))
    {
      objc_msgSend(v6, "maxSupportedSize");
      -[MPStoreArtworkDataSource _clampImageSize:toMaxSupportedSize:](self, "_clampImageSize:toMaxSupportedSize:", v20, v22, v26, v27);
      v20 = v28;
      v22 = v29;
    }
  }
  else if (v23)
  {
    v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v20 = *MEMORY[0x1E0C9D820];
  }

  v30 = v20;
  v31 = v22;
  result.height = v31;
  result.width = v30;
  return result;
}

- (CGSize)_clampImageSize:(CGSize)a3 toMaxSupportedSize:(CGSize)a4
{
  double width;
  double height;
  CGSize result;

  width = ceil(a3.width);
  height = ceil(a3.height);
  if (width > a4.width + 0.00000011920929)
  {
    height = round(height * (a4.width / width));
    width = a4.width;
  }
  if (height > a4.height + 0.00000011920929)
  {
    width = round(width * (a4.height / height));
    height = a4.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (id)_bestURLForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v7 = a3;
  -[MPStoreArtworkDataSource bestAvailableSizeForCatalog:](self, "bestAvailableSizeForCatalog:", v7);
  v10 = v9;
  v11 = v8;
  if (v9 != *MEMORY[0x1E0C9D820] || v8 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v7, "token");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a4 != 1)
    {
      if (!a4)
      {
        v15 = objc_msgSend(v13, "artworkInfoType");
        if (v15 == 1)
        {
          objc_msgSend(v14, "videoArtworkInfo");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "previewFrameArtworkInfoMatchingAspectRatio:", v10 / v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        if (!v15)
        {
          objc_msgSend(v14, "imageArtworkInfo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
          objc_msgSend(v14, "cropStyle");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "format");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:", v21, v22, MSVDeviceSupportsExtendedColorDisplay(), v10, v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
          goto LABEL_20;
        }
      }
LABEL_14:
      v17 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v18 = objc_msgSend(v7, "preferredVideoFormat");
    if (v18)
    {
      if (v18 != 1)
        goto LABEL_14;
      objc_msgSend(v14, "videoArtworkInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "CRABSVideoURLMatchingSize:", v10, v11);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v14, "videoArtworkInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "HLSVideoURLForAspectRatio:", v10 / v11);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v19;
    goto LABEL_19;
  }
  v17 = 0;
LABEL_21:

  return v17;
}

- (CGSize)bestAvailableSizeForCatalog:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  CGSize result;

  v4 = a3;
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v4, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "artworkInfoType");
  if (v8 == 1)
  {
    objc_msgSend(v4, "fittingSize");
    v14 = v13;
    objc_msgSend(v4, "fittingSize");
    v16 = v14 / v15;
    v17 = objc_msgSend(v4, "preferredVideoFormat");
    if (!v17)
    {
      objc_msgSend(v7, "videoArtworkInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "HLSVideoURLForAspectRatio:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_9;
      objc_msgSend(v7, "videoArtworkInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "previewFrameArtworkInfoMatchingAspectRatio:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "sizeInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPStoreArtworkDataSource _bestSizeForImageSizeInfo:catalog:](self, "_bestSizeForImageSizeInfo:catalog:", v24, v4);
      v5 = v25;
      v6 = v26;

      goto LABEL_8;
    }
    if (v17 == 1)
    {
      objc_msgSend(v7, "videoArtworkInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "supportedSizesForCRABSVideoForAspectRatio:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "scaledFittingSize");
      ICStoreVideoArtworkInfoBestSizesForSize();
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
    objc_msgSend(v7, "imageArtworkInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sizeInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPStoreArtworkDataSource _bestSizeForImageSizeInfo:catalog:](self, "_bestSizeForImageSizeInfo:catalog:", v10, v4);
LABEL_7:
    v5 = v11;
    v6 = v12;
LABEL_8:

  }
LABEL_9:

  v19 = v5;
  v20 = v6;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)requestForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[MPStoreArtworkDataSource _bestURLForCatalog:kind:size:](self, "_bestURLForCatalog:kind:size:", a3, a5.width, a5.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DDBF48], "standardDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isLegacyStoreCacheBusterEnabled");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("buster"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ic_URLByAppendingQueryItems:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v13;
    }
    if (a4 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:cachePolicy:timeoutInterval:", v6, 0, 60.0);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v15 = (void *)v14;
      goto LABEL_10;
    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (BOOL)wantsBackgroundImageDecompression
{
  return 1;
}

+ (MPStoreArtworkDataSource)sharedStoreArtworkDataSource
{
  if (sharedStoreArtworkDataSource_sOnceToken != -1)
    dispatch_once(&sharedStoreArtworkDataSource_sOnceToken, &__block_literal_global_24445);
  return (MPStoreArtworkDataSource *)(id)sharedStoreArtworkDataSource_sSharedStoreArtworkDataSource;
}

void __56__MPStoreArtworkDataSource_sharedStoreArtworkDataSource__block_invoke()
{
  MPStoreArtworkDataSource *v0;
  void *v1;

  v0 = objc_alloc_init(MPStoreArtworkDataSource);
  v1 = (void *)sharedStoreArtworkDataSource_sSharedStoreArtworkDataSource;
  sharedStoreArtworkDataSource_sSharedStoreArtworkDataSource = (uint64_t)v0;

}

- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5
{
  id v8;
  MPMutableArtworkColorAnalysis *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CGColor *v20;
  CGColor *v21;
  CGColor *v22;
  CGColor *v23;
  void *v24;
  void *v25;
  MPArtworkGradientInfo *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  MPArtworkGradientInfo *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  char v45;
  void *v46;
  double v47;
  MPArtworkImageAttachments *v48;
  id v50;
  void *v51;
  void *v52;
  MPMutableArtworkColorAnalysis *v53;
  MPMutableArtworkColorAnalysis *v54;
  objc_super v55;

  v8 = a4;
  v55.receiver = self;
  v55.super_class = (Class)MPStoreArtworkDataSource;
  -[MPAbstractNetworkArtworkDataSource existingArtworkEffectResultForEffectType:catalog:options:](&v55, sel_existingArtworkEffectResultForEffectType_catalog_options_, a3, v8, a5);
  v9 = (MPMutableArtworkColorAnalysis *)objc_claimAutoreleasedReturnValue();
  if (a3 == 4)
  {
    objc_msgSend(v8, "token");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "artworkInfoType");
    if (v14 == 1)
    {
      objc_msgSend(v8, "fittingSize");
      v29 = v28;
      objc_msgSend(v8, "fittingSize");
      v31 = v29 / v30;
      objc_msgSend(v13, "videoArtworkInfo");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "previewFrameArtworkInfoMatchingAspectRatio:", v31);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (v14)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v13, "imageArtworkInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "textGradient");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v12, "imageTraits");
    if (objc_msgSend(v24, "count"))
    {
      v34 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(v24, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "colorWithCGColor:", v35);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = 0;
    }
    objc_msgSend(v12, "gradientInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = [MPArtworkGradientInfo alloc];
      v54 = v9;
      v38 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(v12, "gradientInfo");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "colorWithCGColor:", objc_msgSend(v39, "color"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "gradientInfo");
      v50 = v8;
      v52 = v24;
      v41 = v13;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "y1");
      v44 = v43;
      objc_msgSend(v12, "gradientInfo");
      v45 = v33;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "y2");
      v26 = -[MPArtworkGradientInfo initWithColor:y1:y2:](v37, "initWithColor:y1:y2:", v40, v44, v47);

      v33 = v45;
      v13 = v41;
      v8 = v50;
      v24 = v52;

      v9 = v54;
    }
    else
    {
      v26 = 0;
    }

    if (!v25 && (v33 & 1) == 0 && !v26)
    {
      v25 = 0;
LABEL_39:

      goto LABEL_40;
    }
    v48 = -[MPArtworkImageAttachments initWithTextColor:gradientInfo:hasTitle:]([MPArtworkImageAttachments alloc], "initWithTextColor:gradientInfo:hasTitle:", v25, v26, v33 & 1);
    v27 = v9;
    v9 = (MPMutableArtworkColorAnalysis *)v48;
LABEL_38:

    goto LABEL_39;
  }
  if (a3 == 1)
  {
    objc_msgSend(v8, "token");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "artworkInfoType");
    v51 = v10;
    v53 = v9;
    if (v11 == 1)
    {
      objc_msgSend(v8, "fittingSize");
      v16 = v15;
      objc_msgSend(v8, "fittingSize");
      v18 = v16 / v17;
      objc_msgSend(v10, "videoArtworkInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "previewFrameArtworkInfoMatchingAspectRatio:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (v11)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v10, "imageArtworkInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = (CGColor *)objc_msgSend(v12, "copyColorWithKind:", *MEMORY[0x1E0DDBD88]);
    v21 = (CGColor *)objc_msgSend(v12, "copyColorWithKind:", *MEMORY[0x1E0DDBD90]);
    v22 = (CGColor *)objc_msgSend(v12, "copyColorWithKind:", *MEMORY[0x1E0DDBD98]);
    v23 = (CGColor *)objc_msgSend(v12, "copyColorWithKind:", *MEMORY[0x1E0DDBDA0]);
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        goto LABEL_13;
    }
    else
    {
      v24 = 0;
      if (v21)
      {
LABEL_13:
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          goto LABEL_14;
        goto LABEL_18;
      }
    }
    v25 = 0;
    if (v22)
    {
LABEL_14:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v22);
      v26 = (MPArtworkGradientInfo *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
LABEL_15:
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
        CGColorRelease(v20);
        CGColorRelease(v21);
        CGColorRelease(v22);
        CGColorRelease(v23);
        if (v24 || v25 || v26)
        {
          v9 = objc_alloc_init(MPMutableArtworkColorAnalysis);
          -[MPMutableArtworkColorAnalysis setBackgroundColor:](v9, "setBackgroundColor:", v24);
          -[MPMutableArtworkColorAnalysis setBackgroundColorLight:](v9, "setBackgroundColorLight:", objc_msgSend(v24, "MP_isArtworkColorAnalyzerLightColorForAlgorithm:", 1));
          -[MPMutableArtworkColorAnalysis setPrimaryTextColor:](v9, "setPrimaryTextColor:", v25);
          -[MPMutableArtworkColorAnalysis setPrimaryTextColorLight:](v9, "setPrimaryTextColorLight:", objc_msgSend(v25, "MP_isArtworkColorAnalyzerLightColorForAlgorithm:", 1));
          -[MPMutableArtworkColorAnalysis setSecondaryTextColor:](v9, "setSecondaryTextColor:", v26);
          -[MPMutableArtworkColorAnalysis setSecondaryTextColorLight:](v9, "setSecondaryTextColorLight:", -[MPArtworkGradientInfo MP_isArtworkColorAnalyzerLightColorForAlgorithm:](v26, "MP_isArtworkColorAnalyzerLightColorForAlgorithm:", 1));
          -[MPMutableArtworkColorAnalysis setTertiaryTextColor:](v9, "setTertiaryTextColor:", v27);
          -[MPMutableArtworkColorAnalysis setTertiaryTextColorLight:](v9, "setTertiaryTextColorLight:", objc_msgSend(v27, "MP_isArtworkColorAnalyzerLightColorForAlgorithm:", 1));

          v13 = v51;
        }
        else
        {
          v25 = 0;
          v24 = 0;
          v13 = v51;
          v9 = v53;
        }
        goto LABEL_38;
      }
LABEL_19:
      v27 = 0;
      goto LABEL_20;
    }
LABEL_18:
    v26 = 0;
    if (v23)
      goto LABEL_15;
    goto LABEL_19;
  }
LABEL_40:

  return v9;
}

- (BOOL)hasExportableArtworkPropertiesForCatalog:(id)a3
{
  return -[MPStoreArtworkDataSource areRepresentationsOfKind:availableForCatalog:](self, "areRepresentationsOfKind:availableForCatalog:", 0, a3);
}

- (void)getExportableArtworkPropertiesForCatalog:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, MPExportableArtworkProperties *, void *);
  MPExportableArtworkProperties *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = (void (**)(id, MPExportableArtworkProperties *, void *))a4;
  v7 = objc_alloc_init(MPExportableArtworkProperties);
  objc_msgSend(v19, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageArtworkInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "responseArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "responseArray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "responseDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(v9, "responseDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayWithObject:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[MPExportableArtworkProperties setArtworkTemplateItems:](v7, "setArtworkTemplateItems:", v11);
  objc_msgSend(v19, "fittingSize");
  -[MPStoreArtworkDataSource _bestURLForCatalog:kind:size:](self, "_bestURLForCatalog:kind:size:", v19, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPExportableArtworkProperties setResolvedURLString:](v7, "setResolvedURLString:", v15);

  -[MPExportableArtworkProperties artworkTemplateItems](v7, "artworkTemplateItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

  }
  else
  {
    -[MPExportableArtworkProperties resolvedURLString](v7, "resolvedURLString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPErrorDomain"), 4, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  v18 = 0;
  if (v6)
LABEL_9:
    v6[2](v6, v7, v18);
LABEL_10:

}

- (BOOL)areRepresentationsOfKind:(int64_t)a3 availableForCatalog:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  objc_msgSend(a4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 1)
  {
    objc_msgSend(v5, "videoArtworkInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "imageArtworkInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7 != 0;

LABEL_7:
  return v8;
}

@end
