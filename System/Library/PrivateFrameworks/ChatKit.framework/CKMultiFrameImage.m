@implementation CKMultiFrameImage

- (CKMultiFrameImage)initWithFrameImages:(id)a3 frameDurations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  CKMultiFrameImage *v12;
  CKMultiFrameImage *v13;
  _QWORD aBlock[4];
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  v9 = (void *)objc_msgSend(v7, "copy");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__CKMultiFrameImage_initWithFrameImages_frameDurations___block_invoke;
  aBlock[3] = &unk_1E2755BE8;
  v16 = v9;
  v10 = v9;
  v11 = _Block_copy(aBlock);
  v12 = -[CKMultiFrameImage initWithFrameCount:frameProvider:frameDurations:](self, "initWithFrameCount:frameProvider:frameDurations:", v8, v11, v6);

  v13 = v12;
  return v13;
}

uint64_t __56__CKMultiFrameImage_initWithFrameImages_frameDurations___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
}

- (CKMultiFrameImage)initWithFrameCount:(unint64_t)a3 frameProvider:(id)a4 frameDurations:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CKMultiFrameImage *v11;
  CKMultiFrameImage *v12;
  void *v13;
  id frameProvider;
  uint64_t v15;
  NSArray *frameDurations;
  CKMultiFrameImage *v17;
  NSObject *v18;
  objc_super v20;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count") != a3)
  {
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CKMultiFrameImage initWithFrameCount:frameProvider:frameDurations:].cold.1();

    v17 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CKMultiFrameImage;
    v11 = -[CKMultiFrameImage init](&v20, sel_init);
    v12 = v11;
    if (v11)
    {
      v11->_frameCount = a3;
      v13 = _Block_copy(v8);
      frameProvider = v12->_frameProvider;
      v12->_frameProvider = v13;

      v15 = objc_msgSend(v10, "copy");
      frameDurations = v12->_frameDurations;
      v12->_frameDurations = (NSArray *)v15;

    }
    self = v12;
    v17 = self;
  }

  return v17;
}

- (id)loadAllFrameImages
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_frameCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_frameCount)
  {
    v4 = 0;
    do
    {
      (*((void (**)(void))self->_frameProvider + 2))();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < self->_frameCount);
  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (id)frameProvider
{
  return self->_frameProvider;
}

- (NSArray)frameDurations
{
  return self->_frameDurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameDurations, 0);
  objc_storeStrong(&self->_frameProvider, 0);
}

+ (id)multiFrameImageFromOptimizedBitmapAtFileURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (+[CKImageData supportsASTC](CKImageData, "supportsASTC"))
    +[CKMultiFrameImage multiFrameImageWithContentsOfASTCURL:error:](CKMultiFrameImage, "multiFrameImageWithContentsOfASTCURL:error:", v5, a4);
  else
    +[CKMultiFrameImage multiFrameImageWithContentsOfCPBitmapURL:error:](CKMultiFrameImage, "multiFrameImageWithContentsOfCPBitmapURL:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)writeAsOptimizedBitmapToFileURL:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  BOOL v8;

  v6 = a3;
  if (+[CKImageData supportsASTC](CKImageData, "supportsASTC"))
    v7 = -[CKMultiFrameImage writeAsASTCToURL:error:](self, "writeAsASTCToURL:error:", v6, a4);
  else
    v7 = -[CKMultiFrameImage writeAsCPBitmapToURL:error:](self, "writeAsCPBitmapToURL:error:", v6, a4);
  v8 = v7;

  return v8;
}

+ (id)multiFrameImageWithContentsOfASTCURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v15;

  v6 = a3;
  if (v6)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 1, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (v7)
    {
      objc_msgSend(a1, "multiFrameImageWithASTCData:error:", v7, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        IMLogHandleForCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithContentsOfASTCURL:error:].cold.3();

      }
    }
    else
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithContentsOfASTCURL:error:].cold.2();

      v10 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithContentsOfASTCURL:error:].cold.1();
    v10 = 0;
  }

  return v10;
}

