@implementation CIFaceMaskKernel

+ (BOOL)hasValidPipelines
{
  BOOL v2;

  if (shaderCalc)
    v2 = shaderApply == 0;
  else
    v2 = 1;
  return !v2;
}

+ (void)compilePipelines:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = 0;
  v4 = (void *)objc_msgSend(a3, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), 0);
  v5 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("CIFaceMask_calc"));
  shaderCalc = objc_msgSend(a3, "newComputePipelineStateWithFunction:error:", v5, &v9);
  if (v9)
  {
    v6 = objc_msgSend(v9, "localizedDescription");
    NSLog(CFSTR("Failed to initialize %@: %@; %@"),
      CFSTR("CIFaceMask_calc"),
      v6,
      objc_msgSend(v9, "localizedFailureReason"));
  }

  v7 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("CIFaceMask_apply"));
  shaderApply = objc_msgSend(a3, "newComputePipelineStateWithFunction:error:", v7, &v9);
  if (v9)
  {
    v8 = objc_msgSend(v9, "localizedDescription");
    NSLog(CFSTR("Failed to initialize %@: %@; %@"),
      CFSTR("CIFaceMask_apply"),
      v8,
      objc_msgSend(v9, "localizedFailureReason"));
  }

}

+ (void)releasePipelines
{
  if (shaderCalc)

  if (shaderApply)
  shaderCalc = 0;
  shaderApply = 0;
}

+ (void)compilePipelinesIfNeeded:(id)a3
{
  id v5;

  v5 = (id)+[CIFaceMaskKernel compilePipelinesIfNeeded:]::targetedDevice;
  if ((id)+[CIFaceMaskKernel compilePipelinesIfNeeded:]::targetedDevice == a3)
  {
    if ((objc_msgSend(a1, "hasValidPipelines") & 1) != 0)
      return;
    v5 = (id)+[CIFaceMaskKernel compilePipelinesIfNeeded:]::targetedDevice;
  }
  if (v5 != a3)
  {
    objc_msgSend(a1, "releasePipelines");
    +[CIFaceMaskKernel compilePipelinesIfNeeded:]::targetedDevice = (uint64_t)a3;
  }
  if ((objc_msgSend(a1, "hasValidPipelines") & 1) == 0)
    objc_msgSend(a1, "compilePipelines:", a3);
}

+ (BOOL)hasValidBuffers
{
  return applyParams != 0;
}

+ (void)allocateBuffers:(id)a3
{
  applyParams = objc_msgSend(a3, "newBufferWithLength:options:", 160, 0);
}

+ (void)releaseBuffers
{
  if (applyParams)

  applyParams = 0;
}

