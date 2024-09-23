@implementation CMIStyleEngineCreateLinearSystem

- (BOOL)setConstantPriorScaleFactor:(float)a3 forWeightPlane:(unsigned int)a4
{
  return -[CMIStyleEngineCreateLinearSystem _setWeightPlane:term:priorScaleFactor:](self, "_setWeightPlane:term:priorScaleFactor:", *(_QWORD *)&a4, 0);
}

- (BOOL)setLinearPriorScaleFactor:(float)a3 forWeightPlane:(unsigned int)a4
{
  return -[CMIStyleEngineCreateLinearSystem _setWeightPlane:term:priorScaleFactor:](self, "_setWeightPlane:term:priorScaleFactor:", *(_QWORD *)&a4, 1);
}

- (BOOL)setQuadraticPriorScaleFactor:(float)a3 forWeightPlane:(unsigned int)a4
{
  return -[CMIStyleEngineCreateLinearSystem _setWeightPlane:term:priorScaleFactor:](self, "_setWeightPlane:term:priorScaleFactor:", *(_QWORD *)&a4, 2);
}

- (BOOL)_setWeightPlane:(unsigned int)a3 term:(unsigned int)a4 priorScaleFactor:(float)a5
{
  if (a4 >= 3 || self->_params.weightPlaneCount <= a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  else
  {
    *(float *)(-[NSMutableData mutableBytes](self->_weightPlanePriorScaleFactors, "mutableBytes") + 4 * (3 * a3 + a4)) = a5;
    return 1;
  }
}

- (void)setExtLambda:(float)a3
{
  *(float *)&self->_anon_68[8] = a3;
}

- (float)extLambda
{
  return *(float *)&self->_anon_68[8];
}

- (void)setTikLambdaConstant:(float)a3
{
  *(float *)&self->_anon_68[12] = a3;
}

- (float)tikLambdaConstant
{
  return *(float *)&self->_anon_68[12];
}

- (void)setTikLambdaLinear:(float)a3
{
  *(float *)&self->_anon_68[16] = a3;
}

- (float)tikLambdaLinear
{
  return *(float *)&self->_anon_68[16];
}

- (void)setTikLambdaQuadratic:(float)a3
{
  *(float *)&self->_anon_68[20] = a3;
}

- (float)tikLambdaQuadratic
{
  return *(float *)&self->_anon_68[20];
}

- (void)setEndLambda:(float)a3
{
  *(float *)&self->_anon_68[24] = a3;
}

- (float)endLambda
{
  return *(float *)&self->_anon_68[24];
}

- (void)setModulationMaskStrength:(float)a3
{
  *(float *)&self->_anon_68[28] = a3;
}

- (float)modulationMaskStrength
{
  return *(float *)&self->_anon_68[28];
}

- (void)setModulationMaskOffset:(float)a3
{
  *(float *)&self->_anon_68[32] = a3;
}

- (float)modulationMaskOffset
{
  return *(float *)&self->_anon_68[32];
}

- (void)setApplyDifferenceModulation:(BOOL)a3
{
  self->_anon_68[36] = a3;
}

- (BOOL)applyDifferenceModulation
{
  return self->_anon_68[36];
}

- (void)setModulationDifferenceStrength:(float)a3
{
  *(float *)&self->_anon_68[40] = a3;
}

- (float)modulationDifferenceStrength
{
  return *(float *)&self->_anon_68[40];
}

- (void)setModulationDifferenceOffset:(float)a3
{
  *(float *)&self->_anon_68[44] = a3;
}

- (float)modulationDifferenceOffset
{
  return *(float *)&self->_anon_68[44];
}

- (CMIStyleEngineCreateLinearSystem)initWithMetalContext:(id)a3 polynomialCount:(unsigned int)a4 systemCount:(unsigned int)a5 systemSize:(unsigned int)a6 weightPlaneCount:(unsigned int)a7 spotlightCount:
{
  uint64_t v7;
  uint64_t v8;
  id v14;
  CMIStyleEngineCreateLinearSystem *v15;
  uint64_t v16;
  NSMutableData *weightPlanePriorScaleFactors;
  NSMutableData *v18;
  CMIStyleEngineCreateLinearSystem *v19;
  int __pattern4;
  objc_super v22;

  v8 = v7;
  v14 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CMIStyleEngineCreateLinearSystem;
  v15 = -[CMIStyleEngineCreateLinearSystem init](&v22, sel_init);
  if (!v15
    || (objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 12 * a7),
        v16 = objc_claimAutoreleasedReturnValue(),
        weightPlanePriorScaleFactors = v15->_weightPlanePriorScaleFactors,
        v15->_weightPlanePriorScaleFactors = (NSMutableData *)v16,
        weightPlanePriorScaleFactors,
        (v18 = v15->_weightPlanePriorScaleFactors) == 0))
  {
    fig_log_get_emitter();
LABEL_9:
    FigDebugAssert3();
    v19 = 0;
    goto LABEL_5;
  }
  __pattern4 = 1065353216;
  memset_pattern4(-[NSMutableData mutableBytes](v18, "mutableBytes"), &__pattern4, -[NSMutableData length](v15->_weightPlanePriorScaleFactors, "length"));
  v15->_params.polynomialCount = a4;
  v15->_params.systemCount = a5;
  v15->_params.systemSize = a6;
  v15->_params.weightPlaneCount = a7;
  *(_QWORD *)v15->_anon_68 = v8;
  if (-[CMIStyleEngineCreateLinearSystem _compileShaders:](v15, "_compileShaders:", v14))
  {
    fig_log_get_emitter();
    goto LABEL_9;
  }
  v19 = v15;
LABEL_5:

  return v19;
}

