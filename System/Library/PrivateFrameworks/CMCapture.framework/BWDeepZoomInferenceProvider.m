@implementation BWDeepZoomInferenceProvider

+ (void)initialize
{
  objc_opt_class();
}

- (BWDeepZoomInferenceProvider)initWithConfiguration:(id)a3 resourceProvider:(id)a4
{
  NSMutableArray *v7;
  BWInferenceLazyVideoRequirement *v8;
  BWInferenceLazyVideoRequirement *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BWInferenceLazyVideoRequirement *v18;
  BWInferenceVideoRequirement *p_super;
  id v20;
  int v21;
  int v22;
  uint64_t v23;
  unsigned int v24;
  opaqueCMFormatDescription *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  if (!a3
    || !objc_msgSend(a3, "version")
    || !objc_msgSend(a3, "tuningParameters")
    || objc_msgSend(a3, "type") != 1
    && objc_msgSend(a3, "type") != 2
    && objc_msgSend(a3, "type") != 3)
  {
    v20 = 0;
    p_super = 0;
    v7 = 0;
    goto LABEL_41;
  }
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v7)
    goto LABEL_40;
  v8 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", CFSTR("PrimaryFormat"), CFSTR("PrimaryFormat"), &__block_literal_global_120);
  if (!v8)
    goto LABEL_40;
  -[NSMutableArray addObject:](v7, "addObject:", v8);
  if (objc_msgSend(a3, "type") != 3)
    goto LABEL_19;
  v9 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", 0x1E4951618, 0x1E4951618, &__block_literal_global_4_0);
  if (!v9)
  {
LABEL_40:
    v20 = 0;
    p_super = 0;
    goto LABEL_41;
  }
  -[NSMutableArray addObject:](v7, "addObject:", v9);
  if (FigCaptureVideoDimensionsAreValid(objc_msgSend(a3, "stereoPhotoOutputDimensions")))
  {
    v10 = objc_msgSend(a3, "type");
    v11 = CFSTR("Lite");
    if (v10 == 2)
      v11 = CFSTR("Standard");
    if (v10 == 3)
      v12 = CFSTR("Transfer");
    else
      v12 = v11;
    v13 = (void *)objc_msgSend(a3, "tuningParameters");
    v14 = *MEMORY[0x1E0D05A28];
    if (!objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A28]), "objectForKeyedSubscript:", v12))
    {
      v15 = (void *)objc_msgSend((id)objc_msgSend(a3, "tuningParameters"), "mutableCopy");
      v16 = (void *)objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v14), "mutableCopy");
      v17 = (void *)objc_msgSend(a3, "tuningParameters");
      objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]), "objectForKeyedSubscript:", v12), v12);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v14);
      objc_msgSend(a3, "setTuningParameters:", v15);

    }
  }
LABEL_19:
  v18 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", objc_msgSend(a3, "outputAttachedMediaKey"), objc_msgSend(a3, "outputAttachedMediaKey"), &__block_literal_global_5_0);
  p_super = &v18->super;
  if (v18
    && (v37[0] = v18,
        v35.receiver = self,
        v35.super_class = (Class)BWDeepZoomInferenceProvider,
        (self = -[BWTiledEspressoInferenceProvider initWithConfiguration:inputVideoRequirements:outputVideoRequirements:resourceProvider:](&v35, sel_initWithConfiguration_inputVideoRequirements_outputVideoRequirements_resourceProvider_, a3, v7, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1), a4)) != 0)&& BWLoadProcessorBundle((uint64_t)CFSTR("SuperResolution"), objc_msgSend(a3, "version")))
  {
    v20 = objc_alloc_init(NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMIDeepZoomProcessorV%d"), objc_msgSend(a3, "version"))));
    if (v20)
    {
      objc_msgSend(v20, "setTuningParameters:", objc_msgSend(a3, "tuningParameters"));
      objc_msgSend(v20, "setMetalCommandQueue:", objc_msgSend(a3, "metalCommandQueue"));
      v21 = objc_msgSend(a3, "type");
      v22 = objc_msgSend(a3, "mode");
      if (v21 == 3)
      {
        v24 = v22 == 5 ? 5 : 3;
        v23 = v22 == 4 ? 4 : v24;
      }
      else
      {
        v23 = v21 == 2 ? 2 : 1;
      }
      if (!objc_msgSend(v20, "prepareToProcess:", v23))
      {
        self->_inputVideoRequirements = v7;
        self->_outputVideoRequirement = p_super;
        self->_deepZoomProcessor = (CMIDeepZoomProcessor *)v20;
        self->_inferenceConfig = (BWDeepZoomInferenceConfiguration *)a3;
        v25 = -[BWVideoFormat formatDescription](-[BWInferenceVideoFormat underlyingVideoFormat](-[BWInferenceVideoRequirement videoFormat](p_super, "videoFormat"), "underlyingVideoFormat"), "formatDescription");
        if (v25)
          v25 = (opaqueCMFormatDescription *)CFRetain(v25);
        self->_outputFormatDescription = v25;
        return self;
      }
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_41:

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v7);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v28);
  }

  return 0;
}

