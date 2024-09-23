@implementation ABPKPersonIDTracker

- (ABPKPersonIDTracker)init
{
  ABPKPersonIDTracker *v2;
  id v3;
  void *v4;
  uint64_t v5;
  ANSTISPAlgorithm *anstAlgorithm;
  ANSTISPAlgorithm *v7;
  NSObject *v8;
  NSObject *v9;
  ABPKPersonIDTracker *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ABPKPersonIDTracker;
  v2 = -[ABPKPersonIDTracker init](&v15, sel_init);
  if (!v2)
    goto LABEL_5;
  if ((isANSTPersonTrackerSupportedOnThisDevice() & 1) == 0)
  {
    __ABPKLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v9, OS_LOG_TYPE_ERROR, " ABPKPersonIDTracker not supported on this device ", buf, 2u);
    }
    goto LABEL_11;
  }
  v3 = objc_alloc(MEMORY[0x24BDFD240]);
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v3, "initWithConfiguration:", v4);
  anstAlgorithm = v2->_anstAlgorithm;
  v2->_anstAlgorithm = (ANSTISPAlgorithm *)v5;

  v7 = v2->_anstAlgorithm;
  v13 = 0;
  LOBYTE(v3) = -[ANSTISPAlgorithm prepareWithError:](v7, "prepareWithError:", &v13);
  v8 = v13;
  v9 = v8;
  if ((v3 & 1) == 0)
  {
    __ABPKLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_ERROR, " Failed to initialize ANST algorithm for multi-person tracking ", buf, 2u);
    }

LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }

LABEL_5:
  v10 = v2;
LABEL_12:

  return v10;
}

- (CGRect)_rotateBoundingBoxToPortrait:(CGRect)a3 withImageRes:(CGSize)a4
{
  CGFloat width;
  CGFloat v5;
  double v6;
  double v7;
  double height;
  double v9;
  CGRect result;

  width = a3.size.width;
  v5 = a4.width * 0.5 - (a3.origin.y - a4.width * 0.5);
  v6 = a4.height * 0.5 + a3.origin.x - a4.height * 0.5;
  v7 = v5 - a3.size.height;
  height = a3.size.height;
  v9 = width;
  result.size.height = v9;
  result.size.width = height;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (int)runWithInput:(__CVBuffer *)a3 atTimeStamp:(double)a4 andOutput:(id)a5
{
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  NSObject *v10;
  OSType v11;
  NSObject *v12;
  NSObject *v13;
  ANSTISPAlgorithm *anstAlgorithm;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t i;
  ABPKTrackedObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  ABPKTrackedObject *v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  const char *v43;
  const __CFDictionary *pixelBufferAttributes;
  id v46;
  id v47;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v46 = a5;
  if (!a3)
  {
    __ABPKLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_ERROR, " Input image is nil ", buf, 2u);
    }
    goto LABEL_30;
  }
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (Height > Width)
  {
    __ABPKLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_ERROR, " ABPKPersonIDTracker: Portrait image is not supported ", buf, 2u);
    }
LABEL_30:

LABEL_43:
    v41 = -6668;
    goto LABEL_44;
  }
  v11 = PixelFormatType;
  if (PixelFormatType != 32 && PixelFormatType != 875704438 && PixelFormatType != 1111970369)
  {
    __ABPKLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_ERROR, " ABPKPersonIDTracker: Input image is of invalid format ", buf, 2u);
    }
    goto LABEL_30;
  }
  pixelBufferOut = 0;
  v51 = *MEMORY[0x24BDC5668];
  v52[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  pixelBufferAttributes = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (v11 != 1111970369)
  {
    if (v11 == 875704438)
    {
      __ABPKLogSharedInstance();
      v38 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        goto LABEL_38;
      *(_WORD *)buf = 0;
      v39 = " \t\t ABPKPersonIDTracker: Converting image format: YCbCr --> BGRA ";
    }
    else
    {
      __ABPKLogSharedInstance();
      v38 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        goto LABEL_38;
      *(_WORD *)buf = 0;
      v39 = " \t\t ABPKPersonIDTracker: Converting image format: ARGB --> BGRA ";
    }
    _os_log_impl(&dword_210836000, v38, OS_LOG_TYPE_DEBUG, v39, buf, 2u);
LABEL_38:

    if (CVPixelBufferCreate(0, Width, Height, 0x42475241u, pixelBufferAttributes, &pixelBufferOut))
    {
      __ABPKLogSharedInstance();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v43 = " ABPKPersonIDTracker: Could not create imageBGRA buffer ";
LABEL_41:
        _os_log_impl(&dword_210836000, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
      }
    }
    else if (v11 == 875704438)
    {
      if (!convertFormatYCbCrToBGRA(a3, &pixelBufferOut))
        goto LABEL_16;
      __ABPKLogSharedInstance();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v43 = " ABPKPersonIDTracker: Could not convert Format YCbCr to BGRA. ";
        goto LABEL_41;
      }
    }
    else
    {
      if (!changeChannelsARGB(a3, &pixelBufferOut))
        goto LABEL_16;
      __ABPKLogSharedInstance();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v43 = " ABPKPersonIDTracker: changeChannelsARGB failed. ";
        goto LABEL_41;
      }
    }

    goto LABEL_43;
  }
  __ABPKLogSharedInstance();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " \t\t ABPKPersonIDTracker: Image is already BGRA type ", buf, 2u);
  }

  pixelBufferOut = a3;
LABEL_16:
  __ABPKLogSharedInstance();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " Input image is landscape ", buf, 2u);
  }

  anstAlgorithm = self->_anstAlgorithm;
  v47 = 0;
  -[ANSTISPAlgorithm resultForPixelBuffer:error:](anstAlgorithm, "resultForPixelBuffer:error:", pixelBufferOut, &v47);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v47;
  v17 = v16;
  if (!v15 || v16)
  {
    __ABPKLogSharedInstance();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v40, OS_LOG_TYPE_ERROR, " No objects found in this image ", buf, 2u);
    }

    goto LABEL_43;
  }
  objc_msgSend(v15, "detectedObjectsForCategory:", *MEMORY[0x24BDFD220]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __ABPKLogSharedInstance();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 134217984;
    v50 = v20;
    _os_log_impl(&dword_210836000, v19, OS_LOG_TYPE_DEBUG, " ABPKPersonIDTracker: Full bodies found in the image: %lu ", buf, 0xCu);
  }

  for (i = 0; objc_msgSend(v18, "count") > i; ++i)
  {
    v22 = [ABPKTrackedObject alloc];
    objc_msgSend(v18, "objectAtIndexedSubscript:", i);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "objectID");
    objc_msgSend(v18, "objectAtIndexedSubscript:", i);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "category");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", i);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "boundingBox");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(v18, "objectAtIndexedSubscript:", i);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[ABPKTrackedObject initWithObjectID:category:boundingBox:confidence:](v22, "initWithObjectID:category:boundingBox:confidence:", v24, v26, objc_msgSend(v36, "confidence"), v29, v31, v33, v35);

    objc_msgSend(v46, "addObject:", v37);
  }

  v41 = 0;
LABEL_44:

  return v41;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anstAlgorithm, 0);
}

@end
