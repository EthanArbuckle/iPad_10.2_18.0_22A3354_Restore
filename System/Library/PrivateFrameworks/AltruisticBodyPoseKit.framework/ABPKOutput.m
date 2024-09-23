@implementation ABPKOutput

- (ABPKOutput)init
{
  ABPKOutput *v2;
  NSMutableArray *v3;
  NSMutableArray *rawDetection2dSkeletonABPKArray;
  CFTypeRef *p_vtPixelTransferSession;
  NSObject *v6;
  ABPKOutput *v7;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ABPKOutput;
  v2 = -[ABPKOutput init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    rawDetection2dSkeletonABPKArray = v2->_rawDetection2dSkeletonABPKArray;
    v2->_rawDetection2dSkeletonABPKArray = v3;

    p_vtPixelTransferSession = (CFTypeRef *)&v2->_vtPixelTransferSession;
    if (!VTPixelTransferSessionCreate(0, &v2->_vtPixelTransferSession))
    {
      v7 = v2;
      goto LABEL_8;
    }
    CFRelease(*p_vtPixelTransferSession);
    *p_vtPixelTransferSession = 0;
    __ABPKLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_210836000, v6, OS_LOG_TYPE_ERROR, " Unable to create pixel transfer session for image downscaling ", v9, 2u);
    }

  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *vtPixelTransferSession;
  objc_super v4;

  vtPixelTransferSession = self->_vtPixelTransferSession;
  if (vtPixelTransferSession)
    CFRelease(vtPixelTransferSession);
  if (-[ABPKOutput mlOverlayImage](self, "mlOverlayImage"))
    CVPixelBufferRelease(-[ABPKOutput mlOverlayImage](self, "mlOverlayImage"));
  v4.receiver = self;
  v4.super_class = (Class)ABPKOutput;
  -[ABPKOutput dealloc](&v4, sel_dealloc);
}

- (id)getDetection2dSkeletonABPKArray
{
  return self->_rawDetection2dSkeletonABPKArray;
}

- (void)setRawDetection2dSkeletonABPKArray:(id)a3
{
  objc_storeStrong((id *)&self->_rawDetection2dSkeletonABPKArray, a3);
}

- (int)saveDataToDir:(id)a3 withFileNamePrefix:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[ABPKOutput timestamp](self, "timestamp");
  v9 = v8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_%f.png"), v7, CFSTR("mlimage"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  writeImage(-[ABPKOutput mlImage](self, "mlImage"), v11);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_%f.png"), v7, CFSTR("mloverlayimage"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ABPKOutput mlOverlayImage](self, "mlOverlayImage"))
    writeImage(-[ABPKOutput mlOverlayImage](self, "mlOverlayImage"), v13);
  -[ABPKOutput saveOnlyPoseDataToDir:withFileNamePrefix:](self, "saveOnlyPoseDataToDir:withFileNamePrefix:", v6, v7);

  return 0;
}

- (int)saveOnlyPoseDataToDir:(id)a3 withFileNamePrefix:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  float v38;
  float v39;
  float v40;
  void *v41;
  id v43;
  void *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v46 = a3;
  v43 = a4;
  -[ABPKOutput timestamp](self, "timestamp");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%f.plist"), v43, v6);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "stringByAppendingPathComponent:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[ABPKOutput timestamp](self, "timestamp");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("timestamp"));

  -[ABPKOutput algorithmParams](self, "algorithmParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ABPKOutput algorithmParams](self, "algorithmParams");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "toDict");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("algorithm_params"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKey:", CFSTR("nil"), CFSTR("algorithm_params"));
  }
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[ABPKOutput algState](self, "algState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "detection2d");

  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v17 = self->_rawDetection2dSkeletonABPKArray;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v48;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v48 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v20), "toDictionary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v18);
    }

    objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("raw_detection_2d_array"));
    -[ABPKOutput rawDetection2dSkeletonABPK](self, "rawDetection2dSkeletonABPK");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "toDictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v23, CFSTR("raw_detection_2d"));

    -[ABPKOutput detection2dSkeletonABPK](self, "detection2dSkeletonABPK");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "toDictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v25, CFSTR("detection_2d"));

    -[ABPKOutput algState](self, "algState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "lifting3d"))
    {
      -[ABPKOutput algState](self, "algState");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "registration");

      if (!v28)
        goto LABEL_16;
      -[ABPKOutput liftingSkeletonABPK](self, "liftingSkeletonABPK");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "toDictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v29, CFSTR("lifting"));

    }
