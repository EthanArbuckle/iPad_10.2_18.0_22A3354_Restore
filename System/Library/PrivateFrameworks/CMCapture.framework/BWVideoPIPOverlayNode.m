@implementation BWVideoPIPOverlayNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  void *v6;

  v6 = (void *)objc_msgSend((id)objc_msgSend(a4, "primaryMediaProperties"), "resolvedVideoFormat");
  if (objc_msgSend(v6, "pixelFormat") == 875704422
    || objc_msgSend(v6, "pixelFormat") == 875704438)
  {
    self->_useGPUForDrawing = 0;
  }
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  NSObject *stylesProxyRendererLoadQueue;
  objc_super v4;
  _QWORD block[5];

  if (self->_useGPUForDrawing)
    -[BWVideoPIPOverlayNode _ensureGPUResources](self, "_ensureGPUResources");
  else
    self->_scalingSession = objc_alloc_init(BWScalingSession);
  if (self->_smartStyleRenderingEnabled)
  {
    stylesProxyRendererLoadQueue = self->_stylesProxyRendererLoadQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__BWVideoPIPOverlayNode_prepareForCurrentConfigurationToBecomeLive__block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = self;
    dispatch_async(stylesProxyRendererLoadQueue, block);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWVideoPIPOverlayNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v4, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  _DWORD *v6;
  CVImageBufferRef ImageBuffer;
  CMTime v8;
  CMTime time;

  memset(&v8, 0, sizeof(v8));
  CMSampleBufferGetPresentationTimeStamp(&v8, a3);
  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    time = v8;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  if (a3)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    if (ImageBuffer)
      -[BWVideoPIPOverlayNode _renderAttachedPixelBuffersFromSampleBuffer:toPixelBuffer:](self, "_renderAttachedPixelBuffersFromSampleBuffer:toPixelBuffer:", a3, ImageBuffer);
  }
  if (*v6 == 1)
    kdebug_trace();
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
}

