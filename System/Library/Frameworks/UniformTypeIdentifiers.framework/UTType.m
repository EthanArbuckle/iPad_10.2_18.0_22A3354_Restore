@implementation UTType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeRecord, 0);
}

+ (UTType)typeWithIdentifier:(NSString *)identifier
{
  return (UTType *)_UTTypeGetForIdentifier((__CFString *)identifier, 0);
}

+ (id)_constantTypeForURLPropertyProviderWithIdentifier:(id)a3
{
  return __UTFindCoreTypesConstantWithIdentifier((__CFString *)a3, 0x7FFFFFFFFFFFFFFFuLL);
}

- (NSString)preferredFilenameExtension
{
  return (NSString *)-[UTType _preferredTagOfClass:](self, "_preferredTagOfClass:", CFSTR("public.filename-extension"));
}

+ (UTType)exportedTypeWithIdentifier:(NSString *)identifier
{
  void *v3;
  int v5;
  UTType *v6;
  NSBundle *v7;

  v5 = __UTGetDeclarationStatusFromInfoPlist(identifier, 1, 0, v3);
  if (v5)
    __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__((uint64_t)identifier, 1, 0, v5);
  return (UTType *)UniformTypeIdentifiers::Type::getExportedType((__CFString *)identifier, 0, v6, v7);
}

- (id)_preferredTagOfClass:(id)a3
{
  void *v4;
  void *v5;

  -[UTType _typeRecord](self, "_typeRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredTagOfClass:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)localizedDescription
{
  void *v2;
  void *v3;

  -[UTType _typeRecord](self, "_typeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isDeclared
{
  void *v2;
  char v3;

  -[UTType _typeRecord](self, "_typeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeclared");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  id v6;
  id v7;

  -[UTType identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:");

  objc_msgSend(a3, "encodeInteger:forKey:", -[UTType _constantIndex](self, "_constantIndex"), CFSTR("constantIndex"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UTType isDeclared](self, "isDeclared"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UTType isDynamic](self, "isDynamic"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:");

}

- (BOOL)isDynamic
{
  void *v2;
  char v3;

  -[UTType _typeRecord](self, "_typeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDynamic");

  return v3;
}

- (int64_t)_constantIndex
{
  return -1;
}

+ (UTType)typeWithTag:(NSString *)tag tagClass:(NSString *)tagClass conformingToType:(UTType *)supertype
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  if (tag)
  {
    if (tagClass)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTType.mm"), 695, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tag != nil"));

    if (tagClass)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTType.mm"), 696, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tagClass != nil"));

LABEL_3:
  if (UniformTypeIdentifiers::Type::isTagValid((UniformTypeIdentifiers::Type *)tag, (__CFString *)tagClass, tag))
  {
    v10 = (void *)MEMORY[0x1E0CA5928];
    -[UTType identifier](supertype, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "typeRecordWithTag:ofClass:conformingToIdentifier:", tag, tagClass, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      +[UTType _typeWithTypeRecord:detachTypeRecord:findConstant:](UTType, "_typeWithTypeRecord:detachTypeRecord:findConstant:", v12, 1, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  return (UTType *)v13;
}

- (UTType)initWithCoder:(id)a3
{
  __CFString *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  UTType *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __objc2_class **v20;
  id v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("declared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dynamic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    if (object_getClass(self) == (Class)UTType
      && (v20 = __UTFindCoreTypesConstantWithIdentifier(v5, objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("constantIndex")))) != 0)
    {
      v14 = v20;

    }
    else
    {
      if (!v6
        || ((v8 = objc_msgSend(v6, "BOOLValue"), !v7) ? (v9 = 1) : (v9 = v8),
            (v9 & 1) != 0 || (objc_msgSend(v7, "BOOLValue") & 1) != 0))
      {
        objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithPotentiallyUndeclaredIdentifier:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
      v25 = v10;
      if (v10)
      {
        v12 = _UTTaggedTypeCreate(v10);
        v13 = v12;
        if (v12)
        {
          v14 = (UTType *)v12;

        }
        else
        {
          v14 = -[UTType _initWithTypeRecord:](self, "_initWithTypeRecord:", v11);
          if (v14)
            _UTDetachTypeRecords((uint64_t)&v25, 1);
        }

        v22 = v25;
      }
      else
      {

        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30[0] = *MEMORY[0x1E0CB2938];
        v30[1] = CFSTR("UTIdentifier");
        v31[0] = CFSTR("Unrecognized type identifier.");
        v31[1] = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v22);
        objc_msgSend(a3, "failWithError:", v23);

        v14 = 0;
      }

    }
  }
  else
  {

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    if (v5)
    {
      v28[0] = *MEMORY[0x1E0CB2938];
      v28[1] = CFSTR("UTIdentifier");
      v29[0] = CFSTR("Type identifier was not a string.");
      v29[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v16);
      objc_msgSend(a3, "failWithError:", v17);

    }
    else
    {
      v26 = *MEMORY[0x1E0CB2938];
      v27 = CFSTR("Type identifier was not encoded.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865, v18);
      objc_msgSend(a3, "failWithError:", v19);

    }
    v14 = 0;
  }

  return v14;
}

+ (NSArray)typesWithTag:(NSString *)tag tagClass:(NSString *)tagClass conformingToType:(UTType *)supertype
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  void *__p[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (tag)
  {
    if (tagClass)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTType.mm"), 711, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tag != nil"));

    if (tagClass)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTType.mm"), 712, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tagClass != nil"));

LABEL_3:
  if (!UniformTypeIdentifiers::Type::isTagValid((UniformTypeIdentifiers::Type *)tag, (__CFString *)tagClass, tag))goto LABEL_21;
  v10 = (void *)MEMORY[0x1E0CA5928];
  -[UTType identifier](supertype, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "typeRecordsWithTag:ofClass:conformingToIdentifier:", tag, tagClass, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_21;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v14);
        +[UTType _typeWithTypeRecord:detachTypeRecord:findConstant:](UTType, "_typeWithTypeRecord:detachTypeRecord:findConstant:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), 0, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v18);

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v15);
  }

  v19 = (void *)objc_msgSend(v13, "copy");
  if (qword_1ECD26C68 != -1)
    dispatch_once(&qword_1ECD26C68, &__block_literal_global_2);
  if (_MergedGlobals_2)
  {
    v20 = objc_msgSend(v14, "count");
    v21 = v20;
    if (v20)
    {
      if (v20 > 0x80)
      {
        v29 = 0;
        std::vector<UTTypeRecord *>::vector(__p, v20, &v29);
        objc_msgSend(v14, "getObjects:range:", __p[0], 0, v21);
        _UTDetachTypeRecords((uint64_t)__p[0], v21);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        bzero(__p, 0x400uLL);
        objc_msgSend(v14, "getObjects:range:", __p, 0, v21);
        _UTDetachTypeRecords((uint64_t)__p, v21);
      }
    }
  }

  if (!v19)
LABEL_21:
    v19 = (void *)MEMORY[0x1E0C9AA60];
  return (NSArray *)v19;
}

+ (id)_typeWithTypeRecord:(id)a3 detachTypeRecord:(BOOL)a4 findConstant:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  __CFString *v9;
  id v10;
  void *v11;
  id v13;

  v5 = a4;
  v13 = a3;
  if (a3)
  {
    v6 = a5;
    v8 = _UTTaggedTypeCreate(a3);
    if (v8)
      return v8;
    if (v6)
    {
      objc_msgSend(a3, "identifier");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      __UTFindCoreTypesConstantWithIdentifier(v9, 0x7FFFFFFFFFFFFFFFuLL);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if (_UTCoreTypesConstantSetTypeRecordIfNil((uint64_t)v8, v13) && v5)
          _UTDetachTypeRecords((uint64_t)&v13, 1);
        return v8;
      }
    }
  }
  v10 = -[UTType _initWithTypeRecord:]([UTType alloc], "_initWithTypeRecord:", v13);
  if (v5 && v13)
  {
    v11 = v10;
    _UTDetachTypeRecords((uint64_t)&v13, 1);
    return v11;
  }
  v8 = v10;
  return v8;
}

