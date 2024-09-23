@implementation BWMeteorHeadroomNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWMeteorHeadroomNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4
{
  BWMeteorHeadroomNode *v5;
  NSDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BWNodeInput *v11;
  BWVideoFormatRequirements *v12;
  void *v13;
  BWNodeOutput *v14;
  BWVideoFormatRequirements *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)BWMeteorHeadroomNode;
  v5 = -[BWNode init](&v21, sel_init, a3);
  if (v5)
  {
    if (a4)
    {
      v6 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a4, "count"));
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v18;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(a4);
            -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10)), "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("MeteorHeadroom")), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10));
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v8);
      }
      v5->_meteorHeadroomParametersByPortType = v6;
    }
    v11 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v5);
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E4A00800);
    objc_msgSend(v13, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, 3));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v12, "setSupportedPixelFormats:", v13);
    -[BWNodeInput setFormatRequirements:](v11, "setFormatRequirements:", v12);

    -[BWNodeInput setPassthroughMode:](v11, "setPassthroughMode:", 1);
    -[BWNode addInput:](v5, "addInput:", v11);
    v14 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v5);
    v15 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutput setFormatRequirements:](v14, "setFormatRequirements:", v15);

    -[BWNodeOutput setPassthroughMode:](v14, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v5, "addOutput:", v14);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BWMeteorHeadroomNode _releaseResources]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWMeteorHeadroomNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_releaseResources
{
  if (a1)
  {

    *(_QWORD *)(a1 + 128) = 0;
    *(_QWORD *)(a1 + 120) = 0;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  -[BWMeteorHeadroomNode _releaseResources]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWMeteorHeadroomNode;
  -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v3;
  FigMetalContext *v4;
  FigMetalHistogram *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWMeteorHeadroomNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v6, sel_prepareForCurrentConfigurationToBecomeLive);
  if (!self->_metalContext
    && ((v3 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class())) == 0
     || (v4 = (FigMetalContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B28]), "initWithbundle:andOptionalCommandQueue:", v3, 0), (self->_metalContext = v4) == 0))|| !self->_histogram&& (v5 = -[FigMetalHistogram initWithMetalContext:]([FigMetalHistogram alloc], "initWithMetalContext:", self->_metalContext), (self->_histogram = v5) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  void *v7;
  const void *AttachedMedia;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  double v13;
  float lastMeteorHeadroom;
  unsigned int v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  opaqueCMSampleBuffer *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v28;
  double v29;
  double y;
  double v31;
  double v32;
  size_t Width;
  size_t Height;
  uint64_t v35;
  float32x4_t v36;
  float v37;
  uint64_t i;
  float32x4_t v39;
  float v40;
  double v41;
  CVImageBufferRef v42;
  __CVBuffer *v43;
  uint64_t v44;
  size_t v45;
  size_t v46;
  FigMetalHistogram *histogram;
  float v48;
  float v49;
  id v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  uint64_t v65;
  int32x4_t v66;
  uint64_t v67;
  int v68;
  float v69;
  float32x4_t v70;
  int v71;
  void *v72;
  uint64_t v73;
  float v74;
  float v75;
  float v76;
  uint64_t v77;
  float v78;
  float32x4_t v79;
  float v80;
  float v81;
  BOOL v82;
  float v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  uint64_t v94;
  uint64_t v95;
  CGFloat x;
  double v97;
  float v98;
  float v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[336];
  _QWORD v133[7];
  _QWORD v134[7];
  const __CFString *v135;
  const __CFString *v136;
  const __CFString *v137;
  const __CFString *v138;
  const __CFString *v139;
  const __CFString *v140;
  const __CFString *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;

  v149 = *MEMORY[0x1E0C80C00];
  v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B0F8);
  v9 = (void *)CMGetAttachment(a3, CFSTR("StillImageSettings"), 0);
  v10 = (void *)objc_msgSend(v9, "captureRequestIdentifier");
  v11 = (void *)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
  v12 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
  lastMeteorHeadroom = 0.0;
  if ((v12 & 1) != 0)
    goto LABEL_86;
  v15 = v12;
  if (!-[NSString isEqualToString:](self->_lastCaptureRequestIdentifier, "isEqualToString:", v10))
  {

    self->_lastCaptureRequestIdentifier = (NSString *)objc_msgSend(v10, "copy");
    self->_lastMeteorHeadroom = 0.0;
  }
  if (((v16 = objc_msgSend(v11, "captureType"), objc_msgSend(v11, "captureType") == 10)
     || objc_msgSend(v11, "captureType") == 12)
    && (objc_msgSend(v11, "captureFlags") & 0x100000) != 0)
  {
    v17 = ((unint64_t)objc_msgSend(v11, "sceneFlags") >> 2) & 1;
  }
  else
  {
    LODWORD(v17) = 0;
  }
  v18 = objc_msgSend(v11, "captureFlags") & 0x800;
  if (self->_gainMapMainImageDownscalingFactor != 0.0 && v18 == 0)
  {
    v20 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E4936818);
    if (v20)
      LODWORD(v17) = 1;
  }
  else
  {
    v20 = 0;
  }
  if (v16 != 3 && !(_DWORD)v17)
    goto LABEL_86;
  if ((v15 & 0x40) != 0)
    lastMeteorHeadroom = self->_lastMeteorHeadroom;
  if (((lastMeteorHeadroom == 0.0) & (v15 >> 6)) == 0 && (v15 & 0x40) != 0)
    goto LABEL_86;
  v21 = *MEMORY[0x1E0C9D628];
  v22 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v23 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v24 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v25 = (double)objc_msgSend(v9, "outputWidth");
  v26 = v25 / (double)objc_msgSend(v9, "outputHeight");
  if (v20)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(v20);
    if (ImageBuffer)
    {
      v28 = ImageBuffer;
      v150.origin.x = v21;
      v150.origin.y = v22;
      v150.size.width = v23;
      v150.size.height = v24;
      v97 = v26;
      if (CGRectIsNull(v150))
      {
        v29 = v21;
        y = v22;
        v31 = v23;
        v32 = v24;
      }
      else
      {
        Width = CVPixelBufferGetWidth(v28);
        Height = CVPixelBufferGetHeight(v28);
        v151.origin.x = FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRectForAttachedMedia(Width, Height, v21, v22, v23, v24, v26, self->_gainMapMainImageDownscalingFactor);
        y = v151.origin.y;
        v31 = v151.size.width;
        v32 = v151.size.height;
        x = v151.origin.x;
        if (CGRectIsNull(v151))
        {
          fig_log_get_emitter();
          v95 = v4;
          LODWORD(v94) = 0;
          goto LABEL_91;
        }
        v29 = x;
      }
      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      if (-[FigMetalHistogram singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:](self->_histogram, "singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:", v28, &v100, v29, y, v31, v32))
      {
        goto LABEL_86;
      }
      v35 = 0;
      LODWORD(v13) = 0;
      do
      {
        v36 = vcvtq_f32_u32(*(uint32x4_t *)((char *)&v100 + v35));
        *(float *)&v13 = (float)((float)((float)(*(float *)&v13 + v36.f32[0]) + v36.f32[1]) + v36.f32[2]) + v36.f32[3];
        v35 += 16;
      }
      while (v35 != 1024);
      if (*(float *)&v13 == 0.0)
        goto LABEL_86;
      v37 = 0.0;
      for (i = 768; i != 1024; i += 16)
      {
        v39 = vcvtq_f32_u32(*(uint32x4_t *)((char *)&v100 + i));
        v37 = (float)((float)((float)(v37 + v39.f32[0]) + v39.f32[1]) + v39.f32[2]) + v39.f32[3];
      }
      v40 = v37 / *(float *)&v13;
      *(float *)&v13 = v37 / *(float *)&v13;
      CMSetAttachment(a3, CFSTR("MeteorPlusGainMapAverage"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13), 1u);
      if (AttachedMedia)
      {
        *(float *)&v41 = v40;
        CMSetAttachment(AttachedMedia, CFSTR("MeteorPlusGainMapAverage"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41), 1u);
      }
      v26 = v97;
    }
  }
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v42 = CMSampleBufferGetImageBuffer(a3);
  if (!v42)
    goto LABEL_86;
  v43 = v42;
  v44 = objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]);
  v152.origin.x = v21;
  v152.origin.y = v22;
  v152.size.width = v23;
  v152.size.height = v24;
  if (!CGRectIsNull(v152))
  {
    v45 = CVPixelBufferGetWidth(v43);
    v46 = CVPixelBufferGetHeight(v43);
    FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(v45, v46, v21, v22, v23, v24, v26);
    v21 = v153.origin.x;
    v22 = v153.origin.y;
    v23 = v153.size.width;
    v24 = v153.size.height;
    if (CGRectIsNull(v153))
    {
      fig_log_get_emitter();
      v95 = v4;
      LODWORD(v94) = 0;
LABEL_91:
      FigDebugAssert3();
      goto LABEL_86;
    }
  }
  histogram = self->_histogram;
  if (self->_headroomProcessingType)
  {
    if (-[FigMetalHistogram singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:](histogram, "singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:", v43, &v100, v21, v22, v23, v24))
    {
      goto LABEL_86;
    }
  }
  else if (-[FigMetalHistogram singleComponentCPUHistogramInputPixelBuffer:validRect:subSampleX:subSampleY:outputHistogram:](histogram, "singleComponentCPUHistogramInputPixelBuffer:validRect:subSampleX:subSampleY:outputHistogram:", v43, 8, 8, &v100, v21, v22, v23, v24))
  {
    goto LABEL_86;
  }
  FigCaptureComputeImageGainFromMetadata();
  objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A20]), "floatValue");
  v49 = v48;
  v50 = -[NSDictionary objectForKeyedSubscript:](self->_meteorHeadroomParametersByPortType, "objectForKeyedSubscript:", objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  if (objc_msgSend(v50, "objectForKey:", CFSTR("minEIT_Threshold")))
  {
    objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("minEIT_Threshold")), "floatValue");
    v52 = v51;
  }
  else
  {
    v52 = 0.00045;
  }
  if (objc_msgSend(v50, "objectForKey:", CFSTR("maxEIT_Threshold")))
  {
    objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("maxEIT_Threshold")), "floatValue");
    v54 = v53;
  }
  else
  {
    v54 = 0.05;
  }
  if (objc_msgSend(v50, "objectForKey:", CFSTR("eitHeadroomGamma")))
  {
    objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("eitHeadroomGamma")), "floatValue");
    v56 = v55;
  }
  else
  {
    v56 = 0.1;
  }
  v57 = v49 * 0.0;
  v58 = 1.0;
  v59 = 1.0;
  if (objc_msgSend(v50, "objectForKey:", CFSTR("eitHeadroomReduction")))
  {
    objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("eitHeadroomReduction")), "floatValue");
    v59 = v60;
  }
  v61 = powf(v52, v56);
  v62 = powf(v57, v56);
  v63 = powf(v54, v56);
  if (v52 <= v57)
  {
    v58 = v59;
    if (v54 > v57)
      v58 = (float)(1.0 - (float)((float)(v62 - v61) / (float)(v63 - v61)))
          + (float)(v59 * (float)((float)(v62 - v61) / (float)(v63 - v61)));
  }
  if (v44)
  {
    if (objc_msgSend(v50, "objectForKey:", CFSTR("headroom1")))
      objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("headroom1")), "floatValue");
    else
      v64 = 1.0;
    self->_lastMeteorHeadroom = v58 * v64;
    v135 = CFSTR("version");
    v142 = &unk_1E49F9720;
    v136 = CFSTR("hasFaces");
    v143 = &unk_1E49F9720;
    v137 = CFSTR("headroom");
    v144 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v72 = (void *)MEMORY[0x1E0C99D80];
    v73 = 3;
  }
  else
  {
    v65 = 0;
    v66 = 0uLL;
    do
    {
      v66 = vaddq_s32(*(int32x4_t *)((char *)&v100 + v65), v66);
      v65 += 16;
    }
    while (v65 != 1024);
    v67 = 0;
    v68 = vaddvq_s32(v66);
    v69 = 0.0;
    do
    {
      v70 = vcvtq_f32_u32(*(uint32x4_t *)&v132[v67 + 200]);
      v69 = (float)((float)((float)(v69 + v70.f32[0]) + v70.f32[1]) + v70.f32[2]) + v70.f32[3];
      v67 += 16;
    }
    while (v67 != 128);
    if (objc_msgSend(v50, "objectForKey:", CFSTR("headroom2")))
      objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("headroom2")), "floatValue");
    else
      *(float *)&v71 = 1.5689;
    v98 = *(float *)&v71;
    v99 = v54;
    v74 = (float)v68;
    if (objc_msgSend(v50, "objectForKey:", CFSTR("headroom3")))
    {
      objc_msgSend((id)objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("headroom3")), "floatValue");
      v76 = v75;
    }
    else
    {
      v76 = 1.6864;
    }
    v77 = 0;
    v78 = 0.0;
    do
    {
      v79 = vcvtq_f32_u32(*(uint32x4_t *)&v132[v77]);
      v78 = (float)((float)((float)(v78 + v79.f32[0]) + v79.f32[1]) + v79.f32[2]) + v79.f32[3];
      v77 += 16;
    }
    while (v77 != 208);
    if ((float)(v69 / v74) <= 0.027536)
      v80 = v76;
    else
      v80 = v98;
    v81 = v78 / v74;
    v82 = v81 >= 0.0458 || v57 <= 0.013;
    v83 = fmaxf(v80 + -0.2, 0.0);
    if (v82)
      v83 = v80;
    self->_lastMeteorHeadroom = v58 * v83;
    v135 = CFSTR("version");
    v142 = &unk_1E49F9720;
    v136 = CFSTR("hasFaces");
    v143 = &unk_1E49F9738;
    v137 = CFSTR("h7");
    v144 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v138 = CFSTR("thresholds");
    v133[0] = CFSTR("h7_threshold");
    v134[0] = &unk_1E4A02E50;
    v133[1] = CFSTR("headroom2");
    *(float *)&v84 = v98;
    v134[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v84);
    v133[2] = CFSTR("headroom3");
    *(float *)&v85 = v76;
    v134[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v85);
    v133[3] = CFSTR("minEIT_Threshold");
    *(float *)&v86 = v52;
    v134[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v86);
    v133[4] = CFSTR("maxEIT_Threshold");
    *(float *)&v87 = v99;
    v134[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v87);
    v133[5] = CFSTR("eitHeadroomGamma");
    *(float *)&v88 = v56;
    v134[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v88);
    v133[6] = CFSTR("eitHeadroomReduction");
    *(float *)&v89 = v59;
    v134[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v89);
    v145 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, v133, 7);
    v139 = CFSTR("brightness");
    *(float *)&v90 = v57;
    v146 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v90);
    v140 = CFSTR("midHighlights");
    *(float *)&v91 = v81;
    v147 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v91);
    v141 = CFSTR("headroom");
    *(float *)&v92 = self->_lastMeteorHeadroom;
    v148 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v92);
    v72 = (void *)MEMORY[0x1E0C99D80];
    v73 = 7;
  }
  objc_msgSend(v72, "dictionaryWithObjects:forKeys:count:", &v142, &v135, v73);
  lastMeteorHeadroom = self->_lastMeteorHeadroom;
LABEL_86:
  *(float *)&v13 = lastMeteorHeadroom;
  CMSetAttachment(a3, CFSTR("MeteorHeadroom"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13, v94, v95), 1u);
  if (AttachedMedia)
  {
    *(float *)&v93 = lastMeteorHeadroom;
    CMSetAttachment(AttachedMedia, CFSTR("MeteorHeadroom"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v93), 1u);
  }
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
}

- (void)setGainMapMainImageDownscalingFactor:(float)a3
{
  self->_gainMapMainImageDownscalingFactor = a3;
}

- (float)gainMapMainImageDownscalingFactor
{
  return self->_gainMapMainImageDownscalingFactor;
}

- (void)setHeadroomProcessingType:(int)a3
{
  self->_headroomProcessingType = a3;
}

- (int)headroomProcessingType
{
  return self->_headroomProcessingType;
}

@end