- (void)_renderAttachedPixelBuffersFromSampleBuffer:(opaqueCMSampleBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  uint64_t v7;
  void *AttachedMedia;
  const __CFString *v9;
  const __CFDictionary *v10;
  opaqueCMSampleBuffer **p_previousAttachedSampleBuffer;
  opaqueCMSampleBuffer *v12;
  opaqueCMSampleBuffer *previousAttachedSampleBuffer;
  double v14;
  Float64 Seconds;
  opaqueCMSampleBuffer *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  opaqueCMSampleBuffer **p_fadeReferenceSampleBuffer;
  opaqueCMSampleBuffer *fadeReferenceSampleBuffer;
  float v23;
  float v24;
  float v25;
  uint64_t v26;
  double v27;
  double v28;
  CVImageBufferRef ImageBuffer;
  _BOOL4 v30;
  CFTypeID v31;
  const __CFString *v32;
  const __CFDictionary *v33;
  __CVBuffer *v34;
  const __CFDictionary *v35;
  CGFloat v36;
  CGFloat v37;
  double Height;
  double v39;
  double Width;
  uint64_t v41;
  double v42;
  double v43;
  _BOOL4 v44;
  int v45;
  int v46;
  const __CFDictionary *v51;
  CGSize v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  const __CFDictionary *v70;
  double x;
  double v72;
  double v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  double v78;
  double v79;
  double v80;
  double MinX;
  double v82;
  double MinY;
  double v84;
  double v85;
  void *Value;
  void *v87;
  void *v88;
  CGFloat v89;
  float v90;
  float v91;
  CGFloat v92;
  uint64_t v93;
  float v94;
  float lastTeleMaxScale;
  float lastTeleMaxScaleZoomFactor;
  BOOL v97;
  double v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float overCaptureTargetRatioInterpolationStart;
  double v105;
  float v106;
  float v107;
  float overCaptureTargetRatio;
  double v109;
  double v110;
  float v111;
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
  int v124;
  int v125;
  float v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  CGFloat v133;
  CGFloat v134;
  CGFloat v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  CFTypeRef v143;
  double v144;
  double v145;
  int v146;
  int v147;
  int v148;
  const __CFDictionary *v149;
  uint64_t v151;
  CGFloat v152;
  CGFloat v153;
  double y;
  double v155;
  double v156;
  float v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  CVPixelBufferRef pixelBuffer;
  double pixelBuffera;
  CGAffineTransform v168;
  CGRect v169;
  __int128 v170;
  CGRect v171;
  CMTime rhs;
  CMTime lhs;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;

  v7 = MEMORY[0x1E0C9D648];
  AttachedMedia = (void *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B198);
  v9 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v10 = (const __CFDictionary *)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!AttachedMedia || self->_frameRate == 0.0)
  {
    previousAttachedSampleBuffer = self->_previousAttachedSampleBuffer;
    if (previousAttachedSampleBuffer)
    {
      if (self->_frameRate != 0.0)
      {
        memset(&v169, 0, 24);
        CMSampleBufferGetPresentationTimeStamp((CMTime *)&v169, previousAttachedSampleBuffer);
        memset(&v168, 0, 24);
        CMSampleBufferGetPresentationTimeStamp((CMTime *)&v168, a3);
        memset(&v171, 0, 24);
        *(_OWORD *)&lhs.value = *(_OWORD *)&v168.a;
        lhs.epoch = *(_QWORD *)&v168.c;
        *(CGPoint *)&rhs.value = v169.origin;
        rhs.epoch = *(_QWORD *)&v169.size.width;
        CMTimeSubtract((CMTime *)&v171, &lhs, &rhs);
        v14 = (float)(1.0 / self->_frameRate);
        *(CGPoint *)&lhs.value = v171.origin;
        lhs.epoch = *(_QWORD *)&v171.size.width;
        if (CMTimeGetSeconds(&lhs) <= v14 + v14)
        {
          AttachedMedia = self->_previousAttachedSampleBuffer;
          v10 = (const __CFDictionary *)CMGetAttachment(AttachedMedia, v9, 0);
        }
      }
    }
  }
  else
  {
    memset(&v169, 0, 24);
    CMSampleBufferGetPresentationTimeStamp((CMTime *)&v169, (CMSampleBufferRef)AttachedMedia);
    memset(&v168, 0, 24);
    p_previousAttachedSampleBuffer = &self->_previousAttachedSampleBuffer;
    v12 = self->_previousAttachedSampleBuffer;
    if (v12)
    {
      CMSampleBufferGetPresentationTimeStamp((CMTime *)&v168, v12);
    }
    else
    {
      *(_OWORD *)&v168.a = *MEMORY[0x1E0CA2E68];
      v168.c = *(CGFloat *)(MEMORY[0x1E0CA2E68] + 16);
    }
    memset(&v171, 0, 24);
    *(CGPoint *)&lhs.value = v169.origin;
    lhs.epoch = *(_QWORD *)&v169.size.width;
    *(_OWORD *)&rhs.value = *(_OWORD *)&v168.a;
    rhs.epoch = *(_QWORD *)&v168.c;
    CMTimeSubtract((CMTime *)&v171, &lhs, &rhs);
    *(CGPoint *)&lhs.value = v171.origin;
    lhs.epoch = *(_QWORD *)&v171.size.width;
    Seconds = CMTimeGetSeconds(&lhs);
    v16 = *p_previousAttachedSampleBuffer;
    if (Seconds >= (float)(1.0 / self->_frameRate) + -0.00100000005)
    {
      if (v16)
        CFRelease(v16);
      BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)AttachedMedia, &self->_previousAttachedSampleBuffer);
    }
    else
    {
      AttachedMedia = *p_previousAttachedSampleBuffer;
    }
  }
  v17 = *(double *)v7;
  v18 = *(double *)(v7 + 8);
  v20 = *(double *)(v7 + 16);
  v19 = *(double *)(v7 + 24);
  p_fadeReferenceSampleBuffer = &self->_fadeReferenceSampleBuffer;
  fadeReferenceSampleBuffer = self->_fadeReferenceSampleBuffer;
  if (AttachedMedia)
  {
    if (fadeReferenceSampleBuffer)
    {
      v23 = 1.0;
      if (-[BWRamp isRamping](self->_fadeRamp, "isRamping"))
      {
        -[BWRamp updateRampForNextIteration](self->_fadeRamp, "updateRampForNextIteration");
        v23 = v24;
      }
    }
    else
    {
      LODWORD(v169.origin.x) = 0;
      FigCFDictionaryGetFloatIfPresent();
      LODWORD(v26) = llroundf(self->_fadeInDurationSeconds * *(float *)&v169.origin.x);
      v23 = 0.0;
      LODWORD(v27) = 0;
      LODWORD(v28) = 1.0;
      -[BWRamp startRampFrom:to:iterations:shape:](self->_fadeRamp, "startRampFrom:to:iterations:shape:", v26, 1, v27, v28);
    }
    if (*p_fadeReferenceSampleBuffer)
    {
      CFRelease(*p_fadeReferenceSampleBuffer);
      *p_fadeReferenceSampleBuffer = 0;
    }
    BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)AttachedMedia, &self->_fadeReferenceSampleBuffer);
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)AttachedMedia);
    goto LABEL_26;
  }
  if (!fadeReferenceSampleBuffer)
  {
LABEL_36:
    v30 = 0;
    goto LABEL_114;
  }
  if (-[BWRamp isRamping](self->_fadeRamp, "isRamping"))
  {
    -[BWRamp updateRampForNextIteration](self->_fadeRamp, "updateRampForNextIteration");
    v23 = v25;
  }
  else
  {
    CMGetAttachment(*p_fadeReferenceSampleBuffer, v9, 0);
    LODWORD(v169.origin.x) = 0;
    FigCFDictionaryGetFloatIfPresent();
    LODWORD(v41) = llroundf(self->_fadeOutDurationSeconds * *(float *)&v169.origin.x);
    v23 = 1.0;
    LODWORD(v42) = 1.0;
    LODWORD(v43) = 0;
    -[BWRamp startRampFrom:to:iterations:shape:](self->_fadeRamp, "startRampFrom:to:iterations:shape:", v41, 2, v42, v43);
  }
  v44 = -[BWRamp isRamping](self->_fadeRamp, "isRamping");
  AttachedMedia = *p_fadeReferenceSampleBuffer;
  if (!v44)
  {
    if (AttachedMedia)
    {
      CFRelease(*p_fadeReferenceSampleBuffer);
      v30 = 0;
      *p_fadeReferenceSampleBuffer = 0;
      goto LABEL_114;
    }
    goto LABEL_36;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(*p_fadeReferenceSampleBuffer);
  v10 = (const __CFDictionary *)CMGetAttachment(AttachedMedia, v9, 0);
LABEL_26:
  v30 = AttachedMedia != 0;
  if (AttachedMedia && ImageBuffer)
  {
    v31 = CFGetTypeID(ImageBuffer);
    if (v31 == CVPixelBufferGetTypeID())
    {
      memset(&v169, 0, sizeof(v169));
      v32 = (const __CFString *)*MEMORY[0x1E0D05D10];
      v33 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D10], 0);
      pixelBuffer = a4;
      v157 = v23;
      v34 = a4;
      v35 = v10;
      if (v33)
      {
        CGRectMakeWithDictionaryRepresentation(v33, &v169);
        CVPixelBufferGetWidth(v34);
        CVPixelBufferGetHeight(v34);
        FigCaptureMetadataUtilitiesDenormalizeCropRect(v169.origin.x, v169.origin.y, v169.size.width, v169.size.height);
        Width = v39;
      }
      else
      {
        Width = (double)CVPixelBufferGetWidth(v34);
        Height = (double)CVPixelBufferGetHeight(v34);
        v36 = 0.0;
        v37 = 0.0;
      }
      v169.origin.x = v36;
      v169.origin.y = v37;
      v169.size.width = Width;
      v169.size.height = Height;
      v45 = CVPixelBufferGetWidth(ImageBuffer);
      v46 = CVPixelBufferGetHeight(ImageBuffer);
      v168.a = 0.0;
      v168.b = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&v168.c = _Q0;
      v51 = (const __CFDictionary *)CMGetAttachment(AttachedMedia, v32, 0);
      if (v51)
      {
        CGRectMakeWithDictionaryRepresentation(v51, (CGRect *)&v168);
        v52 = *(CGSize *)(v7 + 16);
        v171.origin = *(CGPoint *)v7;
        v171.size = v52;
        if (FigCFDictionaryGetCGRectIfPresent())
        {
          v168.a = FigCaptureMetadataUtilitiesScaleRect(v168.a, v168.b, v168.c, v168.d, (v171.size.width + v171.size.height) * 0.5);
          v168.b = v53;
          v168.c = v54;
          v168.d = v55;
        }
      }
      else
      {
        FigCFDictionaryGetCGRectIfPresent();
      }
      v56 = (double)v45;
      v57 = (double)v46;
      FigCaptureMetadataUtilitiesDenormalizeCropRect(v168.a, v168.b, v168.c, v168.d);
      v59 = v58;
      v61 = v60;
      v63 = v62;
      v65 = v64;
      CVPixelBufferGetWidth(pixelBuffer);
      CVPixelBufferGetHeight(pixelBuffer);
      FigCaptureRotationDegreesAndMirroringFromExifOrientation(6, 0);
      FigCaptureMetadataUtilitiesRoundRectToEvenCoordinates();
      v162 = v66;
      v163 = v67;
      v164 = v68;
      v165 = v69;
      v70 = (const __CFDictionary *)CMGetAttachment(AttachedMedia, CFSTR("NarrowerCameraPreviewAlignmentShift"), 0);
      v10 = v35;
      v158 = (double)v45;
      v160 = v57;
      if (v70
        && (*(_OWORD *)&lhs.value = *MEMORY[0x1E0C9D538], CGPointMakeWithDictionaryRepresentation(v70, (CGPoint *)&lhs)))
      {
        v174.origin.x = v59;
        v174.origin.y = v61;
        v174.size.width = v63;
        v174.size.height = v65;
        v175 = CGRectOffset(v174, -*(double *)&lhs.value, -*(double *)&lhs.timescale);
        x = v175.origin.x;
        y = v175.origin.y;
        v72 = v175.size.width;
        v73 = v175.size.height;
        v171.origin.x = 0.0;
        v171.origin.y = 0.0;
        v171.size.width = (double)v45;
        v171.size.height = v57;
        FigCFDictionaryGetCGRectIfPresent();
        v74 = v171.origin.x;
        v75 = v171.origin.y;
        v77 = v171.size.width;
        v76 = v171.size.height;
        if (v171.size.width >= v72)
          v78 = v72;
        else
          v78 = v171.size.width;
        v79 = fmax(v78, 0.0);
        if (v171.size.height >= v73)
          v80 = v73;
        else
          v80 = v171.size.height;
        v65 = fmax(v80, 0.0);
        MinX = CGRectGetMinX(v171);
        v176.origin.x = v74;
        v176.origin.y = v75;
        v176.size.width = v77;
        v176.size.height = v76;
        v82 = CGRectGetMaxX(v176) - v79;
        if (v82 >= x)
          v82 = x;
        if (MinX >= v82)
          v82 = MinX;
        v153 = v82;
        v177.origin.x = v74;
        v177.origin.y = v75;
        v177.size.width = v77;
        v177.size.height = v76;
        MinY = CGRectGetMinY(v177);
        v178.origin.x = v74;
        v178.origin.y = v75;
        v56 = (double)v45;
        v57 = v160;
        v178.size.width = v77;
        v63 = v79;
        v178.size.height = v76;
        v84 = CGRectGetMaxY(v178) - v65;
        if (v84 >= y)
          v84 = y;
        if (MinY >= v84)
          v84 = MinY;
        v152 = v84;
      }
      else
      {
        v152 = v61;
        v153 = v59;
      }
      a4 = pixelBuffer;
      if (v56 / v63 >= v57 / v65)
        v85 = v57 / v65;
      else
        v85 = v56 / v63;
      Value = (void *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x1E0D06D00]);
      if (self->_isDeviceBravoVariant)
      {
        v87 = Value;
        v88 = (void *)CMGetAttachment(AttachedMedia, CFSTR("TotalZoomFactor"), 0);
        v89 = v65;
        if (v88)
        {
          objc_msgSend(v88, "floatValue");
          v91 = v90;
        }
        else
        {
          v91 = 1.0;
        }
        v92 = v63;
        v93 = *MEMORY[0x1E0D05A30];
        if (objc_msgSend(v87, "isEqualToString:", *MEMORY[0x1E0D05A30]))
        {
          v94 = v85;
          self->_lastTeleMaxScale = v94;
          self->_lastTeleMaxScaleZoomFactor = v91;
        }
        else if (self->_secondaryCameraStreamingEnabled)
        {
          v85 = v85 * 0.699999988;
        }
        else
        {
          lastTeleMaxScale = self->_lastTeleMaxScale;
          if (lastTeleMaxScale <= 0.0)
          {
            objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_baseZoomFactorsByPortType, "objectForKeyedSubscript:", v93), "floatValue");
            v100 = v99;
            objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_baseZoomFactorsByPortType, "objectForKeyedSubscript:", v87), "floatValue");
            v102 = v101;
            objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]), "floatValue");
            if (v103 == 0.0)
              v103 = 1.0;
            v85 = v85 / (float)(v100 / (float)(v102 * v103));
          }
          else
          {
            v85 = lastTeleMaxScale;
            if (v91 > 0.0)
            {
              lastTeleMaxScaleZoomFactor = self->_lastTeleMaxScaleZoomFactor;
              v97 = lastTeleMaxScaleZoomFactor <= 0.0;
              v98 = v85 * (float)(v91 / lastTeleMaxScaleZoomFactor);
              if (!v97)
                v85 = v98;
            }
          }
        }
      }
      else
      {
        v89 = v65;
        v92 = v63;
      }
      overCaptureTargetRatioInterpolationStart = self->_overCaptureTargetRatioInterpolationStart;
      v105 = overCaptureTargetRatioInterpolationStart;
      v106 = v85 / overCaptureTargetRatioInterpolationStart;
      v107 = self->_overCaptureTargetInterpolationScale * log2f(v106);
      overCaptureTargetRatio = self->_overCaptureTargetRatio;
      v109 = log2f(overCaptureTargetRatio / overCaptureTargetRatioInterpolationStart);
      if (fabs(v107) <= v109 * 1.57079633)
      {
        v110 = sin(v107 / v109) * v109;
      }
      else
      {
        v110 = -v109;
        if (v107 >= 0.0)
          v110 = v109;
      }
      v111 = v110;
      v112 = v105 * exp2f(v111);
      v113 = overCaptureTargetRatio;
      if (v112 > overCaptureTargetRatio)
        v112 = overCaptureTargetRatio;
      v114 = fmax(v112, 1.0);
      if (v85 <= v113)
        v113 = v85;
      v115 = fmax(v113, 1.0);
      if (self->_overCaptureTargetRatioSmoothingEnabled)
        v116 = v114;
      else
        v116 = v115;
      v117 = FigCaptureMetadataUtilitiesScaleRect(v153, v152, v92, v89, v116);
      v155 = v118;
      v120 = v119;
      v122 = v121;
      v123 = v169.size.width / v169.size.height;
      v124 = objc_msgSend((id)CMGetAttachment(pixelBuffer, CFSTR("RotationDegrees"), 0), "intValue");
      v125 = v124;
      if (v124 == 270 || v124 == 90)
        v127 = 1.0 / v123;
      else
        v127 = v123;
      v128 = FigCaptureMetadataUtilitiesRectByCroppingRectToAspectRatio(v153, v152, v92, v89, v127);
      v132 = FigCaptureMetadataUtilitiesRectNormalizedToRect(v128, v129, v130, v131, v117, v155, v120);
      v168.a = v132;
      v168.b = v133;
      v168.c = v134;
      v168.d = v135;
      if (v125 == 270 || v125 == 90)
      {
        v168.a = v133;
        v168.b = v132;
        v168.c = v135;
        v168.d = v134;
      }
      v136 = v158 - v120;
      if (v158 - v120 >= v117)
        v136 = v117;
      pixelBuffera = fmax(v136, 0.0);
      v137 = v160 - v122;
      if (v160 - v122 >= v155)
        v137 = v155;
      v138 = fmax(v137, 0.0);
      v139 = FigCaptureMetadataUtilitiesRectNormalizedToRect(v162, v163, v164, v165, v169.origin.x, v169.origin.y, v169.size.width);
      v159 = v140;
      v161 = v139;
      v156 = v141;
      v19 = v142;
      v143 = CMGetAttachment(AttachedMedia, CFSTR("FiltersForZoomPIPOverlay"), 0);
      if (self->_smartStyleRenderingEnabled)
        -[BWVideoPIPOverlayNode _renderSmartStyleToIntermediateBufferWithInputSampleBuffer:pipSourcePixelBuffer:inputRect:outputRect:](self, "_renderSmartStyleToIntermediateBufferWithInputSampleBuffer:pipSourcePixelBuffer:inputRect:outputRect:", a3, ImageBuffer, pixelBuffera, v138, v120, v122, v162, v163, v164, v165);
      if (self->_useGPUForDrawing || v143 || (LODWORD(v144) = 1.0, *(float *)&v145 = v157, v157 < 1.0))
      {
        -[BWVideoPIPOverlayNode _ensureGPUResources](self, "_ensureGPUResources", v144, v145);
        *(float *)&v151 = v157;
        -[BWVideoPIPOverlayNode _drawPIPUsingGPUToOutputPixelBuffer:attachedPixelBuffer:filters:outputRect:inputRect:normalizedReticleRect:uprightExifOrientation:pipOpacity:](self, "_drawPIPUsingGPUToOutputPixelBuffer:attachedPixelBuffer:filters:outputRect:inputRect:normalizedReticleRect:uprightExifOrientation:pipOpacity:", a4, ImageBuffer, v143, 6, v162, v163, v164, v165, pixelBuffera, v138, v120, v122, *(_QWORD *)&v168.a, *(_QWORD *)&v168.b, *(_QWORD *)&v168.c, *(_QWORD *)&v168.d,
          v151);
      }
      else
      {
        -[BWVideoPIPOverlayNode _drawPIPUsingCPUAndMSRToOutputPixelBuffer:attachedPixelBuffer:outputRect:inputRect:normalizedReticleRect:primaryCaptureRect:uprightExifOrientation:](self, "_drawPIPUsingCPUAndMSRToOutputPixelBuffer:attachedPixelBuffer:outputRect:inputRect:normalizedReticleRect:primaryCaptureRect:uprightExifOrientation:", a4, ImageBuffer, 6, v162, v163, v164, v165, pixelBuffera, v138, v120, v122, *(_QWORD *)&v168.a, *(_QWORD *)&v168.b, *(_QWORD *)&v168.c, *(_QWORD *)&v168.d, *(_QWORD *)&v169.origin.x,
          *(_QWORD *)&v169.origin.y,
          *(_QWORD *)&v169.size.width,
          *(_QWORD *)&v169.size.height);
      }
      v18 = v159;
      v17 = v161;
      v20 = v156;
    }
    v30 = 1;
  }
