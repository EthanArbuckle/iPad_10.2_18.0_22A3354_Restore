@implementation PHMediaFormatConversionCompositeRequest

- (BOOL)isCompositeRequest
{
  return 1;
}

- (void)preflightWithConversionManager:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = -[PHMediaFormatConversionRequest status](self, "status");
  if (v6 <= 5 && ((1 << v6) & 0x31) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaFormatConversionRequest statusString](self, "statusString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1472, CFSTR("Preflight of request in invalid state %@"), v8);

  }
  if (-[PHMediaFormatConversionRequest preflighted](self, "preflighted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 1475, CFSTR("Preflight of already preflighted request"));

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__PHMediaFormatConversionCompositeRequest_preflightWithConversionManager___block_invoke;
  v11[3] = &unk_1E99537F0;
  v12 = v5;
  v10 = v5;
  -[PHMediaFormatConversionCompositeRequest enumerateSubrequests:](self, "enumerateSubrequests:", v11);
  -[PHMediaFormatConversionRequest setPreflighted:](self, "setPreflighted:", 1);

}

- (BOOL)areAllSubrequestsPreflighted
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__PHMediaFormatConversionCompositeRequest_areAllSubrequestsPreflighted__block_invoke;
  v4[3] = &unk_1E9953818;
  v4[4] = &v5;
  -[PHMediaFormatConversionCompositeRequest enumerateSubrequests:](self, "enumerateSubrequests:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)requiresFormatConversion
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__PHMediaFormatConversionCompositeRequest_requiresFormatConversion__block_invoke;
  v4[3] = &unk_1E9953818;
  v4[4] = &v5;
  -[PHMediaFormatConversionCompositeRequest enumerateSubrequests:](self, "enumerateSubrequests:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)requiresLocationMetadataChange
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__PHMediaFormatConversionCompositeRequest_requiresLocationMetadataChange__block_invoke;
  v4[3] = &unk_1E9953818;
  v4[4] = &v5;
  -[PHMediaFormatConversionCompositeRequest enumerateSubrequests:](self, "enumerateSubrequests:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)requiresCreationDateMetadataChange
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__PHMediaFormatConversionCompositeRequest_requiresCreationDateMetadataChange__block_invoke;
  v4[3] = &unk_1E9953818;
  v4[4] = &v5;
  -[PHMediaFormatConversionCompositeRequest enumerateSubrequests:](self, "enumerateSubrequests:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)requiresCaptionMetadataChange
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__PHMediaFormatConversionCompositeRequest_requiresCaptionMetadataChange__block_invoke;
  v4[3] = &unk_1E9953818;
  v4[4] = &v5;
  -[PHMediaFormatConversionCompositeRequest enumerateSubrequests:](self, "enumerateSubrequests:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)requiresAccessibilityDescriptionMetadataChange
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__PHMediaFormatConversionCompositeRequest_requiresAccessibilityDescriptionMetadataChange__block_invoke;
  v4[3] = &unk_1E9953818;
  v4[4] = &v5;
  -[PHMediaFormatConversionCompositeRequest enumerateSubrequests:](self, "enumerateSubrequests:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)compositeRequestCommonInitWithError:(id *)a3
{
  PHMediaFormatConversionCompositeRequest *v4;

  if (-[PHMediaFormatConversionRequest prepareWithError:](self, "prepareWithError:", a3))
  {
    -[PHMediaFormatConversionCompositeRequest setupProgress](self, "setupProgress");
    v4 = self;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)enqueueSubrequestsOnConversionManager:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Subclasses must override %@"), v5);

}

- (void)enumerateSubrequests:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Subclasses must override %@"), v5);

}

- (void)propagateRequestOptionsToSubrequests
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __79__PHMediaFormatConversionCompositeRequest_propagateRequestOptionsToSubrequests__block_invoke;
  v2[3] = &unk_1E99537F0;
  v2[4] = self;
  -[PHMediaFormatConversionCompositeRequest enumerateSubrequests:](self, "enumerateSubrequests:", v2);
}

- (void)didFinishProcessing
{
  void *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  PHMediaFormatConversionCompositeRequest *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__PHMediaFormatConversionCompositeRequest_didFinishProcessing__block_invoke;
  v4[3] = &unk_1E99537F0;
  v4[4] = self;
  -[PHMediaFormatConversionCompositeRequest enumerateSubrequests:](self, "enumerateSubrequests:", v4);
  if (-[PHMediaFormatConversionRequest status](self, "status") == 5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[PHMediaFormatConversionRequest error](self, "error");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v6 = self;
      v7 = 2112;
      v8 = v3;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Composite conversion request %@ failed: %@", buf, 0x16u);

    }
  }
  else
  {
    -[PHMediaFormatConversionCompositeRequest postProcessSuccessfulCompositeRequest](self, "postProcessSuccessfulCompositeRequest");
  }
}

- (void)setupProgress
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PHMediaFormatConversionCompositeRequest_setupProgress__block_invoke;
  v5[3] = &unk_1E99537F0;
  v6 = v3;
  v4 = v3;
  -[PHMediaFormatConversionCompositeRequest enumerateSubrequests:](self, "enumerateSubrequests:", v5);
  -[PHMediaFormatConversionRequest setProgress:](self, "setProgress:", v4);

}

void __56__PHMediaFormatConversionCompositeRequest_setupProgress__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setTotalUnitCount:", objc_msgSend(v3, "totalUnitCount") + 1);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "progress");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addChild:withPendingUnitCount:", v6, 1);
}

void __62__PHMediaFormatConversionCompositeRequest_didFinishProcessing__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "status") != 5)
  {
    v5 = objc_msgSend(v4, "status");
    v6 = *(void **)(a1 + 32);
    if (v5 == 4)
    {
      objc_msgSend(v6, "setStatus:", 4);
    }
    else
    {
      objc_msgSend(v6, "setStatus:", 5);
      v7 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v4, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v11 = *MEMORY[0x1E0CB3388];
        objc_msgSend(v4, "error");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v2;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 6, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setError:", v10);

      if (v8)
      {

      }
    }
  }

}

