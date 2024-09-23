@implementation BWSmartStyleRenderingProcessorController

- (void)updateSmartStyleProcessorConfigurationIfNeededForApplyOnly:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "linearSystemOrder");
  if (v3)
  {
    if (v5)
    {
      v6 = objc_msgSend((id)objc_opt_class(), "getDefaultProcessorConfigurationForStreaming");
LABEL_7:
      -[CMISmartStyleProcessor setConfiguration:](self->_smartStyleProcessor, "setConfiguration:", v6);
    }
  }
  else if (v5 != 1)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "getDefaultProcessorConfigurationForStills");
    goto LABEL_7;
  }
}

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

+ (id)pixelBufferAttributesWithCapacityForLearntCoefficients:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)&a3;
  v4 = BWStandardProcessorNameForBundleBaseName((uint64_t)CFSTR("CMI"), (uint64_t)CFSTR("SmartStyle"), *(uint64_t *)&a3);
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(BWLoadProcessorBundle((uint64_t)CFSTR("SmartStyle"), v3), "classNamed:", v4), "getDefaultProcessorConfigurationForStills"), "pixelBufferAttributesWithCapacityForLearntCoefficients");
}

+ (id)pixelBufferAttributesForSmallLightMap:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)&a3;
  v4 = BWStandardProcessorNameForBundleBaseName((uint64_t)CFSTR("CMI"), (uint64_t)CFSTR("SmartStyle"), *(uint64_t *)&a3);
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(BWLoadProcessorBundle((uint64_t)CFSTR("SmartStyle"), v3), "classNamed:", v4), "getDefaultProcessorConfigurationForStills"), "pixelBufferAttributesForSmallLightMap");
}

- (BWSmartStyleRenderingProcessorController)initWithConfiguration:(id)a3
{
  BWSmartStyleRenderingProcessorController *v4;
  void *v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWSmartStyleRenderingProcessorController;
  v4 = -[BWStillImageProcessorController initWithName:type:configuration:](&v8, sel_initWithName_type_configuration_, CFSTR("SmartStyle"), 16, a3);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A858DD40]();
    v4->_inferencesNotAvailableForSmartStyleRendering = objc_msgSend(a3, "inferencesNotAvailableForSmartStyleRendering");
    v6 = -[BWSmartStyleRenderingProcessorController _loadSetupAndPrepareSmartStyleRenderingProcessor:]((uint64_t)v4, a3);
    v4->_reversibilityEnabled = objc_msgSend(a3, "reversibilityEnabled");
    objc_autoreleasePoolPop(v5);
    if (v6)
    {

      return 0;
    }
  }
  return v4;
}

