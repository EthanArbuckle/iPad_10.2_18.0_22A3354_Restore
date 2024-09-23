id _ISPrepareISIconSignpostLog()
{
  if (_ISPrepareISIconSignpostLog_onceToken != -1)
    dispatch_once(&_ISPrepareISIconSignpostLog_onceToken, &__block_literal_global_7);
  return (id)_ISPrepareISIconSignpostLog_log;
}

void sub_1AA92BD4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AA92C224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);

  _Unwind_Resume(a1);
}

id _ISDefaultLog()
{
  if (_ISDefaultLog_onceToken != -1)
    dispatch_once(&_ISDefaultLog_onceToken, &__block_literal_global_31);
  return (id)_ISDefaultLog_log;
}

uint64_t NodeStructGetDataSize(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *(unsigned int *)(result + 4);
    if (v1 >= 0x24)
      return v1 - 36;
    else
      return 0;
  }
  return result;
}

id _ISTraceLog()
{
  if (_ISTraceLog_onceToken != -1)
    dispatch_once(&_ISTraceLog_onceToken, &__block_literal_global_5);
  return (id)_ISTraceLog_log;
}

uint64_t _ISIconDataForResourceProxy(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "__IS_iconDataForVariant:withOptions:", a2, a3);
}

void sub_1AA92F858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1AA92F994(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1AA92FBEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1AA92FD68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1AA93017C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AA9311DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1AA93156C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AA932008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

BOOL _ISGenerateInProcess(void *a1)
{
  id v1;
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  unint64_t v10;
  char *v11;
  BOOL v12;
  const char **v13;
  uint8_t v15[16];

  v1 = a1;
  _ISURLCacheLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, v1);

  if (v3)
  {
    _ISURLCacheLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_enabled(v4);

    if (v5)
    {
      _ISURLCacheLog();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v3 != -1 && os_signpost_enabled(v6))
      {
        *(_WORD *)v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_1AA928000, v7, OS_SIGNPOST_EVENT, v3, "fileSystemRepresentation", "dealing with backup placeholder", v15, 2u);
      }

    }
  }
  v8 = objc_retainAutorelease(v1);
  v9 = (const char *)objc_msgSend(v8, "fileSystemRepresentation");
  if (v9)
  {
    v10 = 0;
    v11 = (char *)&v9[8 * (strncmp(v9, "/private", 8uLL) == 0)];
    v12 = 1;
    v13 = (const char **)off_1E5800870;
    do
    {
      if (!strncmp(v11, *(v13 - 2), (size_t)*(v13 - 1)) && strstr(v11, *v13))
        break;
      v12 = v10 < 4;
      v13 += 3;
      ++v10;
    }
    while (v10 != 5);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t KeyFromUUID(_QWORD *a1)
{
  return a1[1] ^ *a1;
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_9()
{
  void *v0;

  return objc_msgSend(v0, "length");
}

void sub_1AA93BD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AA93BF64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1AA93C444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AA93C584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

float computeSampleAndLuma(uint64_t a1, int a2, int a3, float32x4_t *a4, _DWORD *a5, float *a6, _DWORD *a7, uint8x8_t a8, int8x16_t a9, int8x16_t a10)
{
  int32x2_t v14;
  float32x4_t v15;
  float v16;
  double v17;
  float32x4_t v19;
  float v20;

  a8.i32[0] = *(_DWORD *)(a1 + 4 * a2);
  v14 = (int32x2_t)vmovl_u8(a8).u64[0];
  *(float *)a9.i32 = (float)v14.u16[0];
  a10.i32[0] = v14.u16[1];
  a10.i32[1] = v14.u16[2];
  *(float32x2_t *)a10.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)a10.i8, (int8x8_t)0xFF000000FFLL));
  v15 = vdivq_f32((float32x4_t)vextq_s8(vextq_s8(a9, a9, 4uLL), a10, 0xCuLL), (float32x4_t)vdupq_n_s32(0x437F0000u));
  if (a3 == 3)
  {
    v16 = (float)v14.u16[3] / 255.0;
LABEL_7:
    v20 = v16;
    goto LABEL_8;
  }
  if (a3 != 1)
  {
    v16 = 1.0;
    goto LABEL_7;
  }
  *(float *)v14.i32 = (float)v14.u16[3] / 255.0;
  v20 = *(float *)v14.i32;
  if (*(float *)v14.i32 > 0.0)
    v15 = vdivq_f32(v15, (float32x4_t)vdupq_lane_s32(v14, 0));
LABEL_8:
  v19 = v15;
  v17 = ISSegmentationMathUtils_luma(v15);
  if (a4)
    *a4 = v19;
  if (a6)
    *a6 = v20;
  if (a5)
    *a5 = LODWORD(v17);
  if (a7)
  {
    *(float *)&v17 = (float)(v20 * (float)(*(float *)&v17 + -0.0784)) + 0.0784;
    *a7 = LODWORD(v17);
  }
  return *(float *)&v17;
}

BOOL shouldGenerateDark_singleForegroundColor_singleBackgroundColor(int a1, int32x4_t *a2, float32x4_t a3, float32x4_t a4)
{
  float32x4_t v7;
  float32x4_t v13;
  float32x4_t v14;
  _BOOL4 v15;
  float32x4_t v16;
  float32x4_t v18;
  float32x4_t v19;
  _BOOL4 v20;
  char v21;
  float32x4_t v22;
  int32x4_t v23;
  __n128 v25;

  v7 = vmulq_f32(a3, a3);
  if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0]) <= 0.235294118)
  {
    v15 = 1;
  }
  else
  {
    __asm { FMOV            V1.4S, #-1.0 }
    v13 = vaddq_f32(a3, _Q1);
    v14 = vmulq_f32(v13, v13);
    v15 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).f32[0]) <= 0.235294118;
  }
  v16 = vmulq_f32(a4, a4);
  v25 = (__n128)a4;
  if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1))).f32[0]) <= 0.235294118)
  {
    v20 = 0;
  }
  else
  {
    __asm { FMOV            V1.4S, #-1.0 }
    v18 = vaddq_f32(a4, _Q1);
    v19 = vmulq_f32(v18, v18);
    v20 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0]) > 0.235294118;
  }
  v21 = ISSegmentationMathUtils_contrastRatio((__n128)a3, (__n128)vdupq_n_s32(0x3DA0902Eu)) < 3.0 || v20;
  if (!a1)
  {
    if ((v21 & 1) != 0)
    {
      if (!v15 || ISSegmentationMathUtils_contrastRatio(v25, (__n128)vdupq_n_s32(0x3DA0902Eu)) < 3.0)
        return 0;
      v22 = (float32x4_t)v25;
      if (!a2)
        return 1;
    }
    else
    {
      if (!a2)
        return 1;
      v22 = a3;
    }
    *a2 = (int32x4_t)v22;
    return 1;
  }
  if ((v21 & 1) == 0)
  {
    v23 = (int32x4_t)a3;
LABEL_23:
    lightenColorOverDarkBackground(a2, v23);
    return 1;
  }
  if (v15)
  {
    if (ISSegmentationMathUtils_contrastRatio(v25, (__n128)vdupq_n_s32(0x3DA0902Eu)) < 3.0)
      return ((lightenColorOverDarkBackground(a2, (int32x4_t)a3) ^ 1 | v20) & 1) == 0
          || (lightenColorOverDarkBackground(a2, (int32x4_t)v25) & 1) != 0;
    v23 = (int32x4_t)v25;
    goto LABEL_23;
  }
  return ((lightenColorOverDarkBackground(a2, (int32x4_t)a3) ^ 1 | v20) & 1) == 0;
}

BOOL computeMask_foregroundMultipleColors_backgroundSingleColor(uint64_t a1, uint64_t a2, unsigned int a3, float32x4_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, float32x4_t *a8, float32x4_t a9, uint64_t a10)
{
  float v10;
  unint64_t v15;
  unsigned int v16;
  uint64_t v17;
  float32x4_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  float32x4_t v25;
  int32x4_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x4_t v29;
  float v30;
  float32x4_t v31;
  float32x4_t v32;
  int32x4_t v33;
  float32x2_t v34;
  float32x2_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  void *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t RatioAndAlpha;
  unint64_t v51;
  float32x4_t *v52;
  float v53;
  float v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v61;
  float32x4_t v62;
  uint64_t v63;
  uint64_t v64;
  float32x4_t v65;
  unint64_t v66;
  float32x4_t v67;
  float32x2_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unsigned __int8 *v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  size_t v89;
  _DWORD *v90;
  int8x16_t v91;
  int8x16_t v92;
  int8x16_t v93;
  float32x4_t v94;
  _BOOL4 v95;
  uint64_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  int v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  float32x4_t v110;
  float32x4_t v111;
  uint64_t v112;
  _DWORD *v113;
  float32x4_t *v114;
  uint64_t v115;
  uint64_t v116;
  BOOL v117;
  unint64_t v118;
  _DWORD *v119;
  float32x4_t *v120;
  float32x4_t v122;
  float32x4_t v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  unint64_t v130;
  float32x4_t *v131;
  float32x4_t v133;
  float32x4_t v134;
  float32x4_t v135;
  float32x4_t v136;
  float32x4_t v137;
  float32x4_t v138;
  float32x4_t v139;
  unint64_t v141;
  float32x4_t *v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  char v147;
  uint64_t v148;
  int8x16_t v149;
  float32x4_t *v150;
  uint64_t v151;
  int8x16_t v152;
  uint64_t v153;
  unint64_t v154;
  float32x4_t *v155;
  float32x4_t v156;
  float32x4_t v157;
  float32x4_t v158;
  float32x4_t v159;
  float32x4_t v160;
  float32x4_t v161;
  float32x4_t v162;
  int8x16_t v163;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  float32x4_t v169;
  float32x4_t v170;
  float32x4_t v171;
  float v172;
  void *v173;
  uint64_t v174;
  size_t v175;
  _BYTE *v176;
  float32x4_t v177;
  int8x16_t v178;
  uint64_t v179;
  float32x4_t v180;
  int v181;
  int v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  int v187;
  uint16x8_t v188;
  float v189;
  float32x4_t v190;
  float32x4_t v191;
  uint64_t v192;
  int v193;
  int v194;
  float32x4_t v195;
  float32x4_t v196;
  float32x4_t v197;
  float32x4_t v198;
  _BOOL4 v199;
  BOOL v201;
  uint64_t v202;
  BOOL v203;
  BOOL v207;
  BOOL v211;
  int v212;
  float32x4_t v214;
  float32x4_t v215;
  float32x4_t v216;
  float32x4_t v217;
  float32x4_t v218;
  _BYTE v220[4];
  int v221;
  uint64_t v222;
  _BOOL4 v223;
  uint64_t v224;
  int v225;
  _BOOL4 v226;
  uint64_t v227;
  int v228;
  uint64_t v229;
  float32x4_t *v230;
  _BOOL4 v231;
  int v232;
  uint64_t v233;
  uint64_t v234;
  int v235;
  uint64_t v236;
  float32x4_t v237;
  int v238;
  unsigned int v239;
  uint64_t v240;
  float v241;
  float v242;
  float v243;
  float32x4_t *v244;
  uint64_t v245;
  uint64_t v246;
  _BYTE *v247;
  uint64_t v248;
  id v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  int v254;
  _BOOL4 v255;
  uint64_t v256;
  uint64_t v257;
  unint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  float32x4_t v264;
  float32x4_t v265;
  float32x4_t v266;
  float32x4_t v267;
  float32x4_t v268;
  float32x4_t v269;
  float32x4_t v270;
  float32x4_t v271;
  float32x4_t v272;
  float32x4_t v273;
  int8x16_t v274;
  int8x16_t v275;
  int8x16_t v276;
  _QWORD v277[2];

  v244 = a8;
  v262 = a7;
  v237 = a9;
  v240 = a2;
  v277[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v246 = v19;
  v248 = v20;
  v260 = v21;
  v271 = v18;
  v239 = v16;
  v247 = &v220[-v17];
  if ((int)v19 < 1)
  {
    v40 = (void *)objc_opt_new();
  }
  else
  {
    v22 = 0;
    do
    {
      v23 = 0;
      v24 = 0;
      v25 = vsubq_f32(a4[v22], v18);
      v26 = (int32x4_t)vmulq_f32(v25, v25);
      v26.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v26, 2), vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v26.i8, 1))).u32[0];
      v27 = vrsqrte_f32((float32x2_t)v26.u32[0]);
      v28 = vmul_f32(v27, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v27, v27)));
      v29 = vmulq_n_f32(v25, vmul_f32(v28, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v28, v28))).f32[0]);
      v30 = 0.0;
      do
      {
        v31 = a4[v23];
        v32 = vsubq_f32(v31, v18);
        v33 = (int32x4_t)vmulq_f32(v32, v32);
        v33.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v33, 2), vadd_f32(*(float32x2_t *)v33.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v33.i8, 1))).u32[0];
        v34 = vrsqrte_f32((float32x2_t)v33.u32[0]);
        v35 = vmul_f32(v34, vrsqrts_f32((float32x2_t)v33.u32[0], vmul_f32(v34, v34)));
        v36 = vmulq_f32(v29, vmulq_n_f32(v32, vmul_f32(v35, vrsqrts_f32((float32x2_t)v33.u32[0], vmul_f32(v35, v35))).f32[0]));
        if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).f32[0] > 0.9)
        {
          v37 = vsubq_f32(v18, v31);
          v38 = vmulq_f32(v37, v37);
          v39 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).f32[0]);
          if (v39 > v30)
          {
            v24 = v23;
            v30 = v39;
          }
        }
        ++v23;
      }
      while (v15 != v23);
      *(_DWORD *)&v220[4 * v22++ - v17] = v24;
    }
    while (v22 != v15);
    v40 = (void *)objc_opt_new();
    if ((int)v246 >= 1)
    {
      v249 = v40;
      v41 = 0;
      v42 = 1;
      v43 = v247;
      v44 = v40;
      do
      {
        v45 = v41 + 1;
        if (v41 + 1 < v15)
        {
          v46 = *(_DWORD *)&v43[4 * v41];
          v47 = v42;
          do
          {
            if (v46 == *(_DWORD *)&v43[4 * v47])
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v41);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v48);

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v47);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v49);

              v43 = v247;
              a6 = v248;
            }
            ++v47;
          }
          while (v15 != v47);
        }
        ++v42;
        ++v41;
      }
      while (v45 != v15);
      RatioAndAlpha = objc_msgSend(v249, "count");
      v233 = RatioAndAlpha;
      v51 = v15;
      v52 = a4;
      v53 = 0.0;
      v54 = 1.0;
      do
      {
        v55 = *v52++;
        v56 = vmulq_f32(v55, v237);
        v56.f32[0] = fminf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v56, 2), vaddq_f32(v56, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v56.f32, 1))).f32[0], 0.0), 1.0);
        v54 = fminf(v54, v56.f32[0]);
        v53 = fmaxf(v53, v56.f32[0]);
        --v51;
      }
      while (v51);
      a5 = v260;
      v57 = v271;
      a1 = v239;
      goto LABEL_22;
    }
  }
  v249 = v40;
  RatioAndAlpha = objc_msgSend(v40, "count");
  v233 = RatioAndAlpha;
  v53 = 0.0;
  v54 = 1.0;
  v57 = v271;
