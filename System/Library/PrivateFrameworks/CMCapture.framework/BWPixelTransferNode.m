@implementation BWPixelTransferNode

BOOL __51__BWPixelTransferNode__supportedOutputPixelFormats__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int IsFullRange;
  uint64_t v9;
  int v10;
  int v11;
  int v12;

  v4 = objc_msgSend(a2, "intValue");
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v5 + 356) == 1
    && objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "videoFormat"), "isHLGColorSpace")
    && FigCapturePixelFormatGetCompressionType(v4))
  {
    return 0;
  }
  if (FigCapturePixelFormatIsFullRange(v4))
    v6 = FigCaptureVideoRangePixelFormatForPixelFormat(v4);
  else
    v6 = FigCaptureFullRangePixelFormatForPixelFormat(v4);
  v7 = v6;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "containsObject:", a2) & 1) != 0
    || *(_DWORD *)(*(_QWORD *)(a1 + 32) + 224) == (_DWORD)v4)
  {
    if ((FigCapturePixelFormatIsTenBit(v4) & 1) != 0)
      IsFullRange = 0;
    else
      IsFullRange = FigCapturePixelFormatIsFullRange(v4);
    v9 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v9 + 361))
    {
      if (*(_BYTE *)(a1 + 40))
        v10 = IsFullRange ^ 1;
      else
        v10 = 1;
    }
    else
    {
      v10 = 1;
    }
    if ((_DWORD)v7 == (_DWORD)v4
      || (objc_msgSend(*(id *)(v9 + 232), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7)) & v10) != 1)
    {
      return 1;
    }
    v11 = FigCapturePixelFormatIsFullRange(v4);
    v12 = *(unsigned __int8 *)(a1 + 41);
  }
  else
  {
    if (*(unsigned __int8 *)(a1 + 41) != FigCapturePixelFormatIsFullRange(v4)
      || *(unsigned __int8 *)(a1 + 42) != FigCapturePixelFormatIsTenBit(v4))
    {
      return 0;
    }
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 360))
      return 1;
    v11 = FigCapturePixelFormatIs422(v4);
    v12 = *(unsigned __int8 *)(a1 + 43);
  }
  return v12 == v11;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *emitSampleBufferSemaphore;
  __CVBuffer *ImageBuffer;
  int liveCropMode;
  _BOOL4 haveLiveInputCropRect;
  CGSize size;
  const __CFString *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  size_t v16;
  size_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  float v22;
  float v23;
  __CFDictionary *v24;
  __CFDictionary *v25;
  const void *v26;
  float64x2_t v27;
  double height;
  size_t Width;
  size_t v30;
  double v31;
  size_t v32;
  int v33;
  uint64x2_t v34;
  float64x2_t v35;
  float64x2_t v40;
  const void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float64_t v48;
  float64_t v49;
  float64_t v50;
  void *v51;
  void *v52;
  int v53;
  _BOOL4 IsExtensionDeviceType;
  int v55;
  int liveRotationDegrees;
  NSObject *v57;
  NSObject *v58;
  int v59;
  int v60;
  float64_t v61;
  float64_t v62;
  float64_t v63;
  NSObject *v64;
  NSObject *v65;
  char v66;
  int v67;
  __CVBuffer *v68;
  opaqueCMSampleBuffer *v69;
  unsigned int v70;
  unsigned int v71;
  const __CFString *v72;
  int v73;
  int v74;
  double v75;
  size_t v76;
  unint64_t v77;
  uint64_t v78;
  __CVBuffer *v79;
  float64x2_t v81;
  float64x2_t v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  size_t v86;
  const __CFDictionary *v87;
  double v88;
  double v89;
  double v90;
  CGFloat y;
  CGFloat x;
  CGFloat v93;
  CGFloat v94;
  double v95;
  double v96;
  double MinX;
  double v98;
  double v99;
  NSObject *v100;
  double v101;
  double v102;
  CGFloat v103;
  double v104;
  double v105;
  double v106;
  CGFloat v107;
  CGFloat v108;
  double v109;
  _DWORD *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  float v123;
  float v124;
  float v125;
  CFDictionaryRef v126;
  double v127;
  double v128;
  double v129;
  float v130;
  double v131;
  void *Attributes;
  const __CFString *v133;
  const __CFString *v134;
  const __CFString *v135;
  uint64_t v136;
  _BOOL4 v137;
  int v138;
  const __CFString *v139;
  NSObject *v140;
  OSType v141;
  float v142;
  uint64_t v143;
  _BOOL4 v144;
  int v145;
  NSObject *v146;
  size_t v147;
  _DWORD *v148;
  uint64_t v149;
  _BOOL4 v150;
  int v151;
  NSObject *v152;
  double MinY;
  double v154;
  __CVBuffer *v155;
  double v156;
  int v157;
  int v158;
  double v159;
  double v160;
  int v161;
  int v162;
  double v163;
  OSType PixelFormatType;
  int IsTenBitPacked;
  double v166;
  float v167;
  float64_t v168;
  float64x2_t v169;
  CFDictionaryRef DictionaryRepresentation;
  NSObject *v171;
  NSObject *v172;
  NSObject *v173;
  BWLimitedGMErrorLogger *v174;
  void *v175;
  NSString *v176;
  Float64 Seconds;
  OpaqueVTPixelRotationSession *rotationSession;
  OSType v179;
  const __CFString *v180;
  const __CFString *v181;
  OSType v182;
  const __CFString *v183;
  const __CFString *v184;
  _BOOL4 doGMLogging;
  int v186;
  NSObject *v187;
  NSObject *v188;
  NSObject *v189;
  BWLimitedGMErrorLogger *limitedGMErrorLogger;
  void *v191;
  NSString *v192;
  __CVBuffer *v193;
  float64_t v194;
  float64_t v195;
  float64_t v196;
  NSObject *v197;
  NSObject *v198;
  NSObject *v199;
  id v200;
  uint64_t v201;
  int conversionMethodForStillImagesDuringHDRVideo;
  _BOOL4 v203;
  int v204;
  NSObject *v205;
  NSObject *v206;
  NSObject *v207;
  OSStatus v208;
  void *v209;
  uint64_t v210;
  const opaqueCMFormatDescription *FormatDescription;
  CMVideoDimensions Dimensions;
  int v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  BOOL IsNull;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  CFTypeRef v232;
  CFTypeRef v233;
  __CVBuffer *v234;
  Float64 v235;
  OpaqueVTPixelRotationSession *v236;
  OSType v237;
  const __CFString *v238;
  size_t v239;
  OSType v240;
  const __CFString *v241;
  size_t v242;
  CFTypeRef v243;
  const __CFString *v244;
  CFTypeRef v245;
  CFTypeRef v246;
  void *v247;
  __IOSurface *IOSurface;
  NSObject *v249;
  unsigned int v250;
  unsigned int v251;
  NSString *v252;
  Float64 v253;
  id v254;
  uint64_t v255;
  int *v256;
  uint64_t v257;
  uint64_t v258;
  const __CFString *v259;
  const __CFString *v260;
  const __CFString *v261;
  const __CFString *v262;
  uint64_t v263;
  uint64_t v264;
  const __CFString *v265;
  unint64_t v266;
  float64x2_t v267;
  double v268;
  uint64_t v269;
  double propertyKey;
  double propertyKeya;
  const __CFString *propertyKeyb;
  CVPixelBufferRef destinationBuffer;
  __CVBuffer *destinationBuffera;
  _BOOL4 fractionalSourceRectEnabled;
  CGFloat v276;
  __CVBuffer *pixelBuffer;
  int v278;
  double v279;
  int v280;
  unsigned int v281;
  double v282;
  NSString *v283;
  OSStatus v284;
  void *v285;
  size_t v286;
  double v287;
  double v288;
  BWLimitedGMErrorLogger *v289;
  CGSize sourceBuffer;
  __CVBuffer *sourceBuffera;
  CGPoint v292;
  opaqueCMSampleBuffer *v293;
  CMTime v294;
  CMTime v295;
  unsigned __int8 v296;
  CMTime v297;
  CMTime v298;
  CMTime v299;
  os_log_type_t v300[8];
  CMSampleBufferRef type;
  float64x2_t origin;
  CGSize v303;
  int v304;
  const char *v305;
  __int16 v306;
  NSString *v307;
  __int16 v308;
  BWPixelTransferNode *v309;
  __int16 v310;
  Float64 v311;
  CGRect rect;
  uint64_t v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;
  CGRect v318;
  CGRect v319;
  CGRect v320;
  CGRect v321;
  CGRect v322;
  CGRect v323;
  CGRect v324;
  CGRect v325;
  CGRect v326;
  CGRect v327;
  CGRect v328;

  v313 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (self->_makeCurrentConfigurationLiveOnNextRenderCallback)
  {
    -[BWPixelTransferNode _makeCurrentConfigurationLive]((uint64_t)self);
    self->_makeCurrentConfigurationLiveOnNextRenderCallback = 0;
    -[BWNodeOutput makeConfiguredFormatLive](self->super._output, "makeConfiguredFormatLive");
  }
  if (!self->_liveExpectsMarkerBuffers || (-[BWPixelTransferNode _emitIfMarkerBuffer:]((uint64_t)self, a3) & 1) == 0)
  {
    if (self->_doGMLogging && dword_1ECFE9B70 != 0)
    {
      LODWORD(origin.f64[0]) = 0;
      LOBYTE(type) = 0;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    emitSampleBufferSemaphore = self->_emitSampleBufferSemaphore;
    if (emitSampleBufferSemaphore)
      dispatch_semaphore_wait(emitSampleBufferSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    sourceBuffer = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v292 = (CGPoint)*MEMORY[0x1E0C9D648];
    origin = *(float64x2_t *)MEMORY[0x1E0C9D648];
    v303 = sourceBuffer;
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    fractionalSourceRectEnabled = self->_fractionalSourceRectEnabled;
    type = 0;
    liveCropMode = self->_liveCropMode;
    if (liveCropMode == 2)
    {
      if (!CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)
        || !FigCFDictionaryGetCGRectIfPresent())
      {
        goto LABEL_29;
      }
    }
    else
    {
      if (liveCropMode == 1)
      {
        v24 = (__CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        if (v24)
        {
          v25 = v24;
          v26 = (const void *)*MEMORY[0x1E0D05E68];
          if (FigCFDictionaryGetCGRectIfPresent())
          {
            v27 = origin;
            height = v303.height;
            Width = CVPixelBufferGetWidth(ImageBuffer);
            v30 = CVPixelBufferGetHeight(ImageBuffer);
            if (fractionalSourceRectEnabled)
            {
              origin.f64[0] = origin.f64[0] * (double)Width;
              origin.f64[1] = origin.f64[1] * (double)v30;
              v303.width = v303.width * (double)Width;
              v31 = v303.height * (double)v30;
            }
            else
            {
              v34.i64[0] = Width;
              v34.i64[1] = v30;
              v35 = vcvtq_f64_u64(v34);
              __asm { FMOV            V2.2D, #0.5 }
              v40 = vrndaq_f64(vmulq_f64(vmulq_f64(origin, v35), _Q2));
              origin = vaddq_f64(v40, v40);
              _Q2.f64[0] = round(v303.width * v35.f64[0] * 0.5);
              v303.width = _Q2.f64[0] + _Q2.f64[0];
              v35.f64[0] = round(vmuld_lane_f64(v303.height, v35, 1) * 0.5);
              v31 = v35.f64[0] + v35.f64[0];
            }
            v303.height = v31;
            CFDictionaryRemoveValue(v25, v26);
            if (self->_liveUpdatesSampleBufferMetadataForIrisVIS)
            {
              v304 = 0;
              v41 = (const void *)*MEMORY[0x1E0D06AC0];
              if (FigCFDictionaryGetInt32IfPresent())
                CFDictionarySetValue(v25, v41, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(height * (double)v304)));
              rect.origin = v292;
              rect.size = sourceBuffer;
              if (FigCFDictionaryGetCGRectIfPresent())
              {
                *(_QWORD *)v300 = 0;
                FigCFDictionaryGetInt32IfPresent();
                FigCFDictionaryGetInt32IfPresent();
                v42 = ceil(v27.f64[0] * rect.size.width);
                v43 = floor(v27.f64[0] * rect.size.width);
                if (v27.f64[0] * rect.size.width >= 0.0)
                  v44 = v43;
                else
                  v44 = v42;
                v45 = rect.origin.x + v44;
                v46 = ceil(v27.f64[1] * rect.size.height);
                v47 = floor(v27.f64[1] * rect.size.height);
                if (v27.f64[1] * rect.size.height < 0.0)
                  v47 = v46;
                rect.origin.x = v45;
                rect.origin.y = rect.origin.y + v47;
                rect.size.width = (double)*(int *)&v300[4] - v45 * 2.0;
                rect.size.height = (double)*(int *)v300 - rect.origin.y * 2.0;
                FigCFDictionarySetCGRect();
              }
            }
            goto LABEL_43;
          }
        }
        goto LABEL_29;
      }
      if (liveCropMode)
        goto LABEL_29;
      haveLiveInputCropRect = self->_haveLiveInputCropRect;
      size = self->_liveInputCropRect.size;
      origin = (float64x2_t)self->_liveInputCropRect.origin;
      v303 = size;
      if (-[BWPixelTransferNode appliesPrimaryCaptureRect](self, "appliesPrimaryCaptureRect"))
      {
        v13 = (const __CFString *)*MEMORY[0x1E0D05D10];
        v14 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D10], 0);
        if (v14)
        {
          v15 = v14;
          memset(&rect, 0, sizeof(rect));
          v16 = CVPixelBufferGetWidth(ImageBuffer);
          v17 = CVPixelBufferGetHeight(ImageBuffer);
          CGRectMakeWithDictionaryRepresentation(v15, &rect);
          FigCaptureMetadataUtilitiesDenormalizeCropRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
          rect.origin.x = v18;
          rect.origin.y = v19;
          rect.size.width = v20;
          rect.size.height = v21;
          CMSetAttachment(a3, v13, 0, 1u);
          if (haveLiveInputCropRect)
          {
            v22 = v303.width;
            v23 = v303.height;
          }
          else
          {
            v22 = (float)v16;
            v23 = (float)v17;
          }
          origin.f64[0] = FigCaptureMetadataUtilitiesRectByCroppingRectToAspectRatio(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v22 / v23);
          origin.f64[1] = v48;
          v303.width = v49;
          v303.height = v50;
          goto LABEL_43;
        }
      }
      if (!haveLiveInputCropRect)
      {
LABEL_29:
        v281 = CVPixelBufferGetWidth(ImageBuffer);
        v32 = CVPixelBufferGetHeight(ImageBuffer);
        v33 = 0;
        goto LABEL_44;
      }
    }
LABEL_43:
    v281 = (int)v303.width;
    v32 = (int)v303.height;
    v33 = 1;
LABEL_44:
    v286 = v32;
    sourceBuffera = ImageBuffer;
    v293 = a3;
    if (!self->_liveDeviceOrientationCorrectionEnabled)
      goto LABEL_64;
    v278 = v33;
    -[BWPixelTransferNode _ensureDeviceOrientationMonitor]((uint64_t)self);
    v51 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v52 = (void *)objc_msgSend(v51, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    if ((objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0D05A38]) & 1) != 0)
      v53 = 1;
    else
      v53 = objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0D05A50]);
    IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B8], v255, v257), "integerValue"));
    v55 = -[BWDeviceOrientationMonitor mostRecentPortraitLandscapeOrientation](self->_deviceOrientationMonitor, "mostRecentPortraitLandscapeOrientation");
    -[BWGraph clientExpectsCameraMountedInLandscapeOrientation](-[BWNode graph](self, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
    liveRotationDegrees = FigCaptureRotationDegreesFromOrientation(v55, v53, IsExtensionDeviceType, 0);
    self->_liveRotationDegrees = liveRotationDegrees;
    if (self->_prevLiveDeviceOrientationCorrectionDegrees != liveRotationDegrees)
    {
      if (dword_1ECFE9B70)
      {
        *(_DWORD *)&v300[4] = 0;
        v300[0] = OS_LOG_TYPE_DEFAULT;
        v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (dword_1ECFE9B70)
        {
          *(_DWORD *)&v300[4] = 0;
          v300[0] = OS_LOG_TYPE_DEFAULT;
          v58 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      self->_doGMLogging = 1;
      self->_prevLiveDeviceOrientationCorrectionDegrees = self->_liveRotationDegrees;
      liveRotationDegrees = self->_liveRotationDegrees;
    }
    v33 = v278;
    if (liveRotationDegrees)
    {
      v59 = v286;
      v60 = v281;
      if (liveRotationDegrees != 90)
      {
        v59 = v286;
        v60 = v281;
        if (liveRotationDegrees != 270)
        {
          v59 = v281;
          v60 = v286;
        }
      }
      origin.f64[0] = FigCaptureMakeRectWithAspectRatioInsideDimensions(v281 | (v286 << 32), 0, (float)v59 / (float)v60);
      origin.f64[1] = v61;
      v303.width = v62;
      v303.height = v63;
      v33 = 1;
      if (!self->_doGMLogging || !dword_1ECFE9B70)
      {
LABEL_64:
        if (self->_liveCropMode == 3
          && -[BWNodeInput passthroughMode](self->super._input, "passthroughMode") == 1
          && -[BWNodeOutput passthroughMode](self->super._output, "passthroughMode") == 1
          || (!self->_livePassesBuffersThroughWhenPossible ? (v66 = 1) : (v66 = v33), (v66 & 1) == 0))
        {
          if (self->_doGMLogging && dword_1ECFE9B70)
          {
            *(_DWORD *)&v300[4] = 0;
            v300[0] = OS_LOG_TYPE_DEFAULT;
            v100 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          self->_doGMLogging = 0;
          -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v255, v257);
          LODWORD(v147) = 0;
          v148 = (_DWORD *)MEMORY[0x1E0CA1FC0];
          goto LABEL_258;
        }
        if (self->_liveAppliesUprightExifOrientationTransformToInput)
        {
          v67 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("UprightExifOrientation"), 0), "intValue");
          -[BWPixelTransferNode _updateLiveRotationAndFlipsToApplyUprightExifOrientation:]((uint64_t)self, v67);
        }
        v68 = -[BWPixelBufferPool newPixelBuffer](-[BWNodeOutput livePixelBufferPool](self->super._output, "livePixelBufferPool", v255, v257), "newPixelBuffer");
        if (v68)
          BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v68, (CFTypeRef *)&self->_outputFormatDescription, &type);
        pixelBuffer = v68;
        if (type)
        {
          v69 = a3;
          v70 = CVPixelBufferGetWidth(pixelBuffer);
          v71 = CVPixelBufferGetHeight(pixelBuffer);
          v72 = (const __CFString *)*MEMORY[0x1E0D05CB0];
          CMGetAttachment(v69, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
          rect.origin.x = 1.0;
          FigCFDictionaryGetCGFloatIfPresent();
          v73 = self->_liveRotationDegrees;
          if (v73 == 270 || (v74 = v71, v73 == 90))
            v74 = v70;
          v75 = (double)v74;
          v76 = v286;
          rect.origin.x = rect.origin.x * v75 / (float)(int)v286;
          if (rect.origin.x > 1.0)
          {
            FigCFDictionarySetCGFloat();
            v76 = v286;
          }
          v77 = -[BWPixelTransferNode _intermediateBufferDimensionsForInputDimensions:outputDimensions:]((uint64_t)self, v281 | (v76 << 32), v70 | ((unint64_t)v71 << 32));
          v78 = v77;
          if (!(_DWORD)v77)
          {
            destinationBuffera = 0;
            a3 = v293;
            v79 = pixelBuffer;
            goto LABEL_104;
          }
          a3 = v293;
          v79 = pixelBuffer;
          if (!HIDWORD(v77))
          {
            destinationBuffera = 0;
            goto LABEL_104;
          }
          v266 = HIDWORD(v77);
          v267 = origin;
          propertyKey = v303.width;
          if (fractionalSourceRectEnabled)
          {
            __asm { FMOV            V0.2D, #0.5 }
            v81 = vrndmq_f64(vmulq_f64(origin, _Q0));
            origin = vaddq_f64(v81, v81);
            v82 = vrndpq_f64(vmulq_f64(vaddq_f64(vsubq_f64(origin, origin), (float64x2_t)v303), _Q0));
            v303 = (CGSize)vaddq_f64(v82, v82);
            memset(&rect, 0, sizeof(rect));
            v83 = *MEMORY[0x1E0C9D648];
            v84 = *(double *)(MEMORY[0x1E0C9D648] + 8);
            v85 = (double)CVPixelBufferGetWidth(ImageBuffer);
            v86 = CVPixelBufferGetHeight(ImageBuffer);
            rect.origin.x = v83;
            rect.origin.y = v84;
            rect.size.width = v85;
            rect.size.height = (double)v86;
            v87 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v293, v72, 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06F48]);
            CGRectMakeWithDictionaryRepresentation(v87, &rect);
            v89 = origin.f64[1];
            v88 = origin.f64[0];
            v90 = v303.width;
            x = rect.origin.x;
            y = rect.origin.y;
            v94 = rect.size.width;
            v93 = rect.size.height;
            if (rect.size.width < v303.width)
              v90 = rect.size.width;
            if (v90 >= 0.0)
              v95 = v90;
            else
              v95 = 0.0;
            if (rect.size.height >= v303.height)
              v96 = v303.height;
            else
              v96 = rect.size.height;
            if (v96 < 0.0)
              v96 = 0.0;
            *(double *)&destinationBuffer = v96;
            MinX = CGRectGetMinX(rect);
            v314.origin.x = x;
            v314.origin.y = y;
            v314.size.width = v94;
            v314.size.height = v93;
            v279 = v95;
            _NF = CGRectGetMaxX(v314) - v95 < v88;
            v98 = v88;
            if (_NF)
            {
              v315.origin.x = x;
              v315.origin.y = y;
              v315.size.width = v94;
              v315.size.height = v93;
              v98 = CGRectGetMaxX(v315) - v95;
            }
            if (MinX <= v98)
            {
              v320.origin.x = x;
              v320.origin.y = y;
              v320.size.width = v94;
              v320.size.height = v93;
              v99 = *(double *)&destinationBuffer;
              if (CGRectGetMaxX(v320) - v279 < v88)
              {
                v321.origin.x = x;
                v321.origin.y = y;
                v321.size.width = v94;
                v321.size.height = v93;
                v88 = CGRectGetMaxX(v321) - v279;
              }
            }
            else
            {
              v316.origin.x = x;
              v316.origin.y = y;
              v316.size.width = v94;
              v316.size.height = v93;
              v88 = CGRectGetMinX(v316);
              v99 = *(double *)&destinationBuffer;
            }
            v322.origin.x = x;
            v322.origin.y = y;
            v322.size.width = v94;
            v322.size.height = v93;
            MinY = CGRectGetMinY(v322);
            v323.origin.x = x;
            v323.origin.y = y;
            v323.size.width = v94;
            v323.size.height = v93;
            _NF = CGRectGetMaxY(v323) - v99 < v89;
            v154 = v89;
            if (_NF)
            {
              v324.origin.x = x;
              v324.origin.y = y;
              v324.size.width = v94;
              v324.size.height = v93;
              v154 = CGRectGetMaxY(v324) - v99;
            }
            if (MinY <= v154)
            {
              v326.origin.x = x;
              v326.origin.y = y;
              v326.size.width = v94;
              v326.size.height = v93;
              if (CGRectGetMaxY(v326) - v99 < v89)
              {
                v327.origin.x = x;
                v327.origin.y = y;
                v327.size.width = v94;
                v327.size.height = v93;
                v89 = CGRectGetMaxY(v327) - v99;
              }
            }
            else
            {
              v325.origin.x = x;
              v325.origin.y = y;
              v325.size.width = v94;
              v325.size.height = v93;
              v89 = CGRectGetMinY(v325);
            }
            origin.f64[0] = v88;
            origin.f64[1] = v89;
            v303.width = v279;
            v303.height = v99;
          }
          -[BWPixelTransferNode _ensureIntermediatePoolWithDimensions:]((uint64_t)self, v78);
          -[BWPixelTransferNode _ensureTransferSession]((uint64_t)self);
          v155 = -[BWPixelBufferPool newPixelBuffer](self->_intermediateBufferPool, "newPixelBuffer");
          if (v155)
          {
            destinationBuffera = v155;
            if (v33)
            {
              v156 = v303.width;
              if (v303.width < 16.0)
              {
                v157 = 16 - (int)v303.width;
                v303.width = 16.0;
                v158 = 17 - (int)v156;
                if ((int)v156 <= 16)
                  v158 = v157;
                v159 = origin.f64[0] - (double)(v158 >> 1);
                if (v159 < 0.0)
                  v159 = 0.0;
                origin.f64[0] = v159;
              }
              v160 = v303.height;
              if (v303.height < 16.0)
              {
                v161 = 16 - (int)v303.height;
                v303.height = 16.0;
                v162 = 17 - (int)v160;
                if ((int)v160 <= 16)
                  v162 = v161;
                v163 = origin.f64[1] - (double)(v162 >> 1);
                if (v163 < 0.0)
                  v163 = 0.0;
                origin.f64[1] = v163;
              }
              PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
              IsTenBitPacked = FigCapturePixelFormatIsTenBitPacked(PixelFormatType);
              v166 = origin.f64[0];
              if (IsTenBitPacked)
              {
                v167 = origin.f64[0];
                v166 = (double)(int)FigCaptureRoundFloatToMultipleOf(6, v167);
                origin.f64[0] = v166;
              }
              v168 = origin.f64[1];
              v169 = (float64x2_t)v303;
              DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)&v166);
              if (self->_doGMLogging && dword_1ECFE9B70)
              {
                *(_DWORD *)&v300[4] = 0;
                v300[0] = OS_LOG_TYPE_DEFAULT;
                v171 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT);
                a3 = v293;
                v79 = pixelBuffer;
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            else
            {
              DictionaryRepresentation = 0;
            }
            v147 = VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x1E0CED850], DictionaryRepresentation);
            if ((_DWORD)v147)
              -[BWLimitedGMErrorLogger logErrorNumber:errorString:](self->_limitedGMErrorLogger, "logErrorNumber:errorString:", v147, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: %p: setting source crop rect transfer property to %@"), -[BWNode name](self, "name"), self, self->_transferSession, DictionaryRepresentation));
            if (DictionaryRepresentation)
              CFRelease(DictionaryRepresentation);
            if ((_DWORD)v147)
            {
              FigDebugAssert3();
              v148 = (_DWORD *)MEMORY[0x1E0CA1FC0];
              v193 = destinationBuffera;
              goto LABEL_255;
            }
            v147 = VTPixelTransferSessionTransferImage(self->_transferSession, sourceBuffera, destinationBuffera);
            doGMLogging = self->_doGMLogging;
            v186 = dword_1ECFE9B70;
            if (self->_doGMLogging && dword_1ECFE9B70)
            {
              *(_DWORD *)&v300[4] = 0;
              v300[0] = OS_LOG_TYPE_DEFAULT;
              v187 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              doGMLogging = self->_doGMLogging;
              v186 = dword_1ECFE9B70;
              a3 = v293;
            }
            if (doGMLogging && v186)
            {
              *(_DWORD *)&v300[4] = 0;
              v300[0] = OS_LOG_TYPE_DEFAULT;
              v188 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              doGMLogging = self->_doGMLogging;
              v186 = dword_1ECFE9B70;
              a3 = v293;
            }
            if (doGMLogging && v186)
            {
              *(_DWORD *)&v300[4] = 0;
              v300[0] = OS_LOG_TYPE_DEFAULT;
              v189 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              a3 = v293;
            }
            if ((_DWORD)v147)
            {
              limitedGMErrorLogger = self->_limitedGMErrorLogger;
              v191 = (void *)MEMORY[0x1E0CB3940];
              v192 = -[BWNode name](self, "name");
              CMSampleBufferGetPresentationTimeStamp(&v299, a3);
              -[BWLimitedGMErrorLogger logErrorNumber:errorString:](limitedGMErrorLogger, "logErrorNumber:errorString:", v147, objc_msgSend(v191, "stringWithFormat:", CFSTR("%@: %p: %.4lf: %p: transferring from %p to %p"), v192, self, CMTimeGetSeconds(&v299), self->_transferSession, sourceBuffera, destinationBuffera));
              FigDebugAssert3();
              v193 = destinationBuffera;
              v148 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_255:
              CFRelease(v193);
              goto LABEL_256;
            }
            if (fractionalSourceRectEnabled)
            {
              origin.f64[0] = ptn_rectBoundedByDimensions(v78, (double)(int)v78 / v303.width * (v267.f64[0] - origin.f64[0]), (double)(int)v266 / v303.height * (v267.f64[1] - origin.f64[1]), (double)(int)v78 / v303.width * propertyKey);
              origin.f64[1] = v194;
              v303.width = v195;
              v303.height = v196;
              v33 = 1;
            }
            else
            {
              v33 = 0;
            }
            sourceBuffera = destinationBuffera;
LABEL_104:
            -[BWPixelTransferNode _ensureRotationSession]((uint64_t)self);
            v101 = (double)CVPixelBufferGetWidth(v79);
            v102 = (double)CVPixelBufferGetHeight(v79);
            v103 = -[BWPixelTransferNode _getUpdatedPrimaryCaptureRectForOutputSampleBuffer:inputDimensions:]((uint64_t)self, type);
            v107 = v103;
            v108 = v105;
            v109 = v106;
            v110 = &unk_1ECFE9000;
            v276 = v104;
            if (self->_generatesHistogram)
            {
              v111 = v104;
              propertyKeya = v103;
              v112 = v101;
              v268 = v105;
              v113 = 0.0;
              v114 = 0.0;
              v115 = v102;
              if (!CGRectIsNull(*(CGRect *)&v103))
              {
                FigCaptureMetadataUtilitiesDenormalizeCropRect(propertyKeya, v111, v268, v109);
                v117 = v116;
                v119 = v118;
                v121 = v120;
                *(float *)&v122 = v122;
                v113 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, *(float *)&v122);
                v123 = v117;
                v114 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, v123);
                v124 = v119;
                v112 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, v124);
                v125 = v121;
                v102 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, v125);
              }
              v317.origin.x = v113;
              v317.origin.y = v114;
              v317.size.width = v112;
              v317.size.height = v102;
              v126 = CGRectCreateDictionaryRepresentation(v317);
              VTSessionSetProperty(self->_rotationSession, (CFStringRef)*MEMORY[0x1E0CED790], v126);
              v107 = propertyKeya;
              v108 = v268;
              v102 = v115;
              if (v126)
                CFRelease(v126);
            }
            v280 = v33;
            if (v33)
            {
              v127 = 0.0;
              if (self->_liveCropMode == 2
                && FigCaptureVideoDimensionsAreValid(*(_QWORD *)&self->_liveValidOutputDimensions))
              {
                v318.origin.x = 0.0;
                v318.origin.y = 0.0;
                v318.size.width = v101;
                v318.size.height = v102;
                v319 = CGRectInset(v318, (v101 - (double)self->_liveValidOutputDimensions.width) * 0.5, (v102 - (double)self->_liveValidOutputDimensions.height) * 0.5);
                v128 = v108;
                v129 = v319.origin.y;
                v101 = v319.size.width;
                v102 = v319.size.height;
                *(float *)&v319.origin.x = v319.origin.x;
                v127 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, *(float *)&v319.origin.x);
                v130 = v129;
                v108 = v128;
                v131 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, v130);
              }
              else
              {
                v131 = 0.0;
              }
              v141 = CVPixelBufferGetPixelFormatType(sourceBuffera);
              if (FigCapturePixelFormatIsTenBitPacked(v141))
              {
                v142 = origin.f64[0];
                origin.f64[0] = (double)(int)FigCaptureRoundFloatToMultipleOf(6, v142);
              }
              v143 = VTPixelRotationSessionRotateSubImage();
              v144 = self->_doGMLogging;
              v145 = dword_1ECFE9B70;
              if (self->_doGMLogging && dword_1ECFE9B70)
              {
                *(_DWORD *)&v300[4] = 0;
                v300[0] = OS_LOG_TYPE_DEFAULT;
                v146 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                v144 = self->_doGMLogging;
                v145 = dword_1ECFE9B70;
                a3 = v293;
                v110 = (_DWORD *)&unk_1ECFE9000;
              }
              if (v144 && v145)
              {
                *(_DWORD *)&v300[4] = 0;
                v300[0] = OS_LOG_TYPE_DEFAULT;
                v172 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                v144 = self->_doGMLogging;
                v145 = dword_1ECFE9B70;
                a3 = v293;
              }
              if (v144 && v145)
              {
                *(_DWORD *)&v300[4] = 0;
                v300[0] = OS_LOG_TYPE_DEFAULT;
                v173 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                a3 = v293;
              }
              if ((_DWORD)v143)
              {
                v147 = v143;
                v174 = self->_limitedGMErrorLogger;
                v175 = (void *)MEMORY[0x1E0CB3940];
                v176 = -[BWNode name](self, "name");
                CMSampleBufferGetPresentationTimeStamp(&v298, a3);
                Seconds = CMTimeGetSeconds(&v298);
                rotationSession = self->_rotationSession;
                v179 = CVPixelBufferGetPixelFormatType(sourceBuffera);
                v180 = BWStringFromCVPixelFormatType(v179);
                v181 = BWStringFromCGRect(origin.f64[0], origin.f64[1], v303.width, v303.height);
                v182 = CVPixelBufferGetPixelFormatType(v79);
                v183 = BWStringFromCVPixelFormatType(v182);
                v184 = BWStringFromCGRect(v127, v131, v101, v102);
                v261 = v183;
                v148 = (_DWORD *)MEMORY[0x1E0CA1FC0];
                v260 = v181;
                a3 = v293;
                -[BWLimitedGMErrorLogger logErrorNumber:errorString:](v174, "logErrorNumber:errorString:", v147, objc_msgSend(v175, "stringWithFormat:", CFSTR("%@: %p: %.4lf: %p: rotating sub-image with input %@ rect %@, dest %@ rect %@"), v176, self, *(_QWORD *)&Seconds, rotationSession, v180, v260, v261, v184));
                FigDebugAssert3();
                goto LABEL_254;
              }