- (uint64_t)_loadSetupAndPrepareSmartStyleRenderingProcessor:(uint64_t)result
{
  uint64_t v3;
  _QWORD v4[5];

  if (result)
  {
    v3 = result;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __93__BWSmartStyleRenderingProcessorController__loadSetupAndPrepareSmartStyleRenderingProcessor___block_invoke;
    v4[3] = &unk_1E49204F0;
    v4[4] = a2;
    result = BWLoadCreateAndSetupMetalImageBufferProcessor((uint64_t)CFSTR("SmartStyle"), objc_msgSend(a2, "version"), (uint64_t)CFSTR("CMI"), (uint64_t)CFSTR("SmartStyle"), objc_msgSend(a2, "version"), (uint64_t)&unk_1EE727A98, 0, (void *)objc_msgSend(a2, "sensorConfigurationsByPortType"), objc_msgSend(a2, "metalCommandQueue"), (uint64_t)v4, (_QWORD *)(result + 56));
    if (!(_DWORD)result)
    {
      result = -[BWSmartStyleRenderingProcessorController _setupConfigurationAndClasses:version:](v3, *(void **)(v3 + 56), objc_msgSend(a2, "version"));
      if (!(_DWORD)result)
      {
        objc_msgSend(*(id *)(v3 + 56), "setUseLiveMetalAllocations:", 1);
        return 0;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  opaqueCMFormatDescription *smartStyleLinearThumbnailFormatDescription;
  opaqueCMFormatDescription *smartStyleStyledThumbnailFormatDescription;
  opaqueCMFormatDescription *smallLightMapFormatDescription;
  opaqueCMFormatDescription *coefficientsFormatDescription;
  opaqueCMFormatDescription *reverseCoefficientsFormatDescription;
  opaqueCMFormatDescription *personSegmentationFormatDescription;
  opaqueCMFormatDescription *skinSegmentationFormatDescription;
  opaqueCMFormatDescription *skySegmentationFormatDescription;
  objc_super v12;

  -[BWSmartStyleRenderingProcessorController reset](self, "reset");

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  smartStyleLinearThumbnailFormatDescription = self->_smartStyleLinearThumbnailFormatDescription;
  if (smartStyleLinearThumbnailFormatDescription)
    CFRelease(smartStyleLinearThumbnailFormatDescription);
  smartStyleStyledThumbnailFormatDescription = self->_smartStyleStyledThumbnailFormatDescription;
  if (smartStyleStyledThumbnailFormatDescription)
    CFRelease(smartStyleStyledThumbnailFormatDescription);
  smallLightMapFormatDescription = self->_smallLightMapFormatDescription;
  if (smallLightMapFormatDescription)
    CFRelease(smallLightMapFormatDescription);
  coefficientsFormatDescription = self->_coefficientsFormatDescription;
  if (coefficientsFormatDescription)
    CFRelease(coefficientsFormatDescription);
  reverseCoefficientsFormatDescription = self->_reverseCoefficientsFormatDescription;
  if (reverseCoefficientsFormatDescription)
    CFRelease(reverseCoefficientsFormatDescription);
  personSegmentationFormatDescription = self->_personSegmentationFormatDescription;
  if (personSegmentationFormatDescription)
    CFRelease(personSegmentationFormatDescription);
  skinSegmentationFormatDescription = self->_skinSegmentationFormatDescription;
  if (skinSegmentationFormatDescription)
    CFRelease(skinSegmentationFormatDescription);
  skySegmentationFormatDescription = self->_skySegmentationFormatDescription;
  if (skySegmentationFormatDescription)
    CFRelease(skySegmentationFormatDescription);
  v12.receiver = self;
  v12.super_class = (Class)BWSmartStyleRenderingProcessorController;
  -[BWStillImageProcessorController dealloc](&v12, sel_dealloc);
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  BWSmartStyleRenderingProcessorControllerRequest *v6;
  int v7;

  v6 = -[BWStillImageProcessorControllerRequest initWithInput:delegate:]([BWSmartStyleRenderingProcessorControllerRequest alloc], "initWithInput:delegate:", a3, a4);
  if (v6)
    v7 = 0;
  else
    v7 = -12786;
  if (a5)
    *a5 = v7;
  return v6;
}

- (int)prepare
{
  int v3;

  v3 = -[CMISmartStyleProcessor prepareToProcess:](self->_smartStyleProcessor, "prepareToProcess:", 13);
  if (!v3)
    -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  return v3;
}

- (int)process
{
  uint64_t v2;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BWStillImageProcessorControllerRequest *v14;
  BWStillImageProcessorControllerRequest *v15;
  int v16;
  uint64_t v17;
  __CVBuffer *ImageBuffer;
  const void *v19;
  CFTypeRef v20;
  void *v21;
  double x;
  double y;
  double width;
  double height;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  __CVBuffer *v34;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v36;
  CVImageBufferRef v37;
  __CVBuffer *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  unint64_t v48;
  opaqueCMSampleBuffer *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __CVBuffer *v53;
  id v54;
  opaqueCMSampleBuffer *v60;
  CVImageBufferRef v61;
  CVImageBufferRef v62;
  const __CFDictionary *v63;
  __CVBuffer *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  opaqueCMSampleBuffer *v75;
  opaqueCMSampleBuffer *v76;
  __CVBuffer *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  opaqueCMSampleBuffer *v81;
  opaqueCMSampleBuffer *v82;
  __CVBuffer *v83;
  void *v84;
  uint64_t v85;
  __CVBuffer *v86;
  opaqueCMSampleBuffer *v87;
  opaqueCMSampleBuffer *v88;
  CVImageBufferRef v89;
  __CVBuffer *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  __CFString **v94;
  int v95;
  int v96;
  void *v97;
  double v98;
  int v99;
  int v100;
  void *v101;
  double v102;
  int v103;
  int v104;
  void *v105;
  double v106;
  uint64_t v107;
  NSObject *v108;
  opaqueCMSampleBuffer *v109;
  int v110;
  __int16 v111;
  double v112;
  uint64_t v113;
  double v114;
  uint64_t v115;
  uint64_t PixelFormatType;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  opaqueCMSampleBuffer *v128;
  CVImageBufferRef v129;
  __CVBuffer *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  opaqueCMSampleBuffer *v134;
  __CVBuffer *v135;
  opaqueCMSampleBuffer *v136;
  __CVBuffer *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  BWSmartStyleRenderingProcessorController *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  __CVBuffer *v155;
  double v156;
  CGRect v157;
  CGRect v158;
  uint64_t v159;
  uint64_t v160;
  BWStillImageSmartStyle *v161;
  uint64_t v162;
  int v163;
  uint64_t v164;
  __CVBuffer *v165;
  const __CFString *key;
  void *v167;
  __CVBuffer *v168;
  double v169;
  void *v170;
  id v171;
  __CVBuffer *pixelBuffer;
  __CVBuffer *pixelBuffera;
  __CVBuffer *v174;
  double v175;
  CFTypeRef v176[2];
  __CVBuffer *v177;
  CFTypeRef cf;
  __CVBuffer *v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  CGRect rect;
  uint64_t v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;

  v190 = *MEMORY[0x1E0C80C00];
  v164 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v160 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "thumbnailSize");
  v6 = v5;
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "thumbnailSize");
  v8 = v7;
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  v10 = v9;
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  v12 = v11;
  if (dword_1ECFE9A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v14 = -[BWStillImageProcessorController currentRequest](self, "currentRequest", v151, v153);
  v15 = v14;
  if (!v14)
  {
    v165 = 0;
    cf = 0;
    v179 = 0;
    v34 = 0;
    pixelBuffera = 0;
    v174 = 0;
    v168 = 0;
    v171 = 0;
    v180 = 0;
    goto LABEL_131;
  }
  v163 = -[BWStillImageProcessorControllerInput applyOnly](-[BWStillImageProcessorControllerRequest input](v14, "input"), "applyOnly");
  v16 = -[BWStillImageCaptureSettings captureType](-[BWStillImageProcessorControllerInput captureSettings](-[BWStillImageProcessorControllerRequest input](v15, "input"), "captureSettings"), "captureType");
  v17 = -[BWStillImageCaptureStreamSettings captureFlags](-[BWStillImageProcessorControllerInput captureStreamSettings](-[BWStillImageProcessorControllerRequest input](v15, "input"), "captureStreamSettings"), "captureFlags");
  v180 = objc_alloc_init(self->_smartStyleProcessorInputOutputClass);
  if (!v180)
  {
    v154 = v2;
    LODWORD(v152) = 0;
    FigDebugAssert3();
    v165 = 0;
    cf = 0;
    v179 = 0;
    v34 = 0;
    pixelBuffera = 0;
    v174 = 0;
    v168 = 0;
    v171 = 0;
    v180 = 0;
    v167 = 0;
    ImageBuffer = 0;
    v177 = 0;
    v93 = 4294954514;
    goto LABEL_62;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"));
  if (!ImageBuffer)
  {
    v165 = 0;
    cf = 0;
    v179 = 0;
    v34 = 0;
    pixelBuffera = 0;
    v174 = 0;
    v168 = 0;
    v171 = 0;
    v167 = 0;
    goto LABEL_132;
  }
  v19 = (const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame");
  key = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v20 = CMGetAttachment(v19, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v20)
    goto LABEL_125;
  v21 = (void *)v20;
  v159 = -[BWSmartStyleRenderingProcessorController _tuningParameterVariantForCaptureType:captureFlags:]((uint64_t)self, v16, v17);
  objc_msgSend(v4, "setObject:forKeyedSubscript:");
  v191.origin.x = -[BWSmartStyleRenderingProcessorController _getDenormalizedFinalCropRectfromMetadata:pixelBuffer:]((uint64_t)self, v21, ImageBuffer);
  x = v191.origin.x;
  y = v191.origin.y;
  width = v191.size.width;
  height = v191.size.height;
  if (CGRectIsNull(v191))
  {
LABEL_125:
    v165 = 0;
    cf = 0;
LABEL_127:
    v34 = 0;
    pixelBuffera = 0;
    v174 = 0;
    v168 = 0;
    v171 = 0;
    v179 = 0;
LABEL_131:
    v167 = 0;
    ImageBuffer = 0;
LABEL_132:
    v177 = 0;
    goto LABEL_61;
  }
  v26 = BWStillImageProcessorTypeToShortString(46);
  v27 = -[BWSmartStyleRenderingProcessorController _newPixelBufferWithDimensions:pixelFormat:name:]((uint64_t)self, (int)v6 | ((unint64_t)(int)v8 << 32), 1111970369, v26);
  if (!v27)
  {
    v165 = 0;
    cf = 0;
    v179 = 0;
    v34 = 0;
    pixelBuffera = 0;
    v174 = 0;
    v168 = 0;
    v171 = 0;
    v167 = 0;
    ImageBuffer = 0;
LABEL_138:
    v177 = 0;
LABEL_148:
    v93 = 4294954510;
    goto LABEL_62;
  }
  cf = (CFTypeRef)v27;
  v28 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "downScalePixelBuffer:toPixelBuffer:inputROI:", ImageBuffer, v27, x, y, width, height);
  if ((_DWORD)v28)
  {
    v93 = v28;
    v165 = 0;
    v34 = 0;
    pixelBuffera = 0;
    v174 = 0;
    v168 = 0;
    v171 = 0;
    v179 = 0;
    v167 = 0;
    ImageBuffer = 0;
    v177 = 0;
    goto LABEL_62;
  }
  v29 = -[FigCaptureStillImageSettings smartStyle](-[BWStillImageProcessorControllerInput settings](-[BWStillImageProcessorControllerRequest input](v15, "input"), "settings"), "smartStyle");
  if (!v29
    || (v161 = -[BWStillImageSmartStyle initWithSmartStyle:]([BWStillImageSmartStyle alloc], "initWithSmartStyle:", v29)) == 0)
  {
    v165 = 0;
    goto LABEL_127;
  }
  v170 = v4;
  objc_msgSend(v180, "setSemanticStyleSceneType:", objc_msgSend(-[BWStillImageCaptureSettings metadata](-[BWStillImageProcessorControllerInput captureSettings](-[BWStillImageProcessorControllerRequest input](v15, "input"), "captureSettings"), "metadata"), "semanticStyleSceneType"));
  v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(-[BWStillImageCaptureSettings metadata](-[BWStillImageProcessorControllerInput captureSettings](-[BWStillImageProcessorControllerRequest input](v15, "input"), "captureSettings"), "metadata"), "semanticStyleSceneType"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D06098]);
  v31 = CVPixelBufferGetWidth(ImageBuffer);
  pixelBuffer = ImageBuffer;
  ImageBuffer = (__CVBuffer *)-[BWStillImageProcessorControllerDelegate processorController:newOutputPixelBufferForProcessorInput:type:dimensions:](-[BWStillImageProcessorControllerRequest delegate](v15, "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:dimensions:", self, -[BWStillImageProcessorControllerRequest input](v15, "input"), 1, v31 | ((unint64_t)CVPixelBufferGetHeight(ImageBuffer) << 32));
  if (!ImageBuffer)
  {
    v165 = 0;
    v34 = 0;
    pixelBuffera = 0;
    v174 = 0;
    v168 = 0;
    v171 = 0;
    v179 = 0;
    v167 = 0;
    goto LABEL_138;
  }
  v177 = ImageBuffer;
  if (BWIsSmartStyleAllowedForAdjustedImage(-[BWStillImageProcessorControllerInput stillImageSettings](-[BWStillImageProcessorControllerRequest input](v15, "input"), "stillImageSettings")))
  {
    v32 = BWStillImageProcessorTypeToShortString(42);
    v33 = -[BWSmartStyleRenderingProcessorController _newLearningCoefficientsPixelBufferWithName:]((uint64_t)self, v32);
    if (!v33)
    {
      v165 = 0;
      v34 = 0;
      pixelBuffera = 0;
      v174 = 0;
      v168 = 0;
      v179 = 0;
LABEL_147:
      v171 = 0;
      v167 = 0;
      ImageBuffer = 0;
      goto LABEL_148;
    }
  }
  else
  {
    v33 = 0;
  }
  v179 = (__CVBuffer *)v33;
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), 0x1E495B238);
  if (AttachedMedia)
  {
    v36 = AttachedMedia;
    v37 = CMSampleBufferGetImageBuffer(AttachedMedia);
    if (v37)
    {
      v38 = v37;
      v39 = (void *)CMGetAttachment(v36, key, 0);
      if (v39)
      {
        v169 = v12;
        v175 = v10;
        v40 = height;
        v41 = width;
        v42 = y;
        v43 = x;
        v162 = (uint64_t)v39;
        v192.origin.x = -[BWSmartStyleRenderingProcessorController _getDenormalizedFinalCropRectfromMetadata:pixelBuffer:]((uint64_t)self, v39, v38);
        v44 = v192.origin.x;
        v45 = v192.origin.y;
        v46 = v192.size.width;
        v47 = v192.size.height;
        if (!CGRectIsNull(v192))
        {
          v48 = psn_pixelBufferDimensions(v38);
          v197.size.width = (double)(int)v48;
          v197.size.height = (double)SHIDWORD(v48);
          v197.origin.x = 0.0;
          v197.origin.y = 0.0;
          v193.origin.x = v44;
          v193.origin.y = v45;
          v193.size.width = v46;
          v193.size.height = v47;
          CGRectEqualToRect(v193, v197);
          objc_msgSend(v180, "setInputLinearCropRect:", v44, v45, v46, v47);
          x = v43;
          y = v42;
          width = v41;
          height = v40;
          v10 = v175;
          v12 = v169;
          goto LABEL_24;
        }
      }
    }
LABEL_122:
    v165 = 0;
LABEL_123:
    v34 = 0;
    v174 = 0;
    v168 = 0;
LABEL_124:
    v171 = 0;
    pixelBuffera = 0;
    v167 = 0;
    goto LABEL_60;
  }
  v49 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), 0x1E495B3F8);
  if (!v49)
    goto LABEL_122;
  v38 = CMSampleBufferGetImageBuffer(v49);
  v162 = (uint64_t)v21;
  if (!v38)
    goto LABEL_122;
