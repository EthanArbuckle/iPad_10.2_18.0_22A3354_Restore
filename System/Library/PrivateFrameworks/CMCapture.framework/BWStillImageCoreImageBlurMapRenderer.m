@implementation BWStillImageCoreImageBlurMapRenderer

+ (void)initialize
{
  objc_opt_class();
}

- (id)initForRenderingWithContext:(id)a3 hairnetEnabled:(BOOL)a4
{
  BWStillImageCoreImageBlurMapRenderer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWStillImageCoreImageBlurMapRenderer;
  v6 = -[BWStillImageCoreImageBlurMapRenderer init](&v8, sel_init);
  if (v6)
  {
    v6->_ciContext = (CIContext *)a3;
    v6->_hairnetEnabled = a4;
    v6->_blurMapFilter = (CIFilter *)(id)objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIDepthEffectMakeBlurMap"));
  }
  return v6;
}

- (void)dealloc
{
  opaqueCMFormatDescription *blurredGainMapFormatDescription;
  objc_super v4;

  blurredGainMapFormatDescription = self->_blurredGainMapFormatDescription;
  if (blurredGainMapFormatDescription)
    CFRelease(blurredGainMapFormatDescription);

  v4.receiver = self;
  v4.super_class = (Class)BWStillImageCoreImageBlurMapRenderer;
  -[BWStillImageCoreImageBlurMapRenderer dealloc](&v4, sel_dealloc);
}

- (void)setRenderBlurMapToCVPixelBuffer:(BOOL)a3
{
  self->_renderBlurMapToCVPixelBuffer = a3;
  if (!a3)
  {

    self->_blurMapPixelBufferPool = 0;
  }
}

- (signed)type
{
  return 4;
}

- (NSString)displayName
{
  return (NSString *)CFSTR("Core Image Blur Map Renderer");
}

- (BOOL)supportsAnimation
{
  return 0;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  int result;

  result = objc_msgSend(a3, "prepareForRenderingWithInputVideoFormat:", a4);
  if (!result)
  {
    if (a4)
    {
      if (self->_renderBlurMapToCVPixelBuffer && !self->_blurMapPixelBufferPool)
        -[BWStillImageCoreImageBlurMapRenderer _allocateBlurMapPixelBufferPoolForBuffersOfWidth:height:](self, "_allocateBlurMapPixelBufferPoolForBuffersOfWidth:height:", (unint64_t)objc_msgSend(a4, "width") >> 1, (unint64_t)objc_msgSend(a4, "height") >> 1);
      return 0;
    }
    else
    {
      return -12780;
    }
  }
  return result;
}

- (int)_allocateBlurMapPixelBufferPoolForBuffersOfWidth:(unint64_t)a3 height:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  BWVideoFormatRequirements *v8;
  id v9;
  BWPixelBufferPool *v10;
  BWVideoFormatRequirements *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  if (!self->_blurMapPixelBufferPool)
  {
    if (self->_hairnetEnabled)
      v6 = 1380411457;
    else
      v6 = 843264104;
    v13[0] = *MEMORY[0x1E0CA90E0];
    v14[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
    v13[1] = *MEMORY[0x1E0CA8FD8];
    v14[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
    v13[2] = *MEMORY[0x1E0CA9040];
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v13[3] = *MEMORY[0x1E0CA8FF0];
    v14[2] = v7;
    v14[3] = MEMORY[0x1E0C9AA70];
    v8 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
    v12 = v8;
    v9 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1));

    v10 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v9, 1, CFSTR("Still Image Core Image Blur Map Pool"), +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"));
    self->_blurMapPixelBufferPool = v10;
    if (!v10)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  return 0;
}