LABEL_114:
  v179.origin.x = v17;
  v179.origin.y = v18;
  v179.size.width = v20;
  v179.size.height = v19;
  if (!CGRectEqualToRect(v179, self->_normalizedOutputRect) && self->_delegate)
  {
    self->_normalizedOutputRect.origin.x = v17;
    self->_normalizedOutputRect.origin.y = v18;
    self->_normalizedOutputRect.size.width = v20;
    self->_normalizedOutputRect.size.height = v19;
    if (v10)
    {
      v180.origin.x = v17;
      v180.origin.y = v18;
      v180.size.width = v20;
      v180.size.height = v19;
      if (!CGRectIsEmpty(v180))
      {
        v146 = objc_msgSend((id)CMGetAttachment(a4, CFSTR("RotationDegrees"), 0), "intValue");
        v147 = objc_msgSend((id)CMGetAttachment(a4, CFSTR("MirroredHorizontal"), 0), "BOOLValue");
        v148 = objc_msgSend((id)CMGetAttachment(a4, CFSTR("MirroredVertical"), 0), "BOOLValue");
        v149 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D18], 0);
        v171.origin.x = 0.0;
        v171.origin.y = 0.0;
        __asm { FMOV            V0.2D, #1.0 }
        v171.size = _Q0;
        CGRectMakeWithDictionaryRepresentation(v149, &v171);
        v170 = 0u;
        memset(&v169, 0, sizeof(v169));
        FigCaptureGetTransformForMirroringRotationAndCrop(v147, v148, v146, (uint64_t)&v169, v171.origin.x, v171.origin.y, v171.size.width, v171.size.height);
        *(CGPoint *)&v168.a = v169.origin;
        *(CGSize *)&v168.c = v169.size;
        *(_OWORD *)&v168.tx = v170;
        v181.origin.x = v17;
        v181.origin.y = v18;
        v181.size.width = v20;
        v181.size.height = v19;
        v182 = CGRectApplyAffineTransform(v181, &v168);
        v17 = v182.origin.x;
        v18 = v182.origin.y;
        v20 = v182.size.width;
        v19 = v182.size.height;
      }
    }
    -[BWVideoPIPOverlayDelegate videoPIPOverlayNode:overlayRectDidChange:](self->_delegate, "videoPIPOverlayNode:overlayRectDidChange:", self, v17, v18, v20, v19);
  }
  if (v30)
  {
    BWSampleBufferRemoveAttachedMedia(a3, 0x1E495B198);
    CMRemoveAttachment(a3, CFSTR("ZoomPIPSource"));
  }
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWVideoPIPOverlayNode)initWithDelegate:(id)a3 metalCommandQueue:(id)a4 secondaryCameraStreamingEnabled:(BOOL)a5 secondaryCameraFrameRate:(float)a6 maxLossyCompressionLevel:(int)a7 isDeviceBravoVariant:(BOOL)a8 baseZoomFactorsByPortType:(id)a9
{
  BWVideoPIPOverlayNode *v15;
  BWNodeInput *v16;
  BWVideoFormatRequirements *v17;
  BWNodeOutput *v18;
  BWVideoFormatRequirements *v19;
  float v20;
  float v21;
  float v22;
  int v23;
  CGSize v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)BWVideoPIPOverlayNode;
  v15 = -[BWNode init](&v26, sel_init, a3, a4, a5, *(_QWORD *)&a7);
  if (v15)
  {
    v15->_metalCommandQueue = (MTLCommandQueue *)a4;
    v16 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v15);
    -[BWNodeInput setPassthroughMode:](v16, "setPassthroughMode:", 1);
    v17 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v17, "setSupportedPixelFormats:", &unk_1E4A00FB0);
    -[BWNodeInput setFormatRequirements:](v16, "setFormatRequirements:", v17);

    -[BWNode addInput:](v15, "addInput:", v16);
    v18 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v15);
    -[BWNodeOutput setPassthroughMode:](v18, "setPassthroughMode:", 1);
    v19 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutput setFormatRequirements:](v18, "setFormatRequirements:", v19);

    -[BWNode addOutput:](v15, "addOutput:", v18);
    v15->_useGPUForDrawing = 1;
    v15->_overCaptureTargetRatio = 3.0;
    v15->_overCaptureTargetRatioSmoothingEnabled = 0;
    objc_msgSend((id)objc_msgSend(a9, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30]), "floatValue");
    v21 = v20;
    objc_msgSend((id)objc_msgSend(a9, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18]), "floatValue");
    if ((int)FigCaptureRoundFloatToMultipleOf(1, v21 / v22) <= 4)
      v23 = 276;
    else
      v23 = 312;
    v15->_zoomPIPWidth = v23;
    v15->_overCaptureTargetInterpolationScale = 0.35;
    v15->_overCaptureTargetRatioInterpolationStart = 1.6149;
    v15->_reticleLineThickness = 4.0;
    v15->_baseZoomFactorsByPortType = (NSDictionary *)objc_msgSend(a9, "copy");
    v15->_secondaryCameraStreamingEnabled = a5;
    v15->_frameRate = a6;
    v15->_delegate = (BWVideoPIPOverlayDelegate *)a3;
    v15->_fadeRamp = -[BWRamp initWithName:]([BWRamp alloc], "initWithName:", CFSTR("FadeRamp"));
    v15->_fadeInDurationSeconds = 0.3;
    v15->_fadeOutDurationSeconds = 0.3;
    v15->_dropShadowWidth = 2.0;
    v15->_dropShadowBlurSigma = 10.0;
    v15->_dropShadowAlpha = 0.3;
    v15->_highQualitySamplingEnabled = 1;
    v15->_dropShadowEnabled = 1;
    v24 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v15->_normalizedOutputRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v15->_normalizedOutputRect.size = v24;
    v15->_isDeviceBravoVariant = a8;
    v15->_stylesProxyRendererLoadQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[BWVideoPIPOverlayNode _releaseResources](self, "_releaseResources");

  v3.receiver = self;
  v3.super_class = (Class)BWVideoPIPOverlayNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("VideoPIPOverlay");
}

