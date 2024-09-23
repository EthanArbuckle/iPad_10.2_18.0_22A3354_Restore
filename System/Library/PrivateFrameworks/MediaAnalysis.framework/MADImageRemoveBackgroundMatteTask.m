@implementation MADImageRemoveBackgroundMatteTask

- (MADImageRemoveBackgroundMatteTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  MADImageRemoveBackgroundMatteTask *v11;
  MADImageRemoveBackgroundMatteTask *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MADImageRemoveBackgroundMatteTask;
  v11 = -[MADImageRemoveBackgroundTask initWithSignpostPayload:](&v14, sel_initWithSignpostPayload_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_request, a3);
    objc_storeStrong((id *)&v12->_imageAsset, a4);
  }

  return v12;
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
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)run
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  MADRemoveBackgroundMatteRequest *request;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  BOOL v40;
  void *v41;
  _BOOL4 v42;
  MADRemoveBackgroundMatteRequest *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  unsigned int v56;
  unsigned int v57;
  int v58;
  int v59;
  MADRemoveBackgroundMatteRequest *v60;
  double v61;
  double v62;
  MADRemoveBackgroundMatteRequest *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  MADRemoveBackgroundMatteRequest *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v75;
  CGSize v76;
  void *v77;
  void (**v78)(void);
  void *v79;
  id v80;
  const void *v81;
  double v82;
  double v83;
  CGSize v84;
  _QWORD aBlock[8];
  CFTypeRef v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  unsigned int v100;
  CFTypeRef cf;
  uint64_t v102;
  void *v103;
  void *v104;
  uint8_t v105[4];
  id v106;
  __int128 v107;
  CGSize v108;
  _BYTE buf[24];
  __int128 v110;
  id v111;
  uint64_t v112;
  _QWORD v113[4];
  CGRect v114;
  CGRect v115;
  CGRect v116;

  v113[1] = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[MADRemoveBackgroundMatteRequest cropResult](self->_request, "cropResult");
    v5 = -[MADRemoveBackgroundMatteRequest inPlace](self->_request, "inPlace");
    -[MADRemoveBackgroundMatteRequest instances](self->_request, "instances");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v5;
    LOWORD(v110) = 2112;
    *(_QWORD *)((char *)&v110 + 2) = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RemoveBackgroundMatte][%@] running (Crop: %d, In-Place: %d, Instances: %@)...", buf, 0x22u);

  }
  v7 = _os_feature_enabled_impl();
  if ((v7 & 1) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    v13 = v12;

    cf = 0;
    v100 = 0;
    if (-[VCPMADServiceImageAsset loadHighResPixelBuffer:orientation:](self->_imageAsset, "loadHighResPixelBuffer:orientation:", &cf, &v100))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RemoveBackgroundMatte][%@] image loading failed", buf, 0xCu);

      }
      request = self->_request;
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v112 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v113[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, &v112, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADRemoveBackgroundMatteRequest setError:](request, "setError:", v19);

      goto LABEL_94;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&v110 = __Block_byref_object_copy__51;
    *((_QWORD *)&v110 + 1) = __Block_byref_object_dispose__51;
    v111 = 0;
    v94 = 0;
    v95 = &v94;
    v96 = 0x3032000000;
    v97 = __Block_byref_object_copy__51;
    v98 = __Block_byref_object_dispose__51;
    v99 = 0;
    v88 = 0;
    v89 = &v88;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__51;
    v92 = __Block_byref_object_dispose__51;
    v93 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3321888768;
    aBlock[2] = __40__MADImageRemoveBackgroundMatteTask_run__block_invoke;
    aBlock[3] = &unk_1E6B14578;
    aBlock[4] = self;
    aBlock[5] = buf;
    aBlock[6] = &v94;
    aBlock[7] = &v88;
    v86 = cf;
    if (cf)
      CFRetain(cf);
    v87 = v100;
    v78 = (void (**)(void))_Block_copy(aBlock);
    v82 = 0.0;
    v83 = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v76 = _Q0;
    v84 = _Q0;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v107) = 138412290;
      *(_QWORD *)((char *)&v107 + 4) = v25;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[RemoveBackgroundMatte][%@] Checking for cached mask state...", (uint8_t *)&v107, 0xCu);

    }
    +[MADImageRemoveBackgroundResource sharedResource](MADImageRemoveBackgroundResource, "sharedResource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "cachedMaskState");
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v79, "matchesImageAsset:", self->_imageAsset))
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v107) = 138412290;
        *(_QWORD *)((char *)&v107 + 4) = v27;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMatte][%@] Matched cached mask state", (uint8_t *)&v107, 0xCu);

      }
      objc_msgSend(v79, "instanceMaskObservation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v78[2]();
      objc_msgSend(v79, "regionOfInterest");
      v82 = v29;
      v83 = v30;
      v84.width = v31;
      v84.height = v32;
LABEL_52:
      if (-[MADRemoveBackgroundMatteRequest inPlace](self->_request, "inPlace"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v44 = 1;
          goto LABEL_59;
        }
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v107) = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMatte] Perform-in-place requested for ineligible input; ignoring",
            (uint8_t *)&v107,
            2u);
        }
      }
      v44 = 0;
