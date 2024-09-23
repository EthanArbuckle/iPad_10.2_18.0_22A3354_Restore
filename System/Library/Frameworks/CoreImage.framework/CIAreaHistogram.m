@implementation CIAreaHistogram

- (id)outputImageMPS
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  CIImage *inputImage;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  CIColorKernel *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  unint64_t v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  int64x2_t v28[5];
  _QWORD v29[4];
  __int128 v30;
  unint64_t v31;
  _QWORD v32[4];
  __int128 v33;
  unint64_t v34;
  int v35;
  unsigned int v36;
  float v37;
  __int128 v38;
  unint64_t v39;
  unint64_t __src;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[4];

  v43[3] = *MEMORY[0x1E0C80C00];
  v38 = 0uLL;
  v39 = 0;
  if (self)
  {
    -[CIAreaHistogram _netExtent](self, "_netExtent");
    v3 = *((_QWORD *)&v38 + 1);
    v4 = v39;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  if (v3 <= v4)
    v3 = v4;
  if (v3 > 0x1000)
    return 0;
  v6 = -[NSNumber unsignedIntValue](self->inputCount, "unsignedIntValue");
  v7 = v6;
  inputImage = self->inputImage;
  if (v6 < 0x100)
  {
    v9 = 256;
LABEL_13:
    v12 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_CIAreaHistogramScaleAndClamp);
    -[CIImage extent](inputImage, "extent");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    *(float *)&v13 = (float)v7 / (float)v9;
    v43[0] = inputImage;
    v43[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    v43[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9 - 1);
    inputImage = -[CIColorKernel applyWithExtent:arguments:](v12, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3), v14, v16, v18, v20);
    goto LABEL_14;
  }
  if ((v6 & ((_DWORD)v6 - 1)) != 0)
  {
    v10 = (v6 - 1) | ((v6 - 1) >> 1) | ((((_DWORD)v6 - 1) | ((v6 - 1) >> 1)) >> 2);
    v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
    v9 = (v11 | HIWORD(v11)) + 1;
    goto LABEL_13;
  }
  v9 = v6;
LABEL_14:
  v21 = *((_QWORD *)&v38 + 1);
  v22 = v39;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __38__CIAreaHistogram_MPS__outputImageMPS__block_invoke;
  v32[3] = &__block_descriptor_68_e62_v24__0___CIImageProcessorInput__8___CIImageProcessorOutput__16l;
  v33 = v38;
  v34 = v39;
  v35 = v7;
  v36 = v9;
  v37 = v23 / (float)(v22 * v21);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __38__CIAreaHistogram_MPS__outputImageMPS__block_invoke_2;
  v29[3] = &__block_descriptor_56_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  v31 = v39;
  v30 = v38;
  XXH64_reset(v28, 0);
  LODWORD(__src) = v38;
  XXH64_update((uint64_t)v28, (char *)&__src, 4uLL);
  LODWORD(__src) = DWORD1(v38);
  XXH64_update((uint64_t)v28, (char *)&__src, 4uLL);
  __src = *((_QWORD *)&v38 + 1);
  XXH64_update((uint64_t)v28, (char *)&__src, 8uLL);
  __src = v39;
  XXH64_update((uint64_t)v28, (char *)&__src, 8uLL);
  LODWORD(__src) = v7;
  XXH64_update((uint64_t)v28, (char *)&__src, 4uLL);
  v41[0] = CFSTR("kCIImageProcessorSynchronizeInputs");
  v41[1] = CFSTR("kCIImageProcessorAllowPartialOutputRegion");
  v42[0] = MEMORY[0x1E0C9AAA0];
  v42[1] = MEMORY[0x1E0C9AAA0];
  v24 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CIAreaHistogramMPS_%ubins"), v7);
  v26 = XXH64_digest((uint64_t)v28);
  if (v7 <= 0x100)
    v27 = 266;
  else
    v27 = 2056;
  return -[CIImage imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:](inputImage, "imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:", v25, v26, v27, 2056, v24, v29, 0.0, 0.0, (double)v7, 1.0, v32);
}