- (id)_initWithTypeRecord:(id)a3
{
  UTType *v4;
  UTType *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UTType;
  v4 = -[UTType init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_typeRecord, a3);
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t HashCode;

  -[UTType identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HashCode = _UTIdentifierGetHashCode(v2);

  return HashCode;
}

- (BOOL)conformsToType:(UTType *)type
{
  __CFString *v5;
  __CFString *v6;
  BOOL v7;
  char v8;
  void *v9;
  void *v10;
  void *v13;

  if (!type)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UTType.mm"), 623, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != nil"));

  }
  if (self == type)
    return 1;
  -[UTType identifier](self, "identifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[UTType identifier](type, "identifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = _UTIdentifiersAreEqual(v5, v6);

  if (v7)
    return 1;
  -[UTType _typeRecord](self, "_typeRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UTType identifier](type, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "conformsToTypeIdentifier:", v10);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  __CFString *v5;
  __CFString *v6;

  if (self == a3)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = a3;
    if (a3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UTType identifier](self, "identifier");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v3) = _UTIdentifiersAreEqual(v5, v6);

      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
  }
  return (char)v3;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[UTType _typeRecord](self, "_typeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (UTTypeRecord)_typeRecord
{
  return (UTTypeRecord *)objc_getProperty(self, a2, 8, 1);
}

+ (UTType)typeWithFilenameExtension:(NSString *)filenameExtension conformingToType:(UTType *)supertype
{
  return (UTType *)objc_msgSend(a1, "typeWithTag:tagClass:conformingToType:", filenameExtension, CFSTR("public.filename-extension"), supertype);
}

+ (id)_typeForURLPropertyProviderWithTypeRecord:(id)a3
{
  return +[UTType _typeWithTypeRecord:detachTypeRecord:findConstant:](UTType, "_typeWithTypeRecord:detachTypeRecord:findConstant:", a3, 1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)preferredMIMEType
{
  return (NSString *)-[UTType _preferredTagOfClass:](self, "_preferredTagOfClass:", CFSTR("public.mime-type"));
}

+ (UTType)typeWithFilenameExtension:(NSString *)filenameExtension
{
  return (UTType *)objc_msgSend(a1, "typeWithTag:tagClass:conformingToType:", filenameExtension, CFSTR("public.filename-extension"), &off_1ECD256F0);
}

+ (id)_typeWithIdentifier:(id)a3 allowUndeclared:(BOOL)a4
{
  return _UTTypeGetForIdentifier((__CFString *)a3, a4);
}

+ (UTType)_typeOfCurrentDevice
{
  char *v2;
  uint64_t v3;
  char *v4;
  char *v5;
  UniformTypeIdentifiers::ModelCode *v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  void *v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  LOBYTE(v13) = 0;
  v14 = 0;
  if (qword_1ECD26BE8 != -1)
    dispatch_once(&qword_1ECD26BE8, &__block_literal_global_32);
  if (!_MergedGlobals)
    goto LABEL_15;
  v2 = getenv("__UTModelCodeOverride");
  if (!v2)
  {
    v7 = getenv("__UTEnclosureColorOverride");
    if (!v7)
      goto LABEL_15;
    v5 = v7;
    v6 = 0;
LABEL_9:
    if (strchr(v5, 44))
    {
      v16 = 0;
      v15 = 0;
      if (sscanf(v5, "%u,%u,%u", &v15, (char *)&v15 + 4, &v16) < 3)
      {
        if (v6)
        {
          v8 = 0;
          v9 = 0;
          v10 = 0;
LABEL_21:
          v13 = v9 | v8;
          v14 = v10;
          UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(v6, (UniformTypeIdentifiers::ModelCode *)&v13, 3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          return (UTType *)v12;
        }
        goto LABEL_15;
      }
      v9 = 0;
      v8 = ((unint64_t)BYTE4(v15) << 40) | ((unint64_t)v16 << 48) | ((unint64_t)v15 << 32);
    }
    else
    {
      v8 = strtoll(v5, 0, 0) << 32;
      v9 = 1;
    }
    v10 = 1;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = getenv("__UTEnclosureColorOverride");
  if (v4)
  {
    v5 = v4;
    v6 = (UniformTypeIdentifiers::ModelCode *)v3;
    goto LABEL_9;
  }
  if (v3)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v6 = (UniformTypeIdentifiers::ModelCode *)v3;
    goto LABEL_21;
  }
LABEL_15:
  if (qword_1ECD26BE0 != -1)
    dispatch_once(&qword_1ECD26BE0, &__block_literal_global);
  return (UTType *)(id)qword_1ECD26BD8;
}

void __48__UTType_DeviceModelCodes___typeOfCurrentDevice__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BYTE v2[12];

  v2[0] = 0;
  v2[8] = 0;
  UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(0, (UniformTypeIdentifiers::ModelCode *)v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD26BD8;
  qword_1ECD26BD8 = v0;

}

+ (id)_typeWithDeviceModelCode:(id)a3
{
  void *v7;
  _BYTE v8[12];

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTModelCode.mm"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelCode != nil"));

  }
  v8[0] = 0;
  v8[8] = 0;
  UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode((UniformTypeIdentifiers::ModelCode *)a3, (UniformTypeIdentifiers::ModelCode *)v8, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_typeWithDeviceModelCode:(id)a3 enclosureColor:(UTHardwareColor)a4
{
  void *v9;
  UTHardwareColor v10;
  char v11;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTModelCode.mm"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelCode != nil"));

  }
  v10 = a4;
  v11 = 1;
  UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode((UniformTypeIdentifiers::ModelCode *)a3, (UniformTypeIdentifiers::ModelCode *)&v10, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_typeWithDeviceModelCodeWithoutResolvingCurrentDevice:(id)a3
{
  void *v7;
  _BYTE v8[12];

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTModelCode.mm"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelCode != nil"));

  }
  v8[0] = 0;
  v8[8] = 0;
  UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCodeAndHardwareColorWithoutResolvingCurrentDevice(a3, (UniformTypeIdentifiers::ModelCode *)v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_getPreferredEnclosureColor:(UTHardwareColor *)a3
{
  void *v7;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UTModelCode.mm"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outEnclosureColor != NULL"));

  }
  return -[UTType _getEnclosureColors:count:](self, "_getEnclosureColors:count:", a3, 1) == 1;
}