LABEL_215:
              if (self->_generatesHistogram)
              {
                rect.origin.x = 0.0;
                v208 = VTSessionCopyProperty(self->_rotationSession, (CFStringRef)*MEMORY[0x1E0CED788], (CFAllocatorRef)*MEMORY[0x1E0C9AE00], &rect);
                v209 = (void *)objc_msgSend(*(id *)&rect.origin.x, "copy");
                v284 = v208;
                if (!v208)
                  CMSetAttachment(type, (CFStringRef)*MEMORY[0x1E0D05DE0], v209, 1u);

              }
              else
              {
                v284 = 0;
              }
              -[BWPixelTransferNode _updateMetadataForOutputSampleBuffer:destinationRect:]((uint64_t)self, type, v127, v131, v101, v102);
              -[BWPixelTransferNode _updateUprightExifOrientationOnSampleBufferIfNeeded:]((uint64_t)self, type);
              -[BWPixelTransferNode _updatePrimaryCaptureRect:forOutputSampleBuffer:]((uint64_t)self, type, v107, v276, v108, v109);
              v210 = self->_liveRotationDegrees;
              if (self->_liveDeviceOrientationCorrectionEnabled && (_DWORD)v210)
              {
                FormatDescription = CMSampleBufferGetFormatDescription(a3);
                Dimensions = CMVideoFormatDescriptionGetDimensions(FormatDescription);
                -[BWPixelTransferNode _updateLiveDeviceOrientationAffectedMetadataForOutputSampleBuffer:inputDims:inputCropRect:]((unsigned int *)self, type, (double)Dimensions.width, (double)Dimensions.height, origin.f64[0], origin.f64[1], v303.width, v303.height);
                v210 = self->_liveRotationDegrees;
              }
              v296 = 0;
              v213 = ptn_rotationDegreesAndMirroringFromLiveConfiguration(v210, self->_liveFlipHorizontal, self->_liveFlipVertical, (char *)&v296);
              v214 = v108;
              v215 = v107;
              if (v280)
              {
                v216 = origin.f64[1];
                v287 = origin.f64[0];
                v218 = v303.height;
                v217 = v303.width;
              }
              else
              {
                v217 = (double)(int)v281;
                v218 = (double)(int)v286;
                v287 = 0.0;
                v216 = 0.0;
              }
              v282 = (double)CVPixelBufferGetWidth(v79);
              v219 = (double)CVPixelBufferGetHeight(v79);
              v328.origin.x = v215;
              v328.origin.y = v276;
              v328.size.width = v214;
              v328.size.height = v109;
              IsNull = CGRectIsNull(v328);
              v221 = 0.0;
              if (IsNull)
              {
                v222 = 0.0;
                v223 = v287;
                v224 = v282;
              }
              else
              {
                v288 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v215, v276, v214, v109, v287, v216, v217);
                v216 = v225;
                v217 = v226;
                v218 = v227;
                v228 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v215, v276, v214, v109, 0.0, 0.0, v282);
                v223 = v288;
                v221 = v228;
                v222 = v229;
                v224 = v230;
                v219 = v231;
              }
              BWUpdateCameraIntrinsicsMatrixOnSampleBuffer(type, (const __CFString *)*MEMORY[0x1E0CA2638], v213, v296, v223, v216, v217, v218, v221, v222, v224, v219);
              if (self->_liveRotationDegrees)
              {
                v232 = (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rotationDegrees);
              }
              else
              {
                if (!v280)
                  goto LABEL_234;
                v232 = CMGetAttachment(sourceBuffera, CFSTR("RotationDegrees"), 0);
              }
              CMSetAttachment(v79, CFSTR("RotationDegrees"), v232, 1u);
