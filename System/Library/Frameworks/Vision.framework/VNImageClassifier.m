@implementation VNImageClassifier

+ (BOOL)computeImageCropWithImage:(id)a3 regionOfInterest:(CGRect)a4 usingDescriptorProcessor:(ImageDescriptorProcessorAbstract *)a5 scalingImage:(BOOL)a6 options:(id)a7 pixelBuffer:(__CVBuffer *)a8 error:(id *)a9
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  int v20;
  int v21;
  float v22;
  float v23;
  float v24;
  unint64_t v25;
  unint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float v33;
  float v34;
  float v35;
  float v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  __CVBuffer *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  BOOL v48;
  void *v50;
  _BOOL4 v51;
  CGRect v52;
  CGRect v53;

  v51 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = a3;
  v19 = a7;
  v20 = objc_msgSend(v18, "width");
  v21 = objc_msgSend(v18, "height");
  v22 = (*((float (**)(ImageDescriptorProcessorAbstract *))a5->var0 + 19))(a5);
  v24 = v23;
  v25 = v20;
  v26 = v21;
  v27 = (double)(unint64_t)v20;
  v52.origin.x = x * v27;
  v52.size.width = width * v27;
  v28 = (double)(unint64_t)v21;
  v52.origin.y = y * v28;
  v52.size.height = height * v28;
  v53 = CGRectIntegral(v52);
  v29 = v53.origin.x;
  v30 = v53.origin.y;
  v31 = v53.size.width;
  v32 = v53.size.height;
  if (v51)
  {
    v33 = (float)((unint64_t)(float)(v22 + v24) >> 1);
    if (v20 <= v21)
    {
      v36 = v53.size.width;
      v35 = v33 / v36;
      v26 = vcvtps_u32_f32((float)(v33 / v36) * (float)v21);
      v25 = (unint64_t)(float)(v22 + v24) >> 1;
    }
    else
    {
      v34 = v53.size.height;
      v35 = v33 / v34;
      v25 = vcvtps_u32_f32((float)(v33 / v34) * (float)v20);
      v26 = (unint64_t)(float)(v22 + v24) >> 1;
    }
  }
  else
  {
    v35 = 1.0;
  }
  v37 = (*((uint64_t (**)(ImageDescriptorProcessorAbstract *))a5->var0 + 17))(a5);
  if (v37 == 1)
    v38 = 1;
  else
    v38 = 4;
  if (v37 == 1)
    v39 = 1278226488;
  else
    v39 = 1111970369;
  v40 = (__CVBuffer *)objc_msgSend(v18, "croppedBufferWithWidth:height:format:cropRect:options:error:", v25, v26, v39, v19, a9, v29, v30, v31, v32, a1);
  *a8 = v40;
  if (v40
    && (objc_msgSend(v18, "fileURL"),
        v41 = (void *)objc_claimAutoreleasedReturnValue(),
        v42 = objc_msgSend(v50, "_dumpIntermediatesFullImage:imageURL:requiredImageSource:imageProcessingType:error:", v19, v41, *a8, v38, a9), v41, (v42 & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v38);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v43, CFSTR("VNImageClassifierProcessingOption_ImageProcessingType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (unint64_t)(float)(v22 + v24) >> 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v44, CFSTR("VNImageClassifierProcessingOption_AveragedSideLength"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v51);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v45, CFSTR("VNImageClassifierProcessingOption_ScaleImage"));

    *(float *)&v46 = v35;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v47, CFSTR("VNImageClassifierProcessingOption_ScaleFactor"));

    v48 = 1;
  }
  else
  {
    v48 = 0;
  }

  return v48;
}

+ (BOOL)computeImageDescriptorsWithImage:(id)a3 pixelBuffer:(const __CVBuffer *)a4 regionOfInterest:(CGRect)a5 usingDescriptorProcessor:(ImageDescriptorProcessorAbstract *)a6 tileCount:(int)a7 augmentationMode:(unsigned int)a8 resultantDescriptorBuffer:(void *)a9 options:(id)a10 metalContext:(id)a11 canceller:(id)a12 tileColumns:(unint64_t *)a13 tileRows:(unint64_t *)a14 error:(id *)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  char v27;
  unint64_t v28;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  const __CVBuffer *v37;
  ImageDescriptorProcessorAbstract *v38;
  void *v39;
  id v40;
  unint64_t *v41;
  unint64_t *v42;
  int v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;

  v20 = a3;
  v21 = a10;
  v22 = a12;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __219__VNImageClassifier_computeImageDescriptorsWithImage_pixelBuffer_regionOfInterest_usingDescriptorProcessor_tileCount_augmentationMode_resultantDescriptorBuffer_options_metalContext_canceller_tileColumns_tileRows_error___block_invoke;
  aBlock[3] = &unk_1E4546640;
  v37 = a4;
  v23 = v21;
  v43 = a7;
  v32 = v23;
  v35 = &v49;
  v36 = &v45;
  v38 = a6;
  v24 = v22;
  v44 = a8;
  v33 = v24;
  v39 = a9;
  v40 = a1;
  v25 = v20;
  v34 = v25;
  v41 = a13;
  v42 = a14;
  v26 = _Block_copy(aBlock);
  v27 = VNExecuteBlock(v26, (uint64_t)a15);
  if (*((_DWORD *)v46 + 6))
  {
    v28 = 0;
    do
      free(*(void **)(v50[3] + 8 * v28++));
    while (v28 < *((unsigned int *)v46 + 6));
  }
  free((void *)v50[3]);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  return v27;
}