BWScalingSession *__67__BWVideoPIPOverlayNode_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1)
{
  BWScalingSession *result;

  result = (BWScalingSession *)objc_msgSend(*(id *)(a1 + 32), "_loadAndConfigureSmartStyleProxyRenderer");
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
  {
    result = objc_alloc_init(BWScalingSession);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = result;
  }
  return result;
}

- (void)_releaseResources
{
  CGContext *bitmapContext;
  opaqueCMSampleBuffer *previousAttachedSampleBuffer;
  opaqueCMSampleBuffer *fadeReferenceSampleBuffer;
  NSObject *stylesProxyRendererLoadQueue;
  __CVBuffer *smartStyleIntermediateUnstyled;
  __CVBuffer *smartStyleIntermediateStyled;
  NSObject *v9;

  self->_metalCommandQueue = 0;
  self->_scalingSession = 0;

  self->_drawRectangleFilter = 0;
  self->_drawDropShadowFilter = 0;

  self->_sourceOverBlendKernel = 0;
  self->_ciReticleColor = 0;

  self->_ciContext = 0;
  self->_fadeRamp = 0;
  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    CFRelease(bitmapContext);
    self->_bitmapContext = 0;
  }
  previousAttachedSampleBuffer = self->_previousAttachedSampleBuffer;
  if (previousAttachedSampleBuffer)
  {
    CFRelease(previousAttachedSampleBuffer);
    self->_previousAttachedSampleBuffer = 0;
  }
  fadeReferenceSampleBuffer = self->_fadeReferenceSampleBuffer;
  if (fadeReferenceSampleBuffer)
  {
    CFRelease(fadeReferenceSampleBuffer);
    self->_fadeReferenceSampleBuffer = 0;
  }
  stylesProxyRendererLoadQueue = self->_stylesProxyRendererLoadQueue;
  if (stylesProxyRendererLoadQueue)
    dispatch_sync(stylesProxyRendererLoadQueue, &__block_literal_global_71);

  self->_smartStyleProxyRenderer = 0;
  smartStyleIntermediateUnstyled = self->_smartStyleIntermediateUnstyled;
  if (smartStyleIntermediateUnstyled)
  {
    CFRelease(smartStyleIntermediateUnstyled);
    self->_smartStyleIntermediateUnstyled = 0;
  }
  smartStyleIntermediateStyled = self->_smartStyleIntermediateStyled;
  if (smartStyleIntermediateStyled)
  {
    CFRelease(smartStyleIntermediateStyled);
    self->_smartStyleIntermediateStyled = 0;
  }
  v9 = self->_stylesProxyRendererLoadQueue;
  if (v9)
  {
    dispatch_release(v9);
    self->_stylesProxyRendererLoadQueue = 0;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  -[BWVideoPIPOverlayNode _releaseResources](self, "_releaseResources");
  v5.receiver = self;
  v5.super_class = (Class)BWVideoPIPOverlayNode;
  -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
}

