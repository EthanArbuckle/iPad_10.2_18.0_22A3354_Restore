@implementation NSError(MANSErrorExtensions)

+ (id)errorWithDomain:()MANSErrorExtensions code:localizedDescription:userInfo:
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a5;
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0C99E08];
  v12 = a3;
  objc_msgSend(v11, "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
    objc_msgSend(v13, "addEntriesFromDictionary:", v10);
  objc_msgSend(v14, "setObject:forKey:", v9, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v12, a4, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)errorWithDomain:()MANSErrorExtensions code:localizedDescription:
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = *MEMORY[0x1E0CB2D50];
  v9 = a3;
  objc_msgSend(v7, "dictionaryWithObject:forKey:", a5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v9, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)errorWithDescription:()MANSErrorExtensions
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "errorWithDomain:code:localizedDescription:", CFSTR("MAErrorDomain"), -1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
