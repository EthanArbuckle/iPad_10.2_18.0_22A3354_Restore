@implementation GIFBuilder

+ (id)builderWithContext:(id)a3 forURL:(id)a4 maxRes:(unint64_t)a5 fps:(float)a6
{
  id v9;
  id v10;
  GIFBuilder *v11;
  double v12;
  GIFBuilder *v13;

  v9 = a4;
  v10 = a3;
  v11 = [GIFBuilder alloc];
  *(float *)&v12 = a6;
  v13 = -[GIFBuilder initWithContext:forURL:maxRes:fps:](v11, "initWithContext:forURL:maxRes:fps:", v10, v9, a5, v12);

  return v13;
}

- (GIFBuilder)initWithContext:(id)a3 forURL:(id)a4 maxRes:(unint64_t)a5 fps:(float)a6
{
  id v11;
  const __CFURL *v12;
  const __CFURL *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFDictionary *v17;
  CGImageDestination *v18;
  double v19;
  void *v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *frameProperties;
  GIFBuilder *v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (const __CFURL *)a4;
  v13 = v12;
  if (!v11)
  {
    NSLog(CFSTR("GIFBuilder: nil ciCtx"));
LABEL_7:
    v24 = 0;
    goto LABEL_10;
  }
  if (!v12)
  {
    NSLog(CFSTR("GIFBuilder: nil gifURL"));
    goto LABEL_7;
  }
  objc_storeStrong((id *)&self->_ciCtx, a3);
  self->_maxRes = (double)a5;
  v14 = *MEMORY[0x1E0CBCCE0];
  v32 = *MEMORY[0x1E0CBCCE0];
  v15 = *MEMORY[0x1E0CBCCE8];
  v30[0] = *MEMORY[0x1E0CBCCF0];
  v30[1] = v15;
  v31[0] = &unk_1E986D070;
  v31[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v18 = CGImageDestinationCreateWithURL(v13, (CFStringRef)*MEMORY[0x1E0CA5B68], 0, 0);
  self->_imgDest = v18;
  if (v18)
  {
    CGImageDestinationSetProperties(v18, v17);
    v28 = v14;
    v26 = *MEMORY[0x1E0CBCCD8];
    *(float *)&v19 = 1.0 / a6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    frameProperties = self->_frameProperties;
    self->_frameProperties = v22;

    v24 = self;
  }
  else
  {
    NSLog(CFSTR("GIFBuilder: CGImageDestinationCreateWithURL failed"));
    v24 = 0;
  }

LABEL_10:
  return v24;
}

- (void)dealloc
{
  CGImageDestination *imgDest;
  objc_super v4;

  imgDest = self->_imgDest;
  if (imgDest)
    CFRelease(imgDest);
  v4.receiver = self;
  v4.super_class = (Class)GIFBuilder;
  -[GIFBuilder dealloc](&v4, sel_dealloc);
}

- (BOOL)addImage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double maxRes;
  double v10;
  double v11;
  float v12;
  double v13;
  BOOL v14;
  float v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  CGImage *v20;
  CGImage *v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "extent");
    v7 = v6;
    objc_msgSend(v5, "extent");
    maxRes = self->_maxRes;
    v10 = v7 / v8;
    if (v7 <= v8)
    {
      if (v8 >= maxRes)
        v13 = self->_maxRes;
      else
        v13 = v8;
      v15 = v10 * v13;
      v11 = roundf(v15);
    }
    else
    {
      if (v7 >= maxRes)
        v11 = self->_maxRes;
      else
        v11 = v7;
      v12 = v11 / v10;
      v13 = roundf(v12);
    }
    v16 = v13 / v8;
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CILanczosScaleTransform"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDefaults");
    objc_msgSend(v17, "setValue:forKey:", v5, *MEMORY[0x1E0C9E1F8]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forKey:", v18, *MEMORY[0x1E0C9E268]);
    objc_msgSend(v17, "outputImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CIContext createCGImage:fromRect:](self->_ciCtx, "createCGImage:fromRect:", v19, 0.0, 0.0, v11, v13);
    v14 = v20 != 0;
    if (v20)
    {
      v21 = v20;
      CGImageDestinationAddImage(self->_imgDest, v20, (CFDictionaryRef)self->_frameProperties);
      CGImageRelease(v21);
    }
    else
    {
      NSLog(CFSTR("GIFBuilder addImage: createCGImage error"));
    }

  }
  else
  {
    NSLog(CFSTR("GIFBuilder addImage: nil ciImg"));
    v14 = 0;
  }

  return v14;
}

- (BOOL)finish
{
  BOOL v2;

  v2 = CGImageDestinationFinalize(self->_imgDest);
  if (!v2)
    NSLog(CFSTR("GIFBuilder finish: CGImageDestinationFinalize error"));
  return v2;
}

- (CIContext)ciCtx
{
  return (CIContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCiCtx:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)frameProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFrameProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CGImageDestination)imgDest
{
  return self->_imgDest;
}

- (void)setImgDest:(CGImageDestination *)a3
{
  self->_imgDest = a3;
}

- (double)maxRes
{
  return self->_maxRes;
}

- (void)setMaxRes:(double)a3
{
  self->_maxRes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameProperties, 0);
  objc_storeStrong((id *)&self->_ciCtx, 0);
}

@end