- (void)_ensureGPUResources
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  if (!self->_gpuPathInitialized)
  {
    if (!self->_ciContext)
    {
      v3 = *MEMORY[0x1E0C9DFA0];
      v5[0] = *MEMORY[0x1E0C9DF58];
      v5[1] = v3;
      v6[0] = MEMORY[0x1E0C9AAB0];
      v6[1] = MEMORY[0x1E0C9AAB0];
      v5[2] = *MEMORY[0x1E0C9DFC0];
      v6[2] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
      self->_ciContext = (CIContext *)(id)objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithMTLCommandQueue:options:", self->_metalCommandQueue, v4);
    }
    if (!self->_drawRectangleFilter)
      self->_drawRectangleFilter = (CIRoundedRectangleStrokeGenerator *)(id)objc_msgSend(MEMORY[0x1E0C9DDB8], "roundedRectangleStrokeGeneratorFilter");
    if (!self->_drawDropShadowFilter)
      self->_drawDropShadowFilter = (CIBlurredRectangleGenerator *)(id)objc_msgSend(MEMORY[0x1E0C9DDB8], "blurredRectangleGeneratorFilter");
    if (!self->_sourceOverBlendKernel)
      self->_sourceOverBlendKernel = (CIBlendKernel *)(id)objc_msgSend(MEMORY[0x1E0C9DD70], "sourceOver");
    self->_gpuPathInitialized = 1;
  }
}

- (id)_strokedRectangleImageWithRect:(CGRect)a3 thickness:(float)a4 c:(id)a5
{
  double v8;
  double v9;
  CGRect v11;
  CGRect v12;

  v11 = CGRectInset(a3, a4 * -0.5, a4 * -0.5);
  v12 = CGRectIntegral(v11);
  -[CIRoundedRectangleStrokeGenerator setExtent:](self->_drawRectangleFilter, "setExtent:", FigCaptureMetadataUtilitiesRoundRectToEvenCoordinatesPreservingSquareness(1u, v12.origin.x, *(float64x2_t *)&v12.origin.y, v12.size.width, v12.size.height, 0.0));
  LODWORD(v8) = 0;
  -[CIRoundedRectangleStrokeGenerator setRadius:](self->_drawRectangleFilter, "setRadius:", v8);
  *(float *)&v9 = a4;
  -[CIRoundedRectangleStrokeGenerator setWidth:](self->_drawRectangleFilter, "setWidth:", v9);
  -[CIRoundedRectangleStrokeGenerator setColor:](self->_drawRectangleFilter, "setColor:", a5);
  return (id)-[CIRoundedRectangleStrokeGenerator outputImage](self->_drawRectangleFilter, "outputImage");
}

- (id)_reticleCIColorForPixelBuffer:(__CVBuffer *)a3 opacity:(float)a4
{
  CFTypeRef v6;
  void *v7;
  const __CFString **v8;
  float v9;
  float v10;
  float v11;
  int v12;
  const __CFString *v13;
  CGColorSpace *v14;
  const __CFString *Name;
  double v16;
  double v17;
  BOOL v18;
  CGColorSpace *v19;
  CIColor *v20;

  v6 = CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8E98], 0);
  if (v6)
    v7 = (void *)CFAutorelease(v6);
  else
    v7 = 0;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8EA8]) & 1) != 0)
  {
    v8 = (const __CFString **)MEMORY[0x1E0C9D9C0];
    v9 = 238.0;
    v10 = 230.0;
    v11 = 120.0;
  }
  else
  {
    v12 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8EB0]);
    v8 = (const __CFString **)MEMORY[0x1E0C9D908];
    if (v12)
      v11 = 20.0;
    else
      v11 = 74.0;
    if (v12)
    {
      v8 = (const __CFString **)MEMORY[0x1E0C9DA10];
      v10 = 212.0;
    }
    else
    {
      v10 = 215.0;
    }
    if (v12)
      v9 = 254.0;
    else
      v9 = 248.0;
  }
  v13 = *v8;
  v14 = -[CIColor colorSpace](self->_ciReticleColor, "colorSpace");
  if (v14)
    Name = CGColorSpaceGetName(v14);
  else
    Name = 0;
  -[CIColor alpha](self->_ciReticleColor, "alpha");
  v16 = a4;
  v18 = v17 != v16 || Name == 0;
  if (!v18 && CFStringCompare(Name, v13, 0) == kCFCompareEqualTo)
    return self->_ciReticleColor;

  v19 = CGColorSpaceCreateWithName(v13);
  v20 = (CIColor *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD80]), "initWithRed:green:blue:alpha:colorSpace:", v19, (float)(v9 / 255.0), (float)(v10 / 255.0), (float)(v11 / 255.0), v16);
  CGColorSpaceRelease(v19);
  self->_ciReticleColor = v20;
  return v20;
}

