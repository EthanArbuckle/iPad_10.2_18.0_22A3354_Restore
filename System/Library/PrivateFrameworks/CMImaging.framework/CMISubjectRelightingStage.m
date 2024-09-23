@implementation CMISubjectRelightingStage

- (CMISubjectRelightingStage)initWithMetalContext:(id)a3
{
  id v5;
  CMISubjectRelightingStage *v6;
  MTLBuffer *v7;
  MTLBuffer *srlGlobalStatsBuffer;
  MTLBuffer *v9;
  MTLBuffer *srlFaceStatsBuffer;
  MTLBuffer *v11;
  MTLBuffer *srlCoeffsBuffer;
  void *v13;
  CMISubjectRelightingShaders *v14;
  CMISubjectRelightingShaders *shaders;
  CMISRLv2Plist *v16;
  CMISRLv2Plist *srlV2Plist;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  CMISubjectRelightingANSTSkinToneLevelFilter *v22;
  CMISubjectRelightingANSTSkinToneLevelFilter *ANSTfilterSkinToneLevelFilter;
  id v24;
  dispatch_queue_t v25;
  MTLSharedEventListener *v26;
  MTLSharedEventListener *sharedEventListener;
  NSMutableData *v28;
  NSMutableData *lastComputedRelightingStats;
  objc_super v31;

  v5 = a3;
  if (!v5)
    goto LABEL_14;
  v31.receiver = self;
  v31.super_class = (Class)CMISubjectRelightingStage;
  v6 = -[CMISubjectRelightingStage init](&v31, sel_init);
  self = v6;
  if (!v6)
  {
    FigDebugAssert3();
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v7 = -[CMISubjectRelightingStage newBufferWithLength:options:label:](self, "newBufferWithLength:options:label:", 16, 0, CFSTR("srlV2_Global_Stats"));
  srlGlobalStatsBuffer = self->_srlGlobalStatsBuffer;
  self->_srlGlobalStatsBuffer = v7;

  if (!self->_srlGlobalStatsBuffer)
    goto LABEL_14;
  v9 = -[CMISubjectRelightingStage newBufferWithLength:options:label:](self, "newBufferWithLength:options:label:", 5440, 0, CFSTR("srlV2_Face_Stats"));
  srlFaceStatsBuffer = self->_srlFaceStatsBuffer;
  self->_srlFaceStatsBuffer = v9;

  if (!self->_srlFaceStatsBuffer)
    goto LABEL_14;
  v11 = -[CMISubjectRelightingStage newBufferWithLength:options:label:](self, "newBufferWithLength:options:label:", 2136, 0, CFSTR("srlV2_Rendering_Params"));
  srlCoeffsBuffer = self->_srlCoeffsBuffer;
  self->_srlCoeffsBuffer = v11;

  if (!self->_srlCoeffsBuffer)
    goto LABEL_14;
  +[CMISubjectRelightingShared sharedInstance](CMISubjectRelightingShared, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getShaders:", self->_metalContext);
  v14 = (CMISubjectRelightingShaders *)objc_claimAutoreleasedReturnValue();
  shaders = self->_shaders;
  self->_shaders = v14;

  if (!self->_shaders)
    goto LABEL_14;
  v16 = objc_alloc_init(CMISRLv2Plist);
  srlV2Plist = self->_srlV2Plist;
  self->_srlV2Plist = v16;

  +[CMISmartStyleCommonSettings tuningParametersForVariant:](CMISmartStyleCommonSettings, "tuningParametersForVariant:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "srlParameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "srlSkinToneLevelFilterMaxAgeFrames");
  v21 = objc_msgSend(v18, "srlSkinToneLevelFilterMaxFaceHistory");
  if (!objc_msgSend(v19, "count"))
  {

    v19 = &unk_1E9514318;
  }
  -[CMISRLv2Plist readPlist:](self->_srlV2Plist, "readPlist:", v19);
  v22 = -[CMISubjectRelightingANSTSkinToneLevelFilter initWithFilterType:maxAgeFrames:maxFaceHistory:]([CMISubjectRelightingANSTSkinToneLevelFilter alloc], "initWithFilterType:maxAgeFrames:maxFaceHistory:", 1, v20, v21);
  ANSTfilterSkinToneLevelFilter = self->_ANSTfilterSkinToneLevelFilter;
  self->_ANSTfilterSkinToneLevelFilter = v22;

  self->_curveParameter = 0.5;
  self->_mitigationNeeded = 0;
  *(_WORD *)&self->_srlInLivePhotos = 1;
  v24 = objc_alloc(MEMORY[0x1E0CC6B88]);
  v25 = dispatch_queue_create("CMISubjectRelightingStage", 0);
  v26 = (MTLSharedEventListener *)objc_msgSend(v24, "initWithDispatchQueue:", v25);
  sharedEventListener = self->_sharedEventListener;
  self->_sharedEventListener = v26;

  if (!self->_sharedEventListener)
  {
LABEL_14:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
    goto LABEL_11;
  }
  self->_lastComputedCurveParameter = -1.0;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 2480);
  v28 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  lastComputedRelightingStats = self->_lastComputedRelightingStats;
  self->_lastComputedRelightingStats = v28;

  *(_DWORD *)-[NSMutableData mutableBytes](self->_lastComputedRelightingStats, "mutableBytes") = -1;
LABEL_11:

  return self;
}

- (CMISubjectRelightingStage)initWithOptionalMetalCommandQueue:(id)a3
{
  id v3;
  CMISubjectRelightingStage *v4;
  FigMetalContext *v5;
  void *v6;
  FigMetalContext *v7;
  CMISubjectRelightingStage *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMISubjectRelightingStage;
  v3 = a3;
  v4 = -[CMISubjectRelightingStage init](&v10, sel_init);
  v5 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v5, "initWithbundle:andOptionalCommandQueue:", v6, v3);

  if (v7)
  {
    v4 = -[CMISubjectRelightingStage initWithMetalContext:](v4, "initWithMetalContext:", v7);
    v8 = v4;
  }
  else
  {
    FigDebugAssert3();
    v8 = 0;
  }

  return v8;
}

