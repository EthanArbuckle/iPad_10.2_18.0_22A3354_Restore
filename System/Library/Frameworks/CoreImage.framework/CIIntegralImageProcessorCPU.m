@implementation CIIntegralImageProcessorCPU

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v7;
  uint64_t v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  unint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  int v26;
  int v27;
  uint64_t v28;
  float v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  float *v43;
  float v44;
  float v45;
  uint64_t v46;
  unint64_t v47;
  float *v48;
  float *v49;
  float *v50;
  float v51;
  float v52;
  double v53;
  double v54;
  double v55;
  double v56;
  float v57;
  unint64_t v58;
  uint64_t v59;
  float v60;
  size_t v61;
  char *v62;
  char *v63;
  NSObject *v64;
  void *v66;
  uint64_t v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  char *__src;
  unint64_t v74;
  vImage_Buffer dest;
  vImage_Buffer src;
  __int128 v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "objectAtIndex:", 0, a4, a5, a6);
  if (objc_msgSend(v7, "format") != 2312
    && objc_msgSend(v7, "format") != 2056
    && objc_msgSend(v7, "format") != 266
    && objc_msgSend(v7, "format") != 264)
  {
    v64 = ci_logger_filter();
    v24 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
    if (!v24)
      return v24;
    +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:].cold.7(v7);
LABEL_50:
    LOBYTE(v24) = 0;
    return v24;
  }
  if (objc_msgSend(a5, "format") != 2312)
  {
    v23 = ci_logger_filter();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (!v24)
      return v24;
    +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:].cold.6(a5);
    goto LABEL_50;
  }
  v8 = objc_msgSend(a5, "bytesPerRow");
  objc_msgSend(a5, "region");
  v10 = v9;
  __src = (char *)malloc_type_calloc(v8, vcvtps_u32_f32(v10), 0x5D1A6159uLL);
  if (!__src)
  {
    v25 = ci_logger_filter();
    v24 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (!v24)
      return v24;
    +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:].cold.1(a5, v8, v25);
    goto LABEL_50;
  }
  objc_msgSend(v7, "region");
  v12 = v11;
  objc_msgSend(a5, "region");
  if (v12 != v13)
    +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:].cold.2();
  objc_msgSend(v7, "region");
  v15 = v14;
  objc_msgSend(a5, "region");
  if (v15 != v16)
    +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:].cold.3();
  objc_msgSend(v7, "region");
  v18 = v17;
  v19 = vcvtps_u32_f32(v18);
  objc_msgSend(v7, "region");
  v21 = v20;
  v67 = v8;
  if (objc_msgSend(v7, "format") == 2312)
  {
    v22 = 16;
  }
  else
  {
    v26 = objc_msgSend(v7, "format");
    v22 = 4;
    if (v26 == 2056)
      v22 = 8;
  }
  v72 = v22;
  v27 = objc_msgSend(v7, "format", a5);
  if (v19)
  {
    v28 = 0;
    v68 = 0;
    v29 = v21;
    v30 = vcvtps_u32_f32(v29);
    v69 = 2 * (v27 == 266);
    v70 = 2 * (v27 != 266);
    v71 = v7;
    do
    {
      if (v30)
      {
        v31 = 0;
        v32 = v28 * v67;
        v33 = ~v28 + v19;
        v34 = v68 - 1;
        v74 = v67 * v34;
        v35 = 1;
        do
        {
          v36 = objc_msgSend(v7, "baseAddress");
          v37 = objc_msgSend(v7, "bytesPerRow");
          if (v33 >= v19)
            v38 = 0;
          else
            v38 = (_BYTE *)(v36 + v31 * v72 + v37 * v33);
          v77 = 0uLL;
          if (objc_msgSend(v7, "format") == 2056)
          {
            *(_OWORD *)&src.height = xmmword_19248E2C0;
            src.rowBytes = 8;
            dest.data = &v77;
            *(_OWORD *)&dest.height = xmmword_19248E2C0;
            dest.rowBytes = 16;
            src.data = v38;
            vImageConvert_Planar16FtoPlanarF(&src, &dest, 0x10u);
          }
          else if (objc_msgSend(v7, "format") == 266 || objc_msgSend(v7, "format") == 264)
          {
            LOBYTE(v39) = v38[v69];
            *(float *)&v40 = (float)v39 / 255.0;
            LODWORD(v77) = v40;
            LOBYTE(v40) = v38[1];
            *(float *)&v41 = (float)v40 / 255.0;
            DWORD1(v77) = v41;
            LOBYTE(v41) = v38[v70];
            *(float *)&v42 = (float)v41 / 255.0;
            DWORD2(v77) = v42;
            LOBYTE(v42) = v38[3];
            *((float *)&v77 + 3) = (float)v42 / 255.0;
          }
          else
          {
            if (objc_msgSend(v7, "format") != 2312)
              +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:].cold.5();
            v77 = *(_OWORD *)v38;
          }
          v43 = (float *)&__src[16 * v31 + v32];
          v44 = v43[1];
          *v43 = *(float *)&v77 + *v43;
          v43[1] = *((float *)&v77 + 1) + v44;
          v45 = v43[3];
          v46 = 16 * v31;
          v43[2] = *((float *)&v77 + 2) + v43[2];
          v43[3] = *((float *)&v77 + 3) + v45;
          v47 = v35 - 2;
          if (v47 >= v30)
            v48 = 0;
          else
            v48 = (float *)&__src[16 * v47 + v32];
          addPixel<float>(v43, v48);
          if (v34 >= v19)
            v49 = 0;
          else
            v49 = (float *)&__src[v46 + v74];
          addPixel<float>(v43, v49);
          if (v34 < v19 && v47 < v30)
          {
            v50 = (float *)&__src[16 * v35 - 32 + v74];
            v51 = v43[1];
            *v43 = *v43 - *v50;
            v43[1] = v51 - v50[1];
            v52 = v43[3];
            v43[2] = v43[2] - v50[2];
            v43[3] = v52 - v50[3];
          }
          v31 = v35++;
          v7 = v71;
        }
        while (v31 < v30);
      }
      v28 = ++v68;
    }
    while (v68 < v19);
  }
  objc_msgSend(v66, "region");
  v54 = v53;
  objc_msgSend(v66, "region");
  v56 = v55;
  if (objc_msgSend(v66, "format") != 2312)
    +[CIIntegralImageProcessorCPU processWithInputs:arguments:output:error:].cold.4();
  v57 = v54;
  v58 = vcvtps_u32_f32(v57);
  v59 = objc_msgSend(v66, "baseAddress");
  if (v58)
  {
    v60 = v56;
    v61 = 16 * vcvtps_u32_f32(v60);
    v62 = (char *)(v59 + v67 * (v58 - 1));
    v63 = __src;
    do
    {
      memcpy(v62, v63, v61);
      v63 += v67;
      v62 -= v67;
      --v58;
    }
    while (v58);
  }
  free(__src);
  LOBYTE(v24) = 1;
  return v24;
}

