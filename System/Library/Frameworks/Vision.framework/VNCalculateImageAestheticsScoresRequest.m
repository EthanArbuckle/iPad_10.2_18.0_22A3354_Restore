@implementation VNCalculateImageAestheticsScoresRequest

- (id)_configureDependentRequestForRevision:(unint64_t)a3 error:(id *)a4
{
  _VNCalculateImageAestheticsScoresDependentRequests *v7;
  _VNCalculateImageAestheticsScoresDependentRequests *v8;
  objc_class *v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = -[_VNCalculateImageAestheticsScoresDependentRequests initWithRevision:error:]([_VNCalculateImageAestheticsScoresDependentRequests alloc], "initWithRevision:error:", a3, a4);
  v8 = v7;
  if (a4 && !v7)
  {
    v9 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", 0, a3, 0);
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = (objc_class *)objc_opt_class();
    VNRequestRevisionString(v11, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@ is handled by %@"), v12, v13);

    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t m;
  void *v20;
  void *v21;
  void *v22;
  void *context;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  uint64_t k;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  -[VNCalculateImageAestheticsScoresRequest _configureDependentRequestForRevision:error:](self, "_configureDependentRequestForRevision:error:", -[VNRequest resolvedRevision](self, "resolvedRevision"), a3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v27, "requests");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
    if (!v5)
      goto LABEL_10;
    v6 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "supportedComputeStageDevicesAndReturnError:", a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {

          v9 = 0;
          goto LABEL_47;
        }
        objc_msgSend(v30, "addObject:", v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
    }
    while (v5);
LABEL_10:

    v26 = v30;
    context = (void *)MEMORY[0x1A1B0B060]();
    objc_msgSend(v26, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      if (objc_msgSend(v26, "count") == 1)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v25, 1);
        goto LABEL_46;
      }
      v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = v26;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v49;
        do
        {
          for (j = 0; j != v10; ++j)
          {
            if (*(_QWORD *)v49 != v11)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "allKeys");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObjectsFromArray:", v13);

          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
        }
        while (v10);
      }

      v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v29 = v35;
      v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      if (v32)
      {
        v31 = *(_QWORD *)v45;
        do
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v45 != v31)
              objc_enumerationMutation(v29);
            v14 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k);
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v43 = 0u;
            v15 = obj;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
            if (!v16)
            {
              v17 = v15;
              goto LABEL_42;
            }
            v17 = 0;
            v18 = *(_QWORD *)v41;
            do
            {
              for (m = 0; m != v16; ++m)
              {
                if (*(_QWORD *)v41 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * m), "objectForKey:", v14);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20)
                {
                  if (v17)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "intersectSet:", v21);

                  }
                  else
                  {
                    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v20);
                  }
                }

              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
            }
            while (v16);

            if (v17)
            {
              objc_msgSend(v17, "allObjects");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v22, v14);

LABEL_42:
              continue;
            }
          }
          v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        }
        while (v32);
      }

      v9 = (void *)objc_msgSend(v28, "copy");
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C9AA70];
    }
LABEL_46:

    objc_autoreleasePoolPop(context);
LABEL_47:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = &stru_1E4549388;
    v5 = &stru_1E4549388;
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VNCalculateImageAestheticsScoresRequest;
  if (-[VNRequest warmUpSession:error:](&v20, sel_warmUpSession_error_, v6, a4))
  {
    -[VNCalculateImageAestheticsScoresRequest _configureDependentRequestForRevision:error:](self, "_configureDependentRequestForRevision:error:", -[VNRequest resolvedRevision](self, "resolvedRevision"), a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v7, "requests", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v13, "applyConfigurationOfRequest:", self);
            if ((objc_msgSend(v13, "warmUpSession:error:", v6, a4) & 1) == 0)
            {
              v14 = 0;
              goto LABEL_14;
            }
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
          if (v10)
            continue;
          break;
        }
      }
      v14 = 1;
