@implementation ADPearlColorInFieldCalibrationPipeline

- (ADPearlColorInFieldCalibrationPipeline)init
{
  void *v3;
  ADPearlColorInFieldCalibrationPipeline *v4;

  self->_colorInputProcessingSession = 0;
  v3 = (void *)objc_opt_new();
  v4 = -[ADPearlColorInFieldCalibrationPipeline initWithParameters:espressoEngine:](self, "initWithParameters:espressoEngine:", v3, 4);

  return v4;
}

- (ADPearlColorInFieldCalibrationPipeline)initWithParameters:(id)a3 espressoEngine:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  ADPearlColorInFieldCalibrationPipeline *v10;
  ADPearlColorInFieldCalibrationPipeline *v11;
  id *p_controllerParameters;
  id v13;
  int v14;
  int networkFlowType;
  uint64_t v16;
  ADNetworkProvider *v17;
  uint64_t v18;
  uint64_t v19;
  ADNetworkProvider *backendNetworkProvider;
  ADNetworkProvider *frontendNetworkProvider;
  ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor *v22;
  ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor *backendInferenceDesc;
  ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor *v24;
  ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor *frontendInferenceDesc;
  uint64_t v26;
  ADReprojection *pearlReprojector;
  uint64_t v28;
  id v29;
  double v30;
  ADPearlColorInFieldCalibrationPipeline *v31;
  objc_super v33;
  uint8_t buf[8];
  int v35;
  __int128 v36;
  __int128 v37;

  v7 = a3;
  v35 = 335685188;
  v36 = 0u;
  v37 = 0u;
  kdebug_trace();
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v8 = MEMORY[0x24BDACB70];
    v9 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v8 = MEMORY[0x24BDACB70];
    v9 = OS_LOG_TYPE_INFO;
  }
  _os_log_impl(&dword_20B62B000, v8, v9, "Pearl Color In-Field calibration pipeline init for", buf, 2u);
LABEL_7:
  v33.receiver = self;
  v33.super_class = (Class)ADPearlColorInFieldCalibrationPipeline;
  v10 = -[ADPearlColorInFieldCalibrationPipeline init](&v33, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_22;
  p_controllerParameters = (id *)&v10->_controllerParameters;
  v10->_colorImageRaw = 0;
  *(_OWORD *)&v10->_referenceCameraNumOfPoints = 0u;
  *(_OWORD *)&v10->_rectifiedPoints = 0u;
  *(_OWORD *)v10->_origWorldPoints = 0u;
  objc_storeStrong((id *)&v10->_pipelineParameters, a3);
  -[ADPipelineParameters deviceName](v11->_pipelineParameters, "deviceName");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "hasPrefix:", CFSTR("N301")) & 1) != 0)
  {
    v14 = 0;
  }
  else if (objc_msgSend(v13, "hasPrefix:", CFSTR("J7")))
  {
    v14 = 2;
  }
  else
  {
    v14 = 1;
  }

  v11->_networkFlowType = v14;
  networkFlowType = v11->_networkFlowType;
  if (networkFlowType == 2)
  {
    +[ADNetworkProvider providerForNetwork:espressoEngine:](ADNetworkProvider, "providerForNetwork:espressoEngine:", CFSTR("NuCoReNetBackend"), a4);
    v19 = objc_claimAutoreleasedReturnValue();
    backendNetworkProvider = v11->_backendNetworkProvider;
    v11->_backendNetworkProvider = (ADNetworkProvider *)v19;

    +[ADNetworkProvider providerForNetwork:espressoEngine:](ADNetworkProvider, "providerForNetwork:espressoEngine:", CFSTR("NuCoReNetFrontend"), a4);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (networkFlowType != 1)
      goto LABEL_18;
    +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", CFSTR("RGBPNetSMPBackend"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v11->_backendNetworkProvider;
    v11->_backendNetworkProvider = (ADNetworkProvider *)v16;

    +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", CFSTR("RGBPNetSMPFrontend"));
    v18 = objc_claimAutoreleasedReturnValue();
  }
  frontendNetworkProvider = v11->_frontendNetworkProvider;
  v11->_frontendNetworkProvider = (ADNetworkProvider *)v18;

LABEL_18:
  if (!v11->_backendNetworkProvider || !v11->_frontendNetworkProvider)
  {
    v31 = 0;
    goto LABEL_24;
  }
  v22 = -[ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor initWithNetworkProvider:espressoEngine:networkFlowType:]([ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor alloc], "initWithNetworkProvider:espressoEngine:networkFlowType:", v11->_backendNetworkProvider, a4, v11->_networkFlowType);
  backendInferenceDesc = v11->_backendInferenceDesc;
  v11->_backendInferenceDesc = v22;

  v24 = -[ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor initWithNetworkProvider:espressoEngine:networkFlowType:]([ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor alloc], "initWithNetworkProvider:espressoEngine:networkFlowType:", v11->_frontendNetworkProvider, a4, v11->_networkFlowType);
  frontendInferenceDesc = v11->_frontendInferenceDesc;
  v11->_frontendInferenceDesc = v24;

  v26 = objc_msgSend(objc_alloc(MEMORY[0x24BE06018]), "initWithStreakingInfill:", 0);
  pearlReprojector = v11->_pearlReprojector;
  v11->_pearlReprojector = (ADReprojection *)v26;

  -[ADReprojection setFullPassReprojectionAllowed:](v11->_pearlReprojector, "setFullPassReprojectionAllowed:", 0);
  v28 = objc_opt_new();
  v29 = *p_controllerParameters;
  *p_controllerParameters = (id)v28;

  if (v11->_networkFlowType)
  {
    LODWORD(v30) = 0;
    objc_msgSend(*p_controllerParameters, "setMinRotationBetweenFrames:", v30);
    -[ADReprojection setFullPassReprojectionAllowed:](v11->_pearlReprojector, "setFullPassReprojectionAllowed:", 1);
  }
LABEL_22:
  v31 = v11;
LABEL_24:
  kdebug_trace();

  return v31;
}

- (void)deallocMemory
{
  __CVBuffer **p_colorImageRaw;
  float *zVals;
  __CVBuffer *v5;
  __CVBuffer *v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  PixelBufferUtilsSession *v9;

  p_colorImageRaw = &self->_colorImageRaw;
  zVals = self->_zVals;
  if (zVals)
    MEMORY[0x20BD36480](zVals, 0x1000C8052888210);
  v5 = p_colorImageRaw[5];
  if (v5)
    MEMORY[0x20BD36480](v5, 0x1000C80451B5BE8);
  v6 = p_colorImageRaw[6];
  if (v6)
    MEMORY[0x20BD36480](v6, 0x1000C80451B5BE8);
  v7 = p_colorImageRaw[7];
  if (v7)
    MEMORY[0x20BD36480](v7, 0x1000C80451B5BE8);
  v8 = p_colorImageRaw[8];
  if (v8)
    MEMORY[0x20BD36480](v8, 0x1000C80451B5BE8);
  v9 = (PixelBufferUtilsSession *)p_colorImageRaw[1];
  if (v9)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(v9);
    MEMORY[0x20BD36498]();
  }
  CVPixelBufferRelease(*p_colorImageRaw);
  *(_OWORD *)&self->_rectifiedPoints = 0u;
  *(_OWORD *)self->_origWorldPoints = 0u;
  *(_OWORD *)&self->_referenceCameraNumOfPoints = 0u;
  *p_colorImageRaw = 0;
  p_colorImageRaw[1] = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[ADPearlColorInFieldCalibrationPipeline deallocMemory](self, "deallocMemory");
  v3.receiver = self;
  v3.super_class = (Class)ADPearlColorInFieldCalibrationPipeline;
  -[ADPearlColorInFieldCalibrationPipeline dealloc](&v3, sel_dealloc);
}

- (void)updatePearlCamera:(id)a3
{
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  objc_storeStrong((id *)&self->_pearlCalib, a3);
  v5 = a3;
  objc_msgSend(v5, "cameraToPlatformTransform");
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;

  *(_DWORD *)&self->_anon_70[8] = DWORD2(v10);
  *(_QWORD *)self->_anon_70 = v10;
  *(_DWORD *)&self->_anon_70[24] = DWORD2(v11);
  *(_DWORD *)&self->_anon_70[40] = DWORD2(v12);
  *(_QWORD *)&self->_anon_70[16] = v11;
  *(_QWORD *)&self->_anon_70[32] = v12;
  *(_DWORD *)&self->_anon_70[56] = DWORD2(v13);
  *(_QWORD *)&self->_anon_70[48] = v13;
}

- (uint64_t)updateWmcamToMcamExtrinsics:(__n128)a3
{
  *(_DWORD *)(result + 184) = a2.n128_u32[2];
  *(_DWORD *)(result + 200) = a3.n128_u32[2];
  *(_QWORD *)(result + 176) = a2.n128_u64[0];
  *(_QWORD *)(result + 192) = a3.n128_u64[0];
  *(_DWORD *)(result + 216) = a4.n128_u32[2];
  *(_QWORD *)(result + 208) = a4.n128_u64[0];
  return result;
}