+ (id)multiFrameImageWithASTCData:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  CKMultiFrameImage *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  const __CFData *v23;
  const __CFData *v24;
  CGImageSource *v25;
  CGImageSource *v26;
  CGImage *ImageAtIndex;
  double v28;
  double v29;
  void *v30;
  double v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  _BYTE *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint8_t v45;
  _BYTE v46[15];
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  int v50;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.1();

    v9 = 0;
    goto LABEL_19;
  }
  v6 = objc_msgSend(v4, "length");
  v50 = 0;
  v48 = 0;
  v49 = 0;
  if (v6 <= 0x13)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.2();
LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  v10 = v6;
  objc_msgSend(v5, "getBytes:range:", &v50, v6 - 4, 4);
  if (v50 != 1129005385)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.15();
    goto LABEL_17;
  }
  objc_msgSend(v5, "getBytes:range:", &v49, v10 - 12, 8);
  v11 = v49;
  if (v49 == -1)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.3();
    goto LABEL_17;
  }
  v12 = v10 - 20;
  objc_msgSend(v5, "getBytes:range:", &v48, v10 - 20, 8);
  if (v10 - 20 < v48)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.4();
    goto LABEL_17;
  }
  objc_msgSend(v5, "subdataWithRange:", v10 - 20 - v48);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.5();
    v9 = 0;
    goto LABEL_65;
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.14();
    v9 = 0;
    goto LABEL_64;
  }
  -[NSObject ckmfi_numberForKey:](v14, "ckmfi_numberForKey:", CFSTR("CKAnimatedImageScale"));
  v15 = objc_claimAutoreleasedReturnValue();
  -[NSObject ckmfi_numberArrayForKey:](v14, "ckmfi_numberArrayForKey:", CFSTR("CKMultiFrameImageFrameScales"));
  v16 = objc_claimAutoreleasedReturnValue();
  -[NSObject ckmfi_numberArrayForKey:](v14, "ckmfi_numberArrayForKey:", CFSTR("CKAnimatedImageDurations"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!(v15 | v16))
  {
    IMLogHandleForCategory();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.13();
    goto LABEL_62;
  }
  v40 = (void *)v17;
  v41 = v14;
  v42 = (void *)v16;
  v43 = (void *)v15;
  v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
  if (!v11)
  {
LABEL_49:
    v35 = -[NSObject copy](v44, "copy", v39);
    v18 = v40;
    v9 = -[CKMultiFrameImage initWithFrameImages:frameDurations:]([CKMultiFrameImage alloc], "initWithFrameImages:frameDurations:", v35, v40);

    v14 = v41;
    v16 = (uint64_t)v42;
    v15 = (uint64_t)v43;
    goto LABEL_63;
  }
  v19 = 0;
  v20 = 0;
  v39 = v46;
  while (1)
  {
    v47 = 0;
    if (v12 - v20 <= 7)
    {
      IMLogHandleForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.6();
      goto LABEL_54;
    }
    objc_msgSend(v5, "getBytes:range:", &v47, v20, 8);
    v21 = v20 + 8;
    v22 = v47;
    if (v47 > v12 - v21)
    {
      IMLogHandleForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.7();
LABEL_54:
      v14 = v41;
      v16 = (uint64_t)v42;
      v15 = (uint64_t)v43;
      v18 = v40;

      goto LABEL_62;
    }
    objc_msgSend(v5, "subdataWithRange:", v21, v47);
    v23 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (!v23)
    {
      IMLogHandleForCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.8();
      goto LABEL_61;
    }
    v25 = CGImageSourceCreateWithData(v23, 0);
    if (!v25)
    {
      IMLogHandleForCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.9();
      goto LABEL_61;
    }
    v26 = v25;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v25, 0, 0);
    CFRelease(v26);
    if (!ImageAtIndex)
    {
      IMLogHandleForCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.10();
LABEL_61:
      v14 = v41;
      v16 = (uint64_t)v42;
      v15 = (uint64_t)v43;
      v18 = v40;

LABEL_62:
      v9 = 0;
      goto LABEL_63;
    }
    if (v43)
    {
      objc_msgSend(v43, "doubleValue");
      v29 = v28;
    }
    else
    {
      if (v42)
      {
        objc_msgSend(v42, "objectAtIndexedSubscript:", v19);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "doubleValue");
      }
      else
      {
        IMLogHandleForCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.12(&v45, v46, v32);

        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "scale");
      }
      v29 = v31;

    }
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", ImageAtIndex, 0, v29);
    if (!v33)
      break;
    v34 = (void *)v33;
    v20 = v22 + v21;
    -[NSObject addObject:](v44, "addObject:", v33);
    CGImageRelease(ImageAtIndex);

    if (v11 == ++v19)
      goto LABEL_49;
  }
  IMLogHandleForCategory();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    +[CKMultiFrameImage(ASTC_Persistence) multiFrameImageWithASTCData:error:].cold.11();

  v9 = 0;
  v14 = v41;
  v16 = (uint64_t)v42;
  v15 = (uint64_t)v43;
  v18 = v40;