LABEL_22:
  if ((int)v246 <= 2)
    goto LABEL_25;
  __asm { FMOV            V0.4S, #-1.0 }
  v61 = vaddq_f32(v57, _Q0);
  v62 = vmulq_f32(v61, v61);
  if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v62, 2), vaddq_f32(v62, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v62.f32, 1))).f32[0]) >= 0.117647059)
  {
LABEL_25:
    v254 = 0;
  }
  else
  {
    RatioAndAlpha = computeIconSegmentationFlagForConnectedBackground(a1, v240, a6);
    v57 = v271;
    v254 = 1;
  }
  v221 = a1 - 1;
  if ((int)a1 < 1)
  {
    v223 = 1;
    goto LABEL_238;
  }
  v63 = 0;
  v223 = 0;
  v238 = 0;
  v64 = a10;
  v243 = v53 - fminf(v54, v53 + -0.00001);
  v65.f32[0] = 1.0 - (float)(v243 * fminf(0.5 / v243, 1.6));
  v232 = (int)v240 * (int)a1 / 2500;
  v231 = v233 != 0;
  v228 = v240 - 1;
  v242 = fmaxf(v65.f32[0], 0.5);
  v241 = 1.0 - v242;
  v236 = 4 * v15;
  v66 = a1;
  v263 = (int)v246;
  v251 = (int)a1 / 60;
  v245 = (int)v240 - (int)a1 / 60;
  v253 = (int)v240;
  v250 = (int)a1 - (int)a1 / 60;
  v252 = v240;
  v230 = a4 + 1;
  v67 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  v266 = v67;
  v68 = (float32x2_t)vdup_n_s32(0x437F0000u);
  v256 = a10;
  v258 = a1;
  while (2)
  {
    if ((int)v63 <= 3)
      v69 = 3;
    else
      v69 = v63;
    if ((int)v63 <= 2)
      v70 = 2;
    else
      v70 = v63;
    if ((int)v240 < 1)
      goto LABEL_235;
    v71 = 0;
    v222 = v69 - 3;
    v229 = v70 - 2;
    v235 = v70 - 2;
    v72 = v63 + 2;
    if ((int)v63 + 2 >= v221)
      v72 = v221;
    v225 = v69 - 3;
    v73 = v63 + 3;
    if ((int)v63 + 3 >= v221)
      v73 = v221;
    v234 = v72;
    v224 = v73;
    v255 = 1;
    v261 = v63;
    while (1)
    {
      v74 = (int)v71 <= 3 ? 3 : v71;
      v257 = v74;
      v75 = (int)v71 <= 2 ? 2 : v71;
      v76 = v63 + v71 * v66;
      v77 = (unsigned __int8 *)(a5 + 4 * v76);
      v78 = *v77;
      v79 = v77[1];
      LOBYTE(v10) = v77[2];
      v80 = *(unsigned __int8 *)(a6 + v76);
      if (v254)
      {
        v81 = a1;
        v82 = a1;
        v83 = v76;
        v84 = v71;
        RatioAndAlpha = testEyeFeature(v81, v240, v261, v71, v260, a6, v67, v65.f32[0]);
        v71 = v84;
        v76 = v83;
        a1 = v82;
        v64 = v256;
        v63 = v261;
        v57 = v271;
        if ((RatioAndAlpha & 1) != 0)
          break;
      }
      *(float32x2_t *)v67.f32 = vcvt_f32_u32((uint32x2_t)__PAIR64__(v79, v78));
      v67.f32[2] = (float)LODWORD(v10);
      v67 = vdivq_f32(v67, v266);
      v85 = vsubq_f32(v67, v57);
      v86 = vmulq_f32(v85, v85);
      if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v86, 2), vaddq_f32(v86, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v86.f32, 1))).f32[0]) >= 0.00784313725)
      {
        v259 = v71;
        v88 = *a4;
        v66 = v258;
        v265 = *a4;
        v270 = v67;
        if ((int)v246 >= 2)
        {
          v264.i64[0] = (uint64_t)v220;
          MEMORY[0x1E0C80A78](RatioAndAlpha);
          v90 = &v220[-((v89 + 15) & 0x7FFFFFFF0)];
          bzero(v90, v89);
          v95 = (~v80 & 9) != 0 && v231;
          v96 = v234;
          if (v235 <= (int)v234)
          {
            v102 = 0;
            v103 = v228;
            if ((int)v259 + 2 < v228)
              v103 = v259 + 2;
            v104 = v229;
            v105 = v260;
            v97 = v271;
            RatioAndAlpha = (uint64_t)&off_1AA972000;
            v87 = v265;
            v98 = v270;
            do
            {
              v106 = v75 - 2;
              if ((int)v75 - 2 <= v103)
              {
                do
                {
                  v107 = v104 + v106 * v66;
                  if ((~*(unsigned __int8 *)(a6 + v107) & 3) == 0)
                  {
                    v108 = 0;
                    v109 = 0;
                    v67.i32[0] = *(_DWORD *)(v105 + 4 * v107);
                    v67 = (float32x4_t)vmovl_u8(*(uint8x8_t *)v67.f32);
                    v65.f32[0] = (float)v67.u16[0];
                    v91.i32[0] = v67.u16[1];
                    v91.i32[1] = v67.u16[2];
                    v67.i32[0] = 2139095039;
                    *(float32x2_t *)v91.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v91.i8, (int8x8_t)0xFF000000FFLL));
                    v65 = vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v65, (int8x16_t)v65, 4uLL), v91, 0xCuLL), v266);
                    do
                    {
                      v110 = vsubq_f32(v65, a4[v108]);
                      v111 = vmulq_f32(v110, v110);
                      v91 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v111, 2), vaddq_f32(v111, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v111.f32, 1)));
                      *(float *)v91.i32 = sqrtf(*(float *)v91.i32);
                      if (*(float *)v91.i32 < v67.f32[0])
                      {
                        v67.f32[0] = *(float *)v91.i32;
                        v109 = v108;
                      }
                      ++v108;
                    }
                    while (v15 != v108);
                    *(double *)v67.i64 = v67.f32[0];
                    v65.i64[0] = 0x3FA4141414141414;
                    if (*(double *)v67.i64 <= 0.0392156863)
                    {
                      ++v90[v109];
                      ++v102;
                    }
                  }
                  v117 = v106++ < v103;
                }
                while (v117);
              }
              v117 = v104++ < v96;
            }
            while (v117);
            if (v102 <= 0)
            {
              v91.i32[0] = 2139095039;
              a1 = v239;
            }
            else
            {
              v226 = v95;
              v227 = v76;
              v112 = 0;
              v65 = *a4;
              v113 = v90 + 1;
              v92.i32[0] = 2139095039;
              v67 = vsubq_f32(v98, v97);
              v267 = v67;
              v114 = v230;
              v115 = 1;
              v93 = (int8x16_t)v65;
              v94.i32[0] = 2139095039;
              do
              {
                v116 = v112 + 1;
                if (v90[v112])
                  v117 = v116 < v263;
                else
                  v117 = 0;
                if (v117)
                {
                  v269 = a4[v112];
                  v67 = vsubq_f32(v269, v97);
                  v268 = v67;
                  v118 = v15;
                  v119 = v113;
                  v120 = v114;
                  do
                  {
                    if (*v119++)
                    {
                      v272 = *v120;
                      v277[0] = 0;
                      v276 = (int8x16_t)v65;
                      v274 = v93;
                      v275 = v92;
                      v273 = v94;
                      RatioAndAlpha = (uint64_t)getRatioAndAlpha((unsigned __int32 *)v277 + 1, (float *)v277, v267, v268, vsubq_f32(v272, v97));
                      v94 = v273;
                      v98 = v270;
                      v87 = v265;
                      v97 = v271;
                      v122 = vmlaq_n_f32(v269, vsubq_f32(v272, v269), fminf(fmaxf(*((float *)v277 + 1), 0.0), 1.0));
                      v123 = vsubq_f32(v270, v122);
                      v124 = vmulq_f32(v123, v123);
                      v125 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v124, 2), vaddq_f32(v124, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v124.f32, 1)));
                      v92 = v275;
                      v125.f32[0] = sqrtf(v125.f32[0]);
                      v93 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v273, v125), 0), (int8x16_t)v122, v274);
                      v126 = vsubq_f32(v270, vmlaq_n_f32(v271, vsubq_f32(v122, v271), fminf(fmaxf(*(float *)v277, 0.0), 1.0)));
                      v127 = vmulq_f32(v126, v126);
                      v128 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v127.f32, 1);
                      if (v125.f32[0] < v273.f32[0])
                        v94.f32[0] = v125.f32[0];
                      v67 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v127, 2), vaddq_f32(v127, v128));
                      v67.f32[0] = sqrtf(v67.f32[0]);
                      v91 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32((float32x4_t)v275, v67), 0), (int8x16_t)v122, v276);
                      v276 = v91;
                      v65 = (float32x4_t)v91;
                      if (v67.f32[0] < *(float *)v275.i32)
                        *(float *)v92.i32 = v67.f32[0];
                    }
                    ++v120;
                    --v118;
                  }
                  while (v115 != v118);
                }
                ++v115;
                ++v114;
                ++v113;
                v112 = v116;
              }
              while (v116 != v15);
              if (v94.f32[0] == 3.4028e38 && *(float *)v92.i32 == 3.4028e38)
              {
                v92.i32[0] = 2139095039;
                v130 = v15;
                v131 = a4;
                v94.i32[0] = 2139095039;
                a6 = v248;
                v66 = v258;
                v76 = v227;
                v95 = v226;
                do
                {
                  if (*v90++)
                  {
                    v272 = *v131;
                    v273 = v94;
                    v275 = v92;
                    v276 = (int8x16_t)v65;
                    v274 = v93;
                    *(double *)v133.i64 = ISSegmentationMathUtils_clampedProject(v98, v97, v272);
                    v94 = v273;
                    v92 = v275;
                    v98 = v270;
                    v87 = v265;
                    v97 = v271;
                    v134 = vsubq_f32(v270, v272);
                    v135 = vmulq_f32(v134, v134);
                    v136 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v135, 2), vaddq_f32(v135, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v135.f32, 1)));
                    v136.f32[0] = sqrtf(v136.f32[0]);
                    v93 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v273, v136), 0), (int8x16_t)v272, v274);
                    v137 = vsubq_f32(v270, v133);
                    v138 = vmulq_f32(v137, v137);
                    v139 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v138.f32, 1);
                    if (v136.f32[0] < v273.f32[0])
                      v94.f32[0] = v136.f32[0];
                    v67 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v138, 2), vaddq_f32(v138, v139));
                    v67.f32[0] = sqrtf(v67.f32[0]);
                    v91 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32((float32x4_t)v275, v67), 0), (int8x16_t)v272, v276);
                    v276 = v91;
                    v65 = (float32x4_t)v91;
                    if (v67.f32[0] < *(float *)v275.i32)
                      *(float *)v92.i32 = v67.f32[0];
                  }
                  ++v131;
                  --v130;
                }
                while (v130);
              }
              else
              {
                a6 = v248;
                v66 = v258;
                v76 = v227;
                v95 = v226;
              }
              v91.i32[0] = 2139095039;
              _NF = v94.f32[0] < 3.4028e38 && *(float *)v92.i32 < 3.4028e38;
              a1 = v239;
              if (_NF)
              {
                if (v94.f32[0] <= 0.13725)
                {
                  v87 = (float32x4_t)v93;
                  v91.i32[0] = v94.i32[0];
                }
                else
                {
                  v87 = v65;
                  v91.i32[0] = v92.i32[0];
                }
              }
            }
          }
          else
          {
            v91.i32[0] = 2139095039;
            v97 = v271;
            a1 = v239;
            v87 = v265;
            v98 = v270;
          }
          if (!v233 && *(float *)v91.i32 > 0.039216)
          {
            v141 = v15;
            v142 = a4;
            do
            {
              v264 = (float32x4_t)v91;
              v265 = v87;
              v143 = *v142++;
              v276 = (int8x16_t)v143;
              *(double *)v144.i64 = ISSegmentationMathUtils_clampedProject(v98, v97, v143);
              v91 = (int8x16_t)v264;
              v98 = v270;
              v97 = v271;
              v145 = vsubq_f32(v270, v144);
              v146 = vmulq_f32(v145, v145);
              v67 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v146, 2), vaddq_f32(v146, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v146.f32, 1)));
              v67.f32[0] = sqrtf(v67.f32[0]);
              v65 = (float32x4_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v264, v67), 0);
              v87 = (float32x4_t)vbslq_s8((int8x16_t)v65, v276, (int8x16_t)v265);
              if (v67.f32[0] < v264.f32[0])
                *(float *)v91.i32 = v67.f32[0];
              --v141;
            }
            while (v141);
          }
          v147 = *(float *)v91.i32 <= 0.039216 || v95;
          if ((v147 & 1) != 0)
          {
            a5 = v260;
            v63 = v261;
            v64 = v256;
          }
          else
          {
            v264 = (float32x4_t)v91;
            v265 = v87;
            v148 = 0;
            v149 = *(int8x16_t *)a4;
            v93.i32[0] = 2139095039;
            v67 = vsubq_f32(v98, v97);
            v150 = v230;
            v151 = 1;
            v152 = *(int8x16_t *)a4;
            v94.i32[0] = 2139095039;
            v267 = v67;
            do
            {
              v153 = v148 + 1;
              if (v148 + 1 < v263)
              {
                v269 = a4[v148];
                v268 = vsubq_f32(v269, v97);
                v154 = v15;
                v155 = v150;
                do
                {
                  v274 = v93;
                  v275 = v152;
                  v276 = v149;
                  v156 = *v155++;
                  v272 = v156;
                  v273 = v94;
                  v277[0] = 0;
                  RatioAndAlpha = (uint64_t)getRatioAndAlpha((unsigned __int32 *)v277 + 1, (float *)v277, v267, v268, vsubq_f32(v156, v97));
                  v94 = v273;
                  v93 = v274;
                  v98 = v270;
                  v97 = v271;
                  v157 = vmlaq_n_f32(v269, vsubq_f32(v272, v269), fminf(fmaxf(*((float *)v277 + 1), 0.0), 1.0));
                  v158 = vsubq_f32(v270, v157);
                  v159 = vmulq_f32(v158, v158);
                  v160 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v159, 2), vaddq_f32(v159, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v159.f32, 1)));
                  v160.f32[0] = sqrtf(v160.f32[0]);
                  v161 = vsubq_f32(v270, vmlaq_n_f32(v271, vsubq_f32(v157, v271), fminf(fmaxf(*(float *)v277, 0.0), 1.0)));
                  v162 = vmulq_f32(v161, v161);
                  v65 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v162, 2), vaddq_f32(v162, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v162.f32, 1)));
                  v65.f32[0] = sqrtf(v65.f32[0]);
                  v163 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32((float32x4_t)v274, v65), 0);
                  v275 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v273, v160), 0), (int8x16_t)v157, v275);
                  if (v160.f32[0] < v273.f32[0])
                    v94.f32[0] = v160.f32[0];
                  v152 = v275;
                  v67 = (float32x4_t)vbslq_s8(v163, (int8x16_t)v157, v276);
                  v276 = (int8x16_t)v67;
                  v149 = (int8x16_t)v67;
                  if (v65.f32[0] < *(float *)v274.i32)
                    *(float *)v93.i32 = v65.f32[0];
                  --v154;
                }
                while (v151 != v154);
              }
              ++v151;
              ++v150;
              v148 = v153;
            }
            while (v153 != v15);
            if (v94.f32[0] < 3.4028e38 && *(float *)v93.i32 < 3.4028e38)
            {
              a5 = v260;
              a1 = v239;
              v63 = v261;
              v64 = v256;
              v66 = v258;
              v87 = v265;
              v91 = (int8x16_t)v264;
              if (v94.f32[0] <= 0.13725)
              {
                if (v94.f32[0] < v264.f32[0])
                {
                  v87 = (float32x4_t)v152;
                  v91.i32[0] = v94.i32[0];
                }
              }
              else if (*(float *)v93.i32 < v264.f32[0])
              {
                v87 = (float32x4_t)v149;
                v91.i32[0] = v93.i32[0];
              }
            }
            else
            {
              a5 = v260;
              a1 = v239;
              v63 = v261;
              v64 = v256;
              v66 = v258;
              v87 = v265;
              v91 = (int8x16_t)v264;
            }
          }
          if (*(float *)v91.i32 > 0.039216 && v95)
          {
            v264 = (float32x4_t)v91;
            v265 = v87;
            v166 = 0;
            LODWORD(v167) = 0;
            v168 = v257 - 3;
            v10 = 3.4028e38;
            do
            {
              *(double *)v169.i64 = ISSegmentationMathUtils_clampedProject(v98, v271, a4[v166]);
              v98 = v270;
              v170 = vsubq_f32(v270, v169);
              v171 = vmulq_f32(v170, v170);
              v172 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v171, 2), vaddq_f32(v171, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v171.f32, 1))).f32[0]);
              if (v172 >= v10)
              {
                v167 = v167;
              }
              else
              {
                v10 = v172;
                v167 = v166;
              }
              ++v166;
            }
            while (v15 != v166);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v167);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            v276.i32[0] = objc_msgSend(v249, "containsObject:", v173);

            if ((v276.i8[0] & 1) != 0)
            {
              v276.i64[0] = (uint64_t)v220;
              MEMORY[0x1E0C80A78](v174);
              v176 = &v220[-((v175 + 15) & 0x7FFFFFFF0)];
              bzero(v176, v175);
              v179 = v224;
              v180 = v270;
              if (v225 <= (int)v224)
              {
                v181 = v228;
                if ((int)v259 + 3 < v228)
                  v181 = v259 + 3;
                v182 = v257 - 3;
                v183 = v222;
                do
                {
                  v184 = v168;
                  if (v182 <= v181)
                  {
                    do
                    {
                      v185 = v183 + v184 * v66;
                      if ((~*(unsigned __int8 *)(a6 + v185) & 3) == 0)
                      {
                        v186 = 0;
                        v187 = 0;
                        v177.i32[0] = *(_DWORD *)(a5 + 4 * v185);
                        v188 = vmovl_u8(*(uint8x8_t *)v177.f32);
                        v177.f32[0] = (float)v188.u16[0];
                        v178.i32[0] = v188.u16[1];
                        v178.i32[1] = v188.u16[2];
                        v189 = 3.4028e38;
                        *(float32x2_t *)v178.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)v178.i8, (int8x8_t)0xFF000000FFLL));
                        v177 = vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v177, (int8x16_t)v177, 4uLL), v178, 0xCuLL), v266);
                        do
                        {
                          v190 = vsubq_f32(v177, a4[v186]);
                          v191 = vmulq_f32(v190, v190);
                          v178 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v191, 2), vaddq_f32(v191, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v191.f32, 1)));
                          *(float *)v178.i32 = sqrtf(*(float *)v178.i32);
                          if (*(float *)v178.i32 < v189)
                          {
                            v189 = *(float *)v178.i32;
                            v187 = v186;
                          }
                          ++v186;
                        }
                        while (v15 != v186);
                        v177.i32[1] = 1067717652;
                        if (v189 <= 0.0392156863)
                          ++*(_DWORD *)&v176[4 * v187];
                      }
                      v117 = v184++ < v181;
                    }
                    while (v117);
                  }
                  v117 = v183++ < v179;
                }
                while (v117);
              }
              v192 = 0;
              v193 = *(_DWORD *)&v176[4 * (int)v167];
              v194 = v167;
              v195 = v271;
              do
              {
                if (*(_DWORD *)&v247[4 * v192] == *(_DWORD *)&v247[4 * (int)v167] && *(_DWORD *)&v176[4 * v192] > v193)
                {
                  v193 = *(_DWORD *)&v176[4 * v192];
                  v194 = v192;
                }
                ++v192;
              }
              while (v15 != v192);
              if (v194 >= 0)
                LODWORD(v167) = v194;
            }
            else
            {
              v195 = v271;
              v180 = v270;
            }
            v276 = (int8x16_t)a4[(int)v167];
            *(double *)v196.i64 = ISSegmentationMathUtils_clampedProject(v180, v195, (float32x4_t)v276);
            v98 = v270;
            v197 = vsubq_f32(v270, v196);
            v198 = vmulq_f32(v197, v197);
            v67 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v198, 2), vaddq_f32(v198, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v198.f32, 1)));
            v67.f32[0] = sqrtf(v67.f32[0]);
            v91.i32[0] = v264.i32[0];
            v65 = (float32x4_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v264, v67), 0);
            v87 = (float32x4_t)vbslq_s8((int8x16_t)v65, v276, (int8x16_t)v265);
            if (v67.f32[0] < v264.f32[0])
              *(float *)v91.i32 = v67.f32[0];
            a1 = v239;
LABEL_172:
            v63 = v261;
            v64 = v256;
          }
          v199 = 0;
          if (v262)
          {
            v201 = *(float *)v91.i32 > 1.0 && v63 >= v251 && v63 < v250;
            v202 = v259;
            v203 = !v201 || v259 < v251;
            v57 = v271;
            if (!v203)
              v199 = (int)v246 > 1 && v259 < v245;
          }
          else
          {
            v57 = v271;
            v202 = v259;
          }
          v207 = v202 >= v245 || v202 < v251 || v63 >= v250 || v63 < v251;
          v67.i32[0] = 1047569367;
          if ((v207 || *(float *)v91.i32 <= 0.235 || v64 == 0) && !v199)
          {
            v71 = v259;
          }
          else
          {
            if (v64)
              v211 = v238 < v232;
            else
              v211 = 1;
            v212 = v211;
            if (v238++ >= 0 && v262 != 0)
              goto LABEL_234;
            v71 = v259;
            if (!v212)
              goto LABEL_234;
          }
          v214 = vmulq_f32(v87, v237);
          v215 = vsubq_f32(v87, v57);
          v65 = vmulq_f32(vsubq_f32(v98, v57), v215);
          v216 = vaddq_f32(v65, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v65.f32, 1));
          v217 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v65, 2);
          v65.f32[0] = fminf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v214, 2), vaddq_f32(v214, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v214.f32, 1))).f32[0], 0.0), 1.0);
          v218 = vmulq_f32(v215, v215);
          v67 = vdivq_f32(vaddq_f32(v217, v216), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v218, 2), vaddq_f32(v218, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v218.f32, 1))));
          v67.f32[0] = fminf(fmaxf(v67.f32[0], 0.0), 1.0);
          goto LABEL_224;
        }
        *(double *)v99.i64 = ISSegmentationMathUtils_clampedProject(v67, v57, v88);
        v98 = v270;
        v87 = v265;
        v100 = vsubq_f32(v270, v99);
        v101 = vmulq_f32(v100, v100);
        v67 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v101, 2), vaddq_f32(v101, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v101.f32, 1)));
        v65.i32[0] = 2139095039;
        *(float *)v91.i32 = fminf(sqrtf(v67.f32[0]), 3.4028e38);
        a5 = v260;
        goto LABEL_172;
      }
      v65.i32[0] = 0;
      v87 = 0uLL;
      v67.i32[0] = 0;
      a5 = v260;
      v66 = v258;
LABEL_224:
      if (v262)
      {
        v65.f32[0] = (float)(v67.f32[0]
                           * (float)(v242
                                   + (float)(fminf(fmaxf(1.0 - (float)((float)(v53 - v65.f32[0]) / v243), 0.0), 1.0)
                                           * v241)))
                   * 255.0;
        *(_BYTE *)(v262 + v76) = (int)v65.f32[0];
      }
      if (v64)
      {
        if (v244)
          v87 = *v244;
        *(float32x2_t *)v65.f32 = vmul_f32(*(float32x2_t *)v87.f32, v68);
        v65.i64[1] = COERCE_UNSIGNED_INT(vmuls_lane_f32(255.0, v87, 2)) | 0x437F000000000000;
        v67 = (float32x4_t)vcvtq_s32_f32(vmulq_n_f32(v65, v67.f32[0]));
        *(int16x4_t *)v67.f32 = vmovn_s32((int32x4_t)v67);
        *(int8x8_t *)v67.f32 = vmovn_s16((int16x8_t)v67);
        *(_DWORD *)(v64 + 4 * v76) = v67.i32[0];
      }
      v255 = ++v71 < v253;
      if (v71 == v252)
        goto LABEL_234;
    }
    a5 = v260;
    v66 = v258;
LABEL_234:
    if (!v255)
    {
LABEL_235:
      v223 = ++v63 >= v66;
      if (v63 == v66)
        break;
      continue;
    }
    break;
  }
LABEL_238:

  return v223;
}

uint64_t computeIconSegmentationFlagForExtraConfidence(uint64_t result, int a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v3 = result - 1;
  if ((int)result >= 1)
  {
    v4 = 0;
    v5 = result;
    do
    {
      if ((int)v4 <= 2)
        v6 = 2;
      else
        v6 = v4;
      if (a2 >= 1)
      {
        v7 = 0;
        v8 = v6 - 2;
        v9 = v6 - 2;
        v10 = v4 + 2;
        if ((int)v4 + 2 >= v3)
          v10 = v3;
        result = 4294967294;
        do
        {
          if ((int)v7 <= 2)
            v11 = 2;
          else
            v11 = v7;
          v12 = v4 + v7 * v5;
          if ((*(_BYTE *)(a3 + v12) & 2) != 0)
          {
            if (v9 > v10)
              goto LABEL_30;
            v13 = 0;
            v14 = 0;
            v15 = (int)v7 + 2 >= a2 - 1 ? a2 - 1 : v7 + 2;
            v16 = v8;
            do
            {
              if ((int)v11 - 2 <= v15)
              {
                v17 = v16 - v4;
                if ((int)v16 - (int)v4 < 0)
                  v17 = v4 - v16;
                v18 = a3 + v5 * (v11 - 2);
                v19 = v11;
                do
                {
                  v20 = result + v19;
                  if ((int)result + (int)v19 < 0)
                    v20 = -v20;
                  if ((v20 + v17) <= 2)
                  {
                    ++v14;
                    v13 += (*(unsigned __int8 *)(v18 + v16) >> 1) & 1;
                  }
                  v21 = v19 - 2;
                  ++v19;
                  v18 += v5;
                }
                while (v21 < v15);
              }
            }
            while (v16++ < v10);
            if (v13 == v14)
LABEL_30:
              *(_BYTE *)(a3 + v12) |= 8u;
          }
          ++v7;
          --result;
        }
        while (v7 != a2);
      }
      ++v4;
    }
    while (v4 != v5);
  }
  return result;
}