+ (BOOL)computeLabelsAndConfidence:(void *)a3 usingDescriptorBuffer:(void *)a4 populateLabelsAndConfidence:(void *)a5 options:(id)a6 metalContext:(id)a7 error:(id *)a8
{
  id v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  _QWORD v18[8];
  char v19;
  uint64_t v20;

  v12 = a6;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  v20 = 1;
  if (+[VNValidationUtilities getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:", &v20, CFSTR("VNDetectorOption_MetalContextPriority"), v12, 1, a8))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __125__VNImageClassifier_computeLabelsAndConfidence_usingDescriptorBuffer_populateLabelsAndConfidence_options_metalContext_error___block_invoke;
    v18[3] = &__block_descriptor_65_e9_B16__0__8l;
    v19 = v14;
    v18[4] = a3;
    v18[5] = v20;
    v18[6] = a5;
    v18[7] = a4;
    v15 = _Block_copy(v18);
    v16 = VNExecuteBlock(v15, (uint64_t)a8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)classifyImageWithDescriptors:(const void *)a3 usingImageClassifier:(void *)a4 andMinConfidenceForClassification:(float)a5 options:(id)a6 metalContext:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  double v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t j;
  uint64_t v30;
  VNClassificationObservation *v31;
  uint64_t v32;
  void *v33;
  double v34;
  VNClassificationObservation *v35;
  void *v36;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD aBlock[8];
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  uint64_t (*v50)(uint64_t);
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  int v54;
  void **v55;

  v13 = a6;
  v14 = a7;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v13, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x5812000000;
    v49 = __Block_byref_object_copy__20660;
    v50 = __Block_byref_object_dispose__20661;
    v51 = 0u;
    v52 = 0u;
    v53 = 0;
    v54 = 1065353216;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    v45 = 1;
    if (+[VNValidationUtilities getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:", &v45, CFSTR("VNDetectorOption_MetalContextPriority"), v13, 1, a8))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __132__VNImageClassifier_classifyImageWithDescriptors_usingImageClassifier_andMinConfidenceForClassification_options_metalContext_error___block_invoke;
      aBlock[3] = &unk_1E4546688;
      v44 = v17;
      aBlock[4] = &v46;
      aBlock[5] = a4;
      aBlock[6] = v45;
      aBlock[7] = a3;
      v18 = _Block_copy(aBlock);
      if ((VNExecuteBlock(v18, (uint64_t)a8) & 1) != 0)
      {
        v38 = v18;
        v39 = v14;
        ImageClassifier_getLabelsAuto(&v41, (uint64_t *)v47[8], a5, 0.1);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VNImageClassifierProcessingOption_DebugInfo"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v21 = v41;
          for (i = v42; v21 != i; v21 += 32)
          {
            LODWORD(v20) = *(_DWORD *)(v21 + 24);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v21;
            if (*(char *)(v21 + 23) < 0)
              v24 = *(_QWORD *)v21;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKey:", v23, v25);

          }
          objc_msgSend(v40, "setObject:forKey:", v19, CFSTR("labelsAndConfidence"));
          *(float *)&v26 = a5;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKey:", v27, CFSTR("MinConfidenceForClassificationRaw"));

        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (v42 - v41) >> 5);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v41;
        for (j = v42; v30 != j; v30 += 32)
        {
          v31 = [VNClassificationObservation alloc];
          v32 = v30;
          if (*(char *)(v30 + 23) < 0)
            v32 = *(_QWORD *)v30;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v34) = *(_DWORD *)(v30 + 24);
          v35 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v31, "initWithOriginatingRequestSpecifier:identifier:confidence:", v15, v33, v34);

          if (v35)
            objc_msgSend(v28, "addObject:", v35);

        }
        v55 = (void **)&v41;
        std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100](&v55);
        v18 = v38;
        v14 = v39;
      }
      else
      {
        v28 = 0;
      }

    }
    else
    {
      v28 = 0;
    }
    _Block_object_dispose(&v46, 8);
    std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node(*((void ***)&v52 + 1));
    v36 = (void *)*((_QWORD *)&v51 + 1);
    *((_QWORD *)&v51 + 1) = 0;
    if (v36)
      operator delete(v36);
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (id)classifyImageHierarchicallyWithDescriptors:(const void *)a3 usingImageClassifier:(void *)a4 hierarchicalClassifier:(ImageClassifier_HierarchicalModel *)a5 minimumClassificationConfidence:(float)a6 minimumClassificationConfidenceRatio:(float)a7 maximumLeafLabels:(unint64_t)a8 maximumHierarchicalLabels:(unint64_t)a9 options:(id)a10 metalContext:(id)a11 error:(id *)a12
{
  id v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  unint64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  _QWORD *v41;
  unint64_t v42;
  ImageClassifier_HierarchicalModel *v43;
  float v44;
  float v45;
  _QWORD aBlock[10];
  float v47;
  float v48;
  char v49;
  uint64_t v50;
  _QWORD v51[5];
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  uint64_t (*v60)(uint64_t);
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  int v64;

  v19 = a10;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v19, a12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v35 = a9;
    v56 = 0;
    v57 = &v56;
    v58 = 0x5812000000;
    v59 = __Block_byref_object_copy__20660;
    v60 = __Block_byref_object_dispose__20661;
    v61 = 0u;
    v62 = 0u;
    v63 = 0;
    v64 = 1065353216;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x5812000000;
    v51[3] = __Block_byref_object_copy__20660;
    v51[4] = __Block_byref_object_dispose__20661;
    v52 = 0u;
    v53 = 0u;
    v54 = 0;
    v55 = 1065353216;
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    v50 = 1;
    if (!+[VNValidationUtilities getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:", &v50, CFSTR("VNDetectorOption_MetalContextPriority"), v19, 1, a12))goto LABEL_7;
    v23 = MEMORY[0x1E0C809B0];
    if (!a8)
      goto LABEL_5;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __248__VNImageClassifier_classifyImageHierarchicallyWithDescriptors_usingImageClassifier_hierarchicalClassifier_minimumClassificationConfidence_minimumClassificationConfidenceRatio_maximumLeafLabels_maximumHierarchicalLabels_options_metalContext_error___block_invoke;
    aBlock[3] = &unk_1E45466B0;
    v49 = v22;
    aBlock[6] = a4;
    aBlock[7] = v50;
    v47 = a7;
    v48 = a6;
    aBlock[8] = a8;
    aBlock[9] = a3;
    aBlock[4] = &v56;
    aBlock[5] = v51;
    v24 = _Block_copy(aBlock);
    v25 = VNExecuteBlock(v24, (uint64_t)a12);

    if (v25)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v57[9]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("VNImageClassifierProcessingOption_DebugInfo"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v23;
      v36[1] = 3221225472;
      v36[2] = __248__VNImageClassifier_classifyImageHierarchicallyWithDescriptors_usingImageClassifier_hierarchicalClassifier_minimumClassificationConfidence_minimumClassificationConfidenceRatio_maximumLeafLabels_maximumHierarchicalLabels_options_metalContext_error___block_invoke_2;
      v36[3] = &unk_1E45466D8;
      v40 = &v56;
      v37 = v20;
      v28 = v26;
      v38 = v28;
      v39 = v27;
      v42 = v35;
      v43 = a5;
      v41 = v51;
      v44 = a6;
      v45 = a7;
      v29 = v27;
      v30 = _Block_copy(v36);
      if ((VNExecuteBlock(v30, (uint64_t)a12) & 1) != 0)
        v31 = v28;
      else
        v31 = 0;

    }
    else
    {
LABEL_7:
      v31 = 0;
    }
    _Block_object_dispose(v51, 8);
    std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node(*((void ***)&v53 + 1));
    v32 = (void *)*((_QWORD *)&v52 + 1);
    *((_QWORD *)&v52 + 1) = 0;
    if (v32)
      operator delete(v32);
    _Block_object_dispose(&v56, 8);
    std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node(*((void ***)&v62 + 1));
    v33 = (void *)*((_QWORD *)&v61 + 1);
    *((_QWORD *)&v61 + 1) = 0;
    if (v33)
      operator delete(v33);
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (BOOL)_dumpIntermediatesFullImage:(id)a3 imageURL:(id)a4 requiredImageSource:(const __CVBuffer *)a5 imageProcessingType:(int)a6 error:(id *)a7
{
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v28;
  void *v29;
  _QWORD v30[4];

  v11 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("VNImageClassifierProcessingOption_DebugIntermediatesDumpPath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = 1;
  if (a5 && v12)
  {
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("/"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v17, 1, 0, a7);

    if ((v14 & 1) != 0)
    {
      ++image_name_offset;
      v29 = v16;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByDeletingPathExtension");
        v21 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v21;
      }
      v28 = v19;
      objc_msgSend(v15, "stringByAppendingString:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1A1B0B060]();
      objc_msgSend(v22, "stringByAppendingString:", CFSTR("_source_scaled.png"));
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      saveCVPixelBuffer((const char *)objc_msgSend(v24, "UTF8String"), a5);
      CVPixelBufferLockBaseAddress(a5, 1uLL);
      v30[0] = CVPixelBufferGetBaseAddress(a5);
      v30[1] = CVPixelBufferGetHeight(a5);
      v30[2] = CVPixelBufferGetWidth(a5);
      v25 = (void *)v23;
      v30[3] = CVPixelBufferGetBytesPerRow(a5);
      objc_msgSend(v22, "stringByAppendingString:", CFSTR("_source_scaled.vdump"));
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      ImageProcessing_save((FILE *)objc_msgSend(v26, "UTF8String"), v30, a6);
      CVPixelBufferUnlockBaseAddress(a5, 1uLL);
      NSLog(CFSTR("VN Image Classifier debug intermediates written to: %@"), v15);

      objc_autoreleasePoolPop(v25);
      v16 = v29;
    }

  }
  return v14;
}

+ (BOOL)_dumpIntermediatesTiles:(id)a3 imageURL:(id)a4 requiredImageSource:(const __CVBuffer *)a5 imageProcessingType:(int)a6 allocatedTileCount:(unsigned int)a7 imageTiles:(const void *)a8 bytesPerPixel:(int)a9 numTiles:(unsigned int)a10 scaleFactor:(float)a11 augmentationMode:(unsigned int)a12 scalingImage:(BOOL)a13 error:(id *)a14
{
  id v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  const char *v44;
  _OWORD *v45;
  __int128 v46;
  OSType PixelFormatType;
  uint64_t v48;
  char *v49;
  unint64_t v50;
  char *v51;
  size_t v52;
  id v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v67;
  unint64_t v68;
  uint64_t v69;
  size_t __n;
  _OWORD v71[3];

  v18 = a3;
  v62 = a4;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNImageClassifierProcessingOption_DebugIntermediatesDumpPath"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("VNImageClassifierProcessingOption_DebugInfo"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = 1;
  if (a5 && v63)
  {
    v64 = (void *)v19;
    v59 = v18;
    if (v19)
    {
      objc_msgSend(v62, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v22;
      if (v22)
      {
        objc_msgSend(v22, "lastPathComponent");
        v25 = objc_claimAutoreleasedReturnValue();

        v26 = (__CFString *)v25;
      }
      else
      {
        v26 = CFSTR("<binary-data>");
      }
      *(float *)&v23 = a11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v27, CFSTR("scalingFactor"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a12);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v28, CFSTR("augmentationMode"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v29, CFSTR("numTiles"));

      objc_msgSend(v20, "setObject:forKey:", v26, CFSTR("imageID"));
    }
    objc_msgSend(v63, "stringByAppendingString:", CFSTR("/"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v61);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v60, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v30, 1, 0, a14);

    if ((v21 & 1) != 0)
    {
      objc_msgSend(v62, "path");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      ++image_name_offset;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringValue");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
      {
        objc_msgSend(v56, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringByDeletingPathExtension");
        v33 = objc_claimAutoreleasedReturnValue();

        v34 = (void *)v33;
      }
      else
      {
        v34 = v57;
      }
      v58 = v34;
      objc_msgSend(v61, "stringByAppendingString:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringByAppendingString:", CFSTR("_tile_"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (a7)
      {
        v37 = 0;
        v38 = a7;
        do
        {
          v39 = (void *)MEMORY[0x1A1B0B060]();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v37);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringValue");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringByAppendingString:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v42, "stringByAppendingString:", CFSTR(".png"));
          v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v44 = (const char *)objc_msgSend(v43, "UTF8String");
          v45 = (_OWORD *)(*(_QWORD *)a8 + 32 * v37);
          v46 = v45[1];
          v71[0] = *v45;
          v71[1] = v46;
          PixelFormatType = CVPixelBufferGetPixelFormatType(a5);
          saveVImage(v44, (unsigned __int8 **)v71, PixelFormatType);

          v48 = *(_QWORD *)a8 + 32 * v37;
          v68 = *(_QWORD *)(v48 + 8);
          v69 = *(_QWORD *)(v48 + 16);
          __n = v69 * a9;
          v49 = (char *)malloc_type_calloc(__n * v68, 1uLL, 0x7B0B3673uLL);
          v67 = v49;
          if (v68)
          {
            v50 = 0;
            v51 = *(char **)(*(_QWORD *)a8 + 32 * v37);
            v52 = __n;
            do
            {
              memcpy(v49, v51, v52);
              ++v50;
              v51 += *(_QWORD *)(*(_QWORD *)a8 + 32 * v37 + 24);
              v52 = __n;
              v49 += __n;
            }
            while (v50 < v68);
          }
          objc_msgSend(v42, "stringByAppendingString:", CFSTR(".vdump"));
          v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v20 = v64;
          ImageProcessing_save((FILE *)objc_msgSend(v53, "UTF8String"), &v67, a6);

          free(v67);
          objc_autoreleasePoolPop(v39);
          ++v37;
        }
        while (v37 != v38);
      }
      v18 = v59;
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", image_name_offset);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v54, CFSTR("debugID"));

      }
    }

  }
  return v21;
}

uint64_t __248__VNImageClassifier_classifyImageHierarchicallyWithDescriptors_usingImageClassifier_hierarchicalClassifier_minimumClassificationConfidence_minimumClassificationConfidenceRatio_maximumLeafLabels_maximumHierarchicalLabels_options_metalContext_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  float v3;
  float v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *exception;
  void *__p[2];
  void *v12;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(a1 + 48) + 48))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 88), *(unsigned int *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(float *)(a1 + 80);
  *(float *)(v2 + 104) = v3;
  if (v3 < 0.0)
    goto LABEL_11;
  v4 = *(float *)(a1 + 84);
  *(float *)(v2 + 100) = v4;
  if (v4 < 0.0)
    goto LABEL_11;
  v5 = *(_QWORD *)(a1 + 64);
  if (v5 > 0x7FFFFFFE)
    LODWORD(v5) = 0x7FFFFFFF;
  *(_DWORD *)(v2 + 108) = v5;
  if ((int)v5 <= 0)
  {
LABEL_11:
    exception = __cxa_allocate_exception(8uLL);
    *exception = 3964;
    __cxa_throw(exception, MEMORY[0x1E0DE4F28], 0);
  }
  *(_DWORD *)(v2 + 96) = 1;
  vision::mod::ImageClassifierAbstract::classifyDescriptors((vision::mod::ImageClassifierAbstract *)__p, (const vision::mod::ImageDescriptorBufferAbstract *)v2, *(_QWORD **)(a1 + 72), 1);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__move_assign(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, (uint64_t *)__p);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v12);
  v6 = __p[0];
  __p[0] = 0;
  if (v6)
    operator delete(v6);
  v7 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(v7 + 100) = 0x3400000000000000;
  *(_DWORD *)(v7 + 108) = 0x7FFFFFFF;
  *(_DWORD *)(v7 + 96) = 0;
  vision::mod::ImageClassifierAbstract::classifyDescriptors((vision::mod::ImageClassifierAbstract *)__p, (const vision::mod::ImageDescriptorBufferAbstract *)v7, *(_QWORD **)(a1 + 72), 0);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__move_assign(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48, (uint64_t *)__p);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v12);
  v8 = __p[0];
  __p[0] = 0;
  if (v8)
    operator delete(v8);
  return 1;
}

uint64_t __248__VNImageClassifier_classifyImageHierarchicallyWithDescriptors_usingImageClassifier_hierarchicalClassifier_minimumClassificationConfidence_minimumClassificationConfidenceRatio_maximumLeafLabels_maximumHierarchicalLabels_options_metalContext_error___block_invoke_2(uint64_t a1)
{
  uint64_t *i;
  _QWORD *v3;
  id v4;
  void *v5;
  VNClassificationObservation *v6;
  double v7;
  VNClassificationObservation *v8;
  id v9;
  double v10;
  uint64_t *j;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  double v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t m;
  id v32;
  uint64_t v33;
  void *v34;
  VNClassificationObservation *v35;
  double v36;
  VNClassificationObservation *v37;
  uint64_t v39;
  uint64_t v40;
  void *__p[2];
  void *v42;
  uint64_t v43;
  uint64_t v44;

  for (i = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 64); i; i = (uint64_t *)*i)
  {
    v3 = i + 2;
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (*((char *)i + 39) < 0)
      v3 = (_QWORD *)*v3;
    v5 = (void *)objc_msgSend(v4, "initWithUTF8String:", v3);
    v6 = [VNClassificationObservation alloc];
    LODWORD(v7) = *((_DWORD *)i + 10);
    v8 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v6, "initWithOriginatingRequestSpecifier:identifier:confidence:", *(_QWORD *)(a1 + 32), v5, v7);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    for (j = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 64); j; j = (uint64_t *)*j)
    {
      LODWORD(v10) = *((_DWORD *)j + 10);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = j + 2;
      if (*((char *)j + 39) < 0)
        v13 = (_QWORD *)*v13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v12, v14);

    }
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v9, CFSTR("labelsAndConfidence"));
    v15 = *(void **)(a1 + 48);
    LODWORD(v16) = *(_DWORD *)(a1 + 88);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("MinConfidenceForClassificationRaw"));

  }
  if (*(_QWORD *)(a1 + 72))
  {
    vision::mod::ImageClassifier_HierarchicalModel::infer((uint64_t)__p, *(uint64_t ***)(a1 + 80), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48), 1);
    ImageClassifier_getLabelsAuto(&v43, (uint64_t *)v42, *(float *)(a1 + 88), *(float *)(a1 + 92));
    std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v42);
    v18 = __p[0];
    __p[0] = 0;
    if (v18)
      operator delete(v18);
    v19 = *(_QWORD *)(a1 + 72);
    if ((v19 | 0x8000000000000000) != 0xFFFFFFFFFFFFFFFFLL)
    {
      v39 = v44;
      if (v19 < (v44 - v43) >> 5)
      {
        v40 = v43 + 32 * v19;
        while (v39 != v40)
        {
          if (*(char *)(v39 - 9) < 0)
            operator delete(*(void **)(v39 - 32));
          v39 -= 32;
        }
        v44 = v40;
      }
    }
    if (*(_QWORD *)(a1 + 48))
    {
      v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v22 = v43;
      for (k = v44; v22 != k; v22 += 32)
      {
        LODWORD(v21) = *(_DWORD *)(v22 + 24);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21, __p[0]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v22;
        if (*(char *)(v22 + 23) < 0)
          v25 = *(_QWORD *)v22;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v24, v26);

      }
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v20, CFSTR("hierarchicalLabelsAndConfidence"), __p[0]);
      v27 = *(void **)(a1 + 48);
      LODWORD(v28) = *(_DWORD *)(a1 + 88);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKey:", v29, CFSTR("MinConfidenceForHierarchical"));

    }
    v30 = v43;
    for (m = v44; v30 != m; v30 += 32)
    {
      v32 = objc_alloc(MEMORY[0x1E0CB3940]);
      v33 = v30;
      if (*(char *)(v30 + 23) < 0)
        v33 = *(_QWORD *)v30;
      v34 = (void *)objc_msgSend(v32, "initWithUTF8String:", v33, __p[0]);
      v35 = [VNClassificationObservation alloc];
      LODWORD(v36) = *(_DWORD *)(v30 + 24);
      v37 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v35, "initWithOriginatingRequestSpecifier:identifier:confidence:", *(_QWORD *)(a1 + 32), v34, v36);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v37);

    }
    __p[0] = &v43;
    std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }
  return 1;
}

