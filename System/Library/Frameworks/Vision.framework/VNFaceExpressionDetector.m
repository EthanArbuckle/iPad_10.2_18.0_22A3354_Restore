@implementation VNFaceExpressionDetector

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)configurationOptionKeysForDetectorKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__VNFaceExpressionDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceExpressionDetector configurationOptionKeysForDetectorKey]::onceToken != -1)
    dispatch_once(&+[VNFaceExpressionDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  return (id)+[VNFaceExpressionDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
}

+ (int)expressionTypeFromString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Smile")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Disgust")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Neutral")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Surprise")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Scream")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Suspicious")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 3;
  }

  return v4;
}

+ (id)createExpressionAndConfidencesDictionaryFromScores:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  float v15;
  float v16;
  int v17;
  float v18;
  float v19;
  uint64_t *v20;
  int v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t *v25;
  uint64_t *v26;
  BOOL v27;
  uint64_t *v29;
  _QWORD *v30[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t *v35;
  _QWORD *v36[2];
  int v37;
  int v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
  v36[0] = 0;
  v36[1] = 0;
  v35 = (uint64_t *)v36;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v13 = v12;
        LODWORD(v29) = objc_msgSend(a1, "expressionTypeFromString:", v10);
        *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v35, (int)v29, &v29)+ 8) = v13;

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v7);
  }

  v14 = 0;
  v30[0] = 0;
  v30[1] = 0;
  v29 = (uint64_t *)v30;
  v15 = 0.0;
  v16 = 3.4028e38;
  do
  {
    v38 = v14;
    if (v16 > *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v35, v14, &v38)+ 8))
    {
      v38 = v14;
      v16 = *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v35, v14, &v38)+ 8);
    }
    v38 = v14;
    v15 = v15
        + *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v35, v14++, &v38)+ 8);
  }
  while (v14 != 6);
  v17 = 0;
  v18 = v15 + (float)(v16 * -6.0);
  do
  {
    v38 = v17;
    v19 = *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v35, v17, &v38)+ 8);
    v37 = v17;
    *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v29, v17++, &v37)+ 8) = (float)(v19 - v16) / v18;
  }
  while (v17 != 6);
  v20 = v29;
  if (v29 != (uint64_t *)v30)
  {
    do
    {
      v21 = *((_DWORD *)v20 + 8);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", vision::mod::expressionAttributeTypeDescription[*((unsigned int *)v20 + 7)]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = v21;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, v22);

      v25 = (uint64_t *)v20[1];
      if (v25)
      {
        do
        {
          v26 = v25;
          v25 = (uint64_t *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          v26 = (uint64_t *)v20[2];
          v27 = *v26 == (_QWORD)v20;
          v20 = v26;
        }
        while (!v27);
      }
      v20 = v26;
    }
    while (v26 != (uint64_t *)v30);
  }
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v30[0]);
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v36[0]);

  return v5;
}

+ (id)createExpressionDetectionDictionaryFromScores:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  float v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t *v23;
  _QWORD *v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t *v29;
  _QWORD *v30[2];
  int v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
  v30[0] = 0;
  v30[1] = 0;
  v29 = (uint64_t *)v30;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v13 = v12;
        LODWORD(v23) = objc_msgSend(a1, "expressionTypeFromString:", v10);
        *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v29, (int)v23, &v23)+ 8) = v13;

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v7);
  }

  v14 = 0;
  v24[0] = 0;
  v24[1] = 0;
  v23 = (uint64_t *)v24;
  do
  {
    v31 = v14;
    if (*((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v29, v14, &v31)+ 8) <= vision::mod::expressionThresholds[v14])
    {
      v31 = v14;
      *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v23, v14, &v31)+ 8) = 0;
    }
    else
    {
      v31 = v14;
      *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v23, v14, &v31)+ 8) = 1065353216;
    }
    ++v14;
  }
  while (v14 != 6);
  v15 = v23;
  if (v23 != (uint64_t *)v24)
  {
    do
    {
      v16 = *((float *)v15 + 8);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", vision::mod::expressionAttributeTypeDescription[*((unsigned int *)v15 + 7)]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16 > 0.75);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v17);

      v19 = (uint64_t *)v15[1];
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (uint64_t *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (uint64_t *)v15[2];
          v21 = *v20 == (_QWORD)v15;
          v15 = v20;
        }
        while (!v21);
      }
      v15 = v20;
    }
    while (v20 != (uint64_t *)v24);
  }
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v24[0]);
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v30[0]);

  return v5;
}