uint64_t computeIconSegmentationFlagForMoreConfidence(uint64_t result, int a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = result - 1;
  if ((int)result >= 1)
  {
    v4 = 0;
    v5 = result;
    do
    {
      if ((int)v4 <= 1)
        v6 = 1;
      else
        v6 = v4;
      if (a2 <= 0)
      {
        v10 = v4 + 1;
      }
      else
      {
        v7 = 0;
        v8 = v6 - 1;
        v9 = v6 - 1;
        v10 = v4 + 1;
        if ((int)v4 + 1 >= v3)
          v11 = v3;
        else
          v11 = v4 + 1;
        do
        {
          if ((int)v7 <= 1)
            v12 = 1;
          else
            v12 = v7;
          result = v4 + v7 * v5;
          ++v7;
          if ((*(_BYTE *)(a3 + result) & 2) != 0)
          {
            if (v9 > v11)
              goto LABEL_23;
            v13 = 0;
            v14 = 0;
            v15 = v12 - 2;
            v16 = a3 + v5 * (v12 - 1);
            v17 = (int)v7 >= a2 - 1 ? a2 - 1 : v7;
            v18 = v12 - 1;
            v19 = v8;
            do
            {
              v20 = v16;
              v21 = v15;
              if (v18 <= v17)
              {
                do
                {
                  ++v14;
                  v13 += (*(unsigned __int8 *)(v20 + v19) >> 1) & 1;
                  ++v21;
                  v20 += v5;
                }
                while (v21 < v17);
              }
            }
            while (v19++ < v11);
            if (v13 == v14)
LABEL_23:
              *(_BYTE *)(a3 + result) |= 4u;
          }
        }
        while (v7 != a2);
      }
      v4 = v10;
    }
    while (v10 != v5);
  }
  return result;
}

uint64_t computeIconSegmentationAdditionalGradientFlag(uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9, double a10, float32x4_t a11, int8x16_t a12, float32x4_t a13)
{
  int v13;
  uint64_t v14;
  int v15;
  double v16;
  uint64_t v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  int v30;
  int8x16_t v31;
  uint64_t v32;
  int8x8_t v33;
  int v34;
  int v35;
  uint64_t v36;
  unsigned __int32 *v37;
  uint64_t v38;
  unsigned __int32 *v39;
  uint64_t v40;
  int8x16_t v41;
  unsigned __int32 v42;
  float32x4_t v43;
  float32x4_t v44;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  int v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  int v94;
  int v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  uint64_t v101;

  v13 = result - 1;
  if ((int)result >= 1)
  {
    v14 = 0;
    v15 = a2 - 1;
    v16 = 0.196078431;
    if (a3)
      v16 = 0.0666666667;
    v17 = result;
    v18 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    v19 = (float32x4_t)vdupq_n_s32(0xC37F0000);
    v20 = 4 * result;
    do
    {
      if ((int)v14 <= 1)
        v21 = 1;
      else
        v21 = v14;
      if (a2 <= 0)
      {
        v24 = v14 + 1;
      }
      else
      {
        v22 = 0;
        v23 = v21 - 1;
        result = (v21 - 1);
        v24 = v14 + 1;
        if ((int)v14 + 1 >= v13)
          v25 = v13;
        else
          v25 = v14 + 1;
        v26 = a4 - 4 + 4 * v21;
        do
        {
          if ((int)v22 <= 1)
            v27 = 1;
          else
            v27 = v22;
          v28 = v14 + v22 * v17;
          if ((*(_BYTE *)(a5 + v28) & 1) != 0)
          {
            ++v22;
            if ((int)result <= v25)
            {
              v30 = 0;
              a11.i32[0] = *(_DWORD *)(a4 + 4 * v28);
              v31 = (int8x16_t)vmovl_u8(*(uint8x8_t *)a11.f32);
              *(float *)a12.i32 = (float)v31.u16[0];
              v32 = v27 - 1;
              v33.i32[0] = v31.u16[1];
              v33.i32[1] = v31.u16[2];
              *(float32x2_t *)v31.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v33, (int8x8_t)0xFF000000FFLL));
              a12 = vextq_s8(a12, a12, 4uLL);
              a11 = vdivq_f32((float32x4_t)vextq_s8(a12, v31, 0xCuLL), v18);
              if ((int)v22 >= v15)
                v34 = a2 - 1;
              else
                v34 = v22;
              v35 = v27 - 1;
              v36 = v27 - 2;
              v37 = (unsigned __int32 *)(v26 + v20 * v32);
              v38 = v23;
              do
              {
                v39 = v37;
                v40 = v36;
                if (v35 <= v34)
                {
                  do
                  {
                    a12.i32[0] = *v39;
                    v41 = (int8x16_t)vmovl_u8(*(uint8x8_t *)a12.i8);
                    v42 = v41.u16[1];
                    *(float *)v41.i32 = (float)v41.u16[0];
                    a13.i32[0] = v42;
                    a13.i32[1] = v41.u16[2];
                    *(float32x2_t *)a13.f32 = vcvt_f32_u32((uint32x2_t)vand_s8(*(int8x8_t *)a13.f32, (int8x8_t)0xFF000000FFLL));
                    v43 = vaddq_f32(a11, vdivq_f32((float32x4_t)vextq_s8(vextq_s8(v41, v41, 4uLL), (int8x16_t)a13, 0xCuLL), v19));
                    v44 = vmulq_f32(v43, v43);
                    a13 = vaddq_f32(v44, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v44.f32, 1));
                    a12 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v44, 2), a13);
                    *(double *)a12.i64 = sqrtf(*(float *)a12.i32);
                    if (v16 < *(double *)a12.i64)
                      ++v30;
                    ++v40;
                    v39 = (unsigned __int32 *)((char *)v39 + v20);
                  }
                  while (v40 < v34);
                }
                ++v37;
                v45 = v38++ < v25;
              }
              while (v45);
            }
            else
            {
              v30 = 0;
            }
            v29 = v30 > 0;
          }
          else
          {
            v29 = 0;
            ++v22;
          }
          *(_BYTE *)(a6 + v28) = v29;
        }
        while (v22 != a2);
      }
      v14 = v24;
    }
    while (v24 != v17);
    if (a3)
    {
      v46 = 0;
      while (1)
      {
        v47 = (int)v46 <= 1 ? 1 : v46;
        if (a2 > 0)
          break;
        v51 = v46 + 1;
LABEL_74:
        v46 = v51;
        if (v51 == v17)
        {
          v68 = 0;
          do
          {
            if ((int)v68 <= 1)
              v69 = 1;
            else
              v69 = v68;
            if (a2 <= 0)
            {
              v73 = v68 + 1;
            }
            else
            {
              v70 = 0;
              v71 = v69 - 1;
              v72 = v69 - 1;
              v73 = v68 + 1;
              if ((int)v68 + 1 >= v13)
                v74 = v13;
              else
                v74 = v68 + 1;
              do
              {
                if ((int)v70 <= 1)
                  v75 = 1;
                else
                  v75 = v70;
                result = v68 + v70 * v17;
                ++v70;
                if ((*(_BYTE *)(a6 + result) & 2) != 0)
                {
                  if (v72 > v74)
                    goto LABEL_96;
                  v76 = 0;
                  v77 = 0;
                  v78 = v75 - 2;
                  v79 = a6 + v17 * (v75 - 1);
                  v80 = (int)v70 >= v15 ? a2 - 1 : v70;
                  v81 = v75 - 1;
                  v82 = v71;
                  do
                  {
                    v83 = v79;
                    v84 = v78;
                    if (v81 <= v80)
                    {
                      do
                      {
                        ++v77;
                        v76 += (*(unsigned __int8 *)(v83 + v82) >> 1) & 1;
                        ++v84;
                        v83 += v17;
                      }
                      while (v84 < v80);
                    }
                    v45 = v82++ < v74;
                  }
                  while (v45);
                  if (v76 == v77)
LABEL_96:
                    *(_BYTE *)(a6 + result) |= 4u;
                }
              }
              while (v70 != a2);
            }
            v68 = v73;
          }
          while (v73 != v17);
          for (i = 0; i != v17; ++i)
          {
            if ((int)i <= 2)
              v86 = 2;
            else
              v86 = i;
            if (a2 >= 1)
            {
              v87 = 0;
              v88 = v86 - 2;
              v89 = v86 - 2;
              v90 = i + 2;
              if ((int)i + 2 >= v13)
                v90 = v13;
              result = 4294967294;
              do
              {
                if ((int)v87 <= 2)
                  v91 = 2;
                else
                  v91 = v87;
                v92 = i + v87 * v17;
                if ((*(_BYTE *)(a6 + v92) & 2) != 0)
                {
                  if (v89 > v90)
                    goto LABEL_129;
                  v93 = 0;
                  v94 = 0;
                  v95 = (int)v87 + 2 >= v15 ? a2 - 1 : v87 + 2;
                  v96 = v88;
                  do
                  {
                    if ((int)v91 - 2 <= v95)
                    {
                      v97 = v96 - i;
                      if ((int)v96 - (int)i < 0)
                        v97 = i - v96;
                      v98 = a6 + v17 * (v91 - 2);
                      v99 = v91;
                      do
                      {
                        v100 = result + v99;
                        if ((int)result + (int)v99 < 0)
                          v100 = -v100;
                        if ((v100 + v97) <= 2)
                        {
                          ++v94;
                          v93 += (*(unsigned __int8 *)(v98 + v96) >> 1) & 1;
                        }
                        v101 = v99 - 2;
                        ++v99;
                        v98 += v17;
                      }
                      while (v101 < v95);
                    }
                    v45 = v96++ < v90;
                  }
                  while (v45);
                  if (v93 == v94)
LABEL_129:
                    *(_BYTE *)(a6 + v92) |= 8u;
                }
                ++v87;
                --result;
              }
              while (v87 != a2);
            }
          }
          return result;
        }
      }
      v48 = 0;
      v49 = v47 - 1;
      v50 = v47 - 1;
      v51 = v46 + 1;
      if ((int)v46 + 1 >= v13)
        LODWORD(result) = v13;
      else
        LODWORD(result) = v46 + 1;
      result = (int)result;
      while (1)
      {
        if ((int)v48 <= 1)
          v52 = 1;
        else
          v52 = v48;
        v53 = v52 - 2;
        v54 = a5 + v17 * (v52 - 1);
        v55 = v46 + v48 * v17;
        ++v48;
        if ((*(_BYTE *)(a5 + v55) & 0x21) == 1)
        {
          if (v50 > (int)result)
            goto LABEL_70;
          v56 = 0;
          v57 = 0;
          if ((int)v48 >= v15)
            v58 = a2 - 1;
          else
            v58 = v48;
          v59 = v52 - 1;
          v60 = v49;
          do
          {
            v61 = v54;
            v62 = v53;
            if (v59 <= v58)
            {
              do
              {
                ++v57;
                if ((*(_BYTE *)(v61 + v60) & 0x21) == 1)
                  ++v56;
                ++v62;
                v61 += v17;
              }
              while (v62 < v58);
            }
            v45 = v60++ < (int)result;
          }
          while (v45);
        }
        else
        {
          if (v50 > (int)result)
            goto LABEL_70;
          v56 = 0;
          v57 = 0;
          if ((int)v48 >= v15)
            v63 = a2 - 1;
          else
            v63 = v48;
          v64 = v52 - 1;
          v65 = v49;
          do
          {
            v66 = v54;
            v67 = v53;
            if (v64 <= v63)
            {
              do
              {
                ++v57;
                if ((*(_BYTE *)(v66 + v65) & 0x21) == 1)
                  ++v56;
                ++v67;
                v66 += v17;
              }
              while (v67 < v63);
            }
            v45 = v65++ < (int)result;
          }
          while (v45);
        }
        if (v56 == v57)
LABEL_70:
          *(_BYTE *)(a6 + v55) |= 2u;
        if (v48 == a2)
          goto LABEL_74;
      }
    }
  }
  return result;
}

BOOL computeMask_foregroundContinuousGradient_backgroundSingleColor(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7, uint64_t a8, float32x4_t a9, float32x4_t a10, float32x4_t a11, float32x4_t a12, float32x4_t a13)
{
  float32x4_t v13;
  uint64_t v17;
  int v20;
  uint64_t v21;
  unsigned __int8 *v22;
  float32x4_t v23;
  char *v24;
  char *v25;
  float v26;
  float v27;
  char v28;
  char v29;
  char v30;
  float32x4_t v31;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  double v40;
  int v41;
  uint64_t v42;
  BOOL v43;
  float v44;
  unint64_t v45;
  float32x4_t v46;
  float32x4_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  unsigned __int8 *v57;
  unsigned int v58;
  unsigned int v59;
  char v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  int v67;
  unsigned int v68;
  float32x4_t v69;
  char v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  int v77;
  int v78;
  uint64_t v79;
  int v80;
  float32x4_t v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  int v87;
  int v88;
  int8x16_t v89;
  int8x8_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  uint64_t v94;
  BOOL v95;
  float32x4_t v96;
  int8x16_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  int8x16_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int8x16_t v106;
  int8x8_t v107;
  float32x4_t v108;
  int v109;
  int8x16_t v110;
  float32x4_t v111;
  float32x4_t v112;
  float32x4_t v113;
  int8x16_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  int v124;
  BOOL v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  int v131;
  uint64_t v132;
  uint64_t v133;
  int v135;
  char *v136;
  uint64_t v137;
  float32x2_t v138;
  float v139;
  float v140;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  uint64_t v150;
  float32x4_t v151;
  float32x4_t v153;
  float32x4_t v154;
  float32x4_t v155;
  float32x4_t v156;
  float32x4_t v157;
  float32x4_t v158;
  float32x4_t v159;
  int8x16_t v160;
  float32x4_t v161;
  float32x4_t v162;
  int8x16_t v163;
  int8x16_t v164;
  unsigned __int32 v165[4];

  v17 = a5;
  v20 = a1;
  v21 = (a2 * a1);
  if ((int)v21 < 1)
  {
    v27 = 0.0;
    v26 = 1.0;
  }
  else
  {
    v22 = (unsigned __int8 *)(a4 + 2);
    v23 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    v24 = (char *)a5;
    v25 = a6;
    v26 = 1.0;
    v27 = 0.0;
    do
    {
      v29 = *v24++;
      v28 = v29;
      v30 = v29;
      if (a3)
        v30 = *v25;
      if ((v28 & 1) != 0 && (v30 & 8) != 0)
      {
        a12.i32[0] = *(v22 - 2);
        a12.i32[1] = *(v22 - 1);
        *(float32x2_t *)a12.f32 = vcvt_f32_u32(*(uint32x2_t *)a12.f32);
        a13.i8[0] = *v22;
        a12.f32[2] = (float)a13.u32[0];
        v31 = vmulq_f32(vdivq_f32(a12, v23), a9);
        a13 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.f32, 1);
        a12 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2), vaddq_f32(v31, a13));
        a12.f32[0] = fminf(fmaxf(a12.f32[0], 0.0), 1.0);
        v26 = fminf(v26, a12.f32[0]);
        v27 = fmaxf(v27, a12.f32[0]);
      }
      v22 += 4;
      ++v25;
      --v21;
    }
    while (v21);
  }
  __asm { FMOV            V0.4S, #-1.0 }
  v37 = vaddq_f32(a10, _Q0);
  v38 = vmulq_f32(v37, v37);
  v39 = vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1));
  v40 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), v39).f32[0]);
  v156 = a10;
  if (v40 < 0.117647059)
  {
    computeIconSegmentationFlagForConnectedBackground(a1, a2, a5);
    a10 = v156;
  }
  v124 = v20 - 1;
  if (v20 < 1)
  {
    return 1;
  }
  else
  {
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = v27 - fminf(v26, v27 + -0.00001);
    v47 = vsubq_f32(a11, a10);
    v151 = v47;
    v139 = fmaxf(1.0 - (float)(v44 * fminf(0.5 / v44, 1.6)), 0.5);
    v140 = v44;
    v45 = v20;
    v142 = a4;
    v123 = a4 - 28;
    v122 = v17 - 7;
    v121 = a6 - 7;
    v135 = v20;
    v127 = 4 * v20;
    v46 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    *(int32x2_t *)v47.f32 = vdup_n_s32(0x437F0000u);
    v138 = *(float32x2_t *)v47.f32;
    v47.i32[0] = 1067030938;
    v132 = a7;
    v133 = a8;
    v136 = a6;
    v153 = v46;
    v143 = v17;
    while (1)
    {
      v125 = v43;
      v126 = v41;
      v48 = v41 <= 7 ? 7 : v41;
      v144 = v42;
      v49 = (int)v42 <= 7 ? 7 : v42;
      if (a2 >= 1)
        break;
LABEL_96:
      v42 = v144 + 1;
      v41 = v126 + 1;
      v43 = v144 + 1 >= v45;
      if (v144 + 1 == v45)
        return v43;
    }
    v50 = 0;
    v51 = v122 + v48;
    v129 = &v121[v48];
    v130 = v123 + 4 * v48;
    v137 = v49 - 7;
    v131 = v49 - 7;
    v52 = v42 + 7;
    if ((int)v42 + 7 >= v124)
      v52 = v124;
    v150 = v52;
    v128 = v123 + 4 * v48;
    v146 = -7;
    while (1)
    {
      if ((int)v50 <= 7)
        v53 = 7;
      else
        v53 = v50;
      v147 = v50;
      v54 = v144 + v50 * v45;
      v55 = *(_BYTE *)(v17 + v54);
      v56 = v55;
      if (a3)
        v56 = v136[v54];
      v145 = v144 + v50 * v45;
      v57 = (unsigned __int8 *)(v142 + 4 * v54);
      v58 = *v57;
      v59 = v57[1];
      LOBYTE(v26) = v57[2];
      if (v40 < 0.117647059)
      {
        v60 = testEyeFeature(v135, a2, v144, v50, v142, v143, v47, a10.f32[0]);
        v46 = v153;
        if ((v60 & 1) != 0)
          return v125;
      }
      *(float32x2_t *)v47.f32 = vcvt_f32_u32((uint32x2_t)__PAIR64__(v59, v58));
      v47.f32[2] = (float)LODWORD(v26);
      v61 = vdivq_f32(v47, v46);
      if (a3)
      {
        v154 = v61;
        *(double *)v62.i64 = ISSegmentationMathUtils_clampedProject(v61, v156, a11);
        v61 = v154;
        v63 = v156;
        v46 = v153;
        v64 = vsubq_f32(v154, v62);
      }
      else
      {
        v63 = v156;
        v64 = vsubq_f32(v61, v156);
      }
      v65 = vmulq_f32(v64, v64);
      v47 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v65, 2), vaddq_f32(v65, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v65.f32, 1)));
      *(double *)v47.i64 = sqrtf(v47.f32[0]);
      if (*(double *)v47.i64 >= 0.00784313725)
      {
        v67 = *(_DWORD *)&v55 & ((v56 & 4) >> 2);
        if (v67)
          v68 = -1;
        else
          v68 = 0;
        v69.i32[1] = 0;
        v69.i64[1] = 0;
        v66 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v68), (int8x16_t)v61, (int8x16_t)0);
        if ((*(_DWORD *)&v55 & ((v56 & 4) >> 2)) != 0)
          v13.f32[0] = 0.0;
        else
          v13.f32[0] = 3.4028e38;
        if ((v67 & 1) == 0 && v131 <= (int)v150)
        {
          v70 = 0;
          v71 = 0;
          v72 = v53;
          v148 = v53 - 8;
          v73 = v128 + v127 * (v53 - 7);
          v74 = v45 * (v53 - 7);
          v75 = v51 + v74;
          v76 = &v129[v74];
          v77 = v147 + 7;
          if ((int)v147 + 7 >= a2 - 1)
            v77 = a2 - 1;
          v78 = v72 - 7;
          v79 = v77;
          v80 = 0x7FFFFFFF;
          v81 = 0uLL;
          v82 = v137;
          while (v78 > (int)v79)
          {
LABEL_63:
            ++v74;
            v95 = v82++ < v150;
            if (!v95)
            {
              v155 = v61;
              if (v71 <= 0)
              {
                v99 = v63;
              }
              else
              {
                v96 = v61;
                if ((v70 & 1) == 0)
                {
                  v69.f32[0] = (float)v71;
                  v96 = vdivq_f32(v81, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v69.f32, 0));
                }
                v161 = v13;
                v163 = (int8x16_t)v66;
                v159 = v96;
                if (a3)
                {
                  v165[0] = 0;
                  getRatioAndAlpha((unsigned __int32 *)v165, (float *)v165 + 1, vsubq_f32(v61, v96), vsubq_f32(v63, v96), vsubq_f32(a11, v96));
                  v97 = (int8x16_t)v159;
                  v63 = v156;
                  v69 = vmlaq_n_f32(v156, v151, fminf(fmaxf(*(float *)v165, 0.0), 1.0));
                  v98 = vmlaq_n_f32(v69, vsubq_f32(v159, v69), fminf(fmaxf(1.0 - *((float *)v165 + 1), 0.0), 1.0));
                }
                else
                {
                  *(double *)v98.i64 = ISSegmentationMathUtils_clampedProject(v61, v63, v96);
                  v97 = (int8x16_t)v159;
                  v63 = v156;
                  v69 = v156;
                }
                v61 = v155;
                v100 = vsubq_f32(v155, v98);
                v101 = vmulq_f32(v100, v100);
                v81 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v101, 2), vaddq_f32(v101, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v101.f32, 1)));
                v81.f32[0] = sqrtf(v81.f32[0]);
                v13 = v161;
                v102 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v161, v81), 0);
                v66 = (float32x4_t)vbslq_s8(v102, v97, v163);
                v99 = (float32x4_t)vbslq_s8(v102, (int8x16_t)v69, (int8x16_t)v63);
                if (v81.f32[0] < v161.f32[0])
                  v13.f32[0] = v81.f32[0];
                v46 = v153;
              }
              v103 = v137;
              v149 = v78;
              while (v78 > (int)v79)
              {
LABEL_88:
                v73 += 4;
                ++v75;
                ++v76;
                v95 = v103++ < v150;
                v78 = v149;
                if (!v95)
                  goto LABEL_89;
              }
              v104 = 0;
              v105 = v148;
              while (2)
              {
                v81.i32[0] = *(_DWORD *)(v73 + 4 * v104);
                v106 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v81.f32);
                v69.f32[0] = (float)v106.u16[0];
                v107.i32[0] = v106.u16[1];
                v107.i32[1] = v106.u16[2];
                *(float32x2_t *)v106.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v107, (int8x8_t)0xFF000000FFLL));
                v69 = (float32x4_t)vextq_s8((int8x16_t)v69, (int8x16_t)v69, 4uLL);
                v81 = (float32x4_t)vextq_s8((int8x16_t)v69, v106, 0xCuLL);
                v108 = vdivq_f32(v81, v46);
                v109 = *(unsigned __int8 *)(v75 + v104);
                if (a3)
                {
                  if ((v109 & 1) != 0 && (v76[v104] & 8) != 0)
                  {
                    v160 = (int8x16_t)v99;
                    v162 = v13;
                    v164 = (int8x16_t)v66;
                    v165[0] = 0;
                    v157 = v108;
                    getRatioAndAlpha((unsigned __int32 *)v165, (float *)v165 + 1, vsubq_f32(v61, v108), vsubq_f32(v63, v108), vsubq_f32(a11, v108));
                    v63 = v156;
                    v110 = (int8x16_t)v157;
                    v69 = vmlaq_n_f32(v156, v151, fminf(fmaxf(*(float *)v165, 0.0), 1.0));
                    v111 = vmlaq_n_f32(v69, vsubq_f32(v157, v69), fminf(fmaxf(1.0 - *((float *)v165 + 1), 0.0), 1.0));
                    goto LABEL_84;
                  }
                }
                else if ((~v109 & 9) == 0)
                {
                  v160 = (int8x16_t)v99;
                  v162 = v13;
                  v164 = (int8x16_t)v66;
                  v158 = v108;
                  *(double *)v111.i64 = ISSegmentationMathUtils_clampedProject(v61, v63, v108);
                  v63 = v156;
                  v110 = (int8x16_t)v158;
                  v69 = v156;
LABEL_84:
                  v61 = v155;
                  v112 = vsubq_f32(v155, v111);
                  v113 = vmulq_f32(v112, v112);
                  v81 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v113, 2), vaddq_f32(v113, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v113.f32, 1)));
                  v81.f32[0] = sqrtf(v81.f32[0]);
                  v13 = v162;
                  v114 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v162, v81), 0);
                  v66 = (float32x4_t)vbslq_s8(v114, v110, v164);
                  v99 = (float32x4_t)vbslq_s8(v114, (int8x16_t)v69, v160);
                  if (v81.f32[0] < v162.f32[0])
                    v13.f32[0] = v81.f32[0];
                  v46 = v153;
                }
                ++v105;
                v104 += v45;
                if (v105 >= v79)
                  goto LABEL_88;
                continue;
              }
            }
          }
          v83 = v82 - v144;
          if ((int)v82 - (int)v144 < 0)
            v83 = v144 - v82;
          v84 = v74;
          v85 = v72;
          while (2)
          {
            v86 = *(_BYTE *)(v51 + v84);
            if (a3)
              v86 = v129[v84];
            if ((*(_BYTE *)(v51 + v84) & 1) != 0 && (v86 & 4) != 0)
            {
              v87 = v146 + v85;
              if (v146 + (int)v85 < 0)
                v87 = -v87;
              v88 = v87 + v83;
              if (v88 < v80)
              {
                v70 = 0;
                v71 = 0;
                v81 = 0uLL;
                v80 = v88;
                goto LABEL_61;
              }
              if (v88 == v80)
              {
LABEL_61:
                v69.i32[0] = *(_DWORD *)(v130 + 4 * v84);
                v89 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v69.f32);
                v39.f32[0] = (float)v89.u16[0];
                v90.i32[0] = v89.u16[1];
                v90.i32[1] = v89.u16[2];
                *(float32x2_t *)v89.i8 = vcvt_f32_u32((uint32x2_t)vand_s8(v90, (int8x8_t)0xFF000000FFLL));
                v91 = vdivq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v39, (int8x16_t)v39, 4uLL), v89, 0xCuLL), v46);
                ++v71;
                v81 = vaddq_f32(v91, v81);
                v92 = vsubq_f32(v61, v91);
                v93 = vmulq_f32(v92, v92);
                v39 = vaddq_f32(v93, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v93.f32, 1));
                v69 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v93, 2), v39);
                *(double *)v69.i64 = sqrtf(v69.f32[0]);
                v70 |= *(double *)v69.i64 < 0.00784313725;
              }
            }
            v94 = v85 - 7;
            ++v85;
            v84 += v45;
            if (v94 >= v79)
              goto LABEL_63;
            continue;
          }
        }
        v99 = v63;
