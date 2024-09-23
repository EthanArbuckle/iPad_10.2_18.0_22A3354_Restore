@implementation LSApplicationIdentity

- (id)findApplicationRecordWithError:(id *)a3
{
  return -[LSApplicationIdentity findApplicationRecordFetchingPlaceholder:error:](self, "findApplicationRecordFetchingPlaceholder:error:", 1, a3);
}

- (id)findApplicationRecordFetchingPlaceholder:(int64_t)a3 error:(id *)a4
{
  LSApplicationRecord *v5;
  LSApplicationRecord *v6;

  v5 = -[LSApplicationRecord initWithBundleIdentifier:fetchingPlaceholder:error:]([LSApplicationRecord alloc], "initWithBundleIdentifier:fetchingPlaceholder:error:", self->_identityBookmark, a3, a4);
  v6 = v5;
  if (a4 && !v5)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[LSApplicationIdentity findApplicationRecordFetchingPlaceholder:error:]", 471, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)initForRecord:(id)a3 personaWithAttributes:(id)a4
{
  LSApplicationRecord *v6;
  _LSPersonaWithAttributes *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  LSApplicationIdentity *v12;

  v6 = (LSApplicationRecord *)a3;
  v7 = (_LSPersonaWithAttributes *)a4;
  computeIdentityBookmark(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  computeIdentityString(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSDatabase store]((uint64_t)v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v11 = -[_LSPersonaWithAttributes personaType]((uint64_t)v7);
  else
    v11 = 4;
  v12 = -[LSApplicationIdentity initWithIdentityBookmark:identityString:personaUniqueString:personaType:](self, "initWithIdentityBookmark:identityString:personaUniqueString:personaType:", v8, v9, v10, v11);

  return v12;
}

- (LSApplicationIdentity)initWithIdentityBookmark:(id)a3 identityString:(id)a4 personaUniqueString:(id)a5 personaType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  LSApplicationIdentity *v13;
  uint64_t v14;
  NSString *identityBookmark;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LSApplicationIdentity;
  v13 = -[LSBundleIdentity initWithIdentityString:personaUniqueString:personaType:](&v17, sel_initWithIdentityString_personaUniqueString_personaType_, v11, v12, a6);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identityBookmark = v13->_identityBookmark;
    v13->_identityBookmark = (NSString *)v14;

  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityBookmark, 0);
}

+ (unsigned)classVersion
{
  return 2;
}

+ (Class)currentIdentityClass
{
  return (Class)objc_opt_class();
}

- (id)bundleIdentifier
{
  return self->_identityBookmark;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LSApplicationIdentity;
  -[LSBundleIdentity encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", objc_msgSend((id)objc_opt_class(), "classVersion"), CFSTR("version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identityBookmark, CFSTR("identityBookmark"));

}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (LSApplicationIdentity)initWithIdentityString:(id)a3 parsedIdentityStringDictionary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  char isKindOfClass;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  LSApplicationIdentity *v35;
  LSApplicationIdentity *v36;
  objc_super v38;

  v8 = a3;
  v9 = a4;
  v10 = objc_opt_class();
  objc_msgSend(v9, "objectForKey:", CFSTR("b"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (v13)
  {
    if (v11)
    {
LABEL_9:
      v15 = v12;
      goto LABEL_14;
    }
  }
  else
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      goto LABEL_9;

  }
  _LSDefaultLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[LSApplicationIdentity initWithIdentityString:parsedIdentityStringDictionary:error:].cold.1((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);

  v15 = 0;
LABEL_14:
  v23 = objc_opt_class();
  objc_msgSend(v9, "objectForKey:", CFSTR("p"));
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v23 && v24 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v25 = 0;
  }
  v26 = objc_opt_class();
  objc_msgSend(v9, "objectForKey:", CFSTR("pt"));
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v26 && v27 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v28 = 0;
  }
  v29 = objc_opt_class();
  objc_msgSend(v9, "objectForKey:", CFSTR("v"));
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (v29 && v30 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v31 = 0;
  }

  if (!v15 || (v25 != 0) == (v28 == 0))
  {

    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[LSApplicationIdentity initWithIdentityString:parsedIdentityStringDictionary:error:]", 319, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v28)
      v32 = objc_msgSend(v28, "unsignedIntegerValue");
    else
      v32 = 4;
    v38.receiver = self;
    v38.super_class = (Class)LSApplicationIdentity;
    v36 = -[LSBundleIdentity initWithIdentityString:personaUniqueString:personaType:](&v38, sel_initWithIdentityString_personaUniqueString_personaType_, v8, v25, v32);
    v35 = v36;
    if (v36)
    {
      objc_storeStrong((id *)&v36->_identityBookmark, v15);
      v34 = 0;
      goto LABEL_37;
    }
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 12, (uint64_t)"-[LSApplicationIdentity initWithIdentityString:parsedIdentityStringDictionary:error:]", 314, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = v33;
  if (a5)
  {
    v34 = objc_retainAutorelease(v33);
    v35 = 0;
    *a5 = v34;
  }
  else
  {
    v35 = 0;
  }
LABEL_37:

  return v35;
}

- (LSApplicationIdentity)initWithIdentityString:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  LSApplicationIdentity *v10;
  id v11;
  void *v12;
  id v14;
  id v15;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v6, "JSONObjectWithData:options:error:", v7, 0, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;

  if (!v8)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("LSApplicationIdentity.mm"), 339, CFSTR("Bad input initializing with identity string: %@"), v9);

    v10 = 0;
    goto LABEL_6;
  }
  v14 = v9;
  v10 = -[LSApplicationIdentity initWithIdentityString:parsedIdentityStringDictionary:error:](self, "initWithIdentityString:parsedIdentityStringDictionary:error:", v5, v8, &v14);
  v11 = v14;

  v9 = v11;
  if (!v10)
    goto LABEL_5;