LABEL_59:
      -[MADRemoveBackgroundMatteRequest instances](self->_request, "instances");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v45, "count"))
      {
        if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v107) = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMatte] No instances specified, using all", (uint8_t *)&v107, 2u);
        }
        objc_msgSend(v28, "allInstances");
        v46 = objc_claimAutoreleasedReturnValue();

        v45 = (void *)v46;
      }
      v107 = 0uLL;
      v108 = v76;
      v47 = v89[5];
      v48 = -[MADRemoveBackgroundMatteRequest cropResult](self->_request, "cropResult");
      v80 = 0;
      v49 = (void *)objc_msgSend(v28, "generateMaskedImageOfInstances:fromRequestHandler:inPlace:croppedToInstancesExtent:returnCropRect:error:", v45, v47, v44, v48, &v107, &v80);
      v50 = v80;
      v81 = v49;
      if (v50)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v105 = 138412290;
          v106 = v50;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RemoveBackgroundMatte] Matting failed: %@", v105, 0xCu);
        }
        -[MADRemoveBackgroundMatteRequest setError:](self->_request, "setError:", v50);
LABEL_92:
        CF<opaqueCMSampleBuffer *>::~CF(&v81);

        goto LABEL_93;
      }
      CVPixelBufferGetIOSurface((CVPixelBufferRef)v49);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v77)
      {
        v63 = self->_request;
        v64 = (void *)MEMORY[0x1E0CB35C8];
        v102 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to obtain image from Vision"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = v65;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[MADRemoveBackgroundMatteRequest setError:](v63, "setError:", v67);

        goto LABEL_88;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetWidth((CVPixelBufferRef)cf));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetHeight((CVPixelBufferRef)cf), v51);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v100);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v51;
      v54 = v75;
      v55 = v52;
      if (!objc_msgSend(v53, "intValue") || !objc_msgSend(v54, "intValue"))
      {
        v62 = *MEMORY[0x1E0C9D820];
        v61 = *(double *)(MEMORY[0x1E0C9D820] + 8);
LABEL_87:

        *(double *)&v107 = *(double *)&v107 + v82 * v62;
        v114.origin.x = *(double *)&v107;
        *((double *)&v107 + 1) = *((double *)&v107 + 1) + v83 * v61;
        v114.origin.y = *((double *)&v107 + 1);
        v114.size = v108;
        v116.origin.x = 0.0;
        v116.origin.y = 0.0;
        v116.size.width = v62;
        v116.size.height = v61;
        v115 = CGRectIntersection(v114, v116);
        *(CGFloat *)&v107 = v115.origin.x;
        *((_QWORD *)&v107 + 1) = *(_QWORD *)&v115.origin.y;
        v108.width = v115.size.width;
        v108.height = v115.size.height;
        +[VCPGeometryUtils normalizedRectForRect:inBounds:](VCPGeometryUtils, "normalizedRectForRect:inBounds:");
        v68 = self->_request;
        v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D47768]), "initWithSurface:cropRect:", v77, v69, v70, v71, v72);
        v104 = v65;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[MADRemoveBackgroundMatteRequest setResults:](v68, "setResults:", v66);