LABEL_89:
        if (v13.f32[0] > 1.2)
          return v125;
        v115 = vmulq_f32(v66, a9);
        v116 = vsubq_f32(v66, v99);
        a10 = vmulq_f32(vsubq_f32(v61, v99), v116);
        v117 = vaddq_f32(a10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)a10.f32, 1));
        v118 = (float32x4_t)vdupq_laneq_s32((int32x4_t)a10, 2);
        a10.f32[0] = fminf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v115, 2), vaddq_f32(v115, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v115.f32, 1))).f32[0], 0.0), 1.0);
        v119 = vmulq_f32(v116, v116);
        v39 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v119, 2), vaddq_f32(v119, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v119.f32, 1)));
        v47 = vdivq_f32(vaddq_f32(v118, v117), v39);
        v47.f32[0] = fminf(fmaxf(v47.f32[0], 0.0), 1.0);
        a7 = v132;
        a8 = v133;
      }
      else
      {
        a10.i32[0] = 0;
        v66 = 0uLL;
        v47.i32[0] = 0;
      }
      v17 = v143;
      if (a7)
      {
        a10.f32[0] = (float)(v47.f32[0]
                           * (float)(v139
                                   + (float)(fminf(fmaxf(1.0 - (float)((float)(v27 - a10.f32[0]) / v140), 0.0), 1.0)
                                           * (float)(1.0 - v139))))
                   * 255.0;
        *(_BYTE *)(a7 + v145) = (int)a10.f32[0];
      }
      if (a8)
      {
        *(float32x2_t *)a10.f32 = vmul_f32(*(float32x2_t *)v66.f32, v138);
        a10.i64[1] = COERCE_UNSIGNED_INT(vmuls_lane_f32(255.0, v66, 2)) | 0x437F000000000000;
        v47 = (float32x4_t)vcvtq_s32_f32(vmulq_n_f32(a10, v47.f32[0]));
        *(int16x4_t *)v47.f32 = vmovn_s32((int32x4_t)v47);
        *(int8x8_t *)v47.f32 = vmovn_s16((int16x8_t)v47);
        *(_DWORD *)(a8 + 4 * v145) = v47.i32[0];
      }
      v50 = v147 + 1;
      --v146;
      if (v147 + 1 == a2)
        goto LABEL_96;
    }
  }
}

uint64_t computeMask_foregroundSingleColor_backgroundContinuousGradient(uint64_t result, int a2, _BYTE *a3, uint64_t a4, uint64_t a5, float32x4_t a6, float a7, float a8, float32x4_t a9, float32x4_t a10, float32x4_t a11, float32x4_t a12, float a13)
{
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int v16;
  uint64_t v17;
  float32x4_t v18;
  float32x4_t v19;
  unsigned __int8 *v20;
  _BYTE *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float v27;
  uint64_t v28;
  __int8 *v29;
  uint64_t v30;
  float32x2_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int8 *v35;
  float32x4_t v36;
  float32x4_t v37;
  float v38;
  float32x4_t v39;
  float32x4_t v40;

  v16 = a2 - 1;
  if (a2 >= 1)
  {
    v17 = 0;
    LOBYTE(a8) = *a3;
    a9.f32[0] = (float)LODWORD(a8);
    LOBYTE(a8) = a3[1];
    a10.i8[0] = a3[2];
    a9.f32[1] = (float)LODWORD(a8);
    a9.f32[2] = (float)a10.u32[0];
    v18 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    v19 = vdivq_f32(a9, v18);
    v20 = &a3[4 * v16 * (int)result];
    a10.i32[0] = *v20;
    a10.i32[1] = v20[1];
    *(float32x2_t *)a10.f32 = vcvt_f32_u32(*(uint32x2_t *)a10.f32);
    a11.i8[0] = v20[2];
    a10.f32[2] = (float)a11.u32[0];
    v21 = &a3[4 * a2 * (int)result];
    a11.i32[0] = *(v21 - 4);
    a11.i32[1] = *(v21 - 3);
    *(float32x2_t *)a11.f32 = vcvt_f32_u32(*(uint32x2_t *)a11.f32);
    a12.i8[0] = *(v21 - 2);
    a11.f32[2] = (float)a12.u32[0];
    v22 = (int)result - 1;
    v23 = &a3[4 * v22];
    a12.i32[0] = *v23;
    a12.i32[1] = v23[1];
    v24 = vdivq_f32(a10, v18);
    *(float32x2_t *)a12.f32 = vcvt_f32_u32(*(uint32x2_t *)a12.f32);
    LOBYTE(a13) = v23[2];
    a12.f32[2] = (float)LODWORD(a13);
    v25 = vsubq_f32(vdivq_f32(a12, v18), v19);
    v26 = vsubq_f32(vdivq_f32(a11, v18), v24);
    v27 = (float)v16;
    v28 = a2;
    v29 = a3 + 2;
    v30 = 4 * (int)result;
    v31 = (float32x2_t)vdup_n_s32(0x437F0000u);
    v32 = a5;
    v33 = a4;
    do
    {
      if ((int)result >= 1)
      {
        v34 = 0;
        v13.f32[0] = (float)(int)v17 / v27;
        v13 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 0);
        v35 = v29;
        do
        {
          v14.i32[0] = *(v35 - 2);
          v14.i32[1] = *(v35 - 1);
          *(float32x2_t *)v14.f32 = vcvt_f32_u32(*(uint32x2_t *)v14.f32);
          v15.i8[0] = *v35;
          v14.f32[2] = (float)v15.u32[0];
          v36 = vsubq_f32(vdivq_f32(v14, v18), a6);
          v37 = vmulq_f32(v36, v36);
          v15 = vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1));
          v14 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), v15);
          v14.f32[0] = 1.0 - fminf(fmaxf(sqrtf(v14.f32[0]) / a7, 0.0), 1.0);
          if (a4)
          {
            v15.f32[0] = v14.f32[0] * 255.0;
            *(_BYTE *)(v33 + v34) = (int)(float)(v14.f32[0] * 255.0);
          }
          if (a5)
          {
            v38 = (float)(int)v34 / (float)(int)v22;
            v39 = vmlaq_n_f32(v19, v25, v38);
            v40 = vmlaq_f32(v39, vsubq_f32(vmlaq_n_f32(v24, v26, v38), v39), v13);
            *(float32x2_t *)v15.f32 = vmul_f32(*(float32x2_t *)v40.f32, v31);
            v15.i64[1] = COERCE_UNSIGNED_INT(vmuls_lane_f32(255.0, v40, 2)) | 0x437F000000000000;
            v14 = (float32x4_t)vcvtq_s32_f32(vmulq_n_f32(v15, v14.f32[0]));
            *(int16x4_t *)v14.f32 = vmovn_s32((int32x4_t)v14);
            *(_DWORD *)(v32 + 4 * v34) = vmovn_s16((int16x8_t)v14).u32[0];
          }
          v35 += 4;
          ++v34;
        }
        while (result != v34);
      }
      ++v17;
      v29 += v30;
      v33 += (int)result;
      v32 += v30;
    }
    while (v17 != v28);
  }
  return result;
}

uint64_t lightenColorOverDarkBackground(int32x4_t *a1, int32x4_t a2)
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float v6;
  __n128 v7;
  unsigned int v8;
  uint64_t result;
  float32x4_t v15;
  __n128 v16;
  float v17;
  int32x4_t v18;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  __int128 v23;
  __n128 v24;
  __int32 v25;
  float32x4_t v26;
  float32x4_t v27;

  v24 = (__n128)vdupq_n_s32(0x3DA0902Eu);
  if (ISSegmentationMathUtils_contrastRatio((__n128)a2, v24) >= 4.5)
  {
    result = 1;
LABEL_15:
    v18 = a2;
    if (a1)
LABEL_16:
      *a1 = v18;
  }
  else
  {
    *(__n64 *)v3.f32 = ISSegmentationMathUtils_rgb2hsv(a2);
    v5 = v3;
    v3.f32[0] = v3.f32[2] + 0.05;
    v5.i32[2] = v3.i32[0];
    while (1)
    {
      v6 = v5.f32[2];
      if (v5.f32[2] > 1.0)
      {
        __asm { FMOV            V0.4S, #1.0 }
        *(_QWORD *)&_Q0 = v5.i64[0];
        v23 = _Q0;
        v4.i32[0] = v5.i32[1];
        v21 = (__n128)vdupq_n_s32(0x3DA0902Eu);
        do
        {
          v4.f32[0] = v4.f32[0] + -0.05;
          if (v4.f32[0] < 0.0)
          {
            result = 0;
            goto LABEL_15;
          }
          v15.i64[0] = __PAIR64__(v4.u32[0], v23);
          v15.i64[1] = __PAIR64__(v5.u32[3], DWORD2(v23));
          v25 = v5.i32[3];
          v27 = v4;
          v16.n128_f64[0] = ISSegmentationMathUtils_hsv2rgb(v15);
          v20 = v16;
          v17 = ISSegmentationMathUtils_contrastRatio(v16, v21);
          v4 = v27;
          v5.i32[3] = v25;
        }
        while (v17 < 3.0);
        result = 1;
        v18 = (int32x4_t)v20;
        if (a1)
          goto LABEL_16;
        return result;
      }
      v26 = v5;
      v7.n128_f64[0] = ISSegmentationMathUtils_hsv2rgb(v5);
      v22 = v7;
      if (ISSegmentationMathUtils_contrastRatio(v7, v24) >= 4.5)
        break;
      *(float *)&v8 = v6 + 0.05;
      v4 = v26;
      v5.i64[0] = v26.i64[0];
      v5.i64[1] = __PAIR64__(v26.u32[3], v8);
    }
    result = 1;
    v18 = (int32x4_t)v22;
    if (a1)
      goto LABEL_16;
  }
  return result;
}

uint64_t computeIconSegmentationFlagForConnectedBackground(uint64_t result, int a2, uint64_t a3)
{
  int v3;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;

  v3 = result - 1;
  if ((int)result >= 1)
  {
    v6 = result;
    v7 = 0;
    v8 = (_BYTE *)a3;
    do
    {
      v9 = a2;
      v10 = v8;
      if (a2 >= 1)
      {
        do
        {
          *v10 &= ~0x80u;
          v10 += result;
          --v9;
        }
        while (v9);
      }
      ++v7;
      ++v8;
    }
    while (v7 != result);
    v11 = a2 - 1;
    if (a2 >= 1)
    {
      v12 = 0;
      do
      {
        v13 = 0;
        do
        {
          computeIconSegmentationFlagForConnectedBackgroundHelper(v6, a2, v13, v12, a3);
          computeIconSegmentationFlagForConnectedBackgroundHelper(v6, a2, v13++, v11, a3);
        }
        while ((_DWORD)v6 != v13);
        v14 = v6;
        do
        {
          computeIconSegmentationFlagForConnectedBackgroundHelper(v6, a2, --v14, v12, a3);
          computeIconSegmentationFlagForConnectedBackgroundHelper(v6, a2, v14, v11, a3);
        }
        while (v14 > 0);
        v15 = 0;
        do
        {
          computeIconSegmentationFlagForConnectedBackgroundHelper(v6, a2, v12, v15, a3);
          computeIconSegmentationFlagForConnectedBackgroundHelper(v6, a2, v3, v15++, a3);
        }
        while (a2 != v15);
        v16 = a2;
        do
        {
          computeIconSegmentationFlagForConnectedBackgroundHelper(v6, a2, v12, --v16, a3);
          result = computeIconSegmentationFlagForConnectedBackgroundHelper(v6, a2, v3, v16, a3);
        }
        while (v16 > 0);
        if (v12 >= --v3)
          break;
      }
      while (v12++ < --v11);
    }
  }
  return result;
}