id __70__BWDeepZoomInferenceProvider_initWithConfiguration_resourceProvider___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v4;

  LOWORD(v4) = objc_msgSend(a2, "width");
  HIWORD(v4) = objc_msgSend(a2, "height");
  return +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:includesInvalidContent:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:includesInvalidContent:", objc_msgSend(a2, "pixelFormat"), v4, 1);
}

id __70__BWDeepZoomInferenceProvider_initWithConfiguration_resourceProvider___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int v4;

  LOWORD(v4) = objc_msgSend(a2, "width");
  HIWORD(v4) = objc_msgSend(a2, "height");
  return +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:includesInvalidContent:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:includesInvalidContent:", objc_msgSend(a2, "pixelFormat"), v4, 0);
}

id __70__BWDeepZoomInferenceProvider_initWithConfiguration_resourceProvider___block_invoke_3(uint64_t a1, void *a2)
{
  unsigned int v4;

  LOWORD(v4) = objc_msgSend(a2, "width");
  HIWORD(v4) = objc_msgSend(a2, "height");
  return +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:includesInvalidContent:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:includesInvalidContent:", objc_msgSend(a2, "pixelFormat"), v4, 1);
}

- (void)dealloc
{
  NSMutableArray *inputVideoRequirements;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  inputVideoRequirements = self->_inputVideoRequirements;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(inputVideoRequirements);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputVideoRequirements, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  v9.receiver = self;
  v9.super_class = (Class)BWDeepZoomInferenceProvider;
  -[BWTiledEspressoInferenceProvider dealloc](&v9, sel_dealloc);
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  if (-[BWDeepZoomInferenceConfiguration type](self->_inferenceConfig, "type") == 3)
    return 3;
  else
    return 0;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  CFTypeRef v10;
  void *v11;
  const __CFString *v12;
  CFTypeRef v13;
  void *v14;
  double FinalCropRect;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  int v22;
  opaqueCMSampleBuffer *AttachedMedia;
  __CVBuffer *ImageBuffer;
  unint64_t v25;
  unsigned int v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  float64x2_t *p_denormalizedSourceCropRect;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  opaqueCMSampleBuffer *v49;
  opaqueCMSampleBuffer *v50;
  CFTypeRef v51;
  CFTypeRef v52;
  CVImageBufferRef v53;
  __CVBuffer *v54;
  CVImageBufferRef v55;
  __CVBuffer *v56;
  int64_t v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  __int128 v65;
  __int128 v66;
  double ValidBufferRect;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double updated;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  float64_t v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  unsigned int v95;
  unsigned int v96;
  uint64_t v101;
  float32x2_t v102;
  float v103;
  float v104;
  BOOL v105;
  float32x2_t v106;
  __int16 v108;
  __int16 v109;
  double v111;
  float v112;
  double v113;
  double v114;
  float v115;
  double v116;
  double v117;
  double v118;
  float v119;
  id v120;
  const __CFString *key;
  float keya;
  uint64_t v125;
  int v127;
  CGFloat v128;
  unint64_t v129;
  unsigned int v130;
  objc_super v131;
  CGAffineTransform v132;
  CGAffineTransform v133;
  CGAffineTransform v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  -[CMIDeepZoomProcessor finishProcessing](self->_deepZoomProcessor, "finishProcessing");
  if (!a3)
    goto LABEL_52;
  v10 = CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  if (!v10)
    goto LABEL_59;
  v11 = (void *)v10;
  v127 = BWStillImageProcessingFlagsForSampleBuffer(a3);
  v12 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v13 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v13)
    goto LABEL_52;
  v14 = (void *)v13;
  -[CMIDeepZoomProcessor resetMetadata](self->_deepZoomProcessor, "resetMetadata");
  -[CMIDeepZoomProcessor updateMetadata:forInputFullPixelBuffer:](self->_deepZoomProcessor, "updateMetadata:forInputFullPixelBuffer:", v14, CMSampleBufferGetImageBuffer(a3));
  FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = -[BWDeepZoomInferenceConfiguration type](self->_inferenceConfig, "type");
  AttachedMedia = a3;
  if (v22 == 3)
  {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E4951618);
    if (!AttachedMedia)
      goto LABEL_59;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer)
  {
LABEL_59:
    v36 = 4294935584;
    v39 = -31712;
    goto LABEL_54;
  }
  key = v12;
  v25 = psn_pixelBufferDimensions(ImageBuffer);
  self->_inputReferencePixelBufferDimensions = ($470D365275581EF16070F5A11344F73E)v25;
  if (!FigCaptureVideoDimensionsAreValid(v25))
  {
    v36 = 4294935585;
    v39 = -31711;
    goto LABEL_54;
  }
  v26 = objc_msgSend((id)objc_msgSend(v11, "requestedSettings"), "outputWidth");
  LODWORD(v27) = objc_msgSend((id)objc_msgSend(v11, "requestedSettings"), "outputHeight");
  v120 = a6;
  if ((v127 & 0x100000) != 0)
  {
    v26 = -[BWDeepZoomInferenceConfiguration stereoPhotoOutputDimensions](self->_inferenceConfig, "stereoPhotoOutputDimensions");
    v27 = (unint64_t)-[BWDeepZoomInferenceConfiguration stereoPhotoOutputDimensions](self->_inferenceConfig, "stereoPhotoOutputDimensions") >> 32;
  }
  v28 = (double)v26;
  v29 = (double)v27;
  v30 = (double)v26 / (double)v27;
  p_denormalizedSourceCropRect = (float64x2_t *)&self->_denormalizedSourceCropRect;
  FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(self->_inputReferencePixelBufferDimensions.width, self->_inputReferencePixelBufferDimensions.height, FinalCropRect, v17, v19, v21, v30);
  self->_denormalizedSourceCropRect.origin.x = v35;
  self->_denormalizedSourceCropRect.origin.y = v32;
  self->_denormalizedSourceCropRect.size.width = v33;
  self->_denormalizedSourceCropRect.size.height = v34;
  v36 = 4294935586;
  if (v35 < 0.0)
    goto LABEL_53;
  if (v32 < 0.0)
    goto LABEL_53;
  v37 = v33;
  if (v33 <= 0.0)
    goto LABEL_53;
  v38 = v34;
  v39 = -31710;
  if (v34 > 0.0)
  {
    v40 = objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    if (v40)
    {
      v41 = v40;
      if (!-[NSDictionary objectForKeyedSubscript:](-[BWInferenceConfiguration tuningParameters](self->_inferenceConfig, "tuningParameters"), "objectForKeyedSubscript:", v40))goto LABEL_53;
      v42 = (void *)-[BWDeepZoomInferenceProvider _tuningParametersForPortType:]((uint64_t)self, v41);
      if (!v42)
        goto LABEL_53;
      v43 = v42;
      objc_msgSend((id)objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("MinScaleFactor")), "floatValue");
      v45 = v44;
      objc_msgSend((id)objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("MaxScaleFactor")), "floatValue");
      v47 = v46;
      if ((objc_msgSend((id)objc_msgSend(v11, "captureSettings"), "captureFlags") & 0x10) != 0
        && objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("QSub")))
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("QSub")), "objectForKeyedSubscript:", CFSTR("MinScaleFactor")), "floatValue");
        v45 = v48;
      }
      if (v45 < 1.0)
        goto LABEL_53;
      v125 = v41;
      v39 = -31710;
      if (v47 < v45)
        goto LABEL_54;
      if (-[BWDeepZoomInferenceConfiguration type](self->_inferenceConfig, "type") != 3)
        goto LABEL_35;
      v49 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E4951618);
      if (!v49)
        goto LABEL_54;
      v50 = v49;
      v51 = CMGetAttachment(v49, key, 0);
      if (!v51)
        goto LABEL_53;
      v52 = v51;
      v53 = CMSampleBufferGetImageBuffer(a3);
      if (!v53)
        goto LABEL_53;
      v54 = v53;
      v55 = CMSampleBufferGetImageBuffer(v50);
      if (!v55)
        goto LABEL_53;
      v56 = v55;
      v118 = v30;
      v112 = v45;
      v113 = v37;
      -[CMIDeepZoomProcessor updateMetadata:forInputFullPixelBuffer:](self->_deepZoomProcessor, "updateMetadata:forInputFullPixelBuffer:", v52, v55);
      v57 = psn_pixelBufferDimensions(v54);
      psn_pixelBufferDimensions(v56);
      v59 = FigCaptureMetadataUtilitiesGetFinalCropRect();
      v61 = v60;
      v63 = v62;
      v64 = v58;
      v116 = v28;
      v117 = v29;
      v115 = v47;
      v114 = v38;
      if ((v127 & 0x100000) != 0)
      {
        v81 = FigCaptureMetadataUtilitiesGetFinalCropRect();
        v83 = v88;
        v85 = v89;
        v87 = v90;
        v139.size.height = v64;
        v139.size.width = v63;
        v139.origin.y = v61;
        v139.origin.x = v59;
      }
      else
      {
        v128 = v58;
        v65 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v134.a = *MEMORY[0x1E0C9BAA8];
        v66 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        *(_OWORD *)&v134.c = v65;
        *(_OWORD *)&v134.tx = v66;
        if (FigCaptureMetadataUtilitiesComputeNormalizedPixelBufferCoordinateTransformBetweenSampleBuffers(a3, v50, 1, &v134))
        {
          v39 = 0;
          v36 = 4294935586;
          goto LABEL_54;
        }
        ValidBufferRect = FigCaptureMetadataUtilitiesGetValidBufferRect();
        v69 = v68;
        FigCaptureMetadataUtilitiesNormalizeCropRect(ValidBufferRect, v70, v68, v71);
        v111 = v72;
        v74 = v73;
        v76 = v75;
        v133 = v134;
        v135.origin.x = v59;
        v135.origin.y = v61;
        v135.size.width = v63;
        v64 = v128;
        v135.size.height = v128;
        v136 = CGRectApplyAffineTransform(v135, &v133);
        updated = FigCaptureUpdateRectSizeAndMaintainCenter(v136.origin.x, v136.origin.y, v136.size.width, v136.size.height, v28 / v69);
        v81 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(fmax(updated, 0.0), fmax(v78, 0.0), v79, v80, v111, v74, v76);
        v83 = v82;
        v85 = v84;
        v87 = v86;
        memset(&v133, 0, sizeof(v133));
        v132 = v134;
        CGAffineTransformInvert(&v133, &v132);
        v132 = v133;
        v137.origin.x = v81;
        v137.origin.y = v83;
        v137.size.width = v85;
        v137.size.height = v87;
        v138 = CGRectApplyAffineTransform(v137, &v132);
        v141.origin.x = 0.0;
        v141.origin.y = 0.0;
        v141.size.width = 1.0;
        v141.size.height = 1.0;
        v139 = CGRectIntersection(v138, v141);
      }
      FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)v57, v57 >> 32, v139.origin.x, v139.origin.y, v139.size.width, v139.size.height, v118);
      self->_denormalizedDeepTransferLowResROI = v140;
      if (!CGRectIsNull(v140))
      {
        FigCaptureMetadataUtilitiesNormalizeCropRect(self->_denormalizedDeepTransferLowResROI.origin.x, self->_denormalizedDeepTransferLowResROI.origin.y, self->_denormalizedDeepTransferLowResROI.size.width, self->_denormalizedDeepTransferLowResROI.size.height);
        self->_cachedInputImageFinalCropRect.origin.x = v59;
        self->_cachedInputImageFinalCropRect.origin.y = v61;
        self->_cachedInputImageFinalCropRect.size.width = v63;
        self->_cachedInputImageFinalCropRect.size.height = v64;
        FigCFDictionarySetCGRect();
        FigCFDictionarySetCGRect();
        FigCaptureMetadataUtilitiesDenormalizeCropRect(v81, v83, v85, v87);
        p_denormalizedSourceCropRect->f64[0] = v91;
        self->_denormalizedSourceCropRect.origin.y = v92;
        self->_denormalizedSourceCropRect.size.width = v93;
        self->_denormalizedSourceCropRect.size.height = v94;
        self->_deepTransferLowResBufferDims = ($470D365275581EF16070F5A11344F73E)v57;
        v28 = v116;
        v29 = v117;
        v47 = v115;
        v37 = v113;
        v38 = v114;
        v45 = v112;
LABEL_35:
        *(float *)&v95 = v28 / v37;
        *(float *)&v96 = v29 / v38;
        keya = *(float *)&v95;
        v119 = *(float *)&v96;
        *(double *)&v129 = COERCE_DOUBLE(__PAIR64__(v96, v95));
        if ((objc_msgSend((id)objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("UpsamplingDisabled")), "BOOLValue") & 1) != 0)
        {
          __asm { FMOV            V8.2S, #1.0 }
          v101 = v125;
          v102 = (float32x2_t)v129;
LABEL_46:
          v106 = vdiv_f32(v102, *(float32x2_t *)&_D8);
          if (v106.f32[0] >= 1.0 && v106.f32[1] >= 1.0)
          {
            -[CMIDeepZoomProcessor setInputROI:](self->_deepZoomProcessor, "setInputROI:", COERCE_DOUBLE(vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(*p_denormalizedSourceCropRect)), (int16x4_t)vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_denormalizedSourceCropRect.size)))));
            -[CMIDeepZoomProcessor setZoomFactor:](self->_deepZoomProcessor, "setZoomFactor:", _D8);
            -[CMIDeepZoomProcessor setPortType:](self->_deepZoomProcessor, "setPortType:", v101);
            -[CMIDeepZoomProcessor tileCount](self->_deepZoomProcessor, "tileCount");
            HIWORD(v130) = v108;
            LOWORD(v130) = v109;
            v131.receiver = self;
            v131.super_class = (Class)BWDeepZoomInferenceProvider;
            *(_OWORD *)&v134.a = *(_OWORD *)&a5->var0;
            *(_QWORD *)&v134.c = a5->var3;
            v39 = -[BWTiledEspressoInferenceProvider submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:currentTileCount:](&v131, sel_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler_currentTileCount_, a3, a4, &v134, v120, a7, v130);
            goto LABEL_56;
          }
          BWSampleBufferRemoveAttachedMedia(a3, 0x1E4936818);
          goto LABEL_52;
        }
        if (keya >= v119)
          v103 = v119;
        else
          v103 = keya;
        v101 = v125;
        if (v103 >= v45)
        {
          if (keya >= v119)
            v104 = keya;
          else
            v104 = v119;
          v105 = v104 <= v47;
          v102 = (float32x2_t)v129;
          _D8 = *(double *)&v129;
          if (!v105)
            _D8 = 2.00000048;
          goto LABEL_46;
        }