+ (int)prewarmShaders:(id)a3
{
  id v3;
  CMISubjectRelightingShaders *v4;
  int v5;

  v3 = a3;
  if (v3)
  {
    v4 = -[CMISubjectRelightingShaders initWithMetalContext:]([CMISubjectRelightingShaders alloc], "initWithMetalContext:", v3);
    if (v4)
    {
      v5 = 0;
    }
    else
    {
      FigDebugAssert3();
      v4 = 0;
      v5 = -12786;
    }
  }
  else
  {
    FigDebugAssert3();
    v5 = FigSignalErrorAt();
    v4 = 0;
  }

  return v5;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 label:(id)a5
{
  void *v7;
  void *v8;

  -[FigMetalContext device](self->_metalContext, "device", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newBufferWithLength:options:", a3, a4);

  objc_msgSend(v8, "setLabel:", 0);
  return v8;
}

- (void)reset
{
  MTLCommandBuffer *lastSRLCommandBuffer;

  lastSRLCommandBuffer = self->_lastSRLCommandBuffer;
  self->_lastSRLCommandBuffer = 0;

  self->_curveParameter = 0.5;
  self->_mitigationNeeded = 0;
}

- (unsigned)getSRLStatus
{
  MTLCommandBuffer *lastSRLCommandBuffer;
  float *v4;
  unsigned int v5;
  unsigned int v7;
  unsigned int v8;
  MTLCommandBuffer *v9;

  lastSRLCommandBuffer = self->_lastSRLCommandBuffer;
  if (lastSRLCommandBuffer)
  {
    -[MTLCommandBuffer waitUntilCompleted](lastSRLCommandBuffer, "waitUntilCompleted");
    v4 = (float *)-[MTLBuffer contents](self->_srlCoeffsBuffer, "contents");
    self->_curveParameter = *v4;
    v5 = vcvts_n_u32_f32(*v4, 8uLL);
    if (*v4 >= 0.5 || *v4 <= 0.25)
    {
      v7 = v5;
    }
    else
    {
      v7 = v5 | 0x80000000;
      self->_mitigationNeeded = 1;
    }
  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
  if (self->_srlInLivePhotos)
    v8 = v5;
  else
    v8 = v7;
  v9 = self->_lastSRLCommandBuffer;
  self->_lastSRLCommandBuffer = 0;

  return v8;
}

- (BOOL)mitigationNeeded
{
  -[CMISubjectRelightingStage getSRLStatus](self, "getSRLStatus");
  return self->_forceSrlOnInLivePhotos || self->_mitigationNeeded;
}

- (float)curveParameter
{
  -[CMISubjectRelightingStage getSRLStatus](self, "getSRLStatus");
  return self->_curveParameter;
}

- (void)_copyCoeffsBufferWhenReady:(id)a3
{
  FigMetalContext *metalContext;
  id v5;
  void *v6;
  void *v7;
  MTLSharedEventListener *sharedEventListener;
  _QWORD v9[5];

  metalContext = self->_metalContext;
  v5 = a3;
  -[FigMetalContext device](metalContext, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newSharedEvent");

  objc_msgSend(v7, "setSignaledValue:", 0);
  sharedEventListener = self->_sharedEventListener;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__CMISubjectRelightingStage__copyCoeffsBufferWhenReady___block_invoke;
  v9[3] = &unk_1E94EB470;
  v9[4] = self;
  objc_msgSend(v7, "notifyListener:atValue:block:", sharedEventListener, 1, v9);
  objc_msgSend(v5, "encodeSignalEvent:value:", v7, 1);

}

void __56__CMISubjectRelightingStage__copyCoeffsBufferWhenReady___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _DWORD *v4;
  id v5;
  _BYTE __src[2136];
  _BYTE __dst[340];

  v5 = a2;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96) = *(_DWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "contents");
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  objc_sync_enter(v3);
  v4 = (_DWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "mutableBytes");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "length") == 2480)
  {
    memcpy(__dst, (const void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "contents"), sizeof(__dst));
    memcpy(__src, (const void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "contents"), sizeof(__src));
    *v4 = 1;
    memcpy(v4 + 1, __dst, 0x154uLL);
    memcpy(v4 + 86, __src, 0x858uLL);
  }
  else
  {
    *v4 = -1;
  }
  objc_sync_exit(v3);

}

