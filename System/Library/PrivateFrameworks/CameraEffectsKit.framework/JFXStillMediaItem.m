@implementation JFXStillMediaItem

+ (void)stillMediaItemWithLocalURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___JFXStillMediaItem;
  v10 = a3;
  v11 = objc_msgSendSuper2(&v14, sel_alloc);
  v12 = (void *)objc_msgSend(v11, "initWithURL:", v10, v14.receiver, v14.super_class);

  if (v12)
  {
    objc_msgSend(v12, "setDelegate:", v8);
    objc_msgSend(v12, "setMediaState:", 0);
    objc_msgSend(v12, "setMediaLoadState:", 0);
    objc_msgSend(v12, "commonInit");
    objc_msgSend(v12, "checkIfAssetIsMissing");
    objc_msgSend(v12, "updateAssetImageColorSpace");
    objc_msgSend(v12, "setMediaLoadState:", 1);
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mediaItemDidLoad:error:", v12, 0);

    v9[2](v9, v12, 0);
  }

}

- (void)commonInit
{
  double v3;

  -[JFXMediaItem setMediaType:](self, "setMediaType:", 2);
  -[JFXMediaItem setMediaLoadState:](self, "setMediaLoadState:", 0);
  -[JFXStillMediaItem setSourceImageSize:](self, "setSourceImageSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  LODWORD(v3) = -1.0;
  -[JFXStillMediaItem setMeteorPlusHeadroom:](self, "setMeteorPlusHeadroom:", v3);
  -[JFXStillMediaItem setHasGainMap:](self, "setHasGainMap:", 0);
}

- (void)generateLocalURLForAsset
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  -[JFXMediaItem delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaItemWillLoad:", self);

  -[JFXMediaItem setMediaLoadState:](self, "setMediaLoadState:", 0);
  v4 = objc_alloc_init(MEMORY[0x24BDE3528]);
  objc_msgSend(v4, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v4, "setCanHandleAdjustmentData:", &__block_literal_global_47);
  -[JTAssetMediaItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__JFXStillMediaItem_generateLocalURLForAsset__block_invoke_2;
  v6[3] = &unk_24EE5AD38;
  v6[4] = self;
  objc_msgSend(v5, "requestContentEditingInputWithOptions:completionHandler:", v4, v6);

}

uint64_t __45__JFXStillMediaItem_generateLocalURLForAsset__block_invoke()
{
  return 1;
}

void __45__JFXStillMediaItem_generateLocalURLForAsset__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__JFXStillMediaItem_generateLocalURLForAsset__block_invoke_3;
  v7[3] = &unk_24EE57AA8;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __45__JFXStillMediaItem_generateLocalURLForAsset__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "fullSizeImageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("JTPhotoAsset://%@"), v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setAssetLocalURL:", v5);

  objc_msgSend(*(id *)(a1 + 40), "updateAssetImageColorSpace");
  objc_msgSend(*(id *)(a1 + 40), "setMediaLoadState:", 1);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItemDidLoad:error:", *(_QWORD *)(a1 + 40), 0);

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXStillMediaItem;
  -[JTAssetMediaItem description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JFXStillMediaItem;
  v4 = -[JTAssetMediaItem copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[JFXStillMediaItem sourceImageSize](self, "sourceImageSize");
  objc_msgSend(v4, "setSourceImageSize:");
  -[JFXStillMediaItem imageColorSpace](self, "imageColorSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageColorSpace:", v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JFXStillMediaItem;
  return -[JTAssetMediaItem isEqual:](&v4, sel_isEqual_, a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXStillMediaItem;
  return -[JTAssetMediaItem hash](&v3, sel_hash);
}

- (BOOL)canBeAddedToSequence
{
  return 1;
}

- (int)durationAt30fps
{
  return 54000;
}

- (CGSize)imageSizeForRenderingIntent:(int)a3 originalSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  if (a3)
    -[JFXStillMediaItem exportImageSize:](self, "exportImageSize:", a4.width, a4.height);
  else
    -[JFXStillMediaItem playBackImageSize:](self, "playBackImageSize:", a4.width, a4.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGImage)imageForURL:(id)a3 renderingIntent:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CGImage *v16;
  double v18;
  double v19;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v30;
  unint64_t v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__20;
  v44 = __Block_byref_object_dispose__20;
  -[JFXStillMediaItem assetURL](self, "assetURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isFileURL") & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDF6AC8];
    -[JFXStillMediaItem assetURL](self, "assetURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithContentsOfFile:", v10);
    v45 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v45 = 0;
  }

  if (-[JFXMediaItem mediaState](self, "mediaState") == 2 || -[JFXMediaItem mediaState](self, "mediaState") == 3)
  {
    -[JFXStillMediaItem setSourceImageSize:](self, "setSourceImageSize:", 1080.0, 1080.0);
    v11 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[JFXStillMediaItem sizeForQuality:](self, "sizeForQuality:", v4);
    objc_msgSend(v11, "imageWithColor:andSize:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v41[5];
    v41[5] = v13;

LABEL_7:
    goto LABEL_8;
  }
  if (!v41[5])
  {
    v12 = objc_alloc_init(MEMORY[0x24BDE3598]);
    objc_msgSend(v12, "setResizeMode:", 2);
    objc_msgSend(v12, "setVersion:", 0);
    objc_msgSend(v12, "setNetworkAccessAllowed:", 0);
    objc_msgSend(v12, "setSynchronous:", 1);
    -[JFXStillMediaItem sourceImageSize](self, "sourceImageSize");
    if (v29 == *MEMORY[0x24BDBF148] && v28 == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      -[JTAssetMediaItem asset](self, "asset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "pixelWidth");
      -[JTAssetMediaItem asset](self, "asset");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXStillMediaItem setSourceImageSize:](self, "setSourceImageSize:", (double)v31, (double)(unint64_t)objc_msgSend(v32, "pixelHeight"));

    }
    -[JFXStillMediaItem sourceImageSize](self, "sourceImageSize");
    -[JFXStillMediaItem imageSizeForRenderingIntent:originalSize:](self, "imageSizeForRenderingIntent:originalSize:", v4);
    v34 = v33;
    v36 = v35;
    objc_msgSend(MEMORY[0x24BDE3590], "defaultManager");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[JTAssetMediaItem asset](self, "asset");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __49__JFXStillMediaItem_imageForURL_renderingIntent___block_invoke;
    v39[3] = &unk_24EE5AD60;
    v39[4] = &v40;
    objc_msgSend(v37, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v38, 0, v12, v39, v34, v36);

    goto LABEL_7;
  }
  -[JFXStillMediaItem sourceImageSize](self, "sourceImageSize");
  if (v19 == *MEMORY[0x24BDBF148] && v18 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend((id)v41[5], "size");
    -[JFXStillMediaItem setSourceImageSize:](self, "setSourceImageSize:");
  }
  -[JFXStillMediaItem sourceImageSize](self, "sourceImageSize");
  -[JFXStillMediaItem imageSizeForRenderingIntent:originalSize:](self, "imageSizeForRenderingIntent:originalSize:", v4);
  v22 = v21;
  v24 = v23;
  -[JFXStillMediaItem sourceImageSize](self, "sourceImageSize");
  if (v26 != v22 || v25 != v24 || objc_msgSend((id)v41[5], "imageOrientation"))
  {
    objc_msgSend((id)v41[5], "scaledImageEqualOrSmallerThanSize:maintainAspectRatio:normalizeOrientation:", 1, 1, v22, v24);
    v27 = objc_claimAutoreleasedReturnValue();
    v12 = (id)v41[5];
    v41[5] = v27;
    goto LABEL_7;
  }
LABEL_8:
  v15 = (void *)v41[5];
  if (v15)
  {
    v16 = (CGImage *)objc_msgSend(objc_retainAutorelease(v15), "CGImage");
    CGImageRetain(v16);
  }
  else
  {
    v16 = 0;
  }
  _Block_object_dispose(&v40, 8);

  return v16;
}

void __49__JFXStillMediaItem_imageForURL_renderingIntent___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (CGImage)imageForURL:(id)a3 renderingIntent:(int)a4 useAuxillaryMap:(BOOL)a5
{
  void *v5;
  void *v6;
  const __CFURL *v7;
  CGImageSource *v8;
  CGImage *ImageAtIndex;

  if (!a5)
    return -[JFXStillMediaItem imageForURL:renderingIntent:](self, "imageForURL:renderingIntent:", a3, *(_QWORD *)&a4);
  v5 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  v8 = CGImageSourceCreateWithURL(v7, 0);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, (CFDictionaryRef)&unk_24EE9C5A8);

  return ImageAtIndex;
}

- (BOOL)isImageValid:(id)a3 renderingIntent:(int)a4 size:(CGSize *)a5
{
  if (a3 && a5)
    *a5 = *(CGSize *)MEMORY[0x24BDBF148];
  return a3 != 0;
}

- (CGImage)hdrGainMapImageForURL:(id)a3 renderingIntent:(int)a4
{
  void *v4;
  void *v5;
  const __CFURL *v6;
  CGImage *GainMapImageRefFromAssetURL;

  v4 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v5);
  v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  GainMapImageRefFromAssetURL = (CGImage *)createGainMapImageRefFromAssetURL(v6);
  return GainMapImageRefFromAssetURL;
}

- (double)JT_maximumPixelsForStillImage:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _BOOL4 v11;

  v3 = a3;
  if (JT_maximumPixelsForStillImage__onceToken != -1)
  {
    dispatch_once(&JT_maximumPixelsForStillImage__onceToken, &__block_literal_global_23_2);
    if (v3)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "jfx_memorySize") > 1610612736;

    v9 = dbl_226AB77A0[v11];
    return v9 * (v9 / 1.33333333);
  }
  if (!a3)
    goto LABEL_10;