uint64_t __132__VNImageClassifier_classifyImageWithDescriptors_usingImageClassifier_andMinConfidenceForClassification_options_metalContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *__p[5];

  (*(void (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(a1 + 40) + 48))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(unsigned int *)(a1 + 48));
  vision::mod::ImageClassifierAbstract::classifyDescriptors((vision::mod::ImageClassifierAbstract *)__p, *(const vision::mod::ImageDescriptorBufferAbstract **)(a1 + 40), *(_QWORD **)(a1 + 56), 1);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__move_assign(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, (uint64_t *)__p);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)__p[2]);
  v2 = __p[0];
  __p[0] = 0;
  if (v2)
    operator delete(v2);
  return 1;
}

uint64_t __125__VNImageClassifier_computeLabelsAndConfidence_usingDescriptorBuffer_populateLabelsAndConfidence_options_metalContext_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void **v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64x2_t v8;
  void *v9;
  int64x2_t *v10;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(a1 + 32) + 48))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(unsigned int *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v2 + 100) = 0x3400000000000000;
  *(_DWORD *)(v2 + 108) = 0x7FFFFFFF;
  vision::mod::ImageClassifierAbstract::classifyDescriptorsNoComulative(&v8, (const vision::mod::ImageDescriptorBufferAbstract *)v2, *(_QWORD **)(a1 + 56), 0);
  v3 = *(void ***)(a1 + 48);
  v4 = *v3;
  if (*v3)
  {
    v5 = (uint64_t)v3[1];
    v6 = *v3;
    if ((void *)v5 != v4)
    {
      do
        v5 = std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::~__hash_table(v5 - 40);
      while ((void *)v5 != v4);
      v6 = *v3;
    }
    v3[1] = v4;
    operator delete(v6);
    *v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
  }
  *(int64x2_t *)v3 = v8;
  v3[2] = v9;
  v8 = 0uLL;
  v9 = 0;
  v10 = &v8;
  std::vector<std::unordered_map<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v10);
  return 1;
}