LABEL_63:

LABEL_64:
LABEL_65:

LABEL_18:
LABEL_19:

  return v9;
}

+ (id)ASTCDataForImagesWithCount:(unint64_t)a3 imageProvider:(id)a4 durations:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v18;

  v10 = (void *)MEMORY[0x1E0C99E48];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "outputStreamToMemory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  LOBYTE(a1) = objc_msgSend(a1, "_writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:", a3, v12, v11, v13, &v18);

  v14 = v18;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v13, "propertyForKey:", *MEMORY[0x1E0C99868]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(ASTC_Persistence) ASTCDataForImagesWithCount:imageProvider:durations:error:].cold.1();

    v15 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v14);
  }

  return v15;
}

+ (BOOL)writeASTCImagesWithCount:(unint64_t)a3 imageProvider:(id)a4 durations:(id)a5 toFileURL:(id)a6 error:(id *)a7
{
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v20;

  if (!a6)
    return 0;
  v12 = (void *)MEMORY[0x1E0C99E48];
  v13 = a5;
  v14 = a4;
  objc_msgSend(v12, "outputStreamWithURL:append:", a6, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v16 = objc_msgSend(a1, "_writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:", a3, v14, v13, v15, &v20);

  v17 = v20;
  if ((v16 & 1) == 0)
  {
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(ASTC_Persistence) writeASTCImagesWithCount:imageProvider:durations:toFileURL:error:].cold.1();

    if (a7)
      *a7 = objc_retainAutorelease(v17);
  }

  return v16;
}