- (int)_allocateBlurredGainMapPixleBufferPoolForBuffersOfWidth:(unint64_t)a3 height:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BWVideoFormatRequirements *v9;
  id v10;
  BWPixelBufferPool *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BWVideoFormatRequirements *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  if (!self->_blurredGainMapPixelBufferPool)
  {
    v19[0] = *MEMORY[0x1E0CA90E0];
    v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
    v19[1] = *MEMORY[0x1E0CA8FD8];
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
    v7 = *MEMORY[0x1E0CA9040];
    v20[1] = v6;
    v20[2] = &unk_1E49F81A8;
    v8 = *MEMORY[0x1E0CA8FF0];
    v19[2] = v7;
    v19[3] = v8;
    v20[3] = MEMORY[0x1E0C9AA70];
    v9 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
    v18 = v9;
    v10 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1));

    v16 = *MEMORY[0x1E0CA8C68];
    v14 = *MEMORY[0x1E0CA8E98];
    v15 = *MEMORY[0x1E0CA8EB8];
    v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    LOBYTE(v13) = 0;
    v11 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:additionalPixelBufferAttributes:providesBackPressure:reportSlowBackPressureAllocations:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:additionalPixelBufferAttributes:providesBackPressure:reportSlowBackPressureAllocations:", v10, 1, CFSTR("Still Image Core Image Blurred Gain Map Pool"), +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1), 0, v13);
    self->_blurredGainMapPixelBufferPool = v11;
    if (!v11)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  return 0;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  void (**v8)(id, _QWORD, id);
  id v10;
  int v11;
  CGImageMetadata *AuxiliaryImagePropertiesFromGainMapSampleBuffer;
  __CVBuffer *v13;
  id v14;
  __CVBuffer *v15;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v18;
  CFTypeRef v19;
  const __CFString *v20;
  CFTypeRef v21;
  BOOL v22;
  CFTypeRef v23;
  CFTypeRef v24;
  uint64_t *v25;
  uint64_t v26;
  CVImageBufferRef ImageBuffer;
  uint64_t v28;
  opaqueCMSampleBuffer *v29;
  CVImageBufferRef v30;
  opaqueCMSampleBuffer *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  opaqueCMSampleBuffer *v43;
  uint64_t v44;
  void *AttachedInference;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  BOOL v55;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  float64x2_t *v62;
  int v63;
  float64x2_t v64;
  uint64_t v65;
  float64x2_t v66;
  double *v67;
  float64x2_t *v68;
  int v69;
  float64x2_t v70;
  uint64_t v71;
  float64x2_t v72;
  float64x2_t *v73;
  int v74;
  uint64_t v75;
  float64x2_t v76;
  uint64_t v77;
  float64x2_t v78;
  double *v79;
  opaqueCMSampleBuffer *v80;
  uint64_t v81;
  double *v82;
  uint64_t v83;
  double v84;
  unsigned int v85;
  double v86;
  double v87;
  double v88;
  uint64_t v89;
  __CFDictionary *ExifAuxRegionsDictForSampleBuffer;
  void *v91;
  uint64_t v92;
  double *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  float v104;
  double v105;
  float v106;
  double v107;
  float v108;
  double v109;
  float v110;
  double v111;
  double v112;
  double v113;
  double v115;
  BOOL v116;
  double v117;
  double v118;
  CIImage *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  __CVBuffer *v124;
  __CVBuffer *v125;
  size_t Width;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  int v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  int CopyWithNewPixelBuffer;
  const void *v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t j;
  uint64_t v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  CFTypeRef v153;
  const __CFString *key;
  void *context;
  CVImageBufferRef v157;
  uint64_t v158;
  CGImageMetadata *value;
  uint64_t v161;
  CVImageBufferRef v162;
  unsigned int v163;
  void *v164;
  unsigned int v165;
  id obj;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  CFTypeRef cf;
  id v172;
  _BYTE v173[128];
  _QWORD v174[3];
  _QWORD v175[3];
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  CGImageMetadata *v179;
  _QWORD v180[3];
  _QWORD v181[3];
  float64x2_t v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  _BYTE v187[32];
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  CGImageMetadata *v194;
  _QWORD v195[2];
  _QWORD v196[2];
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  _OWORD v203[8];
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  uint64_t v208;
  CGRect v209;

  v8 = (void (**)(id, _QWORD, id))a8;
  v10 = 0;
  v208 = *MEMORY[0x1E0C80C00];
  cf = 0;
  v172 = 0;
  v11 = -12780;
  if (a4 && a5)
  {
    value = 0;
    AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
    v13 = 0;
    v14 = 0;
    obj = 0;
    v15 = 0;
    if (a8)
    {
      obj = objc_alloc_init(MEMORY[0x1E0C99E08]);
      context = (void *)MEMORY[0x1A858DD40]();
      AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, (uint64_t)CFSTR("Depth"));
      v18 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, 0x1E495AF38);
      v19 = CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E0D087A0], 0);
      v20 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v21 = CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      if (v21)
        v22 = v19 == 0;
      else
        v22 = 1;
      if (v22)
        goto LABEL_70;
      v23 = v21;
      key = v20;
      v24 = CMGetAttachment(a5, CFSTR("StillSettings"), 0);
      if (!v24)
        goto LABEL_70;
      v152 = (void *)v24;
      v153 = v19;
      v164 = (void *)v23;
      if (AttachedMedia)
        AttachedMedia = CMSampleBufferGetImageBuffer(AttachedMedia);
      v25 = (uint64_t *)MEMORY[0x1E0C9E0F8];
      v26 = MEMORY[0x1E0C9AAB0];
      if (v18)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(v18);
        v201 = *v25;
        v202 = v26;
        v157 = ImageBuffer;
        v28 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", ImageBuffer, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v202, &v201, 1));
      }
      else
      {
        v28 = 0;
        v157 = 0;
      }
      v29 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, (uint64_t)CFSTR("PersonSemanticsHair"));
      v30 = v29 ? CMSampleBufferGetImageBuffer(v29) : 0;
      v31 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, (uint64_t)CFSTR("PersonSemanticsGlasses"));
      v162 = v31 ? CMSampleBufferGetImageBuffer(v31) : 0;
      v199 = *v25;
      v32 = v199;
      v200 = v26;
      v33 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", a4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v200, &v199, 1));
      v151 = *MEMORY[0x1E0C9E1F8];
      objc_msgSend(obj, "setObject:forKeyedSubscript:", v33);
      v158 = v32;
      if (v157)
      {
        v197 = v32;
        v198 = v26;
        v34 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v157, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v198, &v197, 1));
      }
      else
      {
        v34 = 0;
      }
      objc_msgSend(obj, "setObject:forKeyedSubscript:", v34, CFSTR("inputMatteImage"));
      v35 = (void *)CMGetAttachment(a5, (CFStringRef)*MEMORY[0x1E0D086F0], 0);
      value = FigCaptureMetadataUtilitiesCreateAuxiliaryImagePropertiesFromDepthMetadata(v35);
      if (value)
      {
        v36 = objc_alloc(NSClassFromString(CFSTR("AVDepthData")));
        v37 = (id)objc_msgSend(v36, "performSelector:withObject:withObject:", NSSelectorFromString(CFSTR("initWithPixelBuffer:depthMetadataDictionary:")), AttachedMedia, v35);
        if (v37)
        {
          v150 = v28;
          v38 = (void *)MEMORY[0x1E0C9DDC8];
          v39 = *MEMORY[0x1E0C9E0A0];
          v196[0] = v37;
          v40 = *MEMORY[0x1E0C9E140];
          v195[0] = v39;
          v147 = v40;
          v195[1] = v40;
          v146 = *MEMORY[0x1E0CBC6D0];
          v193 = *MEMORY[0x1E0CBC6D0];
          v194 = value;
          v196[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
          objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(v38, "imageWithCVPixelBuffer:options:", AttachedMedia, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v196, v195, 2)), CFSTR("inputShiftmapImage"));
          objc_msgSend(obj, "setObject:forKeyedSubscript:", value, CFSTR("inputAuxDataMetadata"));
          if (v30)
          {
            v191 = v32;
            v41 = MEMORY[0x1E0C9AAB0];
            v192 = MEMORY[0x1E0C9AAB0];
            v42 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v30, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v192, &v191, 1));
            v43 = a5;
          }
          else
          {
            v42 = 0;
            v43 = a5;
            v41 = MEMORY[0x1E0C9AAB0];
          }
          objc_msgSend(obj, "setObject:forKeyedSubscript:", v42, CFSTR("inputHairImage"));
          if (v162)
          {
            v189 = v32;
            v190 = v41;
            v44 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v162, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v190, &v189, 1));
          }
          else
          {
            v44 = 0;
          }
          objc_msgSend(obj, "setObject:forKeyedSubscript:", v44, CFSTR("inputGlassesImage"));
          objc_msgSend(obj, "setObject:forKeyedSubscript:", &unk_1E49F81C0, CFSTR("inputScale"));
          v148 = *MEMORY[0x1E0D08360];
          objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(v35, "objectForKeyedSubscript:"), CFSTR("inputAperture"));
          AttachedInference = (void *)BWInferenceGetAttachedInference(v43, 801, 0x1E4951058);
          v163 = objc_msgSend((id)objc_msgSend(v164, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]), "intValue");
          v149 = v35;
          if (objc_msgSend(AttachedInference, "count") >= 5)
          {
            fig_log_get_emitter();
            v145 = v161;
            LODWORD(v144) = 0;
            FigDebugAssert3();
          }
          else
          {
            v206 = 0u;
            v207 = 0u;
            v204 = 0u;
            v205 = 0u;
            v46 = objc_msgSend(AttachedInference, "countByEnumeratingWithState:objects:count:", &v204, v203, 16);
            if (v46)
            {
              v47 = v46;
              v165 = 0;
              v48 = *(_QWORD *)v205;
              do
              {
                for (i = 0; i != v47; ++i)
                {
                  if (*(_QWORD *)v205 != v48)
                    objc_enumerationMutation(AttachedInference);
                  v50 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * i);
                  v51 = (void *)objc_msgSend((id)objc_msgSend(v50, "landmarks"), "leftEye");
                  v52 = (void *)objc_msgSend((id)objc_msgSend(v50, "landmarks"), "rightEye");
                  v53 = (void *)objc_msgSend((id)objc_msgSend(v50, "landmarks"), "nose");
                  v54 = objc_msgSend((id)objc_msgSend(v50, "landmarks"), "allPoints");
                  if (v51)
                    v55 = v52 == 0;
                  else
                    v55 = 1;
                  if (!v55 && v53 != 0)
                  {
                    v57 = (void *)v54;
                    if (objc_msgSend(v51, "pointCount"))
                    {
                      if (objc_msgSend(v52, "pointCount")
                        && objc_msgSend(v53, "pointCount")
                        && objc_msgSend(v57, "pointCount") == 65
                        && objc_msgSend(v51, "normalizedPoints")
                        && objc_msgSend(v52, "normalizedPoints")
                        && objc_msgSend(v53, "normalizedPoints")
                        && objc_msgSend(v57, "normalizedPoints"))
                      {
                        objc_msgSend(v50, "boundingBox");
                        *(_QWORD *)&v183 = v58;
                        *((_QWORD *)&v183 + 1) = v59;
                        *(_QWORD *)&v184 = v60;
                        *((_QWORD *)&v184 + 1) = v61;
                        v62 = (float64x2_t *)objc_msgSend(v51, "normalizedPoints");
                        v63 = objc_msgSend(v51, "pointCount");
                        v64 = 0uLL;
                        if (v63 >= 1)
                        {
                          v65 = v63;
                          do
                          {
                            v66 = *v62++;
                            v64 = vaddq_f64(v64, v66);
                            --v65;
                          }
                          while (v65);
                        }
                        v182 = vdivq_f64(v64, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)v63), 0));
                        v67 = (double *)&v187[64 * (unint64_t)v165];
                        sicibmr_landmarkToC0(v163, v182.f64, (double *)&v183, v67 + 2);
                        v68 = (float64x2_t *)objc_msgSend(v52, "normalizedPoints");
                        v69 = objc_msgSend(v52, "pointCount");
                        v70 = 0uLL;
                        if (v69 >= 1)
                        {
                          v71 = v69;
                          do
                          {
                            v72 = *v68++;
                            v70 = vaddq_f64(v70, v72);
                            --v71;
                          }
                          while (v71);
                        }
                        v182 = vdivq_f64(v70, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)v69), 0));
                        sicibmr_landmarkToC0(v163, v182.f64, (double *)&v183, v67 + 4);
                        v73 = (float64x2_t *)objc_msgSend(v53, "normalizedPoints");
                        v74 = objc_msgSend(v53, "pointCount");
                        if (v74 < 1)
                        {
                          v76 = 0uLL;
                          v77 = v165;
                        }
                        else
                        {
                          v75 = v74;
                          v76 = 0uLL;
                          v77 = v165;
                          do
                          {
                            v78 = *v73++;
                            v76 = vaddq_f64(v76, v78);
                            --v75;
                          }
                          while (v75);
                        }
                        v182 = vdivq_f64(v76, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)v74), 0));
                        v79 = (double *)&v187[64 * v77];
                        sicibmr_landmarkToC0(v163, v182.f64, (double *)&v183, v79);
                        v182 = *(float64x2_t *)(objc_msgSend(v57, "normalizedPoints") + 736);
                        sicibmr_landmarkToC0(v163, v182.f64, (double *)&v183, v79 + 6);
                        ++v165;
                      }
                    }
                  }
                }
                v47 = objc_msgSend(AttachedInference, "countByEnumeratingWithState:objects:count:", &v204, v203, 16);
              }
              while (v47);
              v80 = a5;
              if (v165)
              {
                v81 = 0;
                memset(v203, 0, 64);
                v206 = 0u;
                v207 = 0u;
                v204 = 0u;
                v205 = 0u;
                v185 = 0u;
                v186 = 0u;
                v183 = 0u;
                v184 = 0u;
                v82 = (double *)&v188;
                memset(&v182, 0, 64);
                do
                {
                  v83 = 8 * v81;
                  v84 = *(v82 - 1);
                  *(double *)((char *)v203 + v83) = *(v82 - 2);
                  v85 = v81 + 1;
                  *((double *)v203 + v85) = 1.0 - v84;
                  v86 = v82[1];
                  *(double *)((char *)&v204 + v83) = *v82;
                  *((double *)&v204 + v85) = 1.0 - v86;
                  v87 = v82[3];
                  v182.f64[(unint64_t)v83 / 8] = v82[2];
                  v182.f64[v85] = 1.0 - v87;
                  v88 = *(v82 - 3);
                  *(double *)((char *)&v183 + v83) = *(v82 - 4);
                  *((double *)&v183 + v85) = 1.0 - v88;
                  v81 += 2;
                  v82 += 8;
                }
                while (2 * v165 != v81);
                v89 = 2 * v165;
                objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithValues:count:", v203, v89, 1.0), CFSTR("inputLeftEyePosition"));
                objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithValues:count:", &v204, v89), CFSTR("inputRightEyePosition"));
                objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithValues:count:", &v182, v89), CFSTR("inputChinPosition"));
                objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithValues:count:", &v183, v89), CFSTR("inputFaceMidPoint"));
              }