uint64_t testEyeFeature(int a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, float32x4_t a7, float a8)
{
  int v8;
  unsigned __int8 *v9;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  uint64_t v20;
  int v21;
  int v22;
  char v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  __int8 *v42;
  float32x4_t v43;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  int v55;
  int v56;
  int v57;
  int v58;
  __int8 *v59;
  int v60;
  float32x4_t v61;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  unsigned int v73;
  int v74;
  unint64_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;

  v8 = a4 * a1;
  v9 = (unsigned __int8 *)(a5 + 4 * (a4 * a1 + a3));
  a7.i32[0] = *v9;
  a7.i32[1] = v9[1];
  *(float32x2_t *)a7.f32 = vcvt_f32_u32(*(uint32x2_t *)a7.f32);
  LOBYTE(a8) = v9[2];
  a7.f32[2] = (float)LODWORD(a8);
  __asm { FMOV            V1.4S, #-1.0 }
  v80 = _Q1;
  v15 = vaddq_f32(vdivq_f32(a7, (float32x4_t)vdupq_n_s32(0x437F0000u)), _Q1);
  v16 = vmulq_f32(v15, v15);
  v17 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v16.f32, 1);
  if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v16, 2), vaddq_f32(v16, v17)).f32[0]) >= 0.27451)
    return 0;
  v20 = a3 <= 3 ? 3 : a3;
  v21 = a1 - 1;
  v22 = a3 + 3 >= a1 - 1 ? a1 - 1 : a3 + 3;
  if ((int)v20 - 3 <= v22)
  {
    v23 = 0;
    v24 = a4 + 3;
    if (a4 + 3 >= a2 - 1)
      v24 = a2 - 1;
    v25 = a4 <= 3 ? 3 : a4;
    v26 = a6 + (v25 - 3) * a1;
    v27 = v25 - 3;
    v28 = v20 - 3;
    v29 = v22 + 1;
    v30 = v24 - v25 + 4;
    do
    {
      v31 = v30;
      v32 = v26;
      if (v27 <= v24)
      {
        do
        {
          v23 |= *(char *)(v32 + v28) < 0;
          v32 += a1;
          --v31;
        }
        while (v31);
      }
      ++v28;
    }
    while (v29 != (_DWORD)v28);
    if ((v23 & 1) != 0)
      return 0;
  }
  v34 = 351843721 * a2 * a1;
  v35 = (unint64_t)v34 >> 63;
  v36 = v34 >> 45;
  v37 = a1 / 20;
  v38 = (a3 - v37) & ~((a3 - v37) >> 31);
  if ((int)v38 > a3)
  {
    v39 = 0;
    v40 = 0;
    goto LABEL_37;
  }
  v75 = (unint64_t)v34 >> 63;
  v39 = 0;
  v41 = a3 + 1;
  v42 = (__int8 *)(a5 + 4 * (a3 + (uint64_t)v8) + 2);
  v43 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  __asm { FMOV            V0.4S, #1.0 }
  v78 = _Q0;
  v76 = v43;
  while (1)
  {
    _Q0.i32[0] = *(v42 - 2);
    _Q0.i32[1] = *(v42 - 1);
    *(float32x2_t *)_Q0.f32 = vcvt_f32_u32(*(uint32x2_t *)_Q0.f32);
    v17.i8[0] = *v42;
    _Q0.f32[2] = (float)v17.u32[0];
    v45 = vdivq_f32(_Q0, v43);
    v46 = vmulq_f32(v45, v45);
    v17 = vaddq_f32(v46, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v46.f32, 1));
    _Q0 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v46, 2), v17);
    _Q0.f32[0] = sqrtf(_Q0.f32[0]);
    if (!v39)
      break;
    if (_Q0.f32[0] >= 0.35294)
    {
      v47 = vaddq_f32(v45, v80);
      v48 = vmulq_f32(v47, v47);
      v17 = vaddq_f32(v48, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v48.f32, 1));
      if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v48, 2), v17).f32[0]) < 0.27451)
        goto LABEL_35;
      v81 = v45;
      *(double *)v49.i64 = ISSegmentationMathUtils_clampedProject(v45, (float32x4_t)0, v78);
      v50 = vsubq_f32(v81, v49);
      v51 = vmulq_f32(v50, v50);
      v17 = vaddq_f32(v51, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 1));
      _Q0 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v51, 2), v17);
      if (sqrtf(_Q0.f32[0]) >= 0.19608)
      {
        v40 = 1;
        goto LABEL_36;
      }
      goto LABEL_33;
    }
    ++v39;
LABEL_34:
    v42 -= 4;
    if (--v41 <= v38)
      goto LABEL_35;
  }
  if (_Q0.f32[0] < 0.35294)
  {
    v39 = 1;
    goto LABEL_34;
  }
  v82 = v45;
  *(double *)v52.i64 = ISSegmentationMathUtils_clampedProject(v45, (float32x4_t)0, v78);
  v53 = vsubq_f32(v82, v52);
  v54 = vmulq_f32(v53, v53);
  v17 = vaddq_f32(v54, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 1));
  _Q0 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v54, 2), v17);
  v39 = 0;
  if (sqrtf(_Q0.f32[0]) < 0.19608)
  {
LABEL_33:
    v43 = v76;
    goto LABEL_34;
  }
LABEL_35:
  v40 = 0;
LABEL_36:
  LODWORD(v35) = v75;
LABEL_37:
  v55 = v36 + v35;
  v56 = v37 + a3;
  if (v37 + a3 >= v21)
    v56 = v21;
  _VF = __OFSUB__(v56, a3);
  v57 = v56 - a3;
  if (v57 < 0 == _VF)
  {
    v58 = 0;
    v59 = (__int8 *)(a5 + 4 * (a3 + (uint64_t)v8) + 2);
    v60 = v57 + 1;
    v61 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    __asm { FMOV            V0.4S, #1.0 }
    v79 = _Q0;
    v77 = v61;
    while (1)
    {
      _Q0.i32[0] = *(v59 - 2);
      _Q0.i32[1] = *(v59 - 1);
      *(float32x2_t *)_Q0.f32 = vcvt_f32_u32(*(uint32x2_t *)_Q0.f32);
      v17.i8[0] = *v59;
      _Q0.f32[2] = (float)v17.u32[0];
      v63 = vdivq_f32(_Q0, v61);
      v64 = vmulq_f32(v63, v63);
      v17 = vaddq_f32(v64, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v64.f32, 1));
      _Q0 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v64, 2), v17);
      _Q0.f32[0] = sqrtf(_Q0.f32[0]);
      if (v58)
      {
        if (_Q0.f32[0] >= 0.35294)
        {
          v65 = vaddq_f32(v63, v80);
          v66 = vmulq_f32(v65, v65);
          if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v66, 2), vaddq_f32(v66, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v66.f32, 1))).f32[0]) < 0.27451)goto LABEL_55;
          v83 = v63;
          *(double *)v67.i64 = ISSegmentationMathUtils_clampedProject(v63, (float32x4_t)0, v79);
          v68 = vsubq_f32(v83, v67);
          v69 = vmulq_f32(v68, v68);
          v17 = vaddq_f32(v69, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v69.f32, 1));
          _Q0 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v69, 2), v17);
          if (sqrtf(_Q0.f32[0]) >= 0.19608)
          {
            v74 = 1;
            goto LABEL_56;
          }
          goto LABEL_53;
        }
        ++v58;
      }
      else
      {
        if (_Q0.f32[0] >= 0.35294)
        {
          v84 = v63;
          *(double *)v70.i64 = ISSegmentationMathUtils_clampedProject(v63, (float32x4_t)0, v79);
          v71 = vsubq_f32(v84, v70);
          v72 = vmulq_f32(v71, v71);
          v17 = vaddq_f32(v72, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v72.f32, 1));
          _Q0 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v72, 2), v17);
          if (sqrtf(_Q0.f32[0]) >= 0.19608)
            break;
          v58 = 0;
LABEL_53:
          v61 = v77;
          goto LABEL_54;
        }
        v58 = 1;
      }
LABEL_54:
      v59 += 4;
      if (!--v60)
        goto LABEL_55;
    }
  }
  v58 = 0;
LABEL_55:
  v74 = 0;
LABEL_56:
  v73 = v40 | v74;
  if (v58 <= v55)
    v73 = 0;
  if (v39 > v55)
    return v73;
  else
    return 0;
}

unsigned __int32 *getRatioAndAlpha(unsigned __int32 *result, float *a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  float32x4_t v5;
  float v6;
  float32x4_t v7;
  float v8;
  double v9;
  float32x4_t v10;
  float v11;
  float v12;
  float32x4_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  unsigned __int32 v22;
  float32x4_t v23;
  float32x4_t v24;
  float v25;
  float32x4_t v26;
  float v27;
  float v28;
  float32x4_t v29;
  float32x4_t v30;
  float v31;
  float32x4_t v32;
  float v33;

  v5 = vmulq_f32(a3, a3);
  v6 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0]);
  v7 = vmulq_f32(a4, a4);
  LODWORD(v8) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).u32[0];
  v9 = v6;
  v10 = vmulq_f32(a5, a5);
  LODWORD(v11) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).u32[0];
  if (sqrtf(v8) * 0.00001 > v9 && sqrtf(v11) * 0.00001 > v9)
  {
    if (result)
      *result = 0;
    v12 = 0.0;
    goto LABEL_14;
  }
  v13 = vsubq_f32(a5, a4);
  v14 = vrsqrte_f32((float32x2_t)LODWORD(v8));
  v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)LODWORD(v8), vmul_f32(v14, v14)));
  v16 = v11;
  v17 = vrsqrte_f32((float32x2_t)LODWORD(v11));
  v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)LODWORD(v16), vmul_f32(v17, v17)));
  v19 = vmulq_f32(vmulq_n_f32(a4, vmul_f32(v15, vrsqrts_f32((float32x2_t)LODWORD(v8), vmul_f32(v15, v15))).f32[0]), vmulq_n_f32(a5, vmul_f32(v18, vrsqrts_f32((float32x2_t)LODWORD(v16), vmul_f32(v18, v18))).f32[0]));
  if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0] > 0.9992)
  {
    if (result)
    {
      v20 = vmulq_f32(vsubq_f32(a3, a4), v13);
      v21 = vmulq_f32(v13, v13);
      v22 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v21, 2), vaddq_f32(v21, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 1)))).u32[0];
LABEL_12:
      *result = v22;
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v23 = vmulq_f32(a4, v13);
  v24 = vmulq_f32(v13, v13);
  v25 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1))).f32[0];
  v26 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1)));
  v27 = -v25;
  v28 = vmlas_n_f32((float)-v25 * v25, v8, v26.f32[0]);
  if (v28 < 0.000001)
  {
    if (result)
    {
      v29 = vmulq_f32(vsubq_f32(a3, a4), v13);
      v22 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2), vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1))), v26).u32[0];
      goto LABEL_12;
    }
LABEL_13:
    v12 = 1.0;
    goto LABEL_14;
  }
  v30 = vmulq_f32(a3, a4);
  LODWORD(v31) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v30, 2), vaddq_f32(v30, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v30.f32, 1))).u32[0];
  v32 = vmulq_f32(a3, v13);
  v33 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1))).f32[0];
  v12 = vmlas_n_f32(v27 * v33, v26.f32[0], v31) / v28;
  if (result)
    *(float *)result = (float)((float)((float)(v31 * v27) + (float)(v8 * v33)) / v28) / v12;
LABEL_14:
  if (a2)
    *a2 = v12;
  return result;
}

uint64_t computeIconSegmentationFlagForConnectedBackgroundHelper(uint64_t result, int a2, int a3, int a4, uint64_t a5)
{
  int v5;
  char v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3 + a4 * result;
  if (!a3)
  {
    v6 = 1;
    goto LABEL_24;
  }
  v6 = 1;
  if ((_DWORD)result - 1 == a3 || !a4 || a2 - 1 == a4)
  {
LABEL_24:
    if ((*(_BYTE *)(a5 + v5) & 1) == 0 && (v6 & 1) != 0)
      *(_BYTE *)(a5 + v5) |= 0x80u;
    return result;
  }
  if (a3 <= 1)
    v7 = 1;
  else
    v7 = a3;
  if (a3 + 1 < (int)result - 1)
    v8 = a3 + 1;
  else
    v8 = result - 1;
  if ((int)v7 - 1 <= v8)
  {
    v6 = 0;
    if (a4 + 1 < a2 - 1)
      v9 = a4 + 1;
    else
      v9 = a2 - 1;
    if (a4 <= 1)
      v10 = 1;
    else
      v10 = a4;
    v11 = v10 - 1;
    v12 = (v9 + 1) - v10;
    v13 = v10 - 1;
    v14 = (int)result;
    v15 = v7 - 1;
    v16 = (v8 + 1);
    v17 = a5 + v13 * (int)result;
    v18 = v12 + 1;
    do
    {
      result = v18;
      v19 = v17;
      if (v11 <= v9)
      {
        do
        {
          v6 |= *(char *)(v19 + v15) < 0;
          v19 += v14;
          --result;
        }
        while (result);
      }
      ++v15;
    }
    while (v15 != v16);
    goto LABEL_24;
  }
  return result;
}

void sub_1AA9439D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id _ISRetryRequest(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  char v9;

  v2 = 0;
  v3 = *MEMORY[0x1E0CB28A8];
  v4 = 1;
  do
  {
    (*(void (**)(uint64_t))(a1 + 16))(a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v5;
    v2 = v6;
    if (!v6)
      break;
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v3) & 1) == 0)
    {

      return v2;
    }
    v8 = objc_msgSend(v2, "code") == 4097;

    v9 = v8 & v4;
    v4 = 0;
  }
  while ((v9 & 1) != 0);
  return v2;
}

void sub_1AA943C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AA944778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id _ISColorForString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  float v13;
  float v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Black")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("White")))
    {
      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Red")))
      {
        if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Orange")))
        {
          if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Yellow")))
          {
            if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Green")))
            {
              if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Mint")))
              {
                if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Teal")))
                {
                  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Cyan")))
                  {
                    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Blue")))
                    {
                      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Indigo")))
                      {
                        if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Purple")))
                        {
                          if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Pink")))
                          {
                            if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Brown")))
                            {
                              if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Gray")))
                              {
                                objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("1234567890."));
                                v2 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(","));
                                v3 = (void *)objc_claimAutoreleasedReturnValue();
                                v4 = v3;
                                if (v3 && objc_msgSend(v3, "count") == 4)
                                {
                                  v35 = 0u;
                                  v36 = 0u;
                                  v33 = 0u;
                                  v34 = 0u;
                                  v5 = v4;
                                  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
                                  if (v6)
                                  {
                                    v7 = v6;
                                    v32 = v4;
                                    v8 = 0;
                                    v9 = *(_QWORD *)v34;
                                    do
                                    {
                                      for (i = 0; i != v7; ++i)
                                      {
                                        if (*(_QWORD *)v34 != v9)
                                          objc_enumerationMutation(v5);
                                        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                                        objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v2);
                                        v12 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (!objc_msgSend(v11, "length")
                                          || objc_msgSend(v12, "length")
                                          || (objc_msgSend(v11, "floatValue"), v13 < 0.0)
                                          || (objc_msgSend(v11, "floatValue"), v14 > 1.0))
                                        {
                                          _ISDefaultLog();
                                          v15 = objc_claimAutoreleasedReturnValue();
                                          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                                          {
                                            *(_DWORD *)buf = 138412290;
                                            v38 = v11;
                                          }

                                          v8 = 1;
                                        }

                                      }
                                      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
                                    }
                                    while (v7);

                                    v4 = v32;
                                    if ((v8 & 1) != 0)
                                      goto LABEL_33;
                                  }
                                  else
                                  {

                                  }
                                  objc_msgSend(v5, "objectAtIndex:", 0);
                                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v20, "floatValue");
                                  v22 = v21;

                                  objc_msgSend(v5, "objectAtIndex:", 1);
                                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v23, "floatValue");
                                  v25 = v24;

                                  objc_msgSend(v5, "objectAtIndex:", 2);
                                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v26, "floatValue");
                                  v28 = v27;

                                  objc_msgSend(v5, "objectAtIndex:", 3);
                                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v29, "floatValue");
                                  v31 = v30;

                                  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithRed:green:blue:alpha:", v22, v25, v28, v31);
                                  goto LABEL_53;
                                }
LABEL_33:
                                v16 = 0;
LABEL_53:

                                goto LABEL_50;
                              }
                              v17 = (void *)MEMORY[0x1E0CB37E8];
                              v18 = 13;
                            }
                            else
                            {
                              v17 = (void *)MEMORY[0x1E0CB37E8];
                              v18 = 14;
                            }
                          }
                          else
                          {
                            v17 = (void *)MEMORY[0x1E0CB37E8];
                            v18 = 10;
                          }
                        }
                        else
                        {
                          v17 = (void *)MEMORY[0x1E0CB37E8];
                          v18 = 9;
                        }
                      }
                      else
                      {
                        v17 = (void *)MEMORY[0x1E0CB37E8];
                        v18 = 8;
                      }
                    }
                    else
                    {
                      v17 = (void *)MEMORY[0x1E0CB37E8];
                      v18 = 7;
                    }
                  }
                  else
                  {
                    v17 = (void *)MEMORY[0x1E0CB37E8];
                    v18 = 6;
                  }
                }
                else
                {
                  v17 = (void *)MEMORY[0x1E0CB37E8];
                  v18 = 4;
                }
              }
              else
              {
                v17 = (void *)MEMORY[0x1E0CB37E8];
                v18 = 5;
              }
            }
            else
            {
              v17 = (void *)MEMORY[0x1E0CB37E8];
              v18 = 3;
            }
          }
          else
          {
            v17 = (void *)MEMORY[0x1E0CB37E8];
            v18 = 2;
          }
        }
        else
        {
          v17 = (void *)MEMORY[0x1E0CB37E8];
          v18 = 1;
        }
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0CB37E8];
        v18 = 0;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      v18 = 11;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    v18 = 12;
  }
  objc_msgSend(v17, "numberWithInt:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_50:

  return v16;
}

id _IFColorFromString(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _ISColorForString(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
LABEL_5:
    v4 = v2;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (int)objc_msgSend(v1, "intValue");
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithSystemColor:", v3);
    goto LABEL_5;
  }
  _ISDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v1;
    _os_log_impl(&dword_1AA928000, v5, OS_LOG_TYPE_INFO, "Unexpected color %@", (uint8_t *)&v7, 0xCu);
  }

  v4 = 0;
LABEL_9:

  return v4;
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

double ISSegmentationMathUtils_outer(float32x4_t a1, float a2)
{
  double result;

  *(_QWORD *)&result = vmulq_n_f32(a1, a2).u64[0];
  return result;
}

double ISSegmentationMathUtils_clampedProject(float32x4_t a1, float32x4_t a2, float32x4_t a3)
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  double result;

  v3 = vsubq_f32(a3, a2);
  v4 = vmulq_f32(vsubq_f32(a1, a2), v3);
  v5 = vmulq_f32(v3, v3);
  *(_QWORD *)&result = vmlaq_n_f32(a2, v3, fminf(fmaxf(vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2), vaddq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1)))).f32[0], 0.0), 1.0)).u64[0];
  return result;
}

float ISSegmentationMathUtils_squaredMahalanobisDistance_inversedCovariance(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  float32x4_t v5;
  float32x4_t v6;

  v5 = vsubq_f32(a1, a2);
  v6 = vmulq_f32(v5, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a3, v5.f32[0]), a4, *(float32x2_t *)v5.f32, 1), a5, v5, 2));
  return fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0], 0.0);
}

float ISSegmentationMathUtils_bhattacharyyaDistance(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float32x4_t a6, float32x4_t a7, float32x4_t a8)
{
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  double v13;
  float v14;
  int32x4_t v17;
  int32x4_t v18;
  float32x4_t v20;
  simd_float3x3 v27;
  simd_float3x3 v28;

  v8 = vaddq_f32(a2, a6);
  v9 = vaddq_f32(a3, a7);
  v10 = vaddq_f32(a4, a8);
  v11.i64[0] = 0x3F0000003F000000;
  v11.i64[1] = 0x3F0000003F000000;
  v27.columns[0] = (simd_float3)vmulq_f32(v8, v11);
  v20 = (float32x4_t)v27.columns[0];
  v27.columns[1] = (simd_float3)vmulq_f32(v9, v11);
  v27.columns[2] = (simd_float3)vmulq_f32(v10, v11);
  v17 = (int32x4_t)v27.columns[1];
  v18 = (int32x4_t)v27.columns[2];
  v27.columns[0].i32[3] = 0;
  v27.columns[1].i32[3] = 0;
  v27.columns[2].i32[3] = 0;
  v28 = __invert_f3(v27);
  v12 = vsubq_f32(a1, a5);
  v28.columns[0] = (simd_float3)vmulq_f32(v12, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v28.columns[0], v12.f32[0]), (float32x4_t)v28.columns[1], *(float32x2_t *)v12.f32, 1), (float32x4_t)v28.columns[2], v12, 2));
  v13 = fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28.columns[0], 2), vaddq_f32((float32x4_t)v28.columns[0], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.columns[0].f32, 1))).f32[0], 0.0);
  v28.columns[0] = (simd_float3)vmulq_f32(v20, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v18, (int8x16_t)v18, 0xCuLL), (int8x16_t)v18, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v17, v17), (int8x16_t)v17, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v18, v18), (int8x16_t)v18, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v17, (int8x16_t)v17, 0xCuLL), (int8x16_t)v17, 8uLL)));
  v28.columns[1] = (simd_float3)vmulq_f32(a2, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)a4, (int8x16_t)a4, 0xCuLL), (int8x16_t)a4, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a3, (int32x4_t)a3), (int8x16_t)a3, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a4, (int32x4_t)a4), (int8x16_t)a4, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)a3, (int8x16_t)a3, 0xCuLL), (int8x16_t)a3, 8uLL)));
  v28.columns[2] = (simd_float3)vmulq_f32(a6, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)a8, (int8x16_t)a8, 0xCuLL), (int8x16_t)a8, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a7, (int32x4_t)a7), (int8x16_t)a7, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a8, (int32x4_t)a8), (int8x16_t)a8, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)a7, (int8x16_t)a7, 0xCuLL), (int8x16_t)a7, 8uLL)));
  v14 = logf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28.columns[0], 2), vaddq_f32((float32x4_t)v28.columns[0], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.columns[0].f32, 1))).f32[0]/ sqrtf(vmulq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28.columns[1], 2), vaddq_f32((float32x4_t)v28.columns[1], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.columns[1].f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28.columns[2], 2), vaddq_f32((float32x4_t)v28.columns[2], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.columns[2].f32, 1)))).f32[0]))* 0.5+ v13 * 0.125;
  return fmaxf(v14, 0.0);
}