+ (int)outputFormat
{
  return 2312;
}

+ (BOOL)canReduceOutputChannels
{
  return 1;
}

+ (void)processWithInputs:(NSObject *)a3 arguments:output:error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  double v5;
  float v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "region");
  v6 = v5;
  v8 = 136446466;
  v9 = "integral_image_manual";
  v10 = 2048;
  v11 = a2 * (int)vcvtps_s32_f32(v6);
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, a3, v7, "%{public}s Could not allocate %lu bytes of memory", (uint8_t *)&v8);
  OUTLINED_FUNCTION_2();
}

+ (void)processWithInputs:arguments:output:error:.cold.2()
{
  __assert_rtn("integral_image_manual", "CIIntegralImage.mm", 185, "input.region.size.width == output.region.size.width");
}

+ (void)processWithInputs:arguments:output:error:.cold.3()
{
  __assert_rtn("integral_image_manual", "CIIntegralImage.mm", 186, "input.region.size.height == output.region.size.height");
}

+ (void)processWithInputs:arguments:output:error:.cold.4()
{
  __assert_rtn("integral_image_manual", "CIIntegralImage.mm", 206, "false");
}

+ (void)processWithInputs:arguments:output:error:.cold.5()
{
  __assert_rtn("compute_integral_image", "CIIntegralImage.mm", 151, "0");
}

+ (void)processWithInputs:(void *)a1 arguments:output:error:.cold.6(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "format");
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1_5(&dword_1921E4000, v1, v2, "%{public}s Output format not supported: %d", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)processWithInputs:(void *)a1 arguments:output:error:.cold.7(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "format");
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1_5(&dword_1921E4000, v1, v2, "%{public}s Input format not supported: %d", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

@end
