@implementation CMIStyleEngineDownScaler

- (CMIStyleEngineDownScaler)initWithMetalContext:(id)a3
{
  id v4;
  CMIStyleEngineDownScaler *v5;
  CMIStyleEngineDownScaler *v6;
  CMIStyleEngineDownScaler *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMIStyleEngineDownScaler;
  v5 = -[CMIStyleEngineDownScaler init](&v9, sel_init);
  v6 = v5;
  if (!v5 || -[CMIStyleEngineDownScaler _compileShaders:](v5, "_compileShaders:", v4))
  {
    FigDebugAssert3();
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
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
  MTLComputePipelineState *v27;
  MTLComputePipelineState *v28;
  MTLComputePipelineState *v29;
  MTLComputePipelineState *v30;
  MTLComputePipelineState *v31;
  MTLComputePipelineState *v32;
  MTLComputePipelineState *v33;
  MTLComputePipelineState *v34;
  MTLComputePipelineState *v35;
  MTLComputePipelineState *v36;
  MTLComputePipelineState *v37;
  MTLComputePipelineState *v38;
  MTLComputePipelineState *v39;
  MTLComputePipelineState *v40;
  MTLComputePipelineState *v41;
  MTLComputePipelineState *v42;
  MTLComputePipelineState *v43;
  MTLComputePipelineState *v44;
  MTLComputePipelineState *v45;
  MTLComputePipelineState *v46;
  int v47;
  __int16 v49;
  __int16 v50;
  __int16 v51;

  v4 = a3;
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  styleEngineSharedFunctionConstants(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_24;
  v51 = 0;
  v50 = 0;
  v49 = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v49, 41, CFSTR("StyleEngine::exactScale"));
  LOBYTE(v50) = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v50, 53, CFSTR("StyleEngine::antiAlias"));
  LOBYTE(v51) = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScaleFiltered2x"), v6);
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v8 = self->_computePipelineStates[4];
  self->_computePipelineStates[4] = v7;

  if (!self->_computePipelineStates[4])
    goto LABEL_24;
  LOBYTE(v51) = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScaleFiltered2x"), v6);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v10 = self->_computePipelineStates[8];
  self->_computePipelineStates[8] = v9;

  if (!self->_computePipelineStates[8])
    goto LABEL_24;
  LOBYTE(v50) = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v50, 53, CFSTR("StyleEngine::antiAlias"));
  LOBYTE(v51) = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScaleFiltered2x"), v6);
  v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v12 = self->_computePipelineStates[5];
  self->_computePipelineStates[5] = v11;

  if (!self->_computePipelineStates[5])
    goto LABEL_24;
  LOBYTE(v51) = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScaleFiltered2x"), v6);
  v13 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v14 = self->_computePipelineStates[9];
  self->_computePipelineStates[9] = v13;

  if (!self->_computePipelineStates[9])
    goto LABEL_24;
  v49 = 2;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v49, 41, CFSTR("StyleEngine::exactScale"));
  LOBYTE(v50) = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v50, 53, CFSTR("StyleEngine::antiAlias"));
  LOBYTE(v51) = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScaleFiltered2x"), v6);
  v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v16 = self->_computePipelineStates[6];
  self->_computePipelineStates[6] = v15;

  if (!self->_computePipelineStates[6])
    goto LABEL_24;
  LOBYTE(v51) = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScaleFiltered2x"), v6);
  v17 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v18 = self->_computePipelineStates[10];
  self->_computePipelineStates[10] = v17;

  if (!self->_computePipelineStates[10])
    goto LABEL_24;
  LOBYTE(v50) = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v50, 53, CFSTR("StyleEngine::antiAlias"));
  LOBYTE(v51) = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScaleFiltered2x"), v6);
  v19 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v20 = self->_computePipelineStates[7];
  self->_computePipelineStates[7] = v19;

  if (!self->_computePipelineStates[7])
    goto LABEL_24;
  LOBYTE(v51) = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScaleFiltered2x"), v6);
  v21 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v22 = self->_computePipelineStates[11];
  self->_computePipelineStates[11] = v21;

  if (!self->_computePipelineStates[11])
    goto LABEL_24;
  v49 = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v49, 41, CFSTR("StyleEngine::exactScale"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScaleExact4x"), v6);
  v23 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v24 = self->_computePipelineStates[2];
  self->_computePipelineStates[2] = v23;

  if (!self->_computePipelineStates[2])
    goto LABEL_24;
  v49 = 2;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v49, 41, CFSTR("StyleEngine::exactScale"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScaleExact4x"), v6);
  v25 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v26 = self->_computePipelineStates[3];
  self->_computePipelineStates[3] = v25;

  if (!self->_computePipelineStates[3])
    goto LABEL_24;
  v49 = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v49, 41, CFSTR("StyleEngine::exactScale"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScaleExact"), v6);
  v27 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v28 = self->_computePipelineStates[0];
  self->_computePipelineStates[0] = v27;

  if (!self->_computePipelineStates[0])
    goto LABEL_24;
  v49 = 2;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v49, 41, CFSTR("StyleEngine::exactScale"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScaleExact"), v6);
  v29 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v30 = self->_computePipelineStates[1];
  self->_computePipelineStates[1] = v29;

  if (!self->_computePipelineStates[1])
    goto LABEL_24;
  HIBYTE(v50) = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", (char *)&v50 + 1, 53, CFSTR("StyleEngine::useQuadGroup"));
  LOBYTE(v51) = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScale"), v6);
  v31 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v32 = self->_computePipelineStates[12];
  self->_computePipelineStates[12] = v31;

  if (!self->_computePipelineStates[12])
    goto LABEL_24;
  LOBYTE(v51) = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScale"), v6);
  v33 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v34 = self->_computePipelineStates[13];
  self->_computePipelineStates[13] = v33;

  if (!self->_computePipelineStates[13])
    goto LABEL_24;
  HIBYTE(v50) = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", (char *)&v50 + 1, 53, CFSTR("StyleEngine::useQuadGroup"));
  LOBYTE(v51) = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScale"), v6);
  v35 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v36 = self->_computePipelineStates[14];
  self->_computePipelineStates[14] = v35;

  if (!self->_computePipelineStates[14])
    goto LABEL_24;
  LOBYTE(v51) = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::DownScale"), v6);
  v37 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v38 = self->_computePipelineStates[15];
  self->_computePipelineStates[15] = v37;

  if (!self->_computePipelineStates[15])
    goto LABEL_24;
  HIBYTE(v51) = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", (char *)&v51 + 1, 53, CFSTR("StyleEngine::nearestSampling"));
  LOBYTE(v51) = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::SimpleFilter"), v6);
  v39 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v40 = self->_computePipelineStates[16];
  self->_computePipelineStates[16] = v39;

  if (!self->_computePipelineStates[16])
    goto LABEL_24;
  LOBYTE(v51) = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::SimpleFilter"), v6);
  v41 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v42 = self->_computePipelineStates[17];
  self->_computePipelineStates[17] = v41;

  if (!self->_computePipelineStates[17])
    goto LABEL_24;
  HIBYTE(v51) = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", (char *)&v51 + 1, 53, CFSTR("StyleEngine::nearestSampling"));
  LOBYTE(v51) = 0;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::SimpleFilter"), v6);
  v43 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v44 = self->_computePipelineStates[18];
  self->_computePipelineStates[18] = v43;

  if (!self->_computePipelineStates[18])
    goto LABEL_24;
  LOBYTE(v51) = 1;
  objc_msgSend(v6, "setConstantValue:type:withName:", &v51, 53, CFSTR("StyleEngine::applyGDC"));
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::SimpleFilter"), v6);
  v45 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v46 = self->_computePipelineStates[19];
  self->_computePipelineStates[19] = v45;

  if (self->_computePipelineStates[19])
  {
    v47 = 0;
  }
  else
  {
LABEL_24:
    FigDebugAssert3();
    v47 = FigSignalErrorAt();
  }

  return v47;
}

- (int)enqueueToCommandBuffer:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;
  unint64_t filter;
  id WeakRetained;
  void *v9;
  MTLTexture **p_outputTexture;
  id v11;
  id v12;
  double width;
  id v14;
  double height;
  CGFloat x;
  CGFloat y;
  int v18;
  void *v19;
  id v20;
  CGFloat v21;
  id v22;
  BOOL v23;
  int v24;
  CGFloat MinY;
  float64x2_t v26;
  CGSize boxSize;
  int32x2_t v28;
  unsigned int v29;
  unsigned int v30;
  id v31;
  unsigned int v32;
  id v33;
  int8x8_t v34;
  int v35;
  unsigned int v36;
  int32x2_t v37;
  id v38;
  id v39;
  const $0B57B161DD08FFA902CA30037FAFD2DD *gdcParams;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  MTLTexture **v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  MTLComputePipelineState *v51;
  unsigned int v52;
  int v53;
  int32x2_t v54;
  int8x8_t v55;
  int32x2_t v56;
  int32x2_t v57;
  int32x2_t v58;
  int8x16_t v59;
  int8x16_t v60;
  uint64_t v61;
  MTLComputePipelineState *v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  _QWORD *v69;
  _QWORD *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  MTLComputePipelineState *v78;
  unsigned int v79;
  int v80;
  int32x2_t v81;
  int8x8_t v82;
  int32x2_t v83;
  int32x2_t v84;
  int32x2_t v85;
  int8x16_t v86;
  int8x16_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  id v91;
  float v92;
  MTLComputePipelineState *v93;
  uint64_t v94;
  id v95;
  _QWORD *v96;
  int64x2_t *v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  id v101;
  float v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  id v107;
  float v108;
  unint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  id v113;
  float v114;
  unint64_t v115;
  double v116;
  id v117;
  double v118;
  id v119;
  double v120;
  uint64_t v121;
  MTLComputePipelineState *v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  uint64_t v126;
  unsigned int v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  unint64_t v131;
  unint64_t v132;
  MTLTexture **v133;
  unint64_t v134;
  unint64_t v135;
  int v136;
  unint64_t v137;
  id *v138;
  id v139;
  unsigned int v140;
  id v141;
  unsigned int v142;
  int8x8_t v143;
  int8x8_t v144;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  int8x8_t v149;
  CGFloat MinX;
  id v151;
  _QWORD v152[3];
  _QWORD v153[3];
  uint64_t v154;
  int64x2_t v155;
  unint64_t v156;
  int64x2_t v157;
  int64x2_t v158;
  uint64_t v159;
  _QWORD v160[3];
  int64x2_t v161;
  uint64_t v162;
  _QWORD v163[3];
  int64x2_t v164;
  uint64_t v165;
  _QWORD v166[3];
  int64x2_t v167;
  uint64_t v168;
  _QWORD v169[3];
  _QWORD v170[3];
  _QWORD v171[3];
  _QWORD v172[3];
  int8x16_t v173;
  uint64_t v174;
  _QWORD v175[3];
  int8x16_t v176;
  uint64_t v177;
  int v178;
  float32x2_t v179;
  unsigned __int16 v180;
  unsigned __int16 v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;

  v4 = v3;
  v6 = a3;
  filter = self->_filter;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputTexture);
  if (!WeakRetained)
    goto LABEL_5;
  v9 = WeakRetained;
  p_outputTexture = &self->_outputTexture;
  v11 = objc_loadWeakRetained((id *)&self->_outputTexture);

  if (!v11)
    goto LABEL_5;
  if (CGRectIsEmpty(self->_inputCropRect))
  {
    v12 = objc_loadWeakRetained((id *)&self->_inputTexture);
    width = (double)(unint64_t)objc_msgSend(v12, "width");
    v14 = objc_loadWeakRetained((id *)&self->_inputTexture);
    height = (double)(unint64_t)objc_msgSend(v14, "height");

    x = 0.0;
    y = 0.0;
  }
  else
  {
    x = self->_inputCropRect.origin.x;
    y = self->_inputCropRect.origin.y;
    width = self->_inputCropRect.size.width;
    height = self->_inputCropRect.size.height;
  }
  v20 = objc_loadWeakRetained((id *)&self->_inputTexture);
  v21 = (double)(unint64_t)objc_msgSend(v20, "width");
  v22 = objc_loadWeakRetained((id *)&self->_inputTexture);
  v182.size.height = (double)(unint64_t)objc_msgSend(v22, "height");
  v182.origin.x = 0.0;
  v182.origin.y = 0.0;
  v182.size.width = v21;
  v189.origin.x = x;
  v189.origin.y = y;
  v189.size.width = width;
  v189.size.height = height;
  v23 = CGRectContainsRect(v182, v189);

  if (!v23)
  {
LABEL_5:
    v147 = v3;
    LODWORD(v146) = 0;
    FigDebugAssert3();
    v18 = FigSignalErrorAt();
    v19 = 0;
    goto LABEL_91;
  }
  objc_msgSend(v6, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v147 = v3;
    LODWORD(v146) = 0;
    FigDebugAssert3();
    v18 = FigSignalErrorAt();
    goto LABEL_91;
  }
  v183.origin.x = x;
  v183.origin.y = y;
  v183.size.width = width;
  v183.size.height = height;
  v24 = (int)CGRectGetWidth(v183);
  v184.origin.x = x;
  v184.origin.y = y;
  v184.size.width = width;
  v184.size.height = height;
  v180 = v24;
  v181 = (int)CGRectGetHeight(v184);
  v185.origin.x = x;
  v185.origin.y = y;
  v185.size.width = width;
  v185.size.height = height;
  MinX = CGRectGetMinX(v185);
  v186.origin.x = x;
  v186.origin.y = y;
  v186.size.width = width;
  v186.size.height = height;
  MinY = CGRectGetMinY(v186);
  v26.f64[0] = MinX;
  v26.f64[1] = MinY;
  v179 = vcvt_f32_f64(v26);
  objc_msgSend(v19, "setBytes:length:atIndex:", &v180, 4, 0);
  objc_msgSend(v19, "setBytes:length:atIndex:", &v179, 8, 1);
  v178 = 0;
  boxSize = self->_boxSize;
  v28 = vmovn_s64(vceqq_f64((float64x2_t)boxSize, *MEMORY[0x1E0C9D820]));
  v151 = v6;
  if ((v28.i32[0] & v28.i32[1] & 1) != 0)
  {
    v29 = v180;
    v30 = v181;
    v31 = objc_loadWeakRetained((id *)&self->_outputTexture);
    v32 = objc_msgSend(v31, "width");
    v33 = objc_loadWeakRetained((id *)&self->_outputTexture);
    v34 = vand_s8((int8x8_t)__PAIR64__(objc_msgSend(v33, "height"), v32), (int8x8_t)0xFFFF0000FFFFLL);
    v35 = v30 / v34.i32[1];
    v4 = v3;
    LOWORD(v36) = v29 / v34.i32[0];
    HIWORD(v36) = v35;
    v148 = vmovl_u16(vmax_u16((uint16x4_t)v36, (uint16x4_t)65537)).u64[0];

    p_outputTexture = &self->_outputTexture;
    v37 = (int32x2_t)v148;
  }
  else
  {
    v37 = vmovn_s64(vcvtq_s64_f64((float64x2_t)boxSize));
  }
  HIWORD(v178) = v37.i16[2];
  LOWORD(v178) = v37.i16[0];
  objc_msgSend(v19, "setBytes:length:atIndex:", &v178, 4, 2);
  v38 = objc_loadWeakRetained((id *)&self->_inputTexture);
  objc_msgSend(v19, "setTexture:atIndex:", v38, 0);

  v39 = objc_loadWeakRetained((id *)p_outputTexture);
  objc_msgSend(v19, "setTexture:atIndex:", v39, 1);

  gdcParams = self->_gdcParams;
  if (gdcParams)
    objc_msgSend(v19, "setBytes:length:atIndex:", self->_gdcParams, 112, 3);
  if (filter - 2 >= 2)
  {
    if (filter == 1)
    {
      v61 = 19;
      if (!gdcParams)
        v61 = 18;
      v62 = self->_computePipelineStates[v61];
      objc_msgSend(v19, "setComputePipelineState:", v62);
      v63 = -[MTLComputePipelineState threadExecutionWidth](v62, "threadExecutionWidth");
      v64 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v62, "maxTotalThreadsPerThreadgroup");
      v65 = v64 / v63;
      objc_msgSend(v19, "setImageblockWidth:height:", v63, v64 / v63);
      v66 = objc_loadWeakRetained((id *)p_outputTexture);
      v67 = objc_msgSend(v66, "width");
      v68 = objc_loadWeakRetained((id *)p_outputTexture);

      v171[0] = v67;
      v171[1] = objc_msgSend(v68, "height");
      v171[2] = 1;
      v170[0] = v63;
      v170[1] = v65;
      v170[2] = 1;
      v69 = v171;
      v70 = v170;
LABEL_29:
      objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", v69, v70);

      goto LABEL_90;
    }
    if (gdcParams)
      goto LABEL_73;
    v88 = v180;
    v89 = objc_loadWeakRetained((id *)p_outputTexture);
    if (objc_msgSend(v89, "width") == v88)
    {
      v90 = v181;
      v91 = objc_loadWeakRetained((id *)p_outputTexture);
      if (objc_msgSend(v91, "height") == v90 && v179.f32[0] == 0.0)
      {
        v92 = v179.f32[1];

        if (v92 == 0.0)
        {
          objc_msgSend(v19, "setComputePipelineState:", self->_computePipelineStates[0]);
          objc_msgSend(v19, "setImageblockWidth:height:", 16, 16);
          v93 = (MTLComputePipelineState *)objc_loadWeakRetained((id *)p_outputTexture);
          v94 = -[MTLComputePipelineState width](v93, "width");
          v95 = objc_loadWeakRetained((id *)p_outputTexture);
          v169[0] = v94;
          v169[1] = objc_msgSend(v95, "height");
          v169[2] = 1;
          v167 = vdupq_n_s64(0x10uLL);
          v168 = 1;
          v96 = v169;
          v97 = &v167;
LABEL_70:
          objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", v96, v97);

          goto LABEL_89;
        }
LABEL_51:
        v98 = v180;
        v99 = objc_loadWeakRetained((id *)p_outputTexture);
        if (v98 == 2 * objc_msgSend(v99, "width"))
        {
          v100 = v181;
          v101 = objc_loadWeakRetained((id *)p_outputTexture);
          if (v100 == 2 * objc_msgSend(v101, "height") && v179.f32[0] == 0.0)
          {
            v102 = v179.f32[1];

            if (v102 == 0.0)
            {
              objc_msgSend(v19, "setComputePipelineState:", self->_computePipelineStates[1]);
              objc_msgSend(v19, "setImageblockWidth:height:", 16, 16);
              v93 = (MTLComputePipelineState *)objc_loadWeakRetained((id *)p_outputTexture);
              v103 = -[MTLComputePipelineState width](v93, "width");
              v95 = objc_loadWeakRetained((id *)p_outputTexture);
              v166[0] = v103;
              v166[1] = objc_msgSend(v95, "height");
              v166[2] = 1;
              v164 = vdupq_n_s64(0x10uLL);
              v165 = 1;
              v96 = v166;
              v97 = &v164;
              goto LABEL_70;
            }
LABEL_58:
            v104 = v180;
            v105 = objc_loadWeakRetained((id *)p_outputTexture);
            if (v104 == 4 * objc_msgSend(v105, "width"))
            {
              v106 = v181;
              v107 = objc_loadWeakRetained((id *)p_outputTexture);
              if (v106 == 4 * objc_msgSend(v107, "height") && v179.f32[0] == 0.0)
              {
                v108 = v179.f32[1];

                if (v108 == 0.0)
                {
                  objc_msgSend(v19, "setComputePipelineState:", self->_computePipelineStates[2]);
                  objc_msgSend(v19, "setImageblockWidth:height:", 16, 16);
                  v93 = (MTLComputePipelineState *)objc_loadWeakRetained((id *)p_outputTexture);
                  v109 = (2 * -[MTLComputePipelineState width](v93, "width") + 31) & 0xFFFFFFFFFFFFFFE0;
                  v95 = objc_loadWeakRetained((id *)p_outputTexture);
                  v163[0] = v109;
                  v163[1] = (2 * objc_msgSend(v95, "height") + 31) & 0xFFFFFFFFFFFFFFE0;
                  v163[2] = 1;
                  v161 = vdupq_n_s64(0x20uLL);
                  v162 = 1;
                  v96 = v163;
                  v97 = &v161;
                  goto LABEL_70;
                }
LABEL_65:
                v110 = v180;
                v111 = objc_loadWeakRetained((id *)p_outputTexture);
                if (v110 == 8 * objc_msgSend(v111, "width"))
                {
                  v112 = v181;
                  v113 = objc_loadWeakRetained((id *)p_outputTexture);
                  if (v112 == 8 * objc_msgSend(v113, "height") && v179.f32[0] == 0.0)
                  {
                    v114 = v179.f32[1];

                    if (v114 == 0.0)
                    {
                      objc_msgSend(v19, "setComputePipelineState:", self->_computePipelineStates[3]);
                      objc_msgSend(v19, "setImageblockWidth:height:", 8, 8);
                      v93 = (MTLComputePipelineState *)objc_loadWeakRetained((id *)p_outputTexture);
                      v115 = (4 * -[MTLComputePipelineState width](v93, "width") + 31) & 0xFFFFFFFFFFFFFFE0;
                      v95 = objc_loadWeakRetained((id *)p_outputTexture);
                      v160[0] = v115;
                      v160[1] = (4 * objc_msgSend(v95, "height") + 31) & 0xFFFFFFFFFFFFFFE0;
                      v160[2] = 1;
                      v158 = vdupq_n_s64(0x20uLL);
                      v159 = 1;
                      v96 = v160;
                      v97 = &v158;
                      goto LABEL_70;
                    }
LABEL_73:
                    v187.origin.x = x;
                    v187.origin.y = y;
                    v187.size.width = width;
                    v187.size.height = height;
                    v116 = CGRectGetWidth(v187);
                    v117 = objc_loadWeakRetained((id *)p_outputTexture);
                    if (v116 > (double)(unint64_t)(2 * objc_msgSend(v117, "width")))
                    {

                    }
                    else
                    {
                      v188.origin.x = x;
                      v188.origin.y = y;
                      v188.size.width = width;
                      v188.size.height = height;
                      v118 = CGRectGetHeight(v188);
                      v119 = objc_loadWeakRetained((id *)p_outputTexture);
                      v120 = (double)(unint64_t)(2 * objc_msgSend(v119, "height"));

                      if (v118 <= v120)
                      {
                        v121 = 17;
                        if (!gdcParams)
                          v121 = 16;
                        v122 = self->_computePipelineStates[v121];
                        objc_msgSend(v19, "setComputePipelineState:", v122);
                        v123 = -[MTLComputePipelineState threadExecutionWidth](v122, "threadExecutionWidth");
                        v124 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v122, "maxTotalThreadsPerThreadgroup");
                        v125 = v124 / v123;
                        objc_msgSend(v19, "setImageblockWidth:height:", v123, v124 / v123);
                        v66 = objc_loadWeakRetained((id *)p_outputTexture);
                        v126 = objc_msgSend(v66, "width");
                        v68 = objc_loadWeakRetained((id *)p_outputTexture);

                        v153[0] = v126;
                        v153[1] = objc_msgSend(v68, "height");
                        v153[2] = 1;
                        v152[0] = v123;
                        v152[1] = v125;
                        v152[2] = 1;
                        v69 = v153;
                        v70 = v152;
                        goto LABEL_29;
                      }
                    }
                    v127 = (unsigned __int16)v178 * HIWORD(v178);
                    v128 = 14;
                    if (gdcParams)
                      v128 = 15;
                    v129 = 12;
                    if (gdcParams)
                      v129 = 13;
                    if (v127 >= 5)
                      v128 = v129;
                    v93 = self->_computePipelineStates[v128];
                    v130 = v19;
                    objc_msgSend(v19, "setComputePipelineState:", v93);
                    v131 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v93, "maxTotalThreadsPerThreadgroup");
                    v132 = v131 / -[MTLComputePipelineState threadExecutionWidth](v93, "threadExecutionWidth");
                    v133 = p_outputTexture;
                    if (v127 > 4)
                      v134 = 1;
                    else
                      v134 = (unint64_t)-[MTLComputePipelineState threadExecutionWidth](v93, "threadExecutionWidth") >> 2;
                    v135 = v134 * v132;
                    v136 = 1 << fls((int)sqrtf((float)(v134 * v132)) - 1);
                    v137 = v135 / v136;
                    objc_msgSend(v130, "setImageblockWidth:height:");
                    v138 = (id *)v133;
                    v19 = v130;
                    v139 = objc_loadWeakRetained(v138);
                    v140 = objc_msgSend(v139, "width");
                    v141 = objc_loadWeakRetained(v138);
                    v142 = objc_msgSend(v141, "height");
                    v143 = vand_s8((int8x8_t)__PAIR64__(v137, v136), (int8x8_t)0xFFFF0000FFFFLL);
                    v144 = vand_s8((int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v137, v136), vadd_s32((int32x2_t)__PAIR64__(v142, v140), (int32x2_t)-1)), (int8x8_t)0xFFFF0000FFFFLL);
                    v144.i32[0] /= (unsigned __int32)v143.i32[0];
                    v144.i32[1] /= (unsigned __int32)v143.i32[1];
                    v149 = v144;

                    v156 = v149.u32[0] * (unint64_t)v149.u32[1];
                    v157 = vdupq_n_s64(1uLL);
                    v154 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v93, "maxTotalThreadsPerThreadgroup");
                    v155 = v157;
                    objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", &v156, &v154);
LABEL_89:

                    goto LABEL_90;
                  }

                }
                goto LABEL_73;
              }

            }
            goto LABEL_65;
          }

        }
        goto LABEL_58;
      }

    }
    goto LABEL_51;
  }
  v41 = v180;
  v42 = objc_loadWeakRetained((id *)p_outputTexture);
  if (v41 == 2 * objc_msgSend(v42, "width"))
  {
    v43 = v181;
    v44 = objc_loadWeakRetained((id *)p_outputTexture);
    v45 = v19;
    v46 = p_outputTexture;
    v47 = objc_msgSend(v44, "height");

    v48 = v43 == 2 * v47;
    p_outputTexture = v46;
    v19 = v45;
    if (!v48)
      goto LABEL_31;
    v49 = 8;
    if (filter == 3)
      v49 = 9;
    v50 = 4;
    if (filter == 3)
      v50 = 5;
    if (!gdcParams)
      v49 = v50;
    v51 = self->_computePipelineStates[v49];
    v52 = -[MTLComputePipelineState threadExecutionWidth](v51, "threadExecutionWidth");
    v53 = 1 << (fls(-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v51, "maxTotalThreadsPerThreadgroup")/ (unint64_t)-[MTLComputePipelineState threadExecutionWidth](v51, "threadExecutionWidth"))- 1);
    v54.i16[0] = v180;
    v54.i16[2] = v181;
    v55 = vand_s8((int8x8_t)__PAIR64__(v53, v52), (int8x8_t)0xFFFF0000FFFFLL);
    v56 = vadd_s32(vadd_s32((int32x2_t)__PAIR64__(v53, v52), v54), (int32x2_t)0xFFFF0000FFFFLL);
    v57 = (int32x2_t)vand_s8((int8x8_t)v56, (int8x8_t)0xFFFF0000FFFFLL);
    v57.i32[0] %= (unsigned __int32)v55.i32[0];
    v57.i32[1] %= (unsigned __int32)v55.i32[1];
    v58 = vsub_s32(v56, v57);
    objc_msgSend(v19, "setComputePipelineState:", v51);

    objc_msgSend(v19, "setImageblockWidth:height:", (unsigned __int16)v52 >> 1, (unsigned __int16)v53 >> 1);
    v59.i64[0] = v58.u32[0];
    v59.i64[1] = v58.u32[1];
    v60.i64[0] = 0xFFFFLL;
    v60.i64[1] = 0xFFFFLL;
    v176 = vandq_s8(v59, v60);
    v177 = 1;
    v175[0] = (unsigned __int16)v52;
    v175[1] = (unsigned __int16)v53;
    v175[2] = 1;
    objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", &v176, v175);
