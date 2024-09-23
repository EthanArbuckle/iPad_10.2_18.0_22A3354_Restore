@implementation CIHighlightRecoveryProcessor

+ (id)compilePipelineForDevice:(id)a3 functionName:(id)a4 constantValues:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v12 = 0;
  v8 = (void *)objc_msgSend(a3, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1), &v12);
  v9 = (void *)objc_msgSend(v8, "newFunctionWithName:constantValues:error:", a4, a5, &v12);
  v10 = (void *)objc_msgSend(a3, "newComputePipelineStateWithFunction:error:", v9, &v12);

  return v10;
}

+ (id)functionConstantValuesTuningParameters:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v12;
  id v15;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;

  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxIntensityT0")), "floatValue");
  v5 = v4;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxIntensityT1")), "floatValue");
  v7 = v6;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("minIntensityT0")), "floatValue");
  v9 = v8;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("minIntensityT1")), "floatValue");
  _S9 = 1.0 / (float)(v7 - v5);
  _S8 = -(float)(_S9 * v5);
  _S11 = 1.0 / (float)(v12 - v9);
  _S10 = -(float)(_S11 * v9);
  v15 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
  v25 = 8;
  objc_msgSend(v15, "setConstantValue:type:withName:", &v25, 41, CFSTR("V3HLR::kXhlrbTileSize"));
  __asm { FCVT            H0, S9 }
  v26 = _H0;
  objc_msgSend(v15, "setConstantValue:type:withName:", &v26, 16, CFSTR("V3HLR::kXhlrbMaxIntensityThresholdM"));
  __asm { FCVT            H0, S8 }
  v27 = _H0;
  objc_msgSend(v15, "setConstantValue:type:withName:", &v27, 16, CFSTR("V3HLR::kXhlrbMaxIntensityThresholdC"));
  __asm { FCVT            H0, S11 }
  v28 = _H0;
  objc_msgSend(v15, "setConstantValue:type:withName:", &v28, 16, CFSTR("V3HLR::kXhlrbMinIntensityThresholdM"));
  __asm { FCVT            H0, S10 }
  v29 = _H0;
  objc_msgSend(v15, "setConstantValue:type:withName:", &v29, 16, CFSTR("V3HLR::kXhlrbMinIntensityThresholdC"));
  return v15;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  BOOL v26;
  BOOL result;
  double v28;
  unint64_t v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  float v33;
  float v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  void *v45;
  double MinX;
  double MaxY;
  double v48;
  double v49;
  unint64_t v50;
  double v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  unint64_t v55;
  BOOL v56;
  id v57;
  void *v58;
  void *v59;
  unint64_t v60;
  _QWORD v61[7];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[3];
  float v75[4];
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v9 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4, a5, a6);
  v10 = (void *)objc_msgSend(a5, "metalCommandBuffer");
  v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "commandQueue"), "device");
  v12 = objc_msgSend(a1, "functionConstantValuesTuningParameters:", a4);
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("blurRadiusT0")), "floatValue");
  v14 = v13;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("blurRadiusT1")), "floatValue");
  v16 = v15;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("maxBlur")), "floatValue");
  v18 = v17;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("apertureScaling")), "floatValue");
  v20 = (float)(v14 * v19) / v18;
  v75[0] = 1.0 / (float)((float)((float)(v16 * v19) / v18) - v20);
  v75[1] = -(float)(v75[0] * v20);
  v21 = (void *)objc_msgSend(a1, "compilePipelineForDevice:functionName:constantValues:", v11, CFSTR("sparserendering_xhlrb_scan"), v12);
  v22 = (void *)objc_msgSend(a1, "compilePipelineForDevice:functionName:constantValues:", v11, CFSTR("sparserendering_xhlrb_diffuse"), v12);
  v23 = objc_msgSend(a1, "compilePipelineForDevice:functionName:constantValues:", v11, CFSTR("sparserendering_xhlrb_copy_back"), v12);
  v24 = (void *)v23;
  if (v21)
    v25 = v22 == 0;
  else
    v25 = 1;
  v26 = v25 || v23 == 0;
  result = !v26;
  if (!v26)
  {
    v56 = result;
    v57 = a5;
    objc_msgSend(v9, "region");
    v59 = v10;
    v29 = (unint64_t)v28;
    objc_msgSend(v9, "region");
    v31 = v29 & 0xFFFFFFFFFFFFFFFELL;
    v32 = (unint64_t)v30 & 0xFFFFFFFFFFFFFFFELL;
    v33 = log2f(fminf((float)(unint64_t)objc_msgSend(v21, "maxTotalThreadsPerThreadgroup"), fminf((float)(unint64_t)objc_msgSend(v22, "maxTotalThreadsPerThreadgroup"), (float)(unint64_t)objc_msgSend(v24, "maxTotalThreadsPerThreadgroup"))));
    v34 = exp2f(floorf(v33));
    v53 = v31;
    v54 = v21;
    if (v34 >= 0x40)
      v35 = 8;
    else
      v35 = v34 >> 3;
    v60 = (v31 + 7) >> 3;
    v52 = v32;
    v55 = (v32 + 7) >> 3;
    v36 = (void *)objc_msgSend(v11, "newBufferWithLength:options:", ((v31 + 7) & 0xFFFFFFFFFFFFFFF8) * v55 + 16, 32);
    v37 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, v31, v32, 0);
    objc_msgSend(v37, "setUsage:", 3);
    objc_msgSend(v37, "setStorageMode:", 2);
    v38 = v9;
    v58 = v9;
    v39 = objc_msgSend(v11, "newTextureWithDescriptor:", v37);
    v40 = objc_msgSend(v11, "newTextureWithDescriptor:", v37);
    v41 = (void *)objc_msgSend(v59, "blitCommandEncoder");
    objc_msgSend(v59, "setLabel:", CFSTR("XHLRBComputeBlit"));
    v73[0] = v53;
    v73[1] = v52;
    v73[2] = 1;
    memset(v74, 0, sizeof(v74));
    memset(v72, 0, sizeof(v72));
    objc_msgSend(v41, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", objc_msgSend(v38, "metalTexture"), 0, 0, v74, v73, v39, 0, 0, v72);
    objc_msgSend(v41, "fillBuffer:range:value:", v36, 0, objc_msgSend(v36, "length"), 0);
    objc_msgSend(v41, "endEncoding");
    v42 = (void *)objc_msgSend(v59, "computeCommandEncoder");
    objc_msgSend(v42, "setLabel:", CFSTR("XHLRBComputeCompute"));
    objc_msgSend(v42, "setComputePipelineState:", v54);
    objc_msgSend(v42, "setBytes:length:atIndex:", v75, 8, 0);
    objc_msgSend(v42, "setBuffer:offset:atIndex:", v36, 0, 1);
    objc_msgSend(v42, "setTexture:atIndex:", objc_msgSend(v58, "metalTexture"), 0);
    v71[0] = v60;
    v71[1] = v55;
    v71[2] = 1;
    v69 = v35;
    v70 = xmmword_192496C70;
    objc_msgSend(v42, "dispatchThreadgroups:threadsPerThreadgroup:", v71, &v69);
    v43 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("iterations")), "unsignedIntValue");
    if (v43)
    {
      v44 = v43;
      do
      {
        objc_msgSend(v42, "setComputePipelineState:", v22);
        objc_msgSend(v42, "setBytes:length:atIndex:", v75, 8, 0);
        objc_msgSend(v42, "setBuffer:offset:atIndex:", v36, 0, 1);
        objc_msgSend(v42, "setTexture:atIndex:", v39, 0);
        objc_msgSend(v42, "setTexture:atIndex:", v40, 1);
        v67 = v35;
        v68 = xmmword_192496C70;
        objc_msgSend(v42, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v36, 0, &v67);
        objc_msgSend(v42, "setComputePipelineState:", v24);
        objc_msgSend(v42, "setBuffer:offset:atIndex:", v36, 0, 0);
        objc_msgSend(v42, "setTexture:atIndex:", v40, 0);
        objc_msgSend(v42, "setTexture:atIndex:", v39, 1);
        v65 = v35;
        v66 = xmmword_192496C70;
        objc_msgSend(v42, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v36, 0, &v65);
        --v44;
      }
      while (v44);
    }
    objc_msgSend(v42, "endEncoding");
    v45 = (void *)objc_msgSend(v59, "blitCommandEncoder");
    objc_msgSend(v59, "setLabel:", CFSTR("XHLRBComputeBlit"));
    objc_msgSend(v58, "region");
    MinX = CGRectGetMinX(v76);
    objc_msgSend(v58, "region");
    MaxY = CGRectGetMaxY(v77);
    objc_msgSend(v57, "region");
    v48 = CGRectGetMinX(v78);
    objc_msgSend(v57, "region");
    v64[0] = (unint64_t)(v48 - MinX);
    v64[1] = (unint64_t)-(CGRectGetMaxY(v79) - MaxY);
    v64[2] = 0;
    objc_msgSend(v57, "region");
    v50 = (unint64_t)v49;
    objc_msgSend(v57, "region");
    v63[0] = v50;
    v63[1] = (unint64_t)v51;
    v63[2] = 1;
    memset(v62, 0, sizeof(v62));
    objc_msgSend(v45, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v39, 0, 0, v64, v63, objc_msgSend(v57, "metalTexture"), 0, 0, v62);
    objc_msgSend(v45, "endEncoding");
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __73__CIHighlightRecoveryProcessor_processWithInputs_arguments_output_error___block_invoke;
    v61[3] = &unk_1E2EC4C98;
    v61[4] = v36;
    v61[5] = v39;
    v61[6] = v40;
    objc_msgSend(v59, "addCompletedHandler:", v61);
    return v56;
  }
  return result;
}

void __73__CIHighlightRecoveryProcessor_processWithInputs_arguments_output_error___block_invoke(id *a1)
{

}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t MinX;
  uint64_t MaxX;
  uint64_t MinY;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  v17 = CGRectIntegral(a5);
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  MinX = (uint64_t)CGRectGetMinX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MaxX = (uint64_t)CGRectGetMaxX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MinY = (uint64_t)CGRectGetMinY(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v12 = (uint64_t)CGRectGetMaxY(v20) + 7;
  v13 = (double)(uint64_t)(MinX & 0xFFFFFFFFFFFFFFF8);
  v14 = (double)(uint64_t)(MinY & 0xFFFFFFFFFFFFFFF8);
  v15 = (double)(uint64_t)(MaxX + 7 - (MinX & 0xFFFFFFFFFFFFFFF8 | (MaxX + 7) & 7));
  v16 = (double)(uint64_t)(v12 - (MinY & 0xFFFFFFFFFFFFFFF8 | v12 & 7));
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 2056;
}

+ (int)outputFormat
{
  return 2056;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 1;
}

@end
