@implementation NSKeyedUnarchiver(AXExtensions)

+ (id)secureUnarchiveData:()AXExtensions withExpectedClass:otherAllowedClasses:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = 0;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v7, &v16);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", a4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      objc_msgSend(v10, "setByAddingObjectsFromSet:", v8);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v11, *MEMORY[0x1E0CB2CD0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass(a4, v13, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