- (id)createReferenceCameraForColor:(float32x4_t)a3 withExtrinsics:(float32x4_t)a4
{
  id v9;
  void *v10;
  unint64_t *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  int v27;
  int v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  unint64_t v36;
  double v37;
  unint64_t v38;
  unint64_t v39;
  uint32x4_t v40;
  int v41;
  int v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  double *v54;
  uint64_t v55;
  double v56;
  double *v57;
  unsigned int v58;
  _OWORD *v59;
  double *v60;
  int32x4_t v61;
  int32x4_t v68;
  int64x2_t v69;
  double *v70;
  _OWORD *v71;
  unint64_t v72;
  int32x4_t v73;
  int32x4_t v74;
  uint64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  double *v80;
  double *v81;
  double *v82;
  double *v83;
  float64x2_t v84;
  unsigned int v85;
  double *v86;
  uint64_t v87;
  double *v88;
  uint64_t v89;
  _OWORD *v90;
  double *v91;
  int32x4_t v92;
  int32x4_t v95;
  double v96;
  int64x2_t v97;
  double *v98;
  _OWORD *v99;
  unint64_t v100;
  int32x4_t v101;
  int32x4_t v102;
  uint64x2_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float64x2_t v106;
  float64x2_t v107;
  double *v108;
  double *v109;
  double *v110;
  double *v111;
  float64x2_t v112;
  unint64_t v113;
  unsigned int v114;
  unint64_t v115;
  double *v116;
  double v117;
  double v118;
  double v119;
  float64x2x2_t v124;
  float64x2x2_t v125;
  float64x2x2_t v126;
  float64x2x2_t v127;

  v9 = a7;
  v10 = v9;
  if (!v9)
    goto LABEL_18;
  v11 = (unint64_t *)(a1 + 3920128);
  v12 = *(_DWORD *)(a1 + 40);
  if ((v12 - 1) >= 2)
  {
    if (!v12)
    {
      v23 = objc_alloc(MEMORY[0x24BE05FF8]);
      objc_msgSend(v10, "intrinsicMatrix");
      v118 = v25;
      v119 = v24;
      v117 = v26;
      objc_msgSend(v10, "pixelSize");
      v28 = v27;
      objc_msgSend(v10, "referenceDimensions");
      LODWORD(v29) = v28;
      v13 = (void *)objc_msgSend(v23, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionModel:", 0, v119, v118, v117, *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64, v29, v30, v31);
      objc_msgSend(v13, "referenceDimensions");
      if (v32 == 864.0)
      {
        objc_msgSend(v13, "referenceDimensions");
        if (v33 == 704.0)
          objc_msgSend(v13, "crop:", 0.0, -4.0, 872.0, 712.0);
      }
      objc_msgSend(v13, "centerCrop:", 866.0, 710.0);
      objc_msgSend(v13, "scale:", 644.0, 528.0);
      objc_msgSend(v13, "centerCrop:", 464.0, 528.0);
      objc_msgSend(v13, "referenceDimensions");
      v35 = v34;
      objc_msgSend(v13, "referenceDimensions");
      v36 = (unint64_t)v35;
      v38 = (unint64_t)v37;
      v39 = (unint64_t)v37 * (unint64_t)v35;
      if (*v11 != v39)
      {
        objc_msgSend((id)a1, "deallocMemory");
        *(_QWORD *)(a1 + 3920144) = operator new[]();
        *(_QWORD *)(a1 + 3920136) = operator new[]();
        *(_QWORD *)(a1 + 3920152) = operator new[]();
        *(_QWORD *)(a1 + 3920160) = operator new[]();
        *(_QWORD *)(a1 + 3920168) = operator new[]();
        if (v38)
        {
          if (v36)
          {
            v51 = *(_QWORD *)(a1 + 3920136);
            v52 = *(_QWORD *)(a1 + 3920144);
            if (v36 > 7)
            {
              if (!(_DWORD)v36 || (v36 - 1) >> 32)
              {
                v85 = 0;
                v86 = (double *)(v52 + 8);
                do
                {
                  v87 = 0;
                  v88 = v86;
                  do
                  {
                    *(v88 - 1) = (double)v87 + 0.5;
                    *v88 = (double)v85 + 0.5;
                    *(_DWORD *)(v51 + 4 * v87++) = 1065353216;
                    v88 += 2;
                  }
                  while (v36 > v87);
                  ++v85;
                  v51 += 4 * v36;
                  v86 += 2 * v36;
                }
                while (v38 > v85);
              }
              else if ((v36 & 0xFFFFFFFFFFFFFFF8) == v36)
              {
                v58 = 0;
                v59 = (_OWORD *)(v51 + 16);
                v60 = (double *)(v52 + 64);
                v61.i64[0] = 0x400000004;
                v61.i64[1] = 0x400000004;
                __asm
                {
                  FMOV            V3.2D, #0.5
                  FMOV            V4.4S, #1.0
                }
                v68.i64[0] = 0x800000008;
                v68.i64[1] = 0x800000008;
                do
                {
                  v69 = vdupq_lane_s64(COERCE__INT64((double)v58 + 0.5), 0);
                  v70 = v60;
                  v71 = v59;
                  v72 = (unint64_t)v35;
                  v73 = (int32x4_t)xmmword_20B6D2A50;
                  do
                  {
                    v74 = vaddq_s32(v73, v61);
                    v75.i64[0] = v73.u32[0];
                    v75.i64[1] = v73.u32[1];
                    v76 = vcvtq_f64_u64(v75);
                    v75.i64[0] = v73.u32[2];
                    v75.i64[1] = v73.u32[3];
                    v77 = vcvtq_f64_u64(v75);
                    v75.i64[0] = v74.u32[0];
                    v75.i64[1] = v74.u32[1];
                    v78 = vcvtq_f64_u64(v75);
                    v75.i64[0] = v74.u32[2];
                    v75.i64[1] = v74.u32[3];
                    v79 = vaddq_f64(v77, _Q3);
                    v124.val[0] = vaddq_f64(v76, _Q3);
                    v124.val[1] = (float64x2_t)v69;
                    v126.val[0] = vaddq_f64(v78, _Q3);
                    v80 = v70 - 8;
                    vst2q_f64(v80, v124);
                    v126.val[1] = (float64x2_t)v69;
                    v81 = v70 - 4;
                    vst2q_f64(v81, *(float64x2x2_t *)(&v69 - 1));
                    v82 = v70 + 16;
                    vst2q_f64(v70, v126);
                    v83 = v70 + 4;
                    v84 = vaddq_f64(vcvtq_f64_u64(v75), _Q3);
                    v124.val[0] = (float64x2_t)v69;
                    vst2q_f64(v83, v124);
                    *(v71 - 1) = _Q4;
                    *v71 = _Q4;
                    v73 = vaddq_s32(v73, v68);
                    v71 += 2;
                    v70 = v82;
                    v72 -= 8;
                  }
                  while (v72);
                  ++v58;
                  v59 = (_OWORD *)((char *)v59 + 4 * v36);
                  v60 += 2 * v36;
                }
                while (v38 > v58);
              }
              else
              {
                v89 = 0;
                v90 = (_OWORD *)(v51 + 16);
                v91 = (double *)(v52 + 64);
                v92.i64[0] = 0x400000004;
                v92.i64[1] = 0x400000004;
                __asm
                {
                  FMOV            V3.2D, #0.5
                  FMOV            V4.4S, #1.0
                }
                v95.i64[0] = 0x800000008;
                v95.i64[1] = 0x800000008;
                do
                {
                  v96 = (double)v89 + 0.5;
                  v97 = vdupq_lane_s64(*(uint64_t *)&v96, 0);
                  v98 = v91;
                  v99 = v90;
                  v100 = v36 & 0xFFFFFFFFFFFFFFF8;
                  v101 = (int32x4_t)xmmword_20B6D2A50;
                  do
                  {
                    v102 = vaddq_s32(v101, v92);
                    v103.i64[0] = v101.u32[0];
                    v103.i64[1] = v101.u32[1];
                    v104 = vcvtq_f64_u64(v103);
                    v103.i64[0] = v101.u32[2];
                    v103.i64[1] = v101.u32[3];
                    v105 = vcvtq_f64_u64(v103);
                    v103.i64[0] = v102.u32[0];
                    v103.i64[1] = v102.u32[1];
                    v106 = vcvtq_f64_u64(v103);
                    v103.i64[0] = v102.u32[2];
                    v103.i64[1] = v102.u32[3];
                    v107 = vaddq_f64(v105, _Q3);
                    v125.val[0] = vaddq_f64(v104, _Q3);
                    v125.val[1] = (float64x2_t)v97;
                    v127.val[0] = vaddq_f64(v106, _Q3);
                    v108 = v98 - 8;
                    vst2q_f64(v108, v125);
                    v127.val[1] = (float64x2_t)v97;
                    v109 = v98 - 4;
                    vst2q_f64(v109, *(float64x2x2_t *)(&v97 - 1));
                    v110 = v98 + 16;
                    vst2q_f64(v98, v127);
                    v111 = v98 + 4;
                    v112 = vaddq_f64(vcvtq_f64_u64(v103), _Q3);
                    v125.val[0] = (float64x2_t)v97;
                    vst2q_f64(v111, v125);
                    *(v99 - 1) = _Q4;
                    *v99 = _Q4;
                    v101 = vaddq_s32(v101, v95);
                    v99 += 2;
                    v98 = v110;
                    v100 -= 8;
                  }
                  while (v100);
                  v113 = v36 & 0xFFFFFFFFFFFFFFF8;
                  v114 = v36 & 0xFFFFFFF8;
                  do
                  {
                    v115 = v113 + v89 * v36;
                    v116 = (double *)(v52 + 16 * v115);
                    *v116 = (double)v114 + 0.5;
                    v116[1] = v96;
                    *(_DWORD *)(v51 + 4 * v115) = 1065353216;
                    v113 = ++v114;
                  }
                  while (v114 < v36);
                  ++v89;
                  v90 = (_OWORD *)((char *)v90 + 4 * v36);
                  v91 += 2 * v36;
                }
                while (v38 > v89);
              }
            }
            else
            {
              v53 = 0;
              v54 = (double *)(v52 + 8);
              do
              {
                v55 = 0;
                v56 = 0.0;
                v57 = v54;
                do
                {
                  *(v57 - 1) = v56 + 0.5;
                  *v57 = (double)v53 + 0.5;
                  *(_DWORD *)(v51 + 4 * v55) = 1065353216;
                  v56 = v56 + 1.0;
                  ++v55;
                  v57 += 2;
                }
                while (v55 < v36);
                ++v53;
                v51 += 4 * v36;
                v54 += 2 * v36;
              }
              while (v38 > v53);
            }
          }
        }
      }
      if (*v11 != v39
        && (objc_msgSend(v13, "backProject:undistortedPixels:withZ:outPoints:", v39, *(_QWORD *)(a1 + 3920144), *(_QWORD *)(a1 + 3920136), *(_QWORD *)(a1 + 3920152)), *v11 != v39)|| *(void **)(a1 + 3920176) != v10|| (v40 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920208), a3), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920192), a2)), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920224), a4), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 3920240), a5))), v40.i32[3] = v40.i32[2], (vminvq_u32(v40) & 0x80000000) == 0))
      {
        objc_msgSend(v13, "transform:points:toCamera:outPoints:", v39, *(_QWORD *)(a1 + 3920152), v10, *(_QWORD *)(a1 + 3920160));
        objc_msgSend(v10, "project:points:outUndistortedPixels:", v39, *(_QWORD *)(a1 + 3920160), *(_QWORD *)(a1 + 3920168));
        objc_msgSend(v10, "distort:undistortedPixels:outDistorted:", v39, *(_QWORD *)(a1 + 3920168), a1 + 224);
      }
      *v11 = v39;
      objc_storeStrong((id *)(a1 + 3920176), a7);
      goto LABEL_17;
    }
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  v13 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 24), "colorInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeForLayout:", 255);
  v17 = v16;
  v19 = v18;

  objc_msgSend(v13, "referenceDimensions");
  v22 = v21 / (v19 / v17);
  if (v20 < v22)
    v22 = v20;
  objc_msgSend(v13, "crop:", (v20 - v22) * 0.5, (v21 - v19 / v17 * v22) * 0.5);
  objc_msgSend(v13, "scale:", v17, v19);
LABEL_17:
  *(float32x4_t *)(a1 + 3920192) = a2;
  *(float32x4_t *)(a1 + 3920208) = a3;
  *(float32x4_t *)(a1 + 3920224) = a4;
  *(float32x4_t *)(a1 + 3920240) = a5;
  objc_msgSend(v13, "intrinsicMatrix");
  *(_DWORD *)(a1 + 44) = v41;
  objc_msgSend(v10, "cameraToPlatformTransform");
  *(_DWORD *)(a1 + 56) = v42;
  *(_QWORD *)(a1 + 48) = v43;
  *(_DWORD *)(a1 + 72) = v44;
  *(_DWORD *)(a1 + 88) = v45;
  *(_QWORD *)(a1 + 64) = v46;
  *(_QWORD *)(a1 + 80) = v47;
  *(_DWORD *)(a1 + 104) = v48;
  *(_QWORD *)(a1 + 96) = v49;
LABEL_19:

  return v13;
}

- (int64_t)preProcessColor:(__CVBuffer *)a3 processedColor:(__CVBuffer *)a4 referenceCameraCalibration:(id)a5 colorCameraCalibration:(id)a6
{
  id v10;
  id v11;
  OSType PixelFormatType;
  int64_t v13;
  __CVBuffer **p_colorImageRaw;
  PixelBufferUtilsSession *colorInputProcessingSession;
  size_t Width;
  size_t Height;
  OSType v18;
  double v19;
  double v20;
  size_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int networkFlowType;
  __CVBuffer *v34;
  OSType v35;
  size_t v36;
  size_t v37;
  const __CFDictionary *BufferAttributes;
  CVReturn v39;
  CVPixelBufferRef v40;
  void *v41;
  size_t v43;
  OSType v44;
  CVPixelBufferRef pixelBufferOut[2];
  CGSize v46;
  CGSize v47;
  CGSize v48;
  CGSize v49;

  v10 = a5;
  v11 = a6;
  kdebug_trace();
  PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  if (PixelFormatType == CVPixelBufferGetPixelFormatType(a3))
    goto LABEL_2;
  p_colorImageRaw = &self->_colorImageRaw;
  colorInputProcessingSession = self->_colorInputProcessingSession;
  if (!colorInputProcessingSession)
  {
    v44 = CVPixelBufferGetPixelFormatType(a3);
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    v18 = CVPixelBufferGetPixelFormatType(a4);
    v19 = (double)Width;
    v20 = (double)Height;
    if ((self->_networkFlowType - 1) > 1)
    {
      v47.width = (double)Width;
      v47.height = (double)Height;
      v49.width = (double)Width;
      v49.height = (double)Height;
      colorInputProcessingSession = (PixelBufferUtilsSession *)PixelBufferUtilsSession::createCropScaleConvertRotateSession((PixelBufferUtilsSession *)v44, v47, v49, *MEMORY[0x24BDBF070], v18, 0);
    }
    else
    {
      v43 = CVPixelBufferGetWidth(a4);
      v21 = CVPixelBufferGetHeight(a4);
      -[ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor colorInput](self->_backendInferenceDesc, "colorInput");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "imageDescriptor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sizeForLayout:", 255);
      v25 = v24;
      v27 = v26;

      v28 = v27 / v25;
      v29 = v20 / (v27 / v25) <= v19 ? v20 / (v27 / v25) : v19;
      v30 = v28 * v29;
      v31 = (v19 - v29) * 0.5;
      v32 = (v20 - v28 * v29) * 0.5;
      v46.width = v19;
      v46.height = v20;
      v48.width = (double)v43;
      v48.height = (double)v21;
      colorInputProcessingSession = (PixelBufferUtilsSession *)PixelBufferUtilsSession::createCropScaleConvertRotateSession((PixelBufferUtilsSession *)v44, v46, v48, *(CGRect *)(&v29 - 2), v18, 0);
    }
    self->_colorInputProcessingSession = colorInputProcessingSession;
    if (!colorInputProcessingSession)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        LOWORD(pixelBufferOut[0]) = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "PearlColorInfieldCalibration unable to create VT session", (uint8_t *)pixelBufferOut, 2u);
      }
      goto LABEL_25;
    }
  }
  networkFlowType = self->_networkFlowType;
  if ((networkFlowType - 1) >= 2)
  {
    if (networkFlowType)
      goto LABEL_25;
    v34 = *p_colorImageRaw;
    if (!*p_colorImageRaw)
    {
      v35 = CVPixelBufferGetPixelFormatType(a4);
      v36 = CVPixelBufferGetWidth(a3);
      v37 = CVPixelBufferGetHeight(a3);
      pixelBufferOut[0] = 0;
      BufferAttributes = (const __CFDictionary *)getBufferAttributes();
      v39 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v36, v37, v35, BufferAttributes, pixelBufferOut);
      v40 = pixelBufferOut[0];
      if (v39)
        v40 = 0;
      *p_colorImageRaw = v40;
      +[ADUtils getStandardNameForBufferOfType:moduleName:](ADUtils, "getStandardNameForBufferOfType:moduleName:", CFSTR("colorImageRaw"), CFSTR("RGBP"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[ADUtils updatePixelBufferIOSurfaceLabel:pixelBuffer:](ADUtils, "updatePixelBufferIOSurfaceLabel:pixelBuffer:", v41, *p_colorImageRaw);

      v34 = *p_colorImageRaw;
      colorInputProcessingSession = self->_colorInputProcessingSession;
    }
    if ((PixelBufferUtilsSession::run(colorInputProcessingSession, a3, v34) & 1) == 0)
      goto LABEL_25;
    a3 = *p_colorImageRaw;
  }
  else if (!PixelBufferUtilsSession::run(colorInputProcessingSession, a3, a4))
  {
LABEL_25:
    v13 = -22950;
    goto LABEL_26;
  }
LABEL_2:
  if (self->_networkFlowType)
    v13 = 0;
  else
    v13 = -[ADPearlColorInFieldCalibrationPipeline undistortColorImage:undistortedImage:calibration:](self, "undistortColorImage:undistortedImage:calibration:", a3, a4, v11);
LABEL_26:
  kdebug_trace();

  return v13;
}

- (uint64_t)preProcessPearl:(double)a3 pose:(double)a4 prevPose:(double)a5 referenceCameraCalibration:(double)a6 pearlCameraCalibration:(double)a7 reprojectedPointsBuffer:(double)a8 reprojectedPointsMaskBuffer:(double)a9
{
  id v20;
  id v21;
  int v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  size_t v28;
  size_t v29;
  size_t v30;
  size_t v31;
  size_t v32;
  size_t v33;
  uint64_t v34;
  size_t v35;
  size_t v36;
  uint64_t v37;
  double v38;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v42;
  size_t v43;
  size_t v44;
  _WORD *BaseAddress;
  char *v46;
  size_t v47;
  size_t v48;
  double v49;
  size_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  unint64_t v54;
  size_t v58;
  _WORD *v59;
  _BYTE *v60;
  _BYTE *v61;
  float v62;
  uint64_t v64;
  size_t v65;
  uint64_t v66;
  _WORD *v67;
  _WORD *v68;
  unint64_t v70;
  char v73;
  char *v74;
  uint64_t v75;
  float64x2_t v76;
  unint64_t v77;
  int v78;
  _WORD *v79;
  _WORD *v80;
  uint64_t v81;
  unint64_t v82;
  uint16x8_t v83;
  uint32x4_t v84;
  uint64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  uint32x4_t v88;
  float64x2_t v89;
  float32x4_t v90;
  float32x4_t v91;
  uint16x8_t v92;
  unsigned int v93;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  size_t v100;
  unint64_t v101;
  unint64_t v102;
  char *v105;
  unint64_t v106;
  size_t v107;
  unint64_t v108;
  size_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  size_t v118;
  size_t v120;
  size_t v122;
  size_t v124;
  size_t v126;
  size_t v127;
  __CVBuffer *pixelBuffer;
  uint8_t v130[16];
  uint8_t v131[16];
  uint8_t buf[16];

  v20 = a12;
  v21 = a13;
  v22 = objc_msgSend((id)a1, "isPearlFrameValid:pose:prevPose:", a11, a2, a3, a4, a5, a6, a7, a8, a9);
  v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  if (!v22)
  {
    if (v23)
    {
      *(_WORD *)v130 = 0;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration pearl controller fail", v130, 2u);
    }
    v34 = -22964;
    goto LABEL_68;
  }
  if (v23)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration pearl controller pass", buf, 2u);
  }
  if (CVPixelBufferGetPixelFormatType(a11) != 825437747)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v131 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Pearl depth frame invalid format", v131, 2u);
    }
    v34 = -22956;
    goto LABEL_68;
  }
  if (!*(_DWORD *)(a1 + 40))
  {
    v37 = objc_msgSend(*(id *)(a1 + 3920120), "warpDepth:srcCalibration:dstCalibration:poseTransform:warpedDepth:", a11, v21, v20, a14, *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48));
