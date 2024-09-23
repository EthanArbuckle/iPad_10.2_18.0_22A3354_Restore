@implementation VNCreateTorsoprintRequest

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)dependentRequestCompatibility
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[VNCreateTorsoprintRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1EE603658 = objc_opt_class();
    unk_1EE603660 = vdupq_n_s64(1uLL);
    qword_1EE603670 = objc_opt_class();
    unk_1EE603678 = xmmword_1A15FB410;
    qword_1EE603688 = objc_opt_class();
    *(_OWORD *)algn_1EE603690 = xmmword_1A15FB490;
    qword_1EE6036A0 = objc_opt_class();
    *(_QWORD *)algn_1EE6036A8 = 1;
    qword_1EE6036B8 = 0;
    unk_1EE6036C0 = 0;
    qword_1EE6036B0 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNCreateTorsoprintRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 != a4)
    return 0;
  v8 = v4;
  v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNCreateTorsoprintRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNTorsoprintGeneratorDetectorType");
  return CFSTR("VNTorsoprintGeneratorDetectorType");
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(4000, self);
}

- (BOOL)_processFaceBasedInputInContext:(id)a3 revision:(unint64_t)a4 torsosThatNeedNoProcessing:(id)a5 torsosThatNeedTorsoprints:(id)a6 error:(id *)a7
{
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v17;

  v10 = a3;
  v17 = 0;
  v11 = -[VNImageBasedRequest getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:](self, "getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:", &v17, 1, a7);
  v12 = v17;
  v13 = v12;
  if (v11
    && (v12
     || (-[VNRequest detectFacesInContext:error:](self, "detectFacesInContext:error:", v10, a7),
         (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v13, a4, CFSTR("VNTorsoprintGeneratorDetectorType"), 0, &__block_literal_global_4542, &__block_literal_global_21, v10, a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;
    if (v14)
      -[VNRequest setResults:](self, "setResults:", v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_processHumanBodyBasedInputInContext:(id)a3 revision:(unint64_t)a4 torsosThatNeedNoProcessing:(id)a5 torsosThatNeedTorsoprints:(id)a6 error:(id *)a7
{
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v17;

  v10 = a3;
  v17 = 0;
  v11 = -[VNImageBasedRequest getOptionalValidatedInputDetectedObjectObservations:forObservationClass:relationWithRegionOfInterest:error:](self, "getOptionalValidatedInputDetectedObjectObservations:forObservationClass:relationWithRegionOfInterest:error:", &v17, objc_opt_class(), 1, a7);
  v12 = v17;
  v13 = v12;
  if (v11
    && (v12
     || (-[VNCreateTorsoprintRequest detectHumanBodiesInContext:error:](self, "detectHumanBodiesInContext:error:", v10, a7), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    -[VNCreateTorsoprintRequest _processHumanBodyObservations:revision:regionOfInterest:context:error:](self, "_processHumanBodyObservations:revision:regionOfInterest:context:error:", v13, a4, v10, a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;
    if (v14)
      -[VNRequest setResults:](self, "setResults:", v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_processHumanBodyObservations:(id)a3 revision:(unint64_t)a4 regionOfInterest:(CGRect)a5 context:(id)a6 error:(id *)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v14;
  dispatch_qos_class_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  dispatch_block_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  dispatch_group_t v43;
  id obj;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  _QWORD block[4];
  id v52;
  uint64_t v53;
  id v54;
  VNCreateTorsoprintRequest *v55;
  id v56;
  id v57;
  id v58;
  _QWORD *v59;
  uint64_t v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  unint64_t v65;
  dispatch_qos_class_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[6];
  int v72;
  id v73;
  _BYTE v74[128];
  _QWORD v75[4];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v75[1] = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v42 = a6;
  objc_msgSend(v42, "requestPerformerAndReturnError:", a7);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    objc_msgSend(v42, "imageBufferAndReturnError:", a7);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v39)
    {
      v35 = 0;
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend(v42, "session");
    v73 = 0;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v73, a4);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v73;
    if (!v48)
    {
      v35 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v75[0] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = a7;
    objc_msgSend(v49, "setObject:forKeyedSubscript:", v14, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

    v15 = objc_msgSend(v42, "qosClass");
    v16 = objc_msgSend(v41, "count");
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v16);
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v16);
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3812000000;
    v71[3] = __Block_byref_object_copy__4522;
    v71[4] = __Block_byref_object_dispose__4523;
    v71[5] = "";
    v72 = 0;
    -[VNRequest requestTasksQueue](self, "requestTasksQueue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = dispatch_group_create();
    v17 = objc_opt_class();
    v18 = objc_msgSend(v41, "count");
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v41;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v68 != v20)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
          v23 = (void *)objc_msgSend(v49, "mutableCopy");
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __99__VNCreateTorsoprintRequest__processHumanBodyObservations_revision_regionOfInterest_context_error___block_invoke;
          block[3] = &unk_1E4543CB0;
          v60 = v17;
          v66 = v15;
          v24 = v23;
          v52 = v24;
          v53 = v22;
          v25 = v48;
          v61 = x;
          v62 = y;
          v63 = width;
          v64 = height;
          v54 = v25;
          v55 = self;
          v59 = v71;
          v56 = v45;
          v57 = v47;
          v65 = v18;
          v26 = v46;
          v58 = v26;
          v27 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, 0, block);
          v28 = v27;
          if (v18 < 2)
            (*((void (**)(dispatch_block_t))v27 + 2))(v27);
          else
            objc_msgSend(v26, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v43, v27);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      }
      while (v19);
    }

    if (v18 < 2 || (objc_msgSend(v46, "dispatchGroupWait:error:", v43, v37) & 1) != 0)
    {
      if (+[VNValidationUtilities validateAsyncStatusResults:error:](VNValidationUtilities, "validateAsyncStatusResults:error:", v47, v37))
      {
        v35 = v45;
LABEL_23:

        _Block_object_dispose(v71, 8);
        goto LABEL_24;
      }
    }
    else
    {
      VNValidatedLog(4, (uint64_t)CFSTR("Timed out processing human observations: %@"), v29, v30, v31, v32, v33, v34, (uint64_t)obj);
    }
    v35 = 0;
    goto LABEL_23;
  }
  v35 = 0;
LABEL_26:

  return v35;
}

- (id)detectHumanBodiesInContext:(id)a3 error:(id *)a4
{
  id v6;
  VNDetectHumanRectanglesRequest *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(VNDetectHumanRectanglesRequest);
  -[VNDetectHumanRectanglesRequest applyConfigurationOfRequest:](v7, "applyConfigurationOfRequest:", self);
  objc_msgSend(v6, "requestPerformerAndReturnError:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (v13[0] = v7,
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "performDependentRequests:onBehalfOfRequest:inContext:error:", v9, self, v6, a4),
        v9,
        (v10 & 1) != 0))
  {
    -[VNRequest results](v7, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  BOOL v17;
  BOOL v18;
  uint64_t v20;

  v8 = a4;
  VNValidatedLog(1, (uint64_t)CFSTR("Processing Create Torsoprint request\n"), v9, v10, v11, v12, v13, v14, v20);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3 - 3737841666u <= 6 && ((1 << (a3 - 2)) & 0x71) != 0)
  {
    v17 = -[VNCreateTorsoprintRequest _processHumanBodyBasedInputInContext:revision:torsosThatNeedNoProcessing:torsosThatNeedTorsoprints:error:](self, "_processHumanBodyBasedInputInContext:revision:torsosThatNeedNoProcessing:torsosThatNeedTorsoprints:error:", v8, a3, v15, v16, a5);
  }
  else
  {
    if (a3 != 1)
    {
      if (a5)
      {
        +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:", a3, objc_opt_class());
        v18 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
LABEL_10:
      v18 = 0;
      goto LABEL_11;
    }
    v17 = -[VNCreateTorsoprintRequest _processFaceBasedInputInContext:revision:torsosThatNeedNoProcessing:torsosThatNeedTorsoprints:error:](self, "_processFaceBasedInputInContext:revision:torsosThatNeedNoProcessing:torsosThatNeedTorsoprints:error:", v8, 1, v15, v16, a5);
  }
  if (!v17)
    goto LABEL_10;
  v18 = 1;
LABEL_11:

  return v18;
}

void __99__VNCreateTorsoprintRequest__processHumanBodyObservations_revision_regionOfInterest_context_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  VNAsyncStatus *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  VNValidatedLog(1, (uint64_t)CFSTR("processOneHumanBodyBlock: start processing: %@"), a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 96));
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__29;
  v44 = __Block_byref_object_dispose__30;
  v45 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__VNCreateTorsoprintRequest__processHumanBodyObservations_revision_regionOfInterest_context_error___block_invoke_31;
  aBlock[3] = &unk_1E4543C88;
  v36 = *(_QWORD *)(a1 + 96);
  v39 = *(_DWORD *)(a1 + 144);
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v31 = v9;
  v32 = v10;
  v35 = &v40;
  v11 = *(id *)(a1 + 48);
  v12 = *(_OWORD *)(a1 + 120);
  v37 = *(_OWORD *)(a1 + 104);
  v38 = v12;
  v13 = *(_QWORD *)(a1 + 56);
  v33 = v11;
  v34 = v13;
  v14 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 40), "torsoprint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (v16)
  {
    v29 = 0;
    v21 = VNExecuteBlock(v14, (uint64_t)&v29);
    v20 = v29;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "vn_cloneObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v41[5];
    v41[5] = v18;

    v20 = 0;
    v21 = 1;
  }
  v22 = -[VNAsyncStatus initWithStatus:error:]([VNAsyncStatus alloc], "initWithStatus:error:", v21, v20);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 48));
  objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", v41[5]);
  objc_msgSend(*(id *)(a1 + 72), "addObject:", v22);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 48));
  VNValidatedLog(1, (uint64_t)CFSTR("processOneHumanBodyBlock: finish processing: %@"), v23, v24, v25, v26, v27, v28, *(_QWORD *)(a1 + 96));
  if (*(_QWORD *)(a1 + 136) >= 2uLL)
    objc_msgSend(*(id *)(a1 + 80), "dispatchReportBlockCompletion");

  _Block_object_dispose(&v40, 8);
}

