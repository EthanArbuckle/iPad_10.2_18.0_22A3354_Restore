@implementation FSMimic

- (BOOL)isVolume
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isDirectory
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (id)extensionWithError:(id *)a3
{
  NSMutableDictionary *baseProperties;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  char isKindOfClass;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {

    if (v10)
      return v10;
  }
  else
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      return v10;
    }

  }
  -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
  if (a3)
  {
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("extension");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 5, (uint64_t)"-[FSMimic extensionWithError:]", 332, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = 0;
  return v10;
}

- (void)setObjectValue:(id)a3 forSelector:(SEL)a4
{
  NSMutableDictionary *baseProperties;
  void *v7;
  id v8;

  v8 = a3;
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](baseProperties, "setObject:forKey:", v8, v7);

}

- (BOOL)hasObjectValueForSelector:(SEL)a3
{
  NSMutableDictionary *baseProperties;
  void *v4;
  void *v5;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(baseProperties) = v5 != 0;

  return (char)baseProperties;
}

- (void)setHFSTypesUnavailable
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativePathsThatExist, 0);
  objc_storeStrong((id *)&self->_resourceValues, 0);
  objc_storeStrong((id *)&self->_baseProperties, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (FSMimic)initWithCoder:(id)a3
{
  id v4;
  FSMimic *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *baseProperties;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *resourceValues;
  void *v19;
  uint64_t v20;
  NSMutableSet *relativePathsThatExist;
  char v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FSMimic;
  v5 = -[FSMimic init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = objc_opt_class();
    +[FSMimic resourceValueClassesWithNull](FSMimic, "resourceValueClassesWithNull");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v8, v9, CFSTR("baseProperties"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");
    baseProperties = v5->_baseProperties;
    v5->_baseProperties = (NSMutableDictionary *)v11;

    v13 = objc_opt_class();
    +[FSMimic resourceValueClassesWithNull](FSMimic, "resourceValueClassesWithNull");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v13, v14, CFSTR("resourceValues"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _LSDecodeURLPropertyDictionary(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mutableCopy");
    resourceValues = v5->_resourceValues;
    v5->_resourceValues = (NSMutableDictionary *)v17;

    objc_msgSend(v4, "ls_decodeSetWithValuesOfClass:forKey:", objc_opt_class(), CFSTR("relativePathsThatExist"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "mutableCopy");
    relativePathsThatExist = v5->_relativePathsThatExist;
    v5->_relativePathsThatExist = (NSMutableSet *)v20;

    v5->_hfsType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("hfsType"));
    v5->_creator = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("creator"));
    *(_BYTE *)&v5->_flags = *(_BYTE *)&v5->_flags & 0xFE | objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HFSTypesSet"));
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HFSTypesUnavailable")))
      v22 = 2;
    else
      v22 = 0;
    *(_BYTE *)&v5->_flags = *(_BYTE *)&v5->_flags & 0xFD | v22;
  }

  return v5;
}

+ (id)resourceValueClassesWithNull
{
  if (+[FSMimic resourceValueClassesWithNull]::onceToken != -1)
    dispatch_once(&+[FSMimic resourceValueClassesWithNull]::onceToken, &__block_literal_global_4);
  return (id)+[FSMimic resourceValueClassesWithNull]::result;
}

- (id)URL
{
  return self->_url;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_baseProperties, CFSTR("baseProperties"));
  _LSEncodeURLPropertyDictionary(self->_resourceValues);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("resourceValues"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_relativePathsThatExist, CFSTR("relativePathsThatExist"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_hfsType, CFSTR("hfsType"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_creator, CFSTR("creator"));
  objc_msgSend(v5, "encodeBool:forKey:", *(_BYTE *)&self->_flags & 1, CFSTR("HFSTypesSet"));
  objc_msgSend(v5, "encodeBool:forKey:", (*(_BYTE *)&self->_flags >> 1) & 1, CFSTR("HFSTypesUnavailable"));

}

- (FSMimic)initWithURL:(id)a3
{
  id v5;
  FSMimic *v6;
  FSMimic *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *baseProperties;
  NSMutableDictionary *v10;
  NSMutableDictionary *resourceValues;
  NSMutableSet *v12;
  NSMutableSet *relativePathsThatExist;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FSMimic;
  v6 = -[FSMimic init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    baseProperties = v7->_baseProperties;
    v7->_baseProperties = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    resourceValues = v7->_resourceValues;
    v7->_resourceValues = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    relativePathsThatExist = v7->_relativePathsThatExist;
    v7->_relativePathsThatExist = v12;

    *(_BYTE *)&v7->_flags &= 0xFCu;
  }

  return v7;
}

- (BOOL)isAVCHDCollection
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)hasPackageBit
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

+ (id)basePropertyClasses
{
  if (+[FSMimic basePropertyClasses]::onceToken != -1)
    dispatch_once(&+[FSMimic basePropertyClasses]::onceToken, &__block_literal_global_30);
  return (id)+[FSMimic basePropertyClasses]::result;
}

void __30__FSMimic_basePropertyClasses__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0C99E20]);
  v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  v3 = (void *)+[FSMimic basePropertyClasses]::result;
  +[FSMimic basePropertyClasses]::result = v2;

}