- (int)_compileShaders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *v8;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *v10;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *v12;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *v14;
  MTLComputePipelineState *v15;
  MTLComputePipelineState *v16;
  MTLComputePipelineState *v17;
  MTLComputePipelineState *v18;
  MTLComputePipelineState *v19;
  MTLComputePipelineState *v20;
  MTLComputePipelineState *v21;
  MTLComputePipelineState *v22;
  MTLComputePipelineState *v23;
  MTLComputePipelineState *v24;
  MTLComputePipelineState *v25;
  MTLComputePipelineState *v26;
  int v27;
  char v29;

  v4 = a3;
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  styleEngineSharedFunctionConstants(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateLinearSystem::PolyExpandInput"), v6);
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v8 = self->_computePipelineStates[0];
  self->_computePipelineStates[0] = v7;

  if (!self->_computePipelineStates[0])
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateLinearSystem::PolyExpandTarget"), v6);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v10 = self->_computePipelineStates[1];
  self->_computePipelineStates[1] = v9;

  if (!self->_computePipelineStates[1])
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateLinearSystem::PairExpandWeights"), v6);
  v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v12 = self->_computePipelineStates[2];
  self->_computePipelineStates[2] = v11;

  if (!self->_computePipelineStates[2])
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateLinearSystem::RHS"), v6);
  v13 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v14 = self->_computePipelineStates[5];
  self->_computePipelineStates[5] = v13;

  if (!self->_computePipelineStates[5])
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateLinearSystem::CalculatePrior"), v6);
  v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v16 = self->_computePipelineStates[6];
  self->_computePipelineStates[6] = v15;

  if (!self->_computePipelineStates[6])
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateLinearSystem::AddPriorToLHS"), v6);
  v17 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v18 = self->_computePipelineStates[7];
  self->_computePipelineStates[7] = v17;

  if (!self->_computePipelineStates[7])
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateLinearSystem::AddPriorToRHS"), v6);
  v19 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v20 = self->_computePipelineStates[8];
  self->_computePipelineStates[8] = v19;

  if (!self->_computePipelineStates[8]
    || (objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateLinearSystem::AverageSystems"), 0), v21 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(), v22 = self->_computePipelineStates[9], self->_computePipelineStates[9] = v21, v22, !self->_computePipelineStates[9]))
  {
LABEL_14:
    fig_log_get_emitter();
LABEL_22:
    FigDebugAssert3();
    v27 = FigSignalErrorAt();
    goto LABEL_13;
  }
  v29 = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v29, 53, CFSTR("StyleEngineCreateLinearSystem::independentSpotlights"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateLinearSystem::LHS"), v6);
  v23 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v24 = self->_computePipelineStates[3];
  self->_computePipelineStates[3] = v23;

  if (!self->_computePipelineStates[3]
    || (v29 = 1,
        objc_msgSend(v6, "setConstantValue:type:withName:", &v29, 53, CFSTR("StyleEngineCreateLinearSystem::independentSpotlights")), objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngineCreateLinearSystem::LHS"), v6), v25 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(), v26 = self->_computePipelineStates[4], self->_computePipelineStates[4] = v25, v26, !self->_computePipelineStates[4]))
  {
    fig_log_get_emitter();
    goto LABEL_22;
  }
  v27 = 0;
LABEL_13:

  return v27;
}

- (int)enqueueToCommandBuffer:(id)a3
{
  id v4;
  MTLTexture **p_inputWeightPlanesTexture;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _BOOL4 v32;
  uint64_t i;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  MTLComputePipelineState *v40;
  unint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  unint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  MTLComputePipelineState *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  void *v63;
  MTLComputePipelineState *v64;
  unint64_t v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  void *v77;
  unint64_t v78;
  unint64_t v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  unint64_t v94;
  uint64_t v95;
  MTLComputePipelineState *v96;
  id v97;
  id v98;
  id v99;
  unint64_t v100;
  unint64_t v101;
  MTLComputePipelineState *v102;
  id v103;
  id v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  MTLComputePipelineState *v108;
  unint64_t v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  MTLComputePipelineState *v114;
  unint64_t v115;
  id v116;
  id v117;
  uint64_t v118;
  unsigned int weightPlaneCount;
  NSUInteger v120;
  unint64_t v121;
  void *v122;
  MTLComputePipelineState *v123;
  unint64_t v124;
  id v125;
  id v126;
  uint64_t v127;
  unsigned int v128;
  NSUInteger v129;
  unint64_t v130;
  MTLComputePipelineState *v131;
  unsigned int v132;
  unint64_t v133;
  unint64_t v134;
  unsigned int v135;
  int v136;
  id v137;
  unsigned int v138;
  unint64_t v139;
  int v140;
  int v141;
  id v142;
  unsigned int v143;
  id v144;
  int v145;
  int v146;
  id v147;
  int v148;
  unint64_t v150;
  uint64_t v151;
  int v152;
  unsigned int v153;
  id v154;
  id *p_inputPairExpandedWeightsBuffer;
  MTLBuffer **p_inputPolyExpandedInputBuffer;
  void *v157;
  unsigned __int32 v158;
  void *v159;
  unsigned int v160;
  void *v161;
  unsigned int systemCount;
  void *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  id *v167;
  id *v168;
  void *v169;
  id v170;
  id v171;
  void *v172;
  unint64_t v173;
  unint64_t v174;
  void *v175;
  $7B64FDDED64106F6E583B1AFBD9FC7EF *p_params;
  id *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  id *p_inputPriorFactorForRHSBuffer;
  id *p_inputPriorFactorForLHSBuffer;
  unsigned int v184;
  id *p_inputLHSDiagSumsBuffer;
  id *p_targetThumbnailTexture;
  uint64_t v187;
  id *v188;
  MTLTexture **p_inputPolyExpandedTargetTexture;
  id *v190[2];
  id *v191[2];
  id *v192[2];
  id *v193[2];
  id *p_outputRHSBuffer;
  id *p_outputLHSBuffer;
  MTLTexture **location;
  id *locationa[2];
  unint64_t locationb;
  id *locationc[2];
  uint64_t v200;
  __int128 v201;
  unint64_t v202;
  __int128 v203;
  uint64_t v204;
  __int128 v205;
  unint64_t v206;
  __int128 v207;
  unsigned int v208;
  unsigned int v209;
  uint64_t v210;
  __int128 v211;
  uint64_t v212;
  __int128 v213;
  uint64_t v214;
  __int128 v215;
  unint64_t v216;
  __int128 v217;
  uint64_t v218;
  __int128 v219;
  __int128 v220;
  uint64_t v221;
  uint64_t v222;
  __int128 v223;
  unint64_t v224;
  __int128 v225;
  uint64_t v226;
  __int128 v227;
  unint64_t v228;
  __int128 v229;
  unsigned __int32 v230;
  _QWORD v231[3];
  _QWORD v232[3];
  _QWORD v233[3];
  _QWORD v234[3];
  _QWORD v235[3];
  _QWORD v236[3];
  _DWORD v237[12];
  uint64_t v238;

  v238 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_inputWeightPlanesTexture = &self->_inputWeightPlanesTexture;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputWeightPlanesTexture);
  v152 = objc_msgSend(WeakRetained, "arrayLength");
  v151 = *(_QWORD *)self->_anon_68;

  v7 = objc_loadWeakRetained((id *)&self->_inputThumbnailTexture);
  if (!v7)
    goto LABEL_87;
  v8 = v7;
  v9 = objc_loadWeakRetained((id *)&self->_inputWeightPlanesTexture);
  if (!v9)
  {
LABEL_86:

LABEL_87:
    fig_log_get_emitter();
    FigDebugAssert3();
    v148 = FigSignalErrorAt();
    v36 = 0;
LABEL_88:
    v63 = 0;
    goto LABEL_89;
  }
  v10 = v9;
  v11 = objc_loadWeakRetained((id *)&self->_outputLHSBuffer);
  if (!v11)
  {
LABEL_85:

    goto LABEL_86;
  }
  v179 = v11;
  v12 = objc_loadWeakRetained((id *)&self->_inputLHSDiagSumsBuffer);
  if (!v12)
  {
LABEL_84:

    goto LABEL_85;
  }
  v175 = v12;
  v13 = objc_loadWeakRetained((id *)&self->_targetThumbnailTexture);
  if (!v13)
  {
LABEL_83:

    goto LABEL_84;
  }
  v169 = v13;
  v172 = v10;
  v14 = (id *)objc_loadWeakRetained((id *)&self->_outputRHSBuffer);
  if (!v14)
  {
LABEL_82:

    goto LABEL_83;
  }
  v167 = v14;
  v15 = objc_loadWeakRetained((id *)&self->_inputPriorFactorForLHSBuffer);
  if (!v15)
  {
LABEL_81:

    goto LABEL_82;
  }
  v163 = v8;
  v165 = v15;
  v16 = objc_loadWeakRetained((id *)&self->_inputPriorFactorForRHSBuffer);
  if (!v16)
  {
LABEL_80:

    goto LABEL_81;
  }
  v161 = v16;
  location = &self->_inputThumbnailTexture;
  v17 = objc_loadWeakRetained((id *)&self->_inputPolyExpandedInputBuffer);
  if (!v17)
  {
LABEL_79:

    goto LABEL_80;
  }
  v159 = v17;
  p_targetThumbnailTexture = (id *)&self->_targetThumbnailTexture;
  v18 = objc_loadWeakRetained((id *)&self->_inputPolyExpandedTargetTexture);
  if (!v18)
  {

    goto LABEL_79;
  }
  p_inputPolyExpandedInputBuffer = &self->_inputPolyExpandedInputBuffer;
  v157 = v18;
  p_inputLHSDiagSumsBuffer = (id *)&self->_inputLHSDiagSumsBuffer;
  p_outputLHSBuffer = (id *)&self->_outputLHSBuffer;
  v19 = objc_loadWeakRetained((id *)&self->_inputPairExpandedWeightsBuffer);
  v177 = (id *)&self->_inputWeightPlanesTexture;
  v178 = v4;
  p_outputRHSBuffer = (id *)&self->_outputRHSBuffer;
  p_inputPriorFactorForRHSBuffer = (id *)&self->_inputPriorFactorForRHSBuffer;
  p_inputPriorFactorForLHSBuffer = (id *)&self->_inputPriorFactorForLHSBuffer;
  p_inputPolyExpandedTargetTexture = &self->_inputPolyExpandedTargetTexture;
  p_inputPairExpandedWeightsBuffer = (id *)&self->_inputPairExpandedWeightsBuffer;
  if (v19)
  {
    v20 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureTopLeft);
    if (v20)
    {
      v21 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureTopEdge);
      if (v21)
      {
        v22 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureTopRight);
        if (v22)
        {
          v23 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureLeftEdge);
          if (v23)
          {
            v24 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureCentral);
            if (v24)
            {
              v154 = v22;
              v25 = v21;
              v26 = v20;
              v27 = v19;
              v28 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureRightEdge);
              if (v28)
              {
                v29 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureBottomLeft);
                if (v29)
                {
                  v30 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureBottomEdge);
                  if (v30)
                  {
                    v31 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureBottomRight);
                    v32 = v31 != 0;

                  }
                  else
                  {
                    v32 = 0;
                  }

                  p_inputWeightPlanesTexture = &self->_inputWeightPlanesTexture;
                }
                else
                {
                  v32 = 0;
                }

              }
              else
              {
                v32 = 0;
              }

              v19 = v27;
              v20 = v26;
              v21 = v25;
              v22 = v154;
            }
            else
            {
              v32 = 0;
            }

          }
          else
          {
            v32 = 0;
          }

          v4 = v178;
        }
        else
        {
          v32 = 0;
        }

      }
      else
      {
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  if (!v32)
    goto LABEL_87;
  for (i = 0; i != 12; ++i)
    v237[i] = *((_DWORD *)&self[1].super.isa + 4 * (i % 3u) + ((i / 3uLL) & 3));
  systemCount = self->_params.systemCount;
  v34 = objc_loadWeakRetained((id *)p_inputWeightPlanesTexture);
  v35 = objc_msgSend(v34, "arrayLength");

  v160 = self->_params.systemCount;
  if (self->_spatialAverageSystems)
    v158 = self->_params.systemCount
         / vmul_lane_s32(*(int32x2_t *)self->_anon_68, *(int32x2_t *)self->_anon_68, 1).u32[0];
  else
    v158 = 0;
  objc_msgSend(v4, "blitCommandEncoder");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
    goto LABEL_99;
  v153 = v151 * v152 * HIDWORD(v151);
  v37 = objc_loadWeakRetained(p_outputLHSBuffer);
  objc_msgSend(v36, "fillBuffer:range:value:", v37, 0, objc_msgSend(v37, "length"), 0);

  objc_msgSend(v36, "endEncoding");
  objc_msgSend(v4, "computeCommandEncoder");
  v38 = objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
LABEL_99:
    fig_log_get_emitter();
    FigDebugAssert3();
    v148 = FigSignalErrorAt();
    goto LABEL_88;
  }
  v39 = (void *)v38;
  v150 = v35;
  v164 = v36;
  v40 = self->_computePipelineStates[0];
  objc_msgSend(v39, "setComputePipelineState:", v40);
  v180 = -[MTLComputePipelineState threadExecutionWidth](v40, "threadExecutionWidth");
  v41 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v40, "maxTotalThreadsPerThreadgroup");
  v173 = v41 / -[MTLComputePipelineState threadExecutionWidth](v40, "threadExecutionWidth");
  v42 = objc_loadWeakRetained((id *)location);
  objc_msgSend(v39, "setTexture:atIndex:", v42, 0);

  v43 = objc_loadWeakRetained((id *)p_inputPolyExpandedInputBuffer);
  objc_msgSend(v39, "setBuffer:offset:atIndex:", v43, 0, 1);

  objc_msgSend(v39, "setBytes:length:atIndex:", &self->_params, 64, 0);
  objc_msgSend(v39, "setBytes:length:atIndex:");
  v170 = objc_loadWeakRetained((id *)location);
  v166 = objc_msgSend(v170, "width");
  v168 = (id *)objc_loadWeakRetained((id *)location);
  v44 = objc_msgSend(v168, "height");
  v45 = objc_loadWeakRetained((id *)p_inputPolyExpandedInputBuffer);
  v46 = objc_msgSend(v45, "length");
  v47 = objc_loadWeakRetained((id *)location);
  v48 = objc_msgSend(v47, "width");
  p_params = &self->_params;
  v49 = objc_loadWeakRetained((id *)location);

  v236[0] = v166;
  v236[1] = v44;
  v236[2] = v46 / (4 * v48 * objc_msgSend(v49, "height"));
  v235[0] = v180;
  v235[1] = v173;
  v235[2] = 1;
  objc_msgSend(v39, "dispatchThreads:threadsPerThreadgroup:", v236, v235);

  v4 = v178;
  objc_msgSend(v39, "endEncoding");
  objc_msgSend(v178, "computeCommandEncoder");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v50)
  {
    fig_log_get_emitter();
LABEL_106:
    FigDebugAssert3();
    v148 = FigSignalErrorAt();
    v63 = 0;
    goto LABEL_77;
  }
  v51 = self->_computePipelineStates[1];
  objc_msgSend(v50, "setComputePipelineState:", v51);
  v52 = -[MTLComputePipelineState threadExecutionWidth](v51, "threadExecutionWidth");
  v53 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v51, "maxTotalThreadsPerThreadgroup");
  v54 = v53 / -[MTLComputePipelineState threadExecutionWidth](v51, "threadExecutionWidth");
  objc_msgSend(v50, "setImageblockWidth:height:", v52, v54);
  v55 = objc_loadWeakRetained((id *)location);
  objc_msgSend(v50, "setTexture:atIndex:", v55, 0);

  v56 = objc_loadWeakRetained(p_targetThumbnailTexture);
  objc_msgSend(v50, "setTexture:atIndex:", v56, 1);

  v57 = objc_loadWeakRetained((id *)p_inputPolyExpandedTargetTexture);
  objc_msgSend(v50, "setTexture:atIndex:", v57, 2);

  objc_msgSend(v50, "setBytes:length:atIndex:", p_params, 64, 0);
  objc_msgSend(v50, "setBytes:length:atIndex:", &self->_inputIsLinear, 1, 9);
  objc_msgSend(v50, "setBytes:length:atIndex:", &self->_targetIsLinear, 1, 10);
  v58 = objc_loadWeakRetained((id *)p_inputPolyExpandedTargetTexture);
  v59 = objc_msgSend(v58, "width");
  v60 = objc_loadWeakRetained((id *)p_inputPolyExpandedTargetTexture);
  v61 = objc_msgSend(v60, "height");
  v62 = objc_loadWeakRetained((id *)p_inputPolyExpandedTargetTexture);

  v234[0] = v59;
  v234[1] = v61;
  v234[2] = objc_msgSend(v62, "arrayLength");
  v233[0] = v52;
  v233[1] = v54;
  v233[2] = 1;
  objc_msgSend(v50, "dispatchThreads:threadsPerThreadgroup:", v234, v233);

  v4 = v178;
  objc_msgSend(v50, "endEncoding");
  objc_msgSend(v178, "computeCommandEncoder");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v63)
  {
    fig_log_get_emitter();
LABEL_108:
    FigDebugAssert3();
    v148 = FigSignalErrorAt();
    goto LABEL_77;
  }
  v64 = self->_computePipelineStates[2];
  objc_msgSend(v63, "setComputePipelineState:", v64);
  v181 = -[MTLComputePipelineState threadExecutionWidth](v64, "threadExecutionWidth");
  v65 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v64, "maxTotalThreadsPerThreadgroup");
  v174 = v65 / -[MTLComputePipelineState threadExecutionWidth](v64, "threadExecutionWidth");
  v66 = objc_loadWeakRetained(v177);
  objc_msgSend(v63, "setTexture:atIndex:", v66, 3);

  v67 = objc_loadWeakRetained((id *)&self->_inputLearningModulationMaskTexture);
  objc_msgSend(v63, "setTexture:atIndex:", v67, 13);

  v68 = objc_loadWeakRetained((id *)location);
  objc_msgSend(v63, "setTexture:atIndex:", v68, 0);

  v69 = objc_loadWeakRetained(p_targetThumbnailTexture);
  objc_msgSend(v63, "setTexture:atIndex:", v69, 1);

  v70 = objc_loadWeakRetained(p_inputPairExpandedWeightsBuffer);
  objc_msgSend(v63, "setBuffer:offset:atIndex:", v70, 0, 2);

  objc_msgSend(v63, "setBytes:length:atIndex:", p_params, 64, 0);
  v171 = objc_loadWeakRetained(v177);
  v71 = objc_msgSend(v171, "width");
  v72 = objc_loadWeakRetained(v177);
  v73 = objc_msgSend(v72, "height");
  v74 = objc_loadWeakRetained(v177);
  v75 = objc_msgSend(v74, "arrayLength");
  v76 = objc_loadWeakRetained(v177);

  v232[0] = v71;
  v232[1] = v73;
  v232[2] = (unint64_t)(v75 + v75 * objc_msgSend(v76, "arrayLength")) >> 1;
  v231[0] = v181;
  v231[1] = v174;
  v231[2] = 1;
  objc_msgSend(v63, "dispatchThreads:threadsPerThreadgroup:", v232, v231);

  v4 = v178;
  objc_msgSend(v63, "endEncoding");
  objc_msgSend(v178, "computeCommandEncoderWithDispatchType:", 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v77)
  {
    fig_log_get_emitter();
    goto LABEL_106;
  }
  v78 = v158 + v160;
  v79 = v153 / systemCount;
  v80 = objc_loadWeakRetained(v177);
  objc_msgSend(v77, "setTexture:atIndex:", v80, 3);

  v81 = objc_loadWeakRetained(p_inputPairExpandedWeightsBuffer);
  objc_msgSend(v77, "setBuffer:offset:atIndex:", v81, 0, 2);

  v82 = objc_loadWeakRetained((id *)&self->_inputLearningModulationMaskTexture);
  objc_msgSend(v77, "setTexture:atIndex:", v82, 13);

  v83 = objc_loadWeakRetained((id *)location);
  objc_msgSend(v77, "setTexture:atIndex:", v83, 0);

  v84 = objc_loadWeakRetained(p_targetThumbnailTexture);
  objc_msgSend(v77, "setTexture:atIndex:", v84, 1);

  v85 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureTopLeft);
  objc_msgSend(v77, "setTexture:atIndex:", v85, 4);

  v86 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureTopEdge);
  objc_msgSend(v77, "setTexture:atIndex:", v86, 5);

  v87 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureTopRight);
  objc_msgSend(v77, "setTexture:atIndex:", v87, 6);

  v88 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureLeftEdge);
  objc_msgSend(v77, "setTexture:atIndex:", v88, 7);

  v89 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureCentral);
  objc_msgSend(v77, "setTexture:atIndex:", v89, 8);

  v90 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureRightEdge);
  objc_msgSend(v77, "setTexture:atIndex:", v90, 9);

  v91 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureBottomLeft);
  objc_msgSend(v77, "setTexture:atIndex:", v91, 10);

  v92 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureBottomEdge);
  objc_msgSend(v77, "setTexture:atIndex:", v92, 11);

  v93 = objc_loadWeakRetained((id *)&self->_inputSpotlightTextureBottomRight);
  objc_msgSend(v77, "setTexture:atIndex:", v93, 12);

  objc_msgSend(v77, "setBytes:length:atIndex:", p_params, 64, 0);
  if (self->_params.systemCount)
  {
    v94 = 0;
    v95 = 3;
    if (v150 >= v79)
      v95 = 4;
    v187 = v95;
    *(int64x2_t *)locationa = vdupq_n_s64(1uLL);
    do
    {
      v230 = v79 * v94;
      objc_msgSend(v77, "setBytes:length:atIndex:", &v230, 4, 3);
      v96 = self->_computePipelineStates[v187];
      objc_msgSend(v77, "setComputePipelineState:", v96);
      v97 = objc_loadWeakRetained((id *)p_inputPolyExpandedInputBuffer);
      objc_msgSend(v77, "setBuffer:offset:atIndex:", v97, 0, 1);

      v98 = objc_loadWeakRetained(p_outputLHSBuffer);
      objc_msgSend(v77, "setBuffer:offset:atIndex:", v98, objc_msgSend(v98, "length") * v94 / v78, 4);

      v99 = objc_loadWeakRetained(p_inputLHSDiagSumsBuffer);
      objc_msgSend(v77, "setBuffer:offset:atIndex:", v99, objc_msgSend(v99, "length") * v94 / self->_params.systemCount, 5);

      v100 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v96, "maxTotalThreadsPerThreadgroup");
      v101 = -[MTLComputePipelineState threadExecutionWidth](v96, "threadExecutionWidth");
      v228 = (v100 / v101
            + ((self->_params.polynomialCount + self->_params.polynomialCount * self->_params.polynomialCount) >> 1)
            * ((v79 + v79 * v79) >> 1)
            - 1)
           / (v100
            / v101);
      v229 = *(_OWORD *)locationa;
      v226 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v96, "maxTotalThreadsPerThreadgroup");
      v227 = *(_OWORD *)locationa;
      objc_msgSend(v77, "dispatchThreadgroups:threadsPerThreadgroup:", &v228, &v226);
      v102 = self->_computePipelineStates[5];

      objc_msgSend(v77, "setComputePipelineState:", v102);
      v103 = objc_loadWeakRetained((id *)p_inputPolyExpandedTargetTexture);
      objc_msgSend(v77, "setTexture:atIndex:", v103, 2);

      v104 = objc_loadWeakRetained(p_outputRHSBuffer);
      objc_msgSend(v77, "setBuffer:offset:atIndex:", v104, objc_msgSend(v104, "length") * v94 / v78, 4);

      v105 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v102, "maxTotalThreadsPerThreadgroup");
      v106 = -[MTLComputePipelineState threadExecutionWidth](v102, "threadExecutionWidth");
      v224 = (v105 / v106 + (self->_params.polynomialCount * v79) - 1) / (v105 / v106);
      v225 = *(_OWORD *)locationa;
      v107 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v102, "maxTotalThreadsPerThreadgroup");

      v222 = v107;
      v223 = *(_OWORD *)locationa;
      objc_msgSend(v77, "dispatchThreadgroups:threadsPerThreadgroup:", &v224, &v222);
      ++v94;
    }
    while (v94 < self->_params.systemCount);
  }
  v188 = (id *)(v153 / systemCount);
  locationb = v158 + v160;
  objc_msgSend(v77, "endEncoding");
  v4 = v178;
  objc_msgSend(v178, "computeCommandEncoderWithDispatchType:", 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v63)
  {
    fig_log_get_emitter();
    goto LABEL_108;
  }
  v108 = self->_computePipelineStates[6];
  objc_msgSend(v63, "setComputePipelineState:", v108);
  objc_msgSend(v63, "setBytes:length:atIndex:", p_params, 64, 0);
  if (self->_params.systemCount)
  {
    v109 = 0;
    *(int64x2_t *)v190 = vdupq_n_s64(1uLL);
    do
    {
      v110 = objc_loadWeakRetained(p_inputLHSDiagSumsBuffer);
      objc_msgSend(v63, "setBuffer:offset:atIndex:", v110, objc_msgSend(v110, "length") * v109 / self->_params.systemCount, 5);

      v111 = objc_loadWeakRetained(p_inputPriorFactorForLHSBuffer);
      objc_msgSend(v63, "setBuffer:offset:atIndex:", v111, objc_msgSend(v111, "length") * v109 / self->_params.systemCount, 6);

      v112 = objc_loadWeakRetained(p_inputPriorFactorForRHSBuffer);
      objc_msgSend(v63, "setBuffer:offset:atIndex:", v112, objc_msgSend(v112, "length") * v109 / self->_params.systemCount, 7);

      objc_msgSend(v63, "setThreadgroupMemoryLength:atIndex:", (4* (-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v108, "maxTotalThreadsPerThreadgroup")/ (unint64_t)-[MTLComputePipelineState threadExecutionWidth](v108, "threadExecutionWidth"))+ 15) & 0xFFFFFFFFFFFFFFF0, 0);
      v220 = *(_OWORD *)v190;
      v221 = 1;
      v218 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v108, "maxTotalThreadsPerThreadgroup");
      v219 = *(_OWORD *)v190;
      objc_msgSend(v63, "dispatchThreadgroups:threadsPerThreadgroup:", &v220, &v218);
      ++v109;
    }
    while (v109 < self->_params.systemCount);
  }
  objc_msgSend(v63, "endEncoding");

  v4 = v178;
  objc_msgSend(v178, "computeCommandEncoderWithDispatchType:", 1);
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v113)
  {
    fig_log_get_emitter();
    goto LABEL_106;
  }
  v114 = self->_computePipelineStates[7];
  objc_msgSend(v113, "setComputePipelineState:", v114);
  objc_msgSend(v113, "setBytes:length:atIndex:", p_params, 64, 0);
  if (self->_params.systemCount)
  {
    v115 = 0;
    *(int64x2_t *)v191 = vdupq_n_s64(1uLL);
    do
    {
      v116 = objc_loadWeakRetained(p_outputLHSBuffer);
      objc_msgSend(v113, "setBuffer:offset:atIndex:", v116, objc_msgSend(v116, "length") * v115 / locationb, 4);

      v117 = objc_loadWeakRetained(p_inputPriorFactorForLHSBuffer);
      objc_msgSend(v113, "setBuffer:offset:atIndex:", v117, objc_msgSend(v117, "length") * v115 / self->_params.systemCount, 6);

      v118 = -[NSMutableData bytes](self->_weightPlanePriorScaleFactors, "bytes");
      weightPlaneCount = self->_params.weightPlaneCount;
      v120 = -[NSMutableData length](self->_weightPlanePriorScaleFactors, "length");
      v121 = 4 * (3 * (_DWORD)v188);
      if (v121 >= v120)
        v121 = -[NSMutableData length](self->_weightPlanePriorScaleFactors, "length");
      objc_msgSend(v113, "setBytes:length:atIndex:", v118 + 4 * (3 * (_QWORD)v188 * v115 % (3 * weightPlaneCount)), v121, 14);
      v216 = self->_params.polynomialCount * (unint64_t)v188;
      v217 = *(_OWORD *)v191;
      v214 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v114, "maxTotalThreadsPerThreadgroup");
      v215 = *(_OWORD *)v191;
      objc_msgSend(v113, "dispatchThreads:threadsPerThreadgroup:", &v216, &v214);
      ++v115;
    }
    while (v115 < self->_params.systemCount);
  }
  objc_msgSend(v113, "endEncoding");

  v4 = v178;
  objc_msgSend(v178, "computeCommandEncoderWithDispatchType:", 1);
  v122 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v122)
  {
    fig_log_get_emitter();
    goto LABEL_106;
  }
  v123 = self->_computePipelineStates[8];
  objc_msgSend(v122, "setComputePipelineState:", v123);
  objc_msgSend(v122, "setBytes:length:atIndex:", p_params, 64, 0);
  objc_msgSend(v122, "setBytes:length:atIndex:", v237, 48, 8);
  if (self->_params.systemCount)
  {
    v124 = 0;
    *(int64x2_t *)v192 = vdupq_n_s64(1uLL);
    do
    {
      v125 = objc_loadWeakRetained(p_outputRHSBuffer);
      objc_msgSend(v122, "setBuffer:offset:atIndex:", v125, objc_msgSend(v125, "length") * v124 / locationb, 4);

      v126 = objc_loadWeakRetained(p_inputPriorFactorForRHSBuffer);
      objc_msgSend(v122, "setBuffer:offset:atIndex:", v126, objc_msgSend(v126, "length") * v124 / self->_params.systemCount, 7);

      v127 = -[NSMutableData bytes](self->_weightPlanePriorScaleFactors, "bytes");
      v128 = self->_params.weightPlaneCount;
      v129 = -[NSMutableData length](self->_weightPlanePriorScaleFactors, "length");
      v130 = 4 * (3 * (_DWORD)v188);
      if (v130 >= v129)
        v130 = -[NSMutableData length](self->_weightPlanePriorScaleFactors, "length");
      objc_msgSend(v122, "setBytes:length:atIndex:", v127 + 4 * (3 * (_QWORD)v188 * v124 % (3 * v128)), v130, 14);
      v212 = 12 * (_QWORD)v188;
      v213 = *(_OWORD *)v192;
      v210 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v123, "maxTotalThreadsPerThreadgroup");
      v211 = *(_OWORD *)v192;
      objc_msgSend(v122, "dispatchThreads:threadsPerThreadgroup:", &v212, &v210);
      ++v124;
    }
    while (v124 < self->_params.systemCount);
  }
  objc_msgSend(v122, "endEncoding");

  if (locationb <= self->_params.systemCount)
  {
    v148 = 0;
    v63 = v122;
    v4 = v178;
LABEL_77:
    v36 = v164;
    goto LABEL_89;
  }
  v4 = v178;
  objc_msgSend(v178, "computeCommandEncoderWithDispatchType:", 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v63)
  {
    fig_log_get_emitter();
    goto LABEL_108;
  }
  v131 = self->_computePipelineStates[9];
  objc_msgSend(v63, "setComputePipelineState:", v131);
  v230 = vmul_lane_s32(*(int32x2_t *)self->_anon_68, *(int32x2_t *)self->_anon_68, 1).u32[0];
  objc_msgSend(v63, "setBytes:length:atIndex:", &v230, 4, 13);
  v132 = self->_params.systemCount;
  v133 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v131, "maxTotalThreadsPerThreadgroup");
  v134 = -[MTLComputePipelineState threadExecutionWidth](v131, "threadExecutionWidth");
  v135 = self->_params.polynomialCount * self->_params.systemSize;
  v136 = v135 * v135;
  v209 = v135 * v135;
  v137 = objc_loadWeakRetained(v177);
  v138 = v136 * objc_msgSend(v137, "arrayLength") / v188;

  v208 = v138;
  objc_msgSend(v63, "setBytes:length:atIndex:", &v208, 4, 11);
  objc_msgSend(v63, "setBytes:length:atIndex:", &v209, 4, 12);
  v139 = v133 / v134;
  v184 = locationb - v132;
  if ((_DWORD)locationb != v132)
  {
    v140 = 0;
    if (v184 <= 1)
      v141 = 1;
    else
      v141 = locationb - v132;
    *(int64x2_t *)v193 = vdupq_n_s64(1uLL);
    do
    {
      v142 = objc_loadWeakRetained(p_outputLHSBuffer);
      objc_msgSend(v63, "setBuffer:offset:atIndex:", v142, 4 * v209 * v140, 4);

      v206 = (v139 - 1 + v209) / v139;
      v207 = *(_OWORD *)v193;
      v204 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v131, "maxTotalThreadsPerThreadgroup");
      v205 = *(_OWORD *)v193;
      objc_msgSend(v63, "dispatchThreadgroups:threadsPerThreadgroup:", &v206, &v204);
      ++v140;
    }
    while (v141 != v140);
  }
  v143 = 3 * self->_params.systemSize * self->_params.polynomialCount;
  v209 = v143;
  v144 = objc_loadWeakRetained(v177);
  v208 = v143 * objc_msgSend(v144, "arrayLength") / v188;

  objc_msgSend(v63, "setBytes:length:atIndex:", &v208, 4, 11);
  objc_msgSend(v63, "setBytes:length:atIndex:", &v209, 4, 12);
  if ((_DWORD)locationb != v132)
  {
    v145 = 0;
    if (v184 <= 1)
      v146 = 1;
    else
      v146 = locationb - v132;
    *(int64x2_t *)locationc = vdupq_n_s64(1uLL);
    do
    {
      v147 = objc_loadWeakRetained(p_outputRHSBuffer);
      objc_msgSend(v63, "setBuffer:offset:atIndex:", v147, 4 * v209 * v145, 4);

      v202 = (v139 - 1 + v209) / v139;
      v203 = *(_OWORD *)locationc;
      v200 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v131, "maxTotalThreadsPerThreadgroup");
      v201 = *(_OWORD *)locationc;
      objc_msgSend(v63, "dispatchThreadgroups:threadsPerThreadgroup:", &v202, &v200);
      ++v145;
    }
    while (v146 != v145);
  }
  objc_msgSend(v63, "endEncoding");

  v148 = 0;
  v36 = v164;
  v4 = v178;