LABEL_234:
              if (self->_liveFlipHorizontal)
              {
                CMSetAttachment(v79, CFSTR("MirroredHorizontal"), MEMORY[0x1E0C9AAB0], 1u);
LABEL_243:
                v244 = (const __CFString *)*MEMORY[0x1E0CA8E88];
                v245 = CMGetAttachment(sourceBuffera, (CFStringRef)*MEMORY[0x1E0CA8E88], 0);
                CMSetAttachment(v79, v244, v245, 1u);
                v246 = CMGetAttachment(sourceBuffera, CFSTR("AmbientViewingEnvironmentStrength"), 0);
                if (v246)
                {
                  v247 = (void *)v246;
                  IOSurface = CVPixelBufferGetIOSurface(v79);
                  BWUtilitiesApplyAVEStrength(IOSurface, v247);
                }
                if (self->_doGMLogging && v110[732])
                {
                  *(_DWORD *)&v300[4] = 0;
                  v300[0] = OS_LOG_TYPE_DEFAULT;
                  v249 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  v250 = *(_DWORD *)&v300[4];
                  if (os_log_type_enabled(v249, v300[0]))
                    v251 = v250;
                  else
                    v251 = v250 & 0xFFFFFFFE;
                  if (v251)
                  {
                    v252 = -[BWNode name](self, "name");
                    CMSampleBufferGetPresentationTimeStamp(&v295, type);
                    v253 = CMTimeGetSeconds(&v295);
                    v304 = 136315906;
                    v305 = "-[BWPixelTransferNode renderSampleBuffer:forInput:]";
                    v306 = 2112;
                    v307 = v252;
                    v308 = 2048;
                    v309 = self;
                    v310 = 2048;
                    v311 = v253;
                    LODWORD(v258) = 42;
                    v256 = &v304;
                    _os_log_send_and_compose_impl();
                  }
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                  a3 = v293;
                }
                self->_doGMLogging = 0;
                -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", type, v256, v258);
                v148 = (_DWORD *)MEMORY[0x1E0CA1FC0];
                LODWORD(v147) = v284;
LABEL_254:
                v193 = destinationBuffera;
                if (!destinationBuffera)
                  goto LABEL_256;
                goto LABEL_255;
              }
              if (self->_liveFlipVertical)
              {
                v233 = (CFTypeRef)MEMORY[0x1E0C9AAB0];
                v234 = v79;
              }
              else
              {
                if (!v280)
                  goto LABEL_243;
                v243 = CMGetAttachment(sourceBuffera, CFSTR("MirroredHorizontal"), 0);
                CMSetAttachment(v79, CFSTR("MirroredHorizontal"), v243, 1u);
                v233 = CMGetAttachment(sourceBuffera, CFSTR("MirroredVertical"), 0);
                v234 = v79;
              }
              CMSetAttachment(v234, CFSTR("MirroredVertical"), v233, 1u);
              goto LABEL_243;
            }
            if ((self->_conversionMethodForStillImagesDuringHDRVideo | 2) == 3
              && self->_intermediatePixelBufferForStillHDRToSDRConversion)
            {
              Attributes = (void *)CVPixelBufferGetAttributes();
              v133 = (const __CFString *)*MEMORY[0x1E0CED7E0];
              v269 = *MEMORY[0x1E0CA8EE8];
              objc_msgSend(Attributes, "objectForKeyedSubscript:");
              v262 = v133;
              VTPixelRotationSessionSetProperty();
              v134 = (const __CFString *)*MEMORY[0x1E0CED7C0];
              v264 = *MEMORY[0x1E0CA8D68];
              objc_msgSend(Attributes, "objectForKeyedSubscript:");
              propertyKeyb = v134;
              VTPixelRotationSessionSetProperty();
              v135 = (const __CFString *)*MEMORY[0x1E0CED7D8];
              v263 = *MEMORY[0x1E0CA8E98];
              objc_msgSend(Attributes, "objectForKeyedSubscript:");
              v265 = v135;
              VTPixelRotationSessionSetProperty();
              v136 = VTPixelRotationSessionRotateImage(self->_rotationSession, sourceBuffera, self->_intermediatePixelBufferForStillHDRToSDRConversion);
              v137 = self->_doGMLogging;
              v138 = dword_1ECFE9B70;
              if (self->_doGMLogging)
              {
                v139 = v262;
                if (dword_1ECFE9B70)
                {
                  *(_DWORD *)&v300[4] = 0;
                  v300[0] = OS_LOG_TYPE_DEFAULT;
                  v140 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                  v137 = self->_doGMLogging;
                  v138 = dword_1ECFE9B70;
                  a3 = v293;
                }
              }
              else
              {
                v139 = v262;
              }
              if (v137 && v138)
              {
                *(_DWORD *)&v300[4] = 0;
                v300[0] = OS_LOG_TYPE_DEFAULT;
                v198 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v198, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                v137 = self->_doGMLogging;
                v138 = dword_1ECFE9B70;
                a3 = v293;
              }
              if (v137 && v138)
              {
                *(_DWORD *)&v300[4] = 0;
                v300[0] = OS_LOG_TYPE_DEFAULT;
                v199 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v199, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                a3 = v293;
              }
              -[BWPixelTransferNode _ensureTransferSession]((uint64_t)self);
              v200 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", self->_outputColorSpaceProperties);
              VTSessionSetProperty(self->_transferSession, v139, (CFTypeRef)objc_msgSend(v200, "objectForKeyedSubscript:", v269));
              VTSessionSetProperty(self->_transferSession, propertyKeyb, (CFTypeRef)objc_msgSend(v200, "objectForKeyedSubscript:", v264));
              VTSessionSetProperty(self->_transferSession, v265, (CFTypeRef)objc_msgSend(v200, "objectForKeyedSubscript:", v263));
              VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x1E0CED758], MEMORY[0x1E0C9AAA0]);
              v201 = v136;
              if ((_DWORD)v136)
                goto LABEL_239;
              conversionMethodForStillImagesDuringHDRVideo = self->_conversionMethodForStillImagesDuringHDRVideo;
              v127 = 0.0;
              if (conversionMethodForStillImagesDuringHDRVideo == 3)
              {
                v79 = pixelBuffer;
                -[BWPixelTransferNode _convertUsingHDRProcessing:toSDR:]((uint64_t)self, self->_intermediatePixelBufferForStillHDRToSDRConversion, pixelBuffer);
              }
              else
              {
                v79 = pixelBuffer;
                if (conversionMethodForStillImagesDuringHDRVideo == 1)
                {
                  v149 = VTPixelTransferSessionTransferImage(self->_transferSession, self->_intermediatePixelBufferForStillHDRToSDRConversion, pixelBuffer);
                  v203 = self->_doGMLogging;
                  v110 = &unk_1ECFE9000;
                  v204 = dword_1ECFE9B70;
                  if (self->_doGMLogging && dword_1ECFE9B70)
                  {
                    *(_DWORD *)&v300[4] = 0;
                    v300[0] = OS_LOG_TYPE_DEFAULT;
                    v205 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(v205, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                    v203 = self->_doGMLogging;
                    v204 = dword_1ECFE9B70;
                    a3 = v293;
                  }
                  if (v203 && v204)
                  {
                    *(_DWORD *)&v300[4] = 0;
                    v300[0] = OS_LOG_TYPE_DEFAULT;
                    v206 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                    v203 = self->_doGMLogging;
                    v204 = dword_1ECFE9B70;
                    a3 = v293;
                  }
                  if (!v203 || !v204)
                    goto LABEL_213;
                  goto LABEL_212;
                }
              }
              v131 = 0.0;
              v110 = (_DWORD *)&unk_1ECFE9000;
              goto LABEL_215;
            }
            v149 = VTPixelRotationSessionRotateImage(self->_rotationSession, sourceBuffera, v79);
            v150 = self->_doGMLogging;
            v110 = &unk_1ECFE9000;
            v151 = dword_1ECFE9B70;
            if (self->_doGMLogging && dword_1ECFE9B70)
            {
              *(_DWORD *)&v300[4] = 0;
              v300[0] = OS_LOG_TYPE_DEFAULT;
              v152 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v150 = self->_doGMLogging;
              v151 = dword_1ECFE9B70;
              a3 = v293;
            }
            if (v150 && v151)
            {
              *(_DWORD *)&v300[4] = 0;
              v300[0] = OS_LOG_TYPE_DEFAULT;
              v197 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v197, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v150 = self->_doGMLogging;
              v151 = dword_1ECFE9B70;
              a3 = v293;
            }
            if (!v150 || !v151)
              goto LABEL_213;