- (int)_runSubjectRelighting:(int)a3 rgba:(id)a4 luma:(id)a5 chroma:(id)a6 skinMask:(id)a7 personMask:(id)a8 instanceMasks:(id)a9 instanceMaskConfidences:(id)a10 expBias:(float)a11 exifOrientation:(int)a12 srlV2Plist:(id *)a13 faceDataFromANST:(id)a14 toneMap:(id)a15 ltmChroma:(id)a16 gammaCurve:(id)a17 numFacesISPDetected:(unint64_t)a18 isChromaGainAdjusted:(BOOL)a19 inputIsLinear:(BOOL)a20 chromaBias:(float)a21 blackPoint:(id)a22 playBackCurve:(id)a23
{
  id v29;
  double v30;
  void *v31;
  BOOL v32;
  id v33;
  CMISubjectRelightingStage *v34;
  MTLComputePipelineState *srlCalcPostSRLStats;
  MTLComputePipelineState *v36;
  MTLComputePipelineState *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  float v45;
  float v46;
  MTLComputePipelineState *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t i;
  uint64_t v60;
  float v61;
  void *v62;
  const __CFDictionary *v63;
  float64x2_t v64;
  _BYTE *v65;
  float32x2_t v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  unint64_t v72;
  MTLComputePipelineState *v73;
  float v74;
  float v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t j;
  void *v79;
  CMISubjectRelightingStage *v80;
  void *v81;
  void *v82;
  int v83;
  id v85;
  MTLComputePipelineState *v86;
  MTLComputePipelineState *v87;
  void *v88;
  MTLComputePipelineState *v89;
  id v90;
  MTLComputePipelineState *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  MTLComputePipelineState *v103;
  uint64_t v105;
  int64x2_t v106;
  int64x2_t v107;
  int64x2_t v108;
  uint64_t v109;
  int64x2_t v110;
  uint64_t v111;
  _QWORD v112[3];
  uint64_t v113;
  int64x2_t v114;
  int64x2_t v115;
  uint64_t v116;
  _QWORD v117[3];
  int64x2_t v118;
  uint64_t v119;
  int64x2_t v120;
  uint64_t v121;
  _QWORD v122[3];
  uint64_t v123;
  int64x2_t v124;
  _QWORD v125[3];
  int64x2_t v126;
  uint64_t v127;
  CGRect rect;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _DWORD v133[4];
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  float var0;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _QWORD v143[2];
  BOOL var9;
  __int16 v145;
  BOOL var22;
  float v147;
  _BYTE v148[128];
  _BYTE v149[240];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v101 = a4;
  v100 = a5;
  v99 = a6;
  v98 = a7;
  v97 = a8;
  v90 = a9;
  v29 = a10;
  v147 = a11;
  v102 = a15;
  v96 = a16;
  v95 = a17;
  v94 = a22;
  v93 = a23;
  if (a3 == 5)
  {
    v34 = self;
    v89 = self->_shaders->_srlGlobalSparseHistogram;
    v103 = self->_shaders->_srlFaceSparseHistogram;
    v92 = self->_shaders->_srlCalcCoefficients;
    v36 = self->_shaders->_srlApply;
    srlCalcPostSRLStats = self->_shaders->_srlCalcPostSRLStats;
    v86 = srlCalcPostSRLStats;
    v87 = v36;
    v31 = v90;
    v32 = a20;
    v33 = a14;
  }
  else
  {
    v31 = v90;
    v32 = a20;
    v33 = a14;
    if (a3 != 100)
    {
      v86 = 0;
      v87 = 0;
      v92 = 0;
      v103 = 0;
      v89 = 0;
      v34 = self;
      goto LABEL_7;
    }
    v34 = self;
    v89 = self->_shaders->_srlGlobalSparseHistogramLivePhotos;
    v103 = self->_shaders->_srlFaceSparseHistogramLivePhotos;
    v86 = 0;
    v87 = 0;
    srlCalcPostSRLStats = self->_shaders->_srlCalcCoefficientsLivePhotos;
    v92 = srlCalcPostSRLStats;
  }
  v37 = srlCalcPostSRLStats;
LABEL_7:
  *(float *)&v30 = a13->var1;
  -[CMISubjectRelightingANSTSkinToneLevelFilter filterSkinToneLevels:minFaceSize:](v34->_ANSTfilterSkinToneLevelFilter, "filterSkinToneLevels:minFaceSize:", v33, v30);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *MEMORY[0x1E0D064D0];
  objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D064D0]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");

  v42 = 0;
  if (v41 >= 5)
    v43 = 5;
  else
    v43 = v41;
  v105 = v43;
  v133[0] = v43;
  v133[1] = 6;
  v133[2] = v32;
  *(float *)&v133[3] = a21;
  v134 = 1065353216;
  v136 = 0;
  v135 = 0;
  var0 = a13->var0;
  v138 = *(_OWORD *)&a13->var10;
  v139 = *(_OWORD *)&a13->var14;
  v140 = *(_OWORD *)&a13->var18;
  v141 = *(_OWORD *)&a13->var1;
  v142 = *(_OWORD *)&a13->var5;
  v143[1] = 0;
  v143[0] = 0;
  var9 = a13->var9;
  v145 = 1;
  var22 = a13->var22;
  do
  {
    objc_msgSend(v29, "objectAtIndexedSubscript:", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "floatValue");
    if (v45 <= 0.95)
      v46 = 0.0;
    else
      v46 = 1.0;
    *((float *)v143 + v42) = v46;

    ++v42;
  }
  while (v42 != 4);
  v47 = v89;
  v88 = v38;
  if (v38)
  {
    v85 = v29;
    objc_msgSend(v38, "objectForKeyedSubscript:", v39);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v105)
    {
      v49 = 0;
      v50 = 0;
      v51 = *MEMORY[0x1E0D06E30];
      while (1)
      {
        objc_msgSend(v48, "objectAtIndexedSubscript:", v49);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKeyedSubscript:", v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v53, "count") != 6)
        {
          FigDebugAssert3();

          v68 = 0;
          v83 = -12780;
          v47 = v89;
          v31 = v90;
          v29 = v85;
          goto LABEL_62;
        }
        v131 = 0u;
        v132 = 0u;
        v129 = 0u;
        v130 = 0u;
        v54 = v53;
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v129, v148, 16);
        if (v55)
        {
          v56 = v55;
          v57 = 0;
          v58 = *(_QWORD *)v130;
          do
          {
            for (i = 0; i != v56; ++i)
            {
              if (*(_QWORD *)v130 != v58)
                objc_enumerationMutation(v54);
              v57 += objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * i), "intValue");
            }
            v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v129, v148, 16);
          }
          while (v56);

          if (!v57)
            goto LABEL_32;
          v60 = 0;
          v61 = (float)v57;
          do
          {
            objc_msgSend(v54, "objectAtIndexedSubscript:", v60);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v149[48 * v50 + 16 + 4 * v60] = (float)(int)objc_msgSend(v62, "intValue") / v61;

            ++v60;
          }
          while (v60 != 6);
          objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("Rect"));
          v63 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          memset(&rect, 0, sizeof(rect));
          CGRectMakeWithDictionaryRepresentation(v63, &rect);
          v64.f64[0] = rect.origin.x;
          v65 = &v149[48 * v50];
          v64.f64[1] = 1.0 - (rect.origin.y + rect.size.height);
          v66 = vcvt_f32_f64(v64);
          *(float32x2_t *)&v64.f64[0] = vcvt_f32_f64((float64x2_t)rect.size);
          *(float32x2_t *)v65 = v66;
          *((_QWORD *)v65 + 1) = *(_QWORD *)&v64.f64[0];
          *((_DWORD *)v65 + 11) = 1065353216;
          ++v50;
        }
        else
        {
          v63 = (const __CFDictionary *)v54;
        }

