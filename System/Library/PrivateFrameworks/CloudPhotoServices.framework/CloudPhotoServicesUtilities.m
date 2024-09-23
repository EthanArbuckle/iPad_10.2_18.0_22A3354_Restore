@implementation CloudPhotoServicesUtilities

+ (CGSize)sizeOfImageAtURL:(id)a3 orientationOut:(int *)a4
{
  CGImageSource *v6;
  double v7;
  double v8;
  CGImageSource *v9;
  CFDictionaryRef v10;
  double v11;
  double v12;
  uint64_t v13;
  CGSize result;

  v6 = (CGImageSource *)objc_msgSend(a1, "newImageSourceFromImageAtURL:", a3);
  v7 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v6)
  {
    v9 = v6;
    v10 = CGImageSourceCopyPropertiesAtIndex(v6, 0, 0);
    if (v10)
    {
      v13 = 0;
      objc_msgSend(a1, "getDimensionsFromImageProperties:orientationOut:widthOut:heightOut:", v10, a4, (char *)&v13 + 4, &v13);
      v7 = (double)SHIDWORD(v13);
      v8 = (double)(int)v13;
    }
    CFRelease(v9);

  }
  v11 = v7;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (CGSize)dimensionsForAVAsset:(id)a3
{
  CGFloat width;
  CGFloat height;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;
  CGRect v15;

  width = *MEMORY[0x1E0C9D820];
  height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "naturalSize");
      v8 = v7;
      v10 = v9;
      if (v6)
        objc_msgSend(v6, "preferredTransform");
      v14.size.width = v10 * 0.0 + 0.0 * v8;
      v14.size.height = v14.size.width;
      v14.origin.x = 0.0;
      v14.origin.y = 0.0;
      v15 = CGRectStandardize(v14);
      width = v15.size.width;
      height = v15.size.height;

    }
  }
  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (CGImageSource)newImageSourceFromImageAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  CGImageSource *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", v4, *MEMORY[0x1E0CEC520]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v10 = *MEMORY[0x1E0CBD2A8];
      v11[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = CGImageSourceCreateWithURL((CFURLRef)v3, v7);

  return v8;
}

+ (void)getDimensionsFromImageProperties:(id)a3 orientationOut:(int *)a4 widthOut:(int *)a5 heightOut:(int *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (a4)
  {
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CBD090]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10
        || (v11 = v10,
            objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CBD0C0]),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v11,
            !v9))
      {
        v9 = &unk_1E98A7050;
      }
    }
    *a4 = objc_msgSend(v9, "intValue");

  }
  if (a5)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("RawPixelWidth"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CBD048]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CBCC28]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    *a5 = objc_msgSend(v12, "intValue");

  }
  if (a6)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("RawPixelHeight"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CBD040]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CBCC30]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    *a6 = objc_msgSend(v13, "intValue");

  }
}

@end