void __38__CIAreaHistogram_MPS__outputImageMPS__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v19;
  void *v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  unint64_t v39;
  uint64_t v40[5];
  unint64_t v41;
  int64x2_t v42;
  uint64_t v43;
  int64x2_t v44;
  _QWORD v45[6];
  _QWORD v46[4];
  __int128 v47;
  int v48;
  int v49;
  unsigned int v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v5 = *(_DWORD *)(a1 + 36);
  v6 = *(int *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9 = *(_DWORD *)(a1 + 56);
  v10 = *(unsigned int *)(a1 + 60);
  v11 = *(_DWORD *)(a1 + 64);
  v49 = *(_DWORD *)(a1 + 60);
  v50 = v9;
  v48 = v11;
  v12 = (void *)objc_msgSend(a3, "metalCommandBuffer");
  if (v12)
  {
    v13 = v12;
    v46[0] = v10;
    v46[1] = 1;
    v46[2] = 0;
    v46[3] = 0;
    __asm { FMOV            V0.4S, #1.0 }
    v47 = _Q0;
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E68]), "initWithDevice:histogramInfo:", objc_msgSend(v12, "device"), v46);
    if (v19)
    {
      v20 = (void *)v19;
      objc_msgSend(a2, "region");
      x = v51.origin.x;
      y = v51.origin.y;
      width = v51.size.width;
      height = v51.size.height;
      if (CGRectIsNull(v51))
      {
        LODWORD(v25) = 0;
        v26 = 0x7FFFFFFF;
        v27 = 0x7FFFFFFF;
      }
      else
      {
        v52.origin.x = x;
        v52.origin.y = y;
        v52.size.width = width;
        v52.size.height = height;
        if (CGRectIsInfinite(v52))
        {
          LODWORD(v25) = -1;
          v26 = -2147483647;
          v27 = -2147483647;
        }
        else
        {
          v53.origin.x = x;
          v53.origin.y = y;
          v53.size.width = width;
          v53.size.height = height;
          v54 = CGRectInset(v53, 0.000001, 0.000001);
          v55 = CGRectIntegral(v54);
          v26 = (int)v55.origin.x;
          v27 = (int)v55.origin.y;
          v25 = (unint64_t)v55.size.height;
        }
      }
      v45[0] = v26 - v6;
      v45[1] = v5 + (int)v7 - (v27 + (int)v25);
      v45[2] = 0;
      v45[3] = v8;
      v45[4] = v7;
      v45[5] = 1;
      objc_msgSend(v20, "setClipRectSource:", v45);
      v28 = objc_msgSend(v20, "histogramSizeForSourceFormat:", objc_msgSend((id)objc_msgSend(a2, "metalTexture"), "pixelFormat"));
      v29 = (void *)objc_msgSend((id)objc_msgSend(v13, "commandQueue"), "device");
      v30 = objc_msgSend(v29, "newBufferWithLength:options:", v28, 32);
      objc_msgSend(v20, "encodeToCommandBuffer:sourceTexture:histogram:histogramOffset:", v13, objc_msgSend(a2, "metalTexture"), v30, 0);
      if (CI::AreaHistogram::loadConvertKernel(objc_object  {objcproto9MTLDevice}*)::onceToken != -1)
        dispatch_once(&CI::AreaHistogram::loadConvertKernel(objc_object  {objcproto9MTLDevice}*)::onceToken, &__block_literal_global_1);
      v31 = (_QWORD *)CI::AreaHistogram::kernelCache;
      v40[0] = objc_msgSend(v29, "registryID");
      v32 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto23MTLComputePipelineState}*>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto23MTLComputePipelineState}*,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto23MTLComputePipelineState}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto23MTLComputePipelineState}*>>::find<unsigned long long>(v31, (unint64_t *)v40);
      if (v32)
      {
        v33 = (void *)v32[3];
      }
      else
      {
        v34 = (void *)objc_msgSend(v29, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreImage")), 0);
        v35 = (void *)objc_msgSend(v34, "newFunctionWithName:", CFSTR("convertMPSHistogram"));
        v40[0] = objc_msgSend(v29, "newComputePipelineStateWithFunction:error:", v35, 0);
        v36 = CI::AreaHistogram::kernelCache;
        v43 = objc_msgSend(v29, "registryID");
        std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto23MTLComputePipelineState}*>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto23MTLComputePipelineState}*,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto23MTLComputePipelineState}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto23MTLComputePipelineState}*>>::__emplace_unique_key_args<unsigned long long,unsigned long long,objc_object  {objcproto23MTLComputePipelineState}&>(v36, (unint64_t *)&v43, &v43, v40);

        v33 = (void *)v40[0];
      }
      v37 = (void *)objc_msgSend(v13, "computeCommandEncoder");
      objc_msgSend(v37, "setComputePipelineState:", v33);
      objc_msgSend(v37, "setBytes:length:atIndex:", &v50, 4, 0);
      objc_msgSend(v37, "setBytes:length:atIndex:", &v49, 4, 1);
      objc_msgSend(v37, "setBytes:length:atIndex:", &v48, 4, 2);
      objc_msgSend(v37, "setBuffer:offset:atIndex:", v30, 0, 3);
      objc_msgSend(v37, "setTexture:atIndex:", objc_msgSend(a3, "metalTexture"), 0);
      v38 = (v50 - 1) | ((v50 - 1) >> 1) | (((v50 - 1) | ((v50 - 1) >> 1)) >> 2) | (((v50 - 1) | ((v50 - 1) >> 1) | (((v50 - 1) | ((v50 - 1) >> 1)) >> 2)) >> 4);
      v39 = (v38 | (v38 >> 8) | ((v38 | (v38 >> 8)) >> 16)) + 1;
      if (objc_msgSend(v33, "maxTotalThreadsPerThreadgroup") <= v39)
        v39 = objc_msgSend(v33, "maxTotalThreadsPerThreadgroup");
      v43 = v39;
      v44 = vdupq_n_s64(1uLL);
      v41 = (v39 + v50 - 1) / v39;
      v42 = v44;
      objc_msgSend(v37, "dispatchThreadgroups:threadsPerThreadgroup:", &v43, &v41);
      objc_msgSend(v37, "endEncoding");
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = (uint64_t)___ZL16mpsAreaHistogramPU32objcproto21CIImageProcessorInput11objc_objectPU33objcproto22CIImageProcessorOutput11objc_object5IRectjjf_block_invoke;
      v40[3] = (uint64_t)&unk_1E2EC2D30;
      v40[4] = v30;
      objc_msgSend(v13, "addCompletedHandler:", v40);

    }
  }
}

