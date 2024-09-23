@implementation NSError(FPFSHelpers)

+ (id)fp_errorForCollisionWithURL:()FPFSHelpers
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB28A8];
  v10 = CFSTR("FPErrorCollidingURLKey");
  v11[0] = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 516, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fp_collidingURL
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v3 = objc_msgSend(a1, "code");

    if (v3 != 516)
    {
      v4 = 0;
      return v4;
    }
    objc_msgSend(a1, "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FPErrorCollidingURLKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