float ISSegmentationMathUtils_gaussian_inversedCovariance(float32x4_t a1, float32x4_t a2, float32x4_t a3, int32x4_t a4, int8x16_t a5, float32x4_t a6, float32x4_t a7, float32x4_t a8)
{
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  float32x4_t v11;

  v8 = vsubq_f32(a1, a2);
  v9 = vmulq_f32(v8, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, v8.f32[0]), a7, *(float32x2_t *)v8.f32, 1), a8, v8, 2));
  v10 = expf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).f32[0], 0.0)* -0.5);
  v11 = vmulq_f32(a3, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8(a5, a5, 0xCuLL), a5, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(a4, a4), (int8x16_t)a4, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a5, (int32x4_t)a5), a5, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)a4, (int8x16_t)a4, 0xCuLL), (int8x16_t)a4, 8uLL)));
  v11.f32[0] = sqrt(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0], 1.0e-20)* 0.258012275);
  return v10 / v11.f32[0];
}

float ISSegmentationMathUtils_sampleNormalDistribution(unsigned int *a1)
{
  int v2;
  float v3;
  int v4;
  float v5;
  float v6;
  float v7;

  do
  {
    v2 = rand_r(a1);
    v3 = ((float)v2 + (float)v2) / 2147483650.0 + -1.0;
    v4 = rand_r(a1);
    v5 = ((float)v4 + (float)v4) / 2147483650.0 + -1.0;
    v6 = v5 * v5;
    v7 = v6 + (float)(v3 * v3);
  }
  while (v7 == 0.0 || v7 >= 1.0);
  return sqrtf((float)(logf(v6 + (float)(v3 * v3)) * -2.0) / v7) * v3;
}

double ISSegmentationMathUtils_mean(int a1, float32x4_t *a2, double a3, double a4)
{
  uint64_t v4;
  float32x4_t v5;
  float32x4_t v6;
  double result;

  if (a1 < 1)
  {
    v5 = 0uLL;
  }
  else
  {
    v4 = a1;
    v5 = 0uLL;
    do
    {
      v6 = *a2++;
      HIDWORD(a4) = v6.i32[1];
      v5 = vaddq_f32(v5, v6);
      --v4;
    }
    while (v4);
  }
  *(float *)&a4 = (float)a1;
  *(_QWORD *)&result = vdivq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a4, 0)).u64[0];
  return result;
}

double ISSegmentationMathUtils_covariance(int a1, float32x4_t *a2, float32x4_t a3, double a4, double a5, double a6, __n128 a7, __n128 a8, __n128 a9)
{
  uint64_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float v18;
  double result;

  if (a1 < 1)
  {
    v12 = 0uLL;
  }
  else
  {
    v9 = a1;
    v10 = 0uLL;
    v11 = 0uLL;
    v12 = 0uLL;
    do
    {
      v13 = *a2++;
      v14 = vsubq_f32(v13, a3);
      v15 = vmulq_n_f32(v14, v14.f32[0]);
      v16 = vmulq_lane_f32(v14, *(float32x2_t *)v14.f32, 1);
      v15.i32[3] = a7.n128_i32[3];
      v17 = vmulq_laneq_f32(v14, v14, 2);
      v16.i32[3] = a8.n128_i32[3];
      v17.i32[3] = a9.n128_i32[3];
      v12 = vaddq_f32(v12, v15);
      v11 = vaddq_f32(v11, v16);
      v10 = vaddq_f32(v10, v17);
      --v9;
    }
    while (v9);
  }
  v18 = 1.0 / (double)a1;
  *(_QWORD *)&result = vmulq_n_f32(v12, v18).u64[0];
  return result;
}

void ISSegmentationMathUtils_gmm(int a1, int a2, int a3, float32x4_t *a4, float32x4_t *a5, uint64_t a6, uint64_t a7, float *a8, float32x4_t *a9)
{
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  int32x2_t v12;
  float v15;
  float *v16;
  uint64_t v17;
  float32x4_t *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  float32x4_t v22;
  int v23;
  float32x4_t v24;
  float32x4_t v25;
  float *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  float32x4_t v31;
  float32x4_t v32;
  uint64_t v33;
  float32x4_t *v34;
  int32x4_t v35;
  uint64_t v36;
  int32x4_t v37;
  int32x4_t v38;
  float32x4_t *v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  int v44;
  const float *v45;
  float32x4_t *v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  int v50;
  float32x4_t v51;
  uint64_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float v55;
  uint64_t v56;
  float *v57;
  float v58;
  uint64_t v59;
  float *v60;
  BOOL v61;
  uint64_t v62;
  float *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  float *v67;
  int v68;
  float32x4_t v69;
  float *v70;
  float32x4_t *v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float v76;
  float v77;
  float v78;
  float v79;
  unsigned int v80;
  __int32 *v81;
  float32x4_t *v82;
  unint64_t v83;
  float32x4_t v84;
  float32x4_t v85;
  uint64_t v86;
  uint64_t v87;
  float v88;
  float32x4_t v89;
  int v90;
  float32x4_t v91;
  float *v92;
  float32x4_t *v93;
  float32x4_t v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float v106;
  float v107;
  float32x4_t v108;
  float32x4_t v109;
  unsigned int v110;
  __int32 *v111;
  float32x4_t *v112;
  unint64_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  float32x4_t v120;
  uint32x4_t v121;
  uint32x4_t v122;
  float32x4_t *v123;
  uint64_t v124;
  int v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  uint64_t v133;
  float32x4_t v136;
  char v137;
  float32x4_t v138;
  float32x4_t v139;
  float32x4_t v140;
  float32x4_t v141;
  float32x4_t v142;
  float32x4_t v143;
  float v144;
  float v145;
  float v146;
  float32x4_t v147;
  float32x4_t v148;
  float32x4_t v149;
  float32x4_t v150;
  float32x4_t v151;
  float32x4_t v152;
  float32x4_t v153;
  float32x4_t v154;
  unsigned int v155[3];
  simd_float3x3 v156;
  simd_float3x3 v157;
  float32x4x4_t v158;

  v155[0] = 10;
  v133 = a2;
  if (a2 >= 1)
  {
    v15 = 1.0 / (float)a2;
    v16 = a8;
    v17 = a7 + 32;
    v18 = a5;
    v19 = a6 + 16;
    v20 = a2;
    do
    {
      v21 = rand_r(v155);
      *(float32x2_t *)v22.f32 = vcvt_f32_s32((int32x2_t)__PAIR64__(rand_r(v155), v21));
      v152 = v22;
      v23 = rand_r(v155);
      v24 = v152;
      v24.f32[2] = (float)v23;
      v25.i64[0] = 0x3000000030000000;
      v25.i64[1] = 0x3000000030000000;
      *v18++ = vmulq_f32(v24, v25);
      *(_DWORD *)(v19 - 8) = 0;
      *(_QWORD *)(v19 - 16) = 1065353216;
      *(_DWORD *)(v19 + 8) = 0;
      *(_QWORD *)v19 = 0x3F80000000000000;
      *(_DWORD *)(v19 + 24) = 1065353216;
      *(_QWORD *)(v19 + 16) = 0;
      *(_QWORD *)(v17 - 32) = 1065353216;
      *(_DWORD *)(v17 - 24) = 0;
      *(_QWORD *)(v17 - 16) = 0x3F80000000000000;
      *(_DWORD *)(v17 - 8) = 0;
      *(_QWORD *)v17 = 0;
      *(_DWORD *)(v17 + 8) = 1065353216;
      *v16++ = v15;
      v17 += 48;
      v19 += 48;
      --v20;
    }
    while (v20);
  }
  v27 = a7;
  v26 = a8;
  v28 = v133;
  if (a3 >= 1)
  {
    v126 = 0;
    v29 = 4 * a1;
    v30 = a1 + 4;
    v31 = 0uLL;
    v32.i64[0] = 0xBF000000BF000000;
    v32.i64[1] = 0xBF000000BF000000;
    do
    {
      v127 = v11;
      v128 = v10;
      v129 = v9;
      if (a2 >= 1)
      {
        v33 = 0;
        v34 = a9;
        do
        {
          v35 = (int32x4_t)a5[v33];
          v36 = a6 + 48 * v33;
          v37 = *(int32x4_t *)(v36 + 16);
          v38 = *(int32x4_t *)(v36 + 32);
          v39 = (float32x4_t *)(v27 + 48 * v33);
          v40 = *v39;
          v41 = v39[1];
          v146 = v26[v33];
          v42 = v39[2];
          v43 = vmulq_f32(*(float32x4_t *)v36, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v38, (int8x16_t)v38, 0xCuLL), (int8x16_t)v38, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v37, v37), (int8x16_t)v37, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v38, v38), (int8x16_t)v38, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v37, (int8x16_t)v37, 0xCuLL), (int8x16_t)v37, 8uLL)));
          v144 = 1.0
               / sqrtf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1))).f32[0], 1.0e-20)* 0.25801);
          v148 = *v39;
          v150 = v42;
          v153 = v41;
          v142 = (float32x4_t)v35;
          if (a1 < 4)
          {
            v50 = 0;
          }
          else
          {
            v44 = 0;
            v138 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.i8, 1);
            v140 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.i8, 0);
            v45 = (const float *)a4;
            v136 = (float32x4_t)vdupq_laneq_s32(v35, 2);
            v46 = v34;
            do
            {
              v158 = vld4q_f32(v45);
              v45 += 16;
              v47 = vsubq_f32(v158.val[0], v140);
              v48 = vsubq_f32(v158.val[1], v138);
              v158.val[0] = vsubq_f32(v158.val[2], v136);
              *(double *)v49.i64 = MEMORY[0x1AF4234EC]((__n128)vmulq_f32(vmaxnmq_f32(vaddq_f32(vmulq_f32(v158.val[0], vaddq_f32(vmulq_laneq_f32(v158.val[0], v150, 2), vaddq_f32(vmulq_n_f32(v47, v42.f32[0]), vmulq_lane_f32(v48, *(float32x2_t *)v42.f32, 1)))), vaddq_f32(vmulq_f32(v47, vaddq_f32(vmulq_laneq_f32(v158.val[0], v40, 2), vaddq_f32(vmulq_n_f32(v47, v40.f32[0]),
                                                                             vmulq_lane_f32(v48, *(float32x2_t *)v40.f32, 1)))), vmulq_f32(v48, vaddq_f32(vmulq_laneq_f32(v158.val[0], v153, 2), vaddq_f32(vmulq_n_f32(v47, v41.f32[0]), vmulq_lane_f32(v48, *(float32x2_t *)v41.f32, 1)))))), v31), v32));
              v42 = v150;
              v41 = v153;
              v32.i64[0] = 0xBF000000BF000000;
              v32.i64[1] = 0xBF000000BF000000;
              v31 = 0uLL;
              v40 = v148;
              *v46++ = vmulq_n_f32(vmulq_n_f32(v49, v144), v146);
              v44 -= 4;
            }
            while ((v30 + v44) > 7);
            v50 = -v44;
            v27 = a7;
            v26 = a8;
          }
          v51 = v142;
          if (v50 < a1)
          {
            v52 = v50;
            do
            {
              v53 = vsubq_f32(a4[v52], v51);
              v54 = vmulq_f32(v53, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v40, v53.f32[0]), v41, *(float32x2_t *)v53.f32, 1), v42, v53, 2));
              v55 = expf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v54, 2), vaddq_f32(v54, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 1))).f32[0], 0.0)* -0.5);
              v42 = v150;
              v41 = v153;
              v40 = v148;
              v51 = v142;
              v34->f32[v52++] = v146 * (float)(v144 * v55);
            }
            while (a1 != v52);
          }
          ++v33;
          v34 = (float32x4_t *)((char *)v34 + v29);
          v28 = v133;
          v31 = 0uLL;
          v32.i64[0] = 0xBF000000BF000000;
          v32.i64[1] = 0xBF000000BF000000;
        }
        while (v33 != v133);
      }
      v10 = v128;
      v9 = v129;
      v11 = v127;
      if (a1 >= 1)
      {
        v56 = 0;
        v57 = (float *)a9;
        do
        {
          if (a2 >= 1)
          {
            v58 = 0.0;
            v59 = v28;
            v60 = v57;
            do
            {
              v58 = v58 + *v60;
              v60 = (float *)((char *)v60 + v29);
              --v59;
            }
            while (v59);
            v61 = v58 == 0.0 || a2 < 1;
            v62 = v28;
            v63 = v57;
            if (!v61)
            {
              do
              {
                *v63 = *v63 / v58;
                v63 = (float *)((char *)v63 + v29);
                --v62;
              }
              while (v62);
            }
          }
          ++v56;
          ++v57;
        }
        while (v56 != a1);
      }
      v64 = a1;
      if (a2 < 1)
        break;
      v65 = 0;
      v66 = 0;
      v137 = 1;
      v67 = &a9->f32[2];
      do
      {
        if (a1 < 4)
        {
          v80 = 0;
          v69 = 0uLL;
          v12.i32[0] = 0;
        }
        else
        {
          v68 = 0;
          v12.i32[0] = 0;
          v69 = 0uLL;
          v70 = v67;
          v71 = a4 + 2;
          do
          {
            v72 = v71[-2];
            v73 = v71[-1];
            v74 = *v71;
            v75 = v71[1];
            v71 += 4;
            v76 = *(v70 - 2);
            v77 = *(v70 - 1);
            v78 = *v70;
            v79 = v70[1];
            v70 += 4;
            *(float *)v12.i32 = (float)((float)((float)(*(float *)v12.i32 + v76) + v77) + v78) + v79;
            v69 = vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(v69, vmulq_n_f32(v72, v76)), vmulq_n_f32(v73, v77)), vmulq_n_f32(v74, v78)), vmulq_n_f32(v75, v79));
            v68 -= 4;
          }
          while ((v30 + v68) > 7);
          v80 = -v68;
        }
        if ((int)v80 < a1)
        {
          v81 = &a9->i32[v65 + v80];
          v82 = &a4[v80];
          v83 = a1 - (unint64_t)v80;
          do
          {
            v84 = *v82++;
            v85 = v84;
            v84.i32[0] = *v81++;
            *(float *)v12.i32 = *(float *)v12.i32 + v84.f32[0];
            v69 = vmlaq_n_f32(v69, v85, v84.f32[0]);
            --v83;
          }
          while (v83);
        }
        if (*(float *)v12.i32 == 0.0)
        {
          a5[v66] = v31;
          v86 = a6 + 48 * v66;
          *(_DWORD *)(v86 + 8) = 0;
          *(_QWORD *)v86 = 1065353216;
          *(_DWORD *)(v86 + 24) = 0;
          *(_QWORD *)(v86 + 16) = 0x3F80000000000000;
          *(_DWORD *)(v86 + 40) = 1065353216;
          *(_QWORD *)(v86 + 32) = v31.i64[0];
          v87 = v27 + 48 * v66;
          *(_QWORD *)v87 = 1065353216;
          *(_DWORD *)(v87 + 8) = 0;
          *(_QWORD *)(v87 + 16) = 0x3F80000000000000;
          *(_DWORD *)(v87 + 24) = 0;
          *(_QWORD *)(v87 + 32) = v31.i64[0];
          v88 = 0.0;
          *(_DWORD *)(v87 + 40) = 1065353216;
        }
        else
        {
          v89 = vdivq_f32(v69, (float32x4_t)vdupq_lane_s32(v12, 0));
          if (a1 < 4)
          {
            v110 = 0;
            v95 = 0uLL;
            v94 = 0uLL;
            v91 = 0uLL;
          }
          else
          {
            v90 = 0;
            v91 = 0uLL;
            v92 = v67;
            v93 = a4 + 2;
            v94 = 0uLL;
            v95 = 0uLL;
            do
            {
              v96 = v93[-2];
              v97 = v93[-1];
              v98 = *v93;
              v99 = v93[1];
              v93 += 4;
              v100 = vsubq_f32(v96, v89);
              v101 = vsubq_f32(v97, v89);
              v102 = vsubq_f32(v98, v89);
              v103 = vsubq_f32(v99, v89);
              v104 = vmulq_n_f32(v100, *(v92 - 2));
              v105 = vmulq_n_f32(v101, *(v92 - 1));
              v106 = *v92;
              v107 = v92[1];
              v92 += 4;
              v108 = vmulq_n_f32(v102, v106);
              v109 = vmulq_n_f32(v103, v107);
              v91 = vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(v91, vmulq_n_f32(v100, v104.f32[0])), vmulq_n_f32(v101, v105.f32[0])), vmulq_n_f32(v102, v108.f32[0])), vmulq_n_f32(v103, v109.f32[0]));
              v94 = vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(v94, vmulq_lane_f32(v100, *(float32x2_t *)v104.f32, 1)), vmulq_lane_f32(v101, *(float32x2_t *)v105.f32, 1)), vmulq_lane_f32(v102, *(float32x2_t *)v108.f32, 1)), vmulq_lane_f32(v103, *(float32x2_t *)v109.f32, 1));
              v95 = vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32(v95, vmulq_laneq_f32(v100, v104, 2)), vmulq_laneq_f32(v101, v105, 2)), vmulq_laneq_f32(v102, v108, 2)), vmulq_laneq_f32(v103, v109, 2));
              v90 -= 4;
            }
            while ((v30 + v90) > 7);
            v110 = -v90;
          }
          if ((int)v110 < a1)
          {
            v111 = &a9->i32[v65 + v110];
            v112 = &a4[v110];
            v113 = a1 - (unint64_t)v110;
            do
            {
              v114 = *v112++;
              v115 = vsubq_f32(v114, v89);
              v114.i32[0] = *v111++;
              v116 = vmulq_n_f32(v115, v114.f32[0]);
              v91 = vaddq_f32(v91, vmulq_n_f32(v115, v116.f32[0]));
              v94 = vaddq_f32(v94, vmulq_lane_f32(v115, *(float32x2_t *)v116.f32, 1));
              v95 = vaddq_f32(v95, vmulq_laneq_f32(v115, v116, 2));
              --v113;
            }
            while (v113);
          }
          v117 = vmulq_n_f32(v95, 1.0 / *(float *)v12.i32);
          v118 = (float32x4_t)xmmword_1AA977370;
          v118.i32[3] = v11.i32[3];
          v119 = (float32x4_t)xmmword_1AA977380;
          v119.i32[3] = v10.i32[3];
          v120 = (float32x4_t)xmmword_1AA977390;
          v120.i32[3] = v9.i32[3];
          v151 = v118;
          v156.columns[0] = (simd_float3)vaddq_f32(v118, vmulq_n_f32(v91, 1.0 / *(float *)v12.i32));
          v143 = (float32x4_t)v156.columns[0];
          v149 = v119;
          v156.columns[1] = (simd_float3)vaddq_f32(v119, vmulq_n_f32(v94, 1.0 / *(float *)v12.i32));
          v141 = (float32x4_t)v156.columns[1];
          v147 = v120;
          v156.columns[2] = (simd_float3)vaddq_f32(v120, v117);
          v139 = (float32x4_t)v156.columns[2];
          v145 = *(float *)v12.i32;
          v154 = v89;
          v157 = __invert_f3(v156);
          v88 = v145 / (float)a1;
          v121 = (uint32x4_t)vceqq_f32(v154, a5[v66]);
          v121.i32[3] = v121.i32[2];
          if ((vminvq_u32(v121) & 0x80000000) == 0
            || (v122 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a6 + 48 * v66 + 16), v141), (int8x16_t)vceqq_f32(*(float32x4_t *)(a6 + 48 * v66), v143)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a6 + 48 * v66 + 32), v139)), v122.i32[3] = v122.i32[2], (vminvq_u32(v122) & 0x80000000) == 0)|| v26[v66] != v88)
          {
            v137 = 0;
          }
          a5[v66] = v154;
          v123 = (float32x4_t *)(a6 + 48 * v66);
          *v123 = v143;
          v123[1] = v141;
          v123[2] = v139;
          v124 = v27 + 48 * v66;
          *(_DWORD *)(v124 + 8) = v157.columns[0].i32[2];
          *(_QWORD *)v124 = v157.columns[0].i64[0];
          *(_DWORD *)(v124 + 12) = 0;
          *(_DWORD *)(v124 + 24) = v157.columns[1].i32[2];
          *(_QWORD *)(v124 + 16) = v157.columns[1].i64[0];
          *(_DWORD *)(v124 + 40) = v157.columns[2].i32[2];
          *(_DWORD *)(v124 + 28) = 0;
          *(_QWORD *)(v124 + 32) = v157.columns[2].i64[0];
          v9 = v147;
          v10 = v149;
          v11 = v151;
          *(_DWORD *)(v124 + 44) = 0;
          v28 = v133;
          v64 = a1;
          v31 = 0uLL;
          v32.i64[0] = 0xBF000000BF000000;
          v32.i64[1] = 0xBF000000BF000000;
        }
        v26[v66++] = v88;
        v67 = (float *)((char *)v67 + v29);
        v65 += v64;
      }
      while (v66 != v28);
      ++v126;
    }
    while (!(v137 & 1 | (v126 == a3)));
  }
}