LABEL_24:
  v50 = -[BWSmartStyleRenderingProcessorController _populateInputLinearPixelBufferColorManagementMetadata:]((uint64_t)self, v38);
  if ((_DWORD)v50)
  {
    v93 = v50;
    v165 = 0;
    v34 = 0;
    pixelBuffera = 0;
    v174 = 0;
    v168 = 0;
    v171 = 0;
    v167 = 0;
    goto LABEL_140;
  }
  v51 = BWStillImageProcessorTypeToShortString(47);
  v52 = -[BWSmartStyleRenderingProcessorController _newPixelBufferWithDimensions:pixelFormat:name:]((uint64_t)self, (int)v10 | ((unint64_t)(int)v12 << 32), 2019963440, v51);
  if (!v52)
  {
    v165 = 0;
    v34 = 0;
    v174 = 0;
    v168 = 0;
LABEL_146:
    pixelBuffera = 0;
    goto LABEL_147;
  }
  v53 = (__CVBuffer *)v52;
  v54 = v180;
  objc_msgSend(v180, "setInputLinearPixelBuffer:", v38);
  objc_msgSend(v180, "setOutputCodedLinearThumbnailPixelBuffer:", v53);
  objc_msgSend(v180, "setOutputCodedLinearThumbnailMetadata:", v164);
  v165 = v53;
  if (v163)
  {
    rect.origin.x = 0.0;
    rect.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    *(CGSize *)v176 = _Q0;
    rect.size = _Q0;
    v60 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), 0x1E495B358);
    if (v60)
    {
      v61 = CMSampleBufferGetImageBuffer(v60);
      if (v61)
      {
        v62 = v61;
        v63 = (const __CFDictionary *)objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D060D8]);
        if (v63 && !CGRectMakeWithDictionaryRepresentation(v63, &rect))
        {
          v154 = v2;
          LODWORD(v152) = 0;
          FigDebugAssert3();
          rect.origin.x = 0.0;
          rect.origin.y = 0.0;
          rect.size = *(CGSize *)v176;
        }
        objc_msgSend(v180, "setInputUnstyledPixelBuffer:", pixelBuffer, v152, v154);
        objc_msgSend(v180, "setInputMetadataDict:", v21);
        objc_msgSend(v180, "setInputLinearMetadataDict:", v162);
        objc_msgSend(v180, "setInputUnstyledCropRect:", x, y, width, height);
        objc_msgSend(v180, "setInputUnstyledThumbnailPixelBuffer:", cf);
        objc_msgSend(v180, "setOutputStyledPixelBuffer:", ImageBuffer);
        objc_msgSend(v180, "setOutputStyledCropRect:", x, y, width, height);
        objc_msgSend(v180, "setInputStyleCoefficientsPixelBuffer:", v62);
        objc_msgSend(v180, "setPrimaryCaptureRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
        v64 = 0;
        v167 = 0;
        v168 = 0;
        v65 = 20;
        goto LABEL_67;
      }
    }
    goto LABEL_123;
  }
  v66 = BWStillImageProcessorTypeToShortString(44);
  ImageBuffer = (__CVBuffer *)-[BWSmartStyleRenderingProcessorController _newSmallLightMapPixelBufferWithName:]((uint64_t)self, v66);
  if (!ImageBuffer)
  {
    v34 = 0;
    pixelBuffera = 0;
    v174 = 0;
    v168 = 0;
    v171 = 0;
    v167 = 0;
    goto LABEL_148;
  }
  v67 = BWStillImageProcessorTypeToShortString(45);
  v68 = -[BWSmartStyleRenderingProcessorController _newSmallLightMapPixelBufferWithName:]((uint64_t)self, v67);
  v168 = ImageBuffer;
  if (!v68)
  {
    v34 = 0;
    v174 = 0;
    goto LABEL_146;
  }
  v174 = (__CVBuffer *)v68;
  v69 = -[BWStillImageProcessorControllerDelegate processorController:newInferencesForProcessorInput:](-[BWStillImageProcessorControllerRequest delegate](v15, "delegate"), "processorController:newInferencesForProcessorInput:", self, -[BWStillImageProcessorControllerRequest input](v15, "input"));
  if (!v69)
  {
    v34 = 0;
    goto LABEL_124;
  }
  v70 = (void *)v69;
  v71 = *MEMORY[0x1E0C9D628];
  v72 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v73 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v74 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v75 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), 0x1E495AF38);
  v167 = v70;
  if (v75)
  {
    v76 = v75;
    v77 = CMSampleBufferGetImageBuffer(v75);
    if (v77)
    {
      v78 = (void *)CMGetAttachment(v76, key, 0);
      goto LABEL_41;
    }
LABEL_43:
    v158.size.width = v73;
    v158.size.height = v74;
    v158.origin.x = v71;
    v158.origin.y = v72;
    goto LABEL_44;
  }
  v79 = objc_msgSend(v70, "inferenceBufferForAttachedMediaKey:", 0x1E495AF38);
  v80 = v70;
  v77 = (__CVBuffer *)v79;
  if (!v79)
    goto LABEL_43;
  v78 = (void *)objc_msgSend(v80, "metadataForAttachedMediaKey:", 0x1E495AF38);