LABEL_212:
            *(_DWORD *)&v300[4] = 0;
            v300[0] = OS_LOG_TYPE_DEFAULT;
            v207 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT);
            a3 = v293;
            fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_213:
            v127 = 0.0;
            if (!(_DWORD)v149)
            {
              v131 = 0.0;
              goto LABEL_215;
            }
            v201 = v149;
LABEL_239:
            v285 = (void *)MEMORY[0x1E0CB3940];
            v289 = self->_limitedGMErrorLogger;
            v283 = -[BWNode name](self, "name", v256, v258);
            CMSampleBufferGetPresentationTimeStamp(&v297, a3);
            v235 = CMTimeGetSeconds(&v297);
            v236 = self->_rotationSession;
            v237 = CVPixelBufferGetPixelFormatType(sourceBuffera);
            v238 = BWStringFromCVPixelFormatType(v237);
            v239 = CVPixelBufferGetWidth(sourceBuffera);
            v147 = CVPixelBufferGetHeight(sourceBuffera);
            v79 = pixelBuffer;
            v240 = CVPixelBufferGetPixelFormatType(pixelBuffer);
            v241 = BWStringFromCVPixelFormatType(v240);
            v242 = CVPixelBufferGetWidth(pixelBuffer);
            v259 = v238;
            a3 = v293;
            -[BWLimitedGMErrorLogger logErrorNumber:errorString:](v289, "logErrorNumber:errorString:", v201, objc_msgSend(v285, "stringWithFormat:", CFSTR("%@: %p: %.4lf: %p: rotating scaler rect %@ 0, 0, %lu x %lu, output %@ %lu x %lu, input %p, output %p"), v283, self, *(_QWORD *)&v235, v236, v259, v239, v147, v241, v242, CVPixelBufferGetHeight(pixelBuffer), sourceBuffera, pixelBuffer));
            FigDebugAssert3();
            v148 = (_DWORD *)MEMORY[0x1E0CA1FC0];
            LODWORD(v147) = v201;
            goto LABEL_254;
          }
          FigDebugAssert3();
          LODWORD(v147) = FigSignalErrorAt();
          v148 = (_DWORD *)MEMORY[0x1E0CA1FC0];
        }
        else
        {
          LODWORD(v147) = -12780;
          v148 = (_DWORD *)MEMORY[0x1E0CA1FC0];
          v79 = v68;
        }
LABEL_256:
        if (v79)
          CFRelease(v79);
LABEL_258:
        if (type)
          CFRelease(type);
        if ((_DWORD)v147)
        {
          CMSampleBufferGetPresentationTimeStamp(&v294, a3);
          v254 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494EF98, &v294);
          -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", v254);

        }
        if (*v148 == 1)
          kdebug_trace();
        return;
      }
      *(_DWORD *)&v300[4] = 0;
      v300[0] = OS_LOG_TYPE_DEFAULT;
      v64 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
      v33 = 1;
    }
    else
    {
      if (!self->_doGMLogging || !dword_1ECFE9B70)
        goto LABEL_64;
      *(_DWORD *)&v300[4] = 0;
      v300[0] = OS_LOG_TYPE_DEFAULT;
      v65 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
      v33 = v278;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_64;
  }
}

- (uint64_t)_updateMetadataForOutputSampleBuffer:(CGFloat)a3 destinationRect:(CGFloat)a4
{
  uint64_t v10;
  void *v11;
  int v12;
  CGSize v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  CGFloat v22;
  float v23;
  CGFloat v24;
  float v25;
  CGFloat v26;
  float v27;
  CFDictionaryRef v28;
  CFDictionaryRef DictionaryRepresentation;
  CFTypeRef v30;
  uint64_t v31;
  void *v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  if (result)
  {
    v10 = result;
    result = (uint64_t)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (result)
    {
      v11 = (void *)result;
      v12 = *(_DWORD *)(v10 + 100);
      if (v12)
      {
        if (v12 == 2)
        {
          if (FigCaptureVideoDimensionsAreValid(*(_QWORD *)(v10 + 252)))
          {
            v35.origin.x = a3;
            v35.origin.y = a4;
            v35.size.width = a5;
            v35.size.height = a6;
            DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v35);
            v30 = CFAutorelease(DictionaryRepresentation);
            v31 = *MEMORY[0x1E0D06F48];
            v32 = v11;
            return objc_msgSend(v32, "setObject:forKeyedSubscript:", v30, v31);
          }
        }
        else if (v12 != 1)
        {
          return result;
        }
LABEL_13:
        v31 = *MEMORY[0x1E0D06F48];
        v32 = v11;
        v30 = 0;
        return objc_msgSend(v32, "setObject:forKeyedSubscript:", v30, v31);
      }
      if (*(_BYTE *)(v10 + 168))
        goto LABEL_13;
      if (!*(_DWORD *)(v10 + 180))
      {
        v13 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
        v33.origin = (CGPoint)*MEMORY[0x1E0C9D648];
        v33.size = v13;
        v14 = *MEMORY[0x1E0D06F48];
        result = CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend((id)result, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F48]), &v33);
        if ((_DWORD)result)
        {
          v15 = (void *)objc_msgSend(*(id *)(v10 + 8), "liveFormat");
          v16 = (void *)objc_msgSend(*(id *)(v10 + 16), "liveFormat");
          v17 = (double)(unint64_t)objc_msgSend(v16, "width");
          v18 = v17 / (double)(unint64_t)objc_msgSend(v15, "width");
          v19 = (double)(unint64_t)objc_msgSend(v16, "height");
          v20 = v19 / (double)(unint64_t)objc_msgSend(v15, "height");
          v21 = v18 * v33.origin.x;
          v22 = (double)(int)FigCaptureCeilFloatToMultipleOf(2, v21);
          v23 = v20 * v33.origin.y;
          v24 = (double)(int)FigCaptureCeilFloatToMultipleOf(2, v23);
          v25 = v18 * v33.size.width;
          v26 = (double)(int)FigCaptureFloorFloatToMultipleOf(2, v25);
          v27 = v20 * v33.size.height;
          v34.size.height = (double)(int)FigCaptureFloorFloatToMultipleOf(2, v27);
          v34.origin.x = v22;
          v34.origin.y = v24;
          v34.size.width = v26;
          v28 = CGRectCreateDictionaryRepresentation(v34);
          return objc_msgSend(v11, "setObject:forKeyedSubscript:", CFAutorelease(v28), v14);
        }
      }
    }
  }
  return result;
}

