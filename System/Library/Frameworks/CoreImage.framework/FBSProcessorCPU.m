@implementation FBSProcessorCPU

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  size_t v28;
  uint64_t v29;
  CIBilateralGridHash *v30;
  uint64_t v31;
  NSObject *v32;
  CIBilateralSolverCPU *v33;
  uint64_t v34;
  __CVBuffer *v35;
  double v36;
  char *BaseAddress;
  unint64_t BytesPerRow;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  int v43;
  int v44;
  char *v45;
  size_t v46;
  void *v47;
  size_t v48;
  size_t Height;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  vImagePixelCount v56;
  vImagePixelCount v57;
  double v58;
  double v59;
  size_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  int v70;
  int v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  size_t v76;
  uint64_t v77;
  unsigned int v78;
  char *v79;
  __CVBuffer *v81;
  __CVBuffer *v82;
  __CVBuffer *pixelBuffer;
  size_t v85;
  vImage_Buffer dest;
  vImage_Buffer buf;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("fullROI")), "CGRectValue");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputMaxNumVertices")), "intValue");
  v17 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputSigmaS")), "intValue");
  v18 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputSigmaRLuma")), "intValue");
  v19 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputSigmaRChroma")), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputLambda")), "floatValue");
  v21 = v20;
  v22 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputMaxNumIterations")), "intValue");
  if (v16 <= 1000)
    +[FBSProcessorCPU processWithInputs:arguments:output:error:].cold.1();
  if (!(_DWORD)v17)
    +[FBSProcessorCPU processWithInputs:arguments:output:error:].cold.2();
  if (!(_DWORD)v18)
    +[FBSProcessorCPU processWithInputs:arguments:output:error:].cold.3();
  if (!(_DWORD)v19)
    +[FBSProcessorCPU processWithInputs:arguments:output:error:].cold.4();
  if (v21 == 0.0)
    +[FBSProcessorCPU processWithInputs:arguments:output:error:].cold.5();
  v23 = v22;
  if (!(_DWORD)v22)
    +[FBSProcessorCPU processWithInputs:arguments:output:error:].cold.6();
  v24 = (unint64_t)v13;
  v85 = (unint64_t)v15;
  v25 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 1);
  v27 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 2);
  v82 = convertToFullFloatPixelBuffer(v26, v9, v11, v13, v15);
  v81 = convertToFullFloatPixelBuffer(v27, v9, v11, v13, v15);
  if (objc_msgSend(a5, "format") == 2309)
    v28 = objc_msgSend(a5, "bytesPerRow");
  else
    v28 = 4 * v24;
  pixelBuffer = createPixelBuffer((unint64_t)v13, v85, v28, 0);
  v29 = v16;
  v30 = -[CIBilateralGridHash initWithWidth:height:maxHashTableSize:]([CIBilateralGridHash alloc], "initWithWidth:height:maxHashTableSize:", (unint64_t)v13, v85, v16);
  v31 = objc_msgSend(v25, "surface");
  objc_msgSend(v25, "region");
  if (-[CIBilateralGridHash createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:](v30, "createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:", v31, v17, v18, v19))
  {
    v32 = ci_logger_performance();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.data) = 136446210;
      *(void **)((char *)&buf.data + 4) = "+[FBSProcessorCPU processWithInputs:arguments:output:error:]";
      _os_log_impl(&dword_1921E4000, v32, OS_LOG_TYPE_INFO, "%{public}s Returning disparity image; unable to create 3D bilateral grid hash. Please file a radar.",
        (uint8_t *)&buf,
        0xCu);
    }
  }
  v33 = -[CIBilateralSolverCPU initWithWidth:height:maxVertices:]([CIBilateralSolverCPU alloc], "initWithWidth:height:maxVertices:", (unint64_t)v13, v85, v29);
  v34 = objc_msgSend(v25, "surface");
  v35 = pixelBuffer;
  *(float *)&v36 = v21;
  -[CIBilateralSolverCPU doSolveWithBilateralGridhash:reference:disparity:confidence:output:lambda:maxIterations:](v33, "doSolveWithBilateralGridhash:reference:disparity:confidence:output:lambda:maxIterations:", v30, v34, v81, v82, pixelBuffer, v23, v36);

  if (objc_msgSend(a5, "format") == 2053)
  {
    if (CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL))
      goto LABEL_31;
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    v39 = objc_msgSend(a5, "baseAddress");
    objc_msgSend(a5, "region");
    v41 = v40;
    objc_msgSend(a5, "region");
    if (v41 >= v9)
    {
      v44 = 0;
      v43 = (int)(v42 * 4.0 + 0.0);
    }
    else
    {
      v43 = 0;
      v44 = (int)((v9 - v42) * 4.0 + 0.0);
    }
    objc_msgSend(a5, "region");
    v51 = v50;
    objc_msgSend(a5, "region");
    if (v51 >= v11)
      v43 = (int)((double)v43 + v52 * (double)BytesPerRow);
    else
      v44 = (int)((double)v44 + (v11 - v52) * (double)(unint64_t)objc_msgSend(a5, "bytesPerRow"));
    objc_msgSend(a5, "region");
    v54 = v53;
    v55 = (double)v24;
    if (v54 < (double)v24)
      objc_msgSend(a5, "region");
    v56 = (unint64_t)v55;
    objc_msgSend(a5, "region");
    v57 = (unint64_t)v15;
    if (v58 < v15)
    {
      objc_msgSend(a5, "region");
      v57 = (unint64_t)v59;
    }
    buf.data = &BaseAddress[v43];
    buf.height = v57;
    buf.width = v56;
    buf.rowBytes = BytesPerRow;
    dest.data = (void *)(v39 + v44);
    dest.height = v57;
    dest.width = v56;
    dest.rowBytes = objc_msgSend(a5, "bytesPerRow");
    vImageConvert_PlanarFtoPlanar16F(&buf, &dest, 0);
    goto LABEL_30;
  }
  if (objc_msgSend(a5, "format") == 2309 && !CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL))
  {
    v45 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    v46 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    if (v46 == objc_msgSend(a5, "bytesPerRow"))
    {
      v47 = (void *)objc_msgSend(a5, "baseAddress");
      v48 = CVPixelBufferGetBytesPerRow(pixelBuffer);
      Height = CVPixelBufferGetHeight(pixelBuffer);
      memcpy(v47, v45, Height * v48);
    }
    else
    {
      v61 = CVPixelBufferGetBytesPerRow(pixelBuffer);
      objc_msgSend(a5, "region");
      if (v62 < v13)
      {
        objc_msgSend(a5, "region");
        v13 = v63;
      }
      objc_msgSend(a5, "region");
      if (v64 < v15)
      {
        objc_msgSend(a5, "region");
        v85 = (unint64_t)v65;
      }
      v66 = objc_msgSend(a5, "baseAddress");
      objc_msgSend(a5, "region");
      v68 = v67;
      objc_msgSend(a5, "region");
      if (v68 >= v9)
      {
        v71 = 0;
        v70 = (int)(v69 * 4.0 + 0.0);
      }
      else
      {
        v70 = 0;
        v71 = (int)((v9 - v69) * 4.0 + 0.0);
      }
      objc_msgSend(a5, "region");
      v73 = v72;
      objc_msgSend(a5, "region");
      if (v73 >= v11)
        v70 = (int)((double)v70 + v74 * (double)v61);
      else
        v71 = (int)((double)v71 + (v11 - v74) * (double)(unint64_t)objc_msgSend(a5, "bytesPerRow"));
      if (v85)
      {
        v75 = 0;
        v76 = vcvtd_n_u64_f64(v13, 2uLL);
        v77 = v66 + v71;
        v78 = 1;
        v79 = &v45[v70];
        do
        {
          memcpy((void *)(v77 + objc_msgSend(a5, "bytesPerRow") * v75), &v79[v75 * v61], v76);
          v75 = v78;
        }
        while (v85 > v78++);
      }
    }
LABEL_30:
    v35 = pixelBuffer;
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  }
LABEL_31:
  if (v35)
    CVPixelBufferRelease(v35);
  if (v82)
    CVPixelBufferRelease(v82);
  if (v81)
    CVPixelBufferRelease(v81);
  return 1;
}