LABEL_3:
  if (JT_maximumPixelsForStillImage__increasePlaybackQuality)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "jfx_memorySize");

    if (v5 <= 1610612736)
      v6 = 640.0;
    else
      v6 = 1080.0;
  }
  else
  {
    v6 = 640.0;
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v6 * v8;

  return v9 * (v9 / 1.33333333);
}

void __51__JFXStillMediaItem_JT_maximumPixelsForStillImage___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  JT_maximumPixelsForStillImage__increasePlaybackQuality = objc_msgSend(v0, "BOOLForKey:", CFSTR("lowPlaybackQuality")) ^ 1;

}

- (CGSize)sizeForMaxPixels:(double)a3 sourceSize:(CGSize)a4
{
  double v4;
  double v5;
  float v6;
  double width;
  double height;
  CGSize result;

  v4 = a4.width * a4.height / a3;
  if (v4 > 1.0)
  {
    v5 = sqrt(v4);
    v6 = a4.width / v5;
    a4.width = floorf(v6);
    *(float *)&v5 = a4.height / v5;
    a4.height = floorf(*(float *)&v5);
  }
  width = a4.width;
  height = a4.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)playBackImageSize:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[JFXStillMediaItem JT_maximumPixelsForStillImage:](self, "JT_maximumPixelsForStillImage:", 1);
  -[JFXStillMediaItem sizeForMaxPixels:sourceSize:](self, "sizeForMaxPixels:sourceSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)exportImageSize:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[JFXStillMediaItem JT_maximumPixelsForStillImage:](self, "JT_maximumPixelsForStillImage:", 0);
  -[JFXStillMediaItem sizeForMaxPixels:sourceSize:](self, "sizeForMaxPixels:sourceSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)thumbImageSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  float v16;
  float v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7 * 75.0;

  -[JFXStillMediaItem sizeForMaxPixels:sourceSize:](self, "sizeForMaxPixels:sourceSize:", v8 * v8, width, height);
  v10 = v9;
  v12 = v11;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14 * 80.0;

  if (v10 <= v12)
  {
    if (v10 < v15)
    {
      v17 = v12 * (v15 / v10);
      v12 = floorf(v17);
      v10 = v15;
    }
  }
  else if (v12 < v15)
  {
    v16 = v10 * (v15 / v12);
    v10 = floorf(v16);
    v12 = v15;
  }
  v18 = v10;
  v19 = v12;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)sizeForQuality:(int)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  double v21;
  double v22;
  CGSize result;

  -[JFXStillMediaItem sourceImageSize](self, "sourceImageSize");
  v6 = *MEMORY[0x24BDBF148];
  v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v8 == *MEMORY[0x24BDBF148] && v5 == v7)
  {
    -[JFXStillMediaItem assetURL](self, "assetURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isFileURL");

    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDF6AC8];
      -[JFXStillMediaItem assetURL](self, "assetURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageWithContentsOfFile:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "size");
      -[JFXStillMediaItem setSourceImageSize:](self, "setSourceImageSize:");
    }
    else
    {
      -[JTAssetMediaItem asset](self, "asset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (double)(unint64_t)objc_msgSend(v15, "pixelWidth");
      -[JTAssetMediaItem asset](self, "asset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXStillMediaItem setSourceImageSize:](self, "setSourceImageSize:", v16, (double)(unint64_t)objc_msgSend(v17, "pixelHeight"));

    }
  }
  switch(a3)
  {
    case 0:
      -[JFXStillMediaItem sourceImageSize](self, "sourceImageSize");
      -[JFXStillMediaItem playBackImageSize:](self, "playBackImageSize:");
      goto LABEL_18;
    case 1:
      -[JFXStillMediaItem sourceImageSize](self, "sourceImageSize");
      -[JFXStillMediaItem exportImageSize:](self, "exportImageSize:");
      goto LABEL_18;
    case 2:
      -[JFXStillMediaItem sourceImageSize](self, "sourceImageSize");
      -[JFXStillMediaItem thumbImageSize:](self, "thumbImageSize:");
      goto LABEL_18;
    case 3:
      -[JFXStillMediaItem sourceImageSize](self, "sourceImageSize");
LABEL_18:
      v6 = v18;
      v7 = v19;
      break;
    default:
      JFXLog_core();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[JFXStillMediaItem sizeForQuality:].cold.1(a3, v20);

      break;
  }
  v21 = v6;
  v22 = v7;
  result.height = v22;
  result.width = v21;
  return result;
}