uint64_t ISSegmentationMathUtils_dbscan(int a1, int a2, uint64_t a3, void *__b, float a5)
{
  int v7;
  int v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int Neighbors;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  unint64_t v23;
  void *v24;
  int v25;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int *v32;

  v7 = a1;
  if (a1 >= 1)
    memset_pattern16(__b, &unk_1AA977450, 4 * a1);
  v8 = v7 + 7;
  if (v7 < -7)
    v8 = v7 + 14;
  v28 = (uint64_t)v8 >> 3;
  v9 = malloc_type_calloc(v28, 1uLL, 0x100004077774924uLL);
  v32 = (int *)malloc_type_malloc(4 * v7, 0x100004052888210uLL);
  if (v7 < 1)
  {
    v11 = 0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = v7;
    v29 = v7;
    v27 = v7;
    do
    {
      if (*((_DWORD *)__b + v10) == 0x80000000)
      {
        v13 = (void *)objc_opt_new();
        Neighbors = ISSegmentationMathUtils_dbscan_queryNeighbors(v7, a3, v10, v13, (uint64_t)v9, v32, a5);
        if (Neighbors >= a2)
        {
          if (Neighbors >= 1)
          {
            v15 = 0;
            v16 = Neighbors;
            do
            {
              objc_msgSend(v13, "objectAtIndexedSubscript:", v15, v27);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "intValue");

              v9[v18 / 8] |= 1 << (v18 & 7);
              ++v15;
            }
            while (v16 != v15);
          }
          if (objc_msgSend(v13, "count", v27))
          {
            do
            {
              objc_msgSend(v13, "lastObject");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "intValue");

              objc_msgSend(v13, "removeLastObject");
              v21 = *((_DWORD *)__b + v20);
              if (v21 == 0x80000000)
              {
                *((_DWORD *)__b + v20) = v11;
                v22 = (void *)objc_opt_new();
                if ((int)ISSegmentationMathUtils_dbscan_queryNeighbors(v29, a3, v20, v22, (uint64_t)v9, v32, a5) >= a2)
                {
                  objc_msgSend(v13, "addObjectsFromArray:", v22);
                  if (objc_msgSend(v22, "count"))
                  {
                    v23 = 0;
                    do
                    {
                      objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = objc_msgSend(v24, "intValue");

                      v9[v25 / 8] |= 1 << (v25 & 7);
                      ++v23;
                    }
                    while (objc_msgSend(v22, "count") > v23);
                  }
                }

              }
              else if (v21 == -1)
              {
                *((_DWORD *)__b + v20) = v11;
              }
            }
            while (objc_msgSend(v13, "count"));
          }
          bzero(v9, v28);
          v11 = (v11 + 1);
          v7 = v29;
          v12 = v27;
        }
        else
        {
          *((_DWORD *)__b + v10) = -1;
        }

      }
      ++v10;
    }
    while (v10 != v12);
  }
  free(v9);
  free(v32);
  return v11;
}

uint64_t ISSegmentationMathUtils_dbscan_queryNeighbors(int a1, uint64_t a2, int a3, void *a4, uint64_t a5, int *a6, float a7)
{
  id v13;
  uint64_t v14;
  uint64_t v15;
  float32x4_t v16;
  float v17;
  int *v18;
  float32x4_t v19;
  float32x4_t v20;
  float v21;
  int v22;
  uint64_t v23;
  int v24;
  void *v25;

  v13 = a4;
  if (a1 < 1)
  {
    v15 = 0;
  }
  else
  {
    v14 = 0;
    LODWORD(v15) = 0;
    v16 = *(float32x4_t *)(a2 + 16 * a3);
    v17 = a7 * a7;
    v18 = a6;
    do
    {
      v19 = vsubq_f32(v16, *(float32x4_t *)(a2 + 16 * v14));
      v20 = vmulq_f32(v19, v19);
      v21 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0];
      if (v21 > v17)
        v15 = v15;
      else
        v15 = (v15 + 1);
      if (v21 > v17)
        v22 = 0;
      else
        v22 = v14;
      *v18 = v22;
      v18 += v21 <= v17;
      ++v14;
    }
    while (a1 != v14);
    if ((_DWORD)v15)
    {
      v23 = v15;
      do
      {
        v24 = *a6++;
        if (((*(unsigned __int8 *)(a5 + (v24 >> 3)) >> (v24 & 7)) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v25);

        }
        --v23;
      }
      while (v23);
    }
  }

  return v15;
}

double ISSegmentationMathUtils_luma(float32x4_t a1)
{
  float32x4_t v1;
  double result;

  v1 = vmulq_f32(a1, (float32x4_t)xmmword_1AA9773A0);
  *(_QWORD *)&result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v1, 2), vaddq_f32(v1, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v1.f32, 1))).u64[0];
  return result;
}

double ISSegmentationMathUtils_relativeLuminance(__n128 a1)
{
  __n128 v1;
  float v2;
  unint64_t v3;
  double v4;
  float v5;
  float v6;
  float v7;
  double v8;
  float v9;
  float v10;
  float32x4_t v11;
  float32x4_t v12;
  double result;
  __n128 v14;
  float v15;
  __n128 v16;

  v1 = a1;
  a1.n128_f64[0] = a1.n128_f32[0];
  v14 = v1;
  if (a1.n128_f64[0] <= 0.04045)
  {
    a1.n128_f64[0] = a1.n128_f64[0] / 12.92;
    a1.n128_f32[0] = a1.n128_f64[0];
    v16 = a1;
  }
  else
  {
    v2 = (a1.n128_f64[0] + 0.055) / 1.055;
    *(float *)&v3 = powf(v2, 2.4);
    v1 = v14;
    v16.n128_u64[0] = v3;
  }
  v4 = v1.n128_f32[1];
  if (v1.n128_f32[1] <= 0.04045)
  {
    v7 = v4 / 12.92;
  }
  else
  {
    v5 = (v4 + 0.055) / 1.055;
    v6 = powf(v5, 2.4);
    v1.n128_u32[2] = v14.n128_u32[2];
    v7 = v6;
  }
  v8 = v1.n128_f32[2];
  if (v1.n128_f32[2] <= 0.04045)
  {
    v10 = v8 / 12.92;
  }
  else
  {
    v9 = (v8 + 0.055) / 1.055;
    v15 = v7;
    v10 = powf(v9, 2.4);
    v7 = v15;
  }
  v11 = (float32x4_t)v16;
  v11.f32[1] = v7;
  v11.f32[2] = v10;
  v12 = vmulq_f32(v11, (float32x4_t)xmmword_1AA9773A0);
  *(_QWORD *)&result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).u64[0];
  return result;
}

float ISSegmentationMathUtils_contrastRatio(__n128 a1, __n128 a2)
{
  double v2;
  float v3;
  double v4;

  v2 = ISSegmentationMathUtils_relativeLuminance(a1);
  v3 = *(float *)&v2;
  v4 = ISSegmentationMathUtils_relativeLuminance(a2);
  return (fmaxf(v3, *(float *)&v4) + 0.05) / (fminf(v3, *(float *)&v4) + 0.05);
}

__n64 ISSegmentationMathUtils_rgb2hsv(int32x4_t a1)
{
  float32x4_t v1;
  int8x16_t v2;
  float32x4_t v3;
  float32x4_t v4;
  int8x16_t v5;
  int8x16_t v6;
  float32x4_t v7;
  float v8;
  __n64 result;

  v1 = (float32x4_t)vdupq_laneq_s32(a1, 2);
  v2 = (int8x16_t)vcgtq_f32(v1, (float32x4_t)a1);
  v1.i32[1] = a1.i32[1];
  v1.i64[1] = COERCE_UNSIGNED_INT(-1.0) | 0x3F2AAAAB00000000;
  v3.i32[0] = vdupq_lane_s32(*(int32x2_t *)a1.i8, 1).u32[0];
  v3.i32[1] = a1.i32[2];
  v3.i64[1] = 0xBEAAAAAB00000000;
  v4 = vmlaq_n_f32(v1, vsubq_f32(v3, v1), (float)(vmovn_s32((int32x4_t)vmvnq_s8(v2)).i8[2] & 1));
  v5 = vextq_s8(vextq_s8((int8x16_t)v4, (int8x16_t)v4, 0xCuLL), (int8x16_t)v4, 8uLL);
  v6 = (int8x16_t)vcgtq_f32(v4, (float32x4_t)a1);
  v4.i64[1] = __PAIR64__(a1.u32[0], v4.u32[3]);
  v7 = vmlaq_n_f32(v4, vsubq_f32((float32x4_t)vextq_s8(vextq_s8(v5, (int8x16_t)a1, 4uLL), v5, 0xCuLL), v4), (float)(vmovn_s32((int32x4_t)vmvnq_s8(v6)).u8[0] & 1));
  *(float *)v6.i32 = v7.f32[0] - fminf(v7.f32[3], v7.f32[1]);
  v8 = (float)(v7.f32[3] - v7.f32[1]) / (*(float *)v6.i32 * 6.0 + 0.0000999999975) + v7.f32[2];
  result.n64_f32[0] = fabsf(v8);
  result.n64_f32[1] = *(float *)v6.i32 / (float)(v7.f32[0] + 0.0001);
  return result;
}

double ISSegmentationMathUtils_hsv2rgb(float32x4_t a1)
{
  float32x4_t v1;
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v10;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  double result;

  v1 = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)a1.f32, 0), (float32x4_t)xmmword_1AA9773B0);
  v2 = v1;
  v2.i32[3] = 0;
  v3 = vsubq_f32(v1, vrndmq_f32(v2));
  v3.i32[3] = 0;
  __asm
  {
    FMOV            V2.4S, #6.0
    FMOV            V3.4S, #-3.0
  }
  v10 = vabsq_f32(vmlaq_f32(_Q3, _Q2, vminnmq_f32(v3, (float32x4_t)xmmword_1AA9773C0)));
  __asm { FMOV            V2.4S, #-1.0 }
  v12 = vaddq_f32(v10, _Q2);
  v12.i32[3] = 0;
  v13 = vmaxnmq_f32(v12, (float32x4_t)0);
  v13.i32[3] = 0;
  v14 = vaddq_f32(vminnmq_f32(v13, (float32x4_t)xmmword_1AA977320), _Q2);
  __asm { FMOV            V2.4S, #1.0 }
  *(_QWORD *)&result = vmulq_laneq_f32(vmlaq_lane_f32(_Q2, v14, *(float32x2_t *)a1.f32, 1), a1, 2).u64[0];
  return result;
}

double ISSegmentationMathUtils_rgb2xyz(__n128 a1)
{
  __n128 v1;
  double v2;
  float v3;
  float v4;
  double v5;
  float v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  double result;
  __n128 v13;
  float v14;
  float v15;

  v1 = a1;
  v2 = a1.n128_f32[0];
  v13 = v1;
  if (v2 <= 0.04045)
  {
    v4 = v2 / 12.92;
  }
  else
  {
    v3 = (v2 + 0.055) / 1.055;
    v4 = powf(v3, 2.4);
    v1 = v13;
  }
  v15 = v4;
  v5 = v1.n128_f32[1];
  if (v1.n128_f32[1] <= 0.04045)
  {
    v8 = v5 / 12.92;
  }
  else
  {
    v6 = (v5 + 0.055) / 1.055;
    v7 = powf(v6, 2.4);
    v1.n128_u32[2] = v13.n128_u32[2];
    v8 = v7;
  }
  v9 = v1.n128_f32[2];
  if (v1.n128_f32[2] <= 0.04045)
  {
    v11 = v9 / 12.92;
  }
  else
  {
    v10 = (v9 + 0.055) / 1.055;
    v14 = v8;
    v11 = powf(v10, 2.4);
    v8 = v14;
  }
  *(_QWORD *)&result = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)xmmword_1AA9773D0, v15), (float32x4_t)xmmword_1AA9773E0, v8), (float32x4_t)xmmword_1AA9773F0, v11).u64[0];
  return result;
}

double ISSegmentationMathUtils_xyz2lab(float32x4_t a1)
{
  float32x4_t v1;
  float v2;
  float v3;
  float v4;
  float v5;
  double v6;
  float32x4_t v8;

  v1 = vmulq_f32(a1, (float32x4_t)xmmword_1AA977400);
  v8 = v1;
  if (v1.f32[0] <= 0.008856)
  {
    v3 = v1.f32[0] * 7.787 + 0.137931034;
  }
  else
  {
    v2 = powf(v1.f32[0], 0.33333);
    v1 = v8;
    v3 = v2;
  }
  if (v1.f32[1] <= 0.008856)
  {
    v5 = v1.f32[1] * 7.787 + 0.137931034;
  }
  else
  {
    v4 = powf(v1.f32[1], 0.33333);
    v1.i32[2] = v8.i32[2];
    v5 = v4;
  }
  if (v1.f32[2] > 0.008856)
    powf(v1.f32[2], 0.33333);
  *(float *)&v6 = v5 * 116.0 + -16.0;
  *((float *)&v6 + 1) = (float)(v3 - v5) * 500.0;
  return v6;
}

double ISSegmentationMathUtils_rgb2lab(__n128 a1)
{
  float32x4_t v1;

  *(double *)v1.i64 = ISSegmentationMathUtils_rgb2xyz(a1);
  return ISSegmentationMathUtils_xyz2lab(v1);
}

double ISSegmentationMathUtils_lab2xyz(__n128 _Q0, float32x4_t a2)
{
  float v2;
  float v11;
  float v12;
  double result;

  v2 = (_Q0.n128_f32[0] + 16.0) * 0.00862068962;
  _S2 = 990057071;
  __asm { FMLA            S1, S2, V0.S[1] }
  _S5 = -1146890486;
  if (_S1 <= 0.206897)
    a2.f32[0] = (_S1 + -0.137931034) / 7.787;
  else
    a2.f32[0] = _S1 * (float)(_S1 * _S1);
  __asm { FMLA            S4, S5, V0.S[2] }
  if (v2 <= 0.206897)
    v11 = (v2 + -0.137931034) / 7.787;
  else
    v11 = (float)(v2 * v2) * v2;
  if (_S4 <= 0.206897)
    v12 = (_S4 + -0.137931034) / 7.787;
  else
    v12 = _S4 * (float)(_S4 * _S4);
  a2.f32[1] = v11;
  a2.f32[2] = v12;
  *(_QWORD *)&result = vmulq_f32(a2, (float32x4_t)xmmword_1AA977410).u64[0];
  return result;
}

float32x2_t ISSegmentationMathUtils_xyz2rgb(float32x4_t a1)
{
  float32x4_t v1;
  long double v2;
  long double v3;
  double v4;
  float64x2_t v5;
  double v7;
  float32x4_t v8;
  double v9;

  v1 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1AA977420, a1.f32[0]), (float32x4_t)xmmword_1AA977430, *(float32x2_t *)a1.f32, 1), (float32x4_t)xmmword_1AA977440, a1, 2);
  v2 = v1.f32[0];
  v8 = v1;
  if (v1.f32[0] <= 0.0031308)
  {
    v7 = v2 * 12.92;
  }
  else
  {
    v7 = pow(v2, 0.416666667) * 1.055 + -0.055;
    v1 = v8;
  }
  v3 = v1.f32[1];
  if (v1.f32[1] <= 0.0031308)
  {
    v4 = v3 * 12.92;
  }
  else
  {
    v4 = pow(v3, 0.416666667) * 1.055 + -0.055;
    v1.i32[2] = v8.i32[2];
  }
  if (v1.f32[2] > 0.0031308)
  {
    v9 = v4;
    pow(v1.f32[2], 0.416666667);
    v4 = v9;
  }
  v5.f64[0] = v7;
  v5.f64[1] = v4;
  return vcvt_f32_f64(v5);
}

float32x2_t ISSegmentationMathUtils_lab2rgb(__n128 a1, float32x4_t a2)
{
  float32x4_t v2;

  *(double *)v2.i64 = ISSegmentationMathUtils_lab2xyz(a1, a2);
  return ISSegmentationMathUtils_xyz2rgb(v2);
}

float ISSegmentationMathUtils_chi2cdf(float a1, float a2)
{
  double v3;
  float v4;
  float v5;
  int v6;
  float v7;
  float v8;

  v3 = a1 * 0.5;
  v4 = v3;
  v5 = powf(a2 * 0.5, v4);
  v6 = 0;
  v7 = 0.0;
  do
  {
    v8 = (float)v6;
    if (v6)
      v5 = v5 * (float)((float)-(float)(a2 * 0.5) / v8);
    v7 = v7 + (float)(v5 / (float)(v4 + v8));
    ++v6;
  }
  while (v6 != 25);
  return v7 / tgamma(v3);
}

float ISSegmentationMathUtils_chi2cdf3(float a1)
{
  unsigned int v1;
  float result;

  v1 = (int)(float)(a1 * 200.0);
  if ((v1 & 0x80000000) != 0)
    return 0.0;
  result = 1.0;
  if (v1 <= 0xF9F)
    return ISSegmentationMathUtils_chi2cdf3_values[v1];
  return result;
}

id colorsFromGraphicSymbolRecipe(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    objc_msgSend(v3, "_IF_arrayForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v3, "_IF_stringForKey:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
      {
        v27[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
    v18 = v4;
    v19 = v3;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v10)
    {
      v11 = v10;
      v8 = 0;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          _ISColorForString(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            if (!v8)
              v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v8, "addObject:", v15, v18, v19);
          }
          else
          {
            _ISDefaultLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v25 = v14;
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v11);
    }
    else
    {
      v8 = 0;
    }

    v4 = v18;
    v3 = v19;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

__CFString *nameFromGraphicSymbolRecipe(void *a1)
{
  id v1;
  __CFString *v2;
  __CFString *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "_IF_stringForKey:", CFSTR("ISSymbolName"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || !-[__CFString length](v2, "length"))
  {
    _ISDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v1;
      _os_log_impl(&dword_1AA928000, v4, OS_LOG_TYPE_INFO, "Failed to find name for graphic variant. Dict: %@", (uint8_t *)&v10, 0xCu);
    }

    v3 = CFSTR("questionmark.app.dashed");
  }
  if (!-[__CFString caseInsensitiveCompare:](v3, "caseInsensitiveCompare:", CFSTR("ISCurrentDevice")))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeOfCurrentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ISSymbol symbolForTypeIdentifier:error:](ISSymbol, "symbolForTypeIdentifier:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "name");
      v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("questionmark.app.dashed");
    }

    v3 = (__CFString *)v8;
  }

  return v3;
}

uint64_t rendingModeFromGraphicSymbolRecipe(void *a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_IF_stringForKey:", CFSTR("ISRenderingMode"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    if (!objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("automatic")))
    {
      v4 = 1;
      goto LABEL_14;
    }
    if (!objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("hierarchical")))
    {
      v4 = 2;
      goto LABEL_14;
    }
    if (!objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("monochrome")))
    {
      v4 = 3;
      goto LABEL_14;
    }
    if (!objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("multicolor")))
    {
      v4 = 4;
      goto LABEL_14;
    }
    _ISDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v2;
    }

  }
  v4 = 0;