void __65__VNFaceExpressionDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceExpressionDetector;
  objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addObject:", CFSTR("VNDetectorInitOption_ModelBackingStore"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)+[VNFaceExpressionDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceExpressionDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;

}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  char v9;
  _QWORD v11[5];
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VNFaceExpressionDetector;
  if (!-[VNDetector completeInitializationForSession:error:](&v13, sel_completeInitializationForSession_error_, a3))
    return 0;
  self->_modelFilesWereMemmapped = -[VNDetector backingStore](self, "backingStore") < 2;
  VNBinModelFilePathFromModelNameAndThrow(CFSTR("landmarkRefinerAndPupil_v2"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__VNFaceExpressionDetector_completeInitializationForSession_error___block_invoke;
  v11[3] = &unk_1E45488F0;
  v11[4] = self;
  v12 = v6;
  v7 = v6;
  v8 = _Block_copy(v11);
  v9 = VNExecuteBlock(v8, (uint64_t)a4);

  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_modelFilesWereMemmapped)
  {
    VNBinModelFilePathFromModelNameAndThrow(CFSTR("landmarkRefinerAndPupil_v2"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNModelFilesCache sharedInstance](VNModelFilesCache, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unload:", v3);

  }
  v5.receiver = self;
  v5.super_class = (Class)VNFaceExpressionDetector;
  -[VNDetector dealloc](&v5, sel_dealloc);
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  return 1;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const void *v22;
  id v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  float v37;
  char *v38;
  float32x2_t v39;
  id v40;
  void *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  void *v46;
  VNFaceExpressionDetector *v47;
  id v48;
  _QWORD *v49;
  void *__p;
  void *v51;
  uint64_t v52;
  float v53;
  float v54;
  float v55;
  float v56;
  _QWORD v57[7];
  _QWORD *v58[2];
  char *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v11, a8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[VNValidationUtilities requiredFaceObservationInOptions:error:](VNValidationUtilities, "requiredFaceObservationInOptions:error:", v11, a8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13)
    {
      v16 = 0;
      goto LABEL_29;
    }
    objc_msgSend(v13, "expressionsAndScores");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v63[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v14, "vn_cloneObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      if (a8)
      {
        +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
        v16 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_28;
    }
    objc_msgSend(v17, "landmarkPoints65");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = objc_retainAutorelease(v19);
      v22 = (const void *)objc_msgSend(v21, "bytes");
      if ((unint64_t)objc_msgSend(v21, "length") > 0x1F7)
      {
        v59 = 0;
        v60 = 0;
        v61 = 0;
        std::vector<_Geometry2D_point2D_>::__init_with_size[abi:ne180100]<_Geometry2D_point2D_*,_Geometry2D_point2D_*>(&v59, v22, (uint64_t)v22 + 504, 0x3FuLL);
        objc_msgSend(v18, "alignedBoundingBox");
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v32 = objc_msgSend(v12, "width");
        v33 = objc_msgSend(v12, "height");
        v34 = objc_msgSend(v12, "width");
        v35 = objc_msgSend(v12, "height");
        v36 = 0;
        v37 = v25 * (float)v32;
        v38 = v59;
        do
        {
          v39.f32[1] = v29 * (float)v35;
          v39.f32[0] = v31 * (float)v34;
          *(float32x2_t *)&v38[v36] = vmul_f32(v39, *(float32x2_t *)&v38[v36]);
          v36 += 8;
        }
        while (v36 != 504);
        v57[0] = 0;
        v57[1] = v57;
        v57[2] = 0x4812000000;
        v57[3] = __Block_byref_object_copy__7750;
        v57[4] = __Block_byref_object_dispose__7751;
        v58[0] = 0;
        v58[1] = 0;
        v57[5] = "";
        v57[6] = v58;
        v43 = MEMORY[0x1E0C809B0];
        v44 = 3321888768;
        v45 = __126__VNFaceExpressionDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
        v46 = &unk_1E453C248;
        v49 = v57;
        __p = 0;
        v47 = self;
        v53 = v37;
        v54 = v27 * (float)v33;
        v55 = v29 * (float)v35;
        v56 = v31 * (float)v34;
        v51 = 0;
        v52 = 0;
        std::vector<_Geometry2D_point2D_>::__init_with_size[abi:ne180100]<_Geometry2D_point2D_*,_Geometry2D_point2D_*>(&__p, v38, v60, (v60 - (uint64_t)v38) >> 3);
        v40 = v18;
        v48 = v40;
        v41 = _Block_copy(&v43);
        if ((VNExecuteBlock(v41, (uint64_t)a8) & 1) != 0)
        {
          v62 = v40;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1, v43, v44, v45, v46, v47);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }

        if (__p)
        {
          v51 = __p;
          operator delete(__p);
        }
        _Block_object_dispose(v57, 8);
        std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v58[0]);
        operator delete(v38);
        goto LABEL_27;
      }
      if (a8)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Corrupt face mark data"));
        v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
        v16 = 0;
        *a8 = v23;
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
    }
    else if (a8)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("VNFaceExpressionDetector face does not have landmark points"));
      v23 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v16 = 0;
    goto LABEL_27;
  }
  v16 = 0;
LABEL_30:

  return v16;
}