LABEL_41:
  v194.origin.x = -[BWSmartStyleRenderingProcessorController _getDenormalizedFinalCropRectfromMetadata:pixelBuffer:]((uint64_t)self, v78, v77);
  v158 = v194;
  if (CGRectIsNull(v194))
    goto LABEL_59;
LABEL_44:
  v81 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), (uint64_t)CFSTR("PersonSemanticsSkin"));
  if (v81)
  {
    v82 = v81;
    v83 = CMSampleBufferGetImageBuffer(v81);
    if (!v83)
    {
      v157.size.width = v73;
      v157.size.height = v74;
      v157.origin.x = v71;
      v157.origin.y = v72;
      goto LABEL_53;
    }
    v84 = (void *)CMGetAttachment(v82, key, 0);
  }
  else
  {
    v85 = objc_msgSend(v167, "inferenceBufferForAttachedMediaKey:", CFSTR("PersonSemanticsSkin"));
    if (!v85)
    {
      v83 = 0;
      v157.size.width = v73;
      v157.size.height = v74;
      v157.origin.x = v71;
      v157.origin.y = v72;
      goto LABEL_53;
    }
    v86 = (__CVBuffer *)v85;
    v84 = (void *)objc_msgSend(v167, "metadataForAttachedMediaKey:", CFSTR("PersonSemanticsSkin"));
    v83 = v86;
  }
  v195.origin.x = -[BWSmartStyleRenderingProcessorController _getDenormalizedFinalCropRectfromMetadata:pixelBuffer:]((uint64_t)self, v84, v83);
  v157 = v195;
  if (CGRectIsNull(v195))
    goto LABEL_59;
