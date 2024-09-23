@implementation CILensModelKernelMetalProcessor

+ (BOOL)hasValidPipelines
{
  BOOL v2;

  if (shaderLensModelCalc)
    v2 = shaderLensModelApply == 0;
  else
    v2 = 1;
  return !v2 && shaderLensModelMinMax0 != 0 && shaderLensModelMinMax1 != 0;
}

+ (void)compilePipelines:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = 0;
  v4 = (void *)objc_msgSend(a3, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), 0);
  v5 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("slm_calc"));
  shaderLensModelCalc = objc_msgSend(a3, "newComputePipelineStateWithFunction:error:", v5, &v15);
  if (v15)
  {
    v6 = objc_msgSend(v15, "localizedDescription");
    NSLog(CFSTR("Failed to initialize %@: %@; %@"),
      CFSTR("slm_calc"),
      v6,
      objc_msgSend(v15, "localizedFailureReason"));
  }

  v7 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("slm_apply"));
  shaderLensModelApply = objc_msgSend(a3, "newComputePipelineStateWithFunction:error:", v7, &v15);
  if (v15)
  {
    v8 = objc_msgSend(v15, "localizedDescription");
    NSLog(CFSTR("Failed to initialize %@: %@; %@"),
      CFSTR("slm_apply"),
      v8,
      objc_msgSend(v15, "localizedFailureReason"));
  }

  v9 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("slm_shiftmap_calcminmax0"));
  shaderLensModelMinMax0 = objc_msgSend(a3, "newComputePipelineStateWithFunction:error:", v9, &v15);
  if (v15)
  {
    v10 = objc_msgSend(v15, "localizedDescription");
    NSLog(CFSTR("Failed to initialize %@: %@; %@"),
      CFSTR("slm_shiftmap_calcminmax0"),
      v10,
      objc_msgSend(v15, "localizedFailureReason"));
  }

  v11 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("slm_shiftmap_calcminmax1"));
  shaderLensModelMinMax1 = objc_msgSend(a3, "newComputePipelineStateWithFunction:error:", v11, &v15);
  if (v15)
  {
    v12 = objc_msgSend(v15, "localizedDescription");
    NSLog(CFSTR("Failed to initialize %@: %@; %@"),
      CFSTR("slm_shiftmap_calcminmax1"),
      v12,
      objc_msgSend(v15, "localizedFailureReason"));
  }

  v13 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("slm_shiftmap_calcminmax2"));
  shaderLensModelMinMax2 = objc_msgSend(a3, "newComputePipelineStateWithFunction:error:", v13, &v15);
  if (v15)
  {
    v14 = objc_msgSend(v15, "localizedDescription");
    NSLog(CFSTR("Failed to initialize %@: %@; %@"),
      CFSTR("slm_shiftmap_calcminmax2"),
      v14,
      objc_msgSend(v15, "localizedFailureReason"));
  }

}

+ (void)releasePipelines
{
  if (shaderLensModelCalc)

  if (shaderLensModelApply)
  if (shaderLensModelMinMax0)

  if (shaderLensModelMinMax1)
  if (shaderLensModelMinMax2)

  shaderLensModelCalc = 0;
  shaderLensModelApply = 0;
  shaderLensModelMinMax0 = 0;
  shaderLensModelMinMax1 = 0;
  shaderLensModelMinMax2 = 0;
}

