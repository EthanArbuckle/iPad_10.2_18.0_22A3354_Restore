@implementation VNFaceAnalyzerCompoundRequest

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNFaceAnalyzerCompoundRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(4000, self);
}

BOOL __73__VNFaceAnalyzerCompoundRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  void *v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceprint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceAnalyzer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = v3;
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "faceprint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4 == 0;
    if (!v4 || ((v7 ^ 1) & 1) != 0)
      goto LABEL_7;
  }
  else if (!v7)
  {
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v9, "faceAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11 == 0;

  if (v5)
LABEL_7:

LABEL_9:
  return v10;
}

uint64_t __73__VNFaceAnalyzerCompoundRequest_internalPerformRevision_inContext_error___block_invoke()
{
  return 0;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v29;
  _QWORD aBlock[4];
  id v31;
  id v32;

  v8 = a4;
  -[VNRequest configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a3, v10);
  objc_msgSend(v9, "detectorConfigurationOptions");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v12);

  v32 = 0;
  LOBYTE(v12) = +[VNValidationUtilities getOptionalFaceObservations:inOptions:error:](VNValidationUtilities, "getOptionalFaceObservations:inOptions:error:", &v32, v11, a5);
  v13 = v32;
  v14 = v13;
  if ((v12 & 1) != 0
    && (v13
     || (-[VNRequest detectFacesInContext:error:](self, "detectFacesInContext:error:", v8, a5),
         (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    v29 = v10;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__VNFaceAnalyzerCompoundRequest_internalPerformRevision_inContext_error___block_invoke_2;
    aBlock[3] = &unk_1E4543B00;
    v15 = v11;
    v31 = v15;
    v16 = _Block_copy(aBlock);
    -[VNCompoundRequest regionOfInterest](self, "regionOfInterest");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v9, "detectorType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v14, a3, v25, v15, &__block_literal_global_4146, v16, v18, v20, v22, v24, v8, a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v26 != 0;
    if (v26)
    {
      -[VNCompoundRequest recordWarningsInOriginalRequests](self, "recordWarningsInOriginalRequests");
      -[VNFaceAnalyzerCompoundRequest assignOriginalRequestsResultsFromObservations:obtainedInPerformingContext:](self, "assignOriginalRequestsResultsFromObservations:obtainedInPerformingContext:", v26, v8);
    }

    v10 = v29;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)assignOriginalRequestsResultsFromObservations:(id)a3 obtainedInPerformingContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v31 = v5;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16, v31);
  if (v10)
  {
    v11 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v14 = objc_opt_class();
        if (v14 == objc_opt_class())
        {
          v15 = v13;
          objc_msgSend(v15, "faceprint");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == 0;

          if (!v17)
            objc_msgSend(v7, "addObject:", v15);
          objc_msgSend(v15, "faceAttributes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 == 0;

          if (!v19)
            objc_msgSend(v8, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v10);
  }

  -[VNHomologousObservationClassCompoundRequest originalRequestsOfClass:](self, "originalRequestsOfClass:", objc_opt_class());
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(v24, "setResults:", v7);
        objc_msgSend(v6, "cacheObservationsOfRequest:", v24);
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v21);
  }

  -[VNHomologousObservationClassCompoundRequest originalRequestsOfClass:](self, "originalRequestsOfClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = v25;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v26);
        v30 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * k);
        objc_msgSend(v30, "setResults:", v8);
        objc_msgSend(v6, "cacheObservationsOfRequest:", v30);
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v27);
  }

}

uint64_t __97__VNFaceAnalyzerCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;

  v7 = a3;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:", &obj, 1, a4);
  objc_storeStrong((id *)(v8 + 40), obj);
  if ((v9 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addToGroupingsRequest:withFaceObservations:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "configurationForRequest:withObservationGroup:compoundRequestRevision:", v7, v10, a2);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDetectorConfigurationOption:value:", CFSTR("VNFaceAnalyzerMultiDetectorObservationGroupsForRequests"), v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDetectorConfigurationOption:value:", CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceAnalyzer"), MEMORY[0x1E0C9AAB0]);
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(v7, "specifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDetectorConfigurationOption:value:", CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionFaceAnalyzerOriginatingRequestSpecifier"), v15);

    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(v7, "inputFaceObservations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorProcessOption_InputFaceObservations"), v17);

    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "detectionLevel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorOption_RequestDetectionLevel"), v19);

    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "modelExecutionPriority"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorOption_EspressoPlanPriority"), v21);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setResolvedRevision:", a2);
  }

  return v9;
}

