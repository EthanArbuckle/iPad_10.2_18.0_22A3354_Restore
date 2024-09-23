@implementation VNANFDDetectorCompoundRequest

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNANFDDetectorCompoundRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(1000, self);
}

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v23;
  id obj;
  VNANFDDetectorCompoundRequestConfigurationGroups *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v25 = objc_alloc_init(VNANFDDetectorCompoundRequestConfigurationGroups);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v23;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
    v8 = *MEMORY[0x1E0C99768];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v11 = +[VNANFDMultiDetector anfdMultiDetectorClassToProcessRequest:](VNANFDMultiDetector, "anfdMultiDetectorClassToProcessRequest:", v10);
        if (v11)
        {
          -[objc_class requestInfoForRequest:](v11, "requestInfoForRequest:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("The request info is not found for request class %@"), objc_opt_class(), v23);
          -[VNANFDDetectorCompoundRequestConfigurationGroups configurationForRequest:](v25, "configurationForRequest:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "originatingRequestSpecifierKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "specifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setDetectorConfigurationOption:value:", v14, v15);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VNANFDDetectorCompoundRequestConfigurationGroups allConfigurations](v25, "allConfigurations");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDetectorType:configuration:", CFSTR("VNANFDMultiDetectorType"), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
        objc_msgSend(v16, "addObject:", v21);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v18);
  }

  return v16;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  -[VNRequest configuration](self, "configuration", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detectorType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (a4)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[VNRequest specifier](self, "specifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("detector type has not been configured for %@"), v11);

    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __67__VNANFDDetectorCompoundRequest_compoundRequestRevisionForRequest___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[7];
  _QWORD v33[9];

  v33[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  +[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision = v0;

  v2 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v32[0] = &unk_1E459D168;
  v32[1] = &unk_1E459D198;
  v33[0] = &unk_1E459D180;
  v33[1] = &unk_1E459D1B0;
  v32[2] = &unk_1E459D1C8;
  v32[3] = &unk_1E459D1E0;
  v33[2] = &unk_1E459D1B0;
  v33[3] = &unk_1E459D1E0;
  v32[4] = &unk_1E459D1F8;
  v32[5] = &unk_1E459D210;
  v33[4] = &unk_1E459D1E0;
  v33[5] = &unk_1E459D228;
  v32[6] = &unk_1E459D240;
  v33[6] = &unk_1E459D258;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, objc_opt_class());

  v4 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v30[0] = &unk_1E459D180;
  v30[1] = &unk_1E459D168;
  v31[0] = &unk_1E459D180;
  v31[1] = &unk_1E459D1B0;
  v30[2] = &unk_1E459D270;
  v30[3] = &unk_1E459D198;
  v31[2] = &unk_1E459D1E0;
  v31[3] = &unk_1E459D228;
  v30[4] = &unk_1E459D210;
  v31[4] = &unk_1E459D258;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, objc_opt_class());

  v6 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v28[0] = &unk_1E459D180;
  v28[1] = &unk_1E459D168;
  v29[0] = &unk_1E459D180;
  v29[1] = &unk_1E459D1B0;
  v28[2] = &unk_1E459D1B0;
  v28[3] = &unk_1E459D270;
  v29[2] = &unk_1E459D1E0;
  v29[3] = &unk_1E459D228;
  v28[4] = &unk_1E459D198;
  v29[4] = &unk_1E459D258;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, objc_opt_class());

  v8 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v26[0] = &unk_1E459D180;
  v26[1] = &unk_1E459D168;
  v27[0] = &unk_1E459D180;
  v27[1] = &unk_1E459D1B0;
  v26[2] = &unk_1E459D1B0;
  v26[3] = &unk_1E459D270;
  v27[2] = &unk_1E459D1E0;
  v27[3] = &unk_1E459D228;
  v26[4] = &unk_1E459D198;
  v27[4] = &unk_1E459D258;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, objc_opt_class());

  v10 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v24[0] = &unk_1E459D180;
  v24[1] = &unk_1E459D168;
  v25[0] = &unk_1E459D1B0;
  v25[1] = &unk_1E459D1E0;
  v24[2] = &unk_1E459D270;
  v24[3] = &unk_1E459D198;
  v25[2] = &unk_1E459D228;
  v25[3] = &unk_1E459D258;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, objc_opt_class());

  v12 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v22[0] = &unk_1E459D180;
  v22[1] = &unk_1E459D168;
  v23[0] = &unk_1E459D1E0;
  v23[1] = &unk_1E459D228;
  v22[2] = &unk_1E459D270;
  v23[2] = &unk_1E459D258;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, objc_opt_class());

  v14 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v20[0] = &unk_1E459D180;
  v20[1] = &unk_1E459D168;
  v21[0] = &unk_1E459D1E0;
  v21[1] = &unk_1E459D228;
  v20[2] = &unk_1E459D270;
  v21[2] = &unk_1E459D258;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v15, objc_opt_class());

  v16 = (void *)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v18 = &unk_1E459D180;
  v19 = &unk_1E459D258;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, objc_opt_class());

}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNANFDDetectorCompoundRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v9, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  -[VNRequest configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detectorConfigurationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  return v5;
}