LABEL_6:

  return v10;
}

- (LSApplicationIdentity)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 personaUniqueString:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  LSApplicationRecord *v12;
  LSApplicationRecord *v13;
  void *v14;
  _LSPersonaWithAttributes *v15;
  void *v16;
  LSApplicationIdentity *v17;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]([LSApplicationRecord alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v10, v8, a6);
  v13 = v12;
  if (a6 && !v12)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[LSApplicationIdentity initWithBundleIdentifier:allowPlaceholder:personaUniqueString:error:]", 348, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  computeIdentityBookmark(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (_LSPersonaWithAttributes *)-[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]([_LSPersonaWithAttributes alloc], 0, v11);
  computeIdentityString(v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[LSApplicationIdentity initWithIdentityBookmark:identityString:personaUniqueString:personaType:](self, "initWithIdentityBookmark:identityString:personaUniqueString:personaType:", v14, v16, v11, 0);

  return v17;
}

- (LSApplicationIdentity)initWithBundleIdentifier:(id)a3 URL:(id)a4 personaUniqueString:(id)a5 personaType:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _LSPersonaWithAttributes *v23;
  NSURL *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  LSApplicationIdentity *v35;
  void *v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSApplicationIdentity.mm"), 364, CFSTR("bundleIdentifier was nil when creating application identity"));

  }
  if (v13)
  {
    if (a6 == 4)
    {
      _LSDefaultLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[LSApplicationIdentity initWithBundleIdentifier:URL:personaUniqueString:personaType:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);

    }
    v22 = v11;
    v24 = (NSURL *)-[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]([_LSPersonaWithAttributes alloc], a6, v13);
  }
  else
  {
    if (a6 != 4)
    {
      _LSDefaultLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        -[LSApplicationIdentity initWithBundleIdentifier:URL:personaUniqueString:personaType:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

    }
    v33 = v11;
    v24 = 0;
  }
  computeIdentityString((NSString *)v11, v24, v23);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[LSApplicationIdentity initWithIdentityBookmark:identityString:personaUniqueString:personaType:](self, "initWithIdentityBookmark:identityString:personaUniqueString:personaType:", v11, v34, v13, a6);

  return v35;
}