LABEL_29:
    v34 = v37;
    goto LABEL_68;
  }
  pixelBuffer = a14;
  objc_msgSend(*(id *)(a1 + 24), "colorInput");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "imageDescriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sizeForLayout:", 255);
  v27 = v26;

  if (*(_DWORD *)(a1 + 40) != 2)
  {
    objc_msgSend(v21, "referenceDimensions");
    if (v27 > v38)
    {
      Width = CVPixelBufferGetWidth(a11);
      Height = CVPixelBufferGetHeight(a11);
      BytesPerRow = CVPixelBufferGetBytesPerRow(a11);
      v42 = CVPixelBufferGetWidth(pixelBuffer);
      v43 = CVPixelBufferGetHeight(pixelBuffer);
      v44 = CVPixelBufferGetBytesPerRow(pixelBuffer);
      CVPixelBufferLockBaseAddress(a11, 1uLL);
      CVPixelBufferLockBaseAddress(pixelBuffer, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(a11);
      v46 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
      if (v43 && v42)
      {
        v47 = BytesPerRow >> 1;
        v48 = v44 >> 1;
        v49 = (double)v42 / (double)Height;
        if (v42 > 1)
        {
          if (!(_DWORD)v42 || (v96 = (v42 - 1) >> 32) != 0)
          {
            LODWORD(v110) = 0;
            v111 = 2 * v48;
            do
            {
              v112 = 0;
              do
              {
                *(double *)&v113 = (double)v112 / v49;
                LOWORD(v113) = BaseAddress[Width - (int)((double)v110 / v49) + v47 * (int)*(double *)&v113];
                _D1 = (double)v113 / 8000.0;
                __asm { FCVT            H1, D1 }
                *(_WORD *)&v46[2 * v112++] = LOWORD(_D1);
              }
              while (v42 > v112);
              v110 = (v110 + 1);
              v46 += v111;
            }
            while (v43 > v110);
          }
          else
          {
            v97 = v42 & 0xFFFFFFFFFFFFFFFELL;
            v98 = 2 * v48;
            do
            {
              v99 = 0;
              v100 = Width - (int)((double)v96 / v49);
              do
              {
                *(double *)&v101 = (double)v99 / v49;
                *(double *)&v102 = (double)(v99 + 1) / v49;
                LOWORD(v101) = BaseAddress[v100 + v47 * (int)*(double *)&v101];
                LOWORD(v102) = BaseAddress[v100 + v47 * (int)*(double *)&v102];
                _D1 = (double)v101 / 8000.0;
                _D2 = (double)v102 / 8000.0;
                v105 = &v46[2 * v99];
                __asm
                {
                  FCVT            H1, D1
                  FCVT            H2, D2
                }
                *(_WORD *)v105 = LOWORD(_D1);
                *((_WORD *)v105 + 1) = LOWORD(_D2);
                v99 += 2;
              }
              while (v97 != v99);
              if (v42 != v97)
              {
                v106 = 2 * (v42 & 0xFFFFFFFFFFFFFFFELL);
                LODWORD(v107) = v42 & 0xFFFFFFFE;
                do
                {
                  *(double *)&v108 = (double)v107 / v49;
                  LOWORD(v108) = BaseAddress[v100 + v47 * (int)*(double *)&v108];
                  _D1 = (double)v108 / 8000.0;
                  __asm { FCVT            H1, D1 }
                  *(_WORD *)&v46[v106] = LOWORD(_D1);
                  v107 = (v107 + 1);
                  v106 += 2;
                }
                while (v42 > v107);
              }
              v96 = (v96 + 1);
              v46 += v98;
            }
            while (v43 > v96);
          }
        }
        else
        {
          LODWORD(v50) = 0;
          v51 = 2 * v48;
          do
          {
            v52 = 0;
            v53 = 0.0;
            do
            {
              *(double *)&v54 = v53 / v49;
              LOWORD(v54) = BaseAddress[Width - (int)((double)v50 / v49) + v47 * (int)(v53 / v49)];
              _D3 = (double)v54 / 8000.0;
              __asm { FCVT            H3, D3 }
              *(_WORD *)&v46[2 * v52] = LOWORD(_D3);
              v53 = v53 + 1.0;
              ++v52;
            }
            while (v52 < v42);
            v50 = (v50 + 1);
            v46 += v51;
          }
          while (v43 > v50);
        }
      }
LABEL_67:
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      CVPixelBufferUnlockBaseAddress(a11, 1uLL);
      v34 = 0;
      goto LABEL_68;
    }
    v37 = objc_msgSend(*(id *)(a1 + 3920120), "warpDepth:srcCalibration:dstCalibration:poseTransform:warpedDepth:", a11, v21, v20, pixelBuffer, *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48));
    goto LABEL_29;
  }
  v126 = CVPixelBufferGetWidth(a11);
  v124 = CVPixelBufferGetHeight(a11);
  v122 = CVPixelBufferGetBytesPerRow(a11);
  v28 = CVPixelBufferGetWidth(pixelBuffer);
  v29 = CVPixelBufferGetHeight(pixelBuffer);
  v30 = CVPixelBufferGetBytesPerRow(pixelBuffer);
  v31 = CVPixelBufferGetWidth(a15);
  v32 = CVPixelBufferGetHeight(a15);
  v33 = CVPixelBufferGetBytesPerRow(a15);
  v34 = -22950;
  if (v28 == v31 && v29 == v32 && v30 >> 1 == v33 >> 1)
  {
    v120 = v30 >> 1;
    if (v28 <= v126)
    {
      v36 = v124;
      v118 = 0;
      if (v28 >= v126)
        v35 = 0;
      else
        v35 = (v126 - v28) >> 1;
    }
    else
    {
      v35 = 0;
      v118 = (v28 - v126) >> 1;
      v36 = v124;
    }
    if (v29 <= v36)
    {
      v127 = 0;
      if (v29 >= v36)
        v58 = 0;
      else
        v58 = (v36 - v29) >> 1;
    }
    else
    {
      v58 = 0;
      v127 = (v29 - v36) >> 1;
      v29 = v36;
    }
    CVPixelBufferLockBaseAddress(a11, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    CVPixelBufferLockBaseAddress(a15, 0);
    v59 = CVPixelBufferGetBaseAddress(a11);
    v60 = CVPixelBufferGetBaseAddress(pixelBuffer);
    v61 = CVPixelBufferGetBaseAddress(a15);
    if (v29 && v28)
    {
      v64 = 0;
      v65 = v122 >> 1;
      v66 = 2 * v127 * v120;
      v67 = &v60[2 * v118 + v66];
      v68 = &v61[2 * v118 + v66];
      if ((_DWORD)v28)
        _ZF = (v28 - 1) >> 32 == 0;
      else
        _ZF = 0;
      v70 = v28 & 0xFFFFFFFFFFFFFFF8;
      v73 = !_ZF || v28 < 8 || (unint64_t)(v61 - v60) < 0x10;
      v74 = (char *)&v59[v58 * v65 + v35];
      v75 = 2 * v120;
      LOWORD(v62) = 15360;
      v76 = (float64x2_t)vdupq_n_s64(0x40BF400000000000uLL);
      while ((v73 & 1) == 0)
      {
        v81 = 0;
        v79 = &v68[v70];
        v82 = v28 & 0xFFFFFFFFFFFFFFF8;
        do
        {
          v83 = *(uint16x8_t *)&v74[v81 * 2];
          v84 = vmovl_high_u16(v83);
          v85.i64[0] = v84.u32[0];
          v85.i64[1] = v84.u32[1];
          v86 = vcvtq_f64_u64(v85);
          v85.i64[0] = v84.u32[2];
          v85.i64[1] = v84.u32[3];
          v87 = vcvtq_f64_u64(v85);
          v88 = vmovl_u16(*(uint16x4_t *)v83.i8);
          v85.i64[0] = v88.u32[0];
          v85.i64[1] = v88.u32[1];
          v89 = vcvtq_f64_u64(v85);
          v85.i64[0] = v88.u32[2];
          v85.i64[1] = v88.u32[3];
          v90 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v86, v76)), vdivq_f64(v87, v76));
          v91 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v89, v76)), vdivq_f64(vcvtq_f64_u64(v85), v76));
          *(float16x8_t *)&v67[v81] = vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v91), v90);
          v92 = vmovl_u8((uint8x8_t)vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vcgtzq_f32(v91), (int16x8_t)vcgtzq_f32(v90))), (int8x8_t)0x101010101010101));
          *(float16x4_t *)v91.f32 = vcvt_f16_f32(vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v92.i8)));
          _Q4 = vcvtq_f32_u32(vmovl_high_u16(v92));
          *(float16x8_t *)&v68[v81] = vcvt_hight_f16_f32(*(int16x4_t *)v91.f32, _Q4);
          v81 += 8;
          v82 -= 8;
        }
        while (v82);
        if (v28 != (v28 & 0xFFFFFFFFFFFFFFF8))
        {
          v80 = &v67[v70];
          v77 = v28 & 0xFFFFFFFFFFFFFFF8;
          v78 = v28 & 0xFFFFFFF8;
LABEL_60:
          v93 = v78 + 1;
          do
          {
            _Q4.i16[0] = v59[v35 + (v64 + v58) * v65 + v77];
            *(double *)_Q4.i64 = (double)_Q4.u64[0] / 8000.0;
            _Q4.f32[0] = *(double *)_Q4.i64;
            __asm { FCVT            H5, S4 }
            *v80++ = _H5;
            if (_Q4.f32[0] <= 0.0)
              _Q4.f32[0] = 0.0;
            else
              _Q4.f32[0] = v62;
            *v79++ = _Q4.i16[0];
            v77 = v93++;
          }
          while (v28 > v77);
        }
        v67 = (_WORD *)((char *)v67 + v75);
        v68 = (_WORD *)((char *)v68 + v75);
        ++v64;
        v74 += 2 * v65;
        if (v29 <= v64)
          goto LABEL_66;
      }
      v77 = 0;
      v78 = 0;
      v79 = v68;
      v80 = v67;
      goto LABEL_60;
    }
LABEL_66:
    CVPixelBufferUnlockBaseAddress(a15, 0);
    goto LABEL_67;
  }
LABEL_68:

  return v34;
}

- (BOOL)isPearlFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4
{
  return +[ADPearlColorInFieldCalibrationPipeline isPearlFrameValid:withMetadata:andPipelineParameters:](ADPearlColorInFieldCalibrationPipeline, "isPearlFrameValid:withMetadata:andPipelineParameters:", a3, a4, self->_controllerParameters);
}

- (uint64_t)isPearlFrameValid:(float32x4_t)a3 pose:(float32x4_t)a4 prevPose:(float32x4_t)a5
{
  uint64_t v13;
  float v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  __int128 v26;
  float32x2_t v27;
  float v28;
  float v29;
  NSObject *v30;
  const char *v31;
  uint8_t *v32;
  _BOOL4 v33;
  uint64_t result;
  float32x4_t v43;
  __int16 v44;
  uint8_t buf[16];
  __int128 v46;
  __int128 v47;

  v13 = a1 + 3920096;
  objc_msgSend(*(id *)(a1 + 3920096), "thresholdPrecOfValidDepth");
  if (!+[ADPearlColorInFieldCalibrationPipeline isValidDepthAboveThreshold:threshold:invalid:validDepthPercentage:](ADPearlColorInFieldCalibrationPipeline, "isValidDepthAboveThreshold:threshold:invalid:validDepthPercentage:", a11, 0, a1 + 3920288))
  {
    v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v33)
      return result;
    *(_WORD *)buf = 0;
    v30 = MEMORY[0x24BDACB70];
    v31 = "ADPearlColorInFieldCalibration pearl controller failed: frame does not have enough valid depth pixels";
    v32 = buf;
    goto LABEL_11;
  }
  objc_msgSend(*(id *)v13, "minRotationBetweenFrames");
  if (v14 != 0.0)
  {
    v15 = vzip1q_s32(a6, a8);
    v16 = vzip2q_s32(a6, a8);
    v17 = vzip1q_s32(a7, a9);
    v18 = vzip2q_s32(a7, a9);
    v19 = (float32x4_t)vzip1q_s32(v15, v17);
    v20 = (float32x4_t)vzip2q_s32(v15, v17);
    v21 = (float32x4_t)vzip1q_s32(v16, v18);
    v22 = (float32x4_t)vzip2q_s32(v16, v18);
    v23 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a2.f32[0]), v20, *(float32x2_t *)a2.f32, 1), v21, a2, 2), v22, a2, 3);
    v24 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a3.f32[0]), v20, *(float32x2_t *)a3.f32, 1), v21, a3, 2), v22, a3, 3);
    v25 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a4.f32[0]), v20, *(float32x2_t *)a4.f32, 1), v21, a4, 2), v22, a4, 3);
    v43 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a5.f32[0]), v20, *(float32x2_t *)a5.f32, 1), v21, a5, 2), v22, a5, 3);
    *(_OWORD *)buf = 0u;
    v46 = 0u;
    *(_DWORD *)&buf[8] = v23.i32[2];
    v47 = 0u;
    DWORD2(v46) = v24.i32[2];
    *(_QWORD *)buf = v23.i64[0];
    *(_QWORD *)&v46 = v24.i64[0];
    DWORD2(v47) = v25.i32[2];
    *(_QWORD *)&v47 = v25.i64[0];
    +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", buf);
    *(_OWORD *)(v13 + 160) = v26;
    *(float32x4_t *)(v13 + 176) = v43;
    v27 = vabs_f32(*(float32x2_t *)&v26);
    v28 = v27.f32[0] <= v27.f32[1] ? v27.f32[1] : v27.f32[0];
    objc_msgSend(*(id *)v13, "minRotationBetweenFrames");
    if (v28 < v29)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        return 0;
      v44 = 0;
      v30 = MEMORY[0x24BDACB70];
      v31 = "ADPearlColorInFieldCalibration pearl controller failed: frame not passing minimum rotation";
      v32 = (uint8_t *)&v44;
LABEL_11:
      _os_log_impl(&dword_20B62B000, v30, OS_LOG_TYPE_DEFAULT, v31, v32, 2u);
      return 0;
    }
  }
  return 1;
}

- (BOOL)isColorFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4
{
  return +[ADPearlColorInFieldCalibrationPipeline isColorFrameValid:withMetadata:](ADPearlColorInFieldCalibrationPipeline, "isColorFrameValid:withMetadata:", a3, a4);
}

- (id)backendInferenceDescriptor
{
  return self->_backendInferenceDesc;
}