void __79__PHMediaFormatConversionCompositeRequest_propagateRequestOptionsToSubrequests__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "setLivePhotoPairingIdentifierBehavior:", objc_msgSend(*(id *)(a1 + 32), "livePhotoPairingIdentifierBehavior"));
  objc_msgSend(*(id *)(a1 + 32), "livePhotoPairingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "livePhotoPairingIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLivePhotoPairingIdentifier:", v4);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldPadOutputFileToEstimatedLength"))
    objc_msgSend(v14, "setShouldPadOutputFileToEstimatedLength:", 1);
  if (objc_msgSend(*(id *)(a1 + 32), "forceFormatConversion"))
    objc_msgSend(v14, "setForceFormatConversion:", 1);
  v5 = objc_msgSend(*(id *)(a1 + 32), "locationMetadataBehavior");
  objc_msgSend(*(id *)(a1 + 32), "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocationMetadataBehavior:withLocation:", v5, v6);

  v7 = objc_msgSend(*(id *)(a1 + 32), "creationDateMetadataBehavior");
  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "creationDateTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCreationDateMetadataBehavior:withCreationDate:inTimeZone:", v7, v8, v9);

  v10 = objc_msgSend(*(id *)(a1 + 32), "captionMetadataBehavior");
  objc_msgSend(*(id *)(a1 + 32), "caption");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCaptionMetadataBehavior:withCaption:", v10, v11);

  v12 = objc_msgSend(*(id *)(a1 + 32), "accessibilityDescriptionMetadataBehavior");
  objc_msgSend(*(id *)(a1 + 32), "accessibilityDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityDescriptionMetadataBehavior:withAccessibilityDescription:", v12, v13);

}

uint64_t __89__PHMediaFormatConversionCompositeRequest_requiresAccessibilityDescriptionMetadataChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(a2, "requiresAccessibilityDescriptionMetadataChange");
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

uint64_t __72__PHMediaFormatConversionCompositeRequest_requiresCaptionMetadataChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(a2, "requiresCaptionMetadataChange");
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

uint64_t __77__PHMediaFormatConversionCompositeRequest_requiresCreationDateMetadataChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(a2, "requiresCreationDateMetadataChange");
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

uint64_t __73__PHMediaFormatConversionCompositeRequest_requiresLocationMetadataChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(a2, "requiresLocationMetadataChange");
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

uint64_t __67__PHMediaFormatConversionCompositeRequest_requiresFormatConversion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(a2, "requiresFormatConversion");
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

uint64_t __71__PHMediaFormatConversionCompositeRequest_areAllSubrequestsPreflighted__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    result = objc_msgSend(a2, "preflighted");
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    result = 0;
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

void __74__PHMediaFormatConversionCompositeRequest_preflightWithConversionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "preflighted") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "preflightConversionRequest:", v3);

}

@end