double __38__CIAreaHistogram_MPS__outputImageMPS__block_invoke_2(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;

  v1 = *(_DWORD *)(a1 + 32);
  v2 = *(_DWORD *)(a1 + 36);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  if (v1 == -2147483647)
  {
    if (v2 != -2147483647 || v3 != 0xFFFFFFFFLL || v4 != 0xFFFFFFFFLL)
      return (double)v1;
    v8 = MEMORY[0x1E0C9D5E0];
  }
  else
  {
    if (v1 != 0x7FFFFFFF || v2 != 0x7FFFFFFF || v3 != 0 || v4 != 0)
      return (double)v1;
    v8 = MEMORY[0x1E0C9D628];
  }
  return *(double *)v8;
}

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryReduction");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("8");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.5");
  v8[3] = CFSTR("inputCount");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F18B60;
  v6[1] = &unk_1E2F18B70;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F18B80;
  v6[3] = &unk_1E2F18B90;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F18BA0;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v8[4] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F18BB0;
  v4[1] = &unk_1E2F18BB0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F18B60;
  v4[3] = &unk_1E2F18B60;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeScalar");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (IRect)_netExtent
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  IRect *result;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[CIImage extent](self->inputImage, "extent");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  v34.origin.x = v13;
  v34.origin.y = v14;
  v34.size.width = v15;
  v34.size.height = v16;
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  v27 = CGRectIntersection(v26, v34);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  result = (IRect *)CGRectIsEmpty(v27);
  if ((_DWORD)result)
    goto LABEL_3;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v29 = CGRectIntegral(v28);
  v22 = v29.origin.x;
  v23 = v29.origin.y;
  v24 = v29.size.width;
  v25 = v29.size.height;
  result = (IRect *)CGRectIsNull(v29);
  if ((_DWORD)result)
  {
LABEL_3:
    retstr->var1.var1 = 0;
    *(_OWORD *)&retstr->var0.var0 = IRectNull;
  }
  else
  {
    v30.origin.x = v22;
    v30.origin.y = v23;
    v30.size.width = v24;
    v30.size.height = v25;
    result = (IRect *)CGRectIsInfinite(v30);
    if ((_DWORD)result)
    {
      *(_OWORD *)&retstr->var0.var0 = IRectInfinite;
      retstr->var1.var1 = 0xFFFFFFFFLL;
    }
    else
    {
      v31.origin.x = v22;
      v31.origin.y = v23;
      v31.size.width = v24;
      v31.size.height = v25;
      v32 = CGRectInset(v31, 0.000001, 0.000001);
      v33 = CGRectIntegral(v32);
      retstr->var0.var0 = (int)v33.origin.x;
      retstr->var0.var1 = (int)v33.origin.y;
      retstr->var1.var0 = (unint64_t)v33.size.width;
      retstr->var1.var1 = (unint64_t)v33.size.height;
    }
  }
  return result;
}