BOOL __99__VNCreateTorsoprintRequest__processHumanBodyObservations_revision_regionOfInterest_context_error___block_invoke_31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  VNValidatedLog(1, (uint64_t)CFSTR("processHumanBodyBlock: start processing: %@"), a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 72));
  v15[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("VNTorsoprintGeneratorProcessOption_InputDetectedObjectObservation"));

  objc_msgSend(*(id *)(a1 + 48), "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", *(unsigned int *)(a1 + 112), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), a2, 0, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
}

BOOL __129__VNCreateTorsoprintRequest__processFaceBasedInputInContext_revision_torsosThatNeedNoProcessing_torsosThatNeedTorsoprints_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "faceTorsoprint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "torsoprint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

uint64_t __129__VNCreateTorsoprintRequest__processFaceBasedInputInContext_revision_torsosThatNeedNoProcessing_torsosThatNeedTorsoprints_error___block_invoke()
{
  return 0;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNCreateTorsoprintRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

+ (id)privateRevisionsSet
{
  if (+[VNCreateTorsoprintRequest(Revisioning) privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNCreateTorsoprintRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_123);
  return (id)+[VNCreateTorsoprintRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  unint64_t v3;
  __CFString *v4;
  objc_super v6;

  v3 = a3 - 3737841666u;
  if (a3 - 3737841666u < 7 && ((0x71u >> v3) & 1) != 0)
  {
    v4 = off_1E4543CD0[v3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___VNCreateTorsoprintRequest;
    objc_msgSendSuper2(&v6, sel_descriptionForPrivateRevision_);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

void __61__VNCreateTorsoprintRequest_Revisioning__privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF006uLL, a2, a3, a4, a5, a6, a7, a8, 3737841666);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNCreateTorsoprintRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
  +[VNCreateTorsoprintRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions = v8;

}

@end
