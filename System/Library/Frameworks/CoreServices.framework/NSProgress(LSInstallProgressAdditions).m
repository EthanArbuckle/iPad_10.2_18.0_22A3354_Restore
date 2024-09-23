@implementation NSProgress(LSInstallProgressAdditions)

- (void)initWithParent:()LSInstallProgressAdditions bundleID:andPhase:
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CB3068];
  v18[0] = a4;
  v17[0] = v7;
  v17[1] = CFSTR("installPhase");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithUnsignedInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  v17[2] = CFSTR("installState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  v18[3] = v9;
  v17[3] = CFSTR("bundleID");
  v17[4] = CFSTR("expectedFinalInstallPhase");
  v18[4] = &unk_1E1075750;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(a1, "initWithParent:userInfo:", 0, v12);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "setTotalUnitCount:", 100);
    objc_msgSend(v14, "setCompletedUnitCount:", 0);
    if (a5 <= 4 && ((1 << a5) & 0x19) != 0)
    {
      v15 = 1;
      objc_msgSend(v14, "setPausable:", 1);
      objc_msgSend(v14, "setCancellable:", 1);
    }
    else
    {
      objc_msgSend(v14, "setPausable:", 0);
      objc_msgSend(v14, "setCancellable:", 0);
      v15 = a5 == 1;
    }
    objc_msgSend(v14, "setPrioritizable:", v15);
  }

  return v14;
}

+ (id)childProgressForBundleID:()LSInstallProgressAdditions andPhase:
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "publishingKeyForApp:withPhase:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithParent:bundleID:andPhase:", 0, v6, a4);

  return v7;
}

+ (id)publishingKeyForApp:()LSInstallProgressAdditions withPhase:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "NSStringFromLSInstallPhase:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)keyPathsForValuesAffectingInstallState
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("userInfo.installState"));
}

+ (uint64_t)keyPathsForValuesAffectingInstallPhase
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("userInfo.installPhase"), CFSTR("userInfo.expectedFinalInstallPhase"), 0);
}

- (void)setInstallState:()LSInstallProgressAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUserInfoObject:forKey:", v2, CFSTR("installState"));

}

- (uint64_t)installState
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("installState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "unsignedIntegerValue");
  return v3;
}

- (void)setInstallPhase:()LSInstallProgressAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUserInfoObject:forKey:", v2, CFSTR("installPhase"));

}

- (uint64_t)installPhase
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("installPhase"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "unsignedIntegerValue");
  return v3;
}

- (uint64_t)installPhaseString
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "NSStringFromLSInstallPhase:", objc_msgSend(a1, "installPhase"));
}

- (uint64_t)ls_expectedFinalInstallPhase
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("expectedFinalInstallPhase"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v3 = 1;

  return v3;
}

- (void)ls_setExpectedFinalInstallPhase:()LSInstallProgressAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUserInfoObject:forKey:", v2, CFSTR("expectedFinalInstallPhase"));

}

- (id)_LSDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "NSStringFromLSInstallPhase:", objc_msgSend(a1, "installPhase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "NSStringFromLSInstallState:", objc_msgSend(a1, "installState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "NSStringFromLSInstallPhase:", objc_msgSend(a1, "ls_expectedFinalInstallPhase"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fractionCompleted");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<NSProgress: %@ phase=%@; state=%@; finalPhase=%@; fractionCompleted=%f>"),
    v4,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