- (void)_drawPIPUsingGPUToOutputPixelBuffer:(double)a3 attachedPixelBuffer:(CGFloat)a4 filters:(double)a5 outputRect:(double)a6 inputRect:(double)a7 normalizedReticleRect:(double)a8 uprightExifOrientation:(double)a9 pipOpacity:(uint64_t)a10
{
  void *v34;
  double v35;
  int *v36;
  void *v37;
  double v38;
  uint64_t v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  void *v57;
  uint64_t v58;
  void *v59;
  double v60;
  void *v61;
  size_t Height;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  uint64_t v79;
  double v80;
  uint64_t v81;
  double v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  CGAffineTransform v87;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  CGAffineTransform v93;
  CGAffineTransform v94;
  CGAffineTransform v95;
  const __CFString *v96;
  uint64_t v97;
  _BYTE v98[128];
  uint64_t v99;
  CGRect v100;

  v99 = *MEMORY[0x1E0C80C00];
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", a11);
  v82 = a3;
  if (*(_BYTE *)(a1 + 309))
  {
    if (*(_QWORD *)(a1 + 328) && *(_DWORD *)(a1 + 312))
    {
      v35 = a4;
      v36 = &OBJC_IVAR___BWVideoPIPOverlayNode__smartStyleIntermediateStyled;
    }
    else
    {
      v35 = a4;
      v36 = &OBJC_IVAR___BWVideoPIPOverlayNode__smartStyleIntermediateUnstyled;
    }
    v37 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", *(_QWORD *)(a1 + *v36)), "imageByCroppingToRect:", *(double *)(a1 + 360), (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 352))- *(double *)(a1 + 368)- *(double *)(a1 + 384), *(double *)(a1 + 376), *(double *)(a1 + 384));
    v38 = *(double *)(a1 + 384);
    v39 = (int)*(double *)(a1 + 376);
    memset(&v95, 0, sizeof(v95));
    FigCaptureExifOrientationGetAffineTransform(a14, v39 | ((unint64_t)(int)v38 << 32), (uint64_t)&v94);
    CGAffineTransformInvert(&v95, &v94);
    v93 = v95;
    v40 = (void *)objc_msgSend(v37, "imageByApplyingTransform:", &v93);
    objc_msgSend(v40, "extent");
    v42 = -v41;
    objc_msgSend(v40, "extent");
    CGAffineTransformMakeTranslation(&v92, v42, -v43);
    v44 = (void *)objc_msgSend(v40, "imageByApplyingTransform:", &v92);
    v45 = ss_conformRectForMSR420vfPixelBuffer(a11, 1, a2, v82, v35, a5);
    v47 = v46;
    v49 = v48;
    v51 = v50;
    objc_msgSend(v44, "extent");
    v53 = v49 / v52;
    objc_msgSend(v44, "extent");
    v55 = v51 / v54;
    v56 = (double)CVPixelBufferGetHeight(a11) - v47 - v51;
    CGAffineTransformMakeScale(&v91, v53, v55);
    v57 = (void *)objc_msgSend(v44, "imageByApplyingTransform:", &v91);
    CGAffineTransformMakeTranslation(&v90, v45, v56);
    v58 = objc_msgSend(v57, "imageByApplyingTransform:", &v90);
  }
  else
  {
    v59 = (void *)objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", a12);
    v60 = (double)CVPixelBufferGetHeight(a12) - a7 - a9;
    v61 = (void *)objc_msgSend(v59, "imageByCroppingToRect:", a6, v60, a8, a9);
    Height = CVPixelBufferGetHeight(a11);
    CGAffineTransformMakeTranslation(&v95, a2, (double)Height - a3 - a5);
    t2 = v95;
    v35 = a4;
    CGAffineTransformScale(&v93, &t2, a4, a5);
    v95 = v93;
    FigCaptureExifOrientationGetAffineTransform(a14, 0x100000001, (uint64_t)&v87);
    CGAffineTransformInvert(&t1, &v87);
    t2 = v95;
    CGAffineTransformConcat(&v93, &t1, &t2);
    v95 = v93;
    t2 = v93;
    CGAffineTransformScale(&v93, &t2, 1.0 / a8, 1.0 / a9);
    v95 = v93;
    t2 = v93;
    CGAffineTransformTranslate(&v93, &t2, -a6, -v60);
    v95 = v93;
    v58 = objc_msgSend(v61, "imageByApplyingTransform:highQualityDownsample:", &v93, *(unsigned __int8 *)(a1 + 400));
  }
  v63 = (void *)v58;
  v95.a = 0.0;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v64 = objc_msgSend(a13, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v84;
    v67 = *MEMORY[0x1E0C9E1F8];
    do
    {
      for (i = 0; i != v65; ++i)
      {
        if (*(_QWORD *)v84 != v66)
          objc_enumerationMutation(a13);
        v69 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        objc_msgSend(v69, "setValue:forKey:", v63, v67);
        v63 = (void *)objc_msgSend(v69, "outputImage");
      }
      v65 = objc_msgSend(a13, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
    }
    while (v65);
  }
  if (*(_BYTE *)(a1 + 308))
  {
    objc_msgSend(v63, "extent");
    CGRectInset(v100, (float)-*(float *)(a1 + 296), (float)-*(float *)(a1 + 296));
    FigCaptureMetadataUtilitiesRoundRectToEvenCoordinates();
    objc_msgSend(*(id *)(a1 + 192), "setExtent:");
    LODWORD(v70) = *(_DWORD *)(a1 + 300);
    objc_msgSend(*(id *)(a1 + 192), "setSigma:", v70);
    objc_msgSend(*(id *)(a1 + 192), "setColor:", objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, *(float *)(a1 + 304)));
    v63 = (void *)objc_msgSend(v63, "imageByCompositingOverImage:", objc_msgSend(*(id *)(a1 + 192), "outputImage"));
  }
  if (a19 < 1.0)
  {
    v96 = CFSTR("inputAVector");
    v97 = objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, a19);
    v63 = (void *)objc_msgSend(v63, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1));
  }
  v71 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(a15, a16, a17, a18, a2, v82, v35);
  v73 = v72;
  v75 = v74;
  v77 = (double)CVPixelBufferGetHeight(a11) - v76;
  v78 = v77 - v75;
  *(float *)&v77 = a19;
  v79 = objc_msgSend((id)a1, "_reticleCIColorForPixelBuffer:opacity:", a11, v77);
  LODWORD(v80) = *(_DWORD *)(a1 + 176);
  v81 = objc_msgSend((id)objc_msgSend((id)a1, "_strokedRectangleImageWithRect:thickness:c:", v79, v71, v78, v73, v75, v80), "imageByCompositingOverImage:", v63);
  objc_msgSend(v34, "setBlendKernel:", *(_QWORD *)(a1 + 200));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 208), "startTaskToRender:toDestination:error:", v81, v34, &v95), "waitUntilCompletedAndReturnError:", &v95);

}

- (uint64_t)_drawPIPUsingCPUAndMSRToOutputPixelBuffer:(double)a3 attachedPixelBuffer:(double)a4 outputRect:(double)a5 inputRect:(double)a6 normalizedReticleRect:(double)a7 primaryCaptureRect:(double)a8 uprightExifOrientation:(double)a9
{
  void *v36;
  int *v37;
  void *v38;
  BWOverlaidRectangle *v39;
  BWRamp *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  BWOverlaidRectangle *v50;
  BWRamp *v51;
  double v52;
  double v53;
  CGRect v57;

  v36 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (*(_BYTE *)(a1 + 309))
  {
    if (*(_QWORD *)(a1 + 328) && *(_DWORD *)(a1 + 312))
      v37 = &OBJC_IVAR___BWVideoPIPOverlayNode__smartStyleIntermediateStyled;
    else
      v37 = &OBJC_IVAR___BWVideoPIPOverlayNode__smartStyleIntermediateUnstyled;
    a12 = *(_QWORD *)(a1 + *v37);
    a6 = *(double *)(a1 + 360);
    a7 = *(double *)(a1 + 368);
    a8 = *(double *)(a1 + 376);
    a9 = *(double *)(a1 + 384);
  }
  v38 = *(void **)(a1 + 112);
  if ((int)a13 < 6)
    objc_msgSend(v38, "scalePixelBuffer:rect:intoPixelBuffer:rect:", a12, a11, a6, a7, a8, a9, a2, a3, a4, a5);
  else
    objc_msgSend(v38, "scalePixelBuffer:rect:exifOrientation:intoPixelBuffer:rect:", a12, a13, a11, a6, a7, a8, a9, a2, a3, a4, a5);
  v39 = -[BWOverlaidRectangle initWithDisplayStyle:]([BWOverlaidRectangle alloc], "initWithDisplayStyle:", 3);
  -[BWOverlaidRectangle setBounds:](v39, "setBounds:", a2, a3, a4, a5);
  -[BWOverlaidRectangle setAnimationState:](v39, "setAnimationState:", 1);
  v40 = -[BWRamp initWithName:]([BWRamp alloc], "initWithName:", CFSTR("OverlaidRectangleDisplayStyleVideo"));
  LODWORD(v41) = 0;
  LODWORD(v42) = 1.0;
  -[BWRamp startRampFrom:to:iterations:shape:](v40, "startRampFrom:to:iterations:shape:", 1, 2, v41, v42);
  -[BWRamp updateRampForNextIteration](v40, "updateRampForNextIteration");
  -[BWOverlaidRectangle setRampAnimation:](v39, "setRampAnimation:", v40);
  objc_msgSend(v36, "addObject:", v39);
  v43 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(a14, a15, a16, a17, a2, a3, a4);
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v50 = -[BWOverlaidRectangle initWithDisplayStyle:]([BWOverlaidRectangle alloc], "initWithDisplayStyle:", 4);
  -[BWOverlaidRectangle setBounds:](v50, "setBounds:", v43, v45, v47, v49);
  -[BWOverlaidRectangle setAnimationState:](v50, "setAnimationState:", 1);
  v51 = -[BWRamp initWithName:]([BWRamp alloc], "initWithName:", CFSTR("PiP Reticle"));
  LODWORD(v52) = 0;
  LODWORD(v53) = 1.0;
  -[BWRamp startRampFrom:to:iterations:shape:](v51, "startRampFrom:to:iterations:shape:", 1, 2, v52, v53);
  -[BWRamp updateRampForNextIteration](v51, "updateRampForNextIteration");
  -[BWOverlaidRectangle setRampAnimation:](v50, "setRampAnimation:", v51);
  objc_msgSend(v36, "addObject:", v50);
  if (objc_msgSend(v36, "count"))
  {
    objc_msgSend((id)objc_msgSend(v36, "firstObject"), "bounds");
    a19 = CGRectGetMaxY(v57) + 10.0;
  }
  return objc_msgSend((id)a1, "_drawOverlayRects:toPixelBuffer:withinRect:", v36, a11, a18, a19, a20, a21);
}

