@implementation BWPreviewStabilizationNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  id v8;
  uint64_t v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  int lastRecommendedMasterSelectionReason;
  CFTypeRef v15;
  void *v16;
  void *v17;
  CMAttachmentBearerRef v18;
  void *v19;
  float v20;
  float v21;
  _BOOL4 isStillImagePreview;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  int v28;
  int v29;
  __CVBuffer *ImageBuffer;
  unsigned int Width;
  __CVBuffer *v32;
  unsigned int Height;
  double v34;
  void *v35;
  float v36;
  float v37;
  char v38;
  double v39;
  double v40;
  float v41;
  float v42;
  BOOL v43;
  float v44;
  float64x2_t v45;
  double v46;
  double v47;
  int v48;
  int v49;
  float v50;
  CGPoint v51;
  double v52;
  float v53;
  double v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  float v59;
  double v60;
  uint64_t v61;
  float v62;
  double v63;
  float v64;
  float v65;
  double v66;
  uint64_t v67;
  float v68;
  double v69;
  float v70;
  int *v71;
  double v72;
  double v73;
  float v74;
  float64_t v75;
  void *v76;
  BOOL v77;
  __CVBuffer *v78;
  CGFloat v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  CGFloat v93;
  double MinX;
  double v95;
  double MinY;
  double v97;
  CGFloat v98;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  BOOL v103;
  int v104;
  int v105;
  uint64_t v106;
  int v107;
  float64x2_t v108;
  const __CFString *key;
  double v110;
  CGRect v111;
  CGRect rect;
  float64x2_t v113;
  CMAttachmentBearerRef target;
  CFTypeRef v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v115 = 0;
  target = 0;
  v7 = *MEMORY[0x1E0D05A30];
  v8 = -[NSDictionary objectForKeyedSubscript:](self->_staticParametersByPortType, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30], a4);
  v9 = *MEMORY[0x1E0D058B8];
  objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D058B8]), "floatValue");
  if (v10 == 0.0)
  {
    fig_log_get_emitter();
    v102 = v4;
    LODWORD(v101) = 0;
LABEL_101:
    FigDebugAssert3();
    goto LABEL_92;
  }
  v11 = v10;
  v12 = (void *)CMGetAttachment(a3, CFSTR("LastRecommendedMasterSelectionReason"), 0);
  if (v12)
  {
    v13 = v12;
    self->_lastRecommendedMasterSelectionReason = objc_msgSend(v12, "intValue");
    lastRecommendedMasterSelectionReason = objc_msgSend(v13, "intValue");
  }
  else
  {
    lastRecommendedMasterSelectionReason = self->_lastRecommendedMasterSelectionReason;
  }
  v15 = CMGetAttachment(a3, CFSTR("RecommendedMasterPortType"), 0);
  if (v15)
  {
    v16 = (void *)v15;

    self->_lastRecommendedMasterPortType = (NSString *)v16;
  }
  BWOverCaptureSampleBufferUnpackAndRetain(a3, 0, &target, &v115, 0, 0);
  v17 = (void *)v115;
  if (!v115)
    goto LABEL_98;
  if (target)
    v18 = target;
  else
    v18 = v115;
  v19 = (void *)CMGetAttachment(v18, CFSTR("TotalZoomFactor"), 0);
  if (v19)
  {
    objc_msgSend(v19, "floatValue");
    v21 = v20;
  }
  else
  {
    v21 = 1.0;
  }
  isStillImagePreview = 0;
  if (target)
  {
    if (self->_stabilizeFallbackCamera && lastRecommendedMasterSelectionReason == 1)
    {
      isStillImagePreview = 0;
      if (!-[NSString isEqualToString:](self->_lastRecommendedMasterPortType, "isEqualToString:", v7) && v21 > v11)
      {
        isStillImagePreview = self->_isStillImagePreview;
        if (self->_isStillImagePreview)
          v17 = (void *)target;
      }
    }
  }
  key = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v23 = (void *)CMGetAttachment(v17, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v23)
  {
LABEL_98:
    fig_log_get_emitter();
    v102 = v4;
    LODWORD(v101) = 0;
    goto LABEL_101;
  }
  v24 = v23;
  v106 = v9;
  v104 = lastRecommendedMasterSelectionReason;
  v25 = *MEMORY[0x1E0D06D00];
  v26 = (void *)objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v27 = -[NSDictionary objectForKeyedSubscript:](self->_staticParametersByPortType, "objectForKeyedSubscript:", v26);
  objc_msgSend((id)objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0D05968]), "floatValue");
  v29 = v28;
  v108 = *(float64x2_t *)MEMORY[0x1E0C9D538];
  v113 = *(float64x2_t *)MEMORY[0x1E0C9D538];
  ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v17);
  Width = CVPixelBufferGetWidth(ImageBuffer);
  v32 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v17);
  Height = CVPixelBufferGetHeight(v32);
  v107 = Width;
  LODWORD(v34) = v29;
  if (-[BWPreviewGyroStabilization computeStabilizationShiftUsingMetadata:pixelBufferDimensions:pixelSizeInMicrons:stabilizationShiftOut:](self->_previewStabilization, "computeStabilizationShiftUsingMetadata:pixelBufferDimensions:pixelSizeInMicrons:stabilizationShiftOut:", v24, Width | ((unint64_t)Height << 32), &v113, v34))
  {
    fig_log_get_emitter();
    v102 = v4;
    LODWORD(v101) = 0;
    goto LABEL_101;
  }
  v105 = Height;
  v35 = (void *)CMGetAttachment(a3, CFSTR("UIZoomFactor"), 0);
  if (!v35)
  {
    objc_msgSend(v26, "isEqual:", v7);
    v37 = 1.0;
LABEL_31:
    if (self->_lastStabilizingEnabled && self->_enableStabilizationTransitionRamps)
    {
      v41 = 1.0;
      if (-[BWRamp isRamping](self->_stabilizationTransitionRamp, "isRamping"))
      {
        -[BWRamp currentValue](self->_stabilizationTransitionRamp, "currentValue");
        v41 = v42;
        -[BWRamp reset](self->_stabilizationTransitionRamp, "reset");
      }
      LODWORD(v40) = 0;
      *(float *)&v39 = v41;
      -[BWRamp startRampFrom:to:iterations:shape:](self->_stabilizationTransitionRamp, "startRampFrom:to:iterations:shape:", self->_stabilizationExitRampFrameCount, 2, v39, v40);
    }
    if (-[BWRamp isRamping](self->_stabilizationTransitionRamp, "isRamping"))
    {
      -[BWRamp updateRampForNextIteration](self->_stabilizationTransitionRamp, "updateRampForNextIteration");
      v43 = 0;
      v45 = vmulq_n_f64(v113, v44);
    }
    else
    {
      v43 = 0;
      v45 = v108;
    }
    v113 = v45;
    goto LABEL_47;
  }
  objc_msgSend(v35, "floatValue");
  v37 = v36;
  v38 = objc_msgSend(v26, "isEqual:", v7);
  if (v37 < 5.0 || (v38 & 1) == 0 && (!self->_stabilizeFallbackCamera || v104 != 1))
    goto LABEL_31;
  if (!self->_lastStabilizingEnabled && self->_enableStabilizationTransitionRamps)
  {
    v48 = 0;
    if (-[BWRamp isRamping](self->_stabilizationTransitionRamp, "isRamping"))
    {
      -[BWRamp currentValue](self->_stabilizationTransitionRamp, "currentValue");
      v48 = v49;
      -[BWRamp reset](self->_stabilizationTransitionRamp, "reset");
    }
    LODWORD(v47) = 1.0;
    LODWORD(v46) = v48;
    -[BWRamp startRampFrom:to:iterations:shape:](self->_stabilizationTransitionRamp, "startRampFrom:to:iterations:shape:", self->_stabilizationEnterRampFrameCount, 2, v46, v47);
  }
  if (-[BWRamp isRamping](self->_stabilizationTransitionRamp, "isRamping"))
  {
    -[BWRamp updateRampForNextIteration](self->_stabilizationTransitionRamp, "updateRampForNextIteration");
    v113 = vmulq_n_f64(v113, v50);
  }
  v43 = 1;