LABEL_32:
        if (++v49 == v105)
          goto LABEL_36;
      }
    }
    v50 = 0;
LABEL_36:
    v133[0] = v50;

    v47 = v89;
    v31 = v90;
    v29 = v85;
    v38 = v88;
  }
  else
  {
    v50 = 0;
    v133[0] = 0;
  }
  -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "commandBuffer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    v69 = v29;
    objc_msgSend(v68, "computeCommandEncoder");
    v70 = objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      v71 = (void *)v70;
      v72 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v47, "maxTotalThreadsPerThreadgroup");
      if (v72 >= -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v103, "maxTotalThreadsPerThreadgroup"))
        v73 = v103;
      else
        v73 = v47;
      v74 = log2f((float)((unint64_t)-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v73, "maxTotalThreadsPerThreadgroup") >> 6));
      v75 = exp2f(floorf(v74));
      if ((unint64_t)v75 >= 0x40)
        v76 = 64;
      else
        v76 = (unint64_t)v75;
      objc_msgSend(v71, "setTexture:atIndex:", v102, 0);
      objc_msgSend(v71, "setTexture:atIndex:", v101, 12);
      objc_msgSend(v71, "setTexture:atIndex:", v100, 1);
      objc_msgSend(v71, "setTexture:atIndex:", v99, 2);
      if (a19)
        v77 = 4;
      else
        v77 = 3;
      objc_msgSend(v71, "setTexture:atIndex:", v96, v77);
      objc_msgSend(v71, "setTexture:atIndex:", v98, 5);
      objc_msgSend(v71, "setTexture:atIndex:", v97, 6);
      for (j = 0; j != 4; ++j)
      {
        objc_msgSend(v31, "objectAtIndexedSubscript:", j);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setTexture:atIndex:", v79, j + 7);

      }
      objc_msgSend(v71, "setTexture:atIndex:", v95, 11);
      objc_msgSend(v71, "setBytes:length:atIndex:", v133, 144, 0);
      objc_msgSend(v71, "setBytes:length:atIndex:", v149, 48 * v50, 1);
      objc_msgSend(v71, "setBytes:length:atIndex:", &v147, 4, 7);
      v80 = self;
      if ((unint64_t)-[MTLBuffer length](self->_srlGlobalStatsBuffer, "length") < 0x10
        || (objc_msgSend(v71, "setBuffer:offset:atIndex:", self->_srlGlobalStatsBuffer, 0, 2),
            -[MTLBuffer length](self->_srlFaceStatsBuffer, "length") < (unint64_t)(340 * v50))
        || (objc_msgSend(v71, "setBuffer:offset:atIndex:", self->_srlFaceStatsBuffer, 0, 3),
            (unint64_t)-[MTLBuffer length](self->_srlCoeffsBuffer, "length") <= 0x857))
      {
        FigDebugAssert3();

        v83 = -12780;
      }
      else
      {
        objc_msgSend(v71, "setBuffer:offset:atIndex:", self->_srlCoeffsBuffer, 0, 4);
        objc_msgSend(v71, "setBuffer:offset:atIndex:", v94, 0, 9);
        objc_msgSend(v71, "setBuffer:offset:atIndex:", v93, 0, 10);
        if (v50)
        {
          objc_msgSend(v71, "setComputePipelineState:", v47);
          v106 = vdupq_n_s64(1uLL);
          v126 = v106;
          v127 = 1;
          v125[0] = 64;
          v125[1] = v76;
          v125[2] = 1;
          objc_msgSend(v71, "dispatchThreadgroups:threadsPerThreadgroup:", &v126, v125);
          objc_msgSend(v71, "setComputePipelineState:", v103);
          v122[2] = 1;
          v123 = v50;
          v124 = v106;
          v122[0] = 64;
          v122[1] = v76;
          v80 = self;
          objc_msgSend(v71, "dispatchThreadgroups:threadsPerThreadgroup:", &v123, v122);
        }
        objc_msgSend(v71, "setComputePipelineState:", v92);
        v120 = vdupq_n_s64(1uLL);
        v121 = 1;
        v118 = v120;
        v119 = 1;
        objc_msgSend(v71, "dispatchThreadgroups:threadsPerThreadgroup:", &v120, &v118);
        if (a3 != 100 && v50)
        {
          objc_msgSend(v71, "setComputePipelineState:", v87);
          objc_msgSend(v71, "setImageblockWidth:height:", 32, 32);
          v80 = self;
          v117[0] = (unint64_t)objc_msgSend(v102, "width") >> 1;
          v117[1] = (unint64_t)objc_msgSend(v102, "height") >> 1;
          v117[2] = 1;
          v115 = vdupq_n_s64(0x10uLL);
          v116 = 1;
          objc_msgSend(v71, "dispatchThreads:threadsPerThreadgroup:", v117, &v115);
          objc_msgSend(v71, "setComputePipelineState:", v103);
          v107 = vdupq_n_s64(1uLL);
          v112[2] = 1;
          v113 = v50;
          v114 = v107;
          v112[0] = 64;
          v112[1] = v76;
          objc_msgSend(v71, "dispatchThreadgroups:threadsPerThreadgroup:", &v113, v112);
          objc_msgSend(v71, "setComputePipelineState:", v86);
          v110 = v107;
          v111 = 1;
          v108 = v107;
          v109 = 1;
          objc_msgSend(v71, "dispatchThreadgroups:threadsPerThreadgroup:", &v110, &v108);
        }
        objc_msgSend(v71, "endEncoding");
        -[CMISubjectRelightingStage _copyCoeffsBufferWhenReady:](v80, "_copyCoeffsBufferWhenReady:", v68);
        if (*MEMORY[0x1E0CA1FC0])
        {
          objc_msgSend(v68, "commandQueue");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "commandBuffer");
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v82, "setLabel:", CFSTR("KTRACE_MTLCMDBUF"));
          objc_msgSend(v82, "addCompletedHandler:", &__block_literal_global_9);
          objc_msgSend(v82, "commit");
          objc_msgSend(v68, "addCompletedHandler:", &__block_literal_global_152);

          v80 = self;
        }
        objc_msgSend(v68, "commit");
        objc_storeStrong((id *)&v80->_lastSRLCommandBuffer, v68);

        v83 = 0;
      }
    }
    else
    {
      FigDebugAssert3();
      v83 = FigSignalErrorAt();
    }
    v29 = v69;