- (unint64_t)_getEnclosureColors:(UTHardwareColor *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  const void *v14;
  unint64_t v15;
  void *v16;
  int v17;
  int v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int8x8_t v30;
  uint64x2_t v31;
  int64x2_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v37;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  int v44;
  _QWORD v45[2];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v4 = a4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UTModelCode.mm"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outEnclosureColors != NULL"));

    a4 = v4;
  }
  v39 = a4;
  if (!a4)
    return 0;
  if (-[UTType conformsToType:](self, "conformsToType:", &off_1ECD26A10))
  {
    -[UTType identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeOfString:options:", CFSTR("-"), 4);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "substringFromIndex:", v7 + v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");
      v12 = 0;
      v13 = 0;
      do
      {
        v14 = (const void *)UniformTypeIdentifiers::ModelCode::getiOSHardwareColor(NSString *)::colors[v12];
        if (v14 && CFEqual(v14, v10))
        {
          v4 = ((unint64_t)LOBYTE(UniformTypeIdentifiers::ModelCode::getiOSHardwareColor(NSString *)::colors[v12 + 1]) << 24) | ((unint64_t)BYTE1(UniformTypeIdentifiers::ModelCode::getiOSHardwareColor(NSString *)::colors[v12 + 1]) << 32) | ((unint64_t)BYTE2(UniformTypeIdentifiers::ModelCode::getiOSHardwareColor(NSString *)::colors[v12 + 1]) << 40);
          v13 = 1;
        }
        v12 += 2;
      }
      while (v12 != 20);
      if (v13 || v11 < 3)
      {
        LOBYTE(v15) = 0;
        if (!v13 && v11 && v11 <= 2)
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v10);
          v45[0] = -1;
          v17 = objc_msgSend(v16, "scanLongLong:", v45);
          if (v45[0] >= 0)
            v18 = v17;
          else
            v18 = 0;
          v19 = v45[0] < 0x80000000;
          v13 = v18 & v19;
          LOBYTE(v15) = (v18 & v19) != 0;
          if ((v18 & v19) != 0)
            v4 = v45[0] << 24;

        }
      }
      else
      {
        v44 = 0;
        LODWORD(v45[0]) = 0;
        v13 = 0;
        LOBYTE(v15) = 0;
        if (sscanf((const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), "%x%n", v45, &v44) == 1
          && v44 == 6)
        {
          v15 = ((unint64_t)LOBYTE(v45[0]) << 48) | ((unint64_t)BYTE1(v45[0]) << 40) | ((unint64_t)BYTE2(v45[0]) << 32);
          v4 = v15 >> 8;
          v13 = 1;
        }
      }
      if (v13)
      {
        *a3 = (UTHardwareColor)(v15 | (v4 << 8));
        v9 = 1;
      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }
  if (v9 >= v39)
    return 1;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[UTType tags](self, "tags");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("com.apple.device-model-code"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v41 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v27 = objc_msgSend(v25, "rangeOfString:", CFSTR("@ECOLOR="));
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v28 = v26;
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v25);
          objc_msgSend(v29, "setCharactersToBeSkipped:", 0);
          objc_msgSend(v29, "setScanLocation:", v27 + v28);
          memset(v45, 0, 12);
          if (objc_msgSend(v29, "scanInt:", v45))
          {
            if (objc_msgSend(v29, "scanString:intoString:", CFSTR(","), 0)
              && objc_msgSend(v29, "scanInt:", (char *)v45 + 4)
              && objc_msgSend(v29, "scanString:intoString:", CFSTR(","), 0)
              && objc_msgSend(v29, "scanInt:", &v45[1]))
            {
              v30 = vand_s8((int8x8_t)vmax_s32(*(int32x2_t *)((char *)v45 + 4), 0), (int8x8_t)0xFF000000FFLL);
              v31.i64[0] = v30.u32[0];
              v31.i64[1] = v30.u32[1];
              v32 = (int64x2_t)vshlq_u64(v31, (uint64x2_t)xmmword_1991E5870);
              v33 = vorrq_s8((int8x16_t)vdupq_laneq_s64(v32, 1), (int8x16_t)v32).u64[0];
              v34 = (unint64_t)(LOBYTE(v45[0]) & ~(SLODWORD(v45[0]) >> 31)) << 32;
            }
            else
            {
              v33 = (unint64_t)LODWORD(v45[0]) << 32;
              v34 = 1;
            }
            a3[v9++] = (UTHardwareColor)(v33 | v34);
            if (v9 >= v39)
            {

              goto LABEL_54;
            }
          }

        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v22)
        continue;
      break;
    }
  }