+ (void)compilePipelinesIfNeeded:(id)a3
{
  id v5;

  v5 = (id)+[CILensModelKernelMetalProcessor compilePipelinesIfNeeded:]::targetedDevice;
  if ((id)+[CILensModelKernelMetalProcessor compilePipelinesIfNeeded:]::targetedDevice == a3)
  {
    if ((objc_msgSend(a1, "hasValidPipelines") & 1) != 0)
      return;
    v5 = (id)+[CILensModelKernelMetalProcessor compilePipelinesIfNeeded:]::targetedDevice;
  }
  if (v5 != a3)
  {
    objc_msgSend(a1, "releasePipelines");
    +[CILensModelKernelMetalProcessor compilePipelinesIfNeeded:]::targetedDevice = (uint64_t)a3;
  }
  if ((objc_msgSend(a1, "hasValidPipelines") & 1) == 0)
    objc_msgSend(a1, "compilePipelines:", a3);
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  int v27;
  int v28;
  int v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  void *v38;
  unsigned int v39;
  int v40;
  unsigned int v41;
  void *v42;
  float v43;
  unsigned int v44;
  id v45;
  unsigned int v46;
  void *v47;
  float v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  int64x2_t v66;
  _QWORD v67[3];
  _QWORD v68[3];
  __int128 v69;
  uint64_t v70;
  int64x2_t v71;
  uint64_t v72;
  int64x2_t v73;
  uint64_t v74;
  int64x2_t v75;
  uint64_t v76;
  _QWORD v77[3];
  _QWORD v78[3];
  int64x2_t v79;
  uint64_t v80;
  int64x2_t v81;
  uint64_t v82;
  uint64_t v83;
  _OWORD v84[4];

  v9 = (void *)objc_msgSend(a5, "metalCommandBuffer");
  v10 = (void *)objc_msgSend(v9, "device");
  v11 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputTuningParameters"));
  objc_msgSend(a1, "compilePipelinesIfNeeded:", v10);
  LODWORD(a1) = objc_msgSend(a1, "hasValidPipelines");
  if (!(_DWORD)a1)
    return (char)a1;
  v13 = (void *)objc_msgSend(v10, "newBufferWithLength:options:", 8, 32);
  v14 = objc_msgSend(v10, "newBufferWithLength:options:", 16, 32);
  v15 = objc_msgSend(v10, "newBufferWithLength:options:", 16, 0);
  memset(v84, 0, 44);
  SDOFSimpleLensModelValue(CFSTR("fallbackFocusROI_left"), v11);
  v17 = v16;
  if (a4)
  {
    v18 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("roi_left"));
    if (v18)
    {
      objc_msgSend(v18, "floatValue");
      v17 = v19;
    }
    LODWORD(v84[0]) = v17;
    SDOFSimpleLensModelValue(CFSTR("fallbackFocusROI_top"), v11);
    v21 = v20;
    v22 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("roi_top"));
    if (v22)
    {
      objc_msgSend(v22, "floatValue");
      v21 = v23;
    }
    DWORD1(v84[0]) = v21;
    SDOFSimpleLensModelValue(CFSTR("fallbackFocusROI_width"), v11);
    v25 = v24;
    v26 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("roi_width"));
    if (v26)
    {
      objc_msgSend(v26, "floatValue");
      v25 = v27;
    }
    DWORD2(v84[0]) = v25;
    SDOFSimpleLensModelValue(CFSTR("fallbackFocusROI_height"), v11);
    v29 = v28;
    v30 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("roi_height"));
    if (!v30)
      goto LABEL_13;
    objc_msgSend(v30, "floatValue");
  }
  else
  {
    LODWORD(v84[0]) = v16;
    SDOFSimpleLensModelValue(CFSTR("fallbackFocusROI_top"), v11);
    DWORD1(v84[0]) = v32;
    SDOFSimpleLensModelValue(CFSTR("fallbackFocusROI_width"), v11);
    DWORD2(v84[0]) = v33;
    SDOFSimpleLensModelValue(CFSTR("fallbackFocusROI_height"), v11);
  }
  v29 = v31;
