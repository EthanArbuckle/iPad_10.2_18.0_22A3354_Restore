@implementation VNPersonSegmentationGeneratorInstanceBased4People

+ (id)espressoModelPathForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  +[VNValidationUtilities computeDeviceForKey:inOptions:error:](VNValidationUtilities, "computeDeviceForKey:inOptions:error:", CFSTR("VNDetectorInternalOption_ModelComputeDevice"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]((uint64_t)a1, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "modelPathForComputeDevice:error:", v7, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;

  +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]((uint64_t)a1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onlyInputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pixelFormatType");

  return v5;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]((uint64_t)a1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onlyInputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)inputImageBlobName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]((uint64_t)a1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "allInputNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)inputMaskBlobName
{
  return 0;
}

+ (NSArray)outputMaskBlobNames
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]((uint64_t)a1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v2, "personInstanceMasksOutput");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "name", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v9;
}

+ (id)outputMaskBlobNameToRequestKey
{
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "outputMaskBlobNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v4 = (objc_class *)objc_opt_class();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        NSStringFromClass(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9, (_QWORD)v13);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

+ (NSArray)outputConfidenceBlobNames
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]((uint64_t)a1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v2, "personInstanceMaskConfidencesOutput");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "name", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v9;
}

+ (BOOL)rotateImageToMatchNetworkOrientation
{
  return 1;
}

+ (BOOL)inputMaskRequired
{
  return 0;
}