LABEL_54:

  return v9;
}

+ (id)_typeWithBluetoothProductID:(unsigned int)a3 vendorID:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  UniformTypeIdentifiers::Accessory *v13;
  NSObject *v14;
  uint8_t buf[4];
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d:%d"), a4, *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UTType typeWithTag:tagClass:conformingToType:](UTType, "typeWithTag:tagClass:conformingToType:", v5, CFSTR("public.bluetooth-vendor-product-id"), &off_1ECD26850);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v6 = (void *)objc_msgSend(v6, "isDeclared");
    if ((_DWORD)v6)
    {
      v8 = v7;
      v9 = v8;
      goto LABEL_75;
    }
  }
  UniformTypeIdentifiers::Accessory::log((UniformTypeIdentifiers::Accessory *)v6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v17 = a3;
    _os_log_error_impl(&dword_1991D8000, v10, OS_LOG_TYPE_ERROR, "Failed to find type for bluetooth device '%d'", buf, 8u);
  }

  if ((int)a3 > 21759)
  {
    if ((int)a3 <= 28943)
    {
      if ((int)a3 > 28935)
      {
        if (a3 == 28936)
        {
          v11 = "AppleTV6,2";
          goto LABEL_68;
        }
        if (a3 == 28943)
        {
          v11 = "AudioAccessory1,1";
          goto LABEL_68;
        }
      }
      else
      {
        if (a3 == 21760)
        {
          v11 = "Device1,21760";
          goto LABEL_68;
        }
        if (a3 == 28420)
        {
          v11 = "AppleTV5,3";
          goto LABEL_68;
        }
      }
    }
    else if ((int)a3 <= 29714)
    {
      if (a3 == 28944)
      {
        v11 = "AudioAccessory1,2";
        goto LABEL_68;
      }
      if (a3 == 29455)
      {
        v11 = "AppleTV11,2";
        goto LABEL_68;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x7413u:
          v11 = "AudioAccessory5,1";
          goto LABEL_68;
        case 0xFFFDu:
          v11 = "HeGn";
          goto LABEL_68;
        case 0xFFFEu:
          v11 = "ApGn";
          goto LABEL_68;
      }
    }
  }
  else
  {
    if ((int)a3 > 8193)
    {
      switch(a3)
      {
        case 0x2002u:
          v11 = "AirPods1,1";
          break;
        case 0x2003u:
          v11 = "PowerBeats3,1";
          break;
        case 0x2005u:
          v11 = "BeatsX1,1";
          break;
        case 0x2006u:
          v11 = "BeatsSolo3,1";
          break;
        case 0x2009u:
          v11 = "BeatsStudio3,2";
          break;
        case 0x200Au:
          v11 = "Device1,8202";
          break;
        case 0x200Bu:
          v11 = "PowerbeatsPro1,1";
          break;
        case 0x200Cu:
          v11 = "BeatsSoloPro1,1";
          break;
        case 0x200Du:
          v11 = "Powerbeats4,1";
          break;
        case 0x200Eu:
          v11 = "AirPodsPro1,1";
          break;
        case 0x200Fu:
          v11 = "AirPods1,3";
          break;
        case 0x2010u:
          v11 = "Device1,8208";
          break;
        case 0x2011u:
          v11 = "BeatsStudioBuds1,1";
          break;
        case 0x2012u:
          v11 = "Device1,8210";
          break;
        case 0x2013u:
          v11 = "Device1,8211";
          break;
        case 0x2014u:
          v11 = "Device1,8212";
          break;
        case 0x2015u:
          v11 = "Device1,8213";
          break;
        case 0x2016u:
          v11 = "BeatsStudioBuds1,2";
          break;
        case 0x2017u:
          v11 = "BeatsStudioPro1,1";
          break;
        case 0x2018u:
          v11 = "Device1,8216";
          break;
        case 0x2019u:
          v11 = "Device1,8217";
          break;
        case 0x201Au:
          v11 = "Device1,8218";
          break;
        case 0x201Bu:
          v11 = "Device1,8219";
          break;
        case 0x201Cu:
          v11 = "Device1,8220";
          break;
        case 0x201Du:
          v11 = "Device1,8221";
          break;
        case 0x201Eu:
          v11 = "Device1,8222";
          break;
        case 0x201Fu:
          v11 = "Device1,8223";
          break;
        case 0x2020u:
          v11 = "Device1,8224";
          break;
        case 0x2024u:
          v11 = "Device1,8228";
          break;
        case 0x2025u:
          v11 = "Device1,8229";
          break;
        case 0x2026u:
          v11 = "Device1,8230";
          break;
        default:
          goto LABEL_67;
      }
      goto LABEL_68;
    }
    switch(a3)
    {
      case 0u:
        v11 = "Invalid";
        goto LABEL_68;
      case 0x266u:
        v11 = "ATVRemote1,1";
        goto LABEL_68;
      case 0x26Du:
        v11 = "ATVRemote1,2";
        goto LABEL_68;
    }
  }
