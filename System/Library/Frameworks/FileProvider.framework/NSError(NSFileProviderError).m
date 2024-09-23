@implementation NSError(NSFileProviderError)

+ (id)fileProviderErrorForCollisionWithItem:()NSFileProviderError
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v10;
  id v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13 = CFSTR("NSFileProviderErrorItem");
    v14[0] = a3;
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = a3;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPError errorWithDomain:code:userInfo:](FPError, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -1001, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3488];
    v11 = 0;
    objc_msgSend(v10, "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileProviderExtension.m"), 1060, CFSTR("existingItem shouldn't be nil"));
    return 0;
  }
}

+ (id)fileProviderErrorForRejectedDeletionOfItem:()NSFileProviderError
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v10;
  id v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13 = CFSTR("NSFileProviderErrorItem");
    v14[0] = a3;
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = a3;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPError errorWithDomain:code:userInfo:](FPError, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -1006, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3488];
    v11 = 0;
    objc_msgSend(v10, "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileProviderExtension.m"), 1075, CFSTR("updatedVersion shouldn't be nil"));
    return 0;
  }
}

+ (id)fileProviderErrorForNonExistentItemWithIdentifier:()NSFileProviderError
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v10;
  id v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13 = CFSTR("NSFileProviderErrorNonExistentItemIdentifier");
    v14[0] = a3;
    v3 = (void *)MEMORY[0x1E0C99D80];
    v4 = a3;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPError errorWithDomain:code:userInfo:](FPError, "errorWithDomain:code:userInfo:", CFSTR("NSFileProviderErrorDomain"), -1005, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3488];
    v11 = 0;
    objc_msgSend(v10, "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileProviderExtension.m"), 1090, CFSTR("itemIdentifier shouldn't be nil"));
    return 0;
  }
}

@end