LABEL_47:
  v51.x = v113.f64[0];
  if (self->_isStillImagePreview)
  {
    v52 = (float)((float)(v37 + -5.0) / 0.2);
    if (v52 > 1.0)
      v52 = 1.0;
    v53 = fmax(v52, 0.0);
    v54 = v53;
    v51.x = v113.f64[0] * v54;
    v113.f64[0] = v113.f64[0] * v54;
    v113.f64[1] = v113.f64[1] * v54;
    if (isStillImagePreview)
    {
      v55 = (void *)CMGetAttachment(v115, key, 0);
      v56 = (void *)CMGetAttachment(target, key, 0);
      v103 = v43;
      v57 = objc_msgSend(v55, "objectForKeyedSubscript:", v25);
      v58 = objc_msgSend(v56, "objectForKeyedSubscript:", v25);
      objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_staticParametersByPortType, "objectForKeyedSubscript:", v57), "objectForKeyedSubscript:", v106), "floatValue");
      v60 = v59;
      v61 = *MEMORY[0x1E0D06CC8];
      objc_msgSend((id)objc_msgSend(v55, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CC8]), "floatValue");
      if (v62 == 0.0)
        v63 = 1.0;
      else
        v63 = v62;
      v64 = v63 * v60;
      objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_staticParametersByPortType, "objectForKeyedSubscript:", v58), "objectForKeyedSubscript:", v106), "floatValue");
      v66 = v65;
      v67 = v61;
      v43 = v103;
      objc_msgSend((id)objc_msgSend(v56, "objectForKeyedSubscript:", v67), "floatValue");
      if (v68 == 0.0)
        v69 = 1.0;
      else
        v69 = v68;
      v70 = v69 * v66;
      v51 = (CGPoint)vmulq_n_f64(v113, (float)(v64 / v70));
      v113 = (float64x2_t)v51;
    }
    v71 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__rawCompressionEnabled;
    if (self->_stabilizationCameraFallbackRampEnabled)
    {
      if ((objc_msgSend(v26, "isEqualToString:", self->_lastPortType) & 1) == 0
        && self->_stabilizeFallbackCamera
        && v104 == 1
        && v21 > v11
        && self->_isStillImagePreview)
      {
        if (-[BWRamp isRamping](self->_stabilizationCameraFallbackRamp, "isRamping"))
          -[BWRamp reset](self->_stabilizationCameraFallbackRamp, "reset");
        LODWORD(v72) = 0;
        LODWORD(v73) = 1.0;
        -[BWRamp startRampFrom:to:iterations:shape:](self->_stabilizationCameraFallbackRamp, "startRampFrom:to:iterations:shape:", self->_stabilizationCameraFallbackRampFrameCount, 0, v72, v73);
        self->_lastTranslationBeforeCameraFallbackRampStart = self->_appliedTranslation;
      }
      if (-[BWRamp isRamping](self->_stabilizationCameraFallbackRamp, "isRamping"))
      {
        -[BWRamp updateRampForNextIteration](self->_stabilizationCameraFallbackRamp, "updateRampForNextIteration");
        v51 = (CGPoint)vmlaq_n_f64(vmulq_n_f64(v113, v74), (float64x2_t)self->_lastTranslationBeforeCameraFallbackRampStart, 1.0 - v74);
        v113 = (float64x2_t)v51;
      }
      else
      {
        v51.x = v113.f64[0];
      }
    }
  }
  else
  {
    v71 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__rawCompressionEnabled;
  }
  v75 = v113.f64[1];
  if (v51.x != *MEMORY[0x1E0C9D538] || v113.f64[1] != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    if (self->_updateFinalCropRectWithStabilizationShift)
    {
      v76 = (void *)CMGetAttachment(v115, key, 0);
      rect = *(CGRect *)ymmword_1A32B1CF0;
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v76, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E68]), &rect);
      v77 = v43;
      v78 = CMSampleBufferGetImageBuffer(a3);
      v79 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v111.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
      v111.origin.y = v79;
      v111.size.width = (double)CVPixelBufferGetWidth(v78);
      v111.size.height = (double)CVPixelBufferGetHeight(v78);
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v76, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F48]), &v111);
      FigCaptureMetadataUtilitiesNormalizeCropRect(v111.origin.x, v111.origin.y, v111.size.width, v111.size.height);
      v84 = v83;
      v85 = v80;
      v86 = v81;
      v87 = v82;
      v88 = rect.origin.x + v113.f64[0] / (float)v107;
      v43 = v77;
      v89 = rect.origin.y + v113.f64[1] / (float)v105;
      rect.origin.x = v88;
      rect.origin.y = v89;
      v90 = rect.size.width;
      if (v81 < rect.size.width)
        v90 = v81;
      v91 = fmax(v90, 0.0);
      if (v82 >= rect.size.height)
        v92 = rect.size.height;
      else
        v92 = v82;
      v110 = fmax(v92, 0.0);
      v93 = v84;
      MinX = CGRectGetMinX(*(CGRect *)(&v80 - 1));
      v116.origin.x = v84;
      v116.origin.y = v85;
      v116.size.width = v86;
      v116.size.height = v87;
      v95 = CGRectGetMaxX(v116) - v91;
      if (v95 >= v88)
        v95 = v88;
      if (MinX < v95)
        MinX = v95;
      v117.origin.x = v84;
      v117.origin.y = v85;
      v117.size.width = v86;
      v117.size.height = v87;
      MinY = CGRectGetMinY(v117);
      v118.origin.x = v84;
      v118.origin.y = v85;
      v118.size.width = v86;
      v118.size.height = v87;
      v97 = CGRectGetMaxY(v118) - v110;
      if (v97 >= v89)
        v97 = v89;
      if (MinY >= v97)
        v98 = MinY;
      else
        v98 = v97;
      rect.origin.x = MinX;
      rect.origin.y = v98;
      rect.size.width = v91;
      rect.size.height = v110;
      FigCFDictionarySetCGRect();
    }
    else
    {
      DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v51);
      CMSetAttachment(v115, (CFStringRef)*MEMORY[0x1E0D05D08], DictionaryRepresentation, 1u);
      if (DictionaryRepresentation)
        CFRelease(DictionaryRepresentation);
    }
  }
  self->_lastStabilizingEnabled = v43;
  self->_appliedTranslation = (CGPoint)v113;
  v100 = v71[347];

  *(Class *)((char *)&self->super.super.isa + v100) = (Class)v26;