LABEL_52:
        v36 = 4294935586;
LABEL_53:
        v39 = -31710;
        goto LABEL_54;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      v36 = 4294935582;
      v39 = -31714;
    }
  }
LABEL_54:
  if (a7)
  {
    (*((void (**)(id, uint64_t))a7 + 2))(a7, v36);
    v39 = v36;
  }
LABEL_56:
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  return v39;
}

- (uint64_t)_tuningParametersForPortType:(uint64_t)result
{
  uint64_t v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 104), "type");
    v5 = CFSTR("Lite");
    if (v4 == 2)
      v5 = CFSTR("Standard");
    if (v4 == 3)
      v6 = CFSTR("Transfer");
    else
      v6 = v5;
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 104), "tuningParameters"), "objectForKeyedSubscript:", a2), "objectForKeyedSubscript:", v6);
  }
  return result;
}

- (int)preProcessOutputBuffer:(__CVBuffer *)a3 forMediaKey:(id)a4
{
  int result;

  result = -[CMIDeepZoomProcessor clearOutputBuffer:](self->_deepZoomProcessor, "clearOutputBuffer:", a3, a4);
  if (result)
    return -31710;
  return result;
}

- (int)createInputTiles:(id)a3 withInputs:(id)a4 atPosition:(id *)a5 cmdBuffer:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  _DWORD *v12;
  void *v13;
  int v14;

  v6 = v5;
  v11 = objc_msgSend(a3, "count");
  v12 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (!v11 || !objc_msgSend(a4, "count"))
    goto LABEL_13;
  if (*v12 == 1)
    kdebug_trace();
  if ((v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a4, "count")),
        objc_msgSend(v13, "setObject:atIndexedSubscript:", objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("PrimaryFormat")), 0), objc_msgSend(v13, "objectAtIndexedSubscript:", 0))&& (!objc_msgSend(a4, "objectForKeyedSubscript:", 0x1E4951618)|| (objc_msgSend(v13, "setObject:atIndexedSubscript:", objc_msgSend(a4, "objectForKeyedSubscript:", 0x1E4951618), 1), objc_msgSend(v13, "objectAtIndexedSubscript:", 1)))&& !-[CMIDeepZoomProcessor createInputTiles:atPosition:inputFullPixelBuffers:cmdBuffer:](self->_deepZoomProcessor, "createInputTiles:atPosition:inputFullPixelBuffers:cmdBuffer:", a3, a5, v13, v6))
  {
    v14 = 0;
  }
  else
  {
LABEL_13:
    v14 = -31710;
  }
  if (*v12 == 1)
    kdebug_trace();
  return v14;
}

