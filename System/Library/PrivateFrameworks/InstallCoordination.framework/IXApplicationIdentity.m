@implementation IXApplicationIdentity

- (id)resolvePersonaUsingModuleSpecificLogicWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D3AD78], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIAppIdentity bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, &v23);
  v8 = v23;
  if (!v7)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:].cold.1();

    _CreateError((uint64_t)"-[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]", 48, CFSTR("IXErrorDomain"), 1uLL, v8, 0, CFSTR("Failed to retrieve application record for bundleID: %@"), v17, (uint64_t)v6);
    v18 = objc_claimAutoreleasedReturnValue();
    v9 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v7, "identities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") != 1)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]";
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v8;
      _os_log_error_impl(&dword_1A4BF6000, v19, OS_LOG_TYPE_ERROR, "%s: Discovered multiple personas for app %@, so persona resolution is ambiguous. Found identities: %@ : %@", buf, 0x2Au);
    }

    _CreateError((uint64_t)"-[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]", 58, CFSTR("IXErrorDomain"), 1uLL, v8, 0, CFSTR("Discovered multiple personas for app %@, so persona resolution is ambiguous. Found identities: %@"), v20, (uint64_t)v6);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v11 = 0;
    v15 = v8;
    v8 = v18;
    goto LABEL_14;
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personaUniqueString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "systemPersonaUniqueString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if (v13)
  {
    objc_msgSend(v5, "primaryPersonaUniqueString");
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[IXApplicationIdentity(IXUtilities) resolvePersonaUsingModuleSpecificLogicWithError:].cold.2();
LABEL_14:

  if (a3 && !v11)
    *a3 = objc_retainAutorelease(v8);
  v21 = v11;

  return v21;
}

+ (id)identitiesForBundleIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IXApplicationIdentity *v11;
  IXApplicationIdentity *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [IXApplicationIdentity alloc];
        v12 = -[IXApplicationIdentity initWithBundleIdentifier:](v11, "initWithBundleIdentifier:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (IXApplicationIdentity)initWithBundleIdentifier:(id)a3 personaUniqueString:(id)a4
{
  id v5;
  IXApplicationIdentity *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IXApplicationIdentity;
  v5 = a4;
  v6 = -[MIAppIdentity initWithBundleID:persona:](&v9, sel_initWithBundleID_persona_, a3, v5);
  v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("PersonalPersonaPlaceholderString"), v9.receiver, v9.super_class);

  -[IXApplicationIdentity setIsPersonalPersonaPlaceholder:](v6, "setIsPersonalPersonaPlaceholder:", v7);
  return v6;
}

- (IXApplicationIdentity)initWithBundleIdentifier:(id)a3
{
  return -[IXApplicationIdentity initWithBundleIdentifier:personaUniqueString:](self, "initWithBundleIdentifier:personaUniqueString:", a3, CFSTR("PersonalPersonaPlaceholderString"));
}

- (id)initUsingPersonaFromCurrentThreadAndBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  IXApplicationIdentity *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC5EF0], "currentPersona");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userPersonaUniqueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[IXApplicationIdentity initWithBundleIdentifier:personaUniqueString:](self, "initWithBundleIdentifier:personaUniqueString:", v4, v6);
    v7 = self;
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[IXApplicationIdentity initUsingPersonaFromCurrentThreadAndBundleIdentifier:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    v7 = 0;
  }

  return v7;
}

- (IXApplicationIdentity)initWithPlistKeySerialization:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  __CFString *v7;
  BOOL v8;
  id v9;
  IXApplicationIdentity *v10;
  void *v11;
  char v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  NSObject *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v5, "count") != 2)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          -[IXApplicationIdentity initWithPlistKeySerialization:].cold.1((uint64_t)v4, v5, v6);
        v10 = 0;
        v7 = CFSTR("PersonalPersonaPlaceholderString");
        goto LABEL_18;
      }
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("P"));

      if ((v12 & 1) == 0)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
    }
    v7 = CFSTR("PersonalPersonaPlaceholderString");
