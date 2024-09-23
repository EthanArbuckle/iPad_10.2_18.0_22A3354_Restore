@implementation LNAvailabilityChecker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityAnnotations, 0);
}

- (LNAvailabilityChecker)initWithAvailabilityAnnotations:(id)a3
{
  id v4;
  LNAvailabilityChecker *v5;
  uint64_t v6;
  NSDictionary *availabilityAnnotations;
  LNAvailabilityChecker *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNAvailabilityChecker;
  v5 = -[LNAvailabilityChecker init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    availabilityAnnotations = v5->_availabilityAnnotations;
    v5->_availabilityAnnotations = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)availabilityWithPlatform:(id)a3 platformVersion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  __CFString *v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  __CFString *v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[6];

  v33[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[LNAvailabilityChecker availabilityAnnotations](self, "availabilityAnnotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D439D8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_availabilityResultWithoutSystemVersion");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("LNAvailabilityResultAvailable");
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  v14 = objc_alloc(MEMORY[0x1E0C99E08]);
  v15 = *MEMORY[0x1E0D439D0];
  v32[0] = *MEMORY[0x1E0D43988];
  v32[1] = v15;
  v33[0] = v13;
  v33[1] = v13;
  v16 = *MEMORY[0x1E0D439A8];
  v32[2] = *MEMORY[0x1E0D43998];
  v32[3] = v16;
  v33[2] = v13;
  v33[3] = v13;
  v32[4] = *MEMORY[0x1E0D439B8];
  v33[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithDictionary:", v17);

  -[LNAvailabilityChecker availabilityAnnotations](self, "availabilityAnnotations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __66__LNAvailabilityChecker_availabilityWithPlatform_platformVersion___block_invoke;
  v27[3] = &unk_1E45DC818;
  v28 = v6;
  v20 = v18;
  v29 = v20;
  v30 = v13;
  v31 = v7;
  v21 = v7;
  v22 = v13;
  v23 = v6;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v27);

  v24 = v31;
  v25 = v20;

  return v25;
}

- (NSDictionary)availabilityAnnotations
{
  return self->_availabilityAnnotations;
}

void __66__LNAvailabilityChecker_availabilityWithPlatform_platformVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  const __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D439D8]) & 1) == 0)
  {
    v6 = objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(a1 + 32));
    v7 = *(const __CFString **)(a1 + 48);
    if (v6)
      objc_msgSend(v5, "_availabilityResultWithSystemVersion:", *(_QWORD *)(a1 + 56));
    else
      objc_msgSend(v5, "_availabilityResultWithoutSystemVersion");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("LNAvailabilityResultDeprecated");
    if (v8 != CFSTR("LNAvailabilityResultDeprecated") && v7 != CFSTR("LNAvailabilityResultDeprecated"))
      v10 = CFSTR("LNAvailabilityResultAvailable");
    if (v8 == CFSTR("LNAvailabilityResultUnavailable") || v7 == CFSTR("LNAvailabilityResultUnavailable"))
      v13 = CFSTR("LNAvailabilityResultUnavailable");
    else
      v13 = v10;
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v14);

  }
}

- (BOOL)availableForCurrentPlatformVersion
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  BOOL v7;
  BOOL v8;

  -[LNAvailabilityChecker currentPlatformName](self, "currentPlatformName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAvailabilityChecker currentSystemVersion](self, "currentSystemVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAvailabilityChecker availabilityWithPlatform:platformVersion:](self, "availabilityWithPlatform:platformVersion:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v6 == CFSTR("LNAvailabilityResultUnavailable");
  else
    v7 = 1;
  v8 = !v7;

  return v8;
}

- (id)currentSystemVersion
{
  if (currentSystemVersion_onceToken != -1)
    dispatch_once(&currentSystemVersion_onceToken, &__block_literal_global_3920);
  if (currentSystemVersion_systemVersion)
    return (id)currentSystemVersion_systemVersion;
  else
    return CFSTR("Unknown");
}

- (id)currentPlatformName
{
  return (id)*MEMORY[0x1E0D43988];
}

void __45__LNAvailabilityChecker_currentSystemVersion__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v0 = v3;
    else
      v0 = 0;
  }
  else
  {
    v0 = 0;
  }
  v1 = v0;

  v2 = (void *)currentSystemVersion_systemVersion;
  currentSystemVersion_systemVersion = (uint64_t)v1;

}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_22);
  return isInternalInstall_isInternal;
}

uint64_t __42__LNAvailabilityChecker_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  isInternalInstall_isInternal = result;
  return result;
}

@end