LABEL_53:
  v87 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), 0x1E495B0B8);
  if (v87)
  {
    v88 = v87;
    v89 = CMSampleBufferGetImageBuffer(v87);
    if (!v89)
    {
      v156 = height;
      v155 = 0;
      ImageBuffer = v177;
      goto LABEL_66;
    }
    v90 = v89;
    v91 = (void *)CMGetAttachment(v88, key, 0);
  }
  else
  {
    v92 = objc_msgSend(v167, "inferenceBufferForAttachedMediaKey:", 0x1E495B0B8);
    ImageBuffer = v177;
    if (!v92)
    {
      v156 = height;
      v155 = 0;
      goto LABEL_66;
    }
    v90 = (__CVBuffer *)v92;
    v91 = (void *)objc_msgSend(v167, "metadataForAttachedMediaKey:", 0x1E495B0B8);
  }
  v196.origin.x = -[BWSmartStyleRenderingProcessorController _getDenormalizedFinalCropRectfromMetadata:pixelBuffer:]((uint64_t)self, v91, v90);
  v71 = v196.origin.x;
  v72 = v196.origin.y;
  v73 = v196.size.width;
  v74 = v196.size.height;
  if (CGRectIsNull(v196))
  {
LABEL_59:
    v34 = 0;
    v171 = 0;
    pixelBuffera = 0;
LABEL_60:
    ImageBuffer = 0;
LABEL_61:
    v93 = 4294954516;
LABEL_62:
    v94 = kBWNodeSampleBufferAttachmentKey_OriginalCameraIntrinsicMatrixReferenceDimensions;
    goto LABEL_100;
  }
  v156 = height;
  ImageBuffer = v177;
  v155 = v90;
LABEL_66:
  v54 = v180;
  objc_msgSend(v180, "setInputSmartStyle:", objc_alloc_init(self->_smartStyleClass));
  objc_msgSend((id)objc_msgSend(v180, "inputSmartStyle"), "setCastType:", -[BWStillImageSmartStyle cast](v161, "cast"));
  -[BWStillImageSmartStyle intensity](v161, "intensity");
  v96 = v95;
  v97 = (void *)objc_msgSend(v180, "inputSmartStyle");
  LODWORD(v98) = v96;
  objc_msgSend(v97, "setCastIntensity:", v98);
  -[BWStillImageSmartStyle toneBias](v161, "toneBias");
  v100 = v99;
  v101 = (void *)objc_msgSend(v180, "inputSmartStyle");
  LODWORD(v102) = v100;
  objc_msgSend(v101, "setToneBias:", v102);
  -[BWStillImageSmartStyle colorBias](v161, "colorBias");
  v104 = v103;
  v105 = (void *)objc_msgSend(v180, "inputSmartStyle");
  LODWORD(v106) = v104;
  objc_msgSend(v105, "setColorBias:", v106);
  objc_msgSend(v180, "setInputUnstyledPixelBuffer:", pixelBuffer);
  height = v156;
  objc_msgSend(v180, "setInputUnstyledCropRect:", x, y, width, v156);
  objc_msgSend(v180, "setInputMetadataDict:", v21);
  objc_msgSend(v180, "setInputLinearMetadataDict:", v162);
  objc_msgSend(v180, "setInputLinearPixelBuffer:", v38);
  objc_msgSend(v180, "setInputPersonMaskPixelBuffer:", v77);
  objc_msgSend(v180, "setInputPersonMaskCropRect:", v158.origin.x, v158.origin.y, v158.size.width, v158.size.height);
  objc_msgSend(v180, "setInputSkinMaskPixelBuffer:", v83);
  objc_msgSend(v180, "setInputSkinMaskCropRect:", v157.origin.x, v157.origin.y, v157.size.width, v157.size.height);
  objc_msgSend(v180, "setInputSkyMaskPixelBuffer:", v155);
  objc_msgSend(v180, "setInputSkyMaskCropRect:", v71, v72, v73, v74);
  objc_msgSend(v180, "setInputTuningType:", v159);
  objc_msgSend(v180, "setOutputStyledPixelBuffer:", ImageBuffer);
  objc_msgSend(v180, "setOutputStyledCropRect:", x, y, width, v156);
  objc_msgSend(v180, "setOutputLearnedStyleCoefficientsPixelBuffer:", v179);
  objc_msgSend(v180, "setOutputImageStatistics:", v160);
  objc_msgSend(v180, "setOutputSmallLightMapPixelBuffer:", v168);
  v64 = v174;
  objc_msgSend(v180, "setOutputSmallLinearLightMapPixelBuffer:", v174);
  v65 = 29;