- (int)writeOutputFor:(id)a3 to:(__CVBuffer *)a4 fromNetworkOutputTiles:(id)a5 withAdditionalPixelBuffers:(id)a6 withInputTilePixelBuffers:(id)a7 withInputFullPixelBuffers:(id)a8 atPosition:(id *)a9 cmdBuffer:
{
  _DWORD *v9;
  void *v16;
  int v17;
  uint64_t v19;

  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (!a4
    || !objc_msgSend(a5, "count")
    || !objc_msgSend(a7, "count")
    || !objc_msgSend(a8, "count")
    || !objc_msgSend(a3, "isEqualToString:", -[BWDeepZoomInferenceConfiguration outputAttachedMediaKey](self->_inferenceConfig, "outputAttachedMediaKey")))
  {
    goto LABEL_15;
  }
  if (*v9 == 1)
    kdebug_trace();
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a8, "count"));
  objc_msgSend(v16, "setObject:atIndexedSubscript:", objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("PrimaryFormat")), 0);
  if (objc_msgSend(a8, "objectForKeyedSubscript:", 0x1E4951618))
    objc_msgSend(v16, "setObject:atIndexedSubscript:", objc_msgSend(a8, "objectForKeyedSubscript:", 0x1E4951618), 1);
  if (!-[CMIDeepZoomProcessor writeOutputTiles:atPosition:outputPixelBuffer:inputTilePixelBuffers:inputFullPixelBuffers:cmdBuffer:](self->_deepZoomProcessor, "writeOutputTiles:atPosition:outputPixelBuffer:inputTilePixelBuffers:inputFullPixelBuffers:cmdBuffer:", a5, a9, a4, a7, v16, v19))v17 = 0;
  else