LABEL_67:
  v11 = "?";
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UTType _typeWithDeviceModelCodeWithoutResolvingCurrentDevice:](UTType, "_typeWithDeviceModelCodeWithoutResolvingCurrentDevice:", v12);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 && (v13 = (UniformTypeIdentifiers::Accessory *)objc_msgSend(v8, "isDeclared"), (_DWORD)v13))
  {
    v9 = v8;
  }
  else
  {
    UniformTypeIdentifiers::Accessory::log(v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v17 = a3;
      _os_log_impl(&dword_1991D8000, v14, OS_LOG_TYPE_DEFAULT, "Failed to find type for bluetooth device '%d' via model code", buf, 8u);
    }

    v9 = 0;
  }

LABEL_75:
  return v9;
}

+ (UTType)new
{
  abort();
}

- (UTType)init
{
  abort();
}

+ (UTType)typeWithMIMEType:(NSString *)mimeType
{
  return (UTType *)objc_msgSend(a1, "typeWithTag:tagClass:conformingToType:", mimeType, CFSTR("public.mime-type"), &off_1ECD256F0);
}

+ (UTType)typeWithMIMEType:(NSString *)mimeType conformingToType:(UTType *)supertype
{
  return (UTType *)objc_msgSend(a1, "typeWithTag:tagClass:conformingToType:", mimeType, CFSTR("public.mime-type"), supertype);
}

- (NSNumber)version
{
  void *v2;
  void *v3;

  -[UTType _typeRecord](self, "_typeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSURL)referenceURL
{
  void *v2;
  void *v3;

  -[UTType _typeRecord](self, "_typeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "referenceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)isPublicType
{
  void *v2;
  char v3;

  -[UTType _typeRecord](self, "_typeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInPublicDomain");

  return v3;
}

+ (void)_enumerateAllDeclaredTypesUsingBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  unsigned __int8 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTType.mm"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  v19 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(MEMORY[0x1E0CA5928], "enumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
LABEL_5:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v6)
        objc_enumerationMutation(v4);
      v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
      v9 = (void *)MEMORY[0x19AEBD0C8]();
      +[UTType _typeWithTypeRecord:detachTypeRecord:findConstant:](UTType, "_typeWithTypeRecord:detachTypeRecord:findConstant:", v8, 1, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        (*((void (**)(id, void *, unsigned __int8 *))a3 + 2))(a3, v10, &v19);

      v11 = v19;
      objc_autoreleasePoolPop(v9);
      if (v11)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v5)
          goto LABEL_5;
        break;
      }
    }
  }

}

+ (id)_typesWithIdentifiers:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  void *__p[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        v8 = *(__CFString **)(*((_QWORD *)&v27 + 1) + 8 * i);
        __UTFindCoreTypesConstantWithIdentifier(v8, 0x7FFFFFFFFFFFFFFFuLL);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "_isRealized"))
        {
          v10 = (void *)v32[5];
          if (!v10)
          {
            v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
            v12 = (void *)v32[5];
            v32[5] = v11;

            v10 = (void *)v32[5];
          }
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v8);
          if (!v5)
            v5 = (void *)objc_msgSend(v3, "mutableCopy");
          objc_msgSend(v5, "removeObject:", v8);
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v4);

    if (v5)
    {
      v13 = objc_msgSend(v5, "count");
      v14 = v5;
      if (!v13)
        goto LABEL_30;
      goto LABEL_19;
    }
  }
  else
  {

    v5 = 0;
  }
  v14 = v3;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordsWithIdentifiers:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __32__UTType__typesWithIdentifiers___block_invoke;
    v23[3] = &unk_1E35CE448;
    v26 = &v31;
    v17 = v15;
    v24 = v17;
    v25 = v3;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v23);
    if (qword_1ECD26C68 != -1)
      dispatch_once(&qword_1ECD26C68, &__block_literal_global_2);
    if (_MergedGlobals_2)
    {
      v18 = objc_msgSend(v17, "count");
      v19 = v18;
      if (v18)
      {
        if (v18 > 0x80)
        {
          v37 = 0;
          std::vector<UTTypeRecord *>::vector(__p, v18, &v37);
          objc_msgSend(v17, "getObjects:andKeys:count:", __p[0], 0, v19);
          _UTDetachTypeRecords((uint64_t)__p[0], v19);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
          bzero(__p, 0x400uLL);
          objc_msgSend(v17, "getObjects:andKeys:count:", __p, 0, v19);
          _UTDetachTypeRecords((uint64_t)__p, v19);
        }
      }
    }

  }