LABEL_5:
    self = -[IXApplicationIdentity initWithBundleIdentifier:personaUniqueString:](self, "initWithBundleIdentifier:personaUniqueString:", v6, v7);
    v15 = 0;
    v8 = -[IXApplicationIdentity resolvePersonaWithError:](self, "resolvePersonaWithError:", &v15);
    v9 = v15;
    if (v8)
    {
      -[IXApplicationIdentity setIsPersonalPersonaPlaceholder:](self, "setIsPersonalPersonaPlaceholder:", -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("PersonalPersonaPlaceholderString")));
      v10 = self;
    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v17 = "-[IXApplicationIdentity initWithPlistKeySerialization:]";
        v18 = 2112;
        v19 = v7;
        v20 = 2112;
        v21 = v6;
        v22 = 2112;
        v23 = v9;
        _os_log_fault_impl(&dword_1A4BF6000, v13, OS_LOG_TYPE_FAULT, "%s: Failed to resolve persona %@ for %@ : %@", buf, 0x2Au);
      }

      v10 = 0;
    }

LABEL_18:
    goto LABEL_19;
  }
  v10 = 0;
LABEL_19:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IXApplicationIdentity;
  v3 = -[MIAppIdentity copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v3, "personaUniqueString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsPersonalPersonaPlaceholder:", objc_msgSend(v4, "isEqualToString:", CFSTR("PersonalPersonaPlaceholderString")));

  return v3;
}

- (NSString)uniqueIdentifier
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[IXApplicationIdentity isPersonalPersonaPlaceholder](self, "isPersonalPersonaPlaceholder"))
  {
    v3 = CFSTR("P");
  }
  else
  {
    -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MIAppIdentity bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)canonicalSerializationForPlistKey
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[IXApplicationIdentity isPersonalPersonaPlaceholder](self, "isPersonalPersonaPlaceholder");
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MIAppIdentity bundleID](self, "bundleID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@%@"), v6, CFSTR("/"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)possibleSerializationsForPlistKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[IXApplicationIdentity canonicalSerializationForPlistKey](self, "canonicalSerializationForPlistKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  -[MIAppIdentity bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[IXApplicationIdentity isPersonalPersonaPlaceholder](self, "isPersonalPersonaPlaceholder"))
  {
    v3 = CFSTR("P");
  }
  else
  {
    -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MIAppIdentity bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@/%@]"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (IXApplicationIdentity)initWithCoder:(id)a3
{
  id v4;
  IXApplicationIdentity *v5;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  BOOL v9;
  uint64_t v10;
  IXApplicationIdentity *v11;
  IXApplicationIdentity *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IXApplicationIdentity;
  v5 = -[MIAppIdentity initWithCoder:](&v21, sel_initWithCoder_, v4);
  -[MIAppIdentity bundleID](v5, "bundleID");
  v6 = objc_claimAutoreleasedReturnValue();
  -[MIAppIdentity personaUniqueString](v5, "personaUniqueString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
LABEL_13:
    v5 = v5;
    v12 = v5;
    goto LABEL_14;
  }
  if (v6
    || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID")),
        (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (!v8)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaUniqueString"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
        v8 = (__CFString *)v10;
      else
        v8 = CFSTR("PersonalPersonaPlaceholderString");
    }
    v11 = -[MIAppIdentity initWithBundleID:persona:]([IXApplicationIdentity alloc], "initWithBundleID:persona:", v6, v8);

    v5 = v11;
    goto LABEL_13;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    -[IXApplicationIdentity initWithCoder:].cold.1(v6, v14, v15, v16, v17, v18, v19, v20);
  v12 = 0;
LABEL_14:

  return v12;
}

- (BOOL)resolvePersonaWithError:(id *)a3
{
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;
  id v14;

  v13.receiver = self;
  v13.super_class = (Class)IXApplicationIdentity;
  v14 = 0;
  v5 = -[MIAppIdentity resolvePersonaWithError:](&v13, sel_resolvePersonaWithError_, &v14);
  v6 = v14;
  if (!v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[IXApplicationIdentity resolvePersonaWithError:].cold.1(self, (uint64_t)v6, v7);

    -[MIAppIdentity bundleID](self, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[IXApplicationIdentity resolvePersonaWithError:]", 234, CFSTR("IXErrorDomain"), 0x38uLL, v6, 0, CFSTR("Client provided invalid persona for %@"), v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v6 = objc_retainAutorelease(v10);
      *a3 = v6;
    }
    else
    {
      v6 = v10;
    }
  }
  if (-[MIAppIdentity isResolved](self, "isResolved"))
  {
    -[IXApplicationIdentity setIsPersonalPersonaPlaceholder:](self, "setIsPersonalPersonaPlaceholder:", 0);
  }
  else
  {
    -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXApplicationIdentity setIsPersonalPersonaPlaceholder:](self, "setIsPersonalPersonaPlaceholder:", objc_msgSend(v11, "isEqualToString:", CFSTR("PersonalPersonaPlaceholderString")));

  }
  return v5;
}

- (MIAppIdentity)miAppIdentity
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D3AD48]);
  -[MIAppIdentity bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBundleID:persona:", v4, v5);

  objc_msgSend(v6, "setIsResolved:", -[MIAppIdentity isResolved](self, "isResolved"));
  return (MIAppIdentity *)v6;
}

