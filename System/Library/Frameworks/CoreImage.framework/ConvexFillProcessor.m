@implementation ConvexFillProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  double v19;
  int v20;
  double v21;
  int v22;
  int v23;
  int v24;
  unint64_t v25;
  NSObject *v26;
  int v27;
  int v28;
  unsigned __int8 *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  unsigned __int8 *v35;
  int v36;
  uint64_t v37;
  unint64_t v38;
  int v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  unint64_t v53;
  unsigned __int8 *v54;
  unsigned __int8 *v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  vImage_Buffer dest;
  vImage_Buffer src;
  float v61[4];
  uint64_t v62;
  CGPoint v63;
  CGPoint v64;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4, a5, a6);
  v10 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 1);
  objc_msgSend(v9, "format");
  objc_msgSend(v10, "format");
  objc_msgSend(a5, "format");
  objc_msgSend(a5, "region");
  v12 = v11;
  objc_msgSend(a5, "region");
  v14 = v13;
  clearOutput(a5);
  *(_OWORD *)&src.height = xmmword_19248E2C0;
  src.rowBytes = 8;
  dest.data = v61;
  *(_OWORD *)&dest.height = xmmword_19248E2C0;
  dest.rowBytes = 16;
  src.data = (void *)objc_msgSend(v10, "baseAddress");
  vImageConvert_Planar16FtoPlanarF(&src, &dest, 0x10u);
  v15 = roundf(v61[0]);
  v16 = roundf(v61[1]);
  objc_msgSend(v9, "region");
  v18 = (int)(v15 - v17);
  objc_msgSend(v9, "region");
  v20 = (int)(v16 - v19);
  objc_msgSend(v9, "region");
  v22 = (int)(v21 - (double)v20 + -1.0);
  if (v18 <= v22)
    v23 = (int)(v21 - (double)v20 + -1.0);
  else
    v23 = v18;
  v24 = CI_LOG_DUALRED();
  if (v23 <= 0)
  {
    if (v24)
    {
      v42 = ci_logger_api();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        +[ConvexFillProcessor processWithInputs:arguments:output:error:].cold.1();
    }
  }
  else
  {
    v25 = (unint64_t)v14;
    if (v24)
    {
      v26 = ci_logger_api();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        +[ConvexFillProcessor processWithInputs:arguments:output:error:].cold.5();
    }
    v27 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("kThreshold"), (unint64_t)v12), "intValue");
    if ((v27 & ~(v27 >> 31)) >= 0xFF)
      v28 = 255;
    else
      v28 = v27 & ~(v27 >> 31);
    v29 = (unsigned __int8 *)objc_msgSend(v9, "baseAddress");
    v30 = objc_msgSend(a5, "baseAddress");
    v31 = objc_msgSend(v9, "bytesPerRow");
    v32 = objc_msgSend(a5, "bytesPerRow");
    v33 = (double)v18;
    v34 = (double)v22;
    v35 = (unsigned __int8 *)v30;
    v36 = v25;
    v63.x = (double)v18;
    v63.y = (double)v22;
    v37 = convexFill(v29, v35, v25, v58, v31, v32, v28, v63);
    if (v37)
    {
      v38 = v37;
      v39 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("kAreaThresholdHi")), "intValue");
      v40 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("kAreaThresholdLo")), "intValue");
      if (v38 <= v39)
      {
        if (v38 >= v40)
        {
          v53 = (int)objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("kSplatArea")), "intValue");
          v54 = (unsigned __int8 *)objc_msgSend(v9, "baseAddress");
          v55 = (unsigned __int8 *)objc_msgSend(a5, "baseAddress");
          v56 = objc_msgSend(v9, "bytesPerRow");
          v57 = objc_msgSend(a5, "bytesPerRow");
          v64.x = v33;
          v64.y = v34;
          radialSplatR8(v54, v55, v36, v58, v56, v57, v53, v64);
          return 1;
        }
        if (CI_LOG_DUALRED())
        {
          v51 = ci_logger_api();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            +[ConvexFillProcessor processWithInputs:arguments:output:error:].cold.4();
        }
      }
      else if (CI_LOG_DUALRED())
      {
        v41 = ci_logger_api();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          +[ConvexFillProcessor processWithInputs:arguments:output:error:].cold.3();
      }
    }
    else if (CI_LOG_DUALRED())
    {
      v43 = ci_logger_api();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        +[ConvexFillProcessor processWithInputs:arguments:output:error:].cold.2(v43, v44, v45, v46, v47, v48, v49, v50);
    }
    clearOutput(a5);
  }
  return 1;
}

+ (int)outputFormat
{
  return 261;
}

+ (BOOL)canReduceOutputChannels
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3
{
  int *v3;

  if (a3 == 1)
  {
    v3 = &kCIFormatRGBAh;
    return *v3;
  }
  if (!a3)
  {
    v3 = &kCIFormatR8;
    return *v3;
  }
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)result
{
  if (a3 == 1)
  {
    result.origin.x = 0.0;
    result.origin.y = 0.0;
    result.size.width = 1.0;
    result.size.height = 1.0;
  }
  return result;
}

+ (void)processWithInputs:arguments:output:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_12(&dword_1921E4000, v0, v1, "%{public}s [abort] Convex fill failed due to invalid centroid: %d, %d", v2);
  OUTLINED_FUNCTION_4_0();
}

+ (void)processWithInputs:(uint64_t)a3 arguments:(uint64_t)a4 output:(uint64_t)a5 error:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s [abort] Empty seed fill!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)processWithInputs:arguments:output:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_13(&dword_1921E4000, v0, v1, "%{public}s [abort] Convex fill reached upper bound: %zu > %d", v2);
  OUTLINED_FUNCTION_8();
}

+ (void)processWithInputs:arguments:output:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_13(&dword_1921E4000, v0, v1, "%{public}s [abort] Convex fill reached lower bound: %zu < %d", v2);
  OUTLINED_FUNCTION_8();
}

+ (void)processWithInputs:arguments:output:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_12(&dword_1921E4000, v0, v1, "%{public}s Convex fill seeding from (%d,%d)", v2);
  OUTLINED_FUNCTION_4_0();
}

@end