+ (BOOL)_writeASTCImagesWithCount:(unint64_t)a3 imageProvider:(id)a4 durations:(id)a5 toOutputStream:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  uint64_t v12;
  __CFData *v13;
  uint64_t v14;
  NSObject *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  CGImageDestination *v23;
  id v24;
  BOOL v25;
  int v26;
  NSObject *v27;
  BOOL v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  char v46;
  char v48;
  void *v50;
  const __CFDictionary *properties;
  void *v52;
  void (**v53)(id, _QWORD);
  id v54;
  _QWORD v55[4];
  id v56;
  unint64_t *v57;
  uint64_t *v58;
  unint64_t v59;
  unint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  _QWORD v70[3];
  _QWORD v71[5];

  v71[3] = *MEMORY[0x1E0C80C00];
  v53 = (void (**)(id, _QWORD))a4;
  v10 = a5;
  v11 = a6;
  v50 = v10;
  if (!v10 || objc_msgSend(v10, "count") == a3)
  {
    if (!v11)
    {
      IMLogHandleForCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.1();
        v15 = 0;
        v28 = 0;
        v30 = v29;
      }
      else
      {
        v15 = 0;
        v28 = 0;
      }
LABEL_59:

      if (a7)
        v46 = v28;
      else
        v46 = 1;
      if ((v46 & 1) == 0)
      {
        v15 = objc_retainAutorelease(v15);
        *a7 = v15;
      }
      goto LABEL_64;
    }
    objc_msgSend(v11, "open");
    v12 = *MEMORY[0x1E0CBC830];
    v70[0] = *MEMORY[0x1E0CBCA18];
    v70[1] = v12;
    v71[0] = *MEMORY[0x1E0CBC840];
    v71[1] = &unk_1E28708A0;
    v70[2] = *MEMORY[0x1E0CBC848];
    v71[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 3);
    properties = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v14 = 0;
    if (a3)
    {
      v48 = 0;
      v15 = 0;
      v16 = 0.0;
      while (1)
      {
        v17 = (void *)MEMORY[0x193FF4740]();
        v53[2](v53, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (!v18)
        {
          IMLogHandleForCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.6();
          goto LABEL_29;
        }
        objc_msgSend(v18, "scale");
        v21 = v20;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:atIndexedSubscript:", v22, v14);

        if (v14)
        {
          if (vabdd_f64(v21, v16) > 0.01)
            v48 = 1;
        }
        else
        {
          v16 = v21;
        }
        v23 = CGImageDestinationCreateWithData(v13, CFSTR("org.khronos.ktx"), 1uLL, 0);
        v24 = objc_retainAutorelease(v19);
        CGImageDestinationAddImage(v23, (CGImageRef)objc_msgSend(v24, "CGImage"), properties);
        v25 = CGImageDestinationFinalize(v23);
        CFRelease(v23);
        if (!v25)
        {
          IMLogHandleForCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.8();
LABEL_29:

          v24 = v19;
          v32 = (uint64_t)v15;
          goto LABEL_33;
        }
        v69 = 0;
        v69 = -[__CFData length](v13, "length");
        if (objc_msgSend(v11, "write:maxLength:", &v69, 8) != 8)
          break;
        v65 = 0;
        v66 = &v65;
        v67 = 0x2020000000;
        v68 = 0;
        v59 = 0;
        v60 = &v59;
        v61 = 0x3032000000;
        v62 = __Block_byref_object_copy__42;
        v63 = __Block_byref_object_dispose__42;
        v64 = 0;
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __110__CKMultiFrameImage_ASTC_Persistence___writeASTCImagesWithCount_imageProvider_durations_toOutputStream_error___block_invoke;
        v55[3] = &unk_1E2755C10;
        v56 = v11;
        v57 = &v59;
        v58 = &v65;
        -[__CFData enumerateByteRangesUsingBlock:](v13, "enumerateByteRangesUsingBlock:", v55);
        v26 = *((unsigned __int8 *)v66 + 24);
        if (*((_BYTE *)v66 + 24))
        {
          v27 = (id)v60[5];

          v15 = v27;
        }

        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(&v65, 8);

        objc_autoreleasePoolPop(v17);
        if (v26)
          goto LABEL_34;
        if (a3 == ++v14)
          goto LABEL_35;
      }
      objc_msgSend(v11, "streamError");
      v32 = objc_claimAutoreleasedReturnValue();

      IMLogHandleForCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.7();

LABEL_33:
      objc_autoreleasePoolPop(v17);
      v15 = v32;
    }
    else
    {
      v15 = 0;
      v48 = 0;
      v16 = 0.0;
    }
LABEL_34:
    if (v14 == a3)
    {
LABEL_35:
      v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v35 = v34;
      if ((v48 & 1) != 0)
      {
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v52, CFSTR("CKMultiFrameImageFrameScales"));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, CFSTR("CKAnimatedImageScale"));

      }
      if (v50)
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v50, CFSTR("CKAnimatedImageDurations"));
      v37 = (void *)objc_msgSend(v35, "copy");
      v54 = 0;
      v38 = objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v37, v11, 200, 0, &v54);
      v39 = v54;
      v40 = v39;
      if (v38 <= 0)
      {
        IMLogHandleForCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.5();

        v28 = 0;
        v15 = v40;
        goto LABEL_58;
      }

      v59 = v38;
      if (objc_msgSend(v11, "write:maxLength:", &v59, 8) == 8)
      {
        v59 = a3;
        if (objc_msgSend(v11, "write:maxLength:", &v59, 8) == 8)
        {
          LODWORD(v59) = 1129005385;
          v41 = objc_msgSend(v11, "write:maxLength:", &v59, 4);
          v28 = v41 == 4;
          if (v41 != 4)
          {
            objc_msgSend(v11, "streamError");
            v42 = objc_claimAutoreleasedReturnValue();

            IMLogHandleForCategory();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.2();

            goto LABEL_57;
          }
LABEL_58:
          objc_msgSend(v11, "close");

          v30 = properties;
          goto LABEL_59;
        }
        objc_msgSend(v11, "streamError");
        v42 = objc_claimAutoreleasedReturnValue();

        IMLogHandleForCategory();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.3();
      }
      else
      {
        objc_msgSend(v11, "streamError");
        v42 = objc_claimAutoreleasedReturnValue();

        IMLogHandleForCategory();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.4();
      }

      v28 = 0;
