@implementation NSError(PackageMetadata)

+ (id)errorWithErrno:()PackageMetadata forFilePath:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2FE0];
  v6 = a3;
  if (a4)
  {
    v12 = *MEMORY[0x1E0CB2AA0];
    v13[0] = a4;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = a4;
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a3, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
