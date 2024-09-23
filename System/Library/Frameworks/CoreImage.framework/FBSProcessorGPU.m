@implementation FBSProcessorGPU

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  float v18;
  unsigned int v19;
  void *v20;
  void *v21;
  CIBilateralSolverGPU *v22;
  CIBilateralGridHash *v23;
  uint64_t v24;
  NSObject *v25;
  __IOSurface *v26;
  void *v27;
  size_t Width;
  void *v29;
  void *v30;
  double v31;
  float64x2_t v32;
  float64_t v33;
  double v34;
  float64x2_t v35;
  float64_t v36;
  double v37;
  float64x2_t v38;
  float64_t v39;
  double v40;
  float64x2_t v41;
  float64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  float64_t v48;
  float64_t v49;
  int32x2_t v50;
  float64_t v51;
  int32x2_t v52;
  float64_t v53;
  int32x2_t v54;
  void *v55;
  unsigned int v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  __int16 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("fullROI")), "CGRectValue");
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputMaxNumVertices")), "intValue");
  v14 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputSigmaS")), "intValue");
  v15 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputSigmaRLuma")), "intValue");
  v16 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputSigmaRChroma")), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputLambda")), "floatValue");
  v18 = v17;
  v19 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputMaxNumIterations")), "intValue");
  if (v13 <= 1000)
    +[FBSProcessorGPU processWithInputs:arguments:output:error:].cold.1();
  if (!(_DWORD)v14)
    +[FBSProcessorGPU processWithInputs:arguments:output:error:].cold.2();
  if (!(_DWORD)v15)
    +[FBSProcessorGPU processWithInputs:arguments:output:error:].cold.3();
  if (!(_DWORD)v16)
    +[FBSProcessorGPU processWithInputs:arguments:output:error:].cold.4();
  if (v18 == 0.0)
    +[FBSProcessorGPU processWithInputs:arguments:output:error:].cold.5();
  if (!v19)
    +[FBSProcessorGPU processWithInputs:arguments:output:error:].cold.6();
  v56 = v19;
  v20 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v55 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 2);
  v22 = -[CIBilateralSolverGPU initWithWidth:height:maxVertices:commandBuffer:]([CIBilateralSolverGPU alloc], "initWithWidth:height:maxVertices:commandBuffer:", (unint64_t)v10, (unint64_t)v12, v13, objc_msgSend(a5, "metalCommandBuffer"));
  v23 = -[CIBilateralGridHash initWithWidth:height:maxHashTableSize:]([CIBilateralGridHash alloc], "initWithWidth:height:maxHashTableSize:", (unint64_t)v10, (unint64_t)v12, v13);
  v24 = objc_msgSend(v20, "surface");
  objc_msgSend(v20, "region");
  if (-[CIBilateralGridHash createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:](v23, "createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:", v24, v14, v15, v16))
  {
    v25 = ci_logger_performance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      v58 = "+[FBSProcessorGPU processWithInputs:arguments:output:error:]";
      _os_log_impl(&dword_1921E4000, v25, OS_LOG_TYPE_INFO, "%{public}s Returning disparity image; unable to create 3D bilateral grid hash. Please file a radar.",
        buf,
        0xCu);
    }
  }
  v26 = (__IOSurface *)objc_msgSend(v20, "surface");
  v27 = (void *)objc_msgSend((id)objc_msgSend(a5, "metalCommandBuffer"), "device");
  Width = IOSurfaceGetWidth(v26);
  v29 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, Width, IOSurfaceGetHeight(v26), 0);
  objc_msgSend(v29, "setUsage:", 23);
  v30 = (void *)objc_msgSend(v27, "newTextureWithDescriptor:iosurface:plane:", v29, v26, 0);
  objc_msgSend(v20, "region");
  v53 = v31;
  objc_msgSend(v20, "region");
  v32.f64[0] = v53;
  v32.f64[1] = v33;
  v54 = vmovn_s64(vcvtq_s64_f64(vnegq_f64(v32)));
  objc_msgSend(v55, "region");
  v51 = v34;
  objc_msgSend(v55, "region");
  v35.f64[0] = v51;
  v35.f64[1] = v36;
  v52 = vmovn_s64(vcvtq_s64_f64(vnegq_f64(v35)));
  objc_msgSend(v21, "region");
  v49 = v37;
  objc_msgSend(v21, "region");
  v38.f64[0] = v49;
  v38.f64[1] = v39;
  v50 = vmovn_s64(vcvtq_s64_f64(vnegq_f64(v38)));
  objc_msgSend(a5, "region");
  v48 = v40;
  objc_msgSend(a5, "region");
  v41.f64[0] = v48;
  v41.f64[1] = v42;
  *(int32x2_t *)&v41.f64[0] = vmovn_s64(vcvtq_s64_f64(vnegq_f64(v41)));
  *(_WORD *)&buf[2] = v54.i16[2];
  *(_WORD *)buf = v54.i16[0];
  WORD1(v58) = v52.i16[2];
  LOWORD(v58) = v52.i16[0];
  HIWORD(v58) = v50.i16[2];
  WORD2(v58) = v50.i16[0];
  v60 = WORD2(v41.f64[0]);
  v59 = LOWORD(v41.f64[0]);
  v43 = objc_msgSend(v21, "metalTexture");
  v44 = objc_msgSend(v55, "metalTexture");
  v45 = objc_msgSend(a5, "metalTexture");
  *(float *)&v46 = v18;
  -[CIBilateralSolverGPU doSolveWithBilateralGridhash:reference:disparity:confidence:output:lambda:maxIterations:offsets:](v22, "doSolveWithBilateralGridhash:reference:disparity:confidence:output:lambda:maxIterations:offsets:", v23, v30, v43, v44, v45, v56, v46, buf);

  return 1;
}

+ (void)processWithInputs:arguments:output:error:.cold.1()
{
  __assert_rtn("+[FBSProcessorGPU processWithInputs:arguments:output:error:]", "CIFastBilateralSolver.m", 718, "kMaxVertices > 1000");
}

+ (void)processWithInputs:arguments:output:error:.cold.2()
{
  __assert_rtn("+[FBSProcessorGPU processWithInputs:arguments:output:error:]", "CIFastBilateralSolver.m", 719, "kSigmaS");
}

+ (void)processWithInputs:arguments:output:error:.cold.3()
{
  __assert_rtn("+[FBSProcessorGPU processWithInputs:arguments:output:error:]", "CIFastBilateralSolver.m", 720, "kSigmaRLuma");
}

+ (void)processWithInputs:arguments:output:error:.cold.4()
{
  __assert_rtn("+[FBSProcessorGPU processWithInputs:arguments:output:error:]", "CIFastBilateralSolver.m", 721, "kSigmaRChroma");
}

+ (void)processWithInputs:arguments:output:error:.cold.5()
{
  __assert_rtn("+[FBSProcessorGPU processWithInputs:arguments:output:error:]", "CIFastBilateralSolver.m", 722, "kLambda");
}

+ (void)processWithInputs:arguments:output:error:.cold.6()
{
  __assert_rtn("+[FBSProcessorGPU processWithInputs:arguments:output:error:]", "CIFastBilateralSolver.m", 723, "kMaxIterations");
}

@end