- (BOOL)_inputsAreOK
{
  if (self->inputImage)
  {
    if (-[NSNumber intValue](self->inputCount, "intValue") - 2049 > 0xFFFFF7FF)
    {
      -[CIAreaHistogram _netExtent](self, "_netExtent");
      return 1;
    }
    NSLog(CFSTR("CIAreaHistogram requires inputCount >= 1 and <= 2048"));
  }
  return 0;
}

- (id)outputData
{
  int v3;
  void *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!-[CIAreaHistogram _inputsAreOK](self, "_inputsAreOK"))
    return 0;
  v3 = -[NSNumber intValue](self->inputCount, "intValue");
  if ((v3 - 257) <= 0xFFFFFEFF)
  {
    NSLog(CFSTR("CIAreaHistogram outputData requires inputCount >= 1 and <= 256"));
    return 0;
  }
  v6 = v3;
  if (v3 <= 0xFF)
    -[CIImage filteredImage:keysAndValues:](self->inputImage, "filteredImage:keysAndValues:", CFSTR("CIExposureAdjust"), CFSTR("inputEV"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)log2((double)v3 * 0.00390625)), 0);
  v7 = 0;
  v8 = 0;
  v9 = 0;
  -[CIAreaHistogram _netExtent](self, "_netExtent");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", (16 * v6));
  bzero((void *)objc_msgSend(v4, "mutableBytes"), objc_msgSend(v4, "length"));
  return v4;
}