uint64_t __97__VNFaceAnalyzerCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;

  v7 = a3;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v7, "getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:", &obj, 1, a4);
  objc_storeStrong((id *)(v8 + 40), obj);
  if ((v9 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addToGroupingsRequest:withFaceObservations:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "configurationForRequest:withObservationGroup:compoundRequestRevision:", v7, v10, a2);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDetectorConfigurationOption:value:", CFSTR("VNFaceAnalyzerMultiDetectorObservationGroupsForRequests"), v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDetectorConfigurationOption:value:", CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionCreateFaceprint"), MEMORY[0x1E0C9AAB0]);
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v7, "specifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDetectorConfigurationOption:value:", CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionFaceprintOriginatingRequestSpecifier"), v15);

    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "forceFaceprintCreation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDetectorConfigurationOption:value:", CFSTR("VNFaceAnalyzerMultiDetectorProcessingOptionFaceprintForceFaceprintCreation"), v17);

    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v7, "inputFaceObservations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorProcessOption_InputFaceObservations"), v19);

    v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "detectionLevel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDetectorConfigurationOption:value:", CFSTR("VNDetectorOption_RequestDetectionLevel"), v21);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setResolvedRevision:", a2);
  }

  return v9;
}

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id *v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  char v16;
  uint64_t (**v17)(void *, _QWORD, uint64_t, id *);
  uint64_t v18;
  char v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v27;
  id obj;
  VNFaceAnalyzerFaceObservationGrouping *v29;
  VNFaceAnalyzerCompoundRequestConfigurationGroups *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  VNFaceAnalyzerFaceObservationGrouping *v37;
  VNFaceAnalyzerCompoundRequestConfigurationGroups *v38;
  uint64_t *v39;
  uint64_t *v40;
  _QWORD *v41;
  _QWORD v42[5];
  id v43;
  _QWORD aBlock[4];
  VNFaceAnalyzerFaceObservationGrouping *v45;
  VNFaceAnalyzerCompoundRequestConfigurationGroups *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v31 = objc_alloc_init(VNFaceAnalyzerCompoundRequestConfigurationGroups);
  v29 = objc_alloc_init(VNFaceAnalyzerFaceObservationGrouping);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v27;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v63;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v63 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v8);
        v56 = 0;
        v57 = &v56;
        v58 = 0x3032000000;
        v59 = __Block_byref_object_copy__4160;
        v60 = __Block_byref_object_dispose__4161;
        v61 = 0;
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE6467F8))
        {
          v10 = v9;
          v11 = (id *)(v57 + 5);
          v55 = (id)v57[5];
          v12 = objc_msgSend(v10, "getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:", &v55, 1, a5);
          objc_storeStrong(v11, v55);

          if ((v12 & 1) == 0)
          {
LABEL_29:
            _Block_object_dispose(&v56, 8);

            v20 = 0;
            v21 = obj;
            goto LABEL_30;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v9;
          v49 = 0;
          v50 = &v49;
          v51 = 0x3032000000;
          v52 = __Block_byref_object_copy__4160;
          v53 = __Block_byref_object_dispose__4161;
          v54 = 0;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __97__VNFaceAnalyzerCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke;
          aBlock[3] = &unk_1E4543A90;
          v47 = &v56;
          v45 = v29;
          v48 = &v49;
          v46 = v31;
          v14 = _Block_copy(aBlock);
          v15 = objc_msgSend(v13, "resolvedRevision");
          if ((unint64_t)(v15 - 3737841665) >= 6)
          {

            _Block_object_dispose(&v49, 8);
          }
          else
          {
            v16 = (*((uint64_t (**)(void *, _QWORD, id, id *))v14 + 2))(v14, *((_QWORD *)&unk_1A15E29E8 + v15 - 3737841665), v13, a5);

            _Block_object_dispose(&v49, 8);
            if ((v16 & 1) == 0)
              goto LABEL_29;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v49 = 0;
            v50 = &v49;
            v51 = 0x3032000000;
            v52 = __Block_byref_object_copy__4160;
            v53 = __Block_byref_object_dispose__4161;
            v54 = v9;
            v42[0] = 0;
            v42[1] = v42;
            v42[2] = 0x3032000000;
            v42[3] = __Block_byref_object_copy__4160;
            v42[4] = __Block_byref_object_dispose__4161;
            v43 = 0;
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __97__VNFaceAnalyzerCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke_2;
            v36[3] = &unk_1E4543AB8;
            v39 = &v56;
            v37 = v29;
            v40 = &v49;
            v41 = v42;
            v38 = v31;
            v17 = (uint64_t (**)(void *, _QWORD, uint64_t, id *))_Block_copy(v36);
            v18 = objc_msgSend((id)v50[5], "resolvedRevision");
            if ((unint64_t)(v18 - 3737841664) >= 7)
              goto LABEL_15;
            if (((0x6Fu >> v18) & 1) != 0)
              v19 = v17[2](v17, *((_QWORD *)&unk_1A15E2A18 + v18 - 3737841664), v50[5], a5);
            else
LABEL_15:
              v19 = 1;

            _Block_object_dispose(v42, 8);
            _Block_object_dispose(&v49, 8);

            if ((v19 & 1) == 0)
              goto LABEL_29;
          }
        }
        _Block_object_dispose(&v56, 8);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      if (v6)
        continue;
      break;
    }
  }

  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VNFaceAnalyzerCompoundRequestConfigurationGroups allConfigurations](v31, "allConfigurations");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v66, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v33;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDetectorType:configuration:", CFSTR("VNFaceAnalyzerMultiDetectorType"), *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v24));
        objc_msgSend(v20, "addObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v66, 16);
    }
    while (v22);
  }