LABEL_76:
              ExifAuxRegionsDictForSampleBuffer = FigCaptureMetadataUtiliesCreateExifAuxRegionsDictForSampleBuffer(v80, 1);
              v91 = (void *)-[__CFDictionary objectForKeyedSubscript:](ExifAuxRegionsDictForSampleBuffer, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCAC8]);
              v204 = 0u;
              v205 = 0u;
              v206 = 0u;
              v207 = 0u;
              v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v204, v203, 16);
              v93 = (double *)MEMORY[0x1E0C9D628];
              if (v92)
              {
                v94 = v92;
                v95 = *(_QWORD *)v205;
                v96 = *MEMORY[0x1E0CBCAD0];
                v97 = *MEMORY[0x1E0CBCAB8];
LABEL_78:
                v98 = 0;
                while (1)
                {
                  if (*(_QWORD *)v205 != v95)
                    objc_enumerationMutation(v91);
                  v99 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * v98);
                  if ((objc_msgSend((id)objc_msgSend(v99, "objectForKeyedSubscript:", v96, v144, v145), "isEqualToString:", v97) & 1) != 0)break;
                  if (v94 == ++v98)
                  {
                    v94 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v204, v203, 16);
                    if (v94)
                      goto LABEL_78;
                    goto LABEL_98;
                  }
                }
                if (!v99)
                  goto LABEL_98;
                v100 = (void *)objc_msgSend(v99, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCAE0]);
                v101 = (void *)objc_msgSend(v99, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCAE8]);
                v102 = (void *)objc_msgSend(v99, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCAD8]);
                v103 = (void *)objc_msgSend(v99, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCAC0]);
                objc_msgSend(v100, "floatValue");
                v105 = v104;
                objc_msgSend(v101, "floatValue");
                v107 = v106;
                objc_msgSend(v102, "floatValue");
                v109 = v108;
                objc_msgSend(v103, "floatValue");
                v111 = v110;
                v112 = v110 * 0.5;
                v113 = v107 - v112;
                if (vabdd_f64(v105, v109 * 0.5) <= 0.0001 && v105 - v109 * 0.5 < 0.0)
                  v115 = 0.0;
                else
                  v115 = v105 - v109 * 0.5;
                v116 = vabdd_f64(v107, v112) <= 0.0001 && v113 < 0.0;
                v117 = 1.0;
                if (!v116)
                  v117 = 1.0 - v113;
                v118 = fmax(v117 - v111, 0.0);
              }
              else
              {
LABEL_98:
                v115 = *v93;
                v118 = v93[1];
                v109 = v93[2];
                v111 = v93[3];
              }
              v209.origin.x = v115;
              v209.origin.y = v118;
              v209.size.width = v109;
              v209.size.height = v111;
              if (!CGRectIsNull(v209))
                objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", v115, v118, v109, v111), CFSTR("inputFocusRect"));

              -[CIFilter setValuesForKeysWithDictionary:](self->_blurMapFilter, "setValuesForKeysWithDictionary:", obj);
              v119 = -[CIFilter outputImage](self->_blurMapFilter, "outputImage");
              if (self->_renderBlurMapToCVPixelBuffer)
              {
                v15 = -[BWPixelBufferPool newPixelBuffer](self->_blurMapPixelBufferPool, "newPixelBuffer");
                if (!v15)
                {
                  AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
                  v13 = 0;
                  v14 = 0;
                  goto LABEL_156;
                }
                sicibmr_renderToPixelBuffer(self->_ciContext, (uint64_t)v119, v15, &v172);
                if (v172)
                {
                  v120 = v172;
                  AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
                  v13 = 0;
                  v14 = 0;
LABEL_128:
                  v11 = 0;
                  goto LABEL_129;
                }
              }
              else
              {
                v15 = 0;
              }
              v121 = (void *)BWSampleBufferGetAttachedMedia(a5, 0x1E4936818);
              v122 = (void *)CMGetAttachment(v121, key, 0);
              if (!v122
                || (v123 = v122,
                    objc_msgSend((id)objc_msgSend(v122, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F08]), "intValue") < 0x20000))
              {
                AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
                v13 = 0;
                v14 = 0;
                goto LABEL_122;
              }
              v124 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v121);
              v125 = v124;
              if (!self->_blurredGainMapPixelBufferPool)
              {
                Width = CVPixelBufferGetWidth(v124);
                -[BWStillImageCoreImageBlurMapRenderer _allocateBlurredGainMapPixleBufferPoolForBuffersOfWidth:height:](self, "_allocateBlurredGainMapPixleBufferPoolForBuffersOfWidth:height:", Width, CVPixelBufferGetHeight(v125));
              }
              v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              v127 = (void *)objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIDepthEffectApplyBlurMap"));
              objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a5, CFSTR("StillSettings"), 0), "captureSettings"), "captureFlags");
              AuxiliaryImagePropertiesFromGainMapSampleBuffer = FigCaptureMetadataUtilitiesCreateAuxiliaryImagePropertiesFromGainMapSampleBuffer(v123);
              if (!AuxiliaryImagePropertiesFromGainMapSampleBuffer)
                AuxiliaryImagePropertiesFromGainMapSampleBuffer = CGImageMetadataCreateMutable();
              v128 = (void *)MEMORY[0x1E0C9DDC8];
              v181[0] = MEMORY[0x1E0C9AAB0];
              v129 = *MEMORY[0x1E0C9E110];
              v180[0] = v158;
              v180[1] = v129;
              v181[1] = objc_msgSend(MEMORY[0x1E0C99E38], "null", v144);
              v180[2] = v147;
              v178 = v146;
              v179 = AuxiliaryImagePropertiesFromGainMapSampleBuffer;
              v181[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
              v130 = (void *)objc_msgSend(v128, "imageWithCVPixelBuffer:options:", v125, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v181, v180, 3));
              v131 = BWCIFilterArrayContainsPortraitEffectStageFilters((void *)objc_msgSend((id)objc_msgSend(v152, "requestedSettings"), "processedImageFilters"), 0);
              if (v157 && v131)
              {
                v176 = v158;
                v177 = MEMORY[0x1E0C9AAB0];
                v132 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v157, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1));
                v130 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C9DD70], "componentMultiply"), "applyWithForeground:background:", v132, v130);
              }
              objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v130, "imageByApplyingFilter:", CFSTR("CISRGBToneCurveToLinear")), v151);
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v119, CFSTR("inputBlurMap"));
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v130, CFSTR("inputGainMap"));
              objc_msgSend(v14, "setObject:forKeyedSubscript:", value, CFSTR("inputAuxDataMetadata"));
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v150, CFSTR("inputMatteImage"));
              objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(v149, "objectForKeyedSubscript:", v148), CFSTR("inputAperture"));
              if (objc_msgSend((id)objc_msgSend(v127, "inputKeys"), "containsObject:", CFSTR("inputBestHairQuality")))objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("inputBestHairQuality"));
              objc_msgSend(v14, "setObject:forKeyedSubscript:", v153, CFSTR("inputLumaNoiseScale"));
              objc_msgSend(v127, "setValuesForKeysWithDictionary:", v14);
              v13 = -[BWPixelBufferPool newPixelBuffer](self->_blurredGainMapPixelBufferPool, "newPixelBuffer");
              if (v13)
              {
                v133 = (void *)objc_msgSend(v127, "outputImage");
                v174[0] = CFSTR("inputRVector");
                v175[0] = objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
                v174[1] = CFSTR("inputGVector");
                v175[1] = objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
                v174[2] = CFSTR("inputBVector");
                v175[2] = objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 1.0, 0.0, 0.0, 0.0);
                v134 = objc_msgSend(v133, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v175, v174, 3));
                CVBufferSetAttachment(v13, CFSTR("CVImageBufferTransferFunction"), (CFTypeRef)*MEMORY[0x1E0CA8EE0], kCVAttachmentMode_ShouldPropagate);
                sicibmr_renderToPixelBuffer(self->_ciContext, v134, v13, &v172);
                if (v172)
                {
                  v143 = v172;
                  goto LABEL_128;
                }
                CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)v121, v13, (CFTypeRef *)&self->_blurredGainMapFormatDescription, (CMSampleBufferRef *)&cf);
                if (CopyWithNewPixelBuffer)
                {
                  v11 = CopyWithNewPixelBuffer;
                  goto LABEL_129;
                }