- (id)outputImageNonMPS
{
  uint64_t v3;
  double v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  CIImage *inputImage;
  double v9;
  CIColorKernel *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD v25[4];
  __int128 v26;
  double v27;
  double v28;
  int v29;
  _QWORD v30[4];
  __int128 v31;
  double v32;
  int64x2_t v33[5];
  __int128 v34;
  double v35;
  double __src;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v34 = 0uLL;
  v35 = 0.0;
  if (self)
    -[CIAreaHistogram _netExtent](self, "_netExtent");
  v3 = -[NSNumber intValue](self->inputCount, "intValue");
  -[NSNumber doubleValue](self->inputScale, "doubleValue");
  v5 = v4;
  v6 = *((_QWORD *)&v34 + 1);
  v7 = *(_QWORD *)&v35;
  inputImage = self->inputImage;
  v9 = (double)(int)v3;
  if ((int)v3 <= 255)
  {
    v10 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_CIAreaHistogramScale);
    -[CIImage extent](inputImage, "extent");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = v9 * 0.00390625;
    *(float *)&v19 = v9 * 0.00390625;
    v37[0] = inputImage;
    v37[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    inputImage = -[CIColorKernel applyWithExtent:arguments:](v10, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2), v12, v14, v16, v18);
  }
  if ((int)v3 <= 256)
    v20 = 266;
  else
    v20 = 2056;
  XXH64_reset(v33, 0);
  LODWORD(__src) = v34;
  XXH64_update((uint64_t)v33, (char *)&__src, 4uLL);
  LODWORD(__src) = DWORD1(v34);
  XXH64_update((uint64_t)v33, (char *)&__src, 4uLL);
  __src = *((double *)&v34 + 1);
  XXH64_update((uint64_t)v33, (char *)&__src, 8uLL);
  __src = v35;
  XXH64_update((uint64_t)v33, (char *)&__src, 8uLL);
  LODWORD(__src) = v3;
  XXH64_update((uint64_t)v33, (char *)&__src, 4uLL);
  v21 = v5 / ((double)v6 * (double)v7);
  __src = v21;
  XXH64_update((uint64_t)v33, (char *)&__src, 8uLL);
  v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CIAreaHistogram_%dbins"), v3);
  v23 = XXH64_digest((uint64_t)v33);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __36__CIAreaHistogram_outputImageNonMPS__block_invoke;
  v30[3] = &__block_descriptor_56_e70__CGRect__CGPoint_dd__CGSize_dd__40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  v31 = v34;
  v32 = v35;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __36__CIAreaHistogram_outputImageNonMPS__block_invoke_2;
  v25[3] = &__block_descriptor_68_e62_v24__0___CIImageProcessorInput__8___CIImageProcessorOutput__16l;
  v29 = v3;
  v26 = v34;
  v27 = v35;
  v28 = v21;
  return -[CIImage imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:](inputImage, "imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:", v22, v23, v20, 2056, 0, v30, 0.0, 0.0, (double)(int)v3, 1.0, v25);
}

double __36__CIAreaHistogram_outputImageNonMPS__block_invoke(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;

  v1 = *(_DWORD *)(a1 + 32);
  v2 = *(_DWORD *)(a1 + 36);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  if (v1 == -2147483647)
  {
    if (v2 != -2147483647 || v3 != 0xFFFFFFFFLL || v4 != 0xFFFFFFFFLL)
      return (double)v1;
    v8 = MEMORY[0x1E0C9D5E0];
  }
  else
  {
    if (v1 != 0x7FFFFFFF || v2 != 0x7FFFFFFF || v3 != 0 || v4 != 0)
      return (double)v1;
    v8 = MEMORY[0x1E0C9D628];
  }
  return *(double *)v8;
}