uint64_t __219__VNImageClassifier_computeImageDescriptorsWithImage_pixelBuffer_regionOfInterest_usingDescriptorProcessor_tileCount_augmentationMode_resultantDescriptorBuffer_options_metalContext_canceller_tileColumns_tileRows_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  size_t Width;
  size_t Height;
  void *v6;
  uint64_t v7;
  __CVBuffer *v8;
  void *BaseAddressOfPlane;
  unsigned int v10;
  void *v11;
  unint64_t v12;
  int64x2_t v13;
  size_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int64x2_t v28;
  int64x2_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  int v42;
  unint64_t v43;
  int v44;
  float v45;
  float v46;
  int v47;
  unint64_t v48;
  uint64_t v49;
  int v50;
  _QWORD *v51;
  BOOL v52;
  unint64_t v53;
  int v55;
  unsigned int v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v67;
  char v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  int v75;
  void *v76;
  uint64_t v77;
  void *v78;
  double v79;
  char v80;
  _QWORD *v81;
  _QWORD *v82;
  uint64_t v83;
  int v84;
  unint64_t v85;
  int v86;
  _QWORD *v87;
  int v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unsigned int v92;
  int64x2_t v93;
  unint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  size_t BytesPerRowOfPlane;
  char v99;
  _QWORD aBlock[4];
  id v101;
  uint64_t v102;
  uint64_t v103;
  void *__p;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  int v109;
  char v110;
  uint64_t v111;
  char *v112;
  char *v113;
  char *v114;

  Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 72));
  Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("VNImageClassifierProcessingOption_ImageProcessingType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = *(__CVBuffer **)(a1 + 72);
  if ((_DWORD)v7 == 1)
  {
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v8, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(a1 + 72), 0);
    v10 = 1;
  }
  else
  {
    BaseAddressOfPlane = CVPixelBufferGetBaseAddress(v8);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 72));
    v10 = 4;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("VNImageClassifierProcessingOption_AveragedSideLength"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");
  v13.i64[0] = Height;
  v13.i64[1] = Width;
  v93 = v13;

  if (Width <= Height)
    v14 = Height;
  else
    v14 = Width;
  v15 = (v14 / v12) | 1;
  if (*(_DWORD *)(a1 + 120))
    v16 = *(_DWORD *)(a1 + 120);
  else
    v16 = v15;
  v17 = vcvtms_s32_f32((float)((float)Width / (float)Height) * (float)v16);
  v18 = vcvtms_s32_f32((float)((float)Height / (float)Width) * (float)v16);
  if (Width <= Height)
    v18 = v16;
  else
    v17 = v16;
  if (Width < v12
    || (v17 >= 2
      ? (v21 = (v17 - 1),
         v19 = vcvtms_u32_f32((float)((float)(Width - v12) / (float)(v12 * v21)) * (float)v12),
         v20 = v12 + v19 * v21)
      : (v19 = 0, v20 = v12),
        Height < v12))
  {
    if (a2)
    {
      v22 = 4220;
LABEL_61:
      VNErrorForCVMLStatus((id)v22);
      v65 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      return v65;
    }
    return 0;
  }
  v97 = v10;
  v23 = (Width - v20) >> 1;
  if (v18 >= 2)
  {
    v26 = (v18 - 1);
    v24 = vcvtms_u32_f32((float)((float)(Height - v12) / (float)(v12 * v26)) * (float)v12);
    v25 = v12 + v24 * v26;
  }
  else
  {
    v24 = 0;
    v25 = v12;
  }
  v27 = (Height - v25) >> 1;
  if ((float)((float)Width + -1.0) >= (float)v23 && (float)((float)Height + -1.0) >= (float)v27)
    v91 = (unint64_t)BaseAddressOfPlane
        + BytesPerRowOfPlane * (unint64_t)(float)v27
        + (unint64_t)(float)v23 * v10;
  else
    v91 = 0;
  v28.i64[0] = v27;
  v28.i64[1] = v23;
  v29 = vsubq_s64(v93, vaddq_s64(v28, v28));
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v89 = v29.u64[1];
  if (v19)
    v31 = ((v29.i64[1] - v12) / v19) + 1;
  else
    v31 = 1;
  v92 = v10;
  v94 = v29.i64[0];
  if (v24)
  {
    v32 = v7;
    v33 = v24;
    v34 = ((v29.i64[0] - v12) / v24) + 1;
  }
  else
  {
    v33 = 0;
    v32 = v7;
    v34 = 1;
  }
  v35 = v31;
  v88 = v31 * v34;
  v36 = malloc_type_calloc((int)v31 * (int)v34, 8uLL, 0x2004093837F09uLL);
  *(_QWORD *)(v30 + 24) = v36;
  if (!v36)
  {
LABEL_59:
    v22 = 4219;
LABEL_60:
    if (a2)
      goto LABEL_61;
    return 0;
  }
  v37 = (int)v34 < 1;
  v38 = v35;
  v39 = v34;
  v40 = v32;
  v41 = v92;
  if (!v37)
  {
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = (float)v89 + -1.0;
    v46 = (float)v94 + -1.0;
    if ((int)v38 <= 1)
      v47 = 1;
    else
      v47 = v38;
    v87 = a2;
    v85 = v33;
    v84 = v47;
    while ((int)v38 < 1)
    {
LABEL_51:
      v43 += v33;
      if (++v42 >= (int)v39)
        goto LABEL_52;
    }
    v86 = v42;
    v90 = v39;
    v95 = v38;
    v48 = 0;
    v49 = v44;
    v50 = v47;
    while (1)
    {
      v51 = malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
      if (!v51)
        break;
      v52 = v45 < (float)v48 || v46 < (float)v43;
      v53 = v91 + BytesPerRowOfPlane * (unint64_t)(float)v43 + (unint64_t)(float)v48 * v97;
      if (v52 || v53 == 0)
      {
        free(v51);
        v22 = 4221;
        a2 = v87;
        goto LABEL_60;
      }
      *v51 = v53;
      v51[1] = v12;
      v51[2] = v12;
      v51[3] = BytesPerRowOfPlane;
      *(_QWORD *)(*(_QWORD *)(v30 + 24) + 8 * v49) = v51;
      v48 += v19;
      ++v49;
      if (!--v50)
      {
        v44 = v49;
        a2 = v87;
        v33 = v85;
        v40 = v32;
        v41 = v92;
        v38 = v95;
        v39 = v90;
        v42 = v86;
        v47 = v84;
        goto LABEL_51;
      }
    }
    a2 = v87;
    goto LABEL_59;
  }
LABEL_52:
  v96 = v38;
  v55 = v39;
  v56 = v41;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v88;
  v57 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v113 = 0;
  v114 = 0;
  v112 = 0;
  if ((_DWORD)v57)
  {
    v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v57);
    v112 = v58;
    v114 = &v58[32 * v59];
    bzero(v58, 32 * v57);
    v60 = (uint64_t)&v58[32 * v57];
    v113 = (char *)v60;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v61 = 0;
      v62 = v58;
      do
      {
        v63 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + 8 * v61);
        v64 = *(_QWORD *)(v63 + 24);
        *(_QWORD *)v62 = *(_QWORD *)v63;
        *(_OWORD *)(v62 + 8) = *(_OWORD *)(v63 + 8);
        *((_QWORD *)v62 + 3) = v64;
        ++v61;
        v62 += 32;
      }
      while (v61 < *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    }
  }
  else
  {
    v58 = 0;
    v60 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("VNDetectorOption_PreferBackgroundProcessing"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "BOOLValue");

  v111 = 1;
  if (+[VNValidationUtilities getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getMTLGPUPriority:forKey:inOptions:withDefaultValue:error:", &v111, CFSTR("VNDetectorOption_MetalContextPriority"), *(_QWORD *)(a1 + 32), 1, a2))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3321888768;
    aBlock[2] = __219__VNImageClassifier_computeImageDescriptorsWithImage_pixelBuffer_regionOfInterest_usingDescriptorProcessor_tileCount_augmentationMode_resultantDescriptorBuffer_options_metalContext_canceller_tileColumns_tileRows_error___block_invoke_2;
    aBlock[3] = &unk_1E453C280;
    v69 = *(_QWORD *)(a1 + 80);
    v110 = v68;
    v102 = v69;
    v103 = v111;
    v108 = v40;
    v70 = *(id *)(a1 + 40);
    v109 = *(_DWORD *)(a1 + 124);
    v101 = v70;
    __p = 0;
    v105 = 0;
    v106 = 0;
    std::vector<vImage_Buffer>::__init_with_size[abi:ne180100]<vImage_Buffer*,vImage_Buffer*>(&__p, v58, v60, (v60 - (uint64_t)v58) >> 5);
    v107 = *(_QWORD *)(a1 + 88);
    v71 = _Block_copy(aBlock);
    if ((VNExecuteBlock(v71, (uint64_t)a2) & 1) == 0)
      goto LABEL_74;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("VNImageClassifierProcessingOption_ScaleImage"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v72, "BOOLValue");

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("VNImageClassifierProcessingOption_ScaleFactor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "floatValue");
    v75 = v74;

    v76 = *(void **)(a1 + 96);
    v77 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "fileURL");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE4(v83) = v99;
    LODWORD(v83) = *(_DWORD *)(a1 + 124);
    LODWORD(v79) = v75;
    v80 = objc_msgSend(v76, "_dumpIntermediatesTiles:imageURL:requiredImageSource:imageProcessingType:allocatedTileCount:imageTiles:bytesPerPixel:numTiles:scaleFactor:augmentationMode:scalingImage:error:", v77, v78, *(_QWORD *)(a1 + 72), v40, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), &v112, v79, __PAIR64__(v16, v56), v83, a2);

    if ((v80 & 1) != 0)
    {
      v81 = *(_QWORD **)(a1 + 104);
      if (v81)
        *v81 = v96;
      v82 = *(_QWORD **)(a1 + 112);
      if (v82)
        *v82 = v55;
      v65 = 1;
    }
    else
    {
LABEL_74:
      v65 = 0;
    }

    if (__p)
    {
      v105 = __p;
      operator delete(__p);
    }

    v58 = v112;
  }
  else
  {
    v65 = 0;
  }
  if (v58)
  {
    v113 = v58;
    operator delete(v58);
  }
  return v65;
}

