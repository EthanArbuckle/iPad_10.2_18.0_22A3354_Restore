@implementation QLImageItemTransformer

+ (id)allowedOutputClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  CGImageSourceRef v8;
  CGImageSourceRef v9;
  void *v10;

  v7 = a4;
  v8 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v8)
  {
    v9 = v8;
    -[QLImageItemTransformer _contentsFromCGImageSource:context:scale:](self, "_contentsFromCGImageSource:context:scale:", v8, v7, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  const __CFData *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CGColorSpace *v12;
  CGDataProvider *v13;
  CGImage *v14;
  CGImageSourceRef v15;
  CGImageSourceRef v16;
  void *v17;

  v7 = (const __CFData *)a3;
  v8 = a4;
  objc_msgSend(v8, "bitmapFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "bitmapFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "colorSpace");
    if (v11)
    {
      v12 = (CGColorSpace *)v11;
      v13 = CGDataProviderCreateWithCFData(v7);
      v14 = CGImageCreate(objc_msgSend(v10, "width"), objc_msgSend(v10, "height"), objc_msgSend(v10, "bitsPerComponent"), objc_msgSend(v10, "bitsPerPixel"), objc_msgSend(v10, "bytesPerRow"), v12, objc_msgSend(v10, "bitmapInfo"), v13, 0, 0, kCGRenderingIntentDefault);
      CFRelease(v13);
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v14, 0, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v14);

  }
  else
  {
    v15 = CGImageSourceCreateWithData(v7, 0);
    if (v15)
    {
      v16 = v15;
      -[QLImageItemTransformer _contentsFromCGImageSource:context:scale:](self, "_contentsFromCGImageSource:context:scale:", v15, v8, 1.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v16);
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)_contentsFromCGImageSource:(CGImageSource *)a3 context:(id)a4 scale:(double)a5
{
  id v8;
  size_t Count;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double Helper_x8__OBJC_CLASS___PFImageMetadata;
  uint64_t v16;
  QLAnimatedImage *v17;
  uint64_t v18;
  const __CFDictionary *v19;
  CFDictionaryRef v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  void *v28;
  unsigned int v29;
  float v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  double v45;
  double v46;
  unsigned int v47;
  uint64_t v48;
  const __CFDictionary *v49;
  CGImageRef ImageAtIndex;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[3];
  _QWORD v56[3];
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  Count = CGImageSourceGetCount(a3);
  objc_msgSend(v8, "contentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v10 = (void *)MEMORY[0x24BDF8238];
    objc_msgSend(v8, "contentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "typeWithIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "animatableContentTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = _QLContentTypeConformsToContentTypeInSet();

  }
  if (Count >= 2
    && (Helper_x8__OBJC_CLASS___PFImageMetadata = gotLoadHelper_x8__OBJC_CLASS___PFImageMetadata(v11),
        (v10 & (objc_msgSend(*(id *)(v16 + 1008), "imageSourceIsMonoski:", a3, Helper_x8__OBJC_CLASS___PFImageMetadata) ^ 1)) == 1))
  {
    v17 = -[QLAnimatedImage initWithImageSource:]([QLAnimatedImage alloc], "initWithImageSource:", a3);
  }
  else
  {
    v57 = *MEMORY[0x24BDD97F0];
    v18 = MEMORY[0x24BDBD1C8];
    v58[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v20 = CGImageSourceCopyPropertiesAtIndex(a3, 0, v19);
    -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", *MEMORY[0x24BDD96C8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    v23 = v22;

    -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", *MEMORY[0x24BDD96C0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    v26 = v25;

    -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", *MEMORY[0x24BDD9698]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      v29 = objc_msgSend(v27, "unsignedIntValue") - 2;
    else
      v29 = -1;
    if (v23 >= v26)
      v30 = v26;
    else
      v30 = v23;
    v31 = v30;
    -[QLImageItemTransformer _maximumDimension](self, "_maximumDimension");
    v33 = v32;
    v34 = objc_msgSend(v8, "viewDynamicRange");
    if (v33 <= v31 * 0.5)
    {
      -[QLImageItemTransformer _maximumDimension](self, "_maximumDimension");
      QLScaledPlatformImageFromImageSource();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x24BEBD640];
      v44 = objc_msgSend(v42, "CGImage");
      objc_msgSend(v42, "scale");
      v46 = v45;
      v47 = objc_msgSend(v42, "orientation") - 2;
      if (v47 > 6)
        v48 = 0;
      else
        v48 = qword_20D5B1610[v47];
      objc_msgSend(v43, "imageWithCGImage:scale:orientation:", v44, v48, v46);
      v17 = (QLAnimatedImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v35 = v34;
      if (_os_feature_enabled_impl() && v35)
      {
        v36 = *MEMORY[0x24BDD9790];
        v55[0] = *MEMORY[0x24BDD9820];
        v55[1] = v36;
        v37 = *MEMORY[0x24BDD97A0];
        v56[0] = v18;
        v56[1] = v37;
        v55[2] = *MEMORY[0x24BDD9798];
        v56[2] = &unk_24C749620;
        v38 = (void *)MEMORY[0x24BDBCE70];
        v39 = v56;
        v40 = v55;
        v41 = 3;
      }
      else
      {
        v53 = *MEMORY[0x24BDD9820];
        v54 = v18;
        v38 = (void *)MEMORY[0x24BDBCE70];
        v39 = &v54;
        v40 = &v53;
        v41 = 1;
      }
      objc_msgSend(v38, "dictionaryWithObjects:forKeys:count:", v39, v40, v41);
      v49 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, v49);
      v51 = 0;
      if (v29 <= 6)
        v51 = qword_20D5B1610[v29];
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", ImageAtIndex, v51, a5);
      v17 = (QLAnimatedImage *)objc_claimAutoreleasedReturnValue();
      if (ImageAtIndex)
        CFRelease(ImageAtIndex);
      v19 = v49;
    }

  }
  return v17;
}

- (double)_maximumDimension
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  if (v4 <= v6)
    v10 = v6;
  else
    v10 = v4;
  return v10 * v9 * 3.0;
}

+ (id)animatableContentTypes
{
  if (animatableContentTypes_onceToken != -1)
    dispatch_once(&animatableContentTypes_onceToken, &__block_literal_global_5);
  return (id)animatableContentTypes_animatableContentTypes;
}

void __48__QLImageItemTransformer_animatableContentTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("public.heics"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x24BDF83D8];
  v2 = *MEMORY[0x24BDF84F8];
  v3 = *MEMORY[0x24BDF8660];
  v4 = *MEMORY[0x24BDF83E8];
  v8 = (void *)v0;
  if (v0)
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v1, v2, v3, v4, v0, 0);
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v1, v2, v3, v4, 0, v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)animatableContentTypes_animatableContentTypes;
  animatableContentTypes_animatableContentTypes = v5;

}

@end