- (int64_t)processIntermediateResultsWithBackendFeaturesOutputVector:(const void *)a3 frontendEspressoFeaturesInput:(void *)a4 dimensions:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unsigned int v15;
  id v16;
  unsigned int v17;
  unsigned int v18;
  void *v20;
  unsigned int v21;
  id v22;
  unsigned int v23;
  unsigned int v24;
  int32x2_t v25;
  void *v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  float v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  BOOL v41;
  uint64_t v42;
  float16x8_t *v43;
  float16x8_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  unsigned int v49;
  id v50;
  unsigned int v51;
  unsigned int v52;
  void *v54;
  float v55;
  uint64_t v56;
  uint64_t v57;
  float v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  BOOL v64;
  uint64_t v65;
  float16x8_t *v66;
  float16x8_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  int64_t v72;
  unsigned int v73;
  id v74;
  unsigned int v75;
  unsigned int v76;
  int32x2_t v77;
  void *v78;
  float v79;
  uint64_t v80;
  uint64_t v81;
  float v83;
  uint64_t v84;
  uint64_t v85;
  unsigned int v86;
  BOOL v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  float v91;
  uint64_t v92;
  uint64_t v93;
  float v94;
  uint64_t v95;
  BOOL v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  unsigned int v100;
  uint64_t v101;
  int16x8_t v102;
  int16x8_t *v103;
  uint64_t v104;
  uint64_t v105;
  _WORD *v106;
  uint64_t v107;
  int32x4_t v108;
  int32x4_t *v109;
  uint64_t v110;
  uint64_t v111;
  _DWORD *v112;
  uint64_t v113;
  int16x8_t v114;
  int16x8_t *v115;
  uint64_t v116;
  uint64_t v117;
  _WORD *v118;
  int32x4_t v119;
  int32x4_t *v120;
  uint64_t v121;
  uint64_t v122;
  _DWORD *v123;

  v8 = a5;
  -[ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor featuresOutput](self->_backendInferenceDesc, "featuresOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v10, "pixelFormat"), 0);

  -[ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor featuresInput](self->_frontendInferenceDesc, "featuresInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v13, "pixelFormat"), 0);

  if (v11 == 2 && v14 == 2)
  {
    v15 = -[ADPearlColorInFieldCalibrationPipelineParameters featuresVectorAggregationSize](self->_pipelineParameters, "featuresVectorAggregationSize");
    v16 = v8;
    v17 = 0;
    v18 = 1;
    while (objc_msgSend(v16, "count") > (unint64_t)v17)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 *= objc_msgSend(v20, "intValue");

      ++v17;
    }
    if (!v18)
      goto LABEL_123;
    v27 = (float)v15;
    if (v15)
    {
      v28 = 0;
      v29 = v15 & 0xFFFFFFF0;
      while (1)
      {
        v35 = 0.0;
        if (v15 >= 0x10)
        {
          v36 = 0;
          v41 = __CFADD__((_DWORD)v28, v15 - 1);
          if (v18 == 1 && !v41)
          {
            v42 = 0;
            do
            {
              v43 = (float16x8_t *)((char *)a3 + 2 * (v28 + v42));
              v44 = v43[1];
              v45 = vcvt_hight_f32_f16(*v43);
              v46 = vcvtq_f32_f16(*(float16x4_t *)v43->i8);
              v47 = vcvt_hight_f32_f16(v44);
              v48 = vcvtq_f32_f16(*(float16x4_t *)v44.i8);
              v35 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v35 + v46.f32[0]) + v46.f32[1]) + v46.f32[2]) + v46.f32[3]) + v45.f32[0])
                                                                                                  + v45.f32[1])
                                                                                          + v45.f32[2])
                                                                                  + v45.f32[3])
                                                                          + v48.f32[0])
                                                                  + v48.f32[1])
                                                          + v48.f32[2])
                                                  + v48.f32[3])
                                          + v47.f32[0])
                                  + v47.f32[1])
                          + v47.f32[2])
                  + v47.f32[3];
              v42 += 16;
            }
            while (v29 != v42);
            v36 = v15 & 0xFFFFFFF0;
            if (v29 == v15)
              goto LABEL_14;
          }
        }
        else
        {
          v36 = 0;
        }
        v37 = v15 - v36;
        v38 = v28 + v18 * v36;
        do
        {
          _H2 = *((_WORD *)a3 + v38);
          __asm { FCVT            S2, H2 }
          v35 = v35 + _S2;
          v38 += v18;
          --v37;
        }
        while (v37);
LABEL_14:
        _S1 = v35 / v27;
        __asm { FCVT            H1, S1 }
        *((_WORD *)a4 + v28++) = LOWORD(_S1);
        if (v28 == v18)
          goto LABEL_123;
      }
    }
    *(float *)_D0.i32 = 0.0 / v27;
    __asm { FCVT            H0, S0 }
    if (v18 > 0xF)
    {
      v90 = v18 & 0xFFFFFFF0;
      v102 = vdupq_lane_s16(_D0, 0);
      v103 = (int16x8_t *)((char *)a4 + 16);
      v104 = v90;
      do
      {
        v103[-1] = v102;
        *v103 = v102;
        v103 += 2;
        v104 -= 16;
      }
      while (v104);
      if (v90 == v18)
        goto LABEL_123;
    }
    else
    {
      v90 = 0;
    }
    v105 = v18 - v90;
    v106 = (char *)a4 + 2 * v90;
    do
    {
      *v106++ = _D0.i16[0];
      --v105;
    }
    while (v105);
LABEL_123:

    v72 = 0;
    goto LABEL_124;
  }
  if (v11 == 2 && v14 == 4)
  {
    v21 = -[ADPearlColorInFieldCalibrationPipelineParameters featuresVectorAggregationSize](self->_pipelineParameters, "featuresVectorAggregationSize");
    v22 = v8;
    v23 = 0;
    v24 = 1;
    while (objc_msgSend(v22, "count") > (unint64_t)v23)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v24 *= objc_msgSend(v26, "intValue");

      ++v23;
    }
    if (!v24)
      goto LABEL_123;
    v55 = (float)v21;
    if (!v21)
    {
      *(float *)v25.i32 = 0.0 / v55;
      if (v24 > 7)
      {
        v101 = v24 & 0xFFFFFFF8;
        v108 = vdupq_lane_s32(v25, 0);
        v109 = (int32x4_t *)((char *)a4 + 16);
        v110 = v101;
        do
        {
          v109[-1] = v108;
          *v109 = v108;
          v109 += 2;
          v110 -= 8;
        }
        while (v110);
        if (v101 == v24)
          goto LABEL_123;
      }
      else
      {
        v101 = 0;
      }
      v111 = v24 - v101;
      v112 = (char *)a4 + 4 * v101;
      do
      {
        *v112++ = v25.i32[0];
        --v111;
      }
      while (v111);
      goto LABEL_123;
    }
    v56 = 0;
    v57 = v21 & 0xFFFFFFF0;
    while (1)
    {
      v58 = 0.0;
      if (v21 >= 0x10)
      {
        v59 = 0;
        v64 = __CFADD__((_DWORD)v56, v21 - 1);
        if (v24 == 1 && !v64)
        {
          v65 = 0;
          do
          {
            v66 = (float16x8_t *)((char *)a3 + 2 * (v56 + v65));
            v67 = v66[1];
            v68 = vcvt_hight_f32_f16(*v66);
            v69 = vcvtq_f32_f16(*(float16x4_t *)v66->i8);
            v70 = vcvt_hight_f32_f16(v67);
            v71 = vcvtq_f32_f16(*(float16x4_t *)v67.i8);
            v58 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v58 + v69.f32[0]) + v69.f32[1]) + v69.f32[2]) + v69.f32[3]) + v68.f32[0])
                                                                                                + v68.f32[1])
                                                                                        + v68.f32[2])
                                                                                + v68.f32[3])
                                                                        + v71.f32[0])
                                                                + v71.f32[1])
                                                        + v71.f32[2])
                                                + v71.f32[3])
                                        + v70.f32[0])
                                + v70.f32[1])
                        + v70.f32[2])
                + v70.f32[3];
            v65 += 16;
          }
          while (v57 != v65);
          v59 = v21 & 0xFFFFFFF0;
          if (v57 == v21)
            goto LABEL_37;
        }
      }
      else
      {
        v59 = 0;
      }
      v60 = v21 - v59;
      v61 = v56 + v24 * v59;
      do
      {
        _H2 = *((_WORD *)a3 + v61);
        __asm { FCVT            S2, H2 }
        v58 = v58 + _S2;
        v61 += v24;
        --v60;
      }
      while (v60);
LABEL_37:
      *((float *)a4 + v56++) = v58 / v55;
      if (v56 == v24)
        goto LABEL_123;
    }
  }
  if (v11 == 4 && v14 == 2)
  {
    v49 = -[ADPearlColorInFieldCalibrationPipelineParameters featuresVectorAggregationSize](self->_pipelineParameters, "featuresVectorAggregationSize");
    v50 = v8;
    v51 = 0;
    v52 = 1;
    while (objc_msgSend(v50, "count") > (unint64_t)v51)
    {
      objc_msgSend(v50, "objectAtIndexedSubscript:", v51);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v52 *= objc_msgSend(v54, "intValue");

      ++v51;
    }
    if (!v52)
      goto LABEL_123;
    v79 = (float)v49;
    if (!v49)
    {
      *(float *)_D0.i32 = 0.0 / v79;
      __asm { FCVT            H0, S0 }
      if (v52 > 0xF)
      {
        v107 = v52 & 0xFFFFFFF0;
        v114 = vdupq_lane_s16(_D0, 0);
        v115 = (int16x8_t *)((char *)a4 + 16);
        v116 = v107;
        do
        {
          v115[-1] = v114;
          *v115 = v114;
          v115 += 2;
          v116 -= 16;
        }
        while (v116);
        if (v107 == v52)
          goto LABEL_123;
      }
      else
      {
        v107 = 0;
      }
      v117 = v52 - v107;
      v118 = (char *)a4 + 2 * v107;
      do
      {
        *v118++ = _D0.i16[0];
        --v117;
      }
      while (v117);
      goto LABEL_123;
    }
    v80 = 0;
    v81 = v49 & 0xFFFFFFF8;
    while (1)
    {
      v83 = 0.0;
      if (v49 >= 0xC)
      {
        v84 = 0;
        v87 = __CFADD__((_DWORD)v80, v49 - 1);
        if (v52 == 1 && !v87)
        {
          v88 = 0;
          do
          {
            v89 = (char *)a3 + 4 * (v80 + v88);
            v83 = (float)((float)((float)((float)((float)((float)((float)(v83 + COERCE_FLOAT(*(_OWORD *)v89))
                                                                + COERCE_FLOAT(HIDWORD(*(_QWORD *)v89)))
                                                        + COERCE_FLOAT(*((_QWORD *)v89 + 1)))
                                                + COERCE_FLOAT(HIDWORD(*(_OWORD *)v89)))
                                        + COERCE_FLOAT(*((_OWORD *)v89 + 1)))
                                + COERCE_FLOAT(HIDWORD(*((_QWORD *)v89 + 2))))
                        + COERCE_FLOAT(*((_QWORD *)v89 + 3)))
                + COERCE_FLOAT(HIDWORD(*((_OWORD *)v89 + 1)));
            v88 += 8;
          }
          while (v81 != v88);
          v84 = v49 & 0xFFFFFFF8;
          if (v81 == v49)
            goto LABEL_60;
        }
      }
      else
      {
        v84 = 0;
      }
      v85 = v49 - v84;
      v86 = v80 + v52 * v84;
      do
      {
        v83 = v83 + *((float *)a3 + v86);
        v86 += v52;
        --v85;
      }
      while (v85);
LABEL_60:
      _S1 = v83 / v79;
      __asm { FCVT            H1, S1 }
      *((_WORD *)a4 + v80++) = LOWORD(_S1);
      if (v80 == v52)
        goto LABEL_123;
    }
  }
  v72 = -22950;
  if (v11 == 4 && v14 == 4)
  {
    v73 = -[ADPearlColorInFieldCalibrationPipelineParameters featuresVectorAggregationSize](self->_pipelineParameters, "featuresVectorAggregationSize");
    v74 = v8;
    v75 = 0;
    v76 = 1;
    while (objc_msgSend(v74, "count") > (unint64_t)v75)
    {
      objc_msgSend(v74, "objectAtIndexedSubscript:", v75);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v76 *= objc_msgSend(v78, "intValue");

      ++v75;
    }
    if (!v76)
      goto LABEL_123;
    v91 = (float)v73;
    if (!v73)
    {
      *(float *)v77.i32 = 0.0 / v91;
      if (v76 > 7)
      {
        v113 = v76 & 0xFFFFFFF8;
        v119 = vdupq_lane_s32(v77, 0);
        v120 = (int32x4_t *)((char *)a4 + 16);
        v121 = v113;
        do
        {
          v120[-1] = v119;
          *v120 = v119;
          v120 += 2;
          v121 -= 8;
        }
        while (v121);
        if (v113 == v76)
          goto LABEL_123;
      }
      else
      {
        v113 = 0;
      }
      v122 = v76 - v113;
      v123 = (char *)a4 + 4 * v113;
      do
      {
        *v123++ = v77.i32[0];
        --v122;
      }
      while (v122);
      goto LABEL_123;
    }
    v92 = 0;
    v93 = v73 & 0xFFFFFFF8;
    while (1)
    {
      v94 = 0.0;
      if (v73 >= 0xC)
      {
        v95 = 0;
        v96 = __CFADD__((_DWORD)v92, v73 - 1);
        if (v76 == 1 && !v96)
        {
          v97 = 0;
          do
          {
            v98 = (char *)a3 + 4 * (v92 + v97);
            v94 = (float)((float)((float)((float)((float)((float)((float)(v94 + COERCE_FLOAT(*(_OWORD *)v98))
                                                                + COERCE_FLOAT(HIDWORD(*(_QWORD *)v98)))
                                                        + COERCE_FLOAT(*((_QWORD *)v98 + 1)))
                                                + COERCE_FLOAT(HIDWORD(*(_OWORD *)v98)))
                                        + COERCE_FLOAT(*((_OWORD *)v98 + 1)))
                                + COERCE_FLOAT(HIDWORD(*((_QWORD *)v98 + 2))))
                        + COERCE_FLOAT(*((_QWORD *)v98 + 3)))
                + COERCE_FLOAT(HIDWORD(*((_OWORD *)v98 + 1)));
            v97 += 8;
          }
          while (v93 != v97);
          v95 = v73 & 0xFFFFFFF8;
          if (v93 == v73)
            goto LABEL_80;
        }
      }
      else
      {
        v95 = 0;
      }
      v99 = v73 - v95;
      v100 = v92 + v76 * v95;
      do
      {
        v94 = v94 + *((float *)a3 + v100);
        v100 += v76;
        --v99;
      }
      while (v99);
LABEL_80:
      *((float *)a4 + v92++) = v94 / v91;
      if (v92 == v76)
        goto LABEL_123;
    }
  }
LABEL_124:

  return v72;
}

- (id)frontendInferenceDescriptor
{
  return self->_frontendInferenceDesc;
}

- (id)createInterSessionDataWithDictionaryRepresentation:(id)a3
{
  id v4;
  ADPearlColorInFieldCalibrationInterSessionData *v5;
  void *v6;
  ADPearlColorInFieldCalibrationInterSessionData *v7;

  v4 = a3;
  v5 = [ADPearlColorInFieldCalibrationInterSessionData alloc];
  -[ADPipelineParameters deviceName](self->_pipelineParameters, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ADPearlColorInFieldCalibrationInterSessionData initWithDictionaryRepresentation:andDeviceName:](v5, "initWithDictionaryRepresentation:andDeviceName:", v4, v6);

  return v7;
}