LABEL_16:
    -[ABPKOutput algState](self, "algState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "retargeting"))
    {
      -[ABPKOutput algState](self, "algState");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "registration");

      if (!v32)
      {
LABEL_20:

        goto LABEL_21;
      }
      -[ABPKOutput retargetedSkeletonABPK](self, "retargetedSkeletonABPK");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "toDictionary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v33, CFSTR("arvino"));

    }
    goto LABEL_20;
  }
LABEL_21:
  objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("skeleton_data"));
  -[ABPKOutput algState](self, "algState");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "toDict");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v35, CFSTR("algorithm_state"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[ABPKOutput algorithmReturnCode](self, "algorithmReturnCode"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v36, CFSTR("algorithm_return_code"));

  v37 = (void *)MEMORY[0x24BDD16E0];
  -[ABPKOutput timeABPKAlgorithmFinished](self, "timeABPKAlgorithmFinished");
  v39 = v38;
  -[ABPKOutput timeABPKAlgorithmStart](self, "timeABPKAlgorithmStart");
  objc_msgSend(v37, "numberWithDouble:", (float)(v39 - v40) * 1000.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v41, CFSTR("algorithm_compute_time"));

  objc_msgSend(v7, "writeToFile:atomically:", v45, 0);
  return 0;
}

- (uint64_t)overlayResultsOnImage:(uint64_t)a3 withCameraIntrinsics:
{
  return objc_msgSend(a1, "overlayResultsOnImage:withCameraIntrinsics:withConfig:", a3, CFSTR("yyyyn"));
}

- (uint64_t)overlayResultsOnImage:(__n128)a3 withCameraIntrinsics:(__n128)a4 withConfig:(uint64_t)a5
{
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unint64_t Width;
  unint64_t Height;
  OSType PixelFormatType;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  id v43;
  void *v44;
  int v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  __n128 v51;
  int v52;
  int v54;
  int v55;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[16];
  _BYTE v64[128];
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x24BDAC8D0];
  v9 = a7;
  if (objc_msgSend(v9, "length") != 5)
  {
    __ABPKLogSharedInstance();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = " Invalid overlay code ";
      v23 = v21;
      v24 = OS_LOG_TYPE_ERROR;
LABEL_59:
      _os_log_impl(&dword_210836000, v23, v24, v22, buf, 2u);
      goto LABEL_60;
    }
    goto LABEL_60;
  }
  objc_msgSend(v9, "substringWithRange:", 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", CFSTR("y"));

  objc_msgSend(v9, "substringWithRange:", 1, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", CFSTR("y"));

  objc_msgSend(v9, "substringWithRange:", 2, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v14, "isEqual:", CFSTR("y"));

  objc_msgSend(v9, "substringWithRange:", 3, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v15, "isEqual:", CFSTR("y"));

  objc_msgSend(v9, "substringWithRange:", 4, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", CFSTR("y"));

  Width = CVPixelBufferGetWidth(a6);
  Height = CVPixelBufferGetHeight(a6);
  if (!objc_msgSend((id)a1, "mlOverlayImage"))
  {
    v67 = *MEMORY[0x24BDC5668];
    v68[0] = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], Width, Height, 0x42475241u, (CFDictionaryRef)v21, (CVPixelBufferRef *)(a1 + 136)))
    {
      __ABPKLogSharedInstance();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v25, OS_LOG_TYPE_ERROR, " Could not create pixelbuffer for image overlay ", buf, 2u);
      }

      goto LABEL_60;
    }

  }
  if (!*(_QWORD *)(a1 + 16))
  {
    v65 = *MEMORY[0x24BDC5668];
    v66 = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], Width, Height, 0x42475241u, (CFDictionaryRef)v21, (CVPixelBufferRef *)(a1 + 16)))
    {
      __ABPKLogSharedInstance();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v26, OS_LOG_TYPE_ERROR, " Could not create _imageYCbCr buffer ", buf, 2u);
      }

      v27 = 4294960636;
      goto LABEL_61;
    }

  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a6);
  if (PixelFormatType == 32)
  {
LABEL_7:
    *(_QWORD *)(a1 + 16) = a6;
    goto LABEL_19;
  }
  if (PixelFormatType != 1278226488)
  {
    if (PixelFormatType != 1111970369)
      goto LABEL_19;
    goto LABEL_7;
  }
  convertFormatGrayScaleToARGB_BGRA(a6, (CVPixelBufferRef *)(a1 + 16));
