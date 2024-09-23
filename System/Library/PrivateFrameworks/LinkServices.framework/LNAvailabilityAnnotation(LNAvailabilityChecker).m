@implementation LNAvailabilityAnnotation(LNAvailabilityChecker)

- (const)_availabilityResultWithoutSystemVersion
{
  void *v4;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "obsoletedVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return CFSTR("LNAvailabilityResultUnavailable");
  objc_msgSend(a1, "deprecatedVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return CFSTR("LNAvailabilityResultDeprecated");
  objc_msgSend(a1, "introducedVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNAvailabilityChecker.m"), 71, CFSTR("invalid availability annotation: %@"), a1);

  }
  return CFSTR("LNAvailabilityResultAvailable");
}

- (const)_availabilityResultWithSystemVersion:()LNAvailabilityChecker
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;

  v4 = a3;
  objc_msgSend(a1, "obsoletedVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(a1, "obsoletedVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D43980]))
    {

LABEL_5:
      v11 = CFSTR("LNAvailabilityResultUnavailable");
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "obsoletedVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isVersion:greaterThanOrEqualToVersion:", v4, v9);

    if ((v10 & 1) != 0)
      goto LABEL_5;
  }
  objc_msgSend(a1, "deprecatedVersion");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(a1, "deprecatedVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D43980]))
    {

LABEL_10:
      v11 = CFSTR("LNAvailabilityResultDeprecated");
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "deprecatedVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isVersion:greaterThanOrEqualToVersion:", v4, v16);

    if ((v17 & 1) != 0)
      goto LABEL_10;
  }
  objc_msgSend(a1, "introducedVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = CFSTR("LNAvailabilityResultAvailable");
  if (v18)
  {
    objc_msgSend(a1, "introducedVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D43980]))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "introducedVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isVersion:greaterThanOrEqualToVersion:", v4, v21);

      if (!v22)
        v11 = CFSTR("LNAvailabilityResultUnavailable");
    }
  }
LABEL_16:

  return v11;
}

@end