- (ADPearlColorInFieldCalibrationInterSessionData)createInterSessionDataWithFactoryPearlToColorTransform:(double)a3 currentPearlToColorTransform:(double)a4
{
  return -[ADPearlColorInFieldCalibrationInterSessionData initWithFactoryPearlToColorTransform:currentPearlToColorTransform:andFlowType:]([ADPearlColorInFieldCalibrationInterSessionData alloc], "initWithFactoryPearlToColorTransform:currentPearlToColorTransform:andFlowType:", *(unsigned int *)(a1 + 40), a2, a3, a4, a5, a6, a7, a8, a9);
}

- (int64_t)postProcessFrontendOutputX:(void *)a3 frontendOutputY:(void *)a4 frontendOutputZ:(void *)a5 frontendOutputErrorX:(void *)a6 frontendOutputErrorY:(void *)a7 frontendOutputErrorZ:(void *)a8 interSessionData:(id)a9 pearlColorInFieldCalibrationResult:(id)a10
{
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  __int128 v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  unsigned __int8 *anon_3bd140;
  int networkFlowType;
  int32x4_t v38;
  int32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float v44;
  float v45;
  float v52;
  float v55;
  __int128 v58;
  __int128 v61;
  float v64;
  __int128 v67;
  float v68;
  float v69;
  double v70;
  float v71;
  float v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  int8x16_t v92;
  void *v93;
  uint64_t v94;
  id v95;
  __int128 v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  __int128 v103;
  __int128 v104;
  float32x4_t v105;
  __int128 v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  int32x4_t v110;
  float32x4_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  float32x4_t v120;
  float32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  __int128 v129;
  float32x4_t v130;
  float32x4_t v131;
  float32x4_t v132;
  int64x2_t v133;
  int64x2_t v134;
  int8x16_t v135;
  int8x16_t v136;
  int8x16_t v137;
  int8x16_t v138;
  uint64_t v139;
  int64_t v140;
  __int128 v141;
  float32x4_t v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  float32x4_t v147;
  __int128 v148;
  float32x4_t v149;
  float32x4_t v150;
  float32x4_t v151;
  float32x4_t v152;
  float32x4_t v153;
  float32x4_t v154;
  float32x4_t v155;
  float32x4_t v156;
  float32x4_t v157;
  float32x4_t v158;
  float32x4_t v159;
  float32x4_t v160;
  __int128 v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  float32x4_t v173;
  float32x4_t v174;
  float32x4_t v175;
  float32x4_t v176;
  float32x4_t v177;
  float32x4_t v178;
  float32x4_t v179;
  float32x4_t v180;
  float32x4_t v181;
  __int128 v182;
  float32x4_t v183;
  float32x4_t v184;
  float32x4_t v185;
  float32x4_t v186;
  float32x4_t v187;
  float32x4_t v188;
  float32x4_t v189;
  float32x4_t v191;
  float32x4_t v192;
  id v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  float32x4_t v197;
  float32x4_t v198;
  float32x4_t v199;
  unint64_t v200;
  __int128 v201;
  float32x4_t v202;
  __int128 v204;
  __int128 v206;
  int8x16_t v208;
  __int128 v210;
  uint64_t v211;
  __int32 v212;
  uint64_t v213;
  __int32 v214;
  uint64_t v215;
  __int32 v216;
  float32x4_t v217;
  float32x4_t v218;
  float32x4_t v219;
  id v220;
  uint64_t v221;
  __int32 v222;
  uint64_t v223;
  __int32 v224;
  uint64_t v225;
  __int32 v226;
  float32x4_t v227;
  float32x4_t v228;
  simd_float3 v229;
  id v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  int32x4_t v237;
  int32x4_t v238;
  int32x4_t v239;
  float32x4_t v240;
  float32x4_t v241;
  float32x4_t v242;
  simd_float3x3 v243;
  simd_float3x3 v244;
  simd_float3x3 v245;
  simd_float3x3 v246;
  simd_float3x3 v247;

  v193 = a9;
  v12 = a10;
  -[ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor rotationXOutput](self->_frontendInferenceDesc, "rotationXOutput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v14, "pixelFormat"), 0);

  -[ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor rotationYOutput](self->_frontendInferenceDesc, "rotationYOutput");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v17, "pixelFormat"), 0);

  -[ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor rotationZOutput](self->_frontendInferenceDesc, "rotationZOutput");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor rotationZOutput](self->_frontendInferenceDesc, "rotationZOutput");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageDescriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v200 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v21, "pixelFormat"), 0);

  }
  else
  {
    v200 = 0;
  }
  -[ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor errorXOutput](self->_frontendInferenceDesc, "errorXOutput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageDescriptor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v23, "pixelFormat"), 0);

  -[ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor errorYOutput](self->_frontendInferenceDesc, "errorYOutput");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "imageDescriptor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v26, "pixelFormat"), 0);

  -[ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor errorZOutput](self->_frontendInferenceDesc, "errorZOutput");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor errorZOutput](self->_frontendInferenceDesc, "errorZOutput");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "imageDescriptor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)objc_msgSend(v30, "pixelFormat"), 0);

  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(v12, "setExecuted:", 0);
  v238 = 0u;
  v239 = 0u;
  v237 = 0u;
  objc_msgSend(v193, "pearlToColorRotationAngles");
  v194 = v32;
  +[ADUtils calcRotationMatrix:](ADUtils, "calcRotationMatrix:");
  v185 = v34;
  v187 = v33;
  v183 = v35;
  anon_3bd140 = self->_anon_3bd140;
  v235 = 0u;
  v236 = 0u;
  v234 = 0u;
  v232 = 0u;
  v233 = 0u;
  v231 = 0u;
  networkFlowType = self->_networkFlowType;
  if (networkFlowType == 2)
  {
    v180 = *(float32x4_t *)&self[1]._frontendNetworkProvider;
    v181 = *(float32x4_t *)&self[1].super.isa;
    v178 = *(float32x4_t *)self[1]._anon_30;
    v179 = *(float32x4_t *)&self[1]._frontendInferenceDesc;
    goto LABEL_11;
  }
  if (!networkFlowType)
  {
    v38 = *(int32x4_t *)&self->_anon_3bd140[16];
    v39 = *(int32x4_t *)&self->_anon_3bd140[32];
    v40 = (float32x4_t)vzip1q_s32(vzip1q_s32(*(int32x4_t *)anon_3bd140, v39), v38);
    v41 = (float32x4_t)vtrn2q_s32(*(int32x4_t *)anon_3bd140, v38);
    v41.i32[2] = HIDWORD(*(_QWORD *)&self->_anon_3bd140[32]);
    v42 = (float32x4_t)vzip1q_s32(vzip2q_s32(*(int32x4_t *)anon_3bd140, v39), vdupq_laneq_s32(v38, 2));
    v181 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v40, COERCE_FLOAT(*(_OWORD *)self->_anon_70)), v41, *(float32x2_t *)self->_anon_70, 1), v42, *(float32x4_t *)self->_anon_70, 2);
    v180 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v40, COERCE_FLOAT(*(_OWORD *)&self->_anon_70[16])), v41, *(float32x2_t *)&self->_anon_70[16], 1), v42, *(float32x4_t *)&self->_anon_70[16], 2);
    v179 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v40, COERCE_FLOAT(*(_OWORD *)&self->_anon_70[32])), v41, *(float32x2_t *)&self->_anon_70[32], 1), v42, *(float32x4_t *)&self->_anon_70[32], 2);
    v43 = vsubq_f32(*(float32x4_t *)&self->_anon_70[48], *(float32x4_t *)&self->_anon_3bd140[48]);
    v178 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v40, v43.f32[0]), v41, *(float32x2_t *)v43.f32, 1), v42, v43, 2);
LABEL_11:
    v175 = *(float32x4_t *)MEMORY[0x24BDAEDF8];
    v176 = *(float32x4_t *)(MEMORY[0x24BDAEDF8] + 16);
    v177 = *(float32x4_t *)(MEMORY[0x24BDAEDF8] + 32);
    goto LABEL_13;
  }
  v180 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_20B6D2A60, COERCE_FLOAT(*(_OWORD *)&self[1]._frontendNetworkProvider)), (float32x4_t)xmmword_20B6D2A70, (float32x2_t)self[1]._frontendNetworkProvider, 1), (float32x4_t)xmmword_20B6D29D0, *(float32x4_t *)&self[1]._frontendNetworkProvider, 2);
  v181 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_20B6D2A60, COERCE_FLOAT(*(_OWORD *)&self[1].super.isa)), (float32x4_t)xmmword_20B6D2A70, (float32x2_t)self[1].super.isa, 1), (float32x4_t)xmmword_20B6D29D0, *(float32x4_t *)&self[1].super.isa, 2);
  v179 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_20B6D2A60, COERCE_FLOAT(*(_OWORD *)&self[1]._frontendInferenceDesc)), (float32x4_t)xmmword_20B6D2A70, (float32x2_t)self[1]._frontendInferenceDesc, 1), (float32x4_t)xmmword_20B6D29D0, *(float32x4_t *)&self[1]._frontendInferenceDesc, 2);
  v177 = (float32x4_t)xmmword_20B6D29D0;
  v178 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_20B6D2A60, COERCE_FLOAT(*(_OWORD *)self[1]._anon_30)), (float32x4_t)xmmword_20B6D2A70, *(float32x2_t *)self[1]._anon_30, 1), (float32x4_t)xmmword_20B6D29D0, *(float32x4_t *)self[1]._anon_30, 2);
  v176 = (float32x4_t)xmmword_20B6D2A80;
  v175 = (float32x4_t)xmmword_20B6D2A90;
LABEL_13:
  -[ADPearlColorInFieldCalibrationPipelineParameters colorCameraNominalEfl](self->_pipelineParameters, "colorCameraNominalEfl");
  v45 = v44 / self->_colorCameraEfl;
  if (v15 == 2)
  {
    _H1 = *(_WORD *)a3;
    __asm { FCVT            S1, H1 }
  }
  else
  {
    _S1 = *(float *)a3;
  }
  v52 = v45 * _S1;
  if (v18 == 2)
  {
    _H1 = *(_WORD *)a4;
    __asm { FCVT            S1, H1 }
  }
  else
  {
    _S1 = *(float *)a4;
  }
  v55 = v45 * _S1;
  if (v24 == 2)
  {
    _H3 = *(_WORD *)a6;
    __asm { FCVT            S3, H3 }
  }
  else
  {
    _S3 = *(_DWORD *)a6;
  }
  v58 = 0u;
  *(float *)&v58 = v52;
  if (v27 == 2)
  {
    _H2 = *(_WORD *)a7;
    __asm { FCVT            S2, H2 }
  }
  else
  {
    _S2 = *(_DWORD *)a7;
  }
  *((float *)&v58 + 1) = v55;
  v210 = v58;
  v61 = __PAIR64__(_S2, _S3);
  if (a5 && a8)
  {
    if (v200 == 2)
    {
      _H1 = *(_WORD *)a5;
      __asm { FCVT            S1, H1 }
    }
    else
    {
      _S1 = *(float *)a5;
    }
    v64 = v45 * _S1;
    if (v31 == 2)
    {
      _H1 = *(_WORD *)a8;
      __asm { FCVT            S1, H1 }
    }
    else
    {
      _S1 = *(_DWORD *)a8;
    }
    v67 = v58;
    *((float *)&v67 + 2) = v64;
    v210 = v67;
    DWORD2(v61) = _S1;
  }
  v195 = v61;
  -[ADPearlColorInFieldCalibrationPipeline claculateWeightedStd:](self, "claculateWeightedStd:");
  v69 = v68;
  -[ADPearlColorInFieldCalibrationPipelineParameters maxStdForValidResult](self->_pipelineParameters, "maxStdForValidResult");
  HIDWORD(v70) = 0;
  v204 = 0u;
  v206 = 0u;
  v208 = 0u;
  v196 = 0u;
  v201 = 0u;
  if (v69 > *(float *)&v70)
    goto LABEL_42;
  *(float *)&v70 = v69;
  -[ADPearlColorInFieldCalibrationPipeline convertStdToWeight:](self, "convertStdToWeight:", v70);
  v72 = v71;
  if (self->_networkFlowType == 2)
  {
    v243 = __invert_f3(*(simd_float3x3 *)_PromotedConst_5316);
    v191 = (float32x4_t)v243.columns[0];
    v197 = (float32x4_t)v243.columns[1];
    v202 = (float32x4_t)v243.columns[2];
    +[ADUtils calcRotationMatrix:](ADUtils, "calcRotationMatrix:", *(double *)&v210);
    v73 = *(float32x4_t *)&self[1].super.isa;
    v74 = *(float32x4_t *)&self[1]._frontendNetworkProvider;
    v75 = *(float32x4_t *)&self[1]._frontendInferenceDesc;
    v182 = *(_OWORD *)self[1]._anon_30;
    v76 = vmulq_f32(v73, (float32x4_t)0);
    __asm { FMOV            V16.4S, #-1.0 }
    v78 = vmlaq_f32(vmlaq_f32(v76, _Q16, v74), (float32x4_t)0, v75);
    v79 = vmlaq_f32(vmlaq_f32(v73, (float32x4_t)0, v74), (float32x4_t)0, v75);
    v80 = vaddq_f32(v75, vmlaq_f32(v76, (float32x4_t)0, v74));
    v81 = vmulq_f32(v187, (float32x4_t)0);
    v82 = vmlaq_f32(vmlaq_f32(v81, _Q16, v183), (float32x4_t)0, v185);
    v83 = vmlaq_f32(vmlaq_f32(v187, (float32x4_t)0, v183), (float32x4_t)0, v185);
    v84 = vaddq_f32(v185, vmlaq_f32(v81, (float32x4_t)0, v183));
    v88 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v85, v78.f32[0]), v86, *(float32x2_t *)v78.f32, 1), v87, v78, 2);
    v89 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v85, v79.f32[0]), v86, *(float32x2_t *)v79.f32, 1), v87, v79, 2);
    v90 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v85, v80.f32[0]), v86, *(float32x2_t *)v80.f32, 1), v87, v80, 2);
    v227.i32[2] = v88.i32[2];
    v228.i32[2] = v89.i32[2];
    v227.i64[0] = v88.i64[0];
    v228.i64[0] = v89.i64[0];
    v229.i32[2] = v90.i32[2];
    v229.i64[0] = v90.i64[0];
    v186 = v82;
    v188 = v83;
    v244.columns[0] = (simd_float3)v82;
    v244.columns[1] = (simd_float3)v83;
    v184 = v84;
    v244.columns[2] = (simd_float3)v84;
    v245 = __invert_f3(v244);
    v91 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v227, v245.columns[0].f32[0]), v228, *(float32x2_t *)v245.columns[0].f32, 1), (float32x4_t)v229, (float32x4_t)v245.columns[0], 2);
    v245.columns[0] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v227, v245.columns[1].f32[0]), v228, *(float32x2_t *)v245.columns[1].f32, 1), (float32x4_t)v229, (float32x4_t)v245.columns[1], 2);
    v245.columns[1] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v227, v245.columns[2].f32[0]), v228, *(float32x2_t *)v245.columns[2].f32, 1), (float32x4_t)v229, (float32x4_t)v245.columns[2], 2);
    v222 = v91.i32[2];
    v224 = v245.columns[0].i32[2];
    v221 = v91.i64[0];
    v223 = v245.columns[0].i64[0];
    v226 = v245.columns[1].i32[2];
    v225 = v245.columns[1].i64[0];
    +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v221);
    v208 = v92;
    objc_msgSend(v193, "convertExtrinsicsAnglesToDict:");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = 0;
    v94 = objc_msgSend(v193, "insertEntryAndCalculate:withWeight:toResult:", v93, &v220, v72);
    v95 = v220;
    if (!v94)
    {
      objc_msgSend(v193, "convertDictToExtrinsicsAngles:", v95);
      v204 = v96;
      +[ADUtils calcRotationMatrix:](ADUtils, "calcRotationMatrix:");
      v100 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v97, v186.f32[0]), v98, *(float32x2_t *)v186.f32, 1), v99, v186, 2);
      v101 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v97, v188.f32[0]), v98, *(float32x2_t *)v188.f32, 1), v99, v188, 2);
      v102 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v97, v184.f32[0]), v98, *(float32x2_t *)v184.f32, 1), v99, v184, 2);
      v217.i32[2] = v100.i32[2];
      v218.i32[2] = v101.i32[2];
      v217.i64[0] = v100.i64[0];
      v218.i64[0] = v101.i64[0];
      v219.i32[2] = v102.i32[2];
      v219.i64[0] = v102.i64[0];
      objc_msgSend(v12, "setPearlToColorExtrinsics:", *(double *)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v217, v191.f32[0]), v218, *(float32x2_t *)v191.f32, 1), v219, v191, 2).i64, *(double *)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v217, v197.f32[0]), v218, *(float32x2_t *)v197.f32, 1), v219, v197, 2).i64, *(double *)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v217, v202.f32[0]), v218, *(float32x2_t *)v202.f32, 1), v219, v202, 2).i64, *(double *)&v182);
      objc_msgSend(v12, "setExecuted:", 1);
      +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v227);
      v206 = v103;
      +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v217);
      v201 = v104;
      v189 = v217;
      v192 = v218;
      v198 = v219;
      v246.columns[0] = (simd_float3)v227;
      v246.columns[1] = (simd_float3)v228;
      v246.columns[2] = v229;
      v247 = __invert_f3(v246);
      v105 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v189, v247.columns[0].f32[0]), v192, *(float32x2_t *)v247.columns[0].f32, 1), v198, (float32x4_t)v247.columns[0], 2);
      v247.columns[0] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v189, v247.columns[1].f32[0]), v192, *(float32x2_t *)v247.columns[1].f32, 1), v198, (float32x4_t)v247.columns[1], 2);
      v247.columns[1] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v189, v247.columns[2].f32[0]), v192, *(float32x2_t *)v247.columns[2].f32, 1), v198, (float32x4_t)v247.columns[2], 2);
      v212 = v105.i32[2];
      v214 = v247.columns[0].i32[2];
      v211 = v105.i64[0];
      v213 = v247.columns[0].i64[0];
      v216 = v247.columns[1].i32[2];
      v215 = v247.columns[1].i64[0];
      +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v211);
      v196 = v106;
