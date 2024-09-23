@implementation VCPMADImageSafetyClassificationTask

- (VCPMADImageSafetyClassificationTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADImageSafetyClassificationTask *v12;
  VCPMADImageSafetyClassificationTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPMADImageSafetyClassificationTask;
  v12 = -[VCPMADImageSafetyClassificationTask init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
  }

  return v13;
}

+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  objc_class *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequest:imageAsset:andSignpostPayload:", v8, v9, v10);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Incompatible request (%@) specified to %@", (uint8_t *)&v17, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

+ (id)dependencies
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
}

- (int)createUprightPixelBuffer:(__CVBuffer *)a3 fromSourceBuffer:(__CVBuffer *)a4 andOrientation:(unsigned int)a5
{
  CVReturn v7;
  signed int PixelFormatType;
  OSType v10;
  int v11;
  size_t Width;
  size_t Height;
  size_t v14;
  size_t v15;
  size_t v16;
  double v17;
  double v18;
  __int128 v19;
  double v20;
  double v21;
  const __CFDictionary *v28;
  CVReturn v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __CVBuffer *v47;
  uint8_t v48[4];
  int v49;
  CVReturn v50;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  CVReturn v53;
  CVPixelBufferRef v54;
  CVPixelBufferLockFlags v55;
  CFTypeRef cf;
  _BYTE v57[24];
  size_t v58;
  _BYTE v59[24];
  size_t BytesPerRow;
  uint64_t v61;
  uint64_t v62;
  uint8_t buf[32];
  double v64[3];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (a5 == 1)
  {
    v7 = 0;
    *a3 = (__CVBuffer *)CFRetain(a4);
    return v7;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  v10 = PixelFormatType;
  if (PixelFormatType > 1111970368)
  {
    if (PixelFormatType == 1111970369)
      goto LABEL_9;
    v11 = 1380401729;
  }
  else
  {
    if (PixelFormatType == 32)
      goto LABEL_9;
    v11 = 1094862674;
  }
  if (PixelFormatType == v11)
  {
LABEL_9:
    Width = CVPixelBufferGetWidth(a4);
    Height = CVPixelBufferGetHeight(a4);
    v14 = Height;
    if (a5 <= 4)
      v15 = Width;
    else
      v15 = Height;
    if (a5 <= 4)
      v16 = Height;
    else
      v16 = Width;
    *(_OWORD *)v64 = 0u;
    memset(buf, 0, sizeof(buf));
    switch(a5)
    {
      case 2u:
        v17 = (double)Width;
        *(_QWORD *)buf = 0xBFF0000000000000;
        *(_QWORD *)&buf[8] = 0;
        *(_QWORD *)&buf[16] = 0;
        *(_QWORD *)&buf[24] = 0x3FF0000000000000;
        goto LABEL_30;
      case 3u:
        v20 = (double)Width;
        v21 = (double)Height;
        *(_QWORD *)buf = 0xBFF0000000000000;
        *(_QWORD *)&buf[8] = 0;
        *(_QWORD *)&buf[16] = 0;
        *(_QWORD *)&buf[24] = 0xBFF0000000000000;
        goto LABEL_27;
      case 4u:
        v18 = (double)Height;
        *(_QWORD *)buf = 0x3FF0000000000000;
        *(_QWORD *)&buf[8] = 0;
        *(_QWORD *)&buf[16] = 0;
        *(_QWORD *)&buf[24] = 0xBFF0000000000000;
        goto LABEL_23;
      case 5u:
        v20 = (double)Height;
        v21 = (double)Width;
        __asm { FMOV            V2.2D, #-1.0 }
        *(_OWORD *)&buf[8] = _Q2;
LABEL_27:
        v64[0] = v20;
        v64[1] = v21;
        break;
      case 6u:
        v18 = (double)Width;
        *(_OWORD *)&buf[8] = xmmword_1B6FBCBB0;
        *(_QWORD *)&buf[24] = 0;
        v64[0] = 0.0;
LABEL_23:
        v64[1] = v18;
        break;
      case 7u:
        __asm { FMOV            V0.2D, #1.0; jumptable 00000001B6CAF804 case 7 }
        *(_OWORD *)&buf[8] = _Q0;
        *(_OWORD *)v64 = 0uLL;
        *(_QWORD *)&buf[24] = 0;
        break;
      case 8u:
        v17 = (double)Height;
        *(_OWORD *)&buf[8] = xmmword_1B6FBCBA0;
LABEL_30:
        v64[0] = v17;
        break;
      default:
        v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)buf = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&buf[16] = v19;
        *(_OWORD *)v64 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        break;
    }
    cf = 0;
    v61 = *MEMORY[0x1E0CA8FF0];
    v62 = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = CVPixelBufferCreate(0, v15, v16, v10, v28, (CVPixelBufferRef *)&cf);
    if (v7)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v59 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADImageSafetyClassificationTask CVPixelBuffer creation failed", v59, 2u);
      }
    }
    else
    {
      v53 = 0;
      v54 = a4;
      v55 = 1;
      if (a4)
      {
        v7 = CVPixelBufferLockBaseAddress(a4, 1uLL);
        v53 = v7;
        if (!v7
          || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
          && (*(_DWORD *)v59 = 134218240,
              *(_QWORD *)&v59[4] = v54,
              *(_WORD *)&v59[12] = 1024,
              *(_DWORD *)&v59[14] = v7,
              _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v59, 0x12u), (v7 = v53) == 0))
        {
          *(_QWORD *)v59 = CVPixelBufferGetBaseAddress(a4);
          *(_QWORD *)&v59[8] = v14;
          *(_QWORD *)&v59[16] = Width;
          BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
          v50 = 0;
          pixelBuffer = (CVPixelBufferRef)cf;
          unlockFlags = 0;
          if (cf)
          {
            v7 = CVPixelBufferLockBaseAddress((CVPixelBufferRef)cf, 0);
            v50 = v7;
            if (!v7
              || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
              && (*(_DWORD *)v57 = 134218240,
                  *(_QWORD *)&v57[4] = pixelBuffer,
                  *(_WORD *)&v57[12] = 1024,
                  *(_DWORD *)&v57[14] = v7,
                  _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v57, 0x12u), (v7 = v50) == 0))
            {
              *(_QWORD *)v57 = CVPixelBufferGetBaseAddress((CVPixelBufferRef)cf);
              *(_QWORD *)&v57[8] = v16;
              *(_QWORD *)&v57[16] = v15;
              v58 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)cf);
              v49 = 0;
              v29 = MEMORY[0x1BCCA239C](v59, v57, 0, buf, &v49, 4);
              v7 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v50);
              if (!v7)
              {
                v7 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v53);
                if (!v7)
                {
                  if (v29)
                  {
                    v7 = v29;
                    if ((int)MediaAnalysisLogLevel() >= 3
                      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)v48 = 0;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADImageSafetyClassificationTask failed to warp image", v48, 2u);
                    }
                  }
                  else
                  {
                    v47 = (__CVBuffer *)cf;
                    if (cf)
                      v47 = (__CVBuffer *)CFRetain(cf);
                    v7 = 0;
                    *a3 = v47;
                  }
                }
              }
              if (pixelBuffer
                && !v50
                && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
                && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
              }
            }
          }
          else
          {
            v39 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v39)
              -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v39, v40, v41, v42, v43, v44, v45, v46);
            v7 = -50;
          }
          if (v54
            && !v53
            && CVPixelBufferUnlockBaseAddress(v54, v55)
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
          }
        }
      }
      else
      {
        v30 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v30)
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v30, v31, v32, v33, v34, v35, v36, v37);
        v7 = -50;
      }
    }

    CF<opaqueCMSampleBuffer *>::~CF(&cf);
    return v7;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v10;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADImageSafetyClassificationTask failed: unsupported pixel format %d", buf, 8u);
  }
  return -50;
}