LABEL_67:
  v174 = v64;
  -[CMISmartStyleProcessor setInputOutput:](self->_smartStyleProcessor, "setInputOutput:", v54);
  v107 = -[CMISmartStyleProcessor prepareToProcess:](self->_smartStyleProcessor, "prepareToProcess:", v65);
  if ((_DWORD)v107)
    goto LABEL_128;
  v93 = -[CMISmartStyleProcessor process](self->_smartStyleProcessor, "process");
  if (dword_1ECFE9A10)
  {
    v108 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    ImageBuffer = v177;
  }
  if ((_DWORD)v93)
    goto LABEL_129;
  v107 = -[CMISmartStyleProcessor finishProcessing](self->_smartStyleProcessor, "finishProcessing");
  if ((_DWORD)v107)
  {
LABEL_128:
    v93 = v107;
LABEL_129:
    v34 = 0;
    v171 = 0;
    pixelBuffera = 0;
LABEL_140:
    ImageBuffer = 0;
    goto LABEL_62;
  }
  v109 = (opaqueCMSampleBuffer *)-[BWSmartStyleRenderingProcessorController _newOutputSampleBufferFromSampleBuffer:pixelBuffer:additionalMetadata:formatDescriptionInOut:](self, (opaqueCMSampleBuffer *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), ImageBuffer, v170, (CFTypeRef *)&self->_outputFormatDescription);
  ImageBuffer = v109;
  if (!v109)
  {
    v34 = 0;
    v171 = 0;
    pixelBuffera = 0;
    v93 = 4294950489;
    goto LABEL_62;
  }
  BWSampleBufferSetAttachedMediaFromPixelBuffer(v109, 0x1E495B278, pixelBuffer, (CFTypeRef *)&self->_outputFormatDescription, 0, 0, 1);
  v110 = BWStillImageProcessingFlagsForSampleBuffer(ImageBuffer);
  v111 = v110;
  BWStillImageSetProcessingFlagsForSampleBuffer(ImageBuffer, v110 | 0x200000);
  v34 = 0;
  if ((v111 & 0x1000) != 0 || !self->_reversibilityEnabled)
  {
    pixelBuffera = 0;
    v123 = 0;
LABEL_95:
    v94 = kBWNodeSampleBufferAttachmentKey_OriginalCameraIntrinsicMatrixReferenceDimensions;
    goto LABEL_96;
  }
  if (!-[FigCaptureStillImageSettings smartStyleReversibilitySupported](-[BWStillImageProcessorControllerInput settings](-[BWStillImageProcessorControllerRequest input](v15, "input"), "settings"), "smartStyleReversibilitySupported"))
  {
    v34 = 0;
    pixelBuffera = 0;
    v123 = 0;
    goto LABEL_95;
  }
  v171 = objc_alloc_init(self->_smartStyleProcessorInputOutputClass);
  -[CMISmartStyleProcessor setConfiguration:](self->_smartStyleProcessor, "setConfiguration:", objc_msgSend((id)objc_opt_class(), "getDefaultProcessorConfigurationForStills"));
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "thumbnailSize");
  v113 = (int)v112;
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "thumbnailSize");
  v115 = (int)v114;
  CFRelease(cf);
  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  v117 = BWStillImageProcessorTypeToShortString(46);
  v118 = v113 | (v115 << 32);
  v119 = -[BWSmartStyleRenderingProcessorController _newPixelBufferWithDimensions:pixelFormat:name:]((uint64_t)self, v118, PixelFormatType, v117);
  if (!v119)
  {
    cf = 0;
    v34 = 0;
    goto LABEL_152;
  }
  cf = (CFTypeRef)v119;
  v120 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "downScalePixelBuffer:toPixelBuffer:inputROI:", pixelBuffer, v119, x, y, width, height);
  if ((_DWORD)v120)
  {
    v93 = v120;
    v34 = 0;
LABEL_155:
    pixelBuffera = 0;
    goto LABEL_62;
  }
  v121 = CVPixelBufferGetPixelFormatType(v177);
  v34 = (__CVBuffer *)-[BWSmartStyleRenderingProcessorController _newPixelBufferWithDimensions:pixelFormat:name:]((uint64_t)self, v118, v121, (uint64_t)CFSTR("SmartStyleOutputStyledThumbnail"));
  if (!v34)
  {
LABEL_152:
    pixelBuffera = 0;
    goto LABEL_148;
  }
  v122 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "downScalePixelBuffer:toPixelBuffer:inputROI:", v177, v34, x, y, width, height);
  if ((_DWORD)v122)
  {
    v93 = v122;
    goto LABEL_155;
  }
  v123 = v171;
  objc_msgSend(v171, "setInputUnstyledThumbnailPixelBuffer:", v34);
  objc_msgSend(v171, "setInputLearningTargetThumbnailPixelBuffer:", cf);
  objc_msgSend(v171, "setOutputSmallLightMapPixelBuffer:", 0);
  objc_msgSend(v171, "setOutputSmallLinearLightMapPixelBuffer:", 0);
  v124 = BWStillImageProcessorTypeToShortString(43);
  v125 = -[BWSmartStyleRenderingProcessorController _newLearningCoefficientsPixelBufferWithName:]((uint64_t)self, v124);
  if (!v125)
    goto LABEL_152;
  pixelBuffera = (__CVBuffer *)v125;
  objc_msgSend(v171, "setOutputLearnedStyleCoefficientsPixelBuffer:", v125);
  -[CMISmartStyleProcessor setInputOutput:](self->_smartStyleProcessor, "setInputOutput:", v171);
  v126 = -[CMISmartStyleProcessor prepareToProcess:](self->_smartStyleProcessor, "prepareToProcess:", 1);
  if ((_DWORD)v126
    || (v126 = -[CMISmartStyleProcessor process](self->_smartStyleProcessor, "process"), (_DWORD)v126)
    || (v126 = -[CMISmartStyleProcessor finishProcessing](self->_smartStyleProcessor, "finishProcessing"), (_DWORD)v126)
    || (v126 = -[CMISmartStyleProcessor resetState](self->_smartStyleProcessor, "resetState"), (_DWORD)v126))
  {
    v93 = v126;
    goto LABEL_62;
  }
  BWSampleBufferSetAttachedMediaFromPixelBuffer(ImageBuffer, 0x1E495B258, v165, (CFTypeRef *)&self->_smartStyleLinearThumbnailFormatDescription, v162, 0, 0);
  BWSampleBufferSetAttachedMediaFromPixelBuffer(ImageBuffer, 0x1E495B298, v34, (CFTypeRef *)&self->_smartStyleStyledThumbnailFormatDescription, 0, 0, 1);
  v127 = (void *)CMGetAttachment(ImageBuffer, key, 0);
  objc_msgSend(v127, "setObject:forKeyedSubscript:", v164, *MEMORY[0x1E0D060E8]);
  objc_msgSend(v127, "setObject:forKeyedSubscript:", v160, *MEMORY[0x1E0D060C0]);
  BWSampleBufferSetAttachedMediaFromPixelBuffer(ImageBuffer, 0x1E495B2D8, pixelBuffera, (CFTypeRef *)&self->_reverseCoefficientsFormatDescription, 0, 0, 1);
  BWSampleBufferSetAttachedMediaFromPixelBuffer(ImageBuffer, 0x1E495B2F8, v168, (CFTypeRef *)&self->_smallLightMapFormatDescription, 0, 0, 1);
  BWSampleBufferSetAttachedMediaFromPixelBuffer(ImageBuffer, 0x1E495B318, v174, (CFTypeRef *)&self->_smallLightMapFormatDescription, 0, 0, 1);
  v94 = kBWNodeSampleBufferAttachmentKey_OriginalCameraIntrinsicMatrixReferenceDimensions;
  if (v163)
  {
    v128 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), (uint64_t)CFSTR("HumanFullBodiesMask"));
    if (!v128)
      goto LABEL_150;
    v129 = CMSampleBufferGetImageBuffer(v128);
    if (!v129)
      goto LABEL_150;
    v130 = v129;
    v187 = *MEMORY[0x1E0D08660];
    v188 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0x10000);
    v131 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v188, &v187, 1);
    v185 = *MEMORY[0x1E0D08730];
    v186 = v131;
    BWSampleBufferSetAttachedMediaFromPixelBuffer(ImageBuffer, 0x1E495AF38, v130, (CFTypeRef *)&self->_personSegmentationFormatDescription, 0, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v186, &v185, 1), 1);
    v183 = *MEMORY[0x1E0D08770];
    v184 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0x10000);
    v132 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1);
    v181 = *MEMORY[0x1E0D08738];
    v182 = v132;
    v133 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1);
    v134 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), (uint64_t)CFSTR("HumanSkinsMask"));
    if (!v134
      || (v135 = CMSampleBufferGetImageBuffer(v134), v123 = v171, !v135)
      || (BWSampleBufferSetAttachedMediaFromPixelBuffer(ImageBuffer, (uint64_t)CFSTR("PersonSemanticsSkin"), v135, (CFTypeRef *)&self->_skinSegmentationFormatDescription, 0, v133, 1), (v136 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), 0x1E495B218)) == 0)|| (v137 = CMSampleBufferGetImageBuffer(v136)) == 0)
    {
LABEL_150:
      v93 = 4294954516;
      goto LABEL_100;
    }
    BWSampleBufferSetAttachedMediaFromPixelBuffer(ImageBuffer, 0x1E495B0B8, v137, (CFTypeRef *)&self->_skySegmentationFormatDescription, 0, v133, 1);
  }