LABEL_41:

LABEL_42:
      objc_msgSend(v12, "setDeltaRotationX:", *(double *)&v210);
      HIDWORD(v162) = DWORD1(v210);
      LODWORD(v162) = DWORD1(v210);
      objc_msgSend(v12, "setDeltaRotationY:", v162);
      objc_msgSend(v12, "setDeltaRotationZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v210), DWORD2(v210))));
      objc_msgSend(v12, "setStdX:", *(double *)&v195);
      HIDWORD(v163) = DWORD1(v195);
      LODWORD(v163) = DWORD1(v195);
      objc_msgSend(v12, "setStdY:", v163);
      objc_msgSend(v12, "setStdZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v195), DWORD2(v195))));
      objc_msgSend(v12, "setAbsoluteRotationX:", *(double *)&v206);
      HIDWORD(v164) = DWORD1(v206);
      LODWORD(v164) = DWORD1(v206);
      objc_msgSend(v12, "setAbsoluteRotationY:", v164);
      objc_msgSend(v12, "setAbsoluteRotationZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v206), DWORD2(v206))));
      objc_msgSend(v12, "setFactoryRotationX:", *(double *)&v194);
      HIDWORD(v165) = DWORD1(v194);
      LODWORD(v165) = DWORD1(v194);
      objc_msgSend(v12, "setFactoryRotationY:", v165);
      objc_msgSend(v12, "setFactoryRotationZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v194), DWORD2(v194))));
      objc_msgSend(v12, "setAbsoluteRotationPostISFX:", *(double *)&v201);
      HIDWORD(v166) = DWORD1(v201);
      LODWORD(v166) = DWORD1(v201);
      objc_msgSend(v12, "setAbsoluteRotationPostISFY:", v166);
      objc_msgSend(v12, "setAbsoluteRotationPostISFZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v201), DWORD2(v201))));
      *(float *)&v167 = v69;
      objc_msgSend(v12, "setConfidence:", v167);
      objc_msgSend(v12, "setPreRelative2FactoryX:", *(double *)v208.i64);
      HIDWORD(v168) = v208.i32[1];
      LODWORD(v168) = v208.i32[1];
      objc_msgSend(v12, "setPreRelative2FactoryY:", v168);
      objc_msgSend(v12, "setPreRelative2FactoryZ:", COERCE_DOUBLE(__PAIR64__(v208.u32[1], v208.u32[2])));
      objc_msgSend(v12, "setPostRelative2FactoryX:", *(double *)&v204);
      HIDWORD(v169) = DWORD1(v204);
      LODWORD(v169) = DWORD1(v204);
      objc_msgSend(v12, "setPostRelative2FactoryY:", v169);
      objc_msgSend(v12, "setPostRelative2FactoryZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v204), DWORD2(v204))));
      objc_msgSend(v12, "setPostRelative2PrevX:", *(double *)&v196);
      HIDWORD(v170) = DWORD1(v196);
      LODWORD(v170) = DWORD1(v196);
      objc_msgSend(v12, "setPostRelative2PrevY:", v170);
      objc_msgSend(v12, "setPostRelative2PrevZ:", COERCE_DOUBLE(__PAIR64__(DWORD1(v196), DWORD2(v196))));
      objc_msgSend(v12, "setMotionRotation:", *((double *)anon_3bd140 + 8));
      objc_msgSend(v12, "setMotionTranslation:", *((double *)anon_3bd140 + 10));
      LODWORD(v171) = *((_DWORD *)anon_3bd140 + 24);
      objc_msgSend(v12, "setValidDepthPercentage:", v171);
      v140 = 0;
      goto LABEL_43;
    }
  }
  else
  {
    +[ADUtils addAnglesToRotation:angles:](ADUtils, "addAnglesToRotation:angles:", *(double *)v181.i64, *(double *)v180.i64, *(double *)v179.i64, *(double *)&v210);
    v107 = *(int32x4_t *)self->_anon_30;
    v108 = *(int32x4_t *)&self->_anon_30[16];
    v109 = *(int32x4_t *)&self->_anon_30[32];
    v110 = vzip2q_s32(v107, v109);
    v111 = (float32x4_t)vzip1q_s32(vzip1q_s32(v107, v109), v108);
    v112 = (float32x4_t)vtrn2q_s32(v107, v108);
    v112.i32[2] = HIDWORD(*(_QWORD *)&self->_anon_30[32]);
    v113 = (float32x4_t)vzip1q_s32(v110, vdupq_laneq_s32(v108, 2));
    v114 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v111, COERCE_FLOAT(*(_OWORD *)anon_3bd140)), v112, *(float32x2_t *)anon_3bd140, 1), v113, *(float32x4_t *)anon_3bd140, 2);
    v115 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v111, COERCE_FLOAT(*(_OWORD *)&self->_anon_3bd140[16])), v112, *(float32x2_t *)&self->_anon_3bd140[16], 1), v113, *(float32x4_t *)&self->_anon_3bd140[16], 2);
    v116 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v111, COERCE_FLOAT(*(_OWORD *)&self->_anon_3bd140[32])), v112, *(float32x2_t *)&self->_anon_3bd140[32], 1), v113, *(float32x4_t *)&self->_anon_3bd140[32], 2);
    v117 = *(float32x4_t *)self->_anon_b0;
    v118 = *(float32x4_t *)&self->_anon_b0[16];
    v119 = *(float32x4_t *)&self->_anon_b0[32];
    v120 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v117, v114.f32[0]), v118, *(float32x2_t *)v114.f32, 1), v119, v114, 2);
    v121 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v117, v115.f32[0]), v118, *(float32x2_t *)v115.f32, 1), v119, v115, 2);
    v122 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v117, v116.f32[0]), v118, *(float32x2_t *)v116.f32, 1), v119, v116, 2);
    v124 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v120, v123.f32[0]), v121, *(float32x2_t *)v123.f32, 1), v122, v123, 2);
    v126 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v120, v125.f32[0]), v121, *(float32x2_t *)v125.f32, 1), v122, v125, 2);
    v199 = v120;
    v173 = v122;
    v174 = v121;
    v128 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v120, v127.f32[0]), v121, *(float32x2_t *)v127.f32, 1), v122, v127, 2);
    v240.i32[2] = v124.i32[2];
    v241.i32[2] = v126.i32[2];
    v240.i64[0] = v124.i64[0];
    v241.i64[0] = v126.i64[0];
    v242.i32[2] = v128.i32[2];
    v242.i64[0] = v128.i64[0];
    +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v240);
    v206 = v129;
    v130 = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v240, v187.f32[0]), v241, v183.f32[0]), v242, v185.f32[0]);
    v131 = vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v240, *(float32x2_t *)v187.f32, 1), v241, *(float32x2_t *)v183.f32, 1), v242, *(float32x2_t *)v185.f32, 1);
    v132 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v240, v187, 2), v241, v183, 2), v242, v185, 2);
    DWORD2(v234) = v130.i32[2];
    DWORD2(v235) = v131.i32[2];
    *(_QWORD *)&v234 = v130.i64[0];
    *(_QWORD *)&v235 = v131.i64[0];
    DWORD2(v236) = v132.i32[2];
    *(_QWORD *)&v236 = v132.i64[0];
    +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v234);
    v133.i64[0] = 0;
    v134.i64[0] = (uint64_t)a5;
    v135 = (int8x16_t)vdupq_lane_s64(vceqq_s64(v134, v133).i64[0], 0);
    v137 = v136;
    v137.i32[2] = 0;
    v138 = vbslq_s8(v135, v137, v136);
    v138.i32[3] = v136.i32[3];
    v208 = v138;
    objc_msgSend(v193, "convertExtrinsicsAnglesToDict:", *(double *)v138.i64);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v230 = 0;
    v139 = objc_msgSend(v193, "insertEntryAndCalculate:withWeight:toResult:", v93, &v230, v72);
    v95 = v230;
    if (!v139)
    {
      objc_msgSend(v193, "convertDictToExtrinsicsAngles:", v95);
      v204 = v141;
      +[ADUtils calcRotationMatrix:](ADUtils, "calcRotationMatrix:", *(double *)&v141);
      v145 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v142, v187.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v187.f32, 1), v143), (float32x4_t)vdupq_laneq_s32((int32x4_t)v187, 2), v144);
      v146 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v142, v183.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v183.f32, 1), v143), (float32x4_t)vdupq_laneq_s32((int32x4_t)v183, 2), v144);
      v147 = vmlaq_f32(vmlaq_f32(vmulq_n_f32(v142, v185.f32[0]), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v185.f32, 1), v143), (float32x4_t)vdupq_laneq_s32((int32x4_t)v185, 2), v144);
      v237.i32[2] = v145.i32[2];
      v238.i32[2] = v146.i32[2];
      v237.i64[0] = v145.i64[0];
      v238.i64[0] = v146.i64[0];
      v239.i32[2] = v147.i32[2];
      v239.i64[0] = v147.i64[0];
      +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v237);
      v201 = v148;
      objc_msgSend(v12, "setPearlToColorExtrinsics:", *(double *)v237.i64, *(double *)v238.i64, *(double *)v239.i64, *(double *)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v199, v178.f32[0]), v174, *(float32x2_t *)v178.f32, 1), v173, v178, 2).i64);
      objc_msgSend(v12, "setExecuted:", 1);
      v149 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v199, v181.f32[0]), v174, *(float32x2_t *)v181.f32, 1), v173, v181, 2);
      v150 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v199, v180.f32[0]), v174, *(float32x2_t *)v180.f32, 1), v173, v180, 2);
      v151 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v199, v179.f32[0]), v174, *(float32x2_t *)v179.f32, 1), v173, v179, 2);
      v152 = (float32x4_t)vzip1q_s32(vzip1q_s32(v237, v239), v238);
      v153 = (float32x4_t)vtrn2q_s32(v237, v238);
      v153.i32[2] = v239.i32[1];
      v154 = (float32x4_t)vzip1q_s32(vzip2q_s32(v237, v239), vdupq_laneq_s32(v238, 2));
      v155 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v152, v175.f32[0]), v153, *(float32x2_t *)v175.f32, 1), v154, v175, 2);
      v156 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v152, v176.f32[0]), v153, *(float32x2_t *)v176.f32, 1), v154, v176, 2);
      v157 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v152, v177.f32[0]), v153, *(float32x2_t *)v177.f32, 1), v154, v177, 2);
      v158 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v155, v149.f32[0]), v156, *(float32x2_t *)v149.f32, 1), v157, v149, 2);
      v159 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v155, v150.f32[0]), v156, *(float32x2_t *)v150.f32, 1), v157, v150, 2);
      v160 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v155, v151.f32[0]), v156, *(float32x2_t *)v151.f32, 1), v157, v151, 2);
      DWORD2(v231) = v158.i32[2];
      DWORD2(v232) = v159.i32[2];
      *(_QWORD *)&v231 = v158.i64[0];
      *(_QWORD *)&v232 = v159.i64[0];
      DWORD2(v233) = v160.i32[2];
      *(_QWORD *)&v233 = v160.i64[0];
      +[ADUtils calcRotationAngle:](ADUtils, "calcRotationAngle:", &v231);
      v196 = v161;
      goto LABEL_41;
    }
  }

  v140 = -22950;
LABEL_43:

  return v140;
}

