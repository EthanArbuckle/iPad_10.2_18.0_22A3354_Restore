@implementation NSError(FamilyCircle)

+ (uint64_t)fa_familyErrorWithCode:()FamilyCircle
{
  return objc_msgSend(a1, "fa_familyErrorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)fa_familyErrorWithCode:()FamilyCircle userInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.family.error"), a3, a4);
}

+ (id)fa_familyErrorWithCode:()FamilyCircle underlyingError:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v10 = *MEMORY[0x1E0CB3388];
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "fa_familyErrorWithCode:userInfo:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fa_familyErrorWithCode:()FamilyCircle exception:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.family.error"), a3, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