LABEL_15:
    v17 = -31710;
  if (*v9 == 1)
    kdebug_trace();
  return v17;
}

- (int)propagateInferenceResultForOutputRequirement:(id)a3 storage:(id)a4 propagationSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  __CVBuffer *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  unint64_t v15;
  CFTypeRef v16;
  void *v17;
  int v18;
  const void *AttachedMedia;
  unsigned int v20;
  unint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double width;
  float v27;
  double v28;
  double height;
  float v30;
  NSString *v31;
  CMAttachmentBearerRef target;

  target = 0;
  v8 = (__CVBuffer *)objc_msgSend(a4, "pixelBufferForRequirement:");
  v9 = (void *)objc_msgSend(a3, "attachedMediaKey");
  v10 = 0;
  v11 = -31710;
  if (a5 && v8)
  {
    v12 = (uint64_t)v9;
    if (objc_msgSend(v9, "isEqualToString:", -[BWDeepZoomInferenceConfiguration outputAttachedMediaKey](self->_inferenceConfig, "outputAttachedMediaKey"))&& !BWSampleBufferGetAttachedMedia(a5, v12)&& (BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer(a5, v8, 1, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&target), target)&& (v13 = (const __CFString *)*MEMORY[0x1E0D05CB0], (v14 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) != 0))
    {
      v10 = (void *)objc_msgSend(v14, "mutableCopy");
      if (!v10)
        goto LABEL_17;
      CMSetAttachment(target, v13, v10, 1u);
      v15 = psn_pixelBufferDimensions(v8);
      v16 = CMGetAttachment(target, CFSTR("StillSettings"), 0);
      if (v16)
      {
        v17 = (void *)v16;
        v18 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
        if (-[BWDeepZoomInferenceConfiguration type](self->_inferenceConfig, "type") != 3)
        {
          width = self->_denormalizedSourceCropRect.size.width;
          -[CMIDeepZoomProcessor zoomFactor](self->_deepZoomProcessor, "zoomFactor");
          v28 = width * v27;
          height = self->_denormalizedSourceCropRect.size.height;
          -[CMIDeepZoomProcessor zoomFactor](self->_deepZoomProcessor, "zoomFactor");
          FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v10, *(_QWORD *)&self->_inputReferencePixelBufferDimensions, v15, self->_denormalizedSourceCropRect.origin.x, self->_denormalizedSourceCropRect.origin.y, self->_denormalizedSourceCropRect.size.width, self->_denormalizedSourceCropRect.size.height, 0.0, 0.0, v28, height * v30);
LABEL_16:
          CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18 | 0x20000u), 1u);
          v31 = -[BWDeepZoomInferenceConfiguration outputAttachedMediaKey](self->_inferenceConfig, "outputAttachedMediaKey");
          BWSampleBufferSetAttachedMedia(a5, (uint64_t)v31, (uint64_t)target);
          v11 = 0;
          goto LABEL_17;
        }
        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(target, 0x1E4951618);
        if (AttachedMedia && CMGetAttachment(AttachedMedia, v13, 0))
        {
          FigCFDictionarySetCGRect();
          v20 = objc_msgSend((id)objc_msgSend(v17, "requestedSettings"), "outputWidth");
          LODWORD(v21) = objc_msgSend((id)objc_msgSend(v17, "requestedSettings"), "outputHeight");
          if ((v18 & 0x100000) != 0)
          {
            v20 = -[BWDeepZoomInferenceConfiguration stereoPhotoOutputDimensions](self->_inferenceConfig, "stereoPhotoOutputDimensions");
            v21 = (unint64_t)-[BWDeepZoomInferenceConfiguration stereoPhotoOutputDimensions](self->_inferenceConfig, "stereoPhotoOutputDimensions") >> 32;
          }
          v22 = (double)v20;
          v23 = (double)v21;
          v24 = *MEMORY[0x1E0D069C0];
          v25 = objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D069C0]);
          FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v10, *(_QWORD *)&self->_deepTransferLowResBufferDims, v15, self->_denormalizedDeepTransferLowResROI.origin.x, self->_denormalizedDeepTransferLowResROI.origin.y, self->_denormalizedDeepTransferLowResROI.size.width, self->_denormalizedDeepTransferLowResROI.size.height, 0.0, 0.0, v22, v23);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, v24);
          BWSampleBufferRemoveAttachedMedia(target, 0x1E4951618);
          goto LABEL_16;
        }
        v11 = -31710;
      }
      else
      {
        v11 = -31712;
      }
    }
    else
    {
      v10 = 0;
    }
  }
