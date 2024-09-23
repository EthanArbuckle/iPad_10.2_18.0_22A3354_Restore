@implementation PKImage(NanoPassKit)

- (id)npkImageByMemoryMappingDataWithTemporaryFilePrefix:()NanoPassKit
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  const __CFAllocator *Default;
  CFArrayRef v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  void *values[2];

  values[1] = *(void **)MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "imageHash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileSafeBase64Encoding");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  pk_General_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (!v11)
  {
    if (v13)
    {
      pk_General_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v9;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: ImageMemoryMap: couldn't find existing CPBitmap image on disk at %@", buf, 0xCu);
      }

    }
LABEL_12:
    v17 = objc_retainAutorelease(a1);
    v18 = (void *)objc_msgSend(v17, "imageRef");
    if (!v18)
    {
LABEL_21:
      pk_Payment_log();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        pk_Payment_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v9;
          _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_DEFAULT, "Warning: ImageMemoryMap: Failed to generate mapped image at:%@", buf, 0xCu);
        }

      }
      v15 = v17;
      goto LABEL_26;
    }
    values[0] = v18;
    Default = CFAllocatorGetDefault();
    v20 = CFArrayCreate(Default, (const void **)values, 1, MEMORY[0x24BDBD690]);
    if (CPBitmapWriteImagesToPath())
    {
      pk_General_log();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        pk_General_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v9;
          _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: ImageMemoryMap: Successfully wrote CPBitmap to %@", buf, 0xCu);
        }

      }
      objc_msgSend(v17, "_npkMemoryMappedImageWithPath:", v9);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v20)
LABEL_19:
        CFRelease(v20);
    }
    else
    {
      pk_Payment_log();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

      if (v29)
      {
        pk_Payment_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v32 = v9;
          v33 = 2112;
          v34 = 0;
          _os_log_impl(&dword_213518000, v30, OS_LOG_TYPE_DEFAULT, "Warning: ImageMemoryMap: Unable to write CPBitmap to %@: %@", buf, 0x16u);
        }

      }
      v15 = 0;
      if (v20)
        goto LABEL_19;
    }
    if (v15)
      goto LABEL_26;
    goto LABEL_21;
  }
  if (v13)
  {
    pk_General_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: ImageMemoryMap: Found existing CPBitmap image on disk at %@", buf, 0xCu);
    }

  }
  objc_msgSend(a1, "_npkMemoryMappedImageWithPath:", v9);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_12;
LABEL_26:

  return v15;
}

- (id)_npkMemoryMappedImageWithPath:()NanoPassKit
{
  id v4;
  const __CFArray *ImagesFromPath;
  const __CFArray *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  const void *ValueAtIndex;
  id v11;
  double v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ImagesFromPath = (const __CFArray *)CPBitmapCreateImagesFromPath();
  if (ImagesFromPath)
  {
    v6 = ImagesFromPath;
    if (CFArrayGetCount(ImagesFromPath) == 1)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        pk_General_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v4;
          _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: ImageMemoryMap: Successfully read CPBitmap from %@", buf, 0xCu);
        }

      }
      ValueAtIndex = CFArrayGetValueAtIndex(v6, 0);
      v11 = objc_alloc(MEMORY[0x24BE6EB60]);
      objc_msgSend(a1, "scale");
      v13 = (void *)objc_msgSend(v11, "initWithCGImage:scale:orientation:", ValueAtIndex, objc_msgSend(a1, "orientation"), v12);
    }
    else
    {
      pk_Payment_log();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v18)
      {
        pk_Payment_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v4;
          _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Warning: ImageMemoryMap: Array of bitmaps read from %@ is not of size 1", buf, 0xCu);
        }

      }
      v13 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      pk_Payment_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v4;
        v23 = 2112;
        v24 = 0;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Warning: ImageMemoryMap: Unable to read CPBitmap from %@: %@", buf, 0x16u);
      }

    }
    v13 = 0;
  }

  return v13;
}

- (uint64_t)resizedImageToCover:()NanoPassKit
{
  return objc_msgSend(a1, "resizedImageWithSize:shouldCover:", 1);
}

- (uint64_t)resizedImageToFit:()NanoPassKit
{
  return objc_msgSend(a1, "resizedImageWithSize:shouldCover:", 0);
}

- (id)resizedImageWithSize:()NanoPassKit shouldCover:
{
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x2199B65AC]();
  objc_msgSend(a1, "size");
  if (a5)
    PKSizeAspectFitToCover();
  else
    PKSizeAspectFit();
  v12 = v10;
  v13 = v11;
  objc_msgSend(a1, "size");
  if (v12 >= v14 || (objc_msgSend(a1, "size"), v13 >= v15))
  {
    pk_General_log();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      pk_General_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1, "size");
        v28 = v27;
        objc_msgSend(a1, "size");
        v31 = 138413314;
        v32 = a1;
        v33 = 2048;
        v34 = v28;
        v35 = 2048;
        v36 = v29;
        v37 = 2048;
        v38 = a2;
        v39 = 2048;
        v40 = a3;
        _os_log_impl(&dword_213518000, v26, OS_LOG_TYPE_DEFAULT, "Notice: ImageMemoryMap: Resizing image %@ from %f x %f to fit/cover %f x %f would upscale, ignoring", (uint8_t *)&v31, 0x34u);
      }

    }
    v23 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6EB68], "constraintsWithMaxSize:", v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    pk_General_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      pk_General_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1, "size");
        v21 = v20;
        objc_msgSend(a1, "size");
        v31 = 138413826;
        v32 = a1;
        v33 = 2048;
        v34 = v21;
        v35 = 2048;
        v36 = v22;
        v37 = 2048;
        v38 = v12;
        v39 = 2048;
        v40 = v13;
        v41 = 2048;
        v42 = a2;
        v43 = 2048;
        v44 = a3;
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Notice: ImageMemoryMap: Resizing image %@ from %f x %f to %f x %f to fit/cover %f x %f", (uint8_t *)&v31, 0x48u);
      }

    }
    objc_msgSend(v16, "resizedImage:", a1);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(v9);
  return v23;
}

@end