+ (void)allocateBuffersIfNeeded:(id)a3
{
  id v5;

  v5 = (id)+[CIFaceMaskKernel allocateBuffersIfNeeded:]::targetedDevice;
  if ((id)+[CIFaceMaskKernel allocateBuffersIfNeeded:]::targetedDevice == a3)
  {
    if ((objc_msgSend(a1, "hasValidBuffers") & 1) != 0)
      return;
    v5 = (id)+[CIFaceMaskKernel allocateBuffersIfNeeded:]::targetedDevice;
  }
  if (v5 != a3)
  {
    objc_msgSend(a1, "releaseBuffers");
    +[CIFaceMaskKernel allocateBuffersIfNeeded:]::targetedDevice = (uint64_t)a3;
  }
  if ((objc_msgSend(a1, "hasValidBuffers") & 1) == 0)
    objc_msgSend(a1, "allocateBuffers:", a3);
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v10;
  uint64_t v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  float v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  float v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  float v26;
  void *v27;
  float v28;
  double v29;
  void *v30;
  float v31;
  void *v32;
  float v33;
  double v34;
  void *v35;
  float v36;
  void *v37;
  float v38;
  double v39;
  void *v40;
  float v41;
  void *v42;
  float v43;
  double v44;
  void *v45;
  float v46;
  void *v47;
  float v48;
  double v49;
  void *v50;
  float v51;
  void *v52;
  float v53;
  double v54;
  void *v55;
  float v56;
  void *v57;
  float v58;
  double v59;
  void *v60;
  float v61;
  void *v62;
  float v63;
  double v64;
  void *v65;
  float v66;
  void *v67;
  float v68;
  double v69;
  void *v70;
  float v71;
  void *v72;
  float v73;
  double v74;
  void *v75;
  float v76;
  void *v77;
  float v78;
  double v79;
  void *v80;
  float v81;
  void *v82;
  float v83;
  double v84;
  void *v85;
  float v86;
  void *v87;
  float v88;
  double v89;
  void *v90;
  float v91;
  BOOL v92;
  double v99;
  double v100;
  double v101;
  float v102;
  double v103;
  double v104;
  double v105;
  double v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  _QWORD v116[3];
  _QWORD v117[3];
  uint64_t v118;
  int64x2_t v119;
  uint64_t v120;
  int64x2_t v121;
  uint64_t v122;
  int v123[4];
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint64_t v131;
  int v132;
  float v133;
  __int128 v134;
  __int128 v135;
  uint64_t v136;
  float v137;

  v10 = (void *)objc_msgSend(a5, "metalCommandBuffer");
  v11 = objc_msgSend(v10, "device");
  objc_msgSend(a1, "compilePipelinesIfNeeded:", v11);
  objc_msgSend(a1, "allocateBuffersIfNeeded:", v11);
  if (!objc_msgSend(a1, "hasValidPipelines") || !objc_msgSend(a1, "hasValidBuffers"))
    return 0;
  v123[0] = 1022739087;
  if (a4)
  {
    v12 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face0CentreX"));
    v13 = -1.0;
    LODWORD(v14) = -1.0;
    if (v12)
      objc_msgSend(v12, "floatValue", v14);
    LODWORD(v124) = LODWORD(v14);
    v15 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face0CentreY"));
    if (v15)
    {
      objc_msgSend(v15, "floatValue");
      v13 = v16;
    }
    *(float *)&v125 = v13;
    v17 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face0LeftEyeX"));
    v18 = -1.0;
    LODWORD(v19) = -1.0;
    if (v17)
      objc_msgSend(v17, "floatValue", v19);
    LODWORD(v126) = LODWORD(v19);
    v20 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face0LeftEyeY"));
    if (v20)
    {
      objc_msgSend(v20, "floatValue");
      v18 = v21;
    }
    *(float *)&v127 = v18;
    v22 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face0RightEyeX"));
    v23 = -1.0;
    LODWORD(v24) = -1.0;
    if (v22)
      objc_msgSend(v22, "floatValue", v24);
    LODWORD(v128) = LODWORD(v24);
    v25 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face0RightEyeY"));
    if (v25)
    {
      objc_msgSend(v25, "floatValue");
      v23 = v26;
    }
    *(float *)&v129 = v23;
    v27 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face0ChinX"));
    v28 = -1.0;
    LODWORD(v29) = -1.0;
    if (v27)
      objc_msgSend(v27, "floatValue", v29);
    LODWORD(v130) = LODWORD(v29);
    v30 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face0ChinY"));
    if (v30)
    {
      objc_msgSend(v30, "floatValue");
      v28 = v31;
    }
    *(float *)&v131 = v28;
    v32 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face1CentreX"));
    v33 = -1.0;
    LODWORD(v34) = -1.0;
    if (v32)
      objc_msgSend(v32, "floatValue", v34);
    DWORD1(v124) = LODWORD(v34);
    v35 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face1CentreY"));
    if (v35)
    {
      objc_msgSend(v35, "floatValue");
      v33 = v36;
    }
    *((float *)&v125 + 1) = v33;
    v37 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face1LeftEyeX"));
    v38 = -1.0;
    LODWORD(v39) = -1.0;
    if (v37)
      objc_msgSend(v37, "floatValue", v39);
    DWORD1(v126) = LODWORD(v39);
    v40 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face1LeftEyeY"));
    if (v40)
    {
      objc_msgSend(v40, "floatValue");
      v38 = v41;
    }
    *((float *)&v127 + 1) = v38;
    v42 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face1RightEyeX"));
    v43 = -1.0;
    LODWORD(v44) = -1.0;
    if (v42)
      objc_msgSend(v42, "floatValue", v44);
    DWORD1(v128) = LODWORD(v44);
    v45 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face1RightEyeY"));
    if (v45)
    {
      objc_msgSend(v45, "floatValue");
      v43 = v46;
    }
    *((float *)&v129 + 1) = v43;
    v47 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face1ChinX"));
    v48 = -1.0;
    LODWORD(v49) = -1.0;
    if (v47)
      objc_msgSend(v47, "floatValue", v49);
    DWORD1(v130) = LODWORD(v49);
    v50 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face1ChinY"));
    if (v50)
    {
      objc_msgSend(v50, "floatValue");
      v48 = v51;
    }
    *((float *)&v131 + 1) = v48;
    v52 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face2CentreX"));
    v53 = -1.0;
    LODWORD(v54) = -1.0;
    if (v52)
      objc_msgSend(v52, "floatValue", v54);
    DWORD2(v124) = LODWORD(v54);
    v55 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face2CentreY"));
    if (v55)
    {
      objc_msgSend(v55, "floatValue");
      v53 = v56;
    }
    *((float *)&v125 + 2) = v53;
    v57 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face2LeftEyeX"));
    v58 = -1.0;
    LODWORD(v59) = -1.0;
    if (v57)
      objc_msgSend(v57, "floatValue", v59);
    DWORD2(v126) = LODWORD(v59);
    v60 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face2LeftEyeY"));
    if (v60)
    {
      objc_msgSend(v60, "floatValue");
      v58 = v61;
    }
    *((float *)&v127 + 2) = v58;
    v62 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face2RightEyeX"));
    v63 = -1.0;
    LODWORD(v64) = -1.0;
    if (v62)
      objc_msgSend(v62, "floatValue", v64);
    DWORD2(v128) = LODWORD(v64);
    v65 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face2RightEyeY"));
    if (v65)
    {
      objc_msgSend(v65, "floatValue");
      v63 = v66;
    }
    *((float *)&v129 + 2) = v63;
    v67 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face2ChinX"));
    v68 = -1.0;
    LODWORD(v69) = -1.0;
    if (v67)
      objc_msgSend(v67, "floatValue", v69);
    DWORD2(v130) = LODWORD(v69);
    v70 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face2ChinY"));
    if (v70)
    {
      objc_msgSend(v70, "floatValue");
      v68 = v71;
    }
    v132 = LODWORD(v68);
    v72 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face3CentreX"));
    v73 = -1.0;
    LODWORD(v74) = -1.0;
    if (v72)
      objc_msgSend(v72, "floatValue", v74);
    HIDWORD(v124) = LODWORD(v74);
    v75 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face3CentreY"));
    if (v75)
    {
      objc_msgSend(v75, "floatValue");
      v73 = v76;
    }
    *((float *)&v125 + 3) = v73;
    v77 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face3LeftEyeX"));
    v78 = -1.0;
    LODWORD(v79) = -1.0;
    if (v77)
      objc_msgSend(v77, "floatValue", v79);
    HIDWORD(v126) = LODWORD(v79);
    v80 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face3LeftEyeY"));
    if (v80)
    {
      objc_msgSend(v80, "floatValue");
      v78 = v81;
    }
    *((float *)&v127 + 3) = v78;
    v82 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face3RightEyeX"));
    v83 = -1.0;
    LODWORD(v84) = -1.0;
    if (v82)
      objc_msgSend(v82, "floatValue", v84);
    HIDWORD(v128) = LODWORD(v84);
    v85 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face3RightEyeY"));
    if (v85)
    {
      objc_msgSend(v85, "floatValue");
      v83 = v86;
    }
    *((float *)&v129 + 3) = v83;
    v87 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face3ChinX"));
    v88 = -1.0;
    LODWORD(v89) = -1.0;
    if (v87)
      objc_msgSend(v87, "floatValue", v89);
    HIDWORD(v130) = LODWORD(v89);
    v90 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("face3ChinY"));
    if (v90)
    {
      objc_msgSend(v90, "floatValue");
      v88 = v91;
    }
  }
  else
  {
    __asm { FMOV            V0.2S, #-1.0 }
    v131 = _D0;
    v132 = -1082130432;
    __asm { FMOV            V0.4S, #-1.0 }
    v124 = _Q0;
    v125 = _Q0;
    v126 = _Q0;
    v127 = _Q0;
    v128 = _Q0;
    v129 = _Q0;
    v88 = -1.0;
    v130 = _Q0;
  }
  v133 = v88;
  v134 = xmmword_192494960;
  v135 = xmmword_192494970;
  v136 = 0x3F0000003E4CCCCDLL;
  objc_msgSend(a5, "region");
  v100 = v99;
  objc_msgSend(a5, "region");
  v102 = v100 / v101;
  v137 = v102;
  objc_msgSend(a5, "region");
  v104 = v103;
  v106 = v105;
  v107 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "metalTexture");
  v108 = objc_msgSend(a5, "metalTexture");
  v109 = (void *)objc_msgSend(v10, "computeCommandEncoder");
  objc_msgSend(v109, "setComputePipelineState:", shaderCalc);
  objc_msgSend(v109, "setBytes:length:atIndex:", v123, 192, 0);
  v92 = 1;
  objc_msgSend(v109, "setBuffer:offset:atIndex:", 0, 0, 1);
  objc_msgSend(v109, "setTexture:atIndex:", v107, 0);
  v121 = vdupq_n_s64(1uLL);
  v122 = 1;
  v119 = v121;
  v120 = 1;
  objc_msgSend(v109, "dispatchThreadgroups:threadsPerThreadgroup:", &v121, &v119);
  v118 = 0;
  v110 = objc_msgSend((id)shaderApply, "maxTotalThreadsPerThreadgroup");
  mtlutl_ComputeThreadGroupParameters(v110, objc_msgSend((id)shaderApply, "threadExecutionWidth"), (_DWORD *)&v118 + 1, &v118, v104, v106);
  v112 = v118;
  v111 = HIDWORD(v118);
  v113 = (unint64_t)(v104 / (double)HIDWORD(v118));
  v114 = (unint64_t)(v106 / (double)v118);
  objc_msgSend(v109, "setComputePipelineState:", shaderApply);
  objc_msgSend(v109, "setBuffer:offset:atIndex:", 0, 0, 0);
  objc_msgSend(v109, "setTexture:atIndex:", v107, 0);
  objc_msgSend(v109, "setTexture:atIndex:", v108, 1);
  v117[0] = v113;
  v117[1] = v114;
  v117[2] = 1;
  v116[0] = v111;
  v116[1] = v112;
  v116[2] = 1;
  objc_msgSend(v109, "dispatchThreadgroups:threadsPerThreadgroup:", v117, v116);
  objc_msgSend(v109, "endEncoding");
  objc_msgSend(v10, "addCompletedHandler:", &__block_literal_global_286);
  return v92;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 261;
}

+ (int)outputFormat
{
  return 261;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

@end