+ (void)processWithInputs:arguments:output:error:.cold.1()
{
  __assert_rtn("+[FBSProcessorCPU processWithInputs:arguments:output:error:]", "CIFastBilateralSolver.m", 516, "kMaxVertices > 1000");
}

+ (void)processWithInputs:arguments:output:error:.cold.2()
{
  __assert_rtn("+[FBSProcessorCPU processWithInputs:arguments:output:error:]", "CIFastBilateralSolver.m", 517, "kSigmaS");
}

+ (void)processWithInputs:arguments:output:error:.cold.3()
{
  __assert_rtn("+[FBSProcessorCPU processWithInputs:arguments:output:error:]", "CIFastBilateralSolver.m", 518, "kSigmaRLuma");
}

+ (void)processWithInputs:arguments:output:error:.cold.4()
{
  __assert_rtn("+[FBSProcessorCPU processWithInputs:arguments:output:error:]", "CIFastBilateralSolver.m", 519, "kSigmaRChroma");
}

+ (void)processWithInputs:arguments:output:error:.cold.5()
{
  __assert_rtn("+[FBSProcessorCPU processWithInputs:arguments:output:error:]", "CIFastBilateralSolver.m", 520, "kLambda");
}

+ (void)processWithInputs:arguments:output:error:.cold.6()
{
  __assert_rtn("+[FBSProcessorCPU processWithInputs:arguments:output:error:]", "CIFastBilateralSolver.m", 521, "kMaxIterations");
}

@end