BOOL __219__VNImageClassifier_computeImageDescriptorsWithImage_pixelBuffer_regionOfInterest_usingDescriptorProcessor_tileCount_augmentationMode_resultantDescriptorBuffer_options_metalContext_canceller_tileColumns_tileRows_error___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];
  __int128 v11;
  __int128 v12;
  int v13;
  _QWORD aBlock[4];
  id v15;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(a1 + 40) + 120))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 96), *(unsigned int *)(a1 + 48));
  if ((*(_DWORD *)(a1 + 88) & 4) != 0)
    v4 = 4;
  else
    v4 = *(_DWORD *)(a1 + 88) & 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __219__VNImageClassifier_computeImageDescriptorsWithImage_pixelBuffer_regionOfInterest_usingDescriptorProcessor_tileCount_augmentationMode_resultantDescriptorBuffer_options_metalContext_canceller_tileColumns_tileRows_error___block_invoke_3;
  aBlock[3] = &unk_1E4546618;
  v15 = *(id *)(a1 + 32);
  v5 = _Block_copy(aBlock);
  v6 = *(_DWORD *)(a1 + 92);
  if (v6)
  {
    v11 = 0u;
    v12 = 0u;
    v13 = v6;
    v7 = 1;
    if ((v6 & 1) != 0)
      v7 = 2;
    v10[0] = &off_1E453A870;
    v10[1] = v7 << ((v6 & 2) != 0);
    v8 = (void *)(*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD *, void *, _QWORD))(**(_QWORD **)(a1 + 40)
                                                                                               + 104))(*(_QWORD *)(a1 + 40), a1 + 56, v4, v10, v5, *(_QWORD *)(a1 + 80));
    vision::mod::ImageDescriptorAugmenterAbstract::~ImageDescriptorAugmenterAbstract((vision::mod::ImageDescriptorAugmenterAbstract *)v10);
  }
  else
  {
    v8 = (void *)(*(uint64_t (**)(_QWORD, uint64_t, uint64_t, void *, _QWORD))(**(_QWORD **)(a1 + 40) + 96))(*(_QWORD *)(a1 + 40), a1 + 56, v4, v5, *(_QWORD *)(a1 + 80));
  }
  if (a2 && v8 != 128)
  {
    VNErrorForCVMLStatus(v8);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8 == 128;
}

uint64_t __219__VNImageClassifier_computeImageDescriptorsWithImage_pixelBuffer_regionOfInterest_usingDescriptorProcessor_tileCount_augmentationMode_resultantDescriptorBuffer_options_metalContext_canceller_tileColumns_tileRows_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "wasSignalled");
}

@end
