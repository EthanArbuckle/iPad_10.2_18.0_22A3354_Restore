@implementation VNClassRegistrar

void __52__VNClassRegistrar_getClassCode_forClassName_error___block_invoke()
{
  void *v0;
  void *v1;
  unint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1A1B0B060]();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 180);
  v2 = 0xFFFFFFFFFFFFEF20;
  do
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", *(_QWORD *)&kVNClassRegistry[v2 + 4328]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)&kVNClassRegistry[v2 + 4320]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setObject:forKeyedSubscript:", v4, v3);

    v2 += 24;
  }
  while (v2);
  v5 = objc_msgSend(v1, "copy");
  v6 = (void *)getClassCode_forClassName_error__ourClassCodeForNameDictionary;
  getClassCode_forClassName_error__ourClassCodeForNameDictionary = v5;

  objc_autoreleasePoolPop(v0);
}

+ (BOOL)getClassCode:(unsigned int *)a3 forClass:(Class)a4 error:(id *)a5
{
  void *v8;

  NSStringFromClass(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(a1, "getClassCode:forClassName:error:", a3, v8, a5);

  return (char)a5;
}

+ (BOOL)getClassCode:(unsigned int *)a3 forClassName:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a4;
  if (getClassCode_forClassName_error__onceToken != -1)
    dispatch_once(&getClassCode_forClassName_error__onceToken, &__block_literal_global_28_489);
  objc_msgSend((id)getClassCode_forClassName_error__ourClassCodeForNameDictionary, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    *a3 = objc_msgSend(v8, "unsignedIntValue");
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ does not have a registry entry"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 != 0;
}

+ (BOOL)validateRequestClassName:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  BOOL v8;
  void *v10;
  int v11;

  v6 = a3;
  v11 = 0;
  v7 = objc_msgSend(a1, "getClassCode:forClassName:error:", &v11, v6, a4);
  v8 = 0;
  if (v7)
  {
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("VN"))
      && (objc_msgSend(v6, "hasSuffix:", CFSTR("Request")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("VNVYvzEtX1JlUdu8xx5qhDI")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("VN6kBnCOr2mZlSV6yV1dLwB")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("VN5kJNH3eYuyaLxNpZr5Z7zi")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("VN6Mb1ME89lyW3HpahkEygIG")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("VN1JC7R3k4455fKQz0dY1VhQ")) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a VNRequest subclass"), v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v10);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v8 = 0;
    }
  }

  return v8;
}

+ (void)enumerateEntriesUsingBlock:(id)a3
{
  void (**v3)(id, uint64_t, uint64_t, void *, char *);
  void *v4;
  uint64_t v5;
  char **v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  BOOL v11;
  char v12;

  v3 = (void (**)(id, uint64_t, uint64_t, void *, char *))a3;
  v4 = (void *)MEMORY[0x1A1B0B060]();
  v12 = 0;
  v5 = 179;
  v6 = &off_1E45420C0;
  do
  {
    v7 = *((unsigned __int8 *)v6 + 8);
    v8 = *((unsigned int *)v6 - 2);
    v9 = *v6;
    v6 += 3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, v7, v8, v10, &v12);

    if (v12)
      v11 = 1;
    else
      v11 = v5 == 0;
    --v5;
  }
  while (!v11);
  objc_autoreleasePoolPop(v4);

}

+ (unsigned)entryTypeForClassName:(id)a3
{
  id v3;
  NSMapTable *v4;
  id v5;
  const void *v6;
  _BOOL4 v7;
  unsigned __int8 result;
  void *value;

  v3 = a3;
  objc_opt_self();
  if (_entryForClassName__onceToken != -1)
    dispatch_once(&_entryForClassName__onceToken, &__block_literal_global_545);
  value = 0;
  v4 = (NSMapTable *)_entryForClassName__ourClassNameToRegistryEntryTable;
  v5 = objc_retainAutorelease(v3);
  v6 = (const void *)objc_msgSend(v5, "UTF8String");

  v7 = NSMapMember(v4, v6, 0, &value);
  result = 0;
  if (v7)
  {
    if (value)
      return *((_BYTE *)value + 16);
  }
  return result;
}

+ (unsigned)entryTypeForClassCode:(unsigned int)a3
{
  void *value;

  objc_opt_self();
  if (_entryForClassCode__onceToken != -1)
    dispatch_once(&_entryForClassCode__onceToken, &__block_literal_global_18);
  value = 0;
  if (!NSMapMember((NSMapTable *)_entryForClassCode__ourClassCodeToRegistryEntryTable, (const void *)a3, 0, &value)
    || value == 0)
  {
    return 0;
  }
  else
  {
    return *((_BYTE *)value + 16);
  }
}

