@implementation NSError(MSVDependencyError)

+ (id)MSVErrorWithMissingDependency:()MSVDependencyError
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MSVErrorWithMissingDependencies:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)MSVErrorWithMissingDependencies:()MSVDependencyError
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSError+MSVAdditions.m"), 333, CFSTR("Array of dependencies is empty."));

  }
  v6 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "count");

  v9 = CFSTR("are");
  if (v8 == 1)
    v9 = CFSTR("is");
  objc_msgSend(v6, "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVError"), 1, CFSTR("%@ %@ required to use this functionality."), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