LABEL_30:
  v20 = (void *)v32[5];
  if (v20)
    v21 = (void *)objc_msgSend(v20, "copy", v14);
  else
    v21 = (void *)MEMORY[0x1E0C9AA70];

  _Block_object_dispose(&v31, 8);
  return v21;
}

void __32__UTType__typesWithIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  +[UTType _typeWithTypeRecord:detachTypeRecord:findConstant:](UTType, "_typeWithTypeRecord:detachTypeRecord:findConstant:", a3, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = v5;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
    objc_msgSend(*(id *)(a1 + 40), "member:", a2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = a2;
    v12 = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v13, v12);
    v5 = v13;
  }

}

- (id)_localizedDescriptionWithPreferredLocalizations:(id)a3
{
  void *v5;
  void *v6;
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UTType.mm"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredLocalizations != nil"));

  }
  -[UTType _typeRecord](self, "_typeRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedDescriptionWithPreferredLocalizations:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)_localizedDescriptionDictionary
{
  void *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;

  -[UTType identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)_UTTypeCopyDescriptionLocalizationDictionary();

  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v4;

  return v5;
}

- (NSString)_kindString
{
  void *v2;
  void *v3;

  -[UTType identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)_UTTypeCopyKindStringForNonMaterializedItem();

  return (NSString *)v3;
}

- (id)_kindStringWithPreferredLocalizations:(id)a3
{
  void *v4;
  void *v5;
  void *v8;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UTType.mm"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredLocalizations != nil"));

  }
  -[UTType identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)_UTTypeCopyKindStringForNonMaterializedItem();

  return v5;
}

- (NSDictionary)_kindStringDictionary
{
  void *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;

  -[UTType identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)_UTTypeCopyKindStringDictionaryForNonMaterializedItem();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v3;

  return v5;
}

+ (id)_typeOfItemAtFileURL:(id)a3 error:(id *)a4
{
  int v6;
  id v7;
  void *v8;
  BOOL v9;
  id v11;
  void *v12;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v6 = objc_msgSend(a3, "getResourceValue:forKey:error:", &v14, *MEMORY[0x1E0C998E0], a4);
  v7 = v14;
  v8 = v7;
  if (v6)
    v9 = a4 == 0;
  else
    v9 = 1;
  if (!v9 && v7 == 0)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB3308];
    v16[0] = a3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, v12);

  }
  return v8;
}

+ (id)_typeOfPromiseAtFileURL:(id)a3 error:(id *)a4
{
  id v8;
  void *v9;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTType.mm"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("promiseURL.fileURL"));

    if (!a4)
      return 0;
    goto LABEL_3;
  }
  if (a4)
  {
LABEL_3:
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = *MEMORY[0x1E0CB3308];
    v13[0] = a3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, v9);

  }
  return 0;
}

- (NSOrderedSet)_parentTypes
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  unint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  unint64_t v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  void *__p[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v4 = (void *)MEMORY[0x19AEBD0C8]();
  -[UTType _typeRecord](self, "_typeRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __22__UTType__parentTypes__block_invoke;
  v27[3] = &unk_1E35CE470;
  v6 = v3;
  v28 = v6;
  objc_msgSend(v5, "enumerateParentTypesWithBlock:", v27);

  v7 = v6;
  if (qword_1ECD26C68 != -1)
    dispatch_once(&qword_1ECD26C68, &__block_literal_global_2);
  if (_MergedGlobals_2)
  {
    v8 = objc_msgSend(v7, "count");
    if (v8)
    {
      if (v8 > 0x80)
      {
        v33[0] = 0;
        std::vector<UTTypeRecord *>::vector(__p, v8, v33);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v17 = v7;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
        if (v18)
        {
          v19 = 0;
          v20 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v35 != v20)
                objc_enumerationMutation(v17);
              v22 = (unint64_t)*(id *)(*((_QWORD *)&v34 + 1) + 8 * i);
              v23 = (void *)v22;
              if ((v22 & 0x8000000000000000) == 0 && objc_msgSend((id)v22, "_constantIndex") < 0)
              {
                v24 = (id)objc_msgSend(v23, "_typeRecord");
                if (v24)
                  *((_QWORD *)__p[0] + v19++) = v24;
              }

            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
          }
          while (v18);

          if (v19)
            _UTDetachTypeRecords((uint64_t)__p[0], v19);
        }
        else
        {

        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        bzero(v33, 0x400uLL);
        *(_OWORD *)__p = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v9 = v7;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __p, &v34, 16);
        if (v10)
        {
          v11 = 0;
          v12 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v30 != v12)
                objc_enumerationMutation(v9);
              v14 = (unint64_t)*((id *)__p[1] + j);
              v15 = (void *)v14;
              if ((v14 & 0x8000000000000000) == 0 && objc_msgSend((id)v14, "_constantIndex") < 0)
              {
                v16 = (id)objc_msgSend(v15, "_typeRecord");
                if (v16)
                  v33[v11++] = (uint64_t)v16;
              }

            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __p, &v34, 16);
          }
          while (v10);

          if (v11)
            _UTDetachTypeRecords((uint64_t)v33, v11);
        }
        else
        {

        }
      }
    }
  }

  objc_autoreleasePoolPop(v4);
  v25 = (void *)objc_msgSend(v7, "copy");

  return (NSOrderedSet *)v25;
}