LABEL_62:
    v38 = v88;
  }
  else
  {
    FigDebugAssert3();
    v83 = FigSignalErrorAt();
  }

  return v83;
}

uint64_t __298__CMISubjectRelightingStage__runSubjectRelighting_rgba_luma_chroma_skinMask_personMask_instanceMasks_instanceMaskConfidences_expBias_exifOrientation_srlV2Plist_faceDataFromANST_toneMap_ltmChroma_gammaCurve_numFacesISPDetected_isChromaGainAdjusted_inputIsLinear_chromaBias_blackPoint_playBackCurve___block_invoke()
{
  uint64_t result;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    return kdebug_trace();
  return result;
}

void __298__CMISubjectRelightingStage__runSubjectRelighting_rgba_luma_chroma_skinMask_personMask_instanceMasks_instanceMaskConfidences_expBias_exifOrientation_srlV2Plist_faceDataFromANST_toneMap_ltmChroma_gammaCurve_numFacesISPDetected_isChromaGainAdjusted_inputIsLinear_chromaBias_blackPoint_playBackCurve___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
  }
  else
  {
    objc_msgSend(v2, "status");
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();

}

- (int)runSRLForLivePhotosWithInputBuffer:(__CVBuffer *)a3 skinMask:(__CVBuffer *)a4 personMask:(__CVBuffer *)a5 instanceMasks:(id)a6 instanceMaskConfidences:(id)a7 skinToneClassification:(id)a8 expBias:(float)a9 exifOrientation:(int)a10 srlV2Plist:(id)a11 faceDataFromANST:(id)a12
{
  id v18;
  id v19;
  id v20;
  OSType PixelFormatType;
  FigMetalContext *metalContext;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  CMISRLv2Plist *srlV2Plist;
  double v42;
  int v43;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  _DWORD v51[9];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v18 = a6;
  v19 = a7;
  v20 = a12;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  metalContext = self->_metalContext;
  if (PixelFormatType == 1111970369)
  {
    -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, 80, 17, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      v25 = 0;
      v26 = 0;
      goto LABEL_7;
    }
LABEL_26:
    FigDebugAssert3();
    goto LABEL_28;
  }
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, 10, 17, 0);
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
    goto LABEL_26;
  v26 = (void *)v27;
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, 30, 17, 1);
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    FigDebugAssert3();

    goto LABEL_28;
  }
  v25 = (void *)v28;
  v24 = 0;