LABEL_89:

  return v148;
}

- (MTLTexture)inputThumbnailTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputThumbnailTexture);
}

- (void)setInputThumbnailTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputThumbnailTexture, a3);
}

- (BOOL)inputIsLinear
{
  return self->_inputIsLinear;
}

- (void)setInputIsLinear:(BOOL)a3
{
  self->_inputIsLinear = a3;
}

- (MTLTexture)targetThumbnailTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_targetThumbnailTexture);
}

- (void)setTargetThumbnailTexture:(id)a3
{
  objc_storeWeak((id *)&self->_targetThumbnailTexture, a3);
}

- (BOOL)targetIsLinear
{
  return self->_targetIsLinear;
}

- (void)setTargetIsLinear:(BOOL)a3
{
  self->_targetIsLinear = a3;
}

- (MTLTexture)inputWeightPlanesTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputWeightPlanesTexture);
}

- (void)setInputWeightPlanesTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputWeightPlanesTexture, a3);
}

- (MTLBuffer)inputPolyExpandedInputBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_inputPolyExpandedInputBuffer);
}

- (void)setInputPolyExpandedInputBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputPolyExpandedInputBuffer, a3);
}

- (MTLBuffer)inputPairExpandedWeightsBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_inputPairExpandedWeightsBuffer);
}

- (void)setInputPairExpandedWeightsBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputPairExpandedWeightsBuffer, a3);
}

- (MTLTexture)inputPolyExpandedTargetTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputPolyExpandedTargetTexture);
}

- (void)setInputPolyExpandedTargetTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputPolyExpandedTargetTexture, a3);
}

- (MTLTexture)inputSpotlightTextureTopLeft
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputSpotlightTextureTopLeft);
}

- (void)setInputSpotlightTextureTopLeft:(id)a3
{
  objc_storeWeak((id *)&self->_inputSpotlightTextureTopLeft, a3);
}

- (MTLTexture)inputSpotlightTextureTopEdge
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputSpotlightTextureTopEdge);
}

- (void)setInputSpotlightTextureTopEdge:(id)a3
{
  objc_storeWeak((id *)&self->_inputSpotlightTextureTopEdge, a3);
}

- (MTLTexture)inputSpotlightTextureTopRight
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputSpotlightTextureTopRight);
}

- (void)setInputSpotlightTextureTopRight:(id)a3
{
  objc_storeWeak((id *)&self->_inputSpotlightTextureTopRight, a3);
}

- (MTLTexture)inputSpotlightTextureLeftEdge
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputSpotlightTextureLeftEdge);
}

- (void)setInputSpotlightTextureLeftEdge:(id)a3
{
  objc_storeWeak((id *)&self->_inputSpotlightTextureLeftEdge, a3);
}