+ (id)_inferenceDescriptorForModelConfiguredWithOptions:(uint64_t)a1 error:(_QWORD *)a2
{
  void *v3;
  id v4;
  _QWORD block[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  objc_opt_self();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__207;
  v11 = __Block_byref_object_dispose__208;
  v12 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__VNPersonSegmentationGeneratorInstanceBased4People__inferenceDescriptorForModelConfiguredWithOptions_error___block_invoke;
  block[3] = &unk_1E4548FA8;
  block[4] = &v7;
  if (+[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::onceToken != -1)
    dispatch_once(&+[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::onceToken, block);
  v3 = (void *)+[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor;
  if (+[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor)
  {
    v4 = (id)+[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor;
  }
  else if (a2)
  {
    *a2 = objc_retainAutorelease((id)v8[5]);
  }
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __109__VNPersonSegmentationGeneratorInstanceBased4People__inferenceDescriptorForModelConfiguredWithOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id obj;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v1 + 40);
  objc_msgSend(MEMORY[0x1E0DC6CA8], "personInstanceMaskV1AndReturnError:", &obj);
  v2 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v1 + 40), obj);
  v3 = (void *)+[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor;
  +[VNPersonSegmentationGeneratorInstanceBased4People _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor = v2;

}

- (BOOL)validateMaskForBlobName:(id)a3 options:(id)a4 maskConfidence:(float *)a5 maskAcceptable:(BOOL *)a6 error:(id *)a7
{
  id v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  float v25;
  double v26;
  BOOL v27;
  void *v28;
  BOOL v29;
  id v32;
  float v33;

  v11 = a3;
  v12 = a4;
  if (a5)
    v13 = a6 == 0;
  else
    v13 = 1;
  v14 = !v13;
  v32 = v12;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v14, CFSTR("One or more of output parameters is/are NULL"), v11);
  v15 = v11;
  v16 = v15;
  if (!self)
  {

    goto LABEL_9;
  }
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", self->_espressoConfidencesOutputBuffer.__table_.__p2_.__value_ == 1, CFSTR("VNSegmentationGenerator - internal error in number confidence buffers"));
  v17 = *((_QWORD *)self->_espressoConfidencesOutputBuffer.__table_.__p1_.__value_.__next_ + 3);
  v18 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v18, "setNumberStyle:", 1);
  objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(":"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "componentsSeparatedByString:", CFSTR("_"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "numberFromString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "unsignedIntegerValue") - 1;

  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v24 < 4, CFSTR("VNSegmentationGenerator - internal error calculating confidence index"));
  v25 = *(float *)(v17 + 4 * v24);

  if (v25 < 0.5)
  {
LABEL_9:
    *a6 = 0;
    v27 = 1;
    v28 = v32;
    goto LABEL_15;
  }
  v33 = 0.0;
  LODWORD(v26) = 0;
  v28 = v32;
  v27 = +[VNValidationUtilities getFloatValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:withDefaultValue:error:", &v33, CFSTR("VNSegmentationGeneratorProcessOption_MinimumConfidence"), v32, a7, v26);
  if (v27)
  {
    if (v25 >= v33)
    {
      *a5 = v25;
      v29 = 1;
    }
    else
    {
      v29 = 0;
    }
    *a6 = v29;
  }
LABEL_15:

  return v27;
}

- (BOOL)bindOutputConfidenceBuffersAndReturnError:(id *)a3
{
  void *v5;
  id v6;
  char *v7;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  objc_msgSend((id)objc_opt_class(), "outputConfidenceBlobNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", objc_msgSend(v5, "count") == 1, CFSTR("VNSegmentationGenerator - internal error in number confidence buffer names"));
  objc_msgSend(v5, "firstObject");
  v20 = 0;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v7 = std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * {__strong},espresso_buffer_t>>((uint64_t)&self->_espressoConfidencesOutputBuffer, &v9, (uint64_t *)&v9);

  LOBYTE(a3) = -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:error:](self, "bindBuffer:toNetworkOutputBlobName:error:", v7 + 24, *((_QWORD *)v7 + 2), a3);
  return (char)a3;
}

- (void)initializeOutputConfidenceBuffers:(void *)a3
{
  unint64_t v3;
  unordered_map<NSString *, espresso_buffer_t, std::hash<NSString *>, std::equal_to<NSString *>, std::allocator<std::pair<NSString *const, espresso_buffer_t>>> *p_espressoConfidencesOutputBuffer;
  char *next;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  void **v11;
  char *v12;
  unint64_t v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  p_espressoConfidencesOutputBuffer = &self->_espressoConfidencesOutputBuffer;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", self->_espressoConfidencesOutputBuffer.__table_.__p2_.__value_ == 1, CFSTR("VNSegmentationGenerator - internal error in number confidence buffers"));
  next = (char *)p_espressoConfidencesOutputBuffer->__table_.__p1_.__value_.__next_;
  v7 = objc_msgSend(*((id *)next + 2), "hash");
  v8 = v7;
  v9 = *((_QWORD *)a3 + 1);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v3 = v7;
      if (v7 >= v9)
        v3 = v7 % v9;
    }
    else
    {
      v3 = (v9 - 1) & v7;
    }
    v11 = *(void ***)(*(_QWORD *)a3 + 8 * v3);
    if (v11)
    {
      v12 = (char *)*v11;
      if (*v11)
      {
        do
        {
          v13 = *((_QWORD *)v12 + 1);
          if (v13 == v7)
          {
            if (*((_QWORD *)v12 + 2) == *((_QWORD *)next + 2))
              goto LABEL_40;
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9)
                v13 %= v9;
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v3)
              break;
          }
          v12 = *(char **)v12;
        }
        while (v12);
      }
    }
  }
  v12 = (char *)operator new(0xC0uLL);
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = v8;
  *((_QWORD *)v12 + 2) = *((id *)next + 2);
  *(_OWORD *)(v12 + 24) = 0u;
  *(_OWORD *)(v12 + 40) = 0u;
  *(_OWORD *)(v12 + 56) = 0u;
  *(_OWORD *)(v12 + 72) = 0u;
  *(_OWORD *)(v12 + 88) = 0u;
  *(_OWORD *)(v12 + 104) = 0u;
  *(_OWORD *)(v12 + 120) = 0u;
  *(_OWORD *)(v12 + 136) = 0u;
  *(_OWORD *)(v12 + 152) = 0u;
  *(_OWORD *)(v12 + 168) = 0u;
  *((_QWORD *)v12 + 23) = 0;
  v14 = (float)(unint64_t)(*((_QWORD *)a3 + 3) + 1);
  v15 = *((float *)a3 + 8);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    v16 = 1;
    if (v9 >= 3)
      v16 = (v9 & (v9 - 1)) != 0;
    v17 = v16 | (2 * v9);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__rehash<true>((uint64_t)a3, v19);
    v9 = *((_QWORD *)a3 + 1);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v20 = *(_QWORD *)a3;
  v21 = *(_QWORD **)(*(_QWORD *)a3 + 8 * v3);
  if (v21)
  {
    *(_QWORD *)v12 = *v21;
LABEL_38:
    *v21 = v12;
    goto LABEL_39;
  }
  *(_QWORD *)v12 = *((_QWORD *)a3 + 2);
  *((_QWORD *)a3 + 2) = v12;
  *(_QWORD *)(v20 + 8 * v3) = (char *)a3 + 16;
  if (*(_QWORD *)v12)
  {
    v22 = *(_QWORD *)(*(_QWORD *)v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9)
        v22 %= v9;
    }
    else
    {
      v22 &= v9 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a3 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*((_QWORD *)a3 + 3);
LABEL_40:
  v23 = *(_OWORD *)(next + 24);
  v24 = *(_OWORD *)(next + 40);
  *(_OWORD *)(v12 + 56) = *(_OWORD *)(next + 56);
  *(_OWORD *)(v12 + 40) = v24;
  *(_OWORD *)(v12 + 24) = v23;
  v25 = *(_OWORD *)(next + 72);
  v26 = *(_OWORD *)(next + 88);
  v27 = *(_OWORD *)(next + 104);
  *(_OWORD *)(v12 + 120) = *(_OWORD *)(next + 120);
  *(_OWORD *)(v12 + 104) = v27;
  *(_OWORD *)(v12 + 88) = v26;
  *(_OWORD *)(v12 + 72) = v25;
  v28 = *(_OWORD *)(next + 136);
  v29 = *(_OWORD *)(next + 152);
  v30 = *(_OWORD *)(next + 168);
  *((_QWORD *)v12 + 23) = *((_QWORD *)next + 23);
  *(_OWORD *)(v12 + 168) = v30;
  *(_OWORD *)(v12 + 152) = v29;
  *(_OWORD *)(v12 + 136) = v28;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::~__hash_table((uint64_t)&self->_espressoConfidencesOutputBuffer);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((_DWORD *)self + 62) = 1065353216;
  return self;
}

@end
