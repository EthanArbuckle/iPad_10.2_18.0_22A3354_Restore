@implementation VNSmartCam5CompoundRequest

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  VNSmartCam5CompoundRequest *v27;
  id v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  void (**v35)(void *, id, uint64_t);
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD aBlock[4];
  id v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__VNSmartCam5CompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke;
  aBlock[3] = &unk_1E45465F0;
  v33 = v5;
  v46 = v33;
  v35 = (void (**)(void *, id, uint64_t))_Block_copy(aBlock);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v32;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "frameworkClass");
        if (v10 == objc_opt_class())
        {
          v14 = v9;
          v35[2](v35, v14, objc_msgSend(v14, "imageCropAndScaleOption"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "specifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setDetectorConfigurationOption:value:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_GatingOriginatingRequestSpecifier"), v15);

          objc_msgSend(v14, "documentElements");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "recognize"))
          {
            objc_msgSend(v12, "setDetectorConfigurationOption:value:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingEnabled"), MEMORY[0x1E0C9AAB0]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v13, "generateSegmentationMask"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setDetectorConfigurationOption:value:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingGenerateSegmentationMask"), v16);

          }
          objc_msgSend(v14, "textElements");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "recognize"))
          {
            objc_msgSend(v12, "setDetectorConfigurationOption:value:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingEnabled"), MEMORY[0x1E0C9AAB0]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v17, "generateSegmentationMask"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setDetectorConfigurationOption:value:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingGenerateSegmentationMask"), v18);

          }
          objc_msgSend(v14, "machineReadableCodeElements");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "recognize"))
          {
            objc_msgSend(v12, "setDetectorConfigurationOption:value:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingEnabled"), MEMORY[0x1E0C9AAB0]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v19, "generateSegmentationMask"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setDetectorConfigurationOption:value:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingGenerateSegmentationMask"), v20);

          }
          goto LABEL_17;
        }
        if (v10 == objc_opt_class() && objc_msgSend(v9, "resolvedRevision") == 3737841665)
        {
          v11 = v9;
          v35[2](v35, v11, objc_msgSend(v11, "imageCropAndScaleOption"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setDetectorConfigurationOption:value:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_ClassificationEnabled"), MEMORY[0x1E0C9AAB0]);
          objc_msgSend(v11, "specifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setDetectorConfigurationOption:value:", CFSTR("VNSmartCam5GatingDetectorProcessingOption_ClassificationOriginatingRequestSpecifier"), v13);
LABEL_17:

          continue;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v33, "count"))
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v33, "allValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v22;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v34);
          v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          v27 = [VNSmartCam5CompoundRequest alloc];
          v28 = v26;
          v29 = v28;
          if (v27)
          {
            objc_msgSend(v28, "originalRequests");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v47.receiver = v27;
            v47.super_class = (Class)VNSmartCam5CompoundRequest;
            v27 = objc_msgSendSuper2(&v47, sel_initWithOriginalRequests_, v30);

            if (v27)
              objc_storeStrong((id *)&v27->_groupingConfiguration, v26);
          }

          objc_msgSend(v21, "addObject:", v27);
        }
        v22 = v34;
        v23 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      }
      while (v23);
    }

  }
  else
  {
    v21 = (id)MEMORY[0x1E0C9AA60];
  }

  return v21;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNSmartCam5GatingDetectorType");
  return CFSTR("VNSmartCam5GatingDetectorType");
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNSmartCam5CompoundRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v9, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  -[VNSmartCam5CompoundRequest groupingConfiguration]((id *)&self->super.super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detectorConfigurationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  return v5;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  _BYTE v43[128];
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v37 = a4;
  objc_msgSend(v37, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v36 = v8;
  -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v42, a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v42;
  if (v9)
  {
    v35 = v9;
    objc_msgSend(v37, "imageBufferAndReturnError:", a5);
    v10 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v10;
    if (v10)
    {
      v44[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v11, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      v12 = (void *)MEMORY[0x1E0CB37E8];
      if (self)
        v13 = -[VNSmartCam5CompoundRequestGroupingConfiguration imageCropAndScaleOption](self->_groupingConfiguration, "imageCropAndScaleOption");
      else
        v13 = 0;
      objc_msgSend(v12, "numberWithUnsignedInteger:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v14, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));

      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v15, CFSTR("VNSmartCam5GatingDetectorProcessingOption_ClassificationObservationsArray"));
      v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v33, "setObject:forKeyedSubscript:");
      v16 = objc_msgSend(v37, "qosClass");
      -[VNCompoundRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v9, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v16, v33, self, a5, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v17 != 0;
      if (v17)
      {
        v29 = v17;
        -[VNRequest setResults:](self, "setResults:");
        -[VNCompoundRequest recordWarningsInOriginalRequests](self, "recordWarningsInOriginalRequests");
        -[VNSmartCam5CompoundRequest groupingConfiguration]((id *)&self->super.super.super.isa);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "originalRequests");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v39 != v20)
                objc_enumerationMutation(v18);
              v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              v23 = objc_msgSend(v22, "frameworkClass");
              v24 = objc_opt_class();
              v25 = v15;
              if (v23 == v24 || (v26 = objc_opt_class(), v25 = v34, v23 == v26))
                v27 = v25;
              else
                v27 = 0;
              objc_msgSend(v22, "setResults:", v27);
              objc_msgSend(v37, "cacheObservationsOfRequest:", v22);

              v9 = v35;
              v8 = v36;
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          }
          while (v19);
        }

        v17 = v29;
      }

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingConfiguration, 0);
}

- (id)groupingConfiguration
{
  if (a1)
    a1 = (id *)a1[16];
  return a1;
}

VNSmartCam5CompoundRequestGroupingConfiguration *__94__VNSmartCam5CompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  VNSmartCam5CompoundRequestGroupingConfiguration *v7;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (VNSmartCam5CompoundRequestGroupingConfiguration *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[VNSmartCam5CompoundRequestGroupingConfiguration initWithImageCropAndScaleOption:]([VNSmartCam5CompoundRequestGroupingConfiguration alloc], "initWithImageCropAndScaleOption:", a3);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  -[VNSmartCam5CompoundRequestGroupingConfiguration addOriginalRequest:](v7, "addOriginalRequest:", v5);

  return v7;
}

@end