- (MTLTexture)inputSpotlightTextureCentral
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputSpotlightTextureCentral);
}

- (void)setInputSpotlightTextureCentral:(id)a3
{
  objc_storeWeak((id *)&self->_inputSpotlightTextureCentral, a3);
}

- (MTLTexture)inputSpotlightTextureRightEdge
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputSpotlightTextureRightEdge);
}

- (void)setInputSpotlightTextureRightEdge:(id)a3
{
  objc_storeWeak((id *)&self->_inputSpotlightTextureRightEdge, a3);
}

- (MTLTexture)inputSpotlightTextureBottomLeft
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputSpotlightTextureBottomLeft);
}

- (void)setInputSpotlightTextureBottomLeft:(id)a3
{
  objc_storeWeak((id *)&self->_inputSpotlightTextureBottomLeft, a3);
}

- (MTLTexture)inputSpotlightTextureBottomEdge
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputSpotlightTextureBottomEdge);
}

- (void)setInputSpotlightTextureBottomEdge:(id)a3
{
  objc_storeWeak((id *)&self->_inputSpotlightTextureBottomEdge, a3);
}

- (MTLTexture)inputSpotlightTextureBottomRight
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputSpotlightTextureBottomRight);
}

- (void)setInputSpotlightTextureBottomRight:(id)a3
{
  objc_storeWeak((id *)&self->_inputSpotlightTextureBottomRight, a3);
}