LABEL_13:
  HIDWORD(v84[0]) = v29;
  SDOFSimpleLensModelValue(CFSTR("zeroShiftPercentile"), v11);
  LODWORD(v84[1]) = v34;
  SDOFSimpleLensModelValue(CFSTR("simulatedFocalLength"), v11);
  DWORD1(v84[1]) = v35;
  SDOFSimpleLensModelValue(CFSTR("aperture"), v11);
  v37 = v36;
  if (a4)
  {
    v38 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("aperture"));
    if (v38)
    {
      objc_msgSend(v38, "floatValue");
      v37 = v39;
    }
  }
  *((_QWORD *)&v84[1] + 1) = v37 | 0x45CE400000000000;
  SDOFSimpleLensModelValue(CFSTR("maxFGBlur"), v11);
  LODWORD(v84[2]) = v40;
  SDOFRenderingValue(CFSTR("maxBlur"), v11);
  *(_QWORD *)((char *)&v84[2] + 4) = v41 | 0x3F563E8E00000000;
  v64 = (char)a1;
  v62 = (void *)v15;
  v63 = (void *)v14;
  v65 = v9;
  if (a4)
  {
    v42 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("width"));
    if (v42)
    {
      objc_msgSend(v42, "floatValue");
      v44 = v43;
    }
    else
    {
      v44 = 2016;
    }
    v45 = a3;
    v47 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("height"));
    if (v47)
    {
      objc_msgSend(v47, "floatValue");
      v46 = v48;
    }
    else
    {
      v46 = 1512;
    }
  }
  else
  {
    v45 = a3;
    v46 = 1512;
    v44 = 2016;
  }
  v83 = 0;
  v49 = ((double)v46 * 0.25);
  v50 = objc_msgSend((id)shaderLensModelMinMax1, "maxTotalThreadsPerThreadgroup");
  mtlutl_ComputeThreadGroupParameters(v50, objc_msgSend((id)shaderLensModelMinMax1, "threadExecutionWidth"), (_DWORD *)&v83 + 1, &v83, ((double)v44 * 0.25), v49);
  v51 = v83;
  a1 = (id)HIDWORD(v83);
  v52 = v49 / v83;
  v53 = objc_msgSend((id)shaderLensModelApply, "maxTotalThreadsPerThreadgroup");
  mtlutl_ComputeThreadGroupParameters(v53, objc_msgSend((id)shaderLensModelApply, "threadExecutionWidth"), (_DWORD *)&v83 + 1, &v83, v44, v46);
  v54 = v83;
  v60 = HIDWORD(v83);
  v59 = v44 / HIDWORD(v83);
  v58 = v46 / v83;
  v55 = objc_msgSend((id)objc_msgSend(v45, "objectAtIndexedSubscript:", 0), "metalTexture");
  v61 = objc_msgSend(a5, "metalTexture");
  v56 = (void *)objc_msgSend(v65, "computeCommandEncoder");
  objc_msgSend(v56, "setComputePipelineState:", shaderLensModelMinMax0);
  objc_msgSend(v56, "setBuffer:offset:atIndex:", v13, 0, 0);
  v66 = vdupq_n_s64(1uLL);
  v81 = v66;
  v82 = 1;
  v79 = v66;
  v80 = 1;
  objc_msgSend(v56, "dispatchThreadgroups:threadsPerThreadgroup:", &v81, &v79);
  objc_msgSend(v56, "setComputePipelineState:", shaderLensModelMinMax1);
  objc_msgSend(v56, "setTexture:atIndex:", v55, 0);
  objc_msgSend(v56, "setBuffer:offset:atIndex:", v13, 0, 0);
  v78[0] = ((double)v44 * 0.25) / a1;
  v78[1] = v52;
  v78[2] = 1;
  v77[0] = a1;
  v77[1] = v51;
  v77[2] = 1;
  objc_msgSend(v56, "dispatchThreadgroups:threadsPerThreadgroup:", v78, v77);
  objc_msgSend(v56, "setComputePipelineState:", shaderLensModelMinMax2);
  objc_msgSend(v56, "setBuffer:offset:atIndex:", v13, 0, 0);
  objc_msgSend(v56, "setBuffer:offset:atIndex:", v63, 0, 1);
  v75 = v66;
  v76 = 1;
  v73 = v66;
  v74 = 1;
  objc_msgSend(v56, "dispatchThreadgroups:threadsPerThreadgroup:", &v75, &v73);
  objc_msgSend(v56, "setComputePipelineState:", shaderLensModelCalc);
  objc_msgSend(v56, "setBytes:length:atIndex:", v84, 44, 0);
  objc_msgSend(v56, "setBuffer:offset:atIndex:", v63, 0, 1);
  objc_msgSend(v56, "setBuffer:offset:atIndex:", v62, 0, 2);
  objc_msgSend(v56, "setTexture:atIndex:", v55, 0);
  objc_msgSend(v56, "setThreadgroupMemoryLength:atIndex:", 2048, 0);
  v71 = v66;
  v72 = 1;
  v69 = xmmword_192495E90;
  v70 = 1;
  objc_msgSend(v56, "dispatchThreadgroups:threadsPerThreadgroup:", &v71, &v69);
  objc_msgSend(v56, "setComputePipelineState:", shaderLensModelApply);
  objc_msgSend(v56, "setBuffer:offset:atIndex:", v62, 0, 0);
  objc_msgSend(v56, "setTexture:atIndex:", v55, 0);
  objc_msgSend(v56, "setTexture:atIndex:", v61, 1);
  v68[0] = v59;
  v68[1] = v58;
  v68[2] = 1;
  v67[0] = v60;
  v67[1] = v54;
  v67[2] = 1;
  objc_msgSend(v56, "dispatchThreadgroups:threadsPerThreadgroup:", v68, v67);
  objc_msgSend(v56, "endEncoding");

  LOBYTE(a1) = v64;
  return (char)a1;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 0;
}

+ (int)outputFormat
{
  return 261;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("focusRect"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height), "CGRectValue");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

@end