void __39__FSMimic_resourceValueClassesWithNull__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  _LSGetURLPropertyClasses();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "addObject:", objc_opt_class());
  v2 = (void *)+[FSMimic resourceValueClassesWithNull]::result;
  +[FSMimic resourceValueClassesWithNull]::result = (uint64_t)v1;

}

- (BOOL)canIssueIO
{
  return 0;
}

- (void)askedForMissingSelector:(SEL)a3
{
  NSObject *v4;
  const char *Name;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    Name = sel_getName(a3);
    -[FSMimic askedForMissingSelector:].cold.1((uint64_t)Name, (uint64_t)v6, v4);
  }

}

- (void)askedForMissingResourceKey:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a3;
  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[FSMimic askedForMissingResourceKey:].cold.1((uint64_t)v3, v4, v5);

}

- (void)noteExtantChildNodeWithRelativePath:(id)a3
{
  -[NSMutableSet addObject:](self->_relativePathsThatExist, "addObject:", a3);
}

- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6
{
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v16;

  v9 = a4;
  v16 = 0;
  v10 = -[FSMimic getCachedResourceValueIfPresent:forKey:error:](self, "getCachedResourceValueIfPresent:forKey:error:", a3, v9, &v16);
  v11 = v16;
  v12 = v11;
  if (!v10)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v11);
    if (objc_msgSend(v12, "code") == 5)
    {
      objc_msgSend(v12, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

      if (v14)
        -[FSMimic askedForMissingResourceKey:](self, "askedForMissingResourceKey:", v9);
    }
  }

  return v10;
}

- (BOOL)getCachedResourceValueIfPresent:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[NSMutableDictionary objectForKey:](self->_resourceValues, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = 0;
      else
        v10 = v9;
      objc_storeStrong(a3, v10);
    }
  }
  else if (a5)
  {
    v13 = *MEMORY[0x1E0CB2938];
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 5, (uint64_t)"-[FSMimic getCachedResourceValueIfPresent:forKey:error:]", 237, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 != 0;
}

- (void)setResourceValue:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_resourceValues, "setObject:forKey:", a3, a4);
}

- (BOOL)hasResourceValueForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_resourceValues, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isBusyDirectory
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isExecutableModeFile
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isExecutable
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isResolvable
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isSymbolicLink
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isAliasFile
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isSideFault
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isRegularFile
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isHidden
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)hasHiddenExtension
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isDataContainer
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)getFileSystemRepresentation:(char)a3[1024] error:(id *)a4
{
  void *v6;
  void *v7;
  BOOL v8;

  -[FSMimic pathWithError:](self, "pathWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  if ((objc_msgSend(v6, "getFileSystemRepresentation:maxLength:", a3, 1024) & 1) == 0)
  {
    if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -2110, (uint64_t)"-[FSMimic getFileSystemRepresentation:error:]", 322, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (id)pathWithError:(id *)a3
{
  NSMutableDictionary *baseProperties;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  char isKindOfClass;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {

    if (v10)
      return v10;
  }
  else
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      return v10;
    }

  }
  -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
  if (a3)
  {
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("path");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 5, (uint64_t)"-[FSMimic pathWithError:]", 329, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = 0;
  return v10;
}

- (id)canonicalPathWithError:(id *)a3
{
  NSMutableDictionary *baseProperties;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  char isKindOfClass;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {

    if (v10)
      return v10;
  }
  else
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      return v10;
    }

  }
  -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
  if (a3)
  {
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("canonicalPath");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 5, (uint64_t)"-[FSMimic canonicalPathWithError:]", 330, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = 0;
  return v10;
}

- (id)nameWithError:(id *)a3
{
  NSMutableDictionary *baseProperties;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  char isKindOfClass;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {

    if (v10)
      return v10;
  }
  else
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      return v10;
    }

  }
  -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
  if (a3)
  {
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("name");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 5, (uint64_t)"-[FSMimic nameWithError:]", 331, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = 0;
  return v10;
}

- (BOOL)isMountTrigger
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)getVolumeIdentifier:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)isSecuredSystemContent
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isOnDiskImage
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isOnLocalVolume
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isOnTimeMachineVolume
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)getCreationDate:(double *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<double>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getContentModificationDate:(double *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<double>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getLength:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getHFSType:(unsigned int *)a3 creator:(unsigned int *)a4 error:(id *)a5
{
  char flags;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      if (!a5)
        return flags & 1;
      v7 = (void *)*MEMORY[0x1E0CB2F90];
      v8 = -10813;
      v9 = 362;
    }
    else
    {
      if (!a5)
        return flags & 1;
      v7 = (void *)*MEMORY[0x1E0CB2FE0];
      v8 = 5;
      v9 = 364;
    }
    _LSMakeNSErrorImpl(v7, v8, (uint64_t)"-[FSMimic getHFSType:creator:error:]", v9, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    return flags & 1;
  }
  if (a3)
    *a3 = self->_hfsType;
  if (a4)
    *a4 = self->_creator;
  return flags & 1;
}

- (void)setHFSType:(unsigned int)a3 creator:(unsigned int)a4
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFC | 1;
  self->_hfsType = a3;
  self->_creator = a4;
}