LABEL_14:

  return v4;
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t _ISPrimaryIconDataForApplicationProxy(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "__IS_iconDataForVariant:preferredIconName:withOptions:", a2, *MEMORY[0x1E0CA57D0], a3);
}

void _ISInvalidateCacheEntriesForBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = a1;
  +[ISIconManager sharedInstance](ISIconManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_16);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "clearCachedItemsForBundeID:reply:", v1, &__block_literal_global_3_0);
}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id legacyResourceNames()
{
  if (legacyResourceNames_onceToken != -1)
    dispatch_once(&legacyResourceNames_onceToken, &__block_literal_global_18);
  return (id)legacyResourceNames_names;
}

void __legacyResourceNames_block_invoke()
{
  void *v0;

  v0 = (void *)legacyResourceNames_names;
  legacyResourceNames_names = (uint64_t)&unk_1E5816568;

}

id expandedNamesFromResourceNames(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    v20 = v3;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "pathExtension");
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (-[__CFString length](v9, "length"))
          {
            objc_msgSend(v8, "stringByDeletingPathExtension");
            v10 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {

            v10 = v8;
            v9 = CFSTR("png");
          }
          if (v9)
            v11 = v10 == 0;
          else
            v11 = 1;
          if (!v11)
          {
            objc_msgSend(v10, "stringByAppendingPathExtension:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v2, "addObject:", v12);
            if ((objc_msgSend(v10, "hasSuffix:", CFSTR("2x")) & 1) == 0
              && (objc_msgSend(v10, "hasSuffix:", CFSTR("3x")) & 1) == 0)
            {
              objc_msgSend(v10, "stringByAppendingString:", CFSTR("@2x"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "stringByAppendingPathExtension:", v9);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (v14)
                objc_msgSend(v2, "addObject:", v14);
              objc_msgSend(v10, "stringByAppendingString:", CFSTR("@3x"));
              v15 = v2;
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringByAppendingPathExtension:", v9);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              v2 = v15;
              if (v17)
                objc_msgSend(v15, "addObject:", v17);

              v3 = v20;
            }

          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t _CGPathCreateContinuousRoundedRectCornerRadius(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  CGPath *Mutable;
  double v11;
  double v12;
  int v13;
  int v14;
  double v15;
  int v16;
  int v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  double v22;
  int v23;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  uint64_t v32;
  double v34;
  double x;
  double MinX;
  double v37;
  double MaxY;
  double v39;
  double MinY;
  double MaxX;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  Mutable = CGPathCreateMutable();
  v11 = a5 * 1.528665;
  v12 = v11 + v11;
  if (v11 + v11 >= a3)
    v13 = 1;
  else
    v13 = 3;
  if (v11 + v11 < a3)
    v14 = 3;
  else
    v14 = 2;
  v15 = a4 * 0.5;
  if (v12 < a4)
    v15 = a5 * 1.528665;
  v39 = v15;
  if (v12 < a4)
    v16 = v13;
  else
    v16 = v13 & 2;
  if (v12 < a4)
    v17 = v14;
  else
    v17 = v14 & 1;
  v42.origin.x = a1;
  v42.origin.y = a2;
  v42.size.width = a3;
  v42.size.height = a4;
  MinX = CGRectGetMinX(v42);
  v43.origin.x = a1;
  v43.origin.y = a2;
  v43.size.width = a3;
  v43.size.height = a4;
  MinY = CGRectGetMinY(v43);
  v44.origin.x = a1;
  v44.origin.y = a2;
  v44.size.width = a3;
  v44.size.height = a4;
  MaxX = CGRectGetMaxX(v44);
  v45.origin.x = a1;
  v45.origin.y = a2;
  v45.size.width = a3;
  v45.size.height = a4;
  v37 = CGRectGetMinY(v45);
  v46.origin.x = a1;
  v46.origin.y = a2;
  v46.size.width = a3;
  v46.size.height = a4;
  v18 = CGRectGetMinX(v46);
  v47.origin.x = a1;
  v47.origin.y = a2;
  v47.size.width = a3;
  v47.size.height = a4;
  MaxY = CGRectGetMaxY(v47);
  v48.origin.x = a1;
  v48.origin.y = a2;
  v48.size.width = a3;
  v48.size.height = a4;
  v19 = CGRectGetMaxX(v48);
  v49.origin.x = a1;
  v49.origin.y = a2;
  v49.size.width = a3;
  v49.size.height = a4;
  v20 = CGRectGetMaxY(v49);
  v21 = v12 < a3;
  if (v12 < a3)
    v22 = v11;
  else
    v22 = a3 * 0.5;
  v23 = v17 | v16;
  if (v21 || v23 == 0)
  {
    v34 = v18;
    x = v19;
    v25 = v12 < a4 || v23 == 0;
    v28 = v39;
    v27 = MinY;
    v26 = MinX;
    v30 = v37;
    v29 = MaxY;
    if (!v25)
    {
      v27 = MinY + v39 * 0.05;
      v30 = v37 + v39 * 0.05;
      v29 = MaxY - v39 * 0.05;
      v20 = v20 - v39 * 0.05;
    }
  }
  else
  {
    v26 = MinX + v22 * 0.05;
    v27 = MinY;
    MaxX = MaxX - v22 * 0.05;
    v34 = v18 + v22 * 0.05;
    x = v19 - v22 * 0.05;
    v29 = MaxY;
    v28 = v39;
    v30 = v37;
  }
  CGPathMoveToPoint(Mutable, 0, v22 + v26, v27);
  CGPathAddLineToPoint(Mutable, 0, MaxX - v22, v30);
  v31 = v28 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v22 == *MEMORY[0x1E0C9D820];
  if (v31)
  {
    CGPathAddLineToPoint(Mutable, 0, x, v20 - v28);
  }
  else
  {
    _addContinuousCornerToPath(Mutable, 2, v17, v23 == 0, MaxX, v30, v22, v28);
    CGPathAddLineToPoint(Mutable, 0, x, v20 - v28);
    _addContinuousCornerToPath(Mutable, 8, v16, v23 == 0, x, v20, v22, v28);
  }
  CGPathAddLineToPoint(Mutable, 0, v22 + v34, v29);
  if (v31)
  {
    CGPathAddLineToPoint(Mutable, 0, v26, v28 + v27);
  }
  else
  {
    _addContinuousCornerToPath(Mutable, 4, v17, v23 == 0, v34, v29, v22, v28);
    CGPathAddLineToPoint(Mutable, 0, v26, v28 + v27);
    _addContinuousCornerToPath(Mutable, 1, v16, v23 == 0, v26, v27, v22, v28);
  }
  CGPathAddLineToPoint(Mutable, 0, v22 + v26, v27);
  v32 = MEMORY[0x1AF422DA8](Mutable);
  CFRelease(Mutable);
  return v32;
}

void _addContinuousCornerToPath(CGPath *a1, int a2, int a3, int a4, double a5, double a6, double a7, double a8)
{
  char v8;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  __double2 v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGPath *v43;
  CGAffineTransform *p_m;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  double y;
  double endAngle;
  CGAffineTransform m;

  v8 = a3;
  if (a7 >= a8)
    v12 = a8;
  else
    v12 = a7;
  v13 = 0.980263;
  if (a4)
  {
    v13 = 1.0;
    v14 = v12;
  }
  else
  {
    v14 = v12 * 0.95;
  }
  endAngle = v13;
  v15 = 0.0;
  if ((a2 - 1) <= 3)
    v15 = dbl_1AA9770B8[a2 - 1];
  v16 = v14 * (1.0 - v13);
  switch(a3)
  {
    case 2:
      v17 = -v16;
      y = 70.0;
      v18 = *MEMORY[0x1E0C9D538];
      goto LABEL_14;
    case 1:
      v62 = v15 + 20.0;
      v18 = -v16;
      y = 70.0;
      v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      break;
    case 0:
      v17 = -v16;
      y = 90.0;
      v18 = -v16;
LABEL_14:
      v62 = v15;
      break;
    default:
      v62 = v15 + 20.0;
      y = 50.0;
      v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v18 = *MEMORY[0x1E0C9D538];
      v14 = v14 / 1.528665;
      break;
  }
  v19 = _interiorPointForCorner(a2, v18, v17, *MEMORY[0x1E0C9D538]);
  v59 = v20;
  v60 = v19;
  v21 = v14 * 0.33 * 0.666666667;
  v22 = v21 * 1.05304313 + (v14 / 1.05304313 + v21 * 0.33 / 1.05304313) * 0.67;
  v23 = v21 * 1.05304313 + v22;
  v24 = v21 * 1.05304313 + v21 * 1.05304313 + v23;
  v25 = _interiorPointForCorner(a2, 0.0, v22, a5);
  v57 = v26;
  v58 = v25;
  v27 = _interiorPointForCorner(a2, 0.0, v23, a5);
  v55 = v28;
  v56 = v27;
  v29 = _interiorPointForCorner(a2, 0.0, v24, a5);
  v53 = v30;
  v54 = v29;
  v63 = _interiorPointForCorner(a2, v14, v14, a5);
  v32 = v31;
  v33 = _interiorPointForCorner(a2, 0.0, v12, a5);
  v51 = v34;
  v52 = v33;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeTranslation(&m, v60, v59);
  v35 = endAngle * v14;
  if ((v8 & 1) != 0)
  {
    v38 = __sincos_stret((v62 + 0.0) * 0.0174532925);
    v39 = _interiorPointForCorner(a2, v22, 0.0, a5);
    v61 = v40;
    v41 = _interiorPointForCorner(a2, v23, 0.0, a5);
    CGPathAddCurveToPoint(a1, &m, v41, v42, v39, v61, v63 + v35 * v38.__cosval, v32 + v35 * v38.__sinval);
  }
  else
  {
    v36 = _interiorPointForCorner(a2, v12, 0.0, a5);
    CGPathAddCurveToPoint(a1, 0, v36, v37, v36, v37, v36, v37);
  }
  CGPathAddArc(a1, &m, v63, v32, v35, (v62 + 0.0) * 0.0174532925, (y + v62) * 0.0174532925, 0);
  if ((v8 & 2) != 0)
  {
    p_m = &m;
    v43 = a1;
    v46 = v57;
    v45 = v58;
    v48 = v55;
    v47 = v56;
    v50 = v53;
    v49 = v54;
  }
  else
  {
    v43 = a1;
    p_m = 0;
    v46 = v51;
    v45 = v52;
    v47 = v52;
    v48 = v51;
    v49 = v52;
    v50 = v51;
  }
  CGPathAddCurveToPoint(v43, p_m, v45, v46, v47, v48, v49, v50);
}

double _interiorPointForCorner(int a1, double result, double a3, double a4)
{
  double v4;

  switch(a1)
  {
    case 1:
      v4 = a3 + a4;
      goto LABEL_6;
    case 2:
      result = a4 - result;
      break;
    case 4:
      result = result + a4;
      break;
    case 8:
      v4 = a4 - a3;
LABEL_6:
      result = v4;
      break;
    default:
      return result;
  }
  return result;
}

id hintedShadowBlur()
{
  if (hintedShadowBlur_onceToken_0 != -1)
    dispatch_once(&hintedShadowBlur_onceToken_0, &__block_literal_global_103);
  return (id)hintedShadowBlur_value_0;
}

uint64_t __hintedShadowBlur_block_invoke()
{
  ISHintedFloat *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedFloat alloc], "initWithOptions:", 3);
  v1 = (void *)hintedShadowBlur_value_0;
  hintedShadowBlur_value_0 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowBlur_value_0, "addHintedFloat:forSize:", 1.0, 16.0, 16.0);
  return objc_msgSend((id)hintedShadowBlur_value_0, "addHintedFloat:forSize:", 6.0, 512.0, 512.0);
}

id hintedShadowSpread()
{
  if (hintedShadowSpread_onceToken != -1)
    dispatch_once(&hintedShadowSpread_onceToken, &__block_literal_global_104);
  return (id)hintedShadowSpread_value;
}

uint64_t __hintedShadowSpread_block_invoke()
{
  ISHintedFloat *v0;
  void *v1;

  v0 = -[ISHintedValue initWithOptions:]([ISHintedFloat alloc], "initWithOptions:", 3);
  v1 = (void *)hintedShadowSpread_value;
  hintedShadowSpread_value = (uint64_t)v0;

  objc_msgSend((id)hintedShadowSpread_value, "addHintedFloat:forSize:", 0.0, 16.0, 16.0);
  return objc_msgSend((id)hintedShadowSpread_value, "addHintedFloat:forSize:", 2.0, 512.0, 512.0);
}

void sub_1AA95ADE4(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    _ISDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[ISIconResourceLocator initWithCoder:].cold.1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

    objc_end_catch();
    JUMPOUT(0x1AA95ADA8);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ISIsResourceKey(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = ISIsResourceKey_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ISIsResourceKey_onceToken, &__block_literal_global_22);
  v3 = objc_msgSend((id)ISIsResourceKey_resourceKeys, "containsObject:", v2);

  return v3;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

__CFData *ISCreateCGImageMaskUchar(int a1, int a2, uint64_t a3)
{
  size_t v5;
  CFIndex v6;
  __CFData *result;
  __CFData *v8;
  UInt8 *MutableBytePtr;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGDataProvider *v13;
  CGImageRef v14;

  LODWORD(v5) = a1;
  v6 = a2 * a1;
  result = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6);
  if (result)
  {
    v8 = result;
    CFDataSetLength(result, v6);
    MutableBytePtr = CFDataGetMutableBytePtr(v8);
    if ((int)v5 <= 0)
    {
      v5 = (int)v5;
    }
    else
    {
      v10 = 0;
      v5 = v5;
      do
      {
        if (a2 >= 1)
        {
          v11 = 0;
          v12 = a2;
          do
          {
            MutableBytePtr[v11] = ~*(_BYTE *)(a3 + v11);
            v11 += v5;
            --v12;
          }
          while (v12);
        }
        ++v10;
        ++a3;
        ++MutableBytePtr;
      }
      while (v10 != v5);
    }
    v13 = CGDataProviderCreateWithCFData(v8);
    v14 = CGImageMaskCreate(v5, a2, 8uLL, 8uLL, v5, v13, 0, 0);
    CGDataProviderRelease(v13);
    CFRelease(v8);
    return v14;
  }
  return result;
}

__CFData *ISCreateCGImageMaskUchar4LastComponent(int a1, int a2, uint64_t a3)
{
  CFIndex v6;
  __CFData *result;
  __CFData *v8;
  UInt8 *MutableBytePtr;
  uint64_t v10;
  size_t v11;
  _BYTE *v12;
  uint64_t v13;
  UInt8 *v14;
  _BYTE *v15;
  CGDataProvider *v16;
  CGImageRef v17;

  v6 = a2 * a1;
  result = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6);
  if (result)
  {
    v8 = result;
    CFDataSetLength(result, v6);
    MutableBytePtr = CFDataGetMutableBytePtr(v8);
    if (a1 <= 0)
    {
      v11 = a1;
    }
    else
    {
      v10 = 0;
      v11 = a1;
      v12 = (_BYTE *)(a3 + 3);
      do
      {
        v13 = a2;
        v14 = MutableBytePtr;
        v15 = v12;
        if (a2 >= 1)
        {
          do
          {
            *v14 = ~*v15;
            v15 += 4 * a1;
            v14 += a1;
            --v13;
          }
          while (v13);
        }
        ++v10;
        v12 += 4;
        ++MutableBytePtr;
      }
      while (v10 != a1);
    }
    v16 = CGDataProviderCreateWithCFData(v8);
    v17 = CGImageMaskCreate(v11, a2, 8uLL, 8uLL, v11, v16, 0, 0);
    CGDataProviderRelease(v16);
    CFRelease(v8);
    return v17;
  }
  return result;
}

__CFData *ISCreateCGImageUchar4AlphaPremultiplied(int a1, int a2, uint64_t a3)
{
  CFIndex v6;
  __CFData *result;
  __CFData *v8;
  UInt8 *MutableBytePtr;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  CGColorSpace *v14;
  CGDataProvider *v15;
  CGImageRef v16;

  v6 = 4 * a2 * a1;
  result = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6);
  if (result)
  {
    v8 = result;
    CFDataSetLength(result, v6);
    MutableBytePtr = CFDataGetMutableBytePtr(v8);
    if (a1 <= 0)
    {
      v11 = a1;
    }
    else
    {
      v10 = 0;
      v11 = a1;
      do
      {
        if (a2 >= 1)
        {
          v12 = 0;
          v13 = a2;
          do
          {
            *(_DWORD *)&MutableBytePtr[v12] = *(_DWORD *)(a3 + v12);
            v12 += 4 * a1;
            --v13;
          }
          while (v13);
        }
        ++v10;
        a3 += 4;
        MutableBytePtr += 4;
      }
      while (v10 != a1);
    }
    v14 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v15 = CGDataProviderCreateWithCFData(v8);
    v16 = CGImageCreate(v11, a2, 8uLL, 0x20uLL, 4 * v11, v14, 1u, v15, 0, 0, kCGRenderingIntentDefault);
    CGColorSpaceRelease(v14);
    CGDataProviderRelease(v15);
    CFRelease(v8);
    return v16;
  }
  return result;
}

id _ISURLCacheLog()
{
  if (_ISURLCacheLog_onceToken != -1)
    dispatch_once(&_ISURLCacheLog_onceToken, &__block_literal_global_3_2);
  return (id)_ISURLCacheLog_log;
}

void sub_1AA961BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1AA961C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ISIconCache;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1AA961D44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

CFDictionaryRef CFURLCopyResourcePropertiesForKeys(CFURLRef url, CFArrayRef keys, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1E0C99330](url, keys, error);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1E0C99338](url, key, propertyValueTypeRefPtr, error);
}

CFDataRef CFURLCreateBookmarkDataFromFile(CFAllocatorRef allocator, CFURLRef fileURL, CFErrorRef *errorRef)
{
  return (CFDataRef)MEMORY[0x1E0C99370](allocator, fileURL, errorRef);
}

CFTypeRef CFURLCreateResourcePropertyForKeyFromBookmarkData(CFAllocatorRef allocator, CFStringRef resourcePropertyKey, CFDataRef bookmark)
{
  return (CFTypeRef)MEMORY[0x1E0C993F0](allocator, resourcePropertyKey, bookmark);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1E0C9C5D8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBE8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1E0C9CC98]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1E0C9CD00](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1E0C9CDC0]();
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x1E0C9D280](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D298](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1E0C9D320](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t LIIconOutputScaleForVariant()
{
  return MEMORY[0x1E0D4E3F8]();
}

uint64_t LIIconOutputSizeForVariant()
{
  return MEMORY[0x1E0D4E400]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1E0CA5940](inUTI, inConformsToUTI);
}

CFURLRef UTTypeCopyDeclaringBundleURL(CFStringRef inUTI)
{
  return (CFURLRef)MEMORY[0x1E0CA5958](inUTI);
}

Boolean UTTypeEqual(CFStringRef inUTI1, CFStringRef inUTI2)
{
  return MEMORY[0x1E0CA5988](inUTI1, inUTI2);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CFURLCopyResourcePropertiesForKeysFromCache()
{
  return MEMORY[0x1E0C9A660]();
}

uint64_t _CFURLCopyResourcePropertyForKeyFromCache()
{
  return MEMORY[0x1E0C9A668]();
}

uint64_t _LSCreateDeviceTypeIdentifierWithModelCode()
{
  return MEMORY[0x1E0CA59C0]();
}

uint64_t _UTTypeCopyGlyphName()
{
  return MEMORY[0x1E0CA5A20]();
}

uint64_t _UTTypeCopyIconName()
{
  return MEMORY[0x1E0CA5A28]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x1E0C80B30]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

uint64_t _os_feature_enabled_simple_impl()
{
  return MEMORY[0x1E0C81018]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1E0C82A90]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

int rand_r(unsigned int *a1)
{
  return MEMORY[0x1E0C84FB8](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

long double tgamma(long double __x)
{
  long double result;

  MEMORY[0x1E0C858D0](__x);
  return result;
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C85A08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

vFloat vexpf(vFloat a1)
{
  uint64_t v1;
  uint64_t v2;
  vFloat result;

  v1 = MEMORY[0x1E0C8D888](a1.i64[0], a1.i64[1]);
  result.i64[1] = v2;
  result.i64[0] = v1;
  return result;
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x1E0C85A90](*(_QWORD *)&target_task, source_address, size, dest_address);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