LABEL_7:
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a4, 10, 17, 0);
  v29 = objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    FigDebugAssert3();
LABEL_25:

LABEL_28:
    v43 = 0;
    goto LABEL_22;
  }
  v30 = (void *)v29;
  if (CVPixelBufferGetPixelFormatType(a5) == 1278226488)
    v31 = 10;
  else
    v31 = 25;
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a5, v31, 17, 0);
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    FigDebugAssert3();

    goto LABEL_25;
  }
  v33 = (void *)v32;
  v47 = v26;
  v48 = v20;
  v49 = v19;
  v50 = v18;
  v59 = 0u;
  v57 = 0u;
  v58 = 0u;
  v56 = 0u;
  v34 = v18;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v57 != v37)
          objc_enumerationMutation(v34);
        -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i), 25, 17, 0);
        v39 = objc_claimAutoreleasedReturnValue();
        if (!v39)
        {
          FigDebugAssert3();

          v43 = 0;
          v19 = v49;
          v18 = v50;
          v20 = v48;
          goto LABEL_22;
        }
        v40 = (void *)v39;
        objc_msgSend(0, "addObject:", v39);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v36)
        continue;
      break;
    }
  }

  v55 = 0;
  v54 = 0u;
  v53 = 0u;
  v52 = 0u;
  srlV2Plist = self->_srlV2Plist;
  v51[0] = LODWORD(srlV2Plist->maskThreshold);
  v51[1] = LODWORD(srlV2Plist->minFaceSize);
  v51[2] = LODWORD(srlV2Plist->maxCurveBoost);
  v51[3] = LODWORD(srlV2Plist->minCurveBoost);
  v51[4] = LODWORD(srlV2Plist->maxTargetRatioDarkening);
  v51[5] = LODWORD(srlV2Plist->maxTargetRatioLimit);
  v51[6] = LODWORD(srlV2Plist->biasFactorSRLv2);
  v51[7] = LODWORD(srlV2Plist->toneSimilaritySigma);
  v51[8] = LODWORD(srlV2Plist->faceExpDifThreshold);
  LOBYTE(v52) = srlV2Plist->relightOnlyPersonMask;
  *(_QWORD *)((char *)&v52 + 4) = *(_QWORD *)&srlV2Plist->targetMedian_I;
  HIDWORD(v52) = LODWORD(srlV2Plist->targetMedian_III);
  v53 = *(_OWORD *)&srlV2Plist->targetMedian_IV;
  v54 = *(_OWORD *)&srlV2Plist->maxBoost_II;
  *(float *)&v55 = srlV2Plist->maxBoost_VI;
  BYTE4(v55) = srlV2Plist->matchPreview;
  LOWORD(v46) = 0;
  v20 = v48;
  v19 = v49;
  LODWORD(v45) = a10;
  *(float *)&v42 = a9;
  v43 = -[CMISubjectRelightingStage _runSubjectRelighting:rgba:luma:chroma:skinMask:personMask:instanceMasks:instanceMaskConfidences:expBias:exifOrientation:srlV2Plist:faceDataFromANST:toneMap:ltmChroma:gammaCurve:numFacesISPDetected:isChromaGainAdjusted:inputIsLinear:chromaBias:blackPoint:playBackCurve:](self, "_runSubjectRelighting:rgba:luma:chroma:skinMask:personMask:instanceMasks:instanceMaskConfidences:expBias:exifOrientation:srlV2Plist:faceDataFromANST:toneMap:ltmChroma:gammaCurve:numFacesISPDetected:isChromaGainAdjusted:inputIsLinear:chromaBias:blackPoint:playBackCurve:", 100, v24, v47, v25, v30, v33, v42, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(0.5)), 0, v49, v45, v51, v48, 0, 0,
          0,
          0,
          v46,
          0,
          0);

  v18 = v50;