- (MTLTexture)inputLearningModulationMaskTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputLearningModulationMaskTexture);
}

- (void)setInputLearningModulationMaskTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputLearningModulationMaskTexture, a3);
}

- (MTLBuffer)inputLHSDiagSumsBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_inputLHSDiagSumsBuffer);
}

- (void)setInputLHSDiagSumsBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputLHSDiagSumsBuffer, a3);
}

- (MTLBuffer)inputPriorFactorForLHSBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_inputPriorFactorForLHSBuffer);
}

- (void)setInputPriorFactorForLHSBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputPriorFactorForLHSBuffer, a3);
}

- (MTLBuffer)inputPriorFactorForRHSBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_inputPriorFactorForRHSBuffer);
}

- (void)setInputPriorFactorForRHSBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputPriorFactorForRHSBuffer, a3);
}

- (MTLBuffer)outputLHSBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_outputLHSBuffer);
}

- (void)setOutputLHSBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_outputLHSBuffer, a3);
}

- (MTLBuffer)outputRHSBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_outputRHSBuffer);
}

- (void)setOutputRHSBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_outputRHSBuffer, a3);
}

- (__n128)priorMatrix
{
  return a1[21];
}

- (__n128)setPriorMatrix:(__n128)a3
{
  result[21] = a2;
  result[22] = a3;
  result[23] = a4;
  return result;
}