LABEL_19:
  v28 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 8), *(CVPixelBufferRef *)(a1 + 16), *(CVPixelBufferRef *)(a1 + 136));
  if (!v17)
  {
    objc_msgSend((id)a1, "algState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "detection2d");

    if ((v32 & v11) != 0)
    {
      __ABPKLogSharedInstance();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v33, OS_LOG_TYPE_DEBUG, " Overlay raw 2d skeleton ", buf, 2u);
      }

      objc_msgSend((id)a1, "rawDetection2dSkeletonABPK");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = overlay2dResultOnImage(v34, *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 136), COERCE_DOUBLE(255));

    }
    objc_msgSend((id)a1, "algState");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "detection2d");

    if ((v36 & v13) != 0)
    {
      __ABPKLogSharedInstance();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v37, OS_LOG_TYPE_DEBUG, " Overlay 2d skeleton ", buf, 2u);
      }

      objc_msgSend((id)a1, "detection2dSkeletonABPK");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = overlay2dResultOnImage(v38, *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 136), COERCE_DOUBLE(0xFF00000000));

    }
    objc_msgSend((id)a1, "algState");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "lifting3d"))
    {
      objc_msgSend((id)a1, "algState");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "registration");

      if ((v41 & v55) == 0)
      {
LABEL_38:
        objc_msgSend((id)a1, "algState");
        v43 = (id)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v43, "retargeting"))
        {
LABEL_54:

          goto LABEL_55;
        }
        objc_msgSend((id)a1, "algState");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "registration");

        if ((v45 & v54) != 0)
        {
          __ABPKLogSharedInstance();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_210836000, v46, OS_LOG_TYPE_DEBUG, " Overlay retargeted skeleton ", buf, 2u);
          }

          objc_msgSend((id)a1, "retargetedSkeletonABPK");
          v43 = (id)objc_claimAutoreleasedReturnValue();
          v28 = overlay3dResultOnImage(v43, *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 136), a2, a3, a4, (double)Width, (double)Height, (__n128)xmmword_210881590);
          goto LABEL_54;
        }
LABEL_55:
        if (!v28)
        {
          v27 = 0;
          goto LABEL_62;
        }
        __ABPKLogSharedInstance();
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          goto LABEL_60;
        *(_WORD *)buf = 0;
        v22 = " Could not overlay image ";
        goto LABEL_58;
      }
      __ABPKLogSharedInstance();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v42, OS_LOG_TYPE_DEBUG, " Overlay 3d skeleton ", buf, 2u);
      }

      objc_msgSend((id)a1, "liftingSkeletonABPK");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = overlay3dResultOnImage(v39, *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 136), a2, a3, a4, (double)Width, (double)Height, (__n128)xmmword_210881580);
    }

    goto LABEL_38;
  }
  objc_msgSend((id)a1, "algState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "detection2d");

  if (!v30)
    goto LABEL_55;
  if ((v11 | v13 | v55 | v54) != 1)
  {
    __ABPKLogSharedInstance();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v47, OS_LOG_TYPE_DEBUG, " Overlay 2d face ", buf, 2u);
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v43 = *(id *)(a1 + 24);
    v48 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v60 != v49)
            objc_enumerationMutation(v43);
          v51.n128_u64[0] = 255;
          v51.n128_u64[1] = 255;
          v52 = drawFullyVisibleFace(*(void **)(*((_QWORD *)&v59 + 1) + 8 * i), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 136), v51);
        }
        v28 = v52;
        v48 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v48);
    }
    goto LABEL_54;
  }
  __ABPKLogSharedInstance();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v22 = " Face visualization should be drawn cleanly. Please make sure the first four letters in overlay string are all"
          " 'n' when the fifth is 'y'. ";