- (BOOL)getDeviceNumber:(int *)a3 error:(id *)a4
{
  NSMutableDictionary *baseProperties;
  FSMimic *v8;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  char isKindOfClass;
  BOOL v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  baseProperties = self->_baseProperties;
  v8 = self;
  v9 = baseProperties;
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](v9, "objectForKey:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 1;
  if (v14)
  {
    if (v12)
    {
LABEL_9:
      *a3 = objc_msgSend(v13, "intValue");
      v16 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      goto LABEL_9;

  }
  -[FSMimic askedForMissingSelector:](v8, "askedForMissingSelector:", a2);
  if (!a4)
  {
    v16 = 0;
    goto LABEL_14;
  }
  v19 = *MEMORY[0x1E0CB2938];
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 5, (uint64_t)"getFailableNumericFromBaseProperties", 284, v17);
  v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v17;
LABEL_13:

LABEL_14:
  return v16;
}

- (BOOL)getDeviceRefNum:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getInodeNumber:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getFileIdentifier:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getOwnerUID:(unsigned int *)a3 error:(id *)a4
{
  NSMutableDictionary *baseProperties;
  FSMimic *v8;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  char isKindOfClass;
  BOOL v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  baseProperties = self->_baseProperties;
  v8 = self;
  v9 = baseProperties;
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](v9, "objectForKey:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 1;
  if (v14)
  {
    if (v12)
    {
LABEL_9:
      *a3 = objc_msgSend(v13, "unsignedIntValue");
      v16 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      goto LABEL_9;

  }
  -[FSMimic askedForMissingSelector:](v8, "askedForMissingSelector:", a2);
  if (!a4)
  {
    v16 = 0;
    goto LABEL_14;
  }
  v19 = *MEMORY[0x1E0CB2938];
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 5, (uint64_t)"getFailableNumericFromBaseProperties", 284, v17);
  v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v17;
LABEL_13:

LABEL_14:
  return v16;
}

- (BOOL)childNodeWithRelativePathExists:(id)a3
{
  return -[NSMutableSet containsObject:](self->_relativePathsThatExist, "containsObject:", a3);
}

- (BOOL)isInTrash
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (BOOL)isTrashFolder
{
  NSMutableDictionary *baseProperties;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  char isKindOfClass;
  char v11;

  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    v8 = 0;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v11 = objc_msgSend(v8, "BOOLValue");

  return v11;
}

- (id)sideFaultResourceValuesWithError:(id *)a3
{
  NSMutableDictionary *baseProperties;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  char isKindOfClass;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {

    if (v10)
      return v10;
  }
  else
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      return v10;
    }

  }
  -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
  if (a3)
  {
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("sideFaultResourceValues");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 5, (uint64_t)"-[FSMimic sideFaultResourceValuesWithError:]", 400, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = 0;
  return v10;
}

+ (void)checkSelectors
{
  objc_method_description *v2;
  objc_method_description *v3;
  unint64_t v4;
  objc_selector **v5;
  uint64_t v6;
  NSObject *v7;
  const char *Name;
  NSObject *v9;
  const char *v10;
  unsigned int outCount;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  outCount = 0;
  v2 = protocol_copyMethodDescriptionList((Protocol *)&unk_1EDCCEFB8, 1, 1, &outCount);
  v3 = v2;
  if (outCount)
  {
    v4 = 0;
    v5 = (objc_selector **)v2;
    do
    {
      v6 = categorizeSelector(*v5);
      _LSDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        Name = sel_getName((SEL)*v5);
        *(_DWORD *)buf = 136315394;
        v13 = Name;
        v14 = 1024;
        v15 = v6;
        _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_INFO, "Category for %s is %d", buf, 0x12u);
      }

      if (v6 == 6)
      {
        _LSDefaultLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          v10 = sel_getName((SEL)*v5);
          *(_DWORD *)buf = 136315138;
          v13 = v10;
          _os_log_fault_impl(&dword_182882000, v9, OS_LOG_TYPE_FAULT, "unknown category for %s!", buf, 0xCu);
        }

      }
      ++v4;
      v5 += 2;
    }
    while (v4 < outCount);
  }
  free(v3);
}

- (void)askedForMissingSelector:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_5(&dword_182882000, a3, (uint64_t)a3, "asked for missing selector %s", (uint8_t *)a2);
}

- (void)askedForMissingResourceKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_5(&dword_182882000, a2, a3, "asked for missing resource key %@", (uint8_t *)&v3);
}

@end