LABEL_96:
  v171 = v123;
  if (v179)
    BWSampleBufferSetAttachedMediaFromPixelBuffer(ImageBuffer, 0x1E495B2B8, v179, (CFTypeRef *)&self->_coefficientsFormatDescription, 0, 0, 1);
  else
    v179 = 0;
  v93 = 0;
LABEL_100:
  BWSampleBufferRemoveAttachedMedia((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input", v152, v154), "inputFrame"), 0x1E495B358);
  BWSampleBufferRemoveAttachedMedia((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), 0x1E495B3F8);
  BWSampleBufferRemoveAttachedMedia((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), 0x1E495B238);
  BWSampleBufferRemoveAttachedMedia(ImageBuffer, 0x1E495B358);
  BWSampleBufferRemoveAttachedMedia(ImageBuffer, 0x1E495B238);
  BWSampleBufferRemoveAttachedMedia(ImageBuffer, 0x1E495B3F8);
  BWSampleBufferRemoveAttachedMedia(ImageBuffer, (uint64_t)CFSTR("HumanFullBodiesMask"));
  BWSampleBufferRemoveAttachedMedia(ImageBuffer, (uint64_t)CFSTR("HumanSkinsMask"));
  BWSampleBufferRemoveAttachedMedia(ImageBuffer, (uint64_t)v94[91]);
  if ((_DWORD)v93)
  {
    v138 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
    v139 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Photographic Styles] %@ Rendering failed with err:%d"), v138, v93);
    FigCapturePromptOpenTapToRadar((uint64_t)CFSTR("Photographic Styles Rendering Failed. Please file a radar."), v139, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Photographic Styles rendering failed with err:%d, for captureID:%lld while I was... {Please embellish with any details about the scene, subject, or other such information}"), v93, -[FigCaptureStillImageSettings settingsID](-[BWStillImageProcessorControllerInput settings](-[BWStillImageProcessorControllerRequest input](v15, "input"), "settings"), "settingsID")), 3, 6, 6, 0.0);
    BWStillImageSetProcessingFlagsForSampleBuffer((const void *)-[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame"), 0x800000);
    v140 = -[BWStillImageProcessorControllerRequest delegate](v15, "delegate");
    v141 = -[BWStillImageProcessorControllerInput inputFrame](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputFrame");
    v142 = -[BWStillImageProcessorControllerInput inputBufferType](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputBufferType");
    v143 = -[BWStillImageProcessorControllerRequest input](v15, "input");
    v144 = (void *)v140;
    v145 = self;
    v146 = v141;
    v147 = v142;
  }
  else
  {
    v148 = -[BWStillImageProcessorControllerRequest delegate](v15, "delegate");
    v149 = -[BWStillImageProcessorControllerInput inputBufferType](-[BWStillImageProcessorControllerRequest input](v15, "input"), "inputBufferType");
    v143 = -[BWStillImageProcessorControllerRequest input](v15, "input");
    v144 = (void *)v148;
    v145 = self;
    v146 = (uint64_t)ImageBuffer;
    v147 = v149;
  }
  objc_msgSend(v144, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v145, v146, v147, v143, 0);

  if (ImageBuffer)
    CFRelease(ImageBuffer);
  if (v177)
    CFRelease(v177);
  if (v165)
    CFRelease(v165);
  if (pixelBuffera)
    CFRelease(pixelBuffera);
  if (v179)
    CFRelease(v179);
  if (v168)
    CFRelease(v168);
  if (v174)
    CFRelease(v174);
  if (cf)
    CFRelease(cf);
  if (v34)
    CFRelease(v34);

  return 0;
}

- (uint64_t)_tuningParameterVariantForCaptureType:(uint64_t)a3 captureFlags:
{
  uint64_t v3;

  if (result)
  {
    v3 = MEMORY[0x1E0D08A10];
    switch(a2)
    {
      case 1:
      case 7:
        v3 = MEMORY[0x1E0D08A40];
        break;
      case 2:
        v3 = MEMORY[0x1E0D08A28];
        break;
      case 10:
        v3 = MEMORY[0x1E0D08A30];
        break;
      case 11:
        v3 = MEMORY[0x1E0D08A18];
        if ((a3 & 0x800000000) == 0)
          v3 = MEMORY[0x1E0D08A30];
        break;
      case 12:
        v3 = MEMORY[0x1E0D08A08];
        break;
      default:
        break;
    }
    if ((~a3 & 0x100000080) == 0)
      v3 = MEMORY[0x1E0D08A20];
    return *(_QWORD *)v3;
  }
  return result;
}

- (double)_getDenormalizedFinalCropRectfromMetadata:(__CVBuffer *)a3 pixelBuffer:
{
  double x;
  double FinalCropRect;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  size_t Width;
  size_t Height;
  void *v15;
  double v16;
  CGRect v18;

  if (!a1)
    return 0.0;
  x = *MEMORY[0x1E0C9D628];
  if (a2)
  {
    if (a3)
    {
      FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
      v8 = v7;
      v10 = v9;
      v12 = v11;
      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      v15 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06118]);
      objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D061D0]), "doubleValue");
      FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(Width, Height, FinalCropRect, v8, v10, v12, v16);
      x = v18.origin.x;
      if (CGRectIsNull(v18))
        FigDebugAssert3();
    }
  }
  return x;
}

