@implementation NSError(HDCodingSupport)

+ (id)hk_errorWithCodableError:()HDCodingSupport
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "localizedDescription");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(v3, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "code");

  v10 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, v9, v6);
  return v10;
}

- (HDCodableError)hk_codableError
{
  HDCodableError *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(HDCodableError);
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableError setDomain:](v2, "setDomain:", v3);

  -[HDCodableError setCode:](v2, "setCode:", objc_msgSend(a1, "code"));
  objc_msgSend(a1, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableError setLocalizedDescription:](v2, "setLocalizedDescription:", v4);

  return v2;
}

@end