LABEL_122:
                if (self->_renderBlurMapToCVPixelBuffer)
                  v136 = v15;
                else
                  v136 = v119;
                v137 = &kBWNodeSampleBufferAttachmentKey_PortraitStillImageFaceAdjustedBlurMapCIImage;
                if (self->_renderBlurMapToCVPixelBuffer)
                  v137 = &kBWNodeSampleBufferAttachmentKey_PortraitStillImageFaceAdjustedBlurMap;
                CMSetAttachment(a5, (CFStringRef)*v137, v136, 1u);
                CMSetAttachment(a5, CFSTR("PortraitStillImageAuxDepthMetadata"), value, 1u);
                BWSampleBufferSetAttachedMedia(a5, 0x1E495B118, (uint64_t)cf);
                goto LABEL_128;
              }
LABEL_156:
              v11 = -12786;
              goto LABEL_129;
            }
          }
          v80 = a5;
          goto LABEL_76;
        }
        AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
        v13 = 0;
        v14 = 0;
      }
      else
      {
LABEL_70:
        AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
        v13 = 0;
        v14 = 0;
        value = 0;
      }
      v15 = 0;
      v11 = -12780;
LABEL_129:
      objc_autoreleasePoolPop(context);
      v10 = v172;
      v8 = (void (**)(id, _QWORD, id))a8;
    }
  }
  else
  {
    AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
    v13 = 0;
    v14 = 0;
    obj = 0;
    value = 0;
    v15 = 0;
  }
  if (v11 && !v10)
  {
    v10 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0, a6, a7);
    v172 = v10;
  }
  if (v8)
    v8[2](v8, 0, v10);
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v138 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v167, v173, 16, a6, a7, v144);
  if (v138)
  {
    v139 = v138;
    v140 = *(_QWORD *)v168;
    do
    {
      for (j = 0; j != v139; ++j)
      {
        if (*(_QWORD *)v168 != v140)
          objc_enumerationMutation(obj);
        v142 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * j);
        if (-[NSArray containsObject:](-[CIFilter inputKeys](self->_blurMapFilter, "inputKeys"), "containsObject:", v142))
        {
          -[CIFilter setValue:forKey:](self->_blurMapFilter, "setValue:forKey:", 0, v142);
        }
      }
      v139 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v167, v173, 16);
    }
    while (v139);
  }

  if (cf)
    CFRelease(cf);
  if (v13)
    CFRelease(v13);
  if (value)
    CFRelease(value);
  if (v15)
    CFRelease(v15);
  if (AuxiliaryImagePropertiesFromGainMapSampleBuffer)
    CFRelease(AuxiliaryImagePropertiesFromGainMapSampleBuffer);
}

@end