- (BOOL)spatialAverageSystems
{
  return self->_spatialAverageSystems;
}

- (void)setSpatialAverageSystems:(BOOL)a3
{
  self->_spatialAverageSystems = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_destroyWeak((id *)&self->_outputRHSBuffer);
  objc_destroyWeak((id *)&self->_outputLHSBuffer);
  objc_destroyWeak((id *)&self->_inputPriorFactorForRHSBuffer);
  objc_destroyWeak((id *)&self->_inputPriorFactorForLHSBuffer);
  objc_destroyWeak((id *)&self->_inputLHSDiagSumsBuffer);
  objc_destroyWeak((id *)&self->_inputLearningModulationMaskTexture);
  objc_destroyWeak((id *)&self->_inputSpotlightTextureBottomRight);
  objc_destroyWeak((id *)&self->_inputSpotlightTextureBottomEdge);
  objc_destroyWeak((id *)&self->_inputSpotlightTextureBottomLeft);
  objc_destroyWeak((id *)&self->_inputSpotlightTextureRightEdge);
  objc_destroyWeak((id *)&self->_inputSpotlightTextureCentral);
  objc_destroyWeak((id *)&self->_inputSpotlightTextureLeftEdge);
  objc_destroyWeak((id *)&self->_inputSpotlightTextureTopRight);
  objc_destroyWeak((id *)&self->_inputSpotlightTextureTopEdge);
  objc_destroyWeak((id *)&self->_inputSpotlightTextureTopLeft);
  objc_destroyWeak((id *)&self->_inputPolyExpandedTargetTexture);
  objc_destroyWeak((id *)&self->_inputPairExpandedWeightsBuffer);
  objc_destroyWeak((id *)&self->_inputPolyExpandedInputBuffer);
  objc_destroyWeak((id *)&self->_inputWeightPlanesTexture);
  objc_destroyWeak((id *)&self->_targetThumbnailTexture);
  objc_destroyWeak((id *)&self->_inputThumbnailTexture);
  objc_storeStrong((id *)&self->_weightPlanePriorScaleFactors, 0);
  v3 = 80;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