LABEL_17:

  if (target)
    CFRelease(target);
  return v11;
}

- (int)purgeIntermediateResources
{
  -[CMIDeepZoomProcessor finishProcessing](self->_deepZoomProcessor, "finishProcessing");
  return 0;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  unsigned int v8;
  __int16 v9;
  __int16 v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  unsigned int v15;
  __int16 v16;
  __int16 v17;
  uint64_t v18;
  unint64_t v19;
  unsigned __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  int32x2_t v24;
  int32x2_t v25;
  int32x2_t v26;
  int32x2_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int64x2_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  int32x2_t v37;
  int32x2_t v38;
  int32x2_t v39;
  int32x2_t v40;
  int8x16_t v41;
  int64x2_t v42;
  int v43;
  id v45;
  id v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  objc_super v50;
  objc_super v51;

  if (!-[CMIDeepZoomProcessor modelNetworkBaseName](self->_deepZoomProcessor, "modelNetworkBaseName"))
  {
    v13 = 0;
    v6 = 0;
    v43 = -31710;
    goto LABEL_18;
  }
  v5 = +[BWEspressoInferenceAdapter espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:](BWEspressoInferenceAdapter, "espressoNetworkURLForPlatformedResourceBaseName:embedPlatformOrDeviceID:", -[CMIDeepZoomProcessor modelNetworkBaseName](self->_deepZoomProcessor, "modelNetworkBaseName"), 1);
  if (!v5)
  {
    v13 = 0;
    v6 = 0;
LABEL_21:
    v43 = -31702;
    goto LABEL_18;
  }
  v45 = a3;
  v46 = v5;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend((id)-[CMIDeepZoomProcessor modelInputBindingNames](self->_deepZoomProcessor, "modelInputBindingNames"), "count"))
  {
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelInputSizes](self->_deepZoomProcessor, "modelInputSizes"), "objectAtIndexedSubscript:", v7), "objectAtIndexedSubscript:", 0), "unsignedShortValue");
      v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelInputSizes](self->_deepZoomProcessor, "modelInputSizes"), "objectAtIndexedSubscript:", v7), "objectAtIndexedSubscript:", 1), "unsignedShortValue");
      if (-[CMIDeepZoomProcessor modelInputSlicesCount](self->_deepZoomProcessor, "modelInputSlicesCount"))
        v11 = objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelInputSlicesCount](self->_deepZoomProcessor, "modelInputSlicesCount"), "objectAtIndexedSubscript:", v7), "unsignedShortValue");
      else
        v11 = 0;
      HIWORD(v49) = v10;
      LOWORD(v49) = v9;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:sliceCount:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:sliceCount:", objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelInputPixelFormats](self->_deepZoomProcessor, "modelInputPixelFormats"), "objectAtIndexedSubscript:", v7), "unsignedIntegerValue"), v49, v11), objc_msgSend((id)-[CMIDeepZoomProcessor modelInputBindingNames](self->_deepZoomProcessor, "modelInputBindingNames"), "objectAtIndexedSubscript:", v7));
      v7 = v8;
      v12 = objc_msgSend((id)-[CMIDeepZoomProcessor modelInputBindingNames](self->_deepZoomProcessor, "modelInputBindingNames"), "count") > (unint64_t)v8++;
    }
    while (v12);
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputBindingNames](self->_deepZoomProcessor, "modelOutputBindingNames"), "count"))
  {
    v14 = 0;
    v15 = 1;
    do
    {
      v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputSizes](self->_deepZoomProcessor, "modelOutputSizes"), "objectAtIndexedSubscript:", v14), "objectAtIndexedSubscript:", 0), "unsignedShortValue");
      v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputSizes](self->_deepZoomProcessor, "modelOutputSizes"), "objectAtIndexedSubscript:", v14), "objectAtIndexedSubscript:", 1), "unsignedShortValue");
      if (-[CMIDeepZoomProcessor modelOutputSlicesCount](self->_deepZoomProcessor, "modelOutputSlicesCount"))
        v18 = objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputSlicesCount](self->_deepZoomProcessor, "modelOutputSlicesCount"), "objectAtIndexedSubscript:", v14), "unsignedShortValue");
      else
        v18 = 0;
      HIWORD(v48) = v17;
      LOWORD(v48) = v16;
      objc_msgSend(v13, "setObject:forKeyedSubscript:", +[BWTiledEspressoInferenceProvider videoFormatWithPixelFormat:size:sliceCount:](BWTiledEspressoInferenceProvider, "videoFormatWithPixelFormat:size:sliceCount:", objc_msgSend((id)objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputPixelFormats](self->_deepZoomProcessor, "modelOutputPixelFormats"), "objectAtIndexedSubscript:", v14), "unsignedIntegerValue"), v48, v18), objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputBindingNames](self->_deepZoomProcessor, "modelOutputBindingNames"), "objectAtIndexedSubscript:", v14));
      v14 = v15;
      v12 = objc_msgSend((id)-[CMIDeepZoomProcessor modelOutputBindingNames](self->_deepZoomProcessor, "modelOutputBindingNames"), "count") > (unint64_t)v15++;
    }
    while (v12);
  }
  v19 = -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_outputVideoRequirement, "videoFormat"), "width");
  -[CMIDeepZoomProcessor tileSize](self->_deepZoomProcessor, "tileSize");
  v21 = v19 + v20;
  -[CMIDeepZoomProcessor tileOverlap](self->_deepZoomProcessor, "tileOverlap");
  v23 = v21 + (~v22 | 0xFFFFFFFFFFFF0000);
  -[CMIDeepZoomProcessor tileSize](self->_deepZoomProcessor, "tileSize");
  v25 = v24;
  -[CMIDeepZoomProcessor tileOverlap](self->_deepZoomProcessor, "tileOverlap");
  v27 = vzip1_s32(v25, v26);
  v28.i64[0] = v27.u32[0];
  v28.i64[1] = v27.u32[1];
  v29.i64[0] = 0xFFFFLL;
  v29.i64[1] = 0xFFFFLL;
  v30 = (int64x2_t)vandq_s8(v28, v29);
  v31 = v23 / vsubq_s64(v30, vdupq_laneq_s64(v30, 1)).u64[0];
  v32 = -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_outputVideoRequirement, "videoFormat"), "height");
  -[CMIDeepZoomProcessor tileSize](self->_deepZoomProcessor, "tileSize");
  v34 = v32 + v33;
  -[CMIDeepZoomProcessor tileOverlap](self->_deepZoomProcessor, "tileOverlap");
  v36 = v34 + (~v35 | 0xFFFFFFFFFFFF0000);
  -[CMIDeepZoomProcessor tileSize](self->_deepZoomProcessor, "tileSize");
  v38 = v37;
  -[CMIDeepZoomProcessor tileOverlap](self->_deepZoomProcessor, "tileOverlap");
  v40 = vzip2_s32(v38, v39);
  v28.i64[0] = v40.u32[0];
  v28.i64[1] = v40.u32[1];
  v41.i64[0] = 0xFFFFLL;
  v41.i64[1] = 0xFFFFLL;
  v42 = (int64x2_t)vandq_s8(v28, v41);
  LOWORD(v47) = v31;
  HIWORD(v47) = v36 / vsubq_s64(v42, vdupq_laneq_s64(v42, 1)).u64[0];
  v51.receiver = self;
  v51.super_class = (Class)BWDeepZoomInferenceProvider;
  if (-[BWTiledEspressoInferenceProvider loadNetworkWithURL:configName:inferenceType:maxTileCount:inputFormatsByBindingName:outputFormatsByBindingName:additionalVideoRequirements:](&v51, sel_loadNetworkWithURL_configName_inferenceType_maxTileCount_inputFormatsByBindingName_outputFormatsByBindingName_additionalVideoRequirements_, v46, 0, -[BWTiledEspressoInferenceProvider type](self, "type"), v47, v6, v13, 0))
  {
    goto LABEL_21;
  }
  v50.receiver = self;
  v50.super_class = (Class)BWDeepZoomInferenceProvider;
  if (-[BWTiledEspressoInferenceProvider prepareForSubmissionWithWorkQueue:](&v50, sel_prepareForSubmissionWithWorkQueue_, v45))
  {
    goto LABEL_21;
  }
  v43 = 0;
LABEL_18:

  return v43;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  int result;

  result = -[CMIDeepZoomProcessor prewarm](self->_deepZoomProcessor, "prewarm", a3);
  if (result)
    return -31710;
  return result;
}

@end
