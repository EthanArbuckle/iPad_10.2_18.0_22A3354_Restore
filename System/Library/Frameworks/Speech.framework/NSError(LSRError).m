@implementation NSError(LSRError)

+ (id)lsr_errorWithCode:()LSRError description:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "setObject:forKey:", v5, *MEMORY[0x1E0CB2D50]);
  v8 = (void *)MEMORY[0x1E0CB35C8];
  if (objc_msgSend(v7, "count"))
    v9 = v7;
  else
    v9 = 0;
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("kLSRErrorDomain"), a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)lsr_errorWithCode:()LSRError
{
  return objc_msgSend(a1, "lsr_errorWithCode:description:", a3, 0);
}

@end
