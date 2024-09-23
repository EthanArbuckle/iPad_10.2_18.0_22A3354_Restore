@implementation MUImageDownsamplingUtilities

+ (id)_sourceContentType:(id)a3
{
  CGImageSource *v3;
  CGImageSource *v4;
  void *v5;

  v3 = (CGImageSource *)objc_msgSend(a1, "_newImageSourceWithSourceContent:", a3);
  if (v3)
  {
    v4 = v3;
    CGImageSourceGetType(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (CGImageSource)_newImageSourceWithSourceContent:(id)a3
{
  const __CFData *v3;
  void *v4;
  char isKindOfClass;
  CGImageSourceRef v6;
  CGImageSource *v7;

  v3 = (const __CFData *)a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v6 = CGImageSourceCreateWithData(v3, 0);
  else
    v6 = CGImageSourceCreateWithURL(v3, 0);
  v7 = v6;

  return v7;
}

+ (void)_shouldFlattenEXIFOrientation:(BOOL *)a3 andDownsample:(BOOL *)a4 sourceContent:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGImageSource *v14;
  CGImageSource *v15;
  CFDictionaryRef v16;
  void *v17;
  CGImage *ImageAtIndex;
  CGImage *v19;
  size_t Width;
  double v21;
  id v22;

  v8 = a5;
  if (a3)
    *a3 = 0;
  v22 = v8;
  if (a4)
    *a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v22;
    v10 = v9;
    if (a3 && objc_msgSend(v9, "imageOrientation"))
      *a3 = 1;
    if (a4)
    {
      objc_msgSend(v10, "size");
      v12 = v11;
      objc_msgSend(v10, "size");
      if (v12 * v13 > maxImageArea())
        *a4 = 1;
    }

  }
  else
  {
    v14 = (CGImageSource *)objc_msgSend(a1, "_newImageSourceWithSourceContent:", v22);
    if (v14)
    {
      v15 = v14;
      if (a3)
      {
        v16 = CGImageSourceCopyPropertiesAtIndex(v14, 0, 0);
        -[__CFDictionary valueForKey:](v16, "valueForKey:", *MEMORY[0x24BDD9698]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "longLongValue") >= 2)
          *a3 = 1;

      }
      if (a4)
      {
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, 0);
        if (ImageAtIndex)
        {
          v19 = ImageAtIndex;
          Width = CGImageGetWidth(ImageAtIndex);
          v21 = (double)(CGImageGetHeight(v19) * Width);
          if (maxImageArea() < v21)
            *a4 = 1;
          CGImageRelease(v19);
        }
      }
      CFRelease(v15);
    }
  }

}

+ (id)_flattenEXIFOrientation:(BOOL)a3 withDownsampling:(BOOL)a4 sourceContent:(id)a5 withContentType:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  CGImageDestinationRef v22;
  CGImageDestinationRef v23;
  CGImageSource *v24;
  CGImage *ImageAtIndex;
  CGImage *v26;
  double Width;
  double Height;
  double v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  CGImageSource *isrc;
  _BOOL4 v37;
  void *v38;
  _QWORD v39[4];
  _QWORD v40[5];

  v7 = a4;
  v8 = a3;
  v40[4] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  objc_msgSend(a1, "_uniqueTemporaryDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v37 = v8;
    objc_msgSend(a1, "_preferredFileDisplayNameForSourceContent:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredFilenameExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)v13;
    objc_msgSend(v12, "URLByAppendingPathComponent:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "URLByAppendingPathExtension:", v14);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }
    objc_msgSend(v11, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(a1, "_sourceContentType:", v10);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;

    v22 = CGImageDestinationCreateWithURL((CFURLRef)v16, v21, 1uLL, 0);
    if (!v22)
    {

      NSLog(CFSTR("Downsample image: failed to create image destination of type: %@ at file URL: %@"), v21, 0);
      v16 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v23 = v22;
    if (!v21 || (v24 = (CGImageSource *)objc_msgSend(a1, "_newImageSourceWithSourceContent:", v10)) == 0)
    {
LABEL_24:
      CFRelease(v23);
      goto LABEL_25;
    }
    isrc = v24;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v24, 0, 0);
    if (ImageAtIndex)
    {
      v26 = ImageAtIndex;
      Width = (double)CGImageGetWidth(ImageAtIndex);
      Height = (double)CGImageGetHeight(v26);
      CGImageRelease(v26);
      if (v7)
      {
LABEL_13:
        objc_msgSend(a1, "_maxDimensionOfSize:fittingToArea:", Width, Height, maxImageArea());
LABEL_19:
        v39[0] = *MEMORY[0x24BDD9218];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *MEMORY[0x24BDD97D0];
        v40[0] = v30;
        v40[1] = MEMORY[0x24BDBD1C0];
        v32 = *MEMORY[0x24BDD9820];
        v39[1] = v31;
        v39[2] = v32;
        v39[3] = *MEMORY[0x24BDD97C8];
        v40[2] = MEMORY[0x24BDBD1C8];
        v40[3] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v34 = (void *)objc_msgSend(v33, "mutableCopy");
          objc_msgSend(v34, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDD9788]);

          v33 = v34;
        }
        CGImageDestinationAddImageFromSource(v23, isrc, 0, (CFDictionaryRef)v33);
        if (!CGImageDestinationFinalize(v23))
        {

          NSLog(CFSTR("Downsample image: failed to finalize image destination of type: %@ at file URL: %@"), v21, 0);
          v16 = 0;
        }
        CFRelease(isrc);

        goto LABEL_24;
      }
    }
    else
    {
      Width = 1.0;
      Height = 1.0;
      if (v7)
        goto LABEL_13;
    }
    if (Width >= Height)
      v29 = Width;
    else
      v29 = Height;
    goto LABEL_19;
  }
  v16 = 0;
LABEL_26:

  return v16;
}