- (int)_drawOverlayRects:(id)a3 toPixelBuffer:(__CVBuffer *)a4 withinRect:(CGRect)a5
{
  int result;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  OSType PixelFormatType;
  size_t v12;
  CGColorSpace *DeviceGray;
  void *BaseAddressOfPlane;
  size_t v15;
  CGColor *v16;
  size_t BytesPerRowOfPlane;
  CGFloat components[3];
  uint64_t v19;
  CGSize v20;

  result = 0;
  v19 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    CVPixelBufferLockBaseAddress(a4, 0);
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, 0);
    PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    if (FigCapturePixelFormatIsTenBit(PixelFormatType))
      v12 = 16;
    else
      v12 = 8;
    if (self->_bitmapContext)
    {
      CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      CGBitmapContextSetData();
    }
    else
    {
      DeviceGray = CGColorSpaceCreateDeviceGray();
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      v15 = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      self->_bitmapContext = CGBitmapContextCreate(BaseAddressOfPlane, WidthOfPlane, HeightOfPlane, v12, v15, DeviceGray, 0);
      *(_OWORD *)components = xmmword_1A32A2300;
      v16 = CGColorCreate(DeviceGray, components);
      v20.width = 1.0;
      v20.height = -1.0;
      CGContextSetShadowWithColor(self->_bitmapContext, v20, 0.0, v16);
      if (v16)
        CFRelease(v16);
      if (DeviceGray)
        CFRelease(DeviceGray);
    }
    if (objc_msgSend(a3, "count", BytesPerRowOfPlane))
    {
      CGContextSaveGState(self->_bitmapContext);
      BWOverlaidRectangleDrawRectanglesInBitmapContext(a3, self->_bitmapContext, a4);
      CGContextRestoreGState(self->_bitmapContext);
    }
    return CVPixelBufferUnlockBaseAddress(a4, 0);
  }
  return result;
}

- (int)_loadAndConfigureSmartStyleProxyRenderer
{
  objc_class *v3;
  objc_class *v4;
  CMISmartStyleProxyRenderer *v5;
  double v6;
  CMISmartStyleProxyRenderer *smartStyleProxyRenderer;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int v15;

  v3 = NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleV%d"), 1));
  self->_smartStyleClass = v3;
  if (!v3
    || (v4 = NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProxyRendererV%d"), 1))) == 0|| (v5 = (CMISmartStyleProxyRenderer *)objc_msgSend([v4 alloc], "initWithOptionalMetalCommandQueue:", self->_metalCommandQueue), (self->_smartStyleProxyRenderer = v5) == 0))
  {
    v14 = -12786;
LABEL_25:

    self->_smartStyleProxyRenderer = 0;
    return v14;
  }
  -[CMISmartStyleProxyRenderer setMaxInputStylesCount:](v5, "setMaxInputStylesCount:", 1);
  LODWORD(v6) = 0.5;
  -[CMISmartStyleProxyRenderer setForegroundRatio:](self->_smartStyleProxyRenderer, "setForegroundRatio:", v6);
  smartStyleProxyRenderer = self->_smartStyleProxyRenderer;
  v8 = (id)-[CMISmartStyleProxyRenderer externalMemoryDescriptorForConfiguration:](smartStyleProxyRenderer, "externalMemoryDescriptorForConfiguration:", 0);
  if (!v8)
  {
    v9 = 0;
    goto LABEL_17;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B10]), "initWithDevice:allocatorType:", objc_msgSend((id)-[CMISmartStyleProxyRenderer metalCommandQueue](smartStyleProxyRenderer, "metalCommandQueue"), "device"), objc_msgSend(v8, "allocatorType"));
  if (!v9)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  v10 = (void *)objc_opt_new();
  if (!v10)
  {
LABEL_18:
    v13 = 0;
LABEL_19:
    v14 = -12786;
    goto LABEL_10;
  }
  objc_msgSend(v10, "setMemSize:", objc_msgSend(v8, "memSize"));
  objc_msgSend(v10, "setWireMemory:", 1);
  objc_msgSend(v10, "setLabel:", CFSTR("BWOverCaptureSmartStyleApplyNode-SmartStyleProxyRenderer-FigMetalAllocatorBackend"));
  objc_msgSend(v10, "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  v11 = objc_msgSend(v9, "setupWithDescriptor:", v10);
  if (v11)
  {
    v14 = v11;
    v13 = 0;
    goto LABEL_10;
  }
  v12 = (void *)objc_opt_new();
  v13 = v12;
  if (!v12)
    goto LABEL_19;
  objc_msgSend(v12, "setAllocatorBackend:", v9);
  -[CMISmartStyleProxyRenderer setExternalMemoryResource:](smartStyleProxyRenderer, "setExternalMemoryResource:", v13);
  v14 = 0;
LABEL_10:

  if (v14)
    goto LABEL_23;
  v15 = -[CMISmartStyleProxyRenderer setup](self->_smartStyleProxyRenderer, "setup");
  if (v15)
  {
    v14 = v15;
    fig_log_get_emitter();
LABEL_24:
    FigDebugAssert3();
    goto LABEL_25;
  }
  v14 = -[CMISmartStyleProxyRenderer prewarm](self->_smartStyleProxyRenderer, "prewarm");
  if (v14)
  {
LABEL_23:
    fig_log_get_emitter();
    goto LABEL_24;
  }
  self->_smartStyleRenderingMethod = 2;
  return v14;
}

- (void)_updateCurrentStyle:(opaqueCMSampleBuffer *)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  CMISmartStyle *currentStyle;

  v4 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D060B0]);
  if (v4)
  {
    v5 = +[FigCaptureSmartStyle createFromDictionary:](FigCaptureSmartStyle, "createFromDictionary:", v4);
    if (v5)
    {
      v6 = v5;
      currentStyle = self->_currentStyle;
      if (!currentStyle)
        currentStyle = (CMISmartStyle *)objc_alloc_init(self->_smartStyleClass);
      self->_currentStyle = currentStyle;
      -[CMISmartStyle setCastType:](self->_currentStyle, "setCastType:", objc_msgSend(v6, "cast"));
      objc_msgSend(v6, "intensity");
      -[CMISmartStyle setCastIntensity:](self->_currentStyle, "setCastIntensity:");
      objc_msgSend(v6, "toneBias");
      -[CMISmartStyle setToneBias:](self->_currentStyle, "setToneBias:");
      objc_msgSend(v6, "colorBias");
      -[CMISmartStyle setColorBias:](self->_currentStyle, "setColorBias:");
    }
  }
}