LABEL_92:
  if (v115)
    CFRelease(v115);
  if (target)
    CFRelease(target);
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v101, v102);
}

- (BWPreviewStabilizationNode)initWithCameraInfoByPortType:(id)a3 forStillImagePreview:(BOOL)a4 updateFinalCropRectWithStabilizationShift:(BOOL)a5
{
  _BOOL4 v6;
  BWPreviewStabilizationNode *v8;
  BWPreviewStabilizationNode *v9;
  BWNodeInput *v10;
  BWNodeOutput *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  BWPreviewGyroStabilization *v24;
  BWRamp *v25;
  BWRamp *v26;
  BOOL v28;
  _BOOL4 v29;
  BWPreviewStabilizationNode *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v6 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)BWPreviewStabilizationNode;
  v8 = -[BWNode init](&v35, sel_init);
  v9 = v8;
  if (a3)
  {
    if (!v8)
      return v9;
    v28 = a5;
    v29 = v6;
    v10 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v8);
    -[BWNodeInput setFormatRequirements:](v10, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v10, "setPassthroughMode:", 1);
    -[BWNode addInput:](v9, "addInput:", v10);
    v11 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v9);
    -[BWNodeOutput setFormatRequirements:](v11, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutput setPassthroughMode:](v11, "setPassthroughMode:", 1);
    v30 = v9;
    -[BWNode addOutput:](v9, "addOutput:", v11);
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = (void *)objc_msgSend(a3, "allKeys");
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      v17 = *MEMORY[0x1E0D05968];
      v18 = *MEMORY[0x1E0D058B8];
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v22 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v20), "objectForKeyedSubscript:", v17);
          if (!v22
            || (objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v17),
                (v23 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v20), "objectForKeyedSubscript:", v18)) == 0))
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            v9 = v30;
            goto LABEL_15;
          }
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, v18);
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, v20);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v15)
          continue;
        break;
      }
    }
    v24 = -[BWPreviewGyroStabilization initForStillImagePreview:]([BWPreviewGyroStabilization alloc], "initForStillImagePreview:", v29);
    v9 = v30;
    v30->_previewStabilization = v24;
    if (v24)
    {
      v30->_staticParametersByPortType = (NSDictionary *)v12;
      v30->_updateFinalCropRectWithStabilizationShift = v28;
      v30->_stabilizeFallbackCamera = 1;
      v30->_stabilizationEnterRampFrameCount = 50;
      v30->_stabilizationExitRampFrameCount = 25;
      v30->_stabilizationCameraFallbackRampFrameCount = 7;
      v30->_enableStabilizationTransitionRamps = 1;
      v30->_stabilizationCameraFallbackRampEnabled = 1;
      v25 = [BWRamp alloc];
      v30->_stabilizationTransitionRamp = -[BWRamp initWithName:](v25, "initWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("StabilizationTransitionRamp")));
      v26 = [BWRamp alloc];
      v30->_stabilizationCameraFallbackRamp = -[BWRamp initWithName:](v26, "initWithName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("StabilizationCameraFallbackRamp")));
      v30->_isStillImagePreview = v29;
      return v9;
    }
    fig_log_get_emitter();
  }
  else
  {
    fig_log_get_emitter();
  }
  FigDebugAssert3();
LABEL_15:

  return 0;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPreviewStabilizationNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("PreviewStabilization");
}

@end
