@implementation VNCreateAnimalprintRequest

+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4
{
  return objc_msgSend(a3, "registerRequestClass:revision:equivalencyToRevision:error:", a1, 3737841664, 1, a4);
}

+ (const)dependentRequestMappingTable
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[VNCreateAnimalprintRequest dependentRequestMappingTable]::ourDependentRequestMappingTable = 1;
    qword_1EE6403E0 = objc_opt_class();
    unk_1EE6403E8 = xmmword_1A15FB560;
    qword_1EE6403F8 = objc_opt_class();
    unk_1EE640400 = 1;
    qword_1EE640410 = 0;
    unk_1EE640418 = 0;
    qword_1EE640408 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNCreateAnimalprintRequest dependentRequestMappingTable]::ourDependentRequestMappingTable;
}

+ (BOOL)_isAnimalFaceprintingSupportedForRequestRevision:(unint64_t)a3
{
  return a3 == 3737841667;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v5;
  __CFString *v6;

  if (a3 == 3737841667 || a3 == 1)
  {
    v5 = CFSTR("VNAnimalprintDetectorDetectorType");
    v6 = CFSTR("VNAnimalprintDetectorDetectorType");
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(3000, self);
}

- (void)_determineAnimalsToProcessFrom:(id)a3 outputAnimalsThatNeedNoProcessing:(id)a4 outputAnimalsThatNeedAnimalprints:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  _BOOL4 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v16 = v9;
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v14, "animalprint", (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (v18)
            v16 = v9;
          else
            v16 = v8;
        }
        objc_msgSend(v16, "addObject:", v14, (_QWORD)v19);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  BOOL v29;
  VNRecognizeAnimalFacesRequest *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  unint64_t v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id *v58;
  void *v59;
  id obj;
  id obja;
  VNRecognizeAnimalsRequest *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  _BYTE v77[128];
  uint64_t v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;
  CGRect v82;
  CGRect v83;

  v81 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v76 = 0;
  v56 = v8;
  v9 = -[VNImageBasedRequest getOptionalValidatedInputDetectedObjectObservations:forObservationClass:relationWithRegionOfInterest:error:](self, "getOptionalValidatedInputDetectedObjectObservations:forObservationClass:relationWithRegionOfInterest:error:", &v76, objc_opt_class(), 1, a5);
  v57 = v76;
  if (v9)
  {
    v53 = a3;
    v58 = a5;
    v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v57)
    {
      -[VNCreateAnimalprintRequest _determineAnimalsToProcessFrom:outputAnimalsThatNeedNoProcessing:outputAnimalsThatNeedAnimalprints:](self, "_determineAnimalsToProcessFrom:outputAnimalsThatNeedNoProcessing:outputAnimalsThatNeedAnimalprints:", v57, v55, v10);
    }
    else
    {
      objc_msgSend(v8, "requestPerformerAndReturnError:", a5);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v54)
      {
        v29 = 0;
        goto LABEL_42;
      }
      v62 = objc_alloc_init(VNRecognizeAnimalsRequest);
      -[VNImageBasedRequest applyConfigurationOfRequest:](v62, "applyConfigurationOfRequest:", self);
      v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v62, 0);
      if (objc_msgSend((id)objc_opt_class(), "_isAnimalFaceprintingSupportedForRequestRevision:", v53))
      {
        v30 = objc_alloc_init(VNRecognizeAnimalFacesRequest);
        -[VNImageBasedRequest applyConfigurationOfRequest:](v30, "applyConfigurationOfRequest:", self);
        objc_msgSend(v59, "addObject:", v30);

      }
      if ((objc_msgSend(v54, "performDependentRequests:onBehalfOfRequest:inContext:error:", v59, self, v8, a5) & 1) == 0)
        goto LABEL_37;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      obja = v59;
      v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v73 != v32)
              objc_enumerationMutation(obja);
            v34 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            v68 = 0u;
            v69 = 0u;
            v70 = 0u;
            v71 = 0u;
            objc_msgSend(v34, "results");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
            if (v36)
            {
              v37 = *(_QWORD *)v69;
              do
              {
                for (j = 0; j != v36; ++j)
                {
                  if (*(_QWORD *)v69 != v37)
                    objc_enumerationMutation(v35);
                  v39 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
                  -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
                  v41 = v40;
                  v43 = v42;
                  v45 = v44;
                  v47 = v46;
                  objc_msgSend(v39, "boundingBox");
                  v83.origin.x = v48;
                  v83.origin.y = v49;
                  v83.size.width = v50;
                  v83.size.height = v51;
                  v82.origin.x = v41;
                  v82.origin.y = v43;
                  v82.size.width = v45;
                  v82.size.height = v47;
                  if (CGRectIntersectsRect(v82, v83))
                    objc_msgSend(v10, "addObject:", v39);
                }
                v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
              }
              while (v36);
            }

          }
          v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
        }
        while (v31);
      }

      v8 = v56;
    }
    objc_msgSend(v8, "session");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", v53, v54);
    v67 = v11;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v67, v53, v54, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (VNRecognizeAnimalsRequest *)v67;

    if (v59)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v55);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "imageBufferAndReturnError:", v58);
      v13 = objc_claimAutoreleasedReturnValue();
      obj = (id)v13;
      if (v13)
      {
        v78 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNRecognizeAnimalsRequest setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v14, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

        -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v23 = objc_msgSend(v56, "qosClass");
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v24 = v10;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v64;
          while (2)
          {
            for (k = 0; k != v25; ++k)
            {
              if (*(_QWORD *)v64 != v26)
                objc_enumerationMutation(v24);
              -[VNRecognizeAnimalsRequest setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k), CFSTR("VNAnimalprintDetectorProcessOption_InputAnimalObservation"));
              objc_msgSend(v59, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v23, v62, self, v58, 0, v16, v18, v20, v22);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v28)
              {

                goto LABEL_39;
              }
              objc_msgSend(v12, "addObjectsFromArray:", v28);

            }
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
            if (v25)
              continue;
            break;
          }
        }

        -[VNRequest setResults:](self, "setResults:", v12);
        v29 = 1;
      }
      else
      {
LABEL_39:
        v29 = 0;
      }

      goto LABEL_41;
    }
LABEL_37:
    v29 = 0;
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
  v29 = 0;
LABEL_43:

  return v29;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNCreateAnimalprintRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

+ (id)privateRevisionsSet
{
  if (+[VNCreateAnimalprintRequest(Revisioning) privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNCreateAnimalprintRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_15723);
  return (id)+[VNCreateAnimalprintRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3737841665u < 3)
    return off_1E4545C48[a3 - 3737841665u];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VNCreateAnimalprintRequest;
  objc_msgSendSuper2(&v4, sel_descriptionForPrivateRevision_);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __62__VNCreateAnimalprintRequest_Revisioning__privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF003uLL, a2, a3, a4, a5, a6, a7, a8, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNCreateAnimalprintRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
  +[VNCreateAnimalprintRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions = v8;

}

+ (id)createVNEntityIdentificationModelEntryPrintForRevision:(unint64_t)a3 fromDescriptorData:(const void *)a4 length:(unint64_t)a5 elementCount:(unint64_t)a6 error:(id *)a7
{
  VNAnimalprint *v11;
  double v12;

  v11 = [VNAnimalprint alloc];
  LODWORD(v12) = 1.0;
  return -[VNAnimalprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](v11, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", a4, a6, 1, a5, a3, v12);
}

@end