LABEL_88:

        objc_msgSend((id)v95[5], "reset");
        MADPLLogStaticStickerCreation(v13);
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v105 = 138412290;
          v106 = v73;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RemoveBackgroundMatte][%@] complete", v105, 0xCu);

        }
        goto LABEL_92;
      }
      if (v55)
      {
        v56 = objc_msgSend(v55, "unsignedIntValue");
        v57 = v56;
        if (v56 - 9 > 0xFFFFFFF7)
        {
          if (v56 > 4)
          {
            v58 = objc_msgSend(v54, "intValue");
            v59 = objc_msgSend(v53, "intValue");
            goto LABEL_86;
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v105 = 67109120;
          LODWORD(v106) = v57;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Orientation value %u invalid, assuming kCGImagePropertyOrientationUp", v105, 8u);
        }
      }
      v58 = objc_msgSend(v53, "intValue");
      v59 = objc_msgSend(v54, "intValue");
LABEL_86:
      v61 = (double)v59;
      v62 = (double)v58;
      goto LABEL_87;
    }
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v107) = 138412290;
      *(_QWORD *)((char *)&v107 + 4) = v33;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RemoveBackgroundMatte][%@] No matching cached mask state", (uint8_t *)&v107, 0xCu);

    }
    if ((v7 & 1) == 0)
    {
      -[VCPMADServiceImageAsset isSensitive](self->_imageAsset, "isSensitive");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 == 0;

      if (v35)
      {
        -[MADImageRemoveBackgroundTask computeSensitivityOfPixelBuffer:](self, "computeSensitivityOfPixelBuffer:", cf);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "BOOLValue"))
        {
          if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v107) = 138412290;
            *(_QWORD *)((char *)&v107 + 4) = v37;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMask][%@] Skipping for ineligible image", (uint8_t *)&v107, 0xCu);

          }
          -[MADRemoveBackgroundMatteRequest setResults:](self->_request, "setResults:", MEMORY[0x1E0C9AA60]);

          goto LABEL_93;
        }

      }
    }
    *(_QWORD *)&v107 = 0;
    -[MADRemoveBackgroundMatteRequest imageType](self->_request, "imageType");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      -[MADRemoveBackgroundMatteRequest imageType](self->_request, "imageType");
      v7 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v7, "integerValue") == 1)
      {

        goto LABEL_45;
      }
    }
    v39 = -[VCPMADServiceImageAsset isScreenshot](self->_imageAsset, "isScreenshot");
    v40 = v39;
    if (v38)
    {

      if (!v40)
        goto LABEL_50;
    }
    else if (!v39)
    {
LABEL_50:
      v78[2]();
      -[MADImageRemoveBackgroundTask generateMaskWithRequestHandler:regionOfInterest:error:](self, "generateMaskWithRequestHandler:regionOfInterest:error:", v89[5], &v107, v82, v83, v84);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {

        goto LABEL_52;
      }
      v60 = self->_request;
      if ((_QWORD)v107)
        -[MADRemoveBackgroundMatteRequest setError:](v60, "setError:");
      else
        -[MADRemoveBackgroundMatteRequest setResults:](v60, "setResults:", MEMORY[0x1E0C9AA60]);
LABEL_82:

LABEL_93:
      CF<opaqueCMSampleBuffer *>::~CF(&v86);
      _Block_object_dispose(&v88, 8);

      _Block_object_dispose(&v94, 8);
      _Block_object_dispose(buf, 8);

LABEL_94:
      CF<opaqueCMSampleBuffer *>::~CF(&cf);
      return 0;
    }
LABEL_45:
    v41 = (void *)MEMORY[0x1BCCA1B2C]();
    v42 = -[MADImageRemoveBackgroundTask computeRegionOfInterest:pixelBuffer:orientation:error:](self, "computeRegionOfInterest:pixelBuffer:orientation:error:", &v82, cf, v100, &v107);
    if (!v42)
    {
      v43 = self->_request;
      if ((_QWORD)v107)
        -[MADRemoveBackgroundMatteRequest setError:](v43, "setError:");
      else
        -[MADRemoveBackgroundMatteRequest setResults:](v43, "setResults:", MEMORY[0x1E0C9AA60]);
    }
    objc_autoreleasePoolPop(v41);
    if (!v42)
      goto LABEL_82;
    goto LABEL_50;
  }
  -[VCPMADServiceImageAsset isSensitive](self->_imageAsset, "isSensitive");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || !objc_msgSend(v8, "BOOLValue"))
  {

    goto LABEL_12;
  }
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMatte][%@] Skipping for ineligible image", buf, 0xCu);

  }
  -[MADRemoveBackgroundMatteRequest setResults:](self->_request, "setResults:", MEMORY[0x1E0C9AA60]);

  return 0;
}

void __40__MADImageRemoveBackgroundMatteTask_run__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[MADImageRemoveBackgroundResource sharedResource](MADImageRemoveBackgroundResource, "sharedResource");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setMaskOnly:", 0);
  +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateResource:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  VCPSignPostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    objc_msgSend(*(id *)(a1 + 32), "signpostPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v13;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VNImageRequestHandler_init", "%@", (uint8_t *)&v24, 0xCu);

  }
  v14 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v15 = *(_QWORD *)(a1 + 64);
  v16 = *(unsigned int *)(a1 + 72);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v14, "initWithCVPixelBuffer:orientation:options:session:", v15, v16, MEMORY[0x1E0C9AA70], v17);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

  VCPSignPostLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v21))
  {
    objc_msgSend(*(id *)(a1 + 32), "signpostPayload");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v23;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_END, v10, "VNImageRequestHandler_init", "%@", (uint8_t *)&v24, 0xCu);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