LABEL_57:
      v15 = v42;
      goto LABEL_58;
    }
    v28 = 0;
    goto LABEL_58;
  }
  IMLogHandleForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    +[CKMultiFrameImage(ASTC_Persistence) _writeASTCImagesWithCount:imageProvider:durations:toOutputStream:error:].cold.9();
  v28 = 0;
LABEL_64:

  return v28;
}

void __110__CKMultiFrameImage_ASTC_Persistence___writeASTCImagesWithCount_imageProvider_durations_toOutputStream_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (objc_msgSend(*(id *)(a1 + 32), "write:maxLength:", a2) != a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "streamError");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __110__CKMultiFrameImage_ASTC_Persistence___writeASTCImagesWithCount_imageProvider_durations_toOutputStream_error___block_invoke_cold_1(a1 + 40, v10, v11, v12, v13, v14, v15, v16);

    *a5 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)writeAsASTCToURL:(id)a3 error:(id *)a4
{
  return +[CKMultiFrameImage writeASTCImagesWithCount:imageProvider:durations:toFileURL:error:](CKMultiFrameImage, "writeASTCImagesWithCount:imageProvider:durations:toFileURL:error:", self->_frameCount, self->_frameProvider, self->_frameDurations, a3, a4);
}

- (id)createASTCDataRepresentationWithError:(id *)a3
{
  return +[CKMultiFrameImage ASTCDataForImagesWithCount:imageProvider:durations:error:](CKMultiFrameImage, "ASTCDataForImagesWithCount:imageProvider:durations:error:", self->_frameCount, self->_frameProvider, self->_frameDurations, a3);
}

+ (id)multiFrameImageWithContentsOfCPBitmapURL:(id)a3 error:(id *)a4
{
  void *v5;
  void *ImagesFromPath;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  CKMultiFrameImage *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  CFTypeRef cf;

  cf = 0;
  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  ImagesFromPath = (void *)CPBitmapCreateImagesFromPath();
  v7 = ImagesFromPath;
  if (!ImagesFromPath)
  {
    v10 = v21;
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(CPBitmap_Persistence) multiFrameImageWithContentsOfCPBitmapURL:error:].cold.1();

    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      v15 = 0;
      *a4 = v10;
      goto LABEL_11;
    }
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  v8 = objc_msgSend(ImagesFromPath, "count");
  if (!v8)
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(CPBitmap_Persistence) multiFrameImageWithContentsOfCPBitmapURL:error:].cold.2();
    goto LABEL_10;
  }
  v10 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __90__CKMultiFrameImage_CPBitmap_Persistence__multiFrameImageWithContentsOfCPBitmapURL_error___block_invoke;
  v17[3] = &unk_1E2755C38;
  v18 = 0;
  v19 = 0;
  v20 = v11;
  v12 = v11;
  v13 = 0;
  v14 = 0;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);
  v15 = -[CKMultiFrameImage initWithFrameImages:frameDurations:]([CKMultiFrameImage alloc], "initWithFrameImages:frameDurations:", v12, 0);

LABEL_11:
  return v15;
}