+ (Class)classForClassCode:(unsigned int)a3 error:(id *)a4
{
  NSString *v5;
  NSString *v6;
  Class v7;
  Class v8;
  void *v9;
  objc_class *v10;

  objc_msgSend(a1, "classNameForClassCode:error:", *(_QWORD *)&a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = NSClassFromString(v5);
    v8 = v7;
    if (a4 && !v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is no longer supported by Vision"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)classNameForClassCode:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = *(_QWORD *)&a3;
  if (classNameForClassCode_error__onceToken != -1)
    dispatch_once(&classNameForClassCode_error__onceToken, &__block_literal_global_23);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)classNameForClassCode_error__ourClassNameForCodeMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a registered class code"), VisionCoreFourCharCodeToString());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __48__VNClassRegistrar_classNameForClassCode_error___block_invoke()
{
  void *v0;
  void *v1;
  unint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1A1B0B060]();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 180);
  v2 = 0xFFFFFFFFFFFFEF20;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)&kVNClassRegistry[v2 + 4320]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", *(_QWORD *)&kVNClassRegistry[v2 + 4328]);
    objc_msgSend(v1, "setObject:forKeyedSubscript:", v4, v3);

    v2 += 24;
  }
  while (v2);
  v5 = objc_msgSend(v1, "copy");
  v6 = (void *)classNameForClassCode_error__ourClassNameForCodeMap;
  classNameForClassCode_error__ourClassNameForCodeMap = v5;

  objc_autoreleasePoolPop(v0);
}

void __39__VNClassRegistrar__entryForClassCode___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  const char *v3;
  const char *v4;
  unsigned int v5;

  v0 = 180;
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 2, 180);
  v2 = (void *)_entryForClassCode__ourClassCodeToRegistryEntryTable;
  _entryForClassCode__ourClassCodeToRegistryEntryTable = v1;

  v3 = "fgla";
  v4 = "fgla";
  do
  {
    v5 = *(_DWORD *)v4;
    v4 += 24;
    NSMapInsertKnownAbsent((NSMapTable *)_entryForClassCode__ourClassCodeToRegistryEntryTable, (const void *)v5, v3);
    v3 = v4;
    --v0;
  }
  while (v0);
}

void __39__VNClassRegistrar__entryForClassName___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  const void **v3;

  v0 = 180;
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 770, 2, 180);
  v2 = (void *)_entryForClassName__ourClassNameToRegistryEntryTable;
  _entryForClassName__ourClassNameToRegistryEntryTable = v1;

  v3 = (const void **)"fgla";
  do
  {
    NSMapInsertKnownAbsent((NSMapTable *)_entryForClassName__ourClassNameToRegistryEntryTable, v3[1], v3);
    v3 += 3;
    --v0;
  }
  while (v0);
}

+ (BOOL)observationBoundsAreNormalizedToROIForRequestClassCode:(unsigned int)a3 revision:(unint64_t)a4
{
  BOOL result;
  int v5;
  uint64_t v6;

  result = 0;
  if ((int)a3 > 1146386547)
  {
    if ((int)a3 <= 1196384850)
    {
      if (a3 == 1146386548)
        return result;
      if (a3 == 1195471955)
      {
        result = 0;
        v6 = -61441;
LABEL_22:
        if (a4 + (v6 & 0xFFFFFFFF0000FFFFLL | 0x21350000) >= 2 && a4 != 1)
          return 1;
        return result;
      }
      v5 = 1195994451;
    }
    else
    {
      if ((int)a3 <= 1752327526)
      {
        if (a3 != 1196384851)
        {
          v5 = 1380019817;
          goto LABEL_18;
        }
        result = 0;
        v6 = -61440;
        goto LABEL_22;
      }
      if (a3 == 1752327527)
        return result;
      v5 = 1768777584;
    }
LABEL_18:
    if (a3 == v5)
      return result;
    return 1;
  }
  if ((int)a3 <= 1145463138)
  {
    if (a3 == 1145201010)
      return a4 != 1;
    if (a3 == 1145455441)
      return result;
    v5 = 1145457773;
    goto LABEL_18;
  }
  if (a3 != 1145463139 && a3 != 1145599314)
  {
    v5 = 1146250595;
    goto LABEL_18;
  }
  return result;
}

@end