- (BOOL)resolvePersonaRespectingSandboxingWithError:(id *)a3
{
  id v5;
  BOOL v6;
  id v7;
  int v8;
  id v9;
  id v11;

  if (!-[IXApplicationIdentity isPersonalPersonaPlaceholder](self, "isPersonalPersonaPlaceholder"))
  {
    v5 = 0;
    v6 = 1;
    goto LABEL_11;
  }
  if (_ProcessCanAccessUM_onceToken != -1)
    dispatch_once(&_ProcessCanAccessUM_onceToken, &__block_literal_global_10);
  if (_ProcessCanAccessUM_canQueryUM)
  {
    v5 = 0;
    goto LABEL_8;
  }
  v7 = objc_retainAutorelease((id)_ProcessCanAccessUM_error);
  v8 = _ProcessCanAccessUM_canQueryUM;
  v5 = v7;
  if (v8)
  {
LABEL_8:
    v11 = v5;
    v6 = -[IXApplicationIdentity resolvePersonaWithError:](self, "resolvePersonaWithError:", &v11);
    v9 = v11;

    v5 = v9;
    if (!a3)
      goto LABEL_11;
    goto LABEL_9;
  }
  v6 = 0;
  if (!a3)
    goto LABEL_11;
LABEL_9:
  if (!v6)
  {
    v5 = objc_retainAutorelease(v5);
    v6 = 0;
    *a3 = v5;
  }
LABEL_11:

  return v6;
}

- (BOOL)isPersonalPersonaPlaceholder
{
  return self->_isPersonalPersonaPlaceholder;
}

- (void)setIsPersonalPersonaPlaceholder:(BOOL)a3
{
  self->_isPersonalPersonaPlaceholder = a3;
}

- (void)initUsingPersonaFromCurrentThreadAndBundleIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_1A4BF6000, a1, a3, "%s: UserManagement returned nil for the current thread's persona", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)initWithPlistKeySerialization:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  int v6[3];
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "count");
  v6[0] = 136315650;
  OUTLINED_FUNCTION_3_4();
  v7 = a1;
  v8 = 2048;
  v9 = v5;
  _os_log_fault_impl(&dword_1A4BF6000, a3, OS_LOG_TYPE_FAULT, "%s: Failed to parse the plist key: %@ as there are unexpected components: %lu", (uint8_t *)v6, 0x20u);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_1A4BF6000, a1, a3, "%s: Failed to deserialize bundle ID for identity", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)resolvePersonaWithError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  int v9[3];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 136315650;
  OUTLINED_FUNCTION_3_4();
  v10 = v6;
  v11 = v7;
  v12 = a2;
  OUTLINED_FUNCTION_2(&dword_1A4BF6000, a3, v8, "%s: Client provided invalid persona for %@ : %@", (uint8_t *)v9);

}

@end