+ (id)_flattenRotation:(BOOL)a3 withDownsampling:(BOOL)a4 sourceImage:(id)a5
{
  _BOOL4 v5;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  double v22;
  double v23;

  v5 = a4;
  v7 = a5;
  objc_msgSend(v7, "size");
  if (v5)
  {
    v10 = maxImageArea();
    objc_msgSend(v7, "size");
    objc_msgSend(a1, "_sizeFittingArea:withSize:", v10, v11, v12);
  }
  v13 = v8;
  v14 = v9;
  objc_msgSend(MEMORY[0x24BDF6AA0], "defaultFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setScale:", 1.0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:format:", v15, v13, v14);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __78__MUImageDownsamplingUtilities__flattenRotation_withDownsampling_sourceImage___block_invoke;
  v20[3] = &unk_24E5D4588;
  v21 = v7;
  v22 = v13;
  v23 = v14;
  v17 = v7;
  objc_msgSend(v16, "imageWithActions:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __78__MUImageDownsamplingUtilities__flattenRotation_withDownsampling_sourceImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

+ (BOOL)_flattenEXIFOrientationOfImage:(id)a3 toDestination:(id)a4
{
  id v6;
  const __CFURL *v7;
  __CFString *v8;
  CGImageDestinationRef v9;
  CGImageDestination *v10;
  CGImageSource *v11;
  CGImageSource *v12;
  CGImage *ImageAtIndex;
  CGImage *v14;
  double Width;
  double Height;
  BOOL v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFDictionary *v22;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (const __CFURL *)a4;
  objc_msgSend(a1, "_sourceContentType:", v6);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = CGImageDestinationCreateWithURL(v7, v8, 1uLL, 0);
  if (v9)
  {
    v10 = v9;
    v11 = (CGImageSource *)objc_msgSend(a1, "_newImageSourceWithSourceContent:", v6);
    if (v11)
    {
      v12 = v11;
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, 0, 0);
      if (ImageAtIndex)
      {
        v14 = ImageAtIndex;
        Width = (double)CGImageGetWidth(ImageAtIndex);
        Height = (double)CGImageGetHeight(v14);
        CGImageRelease(v14);
      }
      else
      {
        Height = 1.0;
        Width = 1.0;
      }
      if (Width >= Height)
        v18 = Width;
      else
        v18 = Height;
      v19 = *MEMORY[0x24BDD9788];
      v25[0] = MEMORY[0x24BDBD1C8];
      v20 = *MEMORY[0x24BDD9218];
      v24[0] = v19;
      v24[1] = v20;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = *MEMORY[0x24BDD97D0];
      v25[1] = v21;
      v25[2] = MEMORY[0x24BDBD1C0];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
      v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      CGImageDestinationAddImageFromSource(v10, v12, 0, v22);
      v17 = CGImageDestinationFinalize(v10);
      if (!v17)
        NSLog(CFSTR("Downsample image: failed to finalize image destination of type: %@ at file URL: %@"), v8, v7);
      CFRelease(v12);

    }
    else
    {
      v17 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)_uniqueTemporaryDirectory
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v14;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "stringByAppendingPathComponent:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v14);
  v10 = v14;
  v11 = v10;
  if (v10)
  {
    NSLog(CFSTR("Failed to create unique temporary directory: %@"), v10);
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)_preferredFileDisplayNameForSourceContent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_stringByTrimmingDotDirectories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }

  return v6;
}

+ (CGSize)_sizeFittingArea:(double)a3 withSize:(CGSize)a4
{
  double width;
  double height;
  CGSize result;

  if (a4.width * a4.height > a3)
  {
    a4.height = sqrt(a3 / (a4.width / a4.height));
    a4.width = a3 / a4.height;
  }
  width = a4.width;
  height = a4.height;
  result.height = height;
  result.width = width;
  return result;
}

+ (double)_maxDimensionOfSize:(CGSize)a3 fittingToArea:(double)a4
{
  double v4;
  double v5;

  objc_msgSend(a1, "_sizeFittingArea:withSize:", a4, a3.width, a3.height);
  if (v4 < v5)
    v4 = v5;
  return floor(v4);
}

@end