- (void)_updateUprightExifOrientationOnSampleBufferIfNeeded:(uint64_t)a1
{
  int v4;
  int v5;
  BOOL v6;
  int v7;
  int v8;
  _BOOL4 v9;
  int v10;
  const void *v11;
  char v12;
  char v13;

  if (a1)
  {
    v4 = objc_msgSend((id)CMGetAttachment(target, CFSTR("UprightExifOrientation"), 0), "intValue");
    v5 = v4;
    if (*(_DWORD *)(a1 + 180) || *(_BYTE *)(a1 + 185))
    {
      v6 = 0;
      if (v4)
        goto LABEL_5;
    }
    else
    {
      v6 = *(_BYTE *)(a1 + 187) == 0;
      if (v4)
      {
LABEL_5:
        if (!v6)
        {
          v13 = 0;
          v7 = FigCaptureRotationDegreesAndMirroringFromExifOrientation(v4, &v13);
          v12 = 0;
          v8 = ptn_rotationDegreesAndMirroringFromLiveConfiguration(*(unsigned int *)(a1 + 180), *(unsigned __int8 *)(a1 + 185), *(unsigned __int8 *)(a1 + 187), &v12);
          if (v12)
            v9 = v13 == 0;
          else
            v9 = v13 != 0;
          if (v9 && (v8 == 270 || v8 == 90))
            v7 += 180;
          v10 = FigCaptureNormalizeAngle(v7 - v8);
          v11 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", FigCaptureExifOrientationFromRotationDegreesAndMirroring(v10, v9));
          CMSetAttachment(target, CFSTR("UprightExifOrientation"), v11, 1u);
        }
      }
    }
    *(_DWORD *)(a1 + 296) = v5;
  }
}

- (void)_updatePrimaryCaptureRect:(CGFloat)a3 forOutputSampleBuffer:(CGFloat)a4
{
  const __CFString *v11;
  CFDictionaryRef DictionaryRepresentation;
  CGRect v13;
  CGRect v14;

  if (a1)
  {
    v11 = (const __CFString *)*MEMORY[0x1E0D05D10];
    if (CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D10], 0))
    {
      v13.origin.x = a3;
      v13.origin.y = a4;
      v13.size.width = a5;
      v13.size.height = a6;
      if (!CGRectIsNull(v13))
      {
        v14.origin.x = a3;
        v14.origin.y = a4;
        v14.size.width = a5;
        v14.size.height = a6;
        DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v14);
        CMSetAttachment(target, v11, DictionaryRepresentation, 1u);
        if (DictionaryRepresentation)
          CFRelease(DictionaryRepresentation);
      }
    }
  }
}

- (uint64_t)_intermediateBufferDimensionsForInputDimensions:(uint64_t)a3 outputDimensions:
{
  int v3;
  double v4;
  float32x2_t v5;
  float32x2_t v6;
  _BOOL4 v7;
  float v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  int64x2_t v12;
  float64x2_t v18;
  double v20;
  int v21;
  uint64_t v22;
  int64x2_t v24;
  float64x2_t v26;
  double v28;
  int32x2_t v30;

  if (!a1)
  {
    v10 = 0;
    v11 = 0;
    return v11 | v10;
  }
  v3 = *(_DWORD *)(a1 + 180);
  v4 = COERCE_DOUBLE(vrev64_s32((int32x2_t)__PAIR64__(a2, HIDWORD(a2))));
  if (v3 == 270)
    v4 = COERCE_DOUBLE(__PAIR64__(a2, HIDWORD(a2)));
  if (v3 == 90)
    v4 = COERCE_DOUBLE(__PAIR64__(a2, HIDWORD(a2)));
  v5 = vcvt_f32_s32((int32x2_t)vext_s8((int8x8_t)__PAIR64__(a3, HIDWORD(a3)), *(int8x8_t *)&v4, 4uLL));
  v6 = (float32x2_t)vdup_lane_s32((int32x2_t)v5, 1);
  v7 = v3 == 90 || v3 == 270;
  v8 = vdiv_f32(v5, v6).f32[0];
  v9 = (float)SHIDWORD(a3) / (float)SHIDWORD(v4);
  if (v8 > 4.0)
  {
    if (v9 >= 0.25)
      goto LABEL_17;
    goto LABEL_14;
  }
  if (v8 < 0.25 && v9 > 4.0)
  {
LABEL_14:
    FigDebugAssert3();
    goto LABEL_15;
  }
  if (v9 <= 4.0)
  {
    if (v8 < 0.25 || v9 < 0.25)
    {
      v24.i64[0] = SHIDWORD(a2);
      v24.i64[1] = (int)a2;
      __asm { FMOV            V3.2D, #0.25 }
      v26 = vmulq_f64(vcvtq_f64_s64(v24), _Q3);
      __asm { FMOV            V3.2D, #0.5 }
      *(int32x2_t *)&v26.f64[0] = vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vmulq_f64(v26, _Q3))));
      v28 = COERCE_DOUBLE(vadd_s32(*(int32x2_t *)&v26.f64[0], *(int32x2_t *)&v26.f64[0]));
      v24.i64[0] = SHIDWORD(a3);
      v24.i64[1] = (int)a3;
      __asm { FMOV            V4.2D, #4.0 }
      v30 = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vmulq_f64(vmulq_f64(vcvtq_f64_s64(v24), _Q4), _Q3))));
      v20 = COERCE_DOUBLE(vadd_s32(v30, v30));
      if (!_ZF)
        v20 = 0.0;
      if (!*(_DWORD *)(a1 + 100))
        v20 = v28;
      goto LABEL_18;
    }
LABEL_15:
    v10 = 0;
    v11 = 0;
    return v11 | v10;
  }
LABEL_17:
  v12.i64[0] = SHIDWORD(a3);
  v12.i64[1] = (int)a3;
  __asm { FMOV            V1.2D, #0.25 }
  v18 = vmulq_f64(vcvtq_f64_s64(v12), _Q1);
  __asm { FMOV            V1.2D, #0.5 }
  *(int32x2_t *)&v18.f64[0] = vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vmulq_f64(v18, _Q1))));
  v20 = COERCE_DOUBLE(vadd_s32(*(int32x2_t *)&v18.f64[0], *(int32x2_t *)&v18.f64[0]));
LABEL_18:
  if (v7)
    v21 = HIDWORD(v20);
  else
    v21 = LODWORD(v20);
  if (v7)
    LODWORD(v11) = LODWORD(v20);
  else
    LODWORD(v11) = HIDWORD(v20);
  if ((int)v11 <= 16)
    v11 = 16;
  else
    v11 = v11;
  if (v21 <= 16)
    v22 = 16;
  else
    v22 = v21;
  v10 = v22 << 32;
  return v11 | v10;
}

- (CGFloat)_getUpdatedPrimaryCaptureRectForOutputSampleBuffer:(uint64_t)a1 inputDimensions:(CMAttachmentBearerRef)target
{
  CGSize v3;
  const __CFDictionary *v4;
  _BOOL4 v5;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect rect;

  if (a1)
  {
    v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    rect.size = v3;
    v4 = (const __CFDictionary *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D10], 0);
    if (v4 && (*(_DWORD *)(a1 + 176) || *(_BYTE *)(a1 + 184) || *(_BYTE *)(a1 + 186)))
    {
      CGRectMakeWithDictionaryRepresentation(v4, &rect);
      memset(&v8, 0, sizeof(v8));
      if (*(_BYTE *)(a1 + 184))
        v5 = 1;
      else
        v5 = *(_BYTE *)(a1 + 186) != 0;
      FigCaptureMakeMirrorAndRotateVideoTransform(1, 1, v5, *(_DWORD *)(a1 + 176), (uint64_t)&v8);
      v7 = v8;
      rect = CGRectApplyAffineTransform(rect, &v7);
    }
  }
  else
  {
    memset(&rect, 0, sizeof(rect));
  }
  return rect.origin.x;
}

- (uint64_t)_ensureRotationSession
{
  uint64_t v1;
  int *v2;
  int *v3;
  int *v4;
  BOOL v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v7;
  const void *v8;
  const __CFString *v9;
  const void *v10;
  int v11;
  int v12;
  int v13;
  CFTypeRef *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  const void *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  result = *(_QWORD *)(result + 272);
  v2 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
  v3 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
  v4 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
  if (!result)
    goto LABEL_5;
  if (*(_DWORD *)(v1 + 280) != *(_DWORD *)(v1 + 180))
  {
    CFRelease((CFTypeRef)result);
    *(_QWORD *)(v1 + 272) = 0;
LABEL_5:
    objc_msgSend(*(id *)(v1 + 392), "resetCurrentLoggingCounter");
    VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (VTPixelRotationSessionRef *)(v1 + 272));
    *(_BYTE *)(v1 + 400) = 1;
    if (*(_BYTE *)(v1 + 400))
      v5 = dword_1ECFE9B70 == 0;
    else
      v5 = 1;
    if (!v5)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v3 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      v2 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
    }
    v7 = *(void **)(v1 + 392);
    if (*(_QWORD *)(v1 + 272))
      objc_msgSend(v7, "resetCurrentLoggingCounter");
    else
      objc_msgSend(v7, "logErrorNumber:errorString:", 4294954516, CFSTR("failed to create rotation session"));
    *(_DWORD *)(v1 + 280) = *(_DWORD *)(v1 + 180);
    v8 = *(const void **)(v1 + 272);
    if (!v8)
      -[BWPixelTransferNode _ensureRotationSession].cold.1();
    v9 = (const __CFString *)*MEMORY[0x1E0CED7A0];
    v10 = (const void *)FigCaptureVTRotationFromDegrees(*(_DWORD *)(v1 + 180));
    result = VTSessionSetProperty(v8, v9, v10);
    if ((_DWORD)result)
      result = objc_msgSend(*(id *)(v1 + 392), "logErrorNumber:errorString:", 4294954516, CFSTR("failed to set rotation degrees"));
    *(_BYTE *)(v1 + 284) = 0;
    *(_BYTE *)(v1 + 285) = 0;
    *(_BYTE *)(v1 + 286) = 0;
    *(_BYTE *)(v1 + v2[60]) = 0;
    *(_DWORD *)(v1 + v3[61]) = 0;
    v4 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
    *(_BYTE *)(v1 + 288) = 0;
    if (*(_BYTE *)(v1 + 401))
      result = VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E0CED840], MEMORY[0x1E0C9AAB0]);
  }
  v11 = *(unsigned __int8 *)(v1 + 185);
  if (*(unsigned __int8 *)(v1 + 284) != v11)
  {
    result = VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E0CED778], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11 != 0, v21, v22));
    *(_BYTE *)(v1 + 284) = *(_BYTE *)(v1 + 185);
  }
  v12 = *(unsigned __int8 *)(v1 + 187);
  if (*(unsigned __int8 *)(v1 + 285) != v12)
  {
    result = VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E0CED780], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12 != 0, v21, v22));
    *(_BYTE *)(v1 + 285) = *(_BYTE *)(v1 + 187);
  }
  v13 = *(unsigned __int8 *)(v1 + 188);
  if (*(unsigned __int8 *)(v1 + 286) != v13)
  {
    result = VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E0CED7A8], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13 != 0, v21, v22));
    *(_BYTE *)(v1 + 286) = *(_BYTE *)(v1 + 188);
  }
  if (*(unsigned __int8 *)(v1 + v2[60]) != *(unsigned __int8 *)(v1 + 205))
  {
    if (*(_BYTE *)(v1 + 205))
      v14 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
    else
      v14 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
    result = VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E0CED768], *v14);
    *(_BYTE *)(v1 + v2[60]) = *(_BYTE *)(v1 + 205);
  }
  if (*(_DWORD *)(v1 + v3[61]) != *(_DWORD *)(v1 + 240))
  {
    v15 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:");
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8EE8]);
    VTPixelRotationSessionSetProperty();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8D68]);
    VTPixelRotationSessionSetProperty();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8E98]);
    result = VTPixelRotationSessionSetProperty();
    *(_DWORD *)(v1 + v3[61]) = *(_DWORD *)(v1 + 240);
  }
  v16 = *(unsigned __int8 *)(v1 + 355);
  if (*(unsigned __int8 *)(v1 + v4[62]) != v16)
  {
    result = VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E0CED770], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16 != 0, v21, v22));
    *(_BYTE *)(v1 + v4[62]) = *(_BYTE *)(v1 + 355);
  }
  if (*(_DWORD *)(v1 + 356) == 2)
  {
    v17 = (void *)objc_msgSend(*(id *)(v1 + 8), "videoFormat");
    v18 = (void *)objc_msgSend(*(id *)(v1 + 16), "videoFormat");
    if (objc_msgSend(v17, "isHLGColorSpace") && !objc_msgSend(v18, "isHLGColorSpace"))
    {
      v19 = (const void *)MEMORY[0x1E0C9AAB0];
      v20 = (const void *)MEMORY[0x1E0C9AAA0];
    }
    else
    {
      v19 = (const void *)MEMORY[0x1E0C9AAA0];
      v20 = (const void *)MEMORY[0x1E0C9AAB0];
    }
    VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E0CED760], v20);
    return VTSessionSetProperty(*(VTSessionRef *)(v1 + 272), (CFStringRef)*MEMORY[0x1E0CED758], v19);
  }
  return result;
}

- (BOOL)appliesPrimaryCaptureRect
{
  return self->_appliesPrimaryCaptureRect;
}