- (int64_t)undistortColorImage:(__CVBuffer *)a3 undistortedImage:(__CVBuffer *)a4 calibration:(id)a5
{
  PixelBufferUtils *PixelFormatType;
  unint64_t v9;
  CGRect *v10;
  float32x2_t v11;
  float v12;
  float32x2_t v13;
  float v14;
  float v15;
  vImagePixelCount height;
  vImagePixelCount width;
  vImagePixelCount v18;
  CGPoint *distortedImagePixels;
  size_t rowBytes;
  float v21;
  char *data;
  float v23;
  char *v24;
  size_t v25;
  CGFloat *p_y;
  char *v27;
  vImagePixelCount v28;
  char *v29;
  vImagePixelCount v30;
  _BYTE *v31;
  double *p_x;
  float v33;
  BOOL v34;
  float v35;
  BOOL v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  float32x2_t v42;
  float v43;
  float v44;
  size_t v45;
  size_t v46;
  char *v47;
  char *v48;
  _BYTE *v49;
  unint64_t v50;
  float32x2_t v51;
  float v52;
  float v53;
  BOOL v54;
  double *v55;
  uint64_t i;
  float v57;
  float v58;
  BOOL v59;
  vImage_Buffer v61;
  vImage_Buffer v62;

  PixelFormatType = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a3);
  v9 = PixelBufferUtils::pixelSizeForPixelFormat(PixelFormatType, 0);
  CVPixelBufferLockBaseAddress(a4, 0);
  CVPixelBufferLockBaseAddress(a3, 0);
  memset(&v62, 0, sizeof(v62));
  v10 = (CGRect *)MEMORY[0x24BDBF090];
  PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x24BDBF090], &v62);
  memset(&v61, 0, sizeof(v61));
  PixelBufferUtils::asVImageBuffer(a4, *v10, &v61);
  height = v61.height;
  if (v61.height)
  {
    width = v61.width;
    if (v61.width)
    {
      v18 = 0;
      distortedImagePixels = self->_distortedImagePixels;
      rowBytes = v62.rowBytes;
      v21 = (float)(v62.width - 1);
      data = (char *)v62.data;
      v23 = (float)(v62.height - 1);
      v24 = (char *)v61.data;
      v25 = v61.rowBytes;
      p_y = &self->_distortedImagePixels[1].y;
      v27 = (char *)v61.data;
      v28 = v61.width;
      do
      {
        if (v28)
        {
          v29 = &v24[v25 * v18];
          if (v9)
          {
            v30 = 0;
            v31 = v27;
            do
            {
              p_x = &distortedImagePixels[v30 + v28 * v18].x;
              v33 = *p_x + -0.5;
              v34 = v33 >= 0.0 && v33 < v21;
              if (v34 && ((v35 = p_x[1] + -0.5, v35 >= 0.0) ? (v36 = v35 < v23) : (v36 = 0), v36))
              {
                v37 = vcvtms_u32_f32(v33);
                v38 = vcvtps_u32_f32(v33);
                v39 = vcvtms_u32_f32(v35);
                v40 = vcvtps_u32_f32(v35);
                if (v37 == v38)
                  v41 = v38 + 1;
                else
                  v41 = v38;
                if (v39 == v40)
                  ++v40;
                v42.f32[0] = (float)v41 - v33;
                v42.f32[1] = v33 - (float)v37;
                v43 = (float)v40 - v35;
                v11.f32[0] = v35 - (float)v39;
                if ((v40 - v39) * (v41 - v37) == 1)
                  v44 = 1.0;
                else
                  v44 = 0.0;
                v11 = (float32x2_t)vdup_lane_s32((int32x2_t)v11, 0);
                v45 = rowBytes * v39;
                v46 = rowBytes * v40;
                v47 = &data[v41 * v9];
                v48 = &data[v9 * v37];
                v49 = v31;
                v50 = v9;
                do
                {
                  LOBYTE(v12) = v48[v45];
                  v13.i8[0] = v48[v46];
                  v51.f32[0] = (float)LODWORD(v12);
                  LOBYTE(v14) = v47[v45];
                  v14 = (float)LODWORD(v14);
                  LOBYTE(v15) = v47[v46];
                  v13.f32[0] = (float)v13.u32[0];
                  v15 = (float)LODWORD(v15);
                  v51.f32[1] = v14;
                  v13.f32[1] = v15;
                  v12 = vaddv_f32(vmul_f32(v42, vmla_f32(vmul_n_f32(v51, v43), v11, v13))) * v44;
                  *v49++ = (int)v12;
                  ++v47;
                  ++v48;
                  --v50;
                }
                while (v50);
              }
              else
              {
                *(_DWORD *)&v29[v30 * v9] = 0;
              }
              ++v30;
              v31 += v9;
              v28 = width;
            }
            while (v30 < width);
          }
          else
          {
            v52 = distortedImagePixels[v28 * v18].x + -0.5;
            if (v52 < 0.0
              || v52 >= v21
              || ((v53 = distortedImagePixels[v28 * v18].y + -0.5, v53 >= 0.0) ? (v54 = v53 < v23) : (v54 = 0), !v54))
            {
              *(_DWORD *)v29 = 0;
            }
            v28 = width;
            if (width < 2)
              goto LABEL_5;
            v55 = p_y;
            for (i = 1; i != width; ++i)
            {
              v57 = *(v55 - 1) + -0.5;
              if (v57 < 0.0 || v57 >= v21 || ((v58 = *v55 + -0.5, v58 >= 0.0) ? (v59 = v58 < v23) : (v59 = 0), !v59))
                *(_DWORD *)v29 = 0;
              v55 += 2;
            }
          }
          v28 = width;
        }
LABEL_5:
        ++v18;
        v27 += v25;
        p_y += 2 * width;
      }
      while (v18 < height);
    }
  }
  CVPixelBufferUnlockBaseAddress(a4, 0);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return 0;
}

- (float)claculateWeightedStd:(ADPearlColorInFieldCalibrationPipeline *)self
{
  _BYTE v2[12];
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  int v17;

  v17 = *(_DWORD *)&v2[8];
  -[ADPearlColorInFieldCalibrationPipelineParameters coeffX](self->_pipelineParameters, "coeffX");
  -[ADPearlColorInFieldCalibrationPipelineParameters coeffY](self->_pipelineParameters, "coeffY");
  -[ADPearlColorInFieldCalibrationPipelineParameters coeffZ](self->_pipelineParameters, "coeffZ");
  _V1.S[2] = v17;
  __asm { FMLA            S9, S0, V1.S[2] }
  -[ADPearlColorInFieldCalibrationPipelineParameters coeffX](self->_pipelineParameters, "coeffX");
  v12 = v11;
  -[ADPearlColorInFieldCalibrationPipelineParameters coeffY](self->_pipelineParameters, "coeffY");
  v14 = v12 + v13;
  -[ADPearlColorInFieldCalibrationPipelineParameters coeffZ](self->_pipelineParameters, "coeffZ");
  return _S9 / (float)(v14 + v15);
}

- (float)convertStdToWeight:(float)a3
{
  return 1.0 / (a3 * a3);
}

- (void)reportTelemetry:(id)a3 withInterSessionData:(id)a4
{
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSMutableArray *v57;
  void *v58;
  uint8_t buf[4];
  const __CFString *v60;
  _QWORD v61[20];
  _QWORD v62[22];

  v62[20] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v56 = a4;
  objc_msgSend(v56, "inFieldCalibrationTelemetryData");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "firedEventTimestampsArray");
  v57 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "executed"))
  {
    objc_msgSend(v5, "postRelative2FactoryX");
    v7 = v6;
    objc_msgSend(v5, "postRelative2FactoryY");
    v9 = v8;
    objc_msgSend(v5, "postRelative2FactoryZ");
    analyzeOneShotExtremeRotation(v7, v9, v10, CFSTR("com.apple.applecamerad.PearlToRGB.LargeToleranceDetected"), v57);
  }
  v61[0] = CFSTR("MaxBackendRunTime");
  v11 = (void *)MEMORY[0x24BDD16E0];
  v12 = (double)(unint64_t)objc_msgSend(v58, "maxBackendRunTime") / 1000.0;
  *(float *)&v12 = v12;
  objc_msgSend(v11, "numberWithFloat:", v12);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v55;
  v61[1] = CFSTR("MinBackendRunTime");
  v13 = (void *)MEMORY[0x24BDD16E0];
  v14 = (double)(unint64_t)objc_msgSend(v58, "minBackendRunTime") / 1000.0;
  *(float *)&v14 = v14;
  objc_msgSend(v13, "numberWithFloat:", v14);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v54;
  v61[2] = CFSTR("TimeSincePrevRun");
  v15 = (void *)MEMORY[0x24BDD16E0];
  v16 = (double)(unint64_t)objc_msgSend(v58, "timeSincePrevRun") / 1000.0;
  *(float *)&v16 = v16;
  objc_msgSend(v15, "numberWithFloat:", v16);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v53;
  v61[3] = CFSTR("TotalBackendTime");
  v17 = (void *)MEMORY[0x24BDD16E0];
  v18 = (double)(unint64_t)objc_msgSend(v58, "totalBackendTime") / 1000.0;
  *(float *)&v18 = v18;
  objc_msgSend(v17, "numberWithFloat:", v18);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v52;
  v61[4] = CFSTR("TotalFrontEndTime");
  v19 = (void *)MEMORY[0x24BDD16E0];
  v20 = (double)(unint64_t)objc_msgSend(v58, "frontEndTime") / 1000.0;
  *(float *)&v20 = v20;
  objc_msgSend(v19, "numberWithFloat:", v20);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v51;
  v61[5] = CFSTR("TotalNumRuns");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v58, "totalNumRuns"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v50;
  v61[6] = CFSTR("Confidence");
  v21 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "confidence");
  objc_msgSend(v21, "numberWithFloat:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v49;
  v61[7] = CFSTR("FilteredRotXComparedToFactory");
  v22 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "postRelative2FactoryX");
  objc_msgSend(v22, "numberWithFloat:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62[7] = v48;
  v61[8] = CFSTR("FilteredRotXComparedToPrev");
  v23 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "postRelative2PrevX");
  objc_msgSend(v23, "numberWithFloat:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v62[8] = v47;
  v61[9] = CFSTR("FilteredRotYComparedToFactory");
  v24 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "postRelative2FactoryY");
  objc_msgSend(v24, "numberWithFloat:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v62[9] = v46;
  v61[10] = CFSTR("FilteredRotYComparedToPrev");
  v25 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "postRelative2PrevY");
  objc_msgSend(v25, "numberWithFloat:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v62[10] = v45;
  v61[11] = CFSTR("FilteredRotZComparedToFactory");
  v26 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "postRelative2FactoryZ");
  objc_msgSend(v26, "numberWithFloat:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v62[11] = v44;
  v61[12] = CFSTR("FilteredRotZComparedToPrev");
  v27 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "postRelative2PrevZ");
  objc_msgSend(v27, "numberWithFloat:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v62[12] = v28;
  v61[13] = CFSTR("RotXComparedToFactory");
  v29 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "preRelative2FactoryX");
  objc_msgSend(v29, "numberWithFloat:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v62[13] = v30;
  v61[14] = CFSTR("RotXComparedToPrev");
  v31 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "deltaRotationX");
  objc_msgSend(v31, "numberWithFloat:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62[14] = v32;
  v61[15] = CFSTR("RotYComparedToFactory");
  v33 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "preRelative2FactoryY");
  objc_msgSend(v33, "numberWithFloat:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v62[15] = v34;
  v61[16] = CFSTR("RotYComparedToPrev");
  v35 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "deltaRotationY");
  objc_msgSend(v35, "numberWithFloat:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v62[16] = v36;
  v61[17] = CFSTR("RotZComparedToFactory");
  v37 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "preRelative2FactoryZ");
  objc_msgSend(v37, "numberWithFloat:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v62[17] = v38;
  v61[18] = CFSTR("RotZComparedToPrev");
  v39 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "deltaRotationZ");
  objc_msgSend(v39, "numberWithFloat:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v62[18] = v40;
  v61[19] = CFSTR("Succeeded");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "executed"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62[19] = v41;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 20);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v42;
  if (AnalyticsSendEventLazy())
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = CFSTR("com.apple.applecamerad.PearlToRGB");
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "pearl Color In-Field calibration pipeline Telemetry event %@ fired", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = CFSTR("com.apple.applecamerad.PearlToRGB");
      _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "pearl Color In-Field calibration pipeline Telemetry event %@ fired", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v60 = CFSTR("com.apple.applecamerad.PearlToRGB");
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "pearl Color In-Field calibration pipeline Telemetry event %{public}@ failed to fire", buf, 0xCu);
  }

}

- (BOOL)isPearlMaskExpected
{
  return self->_networkFlowType == 2;
}

- (BOOL)isZused
{
  return self->_networkFlowType == 2;
}

- (ADPearlColorInFieldCalibrationPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void)setPipelineParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 3920296);
}

- (__n128)pearlToColorCurrentTransform
{
  return a1[245019];
}

- (__n128)setPearlToColorCurrentTransform:(__n128)a3
{
  result[245019] = a2;
  result[245020] = a3;
  result[245021] = a4;
  result[245022] = a5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_pearlCalib, 0);
  objc_storeStrong((id *)&self->_colorCalib, 0);
  objc_storeStrong((id *)&self->_pearlReprojector, 0);
  objc_storeStrong((id *)&self->_controllerParameters, 0);
  objc_storeStrong((id *)&self->_frontendInferenceDesc, 0);
  objc_storeStrong((id *)&self->_backendInferenceDesc, 0);
  objc_storeStrong((id *)&self->_frontendNetworkProvider, 0);
  objc_storeStrong((id *)&self->_backendNetworkProvider, 0);
}