- (int)_renderSmartStyleToIntermediateBufferWithInputSampleBuffer:(opaqueCMSampleBuffer *)a3 pipSourcePixelBuffer:(__CVBuffer *)a4 inputRect:(CGRect)a5 outputRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  __CVBuffer *smartStyleIntermediateUnstyled;
  int *v18;
  size_t v19;
  size_t v20;
  __CVBuffer *v21;
  __CVBuffer *smartStyleIntermediateStyled;
  uint64_t v24;
  int *v25;
  objc_class *PixelBuffer;
  double v27;
  double v28;
  double v29;
  double v30;
  int smartStyleRenderingMethod;
  int v32;
  int v33;
  _QWORD v36[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v36[1] = *MEMORY[0x1E0C80C00];
  if (a6.size.width >= a6.size.height)
    v12 = a6.size.width;
  else
    v12 = a6.size.height;
  if (a5.size.width >= a5.size.height)
    v13 = a5.size.width;
  else
    v13 = a5.size.height;
  v14 = v12 / v13;
  v15 = vcvtpd_u64_f64(a5.size.width * v14);
  v16 = vcvtpd_u64_f64(a5.size.height * v14);
  smartStyleIntermediateUnstyled = self->_smartStyleIntermediateUnstyled;
  v18 = &OBJC_IVAR___BWMattingV2InferenceProvider__semanticMatteOutputVideoRequirementsByMattingOutputType;
  if (!smartStyleIntermediateUnstyled || !self->_smartStyleIntermediateStyled)
    goto LABEL_20;
  v19 = CVPixelBufferGetWidth(smartStyleIntermediateUnstyled);
  v20 = CVPixelBufferGetHeight(self->_smartStyleIntermediateUnstyled);
  v21 = self->_smartStyleIntermediateUnstyled;
  if (v19 > ((v15 + 15) & 0xFFFFFFFFFFFFFFF0) || v20 > ((v16 + 15) & 0xFFFFFFFFFFFFFFF0))
  {
    if (v21)
    {
      CFRelease(v21);
      self->_smartStyleIntermediateUnstyled = 0;
    }
    smartStyleIntermediateStyled = self->_smartStyleIntermediateStyled;
    v18 = &OBJC_IVAR___BWMattingV2InferenceProvider__semanticMatteOutputVideoRequirementsByMattingOutputType;
    if (!smartStyleIntermediateStyled)
      goto LABEL_20;
    CFRelease(smartStyleIntermediateStyled);
    self->_smartStyleIntermediateStyled = 0;
    v21 = self->_smartStyleIntermediateUnstyled;
  }
  v18 = &OBJC_IVAR___BWMattingV2InferenceProvider__semanticMatteOutputVideoRequirementsByMattingOutputType;
  if (!v21 || (LODWORD(v24) = 352, !self->_smartStyleIntermediateStyled))
  {
LABEL_20:
    v25 = v18;
    CVPixelBufferGetPixelFormatType(a4);
    self->_smartStyleIntermediateUnstyled = (__CVBuffer *)CreatePixelBuffer();
    PixelBuffer = (objc_class *)CreatePixelBuffer();
    v24 = v25[135];
    *(Class *)((char *)&self->super.super.isa + v24) = PixelBuffer;
    CVBufferPropagateAttachments(a4, self->_smartStyleIntermediateUnstyled);
    CVBufferPropagateAttachments(a4, *(CVBufferRef *)((char *)&self->super.super.isa + v24));
    v21 = self->_smartStyleIntermediateUnstyled;
  }
  self->_smartStyleIntermediateROI.origin.x = 0.0;
  self->_smartStyleIntermediateROI.origin.y = 0.0;
  self->_smartStyleIntermediateROI.size.width = (double)v15;
  self->_smartStyleIntermediateROI.size.height = (double)v16;
  v27 = ss_conformRectForMSR420vfPixelBuffer(v21, 1, 0.0, 0.0, (double)v15, (double)v16);
  self->_smartStyleIntermediateROI.origin.x = v27;
  self->_smartStyleIntermediateROI.origin.y = v28;
  self->_smartStyleIntermediateROI.size.width = v29;
  self->_smartStyleIntermediateROI.size.height = v30;
  -[BWScalingSession scalePixelBuffer:rect:intoPixelBuffer:rect:](self->_scalingSession, "scalePixelBuffer:rect:intoPixelBuffer:rect:", a4, self->_smartStyleIntermediateUnstyled, x, y, width, height, v27, v28, v29, v30);
  -[BWVideoPIPOverlayNode _updateCurrentStyle:](self, "_updateCurrentStyle:", a3);
  if (!self->_currentStyle)
    return 0;
  smartStyleRenderingMethod = self->_smartStyleRenderingMethod;
  if (smartStyleRenderingMethod == 2)
  {
    v32 = -[CMISmartStyleProxyRenderer prepareToProcess:](self->_smartStyleProxyRenderer, "prepareToProcess:", 1);
    if (!v32)
      goto LABEL_30;
    goto LABEL_28;
  }
  if (smartStyleRenderingMethod == 3)
  {
    v32 = -[CMISmartStyleProxyRenderer prepareToProcess:](self->_smartStyleProxyRenderer, "prepareToProcess:", 2);
    if (!v32)
    {
LABEL_30:
      v36[0] = self->_currentStyle;
      -[CMISmartStyleProxyRenderer setInputStyles:](self->_smartStyleProxyRenderer, "setInputStyles:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1));
      -[CMISmartStyleProxyRenderer setInputPixelBuffer:](self->_smartStyleProxyRenderer, "setInputPixelBuffer:", self->_smartStyleIntermediateUnstyled);
      -[CMISmartStyleProxyRenderer setOutputPixelBuffer:](self->_smartStyleProxyRenderer, "setOutputPixelBuffer:", *(Class *)((char *)&self->super.super.isa + (int)v24));
      -[CMISmartStyleProxyRenderer setInputMetadata:](self->_smartStyleProxyRenderer, "setInputMetadata:", CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
      v33 = -[CMISmartStyleProxyRenderer process](self->_smartStyleProxyRenderer, "process");
      if (v33)
      {
        smartStyleRenderingMethod = v33;
        fig_log_get_emitter();
      }
      else
      {
        smartStyleRenderingMethod = -[CMISmartStyleProxyRenderer finishProcessing](self->_smartStyleProxyRenderer, "finishProcessing");
        if (!smartStyleRenderingMethod)
          return smartStyleRenderingMethod;
        fig_log_get_emitter();
      }
      goto LABEL_26;
    }
LABEL_28:
    smartStyleRenderingMethod = v32;
    fig_log_get_emitter();
    goto LABEL_26;
  }
  if (smartStyleRenderingMethod)
  {
    fig_log_get_emitter();
    smartStyleRenderingMethod = -12782;
LABEL_26:
    FigDebugAssert3();
  }
  return smartStyleRenderingMethod;
}

- (BOOL)smartStyleRenderingEnabled
{
  return self->_smartStyleRenderingEnabled;
}

- (void)setSmartStyleRenderingEnabled:(BOOL)a3
{
  self->_smartStyleRenderingEnabled = a3;
}

@end