LABEL_14:

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  void *v7;
  char v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  uint64_t i;
  void *v23;
  void *v24;
  float v25;
  float v26;
  BOOL v27;
  float v29;
  uint64_t v30;
  float v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  float v43;
  void *v44;
  VNCalculateImageAestheticsScoresRequest *v45;
  void *v46;
  float v47;
  id v48;
  VNClassifyJunkImageRequest *v49;
  VNClassifyImageAestheticsRequest *v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  _BYTE v57[128];
  _QWORD v58[4];

  v58[2] = *MEMORY[0x1E0C80C00];
  v48 = a4;
  v50 = objc_alloc_init(VNClassifyImageAestheticsRequest);
  -[VNImageBasedRequest applyConfigurationOfRequest:](v50, "applyConfigurationOfRequest:", self);
  v49 = objc_alloc_init(VNClassifyJunkImageRequest);
  -[VNClassifyJunkImageRequest applyConfigurationOfRequest:](v49, "applyConfigurationOfRequest:", self);
  if (a3 == 1)
  {
    if (-[VNRequest setRevision:error:](v50, "setRevision:error:", 3737841667, a5)
      && -[VNRequest setRevision:error:](v49, "setRevision:error:", 3737841669, a5))
    {
      objc_msgSend(v48, "requestPerformerAndReturnError:", a5);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v46
        || (v45 = self,
            v58[0] = v50,
            v58[1] = v49,
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v46, "performDependentRequests:onBehalfOfRequest:inContext:error:", v7, self, v48, a5),
            v7,
            (v8 & 1) == 0))
      {
        v27 = 0;
LABEL_52:

        goto LABEL_31;
      }
      -[VNRequest results](v50, "results");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "aestheticScore");
      v43 = v10;
      objc_msgSend(v44, "failureScore");
      v12 = v11;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      -[VNRequest results](v49, "results");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = NAN;
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v53;
        v47 = NAN;
        v17 = NAN;
        v18 = NAN;
        v19 = NAN;
        v20 = NAN;
        v21 = NAN;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v53 != v16)
              objc_enumerationMutation(v13);
            v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_msgSend(v23, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "confidence");
            v26 = v25;
            if ((objc_msgSend(v24, "isEqualToString:", CFSTR("negative")) & 1) != 0)
            {
              v21 = v26;
            }
            else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("tragic_failure")) & 1) != 0)
            {
              v20 = v26;
            }
            else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("hier_poor_quality")) & 1) != 0)
            {
              v19 = v26;
            }
            else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("hier_non_memorable")) & 1) != 0)
            {
              v18 = v26;
            }
            else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("screenshot")) & 1) != 0)
            {
              v14 = v26;
            }
            else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("receipt_or_document")) & 1) != 0)
            {
              v47 = v26;
            }
            else if (objc_msgSend(v24, "isEqualToString:", CFSTR("hier_text_document")))
            {
              v17 = v26;
            }

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        }
        while (v15);
      }
      else
      {
        v47 = NAN;
        v17 = NAN;
        v18 = NAN;
        v19 = NAN;
        v20 = NAN;
        v21 = NAN;
      }

      v29 = -v12;
      if (v12 < -0.025 || v20 > 0.15 || v19 > 0.62)
      {
        v30 = 0;
        if (v20 >= v19)
          v31 = v20;
        else
          v31 = v19;
        if (v31 > v29)
          v12 = -v31;
        goto LABEL_49;
      }
      if (v18 > 0.675)
      {
        v30 = 1;
        if (v21 < 0.3 || v14 > 0.84 || v47 > 0.71)
          goto LABEL_43;
        v12 = v43;
        if (v17 >= 0.58)
        {
LABEL_49:
          -[VNRequest specifier](v45, "specifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v33 = v12;
          *(float *)&v34 = v43;
          *(float *)&v35 = v29;
          *(float *)&v36 = v21;
          *(float *)&v37 = v20;
          *(float *)&v38 = v19;
          *(float *)&v39 = v18;
          *(float *)&v40 = v14;
          +[VNImageAestheticsScoresObservation observationForOriginatingRequestSpecifier:isUtility:overallScore:aestheticScore:failureScore:junkNegativeScore:junkTragicFailureScore:poorQualityScore:nonMemorableScore:screenShotScore:receiptOrDocumentScore:textDocumentScore:error:](VNImageAestheticsScoresObservation, "observationForOriginatingRequestSpecifier:isUtility:overallScore:aestheticScore:failureScore:junkNegativeScore:junkTragicFailureScore:poorQualityScore:nonMemorableScore:screenShotScore:receiptOrDocumentScore:textDocumentScore:error:", v32, v30, a5, v33, v34, v35, v36, v37, v38, v39, v40, __PAIR64__(LODWORD(v17), LODWORD(v47)));
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = v41 != 0;
          if (v41)
          {
            v56 = v41;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[VNRequest setResults:](v45, "setResults:", v42);

          }
          goto LABEL_52;
        }
      }
      v30 = 0;
LABEL_43:
      v12 = v43;
      goto LABEL_49;
    }
    goto LABEL_30;
  }
  if (!a5)
  {
LABEL_30:
    v27 = 0;
    goto LABEL_31;
  }
  +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
  v27 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v27;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNCalculateImageAestheticsScoresRequest revisionAvailability]::ourRevisionAvailability;
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
  v7.super_class = (Class)&OBJC_METACLASS___VNCalculateImageAestheticsScoresRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

@end