LABEL_22:

  return v43;
}

- (int)runSubjectRelightingVersion:(id)a3 toneMap:(id)a4 luma:(id)a5 chroma:(id)a6 ltmChroma:(id)a7 skinMask:(id)a8 personMask:(id)a9 instanceMask0:(id)a10 instanceMask1:(id)a11 instanceMask2:(id)a12 instanceMask3:(id)a13 gammaCurve:(id)a14 instanceMaskConfidences:(id)a15 skinToneClassification:(id)a16 expBias:(float)a17 exifOrientation:(int)a18 numFacesISPDetected:(unint64_t)a19 faceBoundingBoxesFromISP:(id)a20[10] isChromaGainAdjusted:(BOOL)a21 inputIsLinear:(BOOL)a22 chromaBias:(float)a23 srlV2Plist:(id *)a24 mstmParams:(id)a25 mstmSRLParams:(id)a26 blackPoint:(id)a27 playBackCurve:(id)a28
{
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  uint64_t v49;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[6];

  v62[4] = *MEMORY[0x1E0C80C00];
  v56 = a4;
  v55 = a5;
  v54 = a6;
  v53 = a7;
  v52 = a8;
  v61 = a9;
  v60 = a10;
  v34 = a11;
  v35 = a12;
  v36 = a13;
  v59 = a14;
  v58 = a15;
  v57 = a27;
  v37 = a28;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Stills")))
  {
    v62[0] = v60;
    v62[1] = v34;
    v62[2] = v35;
    v62[3] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v49) = __PAIR16__(a22, a21);
    v39 = v52;
    LODWORD(v48) = a18;
    *(float *)&v40 = a17;
    *(float *)&v41 = a23;
    v42 = -[CMISubjectRelightingStage _runSubjectRelighting:rgba:luma:chroma:skinMask:personMask:instanceMasks:instanceMaskConfidences:expBias:exifOrientation:srlV2Plist:faceDataFromANST:toneMap:ltmChroma:gammaCurve:numFacesISPDetected:isChromaGainAdjusted:inputIsLinear:chromaBias:blackPoint:playBackCurve:](self, "_runSubjectRelighting:rgba:luma:chroma:skinMask:personMask:instanceMasks:instanceMaskConfidences:expBias:exifOrientation:srlV2Plist:faceDataFromANST:toneMap:ltmChroma:gammaCurve:numFacesISPDetected:isChromaGainAdjusted:inputIsLinear:chromaBias:blackPoint:playBackCurve:", 5, 0, v55, v54, v52, v61, v40, v41, v38, v58, v48, a24, 0, v56, v53,
            v59,
            a19,
            v49,
            v57,
            v37);

    v43 = v56;
    v44 = v55;
    v45 = v54;
    v46 = v53;
  }
  else
  {
    FigDebugAssert3();
    v42 = -12780;
    v44 = v55;
    v43 = v56;
    v46 = v53;
    v45 = v54;
    v39 = v52;
  }

  return v42;
}

- (MTLBuffer)srlCoeffsMTLBuffer
{
  return self->_srlCoeffsBuffer;
}

- (float)lastComputedCurveParameter
{
  return self->_lastComputedCurveParameter;
}

- (NSData)lastComputedRelightingStats
{
  return &self->_lastComputedRelightingStats->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ANSTfilterSkinToneLevelFilter, 0);
  objc_storeStrong((id *)&self->_lastComputedRelightingStats, 0);
  objc_storeStrong((id *)&self->_sharedEventListener, 0);
  objc_storeStrong((id *)&self->_lastSRLCommandBuffer, 0);
  objc_storeStrong((id *)&self->_srlCoeffsBuffer, 0);
  objc_storeStrong((id *)&self->_srlFaceStatsBuffer, 0);
  objc_storeStrong((id *)&self->_srlGlobalStatsBuffer, 0);
  objc_storeStrong((id *)&self->_srlV2Plist, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