- (VNANFDDetectorCompoundRequest)initWithDetectorType:(id)a3 configuration:(id)a4
{
  VNANFDDetectorCompoundRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  char v22;
  void *v23;
  void *v24;
  VNANFDDetectorCompoundRequest *v25;
  VNANFDDetectorCompoundRequest *v26;
  VNANFDDetectorCompoundRequest *v28;
  id v29;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v31 = a4;
  objc_msgSend(v31, "originalRequests");
  v37.receiver = self;
  v37.super_class = (Class)VNANFDDetectorCompoundRequest;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VNCompoundRequest initWithOriginalRequests:](&v37, sel_initWithOriginalRequests_);
  if (v6)
  {
    v28 = v6;
    -[VNRequest configuration](v6, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setResolvedRevision:", objc_msgSend(v31, "resolvedRevision"));
    v8 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v7, "setDetectorType:", v8);

    objc_msgSend(v31, "detectorConfigurationOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v7, "setDetectorConfigurationOptions:", v10);

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v30;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v34;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = objc_msgSend(v14, "resolvedRevision");
            if (v15 == 3737841668 || v15 == 3737841666)
            {
              v17 = v14;
              v18 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v17, "precisionRecallThreshold");
              objc_msgSend(v18, "numberWithFloat:");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNANFDMultiDetectorProcessingOption_PrecisionRecallThreshold"), v19);

            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = v14;
            v21 = objc_msgSend(v20, "upperBodyOnly");
            v22 = objc_msgSend(v20, "upperBodyOnly");
            if (v21)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNANFDMultiDetectorProcessingOption_HumanDetectorUpperBody"), v23);

            }
            if ((v22 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setDetectorConfigurationOption:value:", CFSTR("VNANFDMultiDetectorProcessingOption_HumanDetectorFullBody"), v24);

            }
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v11);
    }

    v25 = v28;
    v6 = v28;
  }
  v26 = v6;

  return v26;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)compoundRequestRevisionForRequest:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  if (+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::onceToken != -1)
    dispatch_once(&+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::onceToken, &__block_literal_global_32073);
  objc_msgSend((id)+[VNANFDDetectorCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision, "objectForKey:", objc_msgSend(v3, "frameworkClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(v3, "resolvedRevision");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = objc_msgSend(v7, "unsignedIntegerValue");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t, uint64_t);
  void *v18;
  VNANFDDetectorCompoundRequest *v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a4;
  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && -[VNRequest validateImageBuffer:ofNonZeroWidth:andHeight:error:](self, "validateImageBuffer:ofNonZeroWidth:andHeight:error:", v10, 0, 0, a5))
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__32052;
    v29 = __Block_byref_object_dispose__32053;
    v30 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __73__VNANFDDetectorCompoundRequest_internalPerformRevision_inContext_error___block_invoke;
    v18 = &unk_1E4548BB8;
    v19 = self;
    v24 = a3;
    v20 = v9;
    v21 = v10;
    v23 = &v25;
    v11 = v8;
    v22 = v11;
    v12 = _Block_copy(&v15);
    v13 = VNExecuteBlock(v12, (uint64_t)a5);
    if ((v13 & 1) != 0)
    {
      -[VNCompoundRequest recordWarningsInOriginalRequests](self, "recordWarningsInOriginalRequests", v15, v16, v17, v18, v19, v20, v21);
      -[VNANFDDetectorCompoundRequest assignOriginalRequestsResultsFromObservations:obtainedInPerformingContext:](self, "assignOriginalRequestsResultsFromObservations:obtainedInPerformingContext:", v26[5], v11);
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)assignOriginalRequestsResultsFromObservations:(id)a3 obtainedInPerformingContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[VNCompoundRequest originalRequests](self, "originalRequests");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    v10 = *MEMORY[0x1E0C99768];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = +[VNANFDMultiDetector anfdMultiDetectorClassToProcessRequest:](VNANFDMultiDetector, "anfdMultiDetectorClassToProcessRequest:", v12);
        if (!v13)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v10, CFSTR("Internal error processing request of class %@"), objc_opt_class());
        -[objc_class requestInfoForRequest:](v13, "requestInfoForRequest:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v10, CFSTR("The request class %@ shall have it's results populated in the results array"), objc_opt_class());
        objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v14, "originalRequestResultsIndex"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setResults:", v15);

        objc_msgSend(v7, "cacheObservationsOfRequest:", v12);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

BOOL __73__VNANFDDetectorCompoundRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v13, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v4)
  {
    v14[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

    v7 = objc_msgSend(*(id *)(a1 + 56), "qosClass");
    objc_msgSend(*(id *)(a1 + 32), "regionOfInterest");
    objc_msgSend(v4, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v7, v5, *(_QWORD *)(a1 + 32), a2, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