- (uint64_t)_updateOutputRequirements
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(*(id *)(result + 16), "formatRequirements");
    v3 = (void *)objc_msgSend(*(id *)(v1 + 8), "videoFormat");
    v4 = v3;
    v5 = *(_QWORD *)(v1 + 208);
    if (!v5)
      v5 = objc_msgSend(v3, "width");
    objc_msgSend(v2, "setWidth:", v5);
    v6 = *(_QWORD *)(v1 + 216);
    if (!v6)
      v6 = objc_msgSend(v4, "height");
    objc_msgSend(v2, "setHeight:", v6);
    if (*(_DWORD *)(v1 + 224))
    {
      v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      result = objc_msgSend(v2, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1));
    }
    else
    {
      objc_msgSend(v2, "setSupportedPixelFormats:", -[BWPixelTransferNode _supportedOutputPixelFormats](v1));
      result = objc_msgSend(v2, "setPreferredPixelFormats:", *(_QWORD *)(v1 + 232));
    }
    if (*(_DWORD *)(v1 + 240))
    {
      v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v7 = &v9;
    }
    else
    {
      if (!v4)
        return result;
      v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "colorSpaceProperties"));
      v7 = &v8;
    }
    return objc_msgSend(v2, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1, v8, v9));
  }
  return result;
}

- (uint64_t)_supportedOutputPixelFormats
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char IsFullRange;
  char IsTenBit;
  char v7;
  _QWORD v9[5];
  char v10;
  char v11;
  char v12;
  char v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = ptn_supportedPixelFormats(*(_DWORD *)(a1 + 260));
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelFormat");
  if ((_DWORD)v3)
  {
    v4 = v3;
    if (FigCapturePixelFormatIsDepthData(v3))
    {
      v14[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
      return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    }
    else
    {
      IsFullRange = FigCapturePixelFormatIsFullRange(v4);
      IsTenBit = FigCapturePixelFormatIsTenBit(v4);
      v7 = FigCapturePixelFormatIs422(v4);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __51__BWPixelTransferNode__supportedOutputPixelFormats__block_invoke;
      v9[3] = &unk_1E491F018;
      v9[4] = a1;
      v10 = IsTenBit & (IsFullRange ^ 1);
      v11 = IsFullRange;
      v12 = IsTenBit;
      v13 = v7;
      objc_msgSend(v2, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v9));
    }
  }
  return (uint64_t)v2;
}

- (id)nodeType
{
  return CFSTR("Converter");
}

- (void)setMaxOutputLossyCompressionLevel:(int)a3
{
  if (self->_maxOutputLossyCompressionLevel != a3)
  {
    self->_maxOutputLossyCompressionLevel = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setRotationDegrees:(int)a3
{
  self->_rotationDegrees = a3;
}

- (void)setFlipVertical:(BOOL)a3
{
  self->_flipVertical = a3;
}

- (void)setFlipHorizontal:(BOOL)a3
{
  self->_flipHorizontal = a3;
}

- (void)setDeviceOrientationCorrectionEnabled:(BOOL)a3
{
  self->_deviceOrientationCorrectionEnabled = a3;
}

- (BOOL)_zeroFillBuffers
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    return (objc_msgSend((id)objc_msgSend(*(id *)(result + 16), "videoFormat"), "prewireBuffers") & 1) == 0
        && FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(v1 + 16), "videoFormat"), "pixelFormat")) == 0;
  }
  return result;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[BWPixelTransferNode setMaxInputLossyCompressionLevel:](self, "setMaxInputLossyCompressionLevel:");
  -[BWPixelTransferNode setMaxOutputLossyCompressionLevel:](self, "setMaxOutputLossyCompressionLevel:", v3);
}

- (void)setMaxInputLossyCompressionLevel:(int)a3
{
  if (self->_maxInputLossyCompressionLevel != a3)
  {
    self->_maxInputLossyCompressionLevel = a3;
    -[BWPixelTransferNode _updateInputRequirements]((uint64_t)self);
  }
}

- (uint64_t)_updateInputRequirements
{
  if (result)
    return objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "formatRequirements"), "setSupportedPixelFormats:", ptn_supportedPixelFormats(*(_DWORD *)(result + 264)));
  return result;
}

- (BWPixelTransferNode)initWithfractionalSourceRectEnabled:(BOOL)a3
{
  BWPixelTransferNode *v4;
  BWNodeInput *v5;
  BWVideoFormatRequirements *v6;
  BWNodeOutput *v7;
  BWVideoFormatRequirements *v8;
  BWLimitedGMErrorLogger *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BWPixelTransferNode;
  v4 = -[BWNode init](&v11, sel_init);
  if (v4)
  {
    v5 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v4);
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v5, "setFormatRequirements:", v6);

    -[BWNode addInput:](v4, "addInput:", v5);
    -[BWFormatRequirements setSupportedPixelFormats:](-[BWNodeInput formatRequirements](v4->super._input, "formatRequirements"), "setSupportedPixelFormats:", ptn_supportedPixelFormats(v4->_maxInputLossyCompressionLevel));
    v7 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v4);
    v8 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedCacheModes:](v8, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedDisplayAccess](BWVideoFormatRequirements, "cacheModesForOptimizedDisplayAccess"));
    -[BWVideoFormatRequirements setPrewireBuffers:](v8, "setPrewireBuffers:", 0);
    -[BWNodeOutput setFormatRequirements:](v7, "setFormatRequirements:", v8);
    -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v7, "setIndexOfInputWhichDrivesThisOutput:", 0);

    -[BWNode addOutput:](v4, "addOutput:", v7);
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)v4);
    -[BWNode setSupportsLiveReconfiguration:](v4, "setSupportsLiveReconfiguration:", 1);
    v9 = [BWLimitedGMErrorLogger alloc];
    v4->_limitedGMErrorLogger = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:](v9, "initWithName:maxLoggingCount:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PixelTransfer %p"), v4), 10);
    v4->_fractionalSourceRectEnabled = a3;
  }
  return v4;
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (self->_emitSampleBufferSemaphore)
  {
    v7[0] = self->_emitSampleBufferSemaphore;
    v5 = +[BWDroppedSample newDroppedSampleFromDroppedSample:backPressureSemaphoresToIgnore:](BWDroppedSample, "newDroppedSampleFromDroppedSample:backPressureSemaphoresToIgnore:", a3, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
  }
  else
  {
    v5 = a3;
  }
  v6 = v5;
  -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", v5);

}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v10;

  if (a4)
  {
    outputFormatDescription = self->_outputFormatDescription;
    if (outputFormatDescription)
    {
      CFRelease(outputFormatDescription);
      self->_outputFormatDescription = 0;
    }
  }
  -[BWPixelTransferNode _makeCurrentConfigurationLive]((uint64_t)self);
  v10.receiver = self;
  v10.super_class = (Class)BWPixelTransferNode;
  -[BWNode configurationWithID:updatedFormat:didBecomeLiveForInput:](&v10, sel_configurationWithID_updatedFormat_didBecomeLiveForInput_, a3, a4, a5);
}

- (uint64_t)_makeCurrentConfigurationLive
{
  uint64_t v1;
  __int128 v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result)
  {
    v1 = result;
    *(_DWORD *)(result + 100) = *(_DWORD *)(result + 96);
    *(_BYTE *)(result + 168) = !CGRectEqualToRect(*(CGRect *)(result + 104), *MEMORY[0x1E0C9D648]);
    v2 = *(_OWORD *)(v1 + 120);
    *(_OWORD *)(v1 + 136) = *(_OWORD *)(v1 + 104);
    *(_OWORD *)(v1 + 152) = v2;
    *(_BYTE *)(v1 + 170) = *(_BYTE *)(v1 + 169);
    *(_BYTE *)(v1 + 207) = *(_BYTE *)(v1 + 206);
    *(_QWORD *)(v1 + 252) = *(_QWORD *)(v1 + 244);
    *(_BYTE *)(v1 + 172) = *(_BYTE *)(v1 + 171);
    *(_DWORD *)(v1 + 180) = *(_DWORD *)(v1 + 176);
    *(_BYTE *)(v1 + 185) = *(_BYTE *)(v1 + 184);
    *(_BYTE *)(v1 + 187) = *(_BYTE *)(v1 + 186);
    result = -[BWPixelTransferNode _zeroFillBuffers](v1);
    *(_BYTE *)(v1 + 188) = result;
    *(_BYTE *)(v1 + 190) = *(_BYTE *)(v1 + 189);
    *(_BYTE *)(v1 + 205) = *(_BYTE *)(v1 + 204);
    *(_BYTE *)(v1 + 353) = *(_BYTE *)(v1 + 352);
    if (*(_BYTE *)(v1 + 168))
    {
      if (*(_BYTE *)(v1 + 400))
      {
        if (dword_1ECFE9B70)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          return fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPixelTransferNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  -[BWPixelTransferNode _ensureIntermediatePixelBufferForStillHDRToSDRConversionIfNeeded]((uint64_t)self);
}

- (void)_ensureIntermediatePixelBufferForStillHDRToSDRConversionIfNeeded
{
  void *v2;
  uint64_t v3;
  void *v4;
  const void *v5;
  __CVBuffer *v6;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  const void *v9;
  const __CFDictionary *v10;
  void *v11;
  const __CFAllocator *v12;
  size_t v13;
  size_t v14;
  OSType v15;
  const void *v16;
  objc_class *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;

  if (a1)
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 8), "videoFormat");
    v3 = objc_msgSend(*(id *)(a1 + 16), "videoFormat");
    if ((*(_DWORD *)(a1 + 356) | 2) == 3
      && (v4 = (void *)v3, objc_msgSend(v2, "isHLGColorSpace"))
      && (objc_msgSend(v4, "isHLGColorSpace") & 1) == 0
      && (FigCapturePixelFormatIsTenBit(objc_msgSend(v4, "pixelFormat")) & 1) == 0)
    {
      v6 = *(__CVBuffer **)(a1 + 368);
      if (!v6
        || (WidthOfPlane = CVPixelBufferGetWidthOfPlane(v6, 0), WidthOfPlane != objc_msgSend(v4, "width"))
        || (HeightOfPlane = CVPixelBufferGetHeightOfPlane(*(CVPixelBufferRef *)(a1 + 368), 0),
            HeightOfPlane != objc_msgSend(v4, "height")))
      {
        v9 = *(const void **)(a1 + 368);
        if (v9)
        {
          CFRelease(v9);
          *(_QWORD *)(a1 + 368) = 0;
        }
        v10 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", objc_msgSend(v2, "colorSpaceProperties"));
        v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], *MEMORY[0x1E0CA8FF0]);
        if (FigCapturePlatformIOSurfaceWiringAssertionEnabled())
          objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CA9000]);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CA8C68]);
        v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v13 = objc_msgSend(v4, "width");
        v14 = objc_msgSend(v4, "height");
        if ((FigCapturePixelFormatIsTenBit(objc_msgSend(v2, "pixelFormat")) & 1) != 0)
          v15 = 2016686640;
        else
          v15 = objc_msgSend(v4, "pixelFormat");
        if (!CVPixelBufferCreate(v12, v13, v14, v15, (CFDictionaryRef)v11, (CVPixelBufferRef *)(a1 + 368)))
        {
          CVBufferSetAttachments(*(CVBufferRef *)(a1 + 368), v10, kCVAttachmentMode_ShouldPropagate);
          if (*(_DWORD *)(a1 + 356) == 3)
          {

            *(_QWORD *)(a1 + 376) = 0;
            v16 = *(const void **)(a1 + 384);
            if (v16)
            {
              CFRelease(v16);
              *(_QWORD *)(a1 + 384) = 0;
            }
            v21 = 0u;
            v20 = 0u;
            HIDWORD(v21) = 1;
            LODWORD(v19) = objc_msgSend(v4, "width");
            HIDWORD(v19) = objc_msgSend(v4, "height", v19);
            DWORD1(v20) = 100;
            DWORD2(v20) = objc_msgSend(v4, "pixelFormat");
            *(_QWORD *)&v21 = *MEMORY[0x1E0CA8D98];
            v23 = 0;
            v24 = &v23;
            v25 = 0x3052000000;
            v26 = __Block_byref_object_copy__3;
            v27 = __Block_byref_object_dispose__3;
            v17 = (objc_class *)getHDRProcessorClass_softClass;
            v28 = getHDRProcessorClass_softClass;
            if (!getHDRProcessorClass_softClass)
            {
              v22[0] = MEMORY[0x1E0C809B0];
              v22[1] = 3221225472;
              v22[2] = __getHDRProcessorClass_block_invoke;
              v22[3] = &unk_1E491EC40;
              v22[4] = &v23;
              __getHDRProcessorClass_block_invoke((uint64_t)v22);
              v17 = (objc_class *)v24[5];
            }
            _Block_object_dispose(&v23, 8);
            v18 = objc_msgSend([v17 alloc], "initWithConfig:", &v19);
            *(_QWORD *)(a1 + 376) = v18;
            if (v18)
              IOSurfaceAcceleratorCreate();
          }
        }
      }
    }
    else
    {
      v5 = *(const void **)(a1 + 368);
      if (v5)
      {
        CFRelease(v5);
        *(_QWORD *)(a1 + 368) = 0;
      }
    }
  }
}

- (uint64_t)_updatePassthroughModes
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    if (*(_DWORD *)(result + 96) == 3)
    {
      v2 = *(void **)(result + 8);
      v3 = 1;
      v4 = 1;
    }
    else
    {
      v2 = *(void **)(result + 8);
      if (!*(_BYTE *)(v1 + 169))
      {
        objc_msgSend(v2, "setPassthroughMode:", 0);
        v3 = 0;
        goto LABEL_7;
      }
      v3 = 2;
      v4 = 2;
    }
    objc_msgSend(v2, "setPassthroughMode:", v4);