void __22__UTType__parentTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[UTType _typeWithTypeRecord:detachTypeRecord:findConstant:](UTType, "_typeWithTypeRecord:detachTypeRecord:findConstant:", a2, 0, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (NSSet)_childTypes
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = (void *)MEMORY[0x19AEBD0C8]();
  -[UTType _typeRecord](self, "_typeRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __21__UTType__childTypes__block_invoke;
  v9[3] = &unk_1E35CE470;
  v6 = v3;
  v10 = v6;
  objc_msgSend(v5, "enumerateChildTypesWithBlock:", v9);

  UniformTypeIdentifiers::Type::detachTypeRecordsInTypes<NSMutableSet<UTType *> * {__strong}>(v6);
  objc_autoreleasePoolPop(v4);
  v7 = (void *)objc_msgSend(v6, "copy");

  return (NSSet *)v7;
}

void __21__UTType__childTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[UTType _typeWithTypeRecord:detachTypeRecord:findConstant:](UTType, "_typeWithTypeRecord:detachTypeRecord:findConstant:", a2, 0, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (NSSet)_subtypes
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = (void *)MEMORY[0x19AEBD0C8]();
  -[UTType _typeRecord](self, "_typeRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __19__UTType__subtypes__block_invoke;
  v9[3] = &unk_1E35CE470;
  v6 = v3;
  v10 = v6;
  objc_msgSend(v5, "enumerateDescendantsWithBlock:", v9);

  UniformTypeIdentifiers::Type::detachTypeRecordsInTypes<NSMutableSet<UTType *> * {__strong}>(v6);
  objc_autoreleasePoolPop(v4);
  v7 = (void *)objc_msgSend(v6, "copy");

  return (NSSet *)v7;
}

void __19__UTType__subtypes__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[UTType _typeWithTypeRecord:detachTypeRecord:findConstant:](UTType, "_typeWithTypeRecord:detachTypeRecord:findConstant:", a2, 0, 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (BOOL)_isExported
{
  void *v2;
  char v3;

  -[UTType _typeRecord](self, "_typeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExported");

  return v3;
}

- (BOOL)_isImported
{
  void *v2;
  char v3;

  -[UTType _typeRecord](self, "_typeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isImported");

  return v3;
}

- (BOOL)_isWildcard
{
  void *v2;
  char v3;

  -[UTType _typeRecord](self, "_typeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWildcard");

  return v3;
}

- (BOOL)_isCoreType
{
  void *v2;
  void *v3;
  char v4;

  -[UTType _typeRecord](self, "_typeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isCoreType");
  else
    v4 = 0;

  return v4;
}

+ (void)_unrealizeAllCoreTypes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  _UTGetAllCoreTypesConstants();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "_unrealize", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (BOOL)_isRealized
{
  return 1;
}

- (id)debugDescription
{
  id v3;
  Class Class;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  Class = object_getClass(self);
  -[UTType identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UTType isDynamic](self, "isDynamic");
  v7 = -[UTType isDeclared](self, "isDeclared");
  v8 = CFSTR("not ");
  if (v6)
    v9 = &stru_1E35CEBE8;
  else
    v9 = CFSTR("not ");
  if (v7)
    v8 = &stru_1E35CEBE8;
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> %@ (%@dynamic, %@declared)"), Class, self, v5, v9, v8);

  return v10;
}

- (BOOL)isSupertypeOfType:(UTType *)type
{
  void *v7;

  if (!type)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UTType.mm"), 641, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != nil"));

  }
  return -[UTType isSubtypeOfType:](type, "isSubtypeOfType:", self);
}

- (BOOL)isSubtypeOfType:(UTType *)type
{
  __CFString *v5;
  __CFString *v6;
  BOOL v7;
  void *v10;

  if (!type)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UTType.mm"), 648, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != nil"));

  }
  if (self == type)
    return 0;
  -[UTType identifier](self, "identifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[UTType identifier](type, "identifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = !_UTIdentifiersAreEqual(v5, v6) && -[UTType conformsToType:](self, "conformsToType:", type);

  return v7;
}

- (NSSet)supertypes
{
  id v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  unint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  unint64_t v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  void *__p[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[UTType _typeRecord](self, "_typeRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __33__UTType_Conformance__supertypes__block_invoke;
  v25[3] = &unk_1E35CE470;
  v5 = v3;
  v26 = v5;
  objc_msgSend(v4, "enumeratePedigreeWithBlock:", v25);

  v6 = (id)objc_msgSend(v5, "copy");
  if (qword_1ECD26C68 != -1)
    dispatch_once(&qword_1ECD26C68, &__block_literal_global_2);
  if (_MergedGlobals_2)
  {
    v7 = objc_msgSend(v6, "count");
    if (v7)
    {
      if (v7 > 0x80)
      {
        v31[0] = 0;
        std::vector<UTTypeRecord *>::vector(__p, v7, v31);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v16 = v6;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
        if (v17)
        {
          v18 = 0;
          v19 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v33 != v19)
                objc_enumerationMutation(v16);
              v21 = (unint64_t)*(id *)(*((_QWORD *)&v32 + 1) + 8 * i);
              v22 = (void *)v21;
              if ((v21 & 0x8000000000000000) == 0 && objc_msgSend((id)v21, "_constantIndex") < 0)
              {
                v23 = (id)objc_msgSend(v22, "_typeRecord");
                if (v23)
                  *((_QWORD *)__p[0] + v18++) = v23;
              }

            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
          }
          while (v17);

          if (v18)
            _UTDetachTypeRecords((uint64_t)__p[0], v18);
        }
        else
        {

        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        bzero(v31, 0x400uLL);
        *(_OWORD *)__p = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", __p, &v32, 16);
        if (v9)
        {
          v10 = 0;
          v11 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v28 != v11)
                objc_enumerationMutation(v8);
              v13 = (unint64_t)*((id *)__p[1] + j);
              v14 = (void *)v13;
              if ((v13 & 0x8000000000000000) == 0 && objc_msgSend((id)v13, "_constantIndex") < 0)
              {
                v15 = (id)objc_msgSend(v14, "_typeRecord");
                if (v15)
                  v31[v10++] = (uint64_t)v15;
              }

            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", __p, &v32, 16);
          }
          while (v9);

          if (v10)
            _UTDetachTypeRecords((uint64_t)v31, v10);
        }
        else
        {

        }
      }
    }
  }

  return (NSSet *)v6;
}