void __90__CKMultiFrameImage_CPBitmap_Persistence__multiFrameImageWithContentsOfCPBitmapURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  void *v13;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    v8 = v7;
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    if (v9)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
    }
    else
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __90__CKMultiFrameImage_CPBitmap_Persistence__multiFrameImageWithContentsOfCPBitmapURL_error___block_invoke_cold_1();

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scale");
    }
    v8 = v11;

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", v5, 0, v8);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);

}

+ (id)firstFrameImageWithContentsOfCPBitmapURL:(id)a3 error:(id *)a4
{
  void *v5;
  void *ImagesFromPath;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;

  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ImagesFromPath = (void *)CPBitmapCreateImagesFromPath();
  v7 = ImagesFromPath;
  if (!ImagesFromPath)
  {
    v10 = 0;
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(CPBitmap_Persistence) multiFrameImageWithContentsOfCPBitmapURL:error:].cold.1();

    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      v9 = 0;
      *a4 = v10;
      goto LABEL_14;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend(ImagesFromPath, "count", 0))
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(CPBitmap_Persistence) multiFrameImageWithContentsOfCPBitmapURL:error:].cold.2();
    goto LABEL_10;
  }
  v10 = 0;
  objc_msgSend(v7, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IMLogHandleForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __90__CKMultiFrameImage_CPBitmap_Persistence__multiFrameImageWithContentsOfCPBitmapURL_error___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", v11, 0, v15);
LABEL_14:

  return v9;
}

+ (BOOL)writeCPBitmapImagesWithCount:(unint64_t)a3 imageProvider:(id)a4 frameDurations:(id)a5 frameScales:(id)a6 toFileURL:(id)a7 error:(id *)a8
{
  void (**v12)(id, unint64_t);
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  const void *v18;
  unint64_t v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v41;
  id v42;
  id v44;
  id v45;
  uint8_t v46;
  _BYTE v47[7];
  id v48;
  _QWORD v49[6];
  uint64_t v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint8_t buf[4];
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v12 = (void (**)(id, unint64_t))a4;
  v13 = a5;
  v45 = a6;
  v44 = a7;
  objc_msgSend(v44, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "length"))
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(CPBitmap_Persistence) writeCPBitmapImagesWithCount:imageProvider:frameDurations:frameScales:toFileURL:error:].cold.1();
    goto LABEL_15;
  }
  if (v13 && objc_msgSend(v13, "count") != a3)
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(CPBitmap_Persistence) writeCPBitmapImagesWithCount:imageProvider:frameDurations:frameScales:toFileURL:error:].cold.6();
    goto LABEL_15;
  }
  if (objc_msgSend(v45, "count") != a3)
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(CPBitmap_Persistence) writeCPBitmapImagesWithCount:imageProvider:frameDurations:frameScales:toFileURL:error:].cold.5();
LABEL_15:

    v17 = 0;
    goto LABEL_50;
  }
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 1;
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x2020000000;
  v53 = 0;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __129__CKMultiFrameImage_CPBitmap_Persistence__writeCPBitmapImagesWithCount_imageProvider_frameDurations_frameScales_toFileURL_error___block_invoke;
  v49[3] = &unk_1E2755C60;
  v49[4] = &v50;
  v49[5] = &v54;
  objc_msgSend(v45, "enumerateObjectsUsingBlock:", v49);
  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (*((_BYTE *)v55 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v51[3]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v15, CFSTR("CKMultiFrameImageFrameScales"));

  }
  else if (v45)
  {
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v45, CFSTR("CKMultiFrameImageFrameScales"));
  }
  if (v13)
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v13, CFSTR("CKAnimatedImageDurations"));
  v48 = 0;
  v41 = (void *)objc_msgSend(v42, "copy");
  v18 = (const void *)CPBitmapWriterCreate();
  if (!v18)
  {
    IMLogHandleForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[CKMultiFrameImage(CPBitmap_Persistence) writeCPBitmapImagesWithCount:imageProvider:frameDurations:frameScales:toFileURL:error:].cold.2((uint64_t)&v48, v26, v27, v28, v29, v30, v31, v32);

    v17 = 0;
    goto LABEL_46;
  }
  v19 = 0;
  if (!a3)
  {
    v20 = 1;
    goto LABEL_38;
  }
  v20 = 1;
  do
  {
    v21 = (void *)MEMORY[0x193FF4740]();
    v12[2](v12, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(objc_retainAutorelease(v22), "CGImage");
      if ((CPBitmapWriterAddImage() & 1) != 0)
      {
        v24 = 1;
        goto LABEL_31;
      }
      IMLogHandleForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v48;
        _os_log_error_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_ERROR, "Failed to add image to cpbitmap file, stopping serialization. Error: %@", buf, 0xCu);
      }
    }
    else
    {
      IMLogHandleForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        +[CKMultiFrameImage(CPBitmap_Persistence) writeCPBitmapImagesWithCount:imageProvider:frameDurations:frameScales:toFileURL:error:].cold.4(&v46, v47, v25);
    }

    v24 = 0;
    v20 = 0;