LABEL_7:
    objc_msgSend(*(id *)(v1 + 16), "setPassthroughMode:", v3);
    return objc_msgSend(*(id *)(v1 + 8), "setConversionToPassthroughModeNeverAllowed:", objc_msgSend(*(id *)(v1 + 8), "passthroughMode") != 0);
  }
  return result;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  if (objc_msgSend(a4, "passthroughMode", a3))
  {
    -[BWNodeOutput setFormat:](self->super._output, "setFormat:", objc_msgSend(a4, "format"));
    if (objc_msgSend(a4, "passthroughMode") == 1)
      -[BWNode setName:](self, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Passthrough %@"), -[BWNode name](self, "name")));
  }
  else
  {
    self->_passesBuffersThroughWhenPossible = 0;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setCropMode:(int)a3
{
  if (self->_cropMode != a3)
  {
    self->_cropMode = a3;
    -[BWPixelTransferNode _updatePassthroughModes]((uint64_t)self);
  }
}

- (void)setOutputColorSpaceProperties:(int)a3
{
  if (self->_outputColorSpaceProperties != a3)
  {
    self->_outputColorSpaceProperties = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setPreferredOutputPixelFormats:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToArray:", self->_preferredOutputPixelFormats) & 1) == 0)
  {

    self->_preferredOutputPixelFormats = (NSArray *)objc_msgSend(a3, "copy");
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setPassesBuffersThroughWhenPossible:(BOOL)a3
{
  if (self->_passesBuffersThroughWhenPossible != a3)
  {
    self->_passesBuffersThroughWhenPossible = a3;
    -[BWPixelTransferNode _updatePassthroughModes]((uint64_t)self);
  }
}

- (void)setGeneratesHistogram:(BOOL)a3
{
  self->_generatesHistogram = a3;
}

- (void)setAllows422To420Conversion:(BOOL)a3
{
  if (self->_allows422To420Conversion != a3)
  {
    self->_allows422To420Conversion = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (int)rotationDegrees
{
  return self->_rotationDegrees;
}

- (BOOL)flipVertical
{
  return self->_flipVertical;
}

- (BOOL)flipHorizontal
{
  return self->_flipHorizontal;
}

- (BWPixelTransferNode)init
{
  return -[BWPixelTransferNode initWithfractionalSourceRectEnabled:](self, "initWithfractionalSourceRectEnabled:", 0);
}

- (void)setOutputWidth:(unint64_t)a3
{
  if (self->_outputWidth != a3)
  {
    self->_outputWidth = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setOutputHeight:(unint64_t)a3
{
  if (self->_outputHeight != a3)
  {
    self->_outputHeight = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setInputCropRect:(CGRect)a3
{
  self->_inputCropRect = a3;
}

- (void)setAppliesPrimaryCaptureRect:(BOOL)a3
{
  self->_appliesPrimaryCaptureRect = a3;
}

- (unint64_t)outputWidth
{
  return self->_outputWidth;
}

- (unint64_t)outputHeight
{
  return self->_outputHeight;
}

- (void)setConverting10BitVideoRangeTo8BitFullRangeEncouraged:(BOOL)a3
{
  self->_isConverting10BitVideoRangeTo8BitFullRangeEncouraged = a3;
}

- (void)setConversionMethodForStillImagesDuringHDRVideos:(int)a3
{
  if (a3 == 2 && self->_fractionalSourceRectEnabled)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Internal inconsistency, conversionMethodForStillImagesDuringHDRVideos(%d) can not be set when fractional rects is enabled"), 2), 0));
  if (self->_conversionMethodForStillImagesDuringHDRVideo != a3)
  {
    self->_conversionMethodForStillImagesDuringHDRVideo = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  if (self->_outputPixelFormat != a3)
  {
    self->_outputPixelFormat = a3;
    -[BWPixelTransferNode _updateOutputRequirements]((uint64_t)self);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  OpaqueVTPixelRotationSession *rotationSession;
  OpaqueVTPixelTransferSession *transferSession;
  __CVBuffer *intermediatePixelBufferForStillHDRToSDRConversion;
  __IOSurfaceAccelerator *msrScalerForHDRProcessing;
  objc_super v8;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  rotationSession = self->_rotationSession;
  if (rotationSession)
    CFRelease(rotationSession);
  transferSession = self->_transferSession;
  if (transferSession)
    CFRelease(transferSession);

  intermediatePixelBufferForStillHDRToSDRConversion = self->_intermediatePixelBufferForStillHDRToSDRConversion;
  if (intermediatePixelBufferForStillHDRToSDRConversion)
    CFRelease(intermediatePixelBufferForStillHDRToSDRConversion);
  msrScalerForHDRProcessing = self->_msrScalerForHDRProcessing;
  if (msrScalerForHDRProcessing)
    CFRelease(msrScalerForHDRProcessing);

  v8.receiver = self;
  v8.super_class = (Class)BWPixelTransferNode;
  -[BWNode dealloc](&v8, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("VideoConverter");
}

- (void)makeCurrentConfigurationLive
{
  self->_makeCurrentConfigurationLiveOnNextRenderCallback = 1;
  FigMemoryBarrier();
}

- (BOOL)hasNonLiveConfigurationChanges
{
  int v3;
  int cropMode;
  int liveCropMode;
  int v6;
  BOOL v7;
  char v8;
  char v9;
  BOOL v10;
  char v12;
  BOOL v13;

  v3 = -[BWFormat isEqual:](-[BWNodeOutput liveFormat](self->super._output, "liveFormat"), "isEqual:", -[BWNodeOutput format](self->super._output, "format"));
  cropMode = self->_cropMode;
  liveCropMode = self->_liveCropMode;
  v6 = v3 & CGRectEqualToRect(self->_inputCropRect, self->_liveInputCropRect) ^ 1;
  if (cropMode != liveCropMode)
    LOBYTE(v6) = 1;
  if (self->_passesBuffersThroughWhenPossible != self->_livePassesBuffersThroughWhenPossible)
    LOBYTE(v6) = 1;
  v7 = self->_validOutputDimensions.width != self->_liveValidOutputDimensions.width
    || self->_validOutputDimensions.height != self->_liveValidOutputDimensions.height;
  v8 = v7 | v6;
  if (self->_appliesUprightExifOrientationTransformToInput == self->_liveAppliesUprightExifOrientationTransformToInput)
    v9 = v8;
  else
    v9 = 1;
  if (!self->_appliesUprightExifOrientationTransformToInput)
  {
    v10 = self->_rotationDegrees == self->_liveRotationDegrees && self->_flipHorizontal == self->_liveFlipHorizontal;
    if (!v10 || self->_flipVertical != self->_liveFlipVertical)
      v9 = 1;
  }
  if (self->_liveZeroFillBuffers == -[BWPixelTransferNode _zeroFillBuffers]((_BOOL8)self))
    v12 = v9;
  else
    v12 = 1;
  if (self->_lowSpeed == self->_liveLowSpeed)
    v13 = v12;
  else
    v13 = 1;
  return self->_expectsMarkerBuffers != self->_liveExpectsMarkerBuffers || v13;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  opaqueCMFormatDescription *outputFormatDescription;
  OpaqueVTPixelRotationSession *rotationSession;
  OpaqueVTPixelTransferSession *transferSession;
  objc_super v8;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
  {
    CFRelease(outputFormatDescription);
    self->_outputFormatDescription = 0;
  }
  rotationSession = self->_rotationSession;
  if (rotationSession)
  {
    CFRelease(rotationSession);
    self->_rotationSession = 0;
  }
  transferSession = self->_transferSession;
  if (transferSession)
  {
    CFRelease(transferSession);
    self->_transferSession = 0;
  }

  self->_intermediateBufferPool = 0;
  -[BWDeviceOrientationMonitor stop](self->_deviceOrientationMonitor, "stop");

  self->_deviceOrientationMonitor = 0;
  v8.receiver = self;
  v8.super_class = (Class)BWPixelTransferNode;
  -[BWNode didReachEndOfDataForInput:](&v8, sel_didReachEndOfDataForInput_, a3);
}

- (uint64_t)_emitIfMarkerBuffer:(uint64_t)result
{
  uint64_t v3;
  CFTypeRef v4;
  CFTypeRef v5;
  CFTypeRef v6;
  BOOL v7;

  if (result)
  {
    v3 = result;
    v4 = CMGetAttachment(target, CFSTR("RecordingSettings"), 0);
    v5 = CMGetAttachment(target, CFSTR("FileWriterAction"), 0);
    v6 = CMGetAttachment(target, CFSTR("IrisMovieRequest"), 0);
    if (v4)
      v7 = 0;
    else
      v7 = v5 == 0;
    if (v7 && v6 == 0)
    {
      return 0;
    }
    else
    {
      objc_msgSend(*(id *)(v3 + 16), "emitSampleBuffer:", target);
      return 1;
    }
  }
  return result;
}

- (uint64_t)_ensureDeviceOrientationMonitor
{
  uint64_t v1;
  BWDeviceOrientationMonitor *v2;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 190))
    {
      if (!*(_QWORD *)(result + 192))
      {
        v2 = objc_alloc_init(BWDeviceOrientationMonitor);
        *(_QWORD *)(v1 + 192) = v2;
        result = -[BWDeviceOrientationMonitor start](v2, "start");
        *(_DWORD *)(v1 + 200) = -1;
      }
    }
  }
  return result;
}

- (uint64_t)_updateLiveRotationAndFlipsToApplyUprightExifOrientation:(uint64_t)result
{
  uint64_t v2;
  _BOOL4 v3;
  _BOOL4 v4;
  int v5;
  int v6;
  char v7;

  if (result)
  {
    v2 = result;
    v7 = 0;
    if (a2)
      result = FigCaptureRotationDegreesAndMirroringFromExifOrientation(a2, &v7);
    else
      result = 0;
    if ((_DWORD)result != *(_DWORD *)(v2 + 180))
      *(_DWORD *)(v2 + 180) = result;
    v3 = result != 270;
    v4 = result == 270;
    if ((_DWORD)result == 90)
    {
      v3 = 0;
      v4 = 1;
    }
    if (v7)
      v5 = v3;
    else
      v5 = 0;
    if (v7)
      v6 = v4;
    else
      v6 = 0;
    if (*(unsigned __int8 *)(v2 + 185) != v5 || *(unsigned __int8 *)(v2 + 187) != v6)
    {
      *(_BYTE *)(v2 + 185) = v5;
      *(_BYTE *)(v2 + 187) = v6;
    }
  }
  return result;
}

- (uint64_t)_ensureIntermediatePoolWithDimensions:(uint64_t)a1
{
  unint64_t v4;
  BWVideoFormatRequirements *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *context;
  BWVideoFormatRequirements *v14;
  _QWORD v15[4];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = HIDWORD(a2);
    if (*(_QWORD *)(a1 + 320) != a2)
    {
      context = (void *)MEMORY[0x1A858DD40]();
      v5 = objc_alloc_init(BWVideoFormatRequirements);
      v6 = (void *)objc_msgSend(*(id *)(a1 + 8), "liveFormat");
      v7 = (__CFString *)objc_msgSend((id)a1, "name");
      if (!v7)
        v7 = CFSTR("PixelTransfer");
      v8 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR(" Intermediate"));
      -[BWVideoFormatRequirements setWidth:](v5, "setWidth:", (int)a2);
      -[BWVideoFormatRequirements setHeight:](v5, "setHeight:", a2 >> 32);
      v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v6, "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v5, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1));
      v14 = v5;
      v9 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1));
      if (v9)
      {
        v10 = v9;
        if (*(_BYTE *)(a1 + 400) && dword_1ECFE9B70)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }

        *(_QWORD *)(a1 + 312) = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v10, 1, v8, objc_msgSend(*(id *)(a1 + 16), "memoryPool"));
        *(_DWORD *)(a1 + 320) = a2;
        *(_DWORD *)(a1 + 324) = v4;
      }
      else
      {
        FigDebugAssert3();
      }
      objc_autoreleasePoolPop(context);
    }
  }
  return 0;
}

- (uint64_t)_ensureTransferSession
{
  uint64_t v1;
  BOOL v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;

  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 304))
    {
      VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (VTPixelTransferSessionRef *)(result + 304));
      *(_BYTE *)(v1 + 400) = 1;
      if (*(_BYTE *)(v1 + 400))
        v2 = dword_1ECFE9B70 == 0;
      else
        v2 = 1;
      if (!v2)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v4 = *(void **)(v1 + 392);
      if (*(_QWORD *)(v1 + 304))
        result = objc_msgSend(v4, "resetCurrentLoggingCounter");
      else
        result = objc_msgSend(v4, "logErrorNumber:errorString:", 4294954516, CFSTR("failed to create transfer session"));
      if (!*(_QWORD *)(v1 + 304))
        -[BWPixelTransferNode _ensureTransferSession].cold.1();
    }
  }
  return result;
}

- (uint64_t)_convertUsingHDRProcessing:(__CVBuffer *)a3 toSDR:
{
  uint64_t v3;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  IOSurfaceRef IOSurface;
  IOSurfaceRef v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[3];
  _QWORD v42[6];

  v42[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (*(_QWORD *)(result + 376) && *(_QWORD *)(result + 384))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99D50]);
      v7 = (void *)MEMORY[0x1E0C99E08];
      v36 = 0;
      v37 = &v36;
      v38 = 0x2020000000;
      v8 = (_QWORD *)getkHDRProcessingDolbyVisionRPUDataKeySymbolLoc_ptr;
      v39 = getkHDRProcessingDolbyVisionRPUDataKeySymbolLoc_ptr;
      if (!getkHDRProcessingDolbyVisionRPUDataKeySymbolLoc_ptr)
      {
        v9 = (void *)HDRProcessingLibrary();
        v8 = dlsym(v9, "kHDRProcessingDolbyVisionRPUDataKey");
        v37[3] = (uint64_t)v8;
        getkHDRProcessingDolbyVisionRPUDataKeySymbolLoc_ptr = (uint64_t)v8;
      }
      _Block_object_dispose(&v36, 8);
      if (!v8)
        -[BWPixelTransferNode _convertUsingHDRProcessing:toSDR:].cold.1();
      v10 = objc_msgSend(v7, "dictionaryWithObject:forKey:", v6, *v8);
      IOSurface = CVPixelBufferGetIOSurface(a2);
      if (!IOSurface)
        return FigSignalErrorAt();
      v12 = CVPixelBufferGetIOSurface(a3);
      if (!v12)
        return FigSignalErrorAt();
      v35 = 0;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v28 = 0u;
      WORD5(v31) = 3073;
      BYTE12(v31) = 18;
      if (IOSurfaceSetBulkAttachments2())
        return FigSignalErrorAt();
      v27 = 0;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v20 = 0u;
      WORD5(v23) = 3073;
      BYTE12(v23) = 1;
      if (IOSurfaceSetBulkAttachments2())
      {
        return FigSignalErrorAt();
      }
      else
      {
        v19 = 0;
        if (objc_msgSend(*(id *)(v3 + 376), "generateMSRColorConfigWithOperation:inputSurface:outputSurface:metadata:histogram:config:", 4, IOSurface, v12, v10, 0, &v19) != -17000)goto LABEL_17;
        v13 = malloc_type_malloc(0x28uLL, 0x10000407607B2BCuLL);
        *(_DWORD *)v13 = 3;
        v13[1] = objc_msgSend(v19, "bytes");
        *((_DWORD *)v13 + 4) = objc_msgSend(v19, "length");
        *(_QWORD *)((char *)v13 + 28) = 0;
        *(_QWORD *)((char *)v13 + 20) = 0;
        v14 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v13, 40, 1);
        v15 = *MEMORY[0x1E0D3A210];
        v40 = v14;
        v41[0] = v15;
        v16 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v17 = *MEMORY[0x1E0D3A250];
        v42[0] = v16;
        v42[1] = MEMORY[0x1E0C9AAB0];
        v18 = *MEMORY[0x1E0D3A328];
        v41[1] = v17;
        v41[2] = v18;
        v42[2] = MEMORY[0x1E0C9AAA0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
        result = IOSurfaceAcceleratorTransformSurface();
        if ((_DWORD)result)
        {
LABEL_17:
          FigDebugAssert3();
          return 4294954514;
        }
      }
    }
    else
    {
      return FigSignalErrorAt();
    }
  }
  return result;
}