- (uint64_t)_newPixelBufferWithDimensions:(uint64_t)a3 pixelFormat:(uint64_t)a4 name:
{
  id v4;

  if (a1)
  {
    v4 = +[BWOnDemandPixelBufferAllocator onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:](BWOnDemandPixelBufferAllocator, "onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:", a2, a3, a4, +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
    if (v4)
      return objc_msgSend(v4, "newPixelBuffer");
    FigDebugAssert3();
  }
  return 0;
}

- (uint64_t)_newLearningCoefficientsPixelBufferWithName:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "getDefaultProcessorConfigurationForStills"), "pixelBufferAttributesWithCapacityForLearntCoefficients");
    v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]), "intValue");
    v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "intValue");
    return -[BWSmartStyleRenderingProcessorController _newPixelBufferWithDimensions:pixelFormat:name:](v3, v6 | (unint64_t)(objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "intValue") << 32), v5, a2);
  }
  return result;
}

- (uint64_t)_populateInputLinearPixelBufferColorManagementMetadata:(uint64_t)a1
{
  __int16 v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  if (!a1)
    return 0;
  if (pixelBuffer)
  {
    CVPixelBufferGetPixelFormatType(pixelBuffer);
    v3 = CMIGetPixelFormatInfo();
    v4 = (const __CFString *)*MEMORY[0x1E0CA8D68];
    if (CMGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8D68], 0))
    {
      if ((v3 & 0x100) == 0)
      {
LABEL_9:
        v6 = (const __CFString *)*MEMORY[0x1E0CA8E98];
        if (!CMGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8E98], 0))
          CVBufferSetAttachment(pixelBuffer, v6, (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
        return 0;
      }
    }
    else
    {
      CVBufferSetAttachment(pixelBuffer, v4, (CFTypeRef)*MEMORY[0x1E0CA8D98], kCVAttachmentMode_ShouldPropagate);
      if ((v3 & 0x100) == 0)
        goto LABEL_9;
    }
    v5 = (const __CFString *)*MEMORY[0x1E0CA8EE8];
    if (!CMGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8EE8], 0))
      CVBufferSetAttachment(pixelBuffer, v5, (CFTypeRef)*MEMORY[0x1E0CA8F10], kCVAttachmentMode_ShouldPropagate);
    goto LABEL_9;
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (uint64_t)_newSmallLightMapPixelBufferWithName:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "getDefaultProcessorConfigurationForStills"), "pixelBufferAttributesForSmallLightMap");
    v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]), "intValue");
    v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "intValue");
    return -[BWSmartStyleRenderingProcessorController _newPixelBufferWithDimensions:pixelFormat:name:](v3, v6 | (unint64_t)(objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "intValue") << 32), v5, a2);
  }
  return result;
}

- (CMAttachmentBearerRef)_newOutputSampleBufferFromSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(void *)a4 additionalMetadata:(CFTypeRef *)a5 formatDescriptionInOut:
{
  void *v6;
  int v7;
  int CopyWithNewPixelBuffer;
  const __CFString *v10;
  CMAttachmentBearerRef target;

  if (result)
  {
    v6 = 0;
    target = 0;
    v7 = -12780;
    if (a2 && a3)
    {
      CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, a3, a5, (CMSampleBufferRef *)&target);
      if (CopyWithNewPixelBuffer)
      {
        v7 = CopyWithNewPixelBuffer;
        v6 = 0;
      }
      else
      {
        v10 = (const __CFString *)*MEMORY[0x1E0D05CB0];
        v6 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
        if (objc_msgSend(a4, "count"))
          objc_msgSend(v6, "addEntriesFromDictionary:", a4);
        CMSetAttachment(target, v10, v6, 1u);
        BWSampleBufferPropagateAttachedMedia(a2, target);
        v7 = 0;
      }
    }

    result = target;
    if (v7)
    {
      if (target)
      {
        CFRelease(target);
        return 0;
      }
    }
  }
  return result;
}

- (id)metalImageBufferProcessor
{
  return self->_smartStyleProcessor;
}

- ($2825F4736939C4A6D3AD43837233062D)linearYUVIntermediateThumbnailDimensions
{
  double v3;
  uint64_t v4;
  double v5;

  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  v4 = (int)v3;
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  return ($2825F4736939C4A6D3AD43837233062D)(v4 | ((unint64_t)(int)v5 << 32));
}

+ ($2825F4736939C4A6D3AD43837233062D)linearYUVIntermediateThumbnailDimensionsForStills
{
  double v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0D08AD0], "intermediateStyleRendererThumbnailSizeForUseCase:", 1);
  return ($2825F4736939C4A6D3AD43837233062D)((int)v2 | ((unint64_t)(int)v3 << 32));
}

uint64_t __93__BWSmartStyleRenderingProcessorController__loadSetupAndPrepareSmartStyleRenderingProcessor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_msgSend(*(id *)(a1 + 32), "deferredPhotoProcessorEnabled");
  v5 = CFSTR("Still");
  if (v4)
    v5 = CFSTR("Still-Deferred");
  objc_msgSend(a2, "setInstanceLabel:", objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v5));
  return 0;
}

- (uint64_t)_setupConfigurationAndClasses:(uint64_t)a3 version:
{
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  Class v9;
  Class v10;

  if (result)
  {
    v5 = result;
    v6 = *(unsigned __int8 *)(result + 153);
    v7 = (void *)objc_opt_class();
    if (v6)
      v8 = objc_msgSend(v7, "getDefaultProcessorConfigurationForStreaming");
    else
      v8 = objc_msgSend(v7, "getDefaultProcessorConfigurationForStills");
    objc_msgSend(a2, "setConfiguration:", v8);
    if (objc_msgSend(a2, "configuration")
      && (objc_msgSend(a2, "setShouldFlushCVMTLTextureCacheAfterProcessing:", 1),
          v9 = NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleV%d"), a3)), (*(_QWORD *)(v5 + 136) = v9) != 0)&& (v10 = NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProcessorInputOutputV%d"), a3)), (*(_QWORD *)(v5 + 144) = v10) != 0))
    {
      return 0;
    }
    else
    {
      return 4294954510;
    }
  }
  return result;
}

@end
