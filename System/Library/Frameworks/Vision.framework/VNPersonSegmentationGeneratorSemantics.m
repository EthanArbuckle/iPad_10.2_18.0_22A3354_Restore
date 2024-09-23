@implementation VNPersonSegmentationGeneratorSemantics

+ (id)_inferenceDescriptorForModelConfiguredWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD block[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3464;
  v14 = __Block_byref_object_dispose__3465;
  v15 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__VNPersonSegmentationGeneratorSemantics__inferenceDescriptorForModelConfiguredWithOptions_error___block_invoke;
  block[3] = &unk_1E4548FA8;
  block[4] = &v10;
  if (+[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::onceToken != -1)
    dispatch_once(&+[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::onceToken, block);
  v6 = (void *)+[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor;
  if (+[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor)
  {
    v7 = (id)+[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor;
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease((id)v11[5]);
  }
  _Block_object_dispose(&v10, 8);

  return v6;
}

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
    objc_msgSend(a1, "_inferenceDescriptorForModelConfiguredWithOptions:error:", v6, a4);
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

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  objc_msgSend(a1, "inputImageBlobName", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)inputImageBlobName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_inferenceDescriptorForModelConfiguredWithOptions:error:", 0, 0);
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

+ (id)outputMaskBlobNames
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_inferenceDescriptorForModelConfiguredWithOptions:error:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v2, "humanAttributesMasksOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v2, "personsMaskOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(v2, "skyMaskOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  objc_msgSend(v2, "glassesMaskOutput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "name", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

+ (id)outputMaskBlobNameToRequestKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_inferenceDescriptorForModelConfiguredWithOptions:error:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "humanAttributesMasksOutput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count") + 3);
  v5 = (objc_class *)objc_opt_class();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
        NSStringFromClass(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name", (_QWORD)v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }

  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personsMaskOutput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v16);

  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "skyMaskOutput");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v20);

  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "glassesMaskOutput");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, v24);

  v25 = (void *)objc_msgSend(v4, "copy");
  return v25;
}

+ (id)outputMaskBlobNameToFeatureName
{
  if (+[VNPersonSegmentationGeneratorSemantics outputMaskBlobNameToFeatureName]::onceToken != -1)
    dispatch_once(&+[VNPersonSegmentationGeneratorSemantics outputMaskBlobNameToFeatureName]::onceToken, &__block_literal_global_3454);
  return (id)+[VNPersonSegmentationGeneratorSemantics outputMaskBlobNameToFeatureName]::outputMaskBlobNameToFeatureName;
}

+ (BOOL)rotateImageToMatchNetworkOrientation
{
  return 1;
}

+ (BOOL)inputMaskRequired
{
  return 0;
}

void __73__VNPersonSegmentationGeneratorSemantics_outputMaskBlobNameToFeatureName__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC6CD8], "objectClassOutputNameForObjectClassID:error:", 4, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v7[0] = CFSTR("human_attribute_skin");
  objc_msgSend(MEMORY[0x1E0DC6CD8], "objectClassOutputNameForObjectClassID:error:", 8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v7[1] = CFSTR("human_attribute_hair");
  objc_msgSend(MEMORY[0x1E0DC6CD8], "objectClassOutputNameForObjectClassID:error:", 16, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  v7[2] = CFSTR("human_attribute_facial_hair");
  objc_msgSend(MEMORY[0x1E0DC6CD8], "objectClassOutputNameForObjectClassID:error:", 32, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  v7[3] = CFSTR("human_attribute_teeth");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)+[VNPersonSegmentationGeneratorSemantics outputMaskBlobNameToFeatureName]::outputMaskBlobNameToFeatureName;
  +[VNPersonSegmentationGeneratorSemantics outputMaskBlobNameToFeatureName]::outputMaskBlobNameToFeatureName = v4;

}

void __98__VNPersonSegmentationGeneratorSemantics__inferenceDescriptorForModelConfiguredWithOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id obj;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v1 + 40);
  objc_msgSend(MEMORY[0x1E0DC6CD8], "semanticSegmentationV4AndReturnError:", &obj);
  v2 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v1 + 40), obj);
  v3 = (void *)+[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor;
  +[VNPersonSegmentationGeneratorSemantics _inferenceDescriptorForModelConfiguredWithOptions:error:]::descriptor = v2;

}

@end