id __79__ADPearlColorInFieldCalibrationPipeline_reportTelemetry_withInterSessionData___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)isValidDepthAboveThreshold:(__CVBuffer *)a3 threshold:(float)a4 invalid:(unsigned __int16)a5 validDepthPercentage:(float *)a6
{
  unsigned int v7;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unsigned __int16 *v17;
  size_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 *v22;
  size_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *BaseAddress;
  int64x2_t v29;
  int64x2_t v30;
  int16x8_t *v31;
  unint64_t v32;
  int64x2_t v33;
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  int64x2_t v38;
  uint16x8_t v39;
  uint32x4_t v40;
  int8x16_t v41;
  int64x2_t v42;
  int64x2_t v43;
  uint32x4_t v44;
  int64x2_t v45;
  int64x2_t v46;
  uint16x8_t v47;
  uint32x4_t v48;
  int64x2_t v49;
  int64x2_t v50;
  uint32x4_t v51;
  int64x2_t v52;
  char *v53;
  size_t v54;
  int v55;
  float v56;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  char *v61;
  int64x2_t v62;
  int64x2_t v63;
  int16x8_t *v64;
  unint64_t v65;
  int64x2_t v66;
  int64x2_t v67;
  int64x2_t v68;
  int64x2_t v69;
  int64x2_t v70;
  int64x2_t v71;
  uint16x8_t v72;
  uint32x4_t v73;
  int8x16_t v74;
  int64x2_t v75;
  int64x2_t v76;
  uint32x4_t v77;
  int64x2_t v78;
  int64x2_t v79;
  uint16x8_t v80;
  uint32x4_t v81;
  int64x2_t v82;
  int64x2_t v83;
  uint32x4_t v84;
  int64x2_t v85;
  char *v86;
  size_t v87;
  int v88;
  unint64_t v89;
  float *v90;
  int8x16_t v91;
  int8x16_t v92;
  unint64_t v93;
  int16x8_t v94;

  v7 = a5;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  v93 = (unint64_t)(float)((float)(Height * Width) * a4);
  if (Height)
  {
    if (Width)
    {
      v13 = Width & 0xFFFFFFFFFFFFFFF0;
      v94 = vdupq_n_s16(v7);
      v89 = Height * Width;
      v90 = a6;
      if (a6)
      {
        if (Width >= 0x10)
        {
          v25 = 0;
          v16 = 0;
          v26 = (2 * Width) & 0xFFFFFFFFFFFFFFE0;
          v27 = 16;
          v91 = (int8x16_t)vdupq_n_s64(1uLL);
          do
          {
            BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
            v29 = 0uLL;
            v30 = (int64x2_t)v16;
            v31 = (int16x8_t *)&BaseAddress[v27];
            v32 = Width & 0xFFFFFFFFFFFFFFF0;
            v33 = 0uLL;
            v34 = 0uLL;
            v35 = 0uLL;
            v36 = 0uLL;
            v37 = 0uLL;
            v38 = 0uLL;
            do
            {
              v39 = (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v31[-1], v94));
              v40 = vmovl_u16(*(uint16x4_t *)v39.i8);
              v41.i64[0] = v40.u32[0];
              v41.i64[1] = v40.u32[1];
              v42 = (int64x2_t)vandq_s8(v41, v91);
              v41.i64[0] = v40.u32[2];
              v41.i64[1] = v40.u32[3];
              v43 = (int64x2_t)vandq_s8(v41, v91);
              v44 = vmovl_high_u16(v39);
              v41.i64[0] = v44.u32[0];
              v41.i64[1] = v44.u32[1];
              v45 = (int64x2_t)vandq_s8(v41, v91);
              v41.i64[0] = v44.u32[2];
              v41.i64[1] = v44.u32[3];
              v46 = (int64x2_t)vandq_s8(v41, v91);
              v47 = (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(*v31, v94));
              v48 = vmovl_u16(*(uint16x4_t *)v47.i8);
              v41.i64[0] = v48.u32[0];
              v41.i64[1] = v48.u32[1];
              v49 = (int64x2_t)vandq_s8(v41, v91);
              v41.i64[0] = v48.u32[2];
              v41.i64[1] = v48.u32[3];
              v50 = (int64x2_t)vandq_s8(v41, v91);
              v51 = vmovl_high_u16(v47);
              v41.i64[0] = v51.u32[0];
              v41.i64[1] = v51.u32[1];
              v52 = (int64x2_t)vandq_s8(v41, v91);
              v41.i64[0] = v51.u32[2];
              v41.i64[1] = v51.u32[3];
              v34 = vaddq_s64(v34, v46);
              v33 = vaddq_s64(v33, v45);
              v29 = vaddq_s64(v29, v43);
              v30 = vaddq_s64(v30, v42);
              v38 = vaddq_s64(v38, (int64x2_t)vandq_s8(v41, v91));
              v37 = vaddq_s64(v37, v52);
              v36 = vaddq_s64(v36, v50);
              v35 = vaddq_s64(v35, v49);
              v31 += 2;
              v32 -= 16;
            }
            while (v32);
            v16 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v35, v30), vaddq_s64(v37, v33)), vaddq_s64(vaddq_s64(v36, v29), vaddq_s64(v38, v34))));
            if (Width != v13)
            {
              v53 = &BaseAddress[v26];
              v54 = Width - v13;
              do
              {
                v55 = *(unsigned __int16 *)v53;
                v53 += 2;
                if (v55 != v7)
                  ++v16;
                --v54;
              }
              while (v54);
            }
            ++v25;
            v27 += BytesPerRow;
            v26 += BytesPerRow;
          }
          while (v25 != Height);
        }
        else
        {
          v14 = 0;
          v15 = 0;
          v16 = 0;
          do
          {
            v17 = (unsigned __int16 *)((char *)CVPixelBufferGetBaseAddress(a3) + v14);
            v18 = Width;
            do
            {
              v19 = *v17++;
              if (v19 != v7)
                ++v16;
              --v18;
            }
            while (v18);
            ++v15;
            v14 += BytesPerRow;
          }
          while (v15 != Height);
        }
        goto LABEL_39;
      }
      if (Width >= 0x10)
      {
        v58 = 0;
        v16 = 0;
        v59 = (2 * Width) & 0xFFFFFFFFFFFFFFE0;
        v60 = 16;
        v92 = (int8x16_t)vdupq_n_s64(1uLL);
        while (v16 < v93)
        {
          v61 = (char *)CVPixelBufferGetBaseAddress(a3);
          v62 = 0uLL;
          v63 = (int64x2_t)v16;
          v64 = (int16x8_t *)&v61[v60];
          v65 = Width & 0xFFFFFFFFFFFFFFF0;
          v66 = 0uLL;
          v67 = 0uLL;
          v68 = 0uLL;
          v69 = 0uLL;
          v70 = 0uLL;
          v71 = 0uLL;
          do
          {
            v72 = (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v64[-1], v94));
            v73 = vmovl_u16(*(uint16x4_t *)v72.i8);
            v74.i64[0] = v73.u32[0];
            v74.i64[1] = v73.u32[1];
            v75 = (int64x2_t)vandq_s8(v74, v92);
            v74.i64[0] = v73.u32[2];
            v74.i64[1] = v73.u32[3];
            v76 = (int64x2_t)vandq_s8(v74, v92);
            v77 = vmovl_high_u16(v72);
            v74.i64[0] = v77.u32[0];
            v74.i64[1] = v77.u32[1];
            v78 = (int64x2_t)vandq_s8(v74, v92);
            v74.i64[0] = v77.u32[2];
            v74.i64[1] = v77.u32[3];
            v79 = (int64x2_t)vandq_s8(v74, v92);
            v80 = (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(*v64, v94));
            v81 = vmovl_u16(*(uint16x4_t *)v80.i8);
            v74.i64[0] = v81.u32[0];
            v74.i64[1] = v81.u32[1];
            v82 = (int64x2_t)vandq_s8(v74, v92);
            v74.i64[0] = v81.u32[2];
            v74.i64[1] = v81.u32[3];
            v83 = (int64x2_t)vandq_s8(v74, v92);
            v84 = vmovl_high_u16(v80);
            v74.i64[0] = v84.u32[0];
            v74.i64[1] = v84.u32[1];
            v85 = (int64x2_t)vandq_s8(v74, v92);
            v74.i64[0] = v84.u32[2];
            v74.i64[1] = v84.u32[3];
            v67 = vaddq_s64(v67, v79);
            v66 = vaddq_s64(v66, v78);
            v62 = vaddq_s64(v62, v76);
            v63 = vaddq_s64(v63, v75);
            v71 = vaddq_s64(v71, (int64x2_t)vandq_s8(v74, v92));
            v70 = vaddq_s64(v70, v85);
            v69 = vaddq_s64(v69, v83);
            v68 = vaddq_s64(v68, v82);
            v64 += 2;
            v65 -= 16;
          }
          while (v65);
          v16 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v68, v63), vaddq_s64(v70, v66)), vaddq_s64(vaddq_s64(v69, v62), vaddq_s64(v71, v67))));
          if (Width != v13)
          {
            v86 = &v61[v59];
            v87 = Width - v13;
            do
            {
              v88 = *(unsigned __int16 *)v86;
              v86 += 2;
              if (v88 != v7)
                ++v16;
              --v87;
            }
            while (v87);
          }
          ++v58;
          v60 += BytesPerRow;
          v59 += BytesPerRow;
          if (v58 == Height)
            goto LABEL_39;
        }
      }
      else
      {
        v20 = 0;
        v21 = 0;
        v16 = 0;
        while (v16 < v93)
        {
          v22 = (unsigned __int16 *)((char *)CVPixelBufferGetBaseAddress(a3) + v20);
          v23 = Width;
          do
          {
            v24 = *v22++;
            if (v24 != v7)
              ++v16;
            --v23;
          }
          while (v23);
          ++v21;
          v20 += BytesPerRow;
          if (v21 == Height)
            goto LABEL_39;
        }
      }
LABEL_16:
      CVPixelBufferUnlockBaseAddress(a3, 0);
      return v16 >= v93;
    }
    if (!a6 && !v93)
    {
      v16 = 0;
      goto LABEL_16;
    }
    v89 = 0;
    v90 = a6;
    do
    {
      CVPixelBufferGetBaseAddress(a3);
      --Height;
    }
    while (Height);
  }
  else
  {
    v89 = 0;
    v90 = a6;
  }
  v16 = 0;
LABEL_39:
  CVPixelBufferUnlockBaseAddress(a3, 0);
  if (v90)
  {
    v56 = (double)v16 * 100.0 / (double)v89;
    *v90 = v56;
  }
  return v16 >= v93;
}

+ (BOOL)isPearlFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4 andPipelineParameters:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int16 v16;
  BOOL v17;
  NSObject *v18;
  const char *v19;
  uint32_t v20;
  _DWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "valueForKey:", CFSTR("RegType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v17 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    LOWORD(v22[0]) = 0;
    v18 = MEMORY[0x24BDACB70];
    v19 = "ADPearlColorInFieldCalibration: pearl buffer not valid for algorithm: registration mode unknown";
    v20 = 2;
LABEL_10:
    _os_log_impl(&dword_20B62B000, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)v22, v20);
    v17 = 0;
    goto LABEL_16;
  }
  v11 = objc_msgSend(v9, "intValue");
  v12 = v11;
  if (v11 != 3 && v11 != 27)
  {
    v17 = 0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v22[0] = 67109120;
    v22[1] = v12;
    v18 = MEMORY[0x24BDACB70];
    v19 = "ADPearlColorInFieldCalibration: pearl buffer not valid for algorithm: unregistered mode (%d)";
    v20 = 8;
    goto LABEL_10;
  }
  CVPixelBufferGetAttributes();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("FixedPointInvalidValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v16 = objc_msgSend(v14, "intValue");
  else
    v16 = 0;
  objc_msgSend(v8, "thresholdPrecOfValidDepth");
  v17 = +[ADPearlColorInFieldCalibrationPipeline isValidDepthAboveThreshold:threshold:invalid:validDepthPercentage:](ADPearlColorInFieldCalibrationPipeline, "isValidDepthAboveThreshold:threshold:invalid:validDepthPercentage:", a3, v16, 0);
  if (!v17 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22[0]) = 0;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInFieldCalibration pearl controller failed: frame does not have enough valid depth pixels", (uint8_t *)v22, 2u);
  }

LABEL_16:
  return v17;
}

+ (BOOL)isPearlFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4
{
  id v5;
  ADPearlColorInFieldCalibrationControllerParameters *v6;

  v5 = a4;
  v6 = objc_alloc_init(ADPearlColorInFieldCalibrationControllerParameters);
  LOBYTE(a3) = +[ADPearlColorInFieldCalibrationPipeline isPearlFrameValid:withMetadata:andPipelineParameters:](ADPearlColorInFieldCalibrationPipeline, "isPearlFrameValid:withMetadata:andPipelineParameters:", a3, v5, v6);

  return (char)a3;
}

+ (BOOL)isColorFrameValid:(__CVBuffer *)a3 withMetadata:(id)a4
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  uint32_t v13;
  int v15;
  int v16;
  NSObject *v17;
  const char *v18;
  uint32_t v19;
  int v20;
  int v21;
  int v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = +[ADDeviceConfiguration integerForKey:](ADDeviceConfiguration, "integerForKey:", kADDeviceConfigurationKeyPearlColorMinimumLuxLevel);
  objc_msgSend(v4, "valueForKey:", CFSTR("AEStable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("LuxLevel"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_6;
        v21 = 67109120;
        v22 = objc_msgSend(v6, "intValue");
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInfieldCalibration: AE is stable: %d", (uint8_t *)&v21, 8u);
        if (ADDebugUtilsADVerboseLogsEnabled)
          goto LABEL_6;
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v21 = 67109120;
        v22 = objc_msgSend(v6, "intValue");
        _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "ADPearlColorInfieldCalibration: AE is stable: %d", (uint8_t *)&v21, 8u);
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
LABEL_6:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            v9 = objc_msgSend(v8, "intValue");
            v21 = 67109120;
            v22 = v9;
            _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADPearlColorInfieldCalibration: Lux level: %d", (uint8_t *)&v21, 8u);
          }
LABEL_19:
          if (v5 > (int)objc_msgSend(v8, "intValue"))
          {
            if (ADDebugUtilsADVerboseLogsEnabled)
            {
              v10 = 0;
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                goto LABEL_15;
              v15 = objc_msgSend(v8, "intValue");
              v21 = 67109376;
              v22 = v15;
              v23 = 2048;
              v24 = v5;
              v11 = MEMORY[0x24BDACB70];
              v12 = "ADPearlColorInFieldCalibration: color buffer not valid for algorithm: Lux level too low (%d < %ld)";
              v13 = 18;
              goto LABEL_13;
            }
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
              goto LABEL_14;
            v16 = objc_msgSend(v8, "intValue");
            v21 = 67109376;
            v22 = v16;
            v23 = 2048;
            v24 = v5;
            v17 = MEMORY[0x24BDACB70];
            v18 = "ADPearlColorInFieldCalibration: color buffer not valid for algorithm: Lux level too low (%d < %ld)";
            v19 = 18;
LABEL_32:
            _os_log_debug_impl(&dword_20B62B000, v17, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v21, v19);
            goto LABEL_14;
          }
          if (objc_msgSend(v6, "intValue"))
          {
            v10 = 1;
            goto LABEL_15;
          }
          if (!ADDebugUtilsADVerboseLogsEnabled)
          {
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
              goto LABEL_14;
            LOWORD(v21) = 0;
            v17 = MEMORY[0x24BDACB70];
            v18 = "ADPearlColorInFieldCalibration: color buffer not valid for algorithm: AE not stable";
            v19 = 2;
            goto LABEL_32;
          }
          v10 = 0;
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_15;
          LOWORD(v21) = 0;
          v11 = MEMORY[0x24BDACB70];
          v12 = "ADPearlColorInFieldCalibration: color buffer not valid for algorithm: AE not stable";
LABEL_12:
          v13 = 2;
LABEL_13:
          _os_log_impl(&dword_20B62B000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v21, v13);
LABEL_14:
          v10 = 0;
          goto LABEL_15;
        }
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        v20 = objc_msgSend(v8, "intValue");
        v21 = 67109120;
        v22 = v20;
        _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "ADPearlColorInfieldCalibration: Lux level: %d", (uint8_t *)&v21, 8u);
      }
      goto LABEL_19;
    }
    v10 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      v11 = MEMORY[0x24BDACB70];
      v12 = "ADPearlColorInFieldCalibration: color buffer not valid for algorithm: Lux level unknown";
      goto LABEL_12;
    }
  }
  else
  {
    v10 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      v11 = MEMORY[0x24BDACB70];
      v12 = "ADPearlColorInFieldCalibration: color buffer not valid for algorithm: AE stable unknown";
      goto LABEL_12;
    }
  }
LABEL_15:

  return v10;
}

@end