- (LSApplicationIdentity)initWithCoder:(id)a3
{
  id v4;
  LSApplicationIdentity *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  id Property;
  NSString *v12;
  NSString *identityBookmark;
  void *v14;
  void *v15;
  objc_super v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)LSApplicationIdentity;
  v5 = -[LSBundleIdentity initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeObjectOfClasses:forKey:", v8, CFSTR("identityBookmark"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v9)
        Property = objc_getProperty(v9, v10, 16, 1);
      else
        Property = 0;
      v12 = (NSString *)Property;
    }
    else
    {
      v12 = v9;
    }
    identityBookmark = v5->_identityBookmark;
    v5->_identityBookmark = v12;

    if (!v5->_identityBookmark)
    {

      v18 = *MEMORY[0x1E0CB2938];
      v19[0] = CFSTR("could not decode identity (missing bundleID?)");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), 118, (uint64_t)"-[LSApplicationIdentity initWithCoder:]", 414, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v15);

      v5 = 0;
    }

  }
  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LSApplicationIdentity;
  return -[NSString hash](self->_identityBookmark, "hash") ^ __ROR8__(-[LSBundleIdentity hash](&v3, sel_hash), 56);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v8.receiver = self;
    v8.super_class = (Class)LSApplicationIdentity;
    if (-[LSBundleIdentity isEqual:](&v8, sel_isEqual_, v5))
      v6 = -[NSString isEqual:](self->_identityBookmark, "isEqual:", v5[4]);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)needsMigration
{
  return objc_msgSend((id)objc_opt_class(), "classVersion") != 2;
}

+ (id)enumeratorWithOptions:(unint64_t)a3
{
  return -[LSApplicationIdentityEnumerator initWithAppEnumerationOptions:]([LSApplicationIdentityEnumerator alloc], "initWithAppEnumerationOptions:", a3);
}

+ (id)bundleIdentifierForIdentityString:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v13;

  v5 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "JSONObjectWithData:options:error:", v6, 0, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (!v7)
    goto LABEL_6;
  v9 = objc_opt_class();
  objc_msgSend(v7, "objectForKey:", CFSTR("b"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    v11 = 0;
  }
  if (a4 && !v11)
    *a4 = objc_retainAutorelease(v8);

  return v11;
}

+ (id)identityStringsForApplicationWithBundleIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  LSApplicationRecord *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0;
  v6 = -[LSApplicationRecord initWithBundleIdentifier:fetchingPlaceholder:error:]([LSApplicationRecord alloc], "initWithBundleIdentifier:fetchingPlaceholder:error:", v5, 1, &v16);
  v15 = v16;
  if (!v6)
  {
    v8 = 0;
    if (!a4)
      goto LABEL_14;
    goto LABEL_12;
  }
  -[LSApplicationRecord identities](v6, "identities", v15);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "identityString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  if (a4)
  {
LABEL_12:
    if (!v8)
      *a4 = objc_retainAutorelease(v15);
  }
LABEL_14:

  return v8;
}

+ (BOOL)personaWithUniqueString:(id)a3 getPersonaType:(unint64_t *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  objc_msgSend((id)getUMUserPersonaAttributesClass(), "personaAttributesForPersonaUniqueString:withError:", v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    *a4 = LSPersonaTypeForPersonaAttributes(v8);

  return v9 != 0;
}

- (void)initWithIdentityString:(uint64_t)a3 parsedIdentityStringDictionary:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "No bundleID in identity string %@; need one for an identity on this platform",
    a5,
    a6,
    a7,
    a8,
    2u);
}

- (void)initWithBundleIdentifier:(uint64_t)a3 URL:(uint64_t)a4 personaUniqueString:(uint64_t)a5 personaType:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182882000, a1, a3, "No persona unique string provided but personaType was not LSPersonaTypeNone!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_33();
}

- (void)initWithBundleIdentifier:(uint64_t)a3 URL:(uint64_t)a4 personaUniqueString:(uint64_t)a5 personaType:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182882000, a1, a3, "Persona unique string was provided but personaType was LSPersonaTypeNone!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_33();
}

@end