void __33__UTType_Conformance__supertypes__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = (void *)MEMORY[0x19AEBD0C8]();
  +[UTType _typeWithTypeRecord:detachTypeRecord:findConstant:](UTType, "_typeWithTypeRecord:detachTypeRecord:findConstant:", a2, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  objc_autoreleasePoolPop(v4);
}

- (NSDictionary)tags
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSDictionary *v6;

  -[UTType _typeRecord](self, "_typeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tagSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_expensiveDictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v6 = v4;

  return v6;
}

+ (UTType)exportedTypeWithIdentifier:(NSString *)identifier conformingToType:(UTType *)parentType
{
  void *v4;
  int v6;
  UTType *v7;
  NSBundle *v8;
  void *v12;

  if (!parentType)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTType.mm"), 751, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentType != nil"));

  }
  v6 = __UTGetDeclarationStatusFromInfoPlist(identifier, 1, 0, v4);
  if (v6)
    __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__((uint64_t)identifier, 1, 0, v6);
  return (UTType *)UniformTypeIdentifiers::Type::getExportedType((__CFString *)identifier, 0, v7, v8);
}

+ (UTType)importedTypeWithIdentifier:(NSString *)identifier
{
  void *v3;
  int v5;
  NSBundle *v6;

  v5 = __UTGetDeclarationStatusFromInfoPlist(identifier, 0, 0, v3);
  if (v5)
    __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__((uint64_t)identifier, 0, 0, v5);
  return (UTType *)UniformTypeIdentifiers::Type::getImportedType((UniformTypeIdentifiers::Type *)identifier, 0, 0, v6);
}

+ (UTType)importedTypeWithIdentifier:(NSString *)identifier conformingToType:(UTType *)parentType
{
  void *v4;
  int v7;
  NSBundle *v8;
  void *v12;

  if (!parentType)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTType.mm"), 765, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentType != nil"));

  }
  v7 = __UTGetDeclarationStatusFromInfoPlist(identifier, 0, 0, v4);
  if (v7)
    __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__((uint64_t)identifier, 0, 0, v7);
  return (UTType *)UniformTypeIdentifiers::Type::getImportedType((UniformTypeIdentifiers::Type *)identifier, (NSString *)&parentType->super.isa, 0, v8);
}

+ (id)_exportedTypeWithIdentifier:(id)a3 bundle:(id)a4 conformingToType:(id)a5
{
  void *v5;
  int v8;
  UTType *v9;
  NSBundle *v10;

  v8 = __UTGetDeclarationStatusFromInfoPlist(a3, 1, a4, v5);
  if (v8)
    __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__((uint64_t)a3, 1, a4, v8);
  return UniformTypeIdentifiers::Type::getExportedType((__CFString *)a3, (NSString *)a4, v9, v10);
}

+ (id)_importedTypeWithIdentifier:(id)a3 bundle:(id)a4 conformingToType:(id)a5
{
  void *v5;
  int v9;
  NSBundle *v10;

  v9 = __UTGetDeclarationStatusFromInfoPlist(a3, 0, a4, v5);
  if (v9)
    __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__((uint64_t)a3, 0, a4, v9);
  return UniformTypeIdentifiers::Type::getImportedType((UniformTypeIdentifiers::Type *)a3, (NSString *)a5, (UTType *)a4, v10);
}

+ (id)_typeWithIdentifier:(id)a3 constantIndex:(int64_t)a4 error:(id *)a5
{
  void *v9;
  id v10;
  void *v11;
  void *v13;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTType.mm"), 916, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  if (a1 == UTType)
  {
    __UTFindCoreTypesConstantWithIdentifier((__CFString *)a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      return v9;
    objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[UTType _typeWithTypeRecord:detachTypeRecord:findConstant:](UTType, "_typeWithTypeRecord:detachTypeRecord:findConstant:", v13, 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

    if (!a5)
      return v9;
  }
  else
  {
    objc_msgSend(a1, "typeWithIdentifier:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a5)
      return v9;
  }
  if (!v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16[0] = *MEMORY[0x1E0CB2938];
    v16[1] = CFSTR("UTIdentifier");
    v17[0] = CFSTR("Unrecognized type identifier.");
    v17[1] = a3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v11);

    return 0;
  }
  return v9;
}

- (BOOL)_shouldURLPropertyProviderEncodeTypeRecord
{
  return (unint64_t)-[UTType _constantIndex](self, "_constantIndex") >> 63;
}

@end
