@implementation _ANEErrors

+ (id)createErrorWithCode:(int64_t)a3 description:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB35C8];
  +[_ANEStrings errorDomainGeneric](_ANEStrings, "errorDomainGeneric");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0CB2D50];
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[_ANELog framework](_ANELog, "framework");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D3352000, v10, OS_LOG_TYPE_INFO, "%@ : %@", (uint8_t *)&v12, 0x16u);
  }

  return v9;
}

+ (id)entitlementErrorForMethod:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  +[_ANEStrings restrictedAccessEntitlement](_ANEStrings, "restrictedAccessEntitlement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: requires restricted access connection and (%@) entitlement"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "createErrorWithCode:description:", 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)priorityErrorForMethod:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  +[_ANEStrings restrictedAccessEntitlement](_ANEStrings, "restrictedAccessEntitlement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: Realtime priority requires restricted access connection and (%@) entitlement"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "createErrorWithCode:description:", 2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)timeoutErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: timed out"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)programCreationErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program creation failure"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)programInferenceOverflowErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program Inference overflow"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 5, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)programInferenceOtherErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program Inference error"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 8, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)programLoadErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program load failure"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)programLoadErrorForMethod:(id)a3 code:(int64_t)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program load failure (0x%X)"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 6, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)programIOSurfacesMapErrorForMethod:(id)a3 code:(int64_t)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program IOSurfaces map failure (0x%X)"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 13, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)programIOSurfacesUnmapErrorForMethod:(id)a3 code:(int64_t)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program IOSurfaces unmap failure (0x%X)"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 14, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)missingCodeSigningErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Missing code signing identity"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fileAccessErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: file access failure"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 9, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)invalidModelErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: invalid model"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 10, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)invalidModelKeyErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: invalid model key"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 11, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)systemModelPurgeNotAllowedForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: system model purge not allowed"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 12, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)programChainingPrepareErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program chaining prepare error"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 15, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fileNotFoundErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: file not found"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 16, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)modelIdentifierNotFoundForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: model identifier not found"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 17, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)baseModelIdentifierNotFoundForNewInstanceMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: base model identifier not found for new instance"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 18, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)modelNewInstanceCacheIdentifierNotNilMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: model cacheURLIdentifier for new instance should be nil"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 19, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)invalidModelInstanceErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: invalid model instance"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 20, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)programLoadNewInstanceErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program load new instance failure"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 21, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)programLoadNewInstanceErrorForMethod:(id)a3 code:(int64_t)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program load new instance failure (0x%X)"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 21, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hostTooOld:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Host too old, ANE hardware not available"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 22, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)programInferenceProgramNotFoundForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Program Inference error"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 23, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
