@implementation _UTTaggedType

+ (void)initialize
{
  if (qword_1ECD26C48 != -1)
    dispatch_once(&qword_1ECD26C48, &__block_literal_global_0);
}

- (id)identifier
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *DynamicIdentifierForTaggedPointerObject;
  char __s1[4];
  __int16 v9;
  char v10;

  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 0;
  v3 = v2 ^ (unint64_t)self;
  v4 = 0xFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v3 & 7) == 0)
    v4 = 0xFFFFFFFFFFFFFLL;
  v9 = v3 >> 35;
  *(_DWORD *)__s1 = v3 >> 3;
  v10 = (v4 & (v3 >> 3)) >> 48;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", __s1, strnlen(__s1, 6uLL), 4, 0);
  DynamicIdentifierForTaggedPointerObject = (void *)_UTTypeCreateDynamicIdentifierForTaggedPointerObject();

  return DynamicIdentifierForTaggedPointerObject;
}

- (id)localizedDescription
{
  return 0;
}

- (id)version
{
  return 0;
}

- (id)referenceURL
{
  return 0;
}

- (BOOL)isDynamic
{
  return 1;
}

- (BOOL)isDeclared
{
  return 0;
}

- (BOOL)isPublicType
{
  return 0;
}

- (id)_typeRecord
{
  return 0;
}

- (id)_localizedDescriptionWithPreferredLocalizations:(id)a3
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UTTaggedType.mm"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredLocalizations != nil"));

  }
  return 0;
}

- (id)_localizedDescriptionDictionary
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)_parentTypes
{
  unint64_t v2;
  unint64_t v3;
  id v4;
  __objc2_class **v5;

  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 0xC000000000000007;
  v3 = v2 ^ (unint64_t)self;
  v4 = objc_alloc(MEMORY[0x1E0C99E40]);
  if ((v3 & 0x8000000000000) != 0)
    v5 = &off_1ECD262F0;
  else
    v5 = &off_1ECD256F0;
  return (id)objc_msgSend(v4, "initWithObject:", v5);
}

- (id)_childTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)_subtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)_isExported
{
  return 0;
}

- (BOOL)_isImported
{
  return 0;
}

- (BOOL)_isWildcard
{
  return 0;
}

- (BOOL)_isCoreType
{
  return 0;
}

- (id)_preferredTagOfClass:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char __s1[4];
  __int16 v9;
  char v10;

  if (!objc_msgSend(a3, "isEqual:", CFSTR("public.filename-extension")))
    return 0;
  v4 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v4 = 0;
  v5 = v4 ^ (unint64_t)self;
  v6 = 0xFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v5 & 7) == 0)
    v6 = 0xFFFFFFFFFFFFFLL;
  v9 = v5 >> 35;
  *(_DWORD *)__s1 = v5 >> 3;
  v10 = (v6 & (v5 >> 3)) >> 48;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", __s1, strnlen(__s1, 6uLL), 4);
}

- (BOOL)conformsToType:(id)a3
{
  __CFString *v5;
  __CFString *v6;
  BOOL v7;
  unint64_t v9;
  __objc2_class **v10;
  void *v12;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UTTaggedType.mm"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != nil"));

  }
  if (a3 == self)
    return 1;
  if (objc_msgSend(a3, "isDynamic"))
  {
    objc_msgSend(a3, "identifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[_UTTaggedType identifier](self, "identifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = _UTIdentifiersAreEqual(v5, v6);

    return v7;
  }
  v9 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v9 = 0xC000000000000007;
  if (((v9 ^ (unint64_t)self) & 0x8000000000000) != 0)
  {
    v7 = 1;
    if (a3 == &UniformTypeIdentifiers::CoreTypes::constants || a3 == &off_1ECD262F0 || a3 == &off_1ECD25710)
      return v7;
    v10 = &off_1ECD262F0;
  }
  else
  {
    v7 = 1;
    if (a3 == &off_1ECD256F0 || a3 == &UniformTypeIdentifiers::CoreTypes::constants)
      return v7;
    v10 = &off_1ECD256F0;
  }
  return objc_msgSend(v10, "conformsToType:", a3);
}

- (id)supertypes
{
  unint64_t v2;
  __objc2_class **v3;
  __objc2_class **v4;
  void *v5;
  uint64_t j;
  __objc2_class **v7;
  __objc2_class **v8;
  __objc2_class **v9;
  uint64_t i;
  __objc2_class **v12;
  __objc2_class **v13;
  __objc2_class **v14;

  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 0xC000000000000007;
  if (((v2 ^ (unint64_t)self) & 0x8000000000000) != 0)
  {
    v7 = &UniformTypeIdentifiers::CoreTypes::constants;
    v12 = &UniformTypeIdentifiers::CoreTypes::constants;
    v8 = &off_1ECD25710;
    v13 = &off_1ECD25710;
    v9 = &off_1ECD262F0;
    v14 = &off_1ECD262F0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v12, 3);
    for (i = 2; i != -1; --i)

  }
  else
  {
    v3 = &UniformTypeIdentifiers::CoreTypes::constants;
    v12 = &UniformTypeIdentifiers::CoreTypes::constants;
    v4 = &off_1ECD256F0;
    v13 = &off_1ECD256F0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v12, 2);
    for (j = 1; j != -1; --j)

  }
  return v5;
}

- (id)tags
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("public.filename-extension");
  -[UTType preferredFilenameExtension](self, "preferredFilenameExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)_getEnclosureColors:(UTHardwareColor *)a3 count:(unint64_t)a4
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  __objc2_class *v2;

  v2 = UTType;
  return (Class)UTType;
}

@end