LABEL_30:
  return v20;
}

- (VNFaceAnalyzerCompoundRequest)initWithDetectorType:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VNFaceAnalyzerCompoundRequest *v9;
  VNFaceAnalyzerCompoundRequest *v10;
  void *v11;
  void *v12;
  VNFaceAnalyzerCompoundRequest *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "originalRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)VNFaceAnalyzerCompoundRequest;
  v9 = -[VNHomologousObservationClassCompoundRequest initWithSubrequests:](&v15, sel_initWithSubrequests_, v8);
  v10 = v9;
  if (v9)
  {
    -[VNRequest configuration](v9, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDetectorType:", v6);
    objc_msgSend(v7, "detectorConfigurationOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDetectorConfigurationOptions:", v12);

    v13 = v10;
  }

  return v10;
}

- (unint64_t)detectionLevel
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[VNCompoundRequest originalRequests](self, "originalRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "detectionLevel");

  return v4;
}

+ (unint64_t)applicableRevisionForDependentRequestOfClass:(Class)a3 beingPerformedByRevision:(unint64_t)a4
{
  uint64_t v7;
  unint64_t result;
  objc_super v9;

  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    v7 = 3737841665;
    switch(a4)
    {
      case 4uLL:
        goto LABEL_11;
      case 5uLL:
        v7 = 3737841664;
        goto LABEL_11;
      case 6uLL:
        v7 = 3737841666;
        goto LABEL_11;
      case 7uLL:
        v7 = 3737841669;
        goto LABEL_11;
      default:
        if (a4 == 100)
        {
          v7 = 3737841667;
        }
        else
        {
          if (a4 != 101)
            goto LABEL_7;
          v7 = 3737841670;
        }
LABEL_11:
        result = +[VNRequest applicableRevisionForDependentRequestOfClass:beingPerformedByRevision:](VNClassifyFaceAttributesRequest, "applicableRevisionForDependentRequestOfClass:beingPerformedByRevision:", a3, v7);
        break;
    }
  }
  else
  {
LABEL_7:
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___VNFaceAnalyzerCompoundRequest;
    return (unint64_t)objc_msgSendSuper2(&v9, sel_applicableRevisionForDependentRequestOfClass_beingPerformedByRevision_, a3, a4);
  }
  return result;
}

@end