- (int)run
{
  unsigned __int8 v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  MADUserSafetyImageQRCodeDetector *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  MADImageSafetyClassificationRequest *v13;
  void *v14;
  void *v15;
  MADImageSafetyClassificationRequest *request;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  MADImageSafetyClassificationRequest *v38;
  void *v39;
  void *v40;
  void *v41;
  MADImageSafetyClassificationRequest *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  os_signpost_id_t v49;
  NSObject *v50;
  NSObject *v51;
  NSString *signpostPayload;
  int v53;
  MADImageSafetyClassificationRequest *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  NSString *v61;
  NSObject *v62;
  os_signpost_id_t v63;
  NSObject *v64;
  NSObject *v65;
  NSString *v66;
  MADImageSafetyClassificationRequest *v67;
  void *v68;
  id v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  NSString *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  NSString *v77;
  const void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  NSObject *v82;
  NSString *v83;
  NSString *v84;
  MADImageSafetyClassificationRequest *v85;
  void *v86;
  NSString *v87;
  NSString *v88;
  MADImageSafetyClassificationRequest *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  MADImageSafetyClassificationRequest *v94;
  void *v95;
  void *v96;
  void *v97;
  os_signpost_id_t spid;
  void *v99;
  id v100;
  const void *v101;
  __CVBuffer *v102;
  unsigned int v103;
  __CVBuffer *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  void *v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  _QWORD v119[2];
  _QWORD v120[2];
  _BYTE v121[128];
  void *v122;
  _QWORD v123[2];
  _QWORD v124[2];
  uint8_t buf[4];
  NSString *v126;
  uint64_t v127;
  _QWORD v128[4];

  v128[1] = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADImageSafetyClassificationTask running...", buf, 2u);
  }
  v3 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v3 & 1) != 0)
    return -128;
  if (!-[VCPMADServiceImageAsset userSafetyEligible](self->_imageAsset, "userSafetyEligible"))
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "User Safety either not entitled for client or not enabled", buf, 2u);
    }
    request = self->_request;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v127 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("User Safety either not entitled for client or not enabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v128[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v128, &v127, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADImageSafetyClassificationRequest setError:](request, "setError:", v21);

    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  if (!+[MADUserSafetyQRCodeDetector enabled](MADUserSafetyQRCodeDetector, "enabled"))
  {
LABEL_22:
    -[VCPMADServiceImageAsset nsfwClassifications](self->_imageAsset, "nsfwClassifications");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPMADImageSafetyClassificationTask leveraging pre-computed IVS result", buf, 2u);
      }
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
      v27 = 0.0;
      if (v26)
      {
        v28 = *(_QWORD *)v106;
        while (2)
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v106 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
            if (objc_msgSend(v30, "extendedSceneIdentifier") == 2147481854)
            {
              objc_msgSend(v30, "confidence");
              v27 = v32;
              v33 = (void *)MEMORY[0x1E0D8C998];
              VCPSpecialLabelFromExtendedSceneClassificationID(objc_msgSend(v30, "extendedSceneIdentifier"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v33, "isImageSensitiveForLabel:confidenceScore:classificationMode:", v34, 2, v27);

              goto LABEL_36;
            }
          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
          if (v26)
            continue;
          break;
        }
      }
      v31 = 0;
LABEL_36:

      v119[0] = *MEMORY[0x1E0D8C9C8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v120[0] = v35;
      v119[1] = *MEMORY[0x1E0D8C9D0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v120[1] = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = self->_request;
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D476F8]), "initWithIsSensitive:andAttributes:", v31, v37);
      v118 = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADImageSafetyClassificationRequest setResults:](v38, "setResults:", v40);

      -[VCPMADServiceImageAsset clientBundleID](self->_imageAsset, "clientBundleID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      MADPLLogIVSProcessing(v41, 1, -[VCPMADServiceImageAsset assetType](self->_imageAsset, "assetType"), v6);

      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADImageSafetyClassificationTask complete", buf, 2u);
      }

    }
    else
    {
      -[VCPMADImageSafetyClassificationTask logMemoryWithMessage:](self, "logMemoryWithMessage:", CFSTR("[ImageSafety] Before decode"));
      v104 = 0;
      v103 = 0;
      if (-[VCPMADServiceImageAsset loadLowResPixelBuffer:orientation:](self->_imageAsset, "loadLowResPixelBuffer:orientation:", &v104, &v103))
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADImageSafetyClassificationTask image loading failed", buf, 2u);
        }
        v42 = self->_request;
        v43 = (void *)MEMORY[0x1E0CB35C8];
        v116 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[MADImageSafetyClassificationRequest setError:](v42, "setError:", v46);

      }
      else
      {
        +[MADImageSafetyClassificationResource sharedResource](MADImageSafetyClassificationResource, "sharedResource");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "activateResource:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        VCPSignPostLog();
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = os_signpost_id_generate(v48);

        VCPSignPostLog();
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = v50;
        if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
        {
          signpostPayload = self->_signpostPayload;
          *(_DWORD *)buf = 138412290;
          v126 = signpostPayload;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v49, "CommSafetyHandler_scale", "%@", buf, 0xCu);
        }

        v102 = 0;
        Scaler::Scale(&self->_scaler, v104, &v102, 299, 299, 1111970369);
        if (v53)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADImageSafetyClassificationTask image pre-processing failed", buf, 2u);
          }
          v54 = self->_request;
          v55 = (void *)MEMORY[0x1E0CB35C8];
          v114 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image pre-processing failed"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = v56;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[MADImageSafetyClassificationRequest setError:](v54, "setError:", v58);

        }
        else
        {
          VCPSignPostLog();
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = v59;
          if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
          {
            v61 = self->_signpostPayload;
            *(_DWORD *)buf = 138412290;
            v126 = v61;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v60, OS_SIGNPOST_INTERVAL_END, v49, "CommSafetyHandler_scale", "%@", buf, 0xCu);
          }

          VCPSignPostLog();
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = os_signpost_id_generate(v62);

          VCPSignPostLog();
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = v64;
          if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
          {
            v66 = self->_signpostPayload;
            *(_DWORD *)buf = 138412290;
            v126 = v66;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v65, OS_SIGNPOST_INTERVAL_BEGIN, v63, "CommSafetyHandler_affine", "%@", buf, 0xCu);
          }

          v101 = 0;
          if (-[VCPMADImageSafetyClassificationTask createUprightPixelBuffer:fromSourceBuffer:andOrientation:](self, "createUprightPixelBuffer:fromSourceBuffer:andOrientation:", &v101, v102, v103))
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADImageSafetyClassificationTask image affine transform failed", buf, 2u);
            }
            v67 = self->_request;
            v68 = (void *)MEMORY[0x1E0CB35C8];
            v112 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image affine transform failed"));
            v113 = objc_claimAutoreleasedReturnValue();
            v99 = (void *)v113;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
            v69 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[MADImageSafetyClassificationRequest setError:](v67, "setError:", v70);
          }
          else
          {
            VCPSignPostLog();
            v71 = objc_claimAutoreleasedReturnValue();
            v72 = v71;
            if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
            {
              v73 = self->_signpostPayload;
              *(_DWORD *)buf = 138412290;
              v126 = v73;
              _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v72, OS_SIGNPOST_INTERVAL_END, v63, "CommSafetyHandler_affine", "%@", buf, 0xCu);
            }

            -[VCPMADImageSafetyClassificationTask logMemoryWithMessage:](self, "logMemoryWithMessage:", CFSTR("[ImageSafety] Before inference"));
            objc_msgSend(v44, "handler");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            if (v99)
            {
              VCPSignPostLog();
              v74 = objc_claimAutoreleasedReturnValue();
              spid = os_signpost_id_generate(v74);

              VCPSignPostLog();
              v75 = objc_claimAutoreleasedReturnValue();
              v76 = v75;
              if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
              {
                v77 = self->_signpostPayload;
                *(_DWORD *)buf = 138412290;
                v126 = v77;
                _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v76, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CommSafetyHandler_classifyPixelBuffer", "%@", buf, 0xCu);
              }

              v78 = v101;
              -[MADImageSafetyClassificationRequest stagedText](self->_request, "stagedText");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              -[MADImageSafetyClassificationRequest conversationIdentifier](self->_request, "conversationIdentifier");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = 0;
              objc_msgSend(v99, "classifyPixelBuffer:stagedText:inConversationWithIdentifier:error:", v78, v79, v80, &v100);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = v100;

              VCPSignPostLog();
              v81 = objc_claimAutoreleasedReturnValue();
              v82 = v81;
              if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
              {
                v83 = self->_signpostPayload;
                *(_DWORD *)buf = 138412290;
                v126 = v83;
                _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v82, OS_SIGNPOST_INTERVAL_END, spid, "CommSafetyHandler_classifyPixelBuffer", "%@", buf, 0xCu);
              }

              -[VCPMADImageSafetyClassificationTask logMemoryWithMessage:](self, "logMemoryWithMessage:", CFSTR("[ImageSafety] After inference"));
              if (v69)
              {
                if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v69, "description");
                  v84 = (NSString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v126 = v84;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADImageSafetyClassificationTask failed (%@)", buf, 0xCu);

                }
                v85 = self->_request;
                v86 = (void *)objc_msgSend(v69, "copy");
                -[MADImageSafetyClassificationRequest setError:](v85, "setError:", v86);

              }
              else
              {
                objc_msgSend(v70, "objectForKeyedSubscript:", *MEMORY[0x1E0D8C9C8]);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                v93 = objc_msgSend(v92, "BOOLValue");

                v94 = self->_request;
                v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D476F8]), "initWithIsSensitive:andAttributes:", v93, v70);
                v109 = v95;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                -[MADImageSafetyClassificationRequest setResults:](v94, "setResults:", v96);

                objc_msgSend(v45, "reset");
                -[VCPMADServiceImageAsset clientBundleID](self->_imageAsset, "clientBundleID");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                MADPLLogIVSProcessing(v97, 0, -[VCPMADServiceImageAsset assetType](self->_imageAsset, "assetType"), v6);

                if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADImageSafetyClassificationTask complete", buf, 2u);
                }
              }
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                v87 = (NSString *)objc_opt_class();
                *(_DWORD *)buf = 138412290;
                v126 = v87;
                v88 = v87;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ unavailable for classifying pixel buffer", buf, 0xCu);

              }
              v89 = self->_request;
              v90 = (void *)MEMORY[0x1E0CB35C8];
              v110 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ unavailable"), objc_opt_class());
              v69 = (id)objc_claimAutoreleasedReturnValue();
              v111 = v69;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v70);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              -[MADImageSafetyClassificationRequest setError:](v89, "setError:", v91);

            }
          }

          CF<opaqueCMSampleBuffer *>::~CF(&v101);
        }
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&v102);
      }

      CF<opaqueCMSampleBuffer *>::~CF((const void **)&v104);
    }

    return 0;
  }
  v7 = (void *)MEMORY[0x1BCCA1B2C]();
  v8 = objc_alloc_init(MADUserSafetyImageQRCodeDetector);
  -[MADUserSafetyImageQRCodeDetector sensitivityFromQRCodeInImage:signpostPayload:](v8, "sensitivityFromQRCodeInImage:signpostPayload:", self->_imageAsset, self->_signpostPayload);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v22 = (NSString *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v126 = v22;
      v23 = v22;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] processing failed.", buf, 0xCu);

    }
    goto LABEL_21;
  }
  if (!objc_msgSend(v9, "BOOLValue"))
  {
LABEL_21:

    objc_autoreleasePoolPop(v7);
    goto LABEL_22;
  }
  v11 = *MEMORY[0x1E0D8C9D0];
  v123[0] = *MEMORY[0x1E0D8C9C8];
  v123[1] = v11;
  v124[0] = MEMORY[0x1E0C9AAB0];
  v124[1] = &unk_1E6B722E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, v123, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_request;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D476F8]), "initWithIsSensitive:andAttributes:", 1, v12);
  v122 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADImageSafetyClassificationRequest setResults:](v13, "setResults:", v15);

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADImageSafetyClassificationTask complete", buf, 2u);
  }

  objc_autoreleasePoolPop(v7);
  return 0;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_DWORD *)self + 14) = 0;
  return self;
}

@end
