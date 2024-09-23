@implementation VNRequestSpecifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRequestClassName, 0);
}

+ (id)specifierForRequestClass:(Class)a3 revision:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  id v10;
  void *v11;
  unsigned int v13;

  if (!_validateRequestClass(a3, a5))
    return 0;
  NSStringFromClass(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if (+[VNClassRegistrar getClassCode:forClassName:error:](VNClassRegistrar, "getClassCode:forClassName:error:", &v13, v9, a5))
  {
    v10 = objc_alloc((Class)a1);
    v11 = (void *)objc_msgSend(v10, "initWithRequestClass:name:code:revision:", a3, v9, v13, a4);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (VNRequestSpecifier)initWithRequestClass:(Class)a3 name:(id)a4 code:(unsigned int)a5 revision:(unint64_t)a6
{
  id v10;
  VNRequestSpecifier *v11;
  VNRequestSpecifier *v12;
  uint64_t v13;
  NSString *cachedRequestClassName;
  objc_super v16;

  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VNRequestSpecifier;
  v11 = -[VNRequestSpecifier init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_requestClassCode = a5;
    v11->_requestRevision = a6;
    v13 = objc_msgSend(v10, "copy");
    cachedRequestClassName = v12->_cachedRequestClassName;
    v12->_cachedRequestClassName = (NSString *)v13;

    v12->_cachedRequestClass = a3;
  }

  return v12;
}

- (BOOL)specifiesRequestClass:(Class)a3
{
  objc_class *v4;

  v4 = -[VNRequestSpecifier requestClassAndReturnError:](self, "requestClassAndReturnError:", 0);
  return v4 && v4 == a3;
}

- (Class)requestClassAndReturnError:(id *)a3
{
  Class cachedRequestClass;
  objc_class *v4;
  void *v6;

  cachedRequestClass = self->_cachedRequestClass;
  if (cachedRequestClass)
  {
    v4 = cachedRequestClass;
  }
  else if (a3)
  {
    -[VNRequestSpecifier requestClassName](self, "requestClassName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForUnsupportedRequestClassName:](VNError, "errorForUnsupportedRequestClassName:", v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return cachedRequestClass;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[VNRequestSpecifier requestClassName](self, "requestClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return -[VNRequestSpecifier requestRevision](self, "requestRevision") ^ __ROR8__(v4, 51);
}

- (NSString)requestClassName
{
  return self->_cachedRequestClassName;
}

- (BOOL)isEqual:(id)a3
{
  VNRequestSpecifier *v4;
  VNRequestSpecifier *v5;
  unint64_t v6;
  unsigned int v7;
  BOOL v8;

  v4 = (VNRequestSpecifier *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNRequestSpecifier requestRevision](self, "requestRevision");
      if (v6 == -[VNRequestSpecifier requestRevision](v5, "requestRevision"))
      {
        v7 = -[VNRequestSpecifier requestClassCode](self, "requestClassCode");
        v8 = v7 == -[VNRequestSpecifier requestClassCode](v5, "requestClassCode");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (unsigned)requestClassCode
{
  return self->_requestClassCode;
}

+ (id)specifierForRequestClassName:(id)a3 revision:(unint64_t)a4 error:(id *)a5
{
  NSString *v8;
  id v9;
  Class v10;
  void *v11;
  unsigned int v13;

  v8 = (NSString *)a3;
  if (+[VNClassRegistrar validateRequestClassName:error:](VNClassRegistrar, "validateRequestClassName:error:", v8, a5)&& (v13 = 0, +[VNClassRegistrar getClassCode:forClassName:error:](VNClassRegistrar, "getClassCode:forClassName:error:", &v13, v8, a5)))
  {
    v9 = objc_alloc((Class)a1);
    v10 = NSClassFromString(v8);
    v11 = (void *)objc_msgSend(v9, "initWithRequestClass:name:code:revision:", v10, v8, v13, a4);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)representsSupportedRequestAndReturnError:(id *)a3
{
  Class v5;
  id v6;

  v5 = -[VNRequestSpecifier requestClassAndReturnError:](self, "requestClassAndReturnError:");
  if (v5)
  {
    LOBYTE(v5) = -[objc_class supportsAnyRevision:](v5, "supportsAnyRevision:", -[VNRequestSpecifier requestRevision](self, "requestRevision"));
    if (a3)
    {
      if ((v5 & 1) == 0)
      {
        +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", self);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v5) = 0;
        *a3 = v6;
      }
    }
  }
  return (char)v5;
}

- (BOOL)hasModelEquivalencyToRequestSpecifier:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[VNRequestSpecifier isEqual:](self, "isEqual:", v4))
  {
    v5 = 1;
  }
  else
  {
    +[VNRequestSpecifier _modelEquivalenciesRegistrar]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isRequestSpecifier:equivalentToRequestSpecifier:", self, v4);

  }
  return v5;
}

- (NSArray)allModelEquivalents
{
  void *v3;
  void *v4;

  +[VNRequestSpecifier _modelEquivalenciesRegistrar]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "equivalenciesForRequestSpecifier:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)specifiesRequestClass:(Class)a3 revision:(unint64_t)a4
{
  objc_class *v6;

  if (-[VNRequestSpecifier requestRevision](self, "requestRevision") != a4)
    return 0;
  v6 = -[VNRequestSpecifier requestClassAndReturnError:](self, "requestClassAndReturnError:", 0);
  return v6 && v6 == a3;
}

- (BOOL)specifiesRequestClassName:(id)a3 revision:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  if (-[VNRequestSpecifier requestRevision](self, "requestRevision") == a4)
  {
    -[VNRequestSpecifier requestClassName](self, "requestClassName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)specifiesRequestClass:(Class)a3 withAnyRevision:(unint64_t)a4
{
  objc_class *v7;
  BOOL result;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t *v13;
  uint64_t v14;

  v7 = -[VNRequestSpecifier requestClassAndReturnError:](self, "requestClassAndReturnError:", 0);
  result = 0;
  if (v7)
  {
    if (v7 == a3)
    {
      v9 = -[VNRequestSpecifier requestRevision](self, "requestRevision");
      v13 = &v14;
      result = a4 != 0;
      if (a4)
      {
        if (v9 != a4)
        {
          do
          {
            v10 = v13++;
            v11 = *v10;
            result = v11 != 0;
            if (v11)
              v12 = v9 == v11;
            else
              v12 = 1;
          }
          while (!v12);
        }
      }
    }
  }
  return result;
}

- (BOOL)specifiesRequestClassName:(id)a3 withAnyRevision:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  unint64_t v9;
  BOOL v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t *v15;
  uint64_t v16;

  v6 = a3;
  -[VNRequestSpecifier requestClassName](self, "requestClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = -[VNRequestSpecifier requestRevision](self, "requestRevision");
    v15 = &v16;
    v10 = a4 != 0;
    if (a4 && v9 != a4)
    {
      do
      {
        v11 = v15++;
        v12 = *v11;
        v10 = v12 != 0;
        if (v12)
          v13 = v9 == v12;
        else
          v13 = 1;
      }
      while (!v13);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)specifiesAnyRequestClass:(Class)a3
{
  objc_class *v4;
  BOOL v5;
  objc_class **v6;
  objc_class *v7;
  objc_class **v10;
  uint64_t v11;

  v4 = -[VNRequestSpecifier requestClassAndReturnError:](self, "requestClassAndReturnError:", 0);
  if (!v4)
    return 0;
  v10 = (objc_class **)&v11;
  v5 = a3 != 0;
  if (v4 != a3 && a3)
  {
    do
    {
      v6 = v10++;
      v7 = *v6;
      v5 = *v6 != 0;
    }
    while (v7 != v4 && v7 != 0);
  }
  return v5;
}

- (BOOL)specifiesRequestClassName:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[VNRequestSpecifier requestClassName](self, "requestClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)specifiesAnyRequestClassName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id *v10;
  id v11;
  id *v13;
  uint64_t v14;

  v4 = a3;
  -[VNRequestSpecifier requestClassName](self, "requestClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  v13 = (id *)&v14;
  if (v6)
  {
    v8 = v6;
    do
    {
      v9 = objc_msgSend(v5, "isEqualToString:", v8);
      if ((v9 & 1) != 0)
        break;
      v10 = v13++;
      v11 = *v10;

      v8 = v11;
    }
    while (v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)observationProvidesBoundsNormalizedToROI
{
  return +[VNClassRegistrar observationBoundsAreNormalizedToROIForRequestClassCode:revision:](VNClassRegistrar, "observationBoundsAreNormalizedToROIForRequestClassCode:revision:", -[VNRequestSpecifier requestClassCode](self, "requestClassCode"), -[VNRequestSpecifier requestRevision](self, "requestRevision"));
}

- (BOOL)isPublicRequestClass
{
  return +[VNClassRegistrar entryTypeForClassCode:](VNClassRegistrar, "entryTypeForClassCode:", -[VNRequestSpecifier requestClassCode](self, "requestClassCode")) == 1;
}

- (BOOL)isPrivateRequestClass
{
  return +[VNClassRegistrar entryTypeForClassCode:](VNClassRegistrar, "entryTypeForClassCode:", -[VNRequestSpecifier requestClassCode](self, "requestClassCode")) == 2;
}

- (BOOL)isPublicRevision
{
  return -[VNRequestSpecifier requestRevision](self, "requestRevision") < 0xDECAF000;
}

- (BOOL)isPrivateRevision
{
  return -[VNRequestSpecifier requestRevision](self, "requestRevision") > 0xDECAEFFF;
}

- (BOOL)isPublic
{
  _BOOL4 v3;

  v3 = -[VNRequestSpecifier isPublicRevision](self, "isPublicRevision");
  if (v3)
    LOBYTE(v3) = -[VNRequestSpecifier isPublicRequestClass](self, "isPublicRequestClass");
  return v3;
}

- (BOOL)isPrivate
{
  return -[VNRequestSpecifier isPrivateRevision](self, "isPrivateRevision")
      || -[VNRequestSpecifier isPrivateRequestClass](self, "isPrivateRequestClass");
}

- (id)description
{
  id v3;
  unint64_t v4;
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = -[VNRequestSpecifier requestRevision](self, "requestRevision");
  v5 = -[VNRequestSpecifier requestClassAndReturnError:](self, "requestClassAndReturnError:", 0);
  if (v5)
  {
    v6 = v5;
    VNRequestRevisionString(v5, v4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v3, "appendString:", v7);
    }
    else
    {
      NSStringFromClass(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v11);

      v8 = 0;
    }
  }
  else
  {
    -[VNRequestSpecifier requestClassName](self, "requestClassName");
    v9 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v9;
    v10 = "";
    if (v4 > 0xDECAEFFF)
      v10 = "private ";
    objc_msgSend(v3, "appendFormat:", CFSTR("unavailable %@, %srevision %lu"), v9, v10, v4);
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t requestClassCode;
  id v5;

  requestClassCode = self->_requestClassCode;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", requestClassCode, CFSTR("code"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_requestRevision, CFSTR("rev"));

}

- (VNRequestSpecifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *v6;
  id v7;
  BOOL v8;
  id v9;
  VNRequestSpecifier *v10;
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("code"));
  v13 = 0;
  +[VNClassRegistrar classNameForClassCode:error:](VNClassRegistrar, "classNameForClassCode:error:", v5, &v13);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v6)
  {
    v12 = v7;
    v8 = +[VNClassRegistrar validateRequestClassName:error:](VNClassRegistrar, "validateRequestClassName:error:", v6, &v12);
    v9 = v12;

    if (v8)
    {
      self = -[VNRequestSpecifier initWithRequestClass:name:code:revision:](self, "initWithRequestClass:name:code:revision:", NSClassFromString(v6), v6, v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rev")));
      v7 = v9;
      v10 = self;
    }
    else
    {
      objc_msgSend(v4, "failWithError:", v9);
      v10 = 0;
      v7 = v9;
    }
  }
  else
  {
    objc_msgSend(v4, "failWithError:", v7);
    v10 = 0;
  }

  return v10;
}

+ (id)_modelEquivalenciesRegistrar
{
  objc_opt_self();
  if (_modelEquivalenciesRegistrar_onceToken != -1)
    dispatch_once(&_modelEquivalenciesRegistrar_onceToken, &__block_literal_global_2576);
  return (id)_modelEquivalenciesRegistrar_modelEquivalenciesRegistrar;
}

void __50__VNRequestSpecifier__modelEquivalenciesRegistrar__block_invoke()
{
  uint64_t v0;
  VNRequestSpecifierEquivalenciesRegistrar *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *context;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v0 = MEMORY[0x1A1B0B060]();
  v1 = objc_alloc_init(VNRequestSpecifierEquivalenciesRegistrar);
  v2 = (void *)_modelEquivalenciesRegistrar_modelEquivalenciesRegistrar;
  _modelEquivalenciesRegistrar_modelEquivalenciesRegistrar = (uint64_t)v1;

  context = (void *)v0;
  if (VNRequestClasses::onceToken != -1)
    dispatch_once(&VNRequestClasses::onceToken, &__block_literal_global_80);
  v3 = (id)VNRequestClasses::ourRequestClasses;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v21 = 0;
        v9 = objc_msgSend(v8, "recordSpecifierModelEquivalenciesInRegistrar:error:", _modelEquivalenciesRegistrar_modelEquivalenciesRegistrar, &v21);
        v10 = v21;
        if ((v9 & 1) == 0)
        {
          NSStringFromClass((Class)v8);
          v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v12 = objc_msgSend(v11, "UTF8String");
          objc_msgSend(v10, "localizedDescription");
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v13, "UTF8String");
          VNValidatedLog(4, (uint64_t)CFSTR("Failed to record model equivalencies for %s - %s"), v14, v15, v16, v17, v18, v19, v12);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

  objc_autoreleasePoolPop(context);
}

+ (id)specifierForRequestClassCode:(unsigned int *)a3 revision:(unint64_t)a4 error:(id *)a5
{
  NSString *v9;
  NSString *v10;
  Class v11;
  Class v12;
  void *v13;

  +[VNClassRegistrar classNameForClassCode:error:](VNClassRegistrar, "classNameForClassCode:error:", a3, a5);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && ((v11 = NSClassFromString(v9), (v12 = v11) == 0) || _validateRequestClass(v11, a5)))
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestClass:name:code:revision:", v12, v10, a3, a4);
  else
    v13 = 0;

  return v13;
}

+ (id)availableRequestClassNames
{
  if (availableRequestClassNames_onceToken != -1)
    dispatch_once(&availableRequestClassNames_onceToken, &__block_literal_global_23_2600);
  return (id)availableRequestClassNames_availablePublicRequestClassNames;
}

+ (id)availablePrivateRequestClassNames
{
  if (availablePrivateRequestClassNames_onceToken != -1)
    dispatch_once(&availablePrivateRequestClassNames_onceToken, &__block_literal_global_26);
  return (id)availablePrivateRequestClassNames_availablePrivateRequestClassNames;
}

+ (id)allAvailableRequestClassNames
{
  if (allAvailableRequestClassNames_onceToken != -1)
    dispatch_once(&allAvailableRequestClassNames_onceToken, &__block_literal_global_27_2597);
  return (id)allAvailableRequestClassNames_allAvailableRequestClassNames;
}

+ (id)specifierForRequest:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v12;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  +[VNClassRegistrar getClassCode:forClassName:error:](VNClassRegistrar, "getClassCode:forClassName:error:", &v12, v6, 0);
  v7 = objc_alloc((Class)a1);
  v8 = v12;
  v9 = objc_msgSend(v4, "revision");

  v10 = (void *)objc_msgSend(v7, "initWithRequestClass:name:code:revision:", v5, v6, v8, v9);
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __51__VNRequestSpecifier_allAvailableRequestClassNames__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VNRequestSpecifier_allAvailableRequestClassNames__block_invoke_2;
  v4[3] = &unk_1E4548E40;
  v5 = v0;
  v3 = v0;
  +[VNClassRegistrar enumerateEntriesUsingBlock:](VNClassRegistrar, "enumerateEntriesUsingBlock:", v4);
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)allAvailableRequestClassNames_allAvailableRequestClassNames;
  allAvailableRequestClassNames_allAvailableRequestClassNames = v1;

}

uint64_t __51__VNRequestSpecifier_allAvailableRequestClassNames__block_invoke_2(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if ((a2 - 1) <= 1)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a4);
  return result;
}

void __55__VNRequestSpecifier_availablePrivateRequestClassNames__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__VNRequestSpecifier_availablePrivateRequestClassNames__block_invoke_2;
  v4[3] = &unk_1E4548E40;
  v5 = v0;
  v3 = v0;
  +[VNClassRegistrar enumerateEntriesUsingBlock:](VNClassRegistrar, "enumerateEntriesUsingBlock:", v4);
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)availablePrivateRequestClassNames_availablePrivateRequestClassNames;
  availablePrivateRequestClassNames_availablePrivateRequestClassNames = v1;

}

uint64_t __55__VNRequestSpecifier_availablePrivateRequestClassNames__block_invoke_2(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a4);
  return result;
}

void __48__VNRequestSpecifier_availableRequestClassNames__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__VNRequestSpecifier_availableRequestClassNames__block_invoke_2;
  v4[3] = &unk_1E4548E40;
  v5 = v0;
  v3 = v0;
  +[VNClassRegistrar enumerateEntriesUsingBlock:](VNClassRegistrar, "enumerateEntriesUsingBlock:", v4);
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)availableRequestClassNames_availablePublicRequestClassNames;
  availableRequestClassNames_availablePublicRequestClassNames = v1;

}

uint64_t __48__VNRequestSpecifier_availableRequestClassNames__block_invoke_2(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 1)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a4);
  return result;
}

@end