LABEL_58:
    v23 = v21;
    v24 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_59;
  }
LABEL_60:
  v27 = 4294960630;
LABEL_61:

LABEL_62:
  return v27;
}

- (BOOL)convertToStreamingDictionary:(id)a3 withSkeletonType:(id)a4 referenceFrame:(id)a5 includeFingerRotation:(BOOL)a6 yOffset:(float)a7
{
  id v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  void *v20;
  uint64_t v21;
  char *v22;
  unint64_t i;
  void *v24;
  unint64_t v25;
  uint64_t j;
  id v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  __n128 v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  char v54;
  _QWORD v56[2];
  __n128 v57;
  __n128 v58;
  __n128 v59;
  __n128 v60;
  __n128 v61;
  __n128 v62;
  __n128 v63;
  __n128 v64;
  id v65;
  ABPKOutput *v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  _QWORD *v71;
  _QWORD *v72;
  id v73;
  id v74;
  __int128 v75;
  _QWORD v76[4];
  _QWORD v77[5];

  v77[3] = *MEMORY[0x24BDAC8D0];
  v65 = a3;
  v68 = a4;
  v67 = a5;
  v69 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[ABPKOutput liftingSkeletonABPK](self, "liftingSkeletonABPK");
  v74 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v68, "isEqual:", CFSTR("Arvino")))
  {
    -[ABPKOutput retargetedSkeletonABPK](self, "retargetedSkeletonABPK");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v74;
  }
  v74 = v11;
  objc_msgSend(v11, "cameraRootTransform");
  v64 = v12;
  v63 = v13;
  v62 = v14;
  v61 = v15;
  objc_msgSend(v11, "deviceRootTransform");
  v59 = v16;
  v58 = v17;
  v57 = v18;
  v60 = v19;
  objc_msgSend(v11, "skeletonDefinition");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "jointCount");

  v56[1] = v56;
  v22 = (char *)v56 - ((4 * v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = &v56[-2 * v21];
  v71 = v72;
  for (i = 0; ; ++i)
  {
    objc_msgSend(v74, "skeletonDefinition");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "jointCount");

    if (i >= v25)
      break;
    *(_DWORD *)&v22[4 * i] = 1056964608;
  }
  if (objc_msgSend(v67, "isEqual:", CFSTR("Global")))
    objc_msgSend(v74, "getGlobalJointDataForSkeletonWithPosition:withOrientation:", v72, v71);
  else
    objc_msgSend(v74, "getLocalJointDataForSkeletonWithPosition:withOrientation:", v72, v71);
  v70 = v21;
  v66 = self;
  v73 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v70 >= 1)
  {
    for (j = 0; j != v70; ++j)
    {
      v27 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v74, "skeletonDefinition");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "jointName:", j);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v30) = *(_DWORD *)&v22[4 * j];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKey:", v31, CFSTR("confidence"));

      v75 = *(_OWORD *)&v72[2 * j];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = v32;
      HIDWORD(v33) = DWORD1(v75);
      LODWORD(v33) = DWORD1(v75);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v77[1] = v34;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v75), DWORD2(v75))));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v77[2] = v35;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKey:", v36, CFSTR("translation"));

      v75 = *(_OWORD *)&v71[2 * j];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v37;
      HIDWORD(v38) = DWORD1(v75);
      LODWORD(v38) = DWORD1(v75);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v76[1] = v39;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v75), HIDWORD(v75))));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v76[2] = v40;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v75), DWORD2(v75))));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v76[3] = v41;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 4);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKey:", v42, CFSTR("orientation"));

      objc_msgSend(v73, "setObject:forKey:", v27, v29);
    }
  }
  objc_msgSend(v69, "setObject:forKey:", v73, CFSTR("body_joints"));
  v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  simdMatrix4x4ToNSArray(v64, v63, v62, v61);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKey:", v44, CFSTR("camera_root_pose"));

  v45 = v60;
  v45.n128_f32[1] = v60.n128_f32[1] + a7;
  simdMatrix4x4ToNSArray(v59, v58, v57, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKey:", v46, CFSTR("device_root_pose"));

  -[ABPKOutput timestamp](v66, "timestamp");
  *(float *)&v47 = v47;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKey:", v48, CFSTR("timestamp"));

  if (!objc_msgSend(v68, "isEqual:", CFSTR("Lifting")))
  {
    -[ABPKOutput algState](v66, "algState");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v49, "retargeting") & 1) != 0)
    {
      -[ABPKOutput algState](v66, "algState");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "registration");

      if ((v54 & 1) != 0)
      {
        v52 = MEMORY[0x24BDBD1C8];
        goto LABEL_23;
      }