LABEL_31:

    objc_autoreleasePoolPop(v21);
    if (!v24)
      goto LABEL_38;
    ++v19;
  }
  while (a3 != v19);
  v19 = a3;
LABEL_38:
  if (v19 == a3 && (v20 & 1) != 0)
  {
    if (CPBitmapWriterFinalize())
    {
      v20 = 1;
    }
    else
    {
      IMLogHandleForCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        +[CKMultiFrameImage(CPBitmap_Persistence) writeCPBitmapImagesWithCount:imageProvider:frameDurations:frameScales:toFileURL:error:].cold.3((uint64_t)&v48, v33, v34, v35, v36, v37, v38, v39);

      v20 = 0;
    }
  }
  CFRelease(v18);
  v17 = v20 & 1;
LABEL_46:
  if (a8 && !v17)
    *a8 = objc_retainAutorelease(v48);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
LABEL_50:

  return v17;
}

uint64_t __129__CKMultiFrameImage_CPBitmap_Persistence__writeCPBitmapImagesWithCount_imageProvider_frameDurations_frameScales_toFileURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  double v8;
  uint64_t v9;

  result = objc_msgSend(a2, "doubleValue");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (a3)
  {
    if (vabdd_f64(*(double *)(v9 + 24), v8) > 0.01)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else
  {
    *(double *)(v9 + 24) = v8;
  }
  return result;
}

- (id)_calculateFrameScales
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_frameCount);
  if (self->_frameCount)
  {
    v4 = 0;
    do
    {
      (*((void (**)(void))self->_frameProvider + 2))();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scale");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v4;
    }
    while (v4 < self->_frameCount);
  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (BOOL)writeAsCPBitmapToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t frameCount;
  id frameProvider;
  NSArray *frameDurations;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v15;

  v6 = a3;
  -[CKMultiFrameImage _calculateFrameScales](self, "_calculateFrameScales");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  frameCount = self->_frameCount;
  frameProvider = self->_frameProvider;
  frameDurations = self->_frameDurations;
  v15 = 0;
  v11 = +[CKMultiFrameImage writeCPBitmapImagesWithCount:imageProvider:frameDurations:frameScales:toFileURL:error:](CKMultiFrameImage, "writeCPBitmapImagesWithCount:imageProvider:frameDurations:frameScales:toFileURL:error:", frameCount, frameProvider, frameDurations, v7, v6, &v15);

  v12 = v15;
  if (!v11)
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CKMultiFrameImage(CPBitmap_Persistence) writeAsCPBitmapToURL:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v11;
}

- (void)initWithFrameCount:frameProvider:frameDurations:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Frame duration count does not match frame count, not initializing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __110__CKMultiFrameImage_ASTC_Persistence___writeASTCImagesWithCount_imageProvider_durations_toOutputStream_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Failed to write image data to stream with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __90__CKMultiFrameImage_CPBitmap_Persistence__multiFrameImageWithContentsOfCPBitmapURL_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Image did not include a scale in metadata, using display scale", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