void __36__CIAreaHistogram_outputImageNonMPS__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  int v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  vImagePixelCount *v15;
  uint64_t v16;
  vImagePixelCount *v17;
  void *v18;
  int v19;
  void *v20;
  BOOL v21;
  int v22;
  vImagePixelCount *v23;
  uint64_t v24;
  uint64x2_t v25;
  vImagePixelCount v26;
  vImagePixelCount *v27;
  vImagePixelCount *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  vImagePixelCount *v34;
  vImagePixelCount *v35;
  vImagePixelCount *v36;
  vImagePixelCount *v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  int v46;
  unint64_t v48;
  int v49;
  int v50;
  double v51;
  int v52;
  unint64_t v53;
  uint64_t v54;
  uint64x2_t v55;
  uint64x2_t v56;
  void *v57;
  uint64_t v58;
  uint64x2_t v59;
  vImagePixelCount *v60;
  vImagePixelCount *v61;
  vImagePixelCount *v62;
  unint64_t v63;
  double v64;
  vImage_Buffer v65;
  vImage_Buffer src;
  vImage_Buffer dest;
  vImagePixelCount *histogram[4];
  vImagePixelCount *v69[4];
  uint64_t v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v70 = *MEMORY[0x1E0C80C00];
  v5 = *(int *)(a1 + 64);
  v6 = *(_DWORD *)(a1 + 32);
  v63 = *(_QWORD *)(a1 + 40);
  v61 = *(vImagePixelCount **)(a1 + 48);
  v64 = *(double *)(a1 + 56);
  v58 = objc_msgSend(a2, "baseAddress");
  objc_msgSend(a2, "region");
  x = v71.origin.x;
  y = v71.origin.y;
  width = v71.size.width;
  height = v71.size.height;
  if (CGRectIsNull(v71))
  {
    v11 = 0x7FFFFFFF;
  }
  else
  {
    v72.origin.x = x;
    v72.origin.y = y;
    v72.size.width = width;
    v72.size.height = height;
    if (CGRectIsInfinite(v72))
    {
      v11 = -2147483647;
    }
    else
    {
      v73.origin.x = x;
      v73.origin.y = y;
      v73.size.width = width;
      v73.size.height = height;
      v74 = CGRectInset(v73, 0.000001, 0.000001);
      v11 = (int)COERCE_DOUBLE(CGRectIntegral(v74));
    }
  }
  v60 = (vImagePixelCount *)objc_msgSend(a2, "bytesPerRow");
  if ((int)v5 <= 256)
    v12 = 256;
  else
    v12 = v5;
  LODWORD(v13) = 4 * v12;
  v69[0] = (vImagePixelCount *)malloc_type_calloc((4 * v12), 8uLL, 0x100004000313F17uLL);
  v69[1] = &v69[0][v12];
  v14 = (2 * v12);
  v15 = &v69[0][v14];
  v16 = (3 * v12);
  v62 = v69[0];
  v69[2] = v15;
  v69[3] = &v69[0][v16];
  if (objc_msgSend(a2, "format") == 2056)
  {
    v57 = a3;
    v17 = (vImagePixelCount *)malloc_type_calloc((4 * v12), 8uLL, 0x100004000313F17uLL);
    histogram[0] = v17;
    histogram[1] = &v17[v12];
    histogram[2] = &v17[v14];
    histogram[3] = &v17[v16];
    v18 = malloc_type_malloc(16 * v63, 0xED7F128FuLL);
    v19 = v6;
    v20 = v18;
    v21 = v19 <= v11;
    v22 = 8 * (v19 - v11);
    if (v21)
      v22 = 0;
    if (v61)
    {
      v23 = 0;
      v24 = v58 + v22;
      v25 = vshlq_u64((uint64x2_t)vdupq_n_s64(v63), (uint64x2_t)xmmword_19248E2B0);
      if (v13 <= 1)
        v13 = 1;
      else
        v13 = v13;
      v59 = v25;
      v26 = v25.i64[0];
      do
      {
        src.data = (void *)(v24 + (_QWORD)v23 * (_QWORD)v60);
        src.height = 1;
        *(uint64x2_t *)&src.width = v59;
        dest.data = v20;
        dest.height = 1;
        dest.width = v26;
        dest.rowBytes = 16 * v63;
        vImageConvert_Planar16FtoPlanarF(&src, &dest, 0x10u);
        v65.data = v20;
        v65.height = 1;
        v65.width = v63;
        v65.rowBytes = 16 * v63;
        vImageHistogramCalculation_ARGBFFFF(&v65, histogram, v12, 0.0, 1.0, 0x10u);
        v27 = v17;
        v28 = v62;
        v29 = v13;
        do
        {
          v30 = *v27++;
          *v28++ += v30;
          --v29;
        }
        while (v29);
        v23 = (vImagePixelCount *)((char *)v23 + 1);
      }
      while (v23 != v61);
    }
    free(v17);
    if (v20)
      free(v20);
    a3 = v57;
  }
  else if (objc_msgSend(a2, "format") == 264)
  {
    v31 = 4 * (v6 - v11);
    if (v6 <= v11)
      v31 = 0;
    histogram[0] = (vImagePixelCount *)(v58 + v31);
    histogram[1] = v61;
    histogram[2] = (vImagePixelCount *)v63;
    histogram[3] = v60;
    vImageHistogramCalculation_ARGB8888((const vImage_Buffer *)histogram, v69, 0x10u);
  }
  else if (objc_msgSend(a2, "format") == 266)
  {
    v32 = 4 * (v6 - v11);
    if (v6 <= v11)
      v32 = 0;
    histogram[0] = (vImagePixelCount *)(v58 + v32);
    histogram[1] = v61;
    histogram[2] = (vImagePixelCount *)v63;
    histogram[3] = v60;
    vImageHistogramCalculation_ARGB8888((const vImage_Buffer *)histogram, v69, 0x10u);
    v69[2] = v62;
    v69[0] = v15;
  }
  if ((int)v5 <= 255)
  {
    v33 = (int)v5 - 1;
    v34 = v69[0];
    v35 = v69[1];
    v36 = v69[2];
    v37 = v69[3];
    do
    {
      v34[v33] += v34[v5];
      v35[v33] += v35[v5];
      v36[v33] += v36[v5];
      v37[v33] += v37[v5++];
    }
    while ((_DWORD)v5 != 256);
  }
  v38 = objc_msgSend(a3, "baseAddress");
  objc_msgSend(a3, "region");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v45 = objc_msgSend(a3, "bytesPerRow");
  v46 = CI_FLIP_IMAGE_PROCESSOR();
  if (v44 <= 1.0 || v46 == 0)
    v48 = 0;
  else
    v48 = (v45 * (unint64_t)(v44 + -1.0)) >> 1;
  v49 = (int)(v40 + v42);
  v50 = v49 - (int)v40;
  v51 = v64;
  if (v49 > (int)v40)
  {
    v52 = 0;
    v53 = v38 + 2 * v48;
    v54 = (int)v40;
    do
    {
      v55.i64[0] = v69[2][v54];
      v55.i64[1] = v69[3][v54];
      v56.i64[0] = v69[0][v54];
      v56.i64[1] = v69[1][v54];
      *(float32x4_t *)&dest.data = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_u64(v56), v51)), vmulq_n_f64(vcvtq_f64_u64(v55), v51));
      histogram[0] = (vImagePixelCount *)&dest;
      *(_OWORD *)&histogram[1] = xmmword_19248E2C0;
      histogram[3] = (vImagePixelCount *)16;
      src.data = (void *)(v53 + 2 * v52);
      *(_OWORD *)&src.height = xmmword_19248E2C0;
      src.rowBytes = 8;
      vImageConvert_PlanarFtoPlanar16F((const vImage_Buffer *)histogram, &src, 0);
      v51 = v64;
      v52 += 4;
      ++v54;
      --v50;
    }
    while (v50);
  }
  free(v62);
}

- (id)outputImage
{
  if (!-[CIAreaHistogram _inputsAreOK](self, "_inputsAreOK"))
    return 0;
  if (self)
    -[CIAreaHistogram _netExtent](self, "_netExtent");
  return -[CIImage imageByCroppingToRect:](+[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor clearColor](CIColor, "clearColor")), "imageByCroppingToRect:", 0.0, 0.0, (double)-[NSNumber intValue](self->inputCount, "intValue"), 1.0);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputCount
{
  return self->inputCount;
}

- (void)setInputCount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