LABEL_22:
      v52 = MEMORY[0x24BDBD1C0];
      goto LABEL_23;
    }
LABEL_21:

    goto LABEL_22;
  }
  -[ABPKOutput algState](v66, "algState");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v49, "lifting3d") & 1) == 0)
    goto LABEL_21;
  -[ABPKOutput algState](v66, "algState");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "registration");

  if (v51)
    v52 = MEMORY[0x24BDBD1C8];
  else
    v52 = MEMORY[0x24BDBD1C0];
LABEL_23:
  objc_msgSend(v43, "setObject:forKey:", v52, CFSTR("pose_validity"));
  objc_msgSend(v69, "setObject:forKey:", v43, CFSTR("result_context"));
  objc_msgSend(v69, "setObject:forKey:", v67, CFSTR("joint_transform_type"));
  objc_msgSend(v69, "setObject:forKey:", v68, CFSTR("skeleton_type"));
  objc_msgSend(v65, "setObject:forKey:", v69, CFSTR("result_abpk"));

  return 1;
}

- (float)timeABPKAlgorithmFinished
{
  return self->_timeABPKAlgorithmFinished;
}

- (void)setTimeABPKAlgorithmFinished:(float)a3
{
  self->_timeABPKAlgorithmFinished = a3;
}

- (float)timeABPKAlgorithmStart
{
  return self->_timeABPKAlgorithmStart;
}

- (void)setTimeABPKAlgorithmStart:(float)a3
{
  self->_timeABPKAlgorithmStart = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__CVBuffer)mlImage
{
  return self->_mlImage;
}

- (void)setMlImage:(__CVBuffer *)a3
{
  self->_mlImage = a3;
}

- (ABPKCameraParams)cameraParams
{
  return (ABPKCameraParams *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCameraParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (ABPK2dSkeleton)rawDetection2dSkeletonABPK
{
  return (ABPK2dSkeleton *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRawDetection2dSkeletonABPK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (ABPK2dSkeleton)detection2dSkeletonABPK
{
  return (ABPK2dSkeleton *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDetection2dSkeletonABPK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (ABPKSkeleton)liftingSkeletonABPK
{
  return (ABPKSkeleton *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLiftingSkeletonABPK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (uint64_t)rawLiftingNetworkOutputJoints
{
  return *(_QWORD *)(a1 + 96);
}

- (void)setRawLiftingNetworkOutputJoints:(ABPKOutput *)self
{
  uint64_t v2;

  *(_QWORD *)self->_rawLiftingNetworkOutputJoints = v2;
}

- (ABPK2dSkeleton)registered2dSkeletonABPK
{
  return (ABPK2dSkeleton *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRegistered2dSkeletonABPK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (ABPKSkeleton)retargetedSkeletonABPK
{
  return (ABPKSkeleton *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRetargetedSkeletonABPK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (ABPKAlgorithmParams)algorithmParams
{
  return (ABPKAlgorithmParams *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAlgorithmParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (int)algorithmReturnCode
{
  return self->_algorithmReturnCode;
}

- (void)setAlgorithmReturnCode:(int)a3
{
  self->_algorithmReturnCode = a3;
}

- (ABPKAlgorithmState)algState
{
  return (ABPKAlgorithmState *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAlgState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (__CVBuffer)mlOverlayImage
{
  return self->_mlOverlayImage;
}

- (void)setMlOverlayImage:(__CVBuffer *)a3
{
  self->_mlOverlayImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algState, 0);
  objc_storeStrong((id *)&self->_algorithmParams, 0);
  objc_storeStrong((id *)&self->_retargetedSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_registered2dSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_liftingSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_detection2dSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_rawDetection2dSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_cameraParams, 0);
  objc_storeStrong((id *)&self->_rawDetection2dSkeletonABPKArray, 0);
}

@end