- (void).cxx_destruct
{
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->m_FaceAttributesImpl);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

uint64_t __126__VNFaceExpressionDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const float *v4;
  uint64_t i;
  float v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  int v15;
  void *v16;
  double v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  BOOL v21;
  _QWORD *exception;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t v26;
  int v27;
  void *__p;
  _BYTE *v29;
  float __Y[6];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  v25 = 0;
  v26 = 0;
  v24 = (uint64_t *)&v25;
  vision::mod::LandmarkAttributes::computePixelDistanceFeature(&__p, a1 + 80, (uint64_t *)(a1 + 56));
  v3 = (v29 - (_BYTE *)__p) >> 2;
  if (v3 != *(_QWORD *)(v2 + 104) >> 3)
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = 2940;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  v4 = *(const float **)(v2 + 112);
  vDSP_vsub(&v4[6 * v3], 1, (const float *)__p, 1, (float *)__p, 1, (v29 - (_BYTE *)__p) >> 2);
  vDSP_vdiv(&v4[7 * v3], 1, (const float *)__p, 1, (float *)__p, 1, (v29 - (_BYTE *)__p) >> 2);
  cblas_sgemv(CblasColMajor, CblasTrans, (unint64_t)(v29 - (_BYTE *)__p) >> 2, 6, 1.0, v4, (unint64_t)(v29 - (_BYTE *)__p) >> 2, (const float *)__p, 1, 0.0, __Y, 1);
  for (i = 0; i != 6; ++i)
  {
    v6 = __Y[i];
    v27 = i;
    *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v24, i, &v27)+ 8) = v6;
  }
  if (__p)
  {
    v29 = __p;
    operator delete(__p);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = v7 + 56;
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(*(_QWORD **)(v7 + 56));
  v9 = v25;
  *(_QWORD *)(v7 + 48) = v24;
  *(_QWORD *)(v7 + 56) = v9;
  v10 = v26;
  *(_QWORD *)(v7 + 64) = v26;
  if (v10)
  {
    v9[2] = v8;
    v24 = (uint64_t *)&v25;
    v25 = 0;
    v26 = 0;
    v9 = 0;
  }
  else
  {
    *(_QWORD *)(v7 + 48) = v8;
  }
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(_QWORD **)(v12 + 48);
  v14 = (_QWORD *)(v12 + 56);
  if (v13 != (_QWORD *)(v12 + 56))
  {
    do
    {
      v15 = *((_DWORD *)v13 + 8);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", vision::mod::expressionAttributeTypeDescription[*((unsigned int *)v13 + 7)]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v16);

      v19 = (_QWORD *)v13[1];
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (_QWORD *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (_QWORD *)v13[2];
          v21 = *v20 == (_QWORD)v13;
          v13 = v20;
        }
        while (!v21);
      }
      v13 = v20;
    }
    while (v20 != v14);
  }
  objc_msgSend(*(id *)(a1 + 40), "setExpressionsAndScores:", v11);

  return 1;
}

uint64_t __67__VNFaceExpressionDetector_completeInitializationForSession_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  vision::mod::LandmarkAttributes *v10;
  uint64_t result;
  id v12;
  _OWORD v13[2];
  int v14;
  _OWORD v15[2];
  int v16;

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 72))
  {
    +[VNModelFilesCache sharedInstance](VNModelFilesCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "load:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      if (a2)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Could not read expressions model data"));
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }

      return 0;
    }
    memset(v15, 0, sizeof(v15));
    v16 = 1065353216;
    cvml::util::binserialized_table_of_contents::init((cvml::util::binserialized_table_of_contents *)v15, (char *)objc_msgSend(v6, "baseAddress"), objc_msgSend(v6, "length"));
    memset(v13, 0, sizeof(v13));
    v14 = 1065353216;
    cvml::util::binserialized_contents::init_model_values((uint64_t)v13, (uint64_t)v15, 0, vision::mod::LandmarkAttributes::sModelFileInfo);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (_QWORD *)operator new();
    vision::mod::LandmarkAttributes::LandmarkAttributes(v9, v13, 1);
    std::shared_ptr<vision::mod::LandmarkAttributes>::reset[abi:ne180100]<vision::mod::LandmarkAttributes,void>(v8 + 56, (uint64_t)v9);
    std::__hash_table<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>>>::~__hash_table((uint64_t)v13);
    std::__hash_table<std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>>>::~__hash_table((uint64_t)v15);

  }
  else
  {
    v10 = (vision::mod::LandmarkAttributes *)operator new();
    vision::mod::LandmarkAttributes::LandmarkAttributes(v10, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), 1);
    std::shared_ptr<vision::mod::LandmarkAttributes>::reset[abi:ne180100]<vision::mod::LandmarkAttributes,void>(v4 + 56, (uint64_t)v10);
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    return 1;
  if (a2)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Could not create face expression module"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a2 = v12;
    return result;
  }
  return 0;
}

@end