- (unsigned)_updateLiveDeviceOrientationAffectedMetadataForOutputSampleBuffer:(double)a3 inputDims:(double)a4 inputCropRect:(double)a5
{
  unsigned int *v8;
  unsigned int *v9;
  uint64_t v10;
  int v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFDictionary *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  const __CFDictionary *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  const __CFDictionary *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  int v43;
  int v44;
  void *v45;
  unsigned int *v46;
  id obj;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  int v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  id v59;
  double v60;
  double v61;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  CGRect rect;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  int v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  unsigned __int8 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v8 = result;
    result = (unsigned int *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (result)
    {
      v9 = result;
      v10 = *MEMORY[0x1E0D069A0];
      v49 = (void *)objc_msgSend(result, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
      result = (unsigned int *)objc_msgSend(v49, "count");
      if (result)
      {
        v84 = 0;
        result = (unsigned int *)ptn_rotationDegreesAndMirroringFromLiveConfiguration(v8[45], *((unsigned __int8 *)v8 + 185), *((unsigned __int8 *)v8 + 187), (char *)&v84);
        if (result | v84)
        {
          v11 = (int)result;
          v46 = v9;
          v12 = round(a3) != round(a7);
          v13 = round(a4) != round(a8) || v12;
          v82 = 0u;
          v83 = 0u;
          v81 = 0u;
          FigCaptureMakeMirrorAndRotateVideoTransform(1, 1, v84 != 0, (int)result, (uint64_t)&v81);
          v80 = 0;
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          obj = (id)objc_msgSend(v49, "allKeys");
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
          if (v50)
          {
            v55 = v11;
            v14 = 0;
            v48 = *(_QWORD *)v77;
            v53 = *MEMORY[0x1E0D064D0];
            v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
            v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
            v17 = *MEMORY[0x1E0D06D58];
            v56 = *MEMORY[0x1E0D06D68];
            v57 = v16;
            v61 = v15;
            do
            {
              for (i = 0; i != v50; ++i)
              {
                v54 = v14;
                if (*(_QWORD *)v77 != v48)
                  objc_enumerationMutation(obj);
                v52 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i);
                v51 = (void *)objc_msgSend(v49, "objectForKeyedSubscript:");
                v19 = (void *)objc_msgSend(v51, "objectForKeyedSubscript:", v53);
                v72 = 0u;
                v73 = 0u;
                v74 = 0u;
                v75 = 0u;
                v59 = v19;
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
                if (v20)
                {
                  v21 = v20;
                  v22 = 0;
                  v23 = *(_QWORD *)v73;
                  do
                  {
                    v24 = 0;
                    v58 = v21;
                    do
                    {
                      if (*(_QWORD *)v73 != v23)
                        objc_enumerationMutation(v59);
                      v25 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v24);
                      memset(&rect, 0, sizeof(rect));
                      v26 = (const __CFDictionary *)objc_msgSend(v25, "objectForKeyedSubscript:", v17);
                      v27 = v15;
                      v28 = v16;
                      if (v26)
                      {
                        CGRectMakeWithDictionaryRepresentation(v26, &rect);
                        v68 = v81;
                        v69 = v82;
                        v70 = v83;
                        ptn_rotateRect(v13, &v68, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, a3, a4, a6, v29, a5, a6, a7, a8);
                        v28 = v30;
                        v27 = v31;
                      }
                      if (v28 > 0.0 && v27 > 0.0)
                      {
                        v32 = (const __CFDictionary *)objc_msgSend(v25, "objectForKeyedSubscript:", v17);
                        v33 = v16;
                        v34 = v15;
                        if (v32)
                        {
                          CGRectMakeWithDictionaryRepresentation(v32, &rect);
                          v68 = v81;
                          v69 = v82;
                          v70 = v83;
                          ptn_rotateRect(v13, &v68, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, a3, a4, a6, v35, a5, a6, a7, a8);
                          v33 = v36;
                        }
                        v60 = v34;
                        v37 = (const __CFDictionary *)objc_msgSend(v25, "objectForKeyedSubscript:", v56);
                        v38 = v61;
                        if (v37)
                        {
                          CGRectMakeWithDictionaryRepresentation(v37, &rect);
                          v68 = v81;
                          v69 = v82;
                          v70 = v83;
                          ptn_rotateRect(v13, &v68, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, a3, a4, a6, v39, a5, a6, a7, a8);
                          v16 = v40;
                          v38 = v41;
                        }
                        v42 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v25);
                        FigCFDictionarySetCGRect();
                        if (v33 > 0.0 && v60 > 0.0)
                          FigCFDictionarySetCGRect();
                        if (v16 > 0.0 && v38 > 0.0)
                          FigCFDictionarySetCGRect();
                        if (FigCFDictionaryGetInt32IfPresent())
                        {
                          v43 = v80;
                          if (v84)
                            v43 = -v80;
                          FigCaptureNormalizeAngle(v43 + v55);
                          FigCFDictionarySetInt32();
                        }
                        v16 = v57;
                        v15 = v61;
                        if (FigCFDictionaryGetInt32IfPresent())
                        {
                          if (v84)
                            v44 = -v80;
                          else
                            v44 = v80;
                          FigCaptureNormalizeAngle(v44);
                          FigCFDictionarySetInt32();
                        }
                        if (FigCFDictionaryGetInt32IfPresent())
                        {
                          FigCaptureNormalizeAngle(v80);
                          FigCFDictionarySetInt32();
                        }
                        if (!v22)
                          v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                        objc_msgSend(v22, "addObject:", v42);
                        v21 = v58;
                      }
                      ++v24;
                    }
                    while (v21 != v24);
                    v21 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
                  }
                  while (v21);
                }
                else
                {
                  v22 = 0;
                }
                if (objc_msgSend(v22, "count"))
                {
                  v14 = v54;
                  if (!v54)
                    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v45 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v51);
                  objc_msgSend(v45, "setObject:forKeyedSubscript:", v22, v53);
                  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v45), v52);
                }
                else
                {
                  v14 = v54;
                }
              }
              v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
            }
            while (v50);
          }
          else
          {
            v14 = 0;
          }
          objc_msgSend(v46, "setObject:forKeyedSubscript:", v14, v10);
          return (unsigned int *)objc_msgSend(v46, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D06998]);
        }
      }
    }
  }
  return result;
}

- (int)cropMode
{
  return self->_cropMode;
}

- (CGRect)inputCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputCropRect.origin.x;
  y = self->_inputCropRect.origin.y;
  width = self->_inputCropRect.size.width;
  height = self->_inputCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setUpdatesSampleBufferMetadataForIrisVIS:(BOOL)a3
{
  self->_updatesSampleBufferMetadataForIrisVIS = a3;
}

- (BOOL)updatesSampleBufferMetadataForIrisVIS
{
  return self->_updatesSampleBufferMetadataForIrisVIS;
}

- (BOOL)passesBuffersThroughWhenPossible
{
  return self->_passesBuffersThroughWhenPossible;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (id)preferredOutputPixelFormats
{
  return self->_preferredOutputPixelFormats;
}

- (int)outputColorSpaceProperties
{
  return self->_outputColorSpaceProperties;
}

- (void)setValidOutputDimensions:(id)a3
{
  self->_validOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)validOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_validOutputDimensions;
}

- (int)maxLossyCompressionLevel
{
  if (self->_maxInputLossyCompressionLevel <= self->_maxOutputLossyCompressionLevel)
    return self->_maxOutputLossyCompressionLevel;
  else
    return self->_maxInputLossyCompressionLevel;
}

- (int)maxInputLossyCompressionLevel
{
  return self->_maxInputLossyCompressionLevel;
}

- (int)maxOutputLossyCompressionLevel
{
  return self->_maxOutputLossyCompressionLevel;
}

- (void)setAppliesUprightExifOrientationTransformToInput:(BOOL)a3
{
  self->_appliesUprightExifOrientationTransformToInput = a3;
}

- (BOOL)appliesUprightExifOrientationTransformToInput
{
  return self->_appliesUprightExifOrientationTransformToInput;
}

- (BOOL)deviceOrientationCorrectionEnabled
{
  return self->_deviceOrientationCorrectionEnabled;
}

- (void)setLowSpeed:(BOOL)a3
{
  self->_lowSpeed = a3;
}

- (BOOL)lowSpeed
{
  return self->_lowSpeed;
}

- (void)setEmitSampleBufferSemaphore:(id)a3
{
  OS_dispatch_semaphore *emitSampleBufferSemaphore;

  emitSampleBufferSemaphore = self->_emitSampleBufferSemaphore;
  if (emitSampleBufferSemaphore != a3)
  {

    self->_emitSampleBufferSemaphore = (OS_dispatch_semaphore *)a3;
  }
}

- (OS_dispatch_semaphore)emitSampleBufferSemaphore
{
  return self->_emitSampleBufferSemaphore;
}

- (void)setExpectsMarkerBuffers:(BOOL)a3
{
  self->_expectsMarkerBuffers = a3;
}

- (BOOL)expectsMarkerBuffers
{
  return self->_expectsMarkerBuffers;
}

- (BOOL)generatesHistogram
{
  return self->_generatesHistogram;
}

- (int)conversionMethodForStillImagesDuringHDRVideos
{
  return self->_conversionMethodForStillImagesDuringHDRVideo;
}

- (BOOL)allows422To420Conversion
{
  return self->_allows422To420Conversion;
}

- (BOOL)isConverting10BitVideoRangeTo8BitFullRangeEncouraged
{
  return self->_isConverting10BitVideoRangeTo8BitFullRangeEncouraged;
}

- (BOOL)firstFrameProcessed
{
  return self->_firstFrameProcessed;
}

- (void)setFirstFrameProcessed:(BOOL)a3
{
  self->_firstFrameProcessed = a3;
}

- (void)_ensureTransferSession
{
  __assert_rtn("-[BWPixelTransferNode _ensureTransferSession]", "BWPixelTransferNode.m", 1640, "_transferSession != NULL");
}

- (void)_ensureRotationSession
{
  __assert_rtn("-[BWPixelTransferNode _ensureRotationSession]", "BWPixelTransferNode.m", 1527, "_rotationSession != NULL");
}

- (void)_convertUsingHDRProcessing:toSDR:.cold.1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkHDRProcessingDolbyVisionRPUDataKey(void)"), CFSTR("BWPixelTransferNode.m"), 64, CFSTR("%s"), dlerror());
  __break(1u);
}

@end