- (BOOL)hasVisualCharacteristic
{
  return 1;
}

- (BOOL)hasPhotoCharacteristic
{
  return 1;
}

- (id)assetURL
{
  void *v3;

  -[JTAssetMediaItem assetIdentifier](self, "assetIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[JTAssetMediaItem assetLocalURL](self, "assetLocalURL");
  else
    -[JTLocalAssetMediaItem localFileURL](self, "localFileURL");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateAssetImageColorSpace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  CGImage *ImageAtIndex;
  CGImage *v10;
  CGColorSpaceRef ColorSpace;
  void *v12;
  void *v13;
  void *v14;
  const __CFURL *url;

  -[JFXStillMediaItem assetURL](self, "assetURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[JFXStillMediaItem assetURL](self, "assetURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:", v6);
    url = (const __CFURL *)objc_claimAutoreleasedReturnValue();

    v7 = CGImageSourceCreateWithURL(url, 0);
    if (v7)
    {
      v8 = v7;
      -[JFXStillMediaItem setHasGainMap:](self, "setHasGainMap:", hasGainMap(v7));
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, 0);
      if (ImageAtIndex)
      {
        v10 = ImageAtIndex;
        ColorSpace = CGImageGetColorSpace(ImageAtIndex);
        if (ColorSpace)
        {
          objc_msgSend(MEMORY[0x24BE78FF8], "jfx_getColorSpaceFromCGColorSpace:", ColorSpace);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[JFXStillMediaItem setImageColorSpace:](self, "setImageColorSpace:", v12);

        }
        CGImageRelease(v10);
      }
      CFRelease(v8);
    }
    -[JFXStillMediaItem imageColorSpace](self, "imageColorSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE78FF8], "sRGBColorSpace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXStillMediaItem setImageColorSpace:](self, "setImageColorSpace:", v14);

    }
  }
}

- (id)info
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXStillMediaItem;
  -[JTAssetMediaItem info](&v3, sel_info);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PVColorSpace)imageColorSpace
{
  return self->_imageColorSpace;
}

- (void)setImageColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_imageColorSpace, a3);
}

- (BOOL)hasGainMap
{
  return self->_hasGainMap;
}

- (void)setHasGainMap:(BOOL)a3
{
  self->_hasGainMap = a3;
}

- (float)meteorPlusHeadroom
{
  return self->_meteorPlusHeadroom;
}

- (void)setMeteorPlusHeadroom:(float)a3
{
  self->_meteorPlusHeadroom = a3;
}

- (CGSize)sourceImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_sourceImageSize.width;
  height = self->_sourceImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSourceImageSize:(CGSize)a3
{
  self->_sourceImageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageColorSpace, 0);
}

- (void)sizeForQuality:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "WARNING: sizeForStillQuality: does not understand your quality %d", (uint8_t *)v2, 8u);
}

@end