LABEL_90:
    v18 = 0;
    v6 = v151;
    goto LABEL_91;
  }

LABEL_31:
  v71 = v180;
  v72 = objc_loadWeakRetained((id *)p_outputTexture);
  if (v71 != 4 * objc_msgSend(v72, "width"))
  {

    v6 = v151;
LABEL_48:
    v147 = v4;
    v18 = 4;
    LODWORD(v146) = 4;
    FigDebugAssert3();
    goto LABEL_91;
  }
  v73 = v181;
  v74 = objc_loadWeakRetained((id *)p_outputTexture);
  v75 = objc_msgSend(v74, "height");

  v48 = v73 == 4 * v75;
  v6 = v151;
  if (!v48)
    goto LABEL_48;
  v76 = 10;
  if (filter == 3)
    v76 = 11;
  v77 = 6;
  if (filter == 3)
    v77 = 7;
  if (!gdcParams)
    v76 = v77;
  v78 = self->_computePipelineStates[v76];
  v79 = -[MTLComputePipelineState threadExecutionWidth](v78, "threadExecutionWidth");
  v80 = 1 << (fls(-[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v78, "maxTotalThreadsPerThreadgroup")/ (unint64_t)-[MTLComputePipelineState threadExecutionWidth](v78, "threadExecutionWidth"))- 1);
  v81.i16[0] = v180;
  v81.i16[2] = v181;
  v82 = vand_s8((int8x8_t)__PAIR64__(v80, v79), (int8x8_t)0xFFFF0000FFFFLL);
  v83 = vadd_s32(vadd_s32((int32x2_t)__PAIR64__(v80, v79), v81), (int32x2_t)0xFFFF0000FFFFLL);
  v84 = (int32x2_t)vand_s8((int8x8_t)v83, (int8x8_t)0xFFFF0000FFFFLL);
  v84.i32[0] %= (unsigned __int32)v82.i32[0];
  v84.i32[1] %= (unsigned __int32)v82.i32[1];
  v85 = vsub_s32(v83, v84);
  objc_msgSend(v19, "setComputePipelineState:", v78);

  objc_msgSend(v19, "setImageblockWidth:height:", (unsigned __int16)v79 >> 2, (unsigned __int16)v80 >> 2);
  v86.i64[0] = v85.u32[0];
  v86.i64[1] = v85.u32[1];
  v87.i64[0] = 0xFFFFLL;
  v87.i64[1] = 0xFFFFLL;
  v173 = vandq_s8(v86, v87);
  v174 = 1;
  v172[0] = (unsigned __int16)v79;
  v172[1] = (unsigned __int16)v80;
  v172[2] = 1;
  v6 = v151;
  objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", &v173, v172);
  v18 = 0;
LABEL_91:
  objc_msgSend(v19, "endEncoding", v146, v147);

  return v18;
}

- (MTLTexture)inputTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputTexture);
}

- (void)setInputTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputTexture, a3);
}

- (MTLTexture)outputTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputTexture);
}

- (void)setOutputTexture:(id)a3
{
  objc_storeWeak((id *)&self->_outputTexture, a3);
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

- (void)setInputCropRect:(CGRect)a3
{
  self->_inputCropRect = a3;
}

- (const)gdcParams
{
  return self->_gdcParams;
}

- (void)setGdcParams:(id *)a3
{
  self->_gdcParams = a3;
}

- (CGSize)boxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_boxSize.width;
  height = self->_boxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBoxSize:(CGSize)a3
{
  self->_boxSize = a3;
}

- (unint64_t)filter
{
  return self->_filter;
}

- (void)setFilter:(unint64_t)a3
{
  self->_filter = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_destroyWeak((id *)&self->_outputTexture);
  objc_destroyWeak((id *)&self->_inputTexture);
  v3 = 160;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end
