@implementation MIAppIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIAppIdentity)initWithBundleID:(id)a3 persona:(id)a4
{
  id v7;
  __CFString *v8;
  MIAppIdentity *v9;
  MIAppIdentity *v10;
  objc_super v12;

  v7 = a3;
  v8 = (__CFString *)a4;
  v12.receiver = self;
  v12.super_class = (Class)MIAppIdentity;
  v9 = -[MIAppIdentity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    if (!v8)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        -[MIAppIdentity initWithBundleID:persona:].cold.1((uint64_t)v7);
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
      v8 = CFSTR("PersonalPersonaPlaceholderString");
    }
    objc_storeStrong((id *)&v10->_personaUniqueString, v8);
    v10->_isResolved = 0;
  }

  return v10;
}

- (MIAppIdentity)initWithBundleID:(id)a3
{
  return -[MIAppIdentity initWithBundleID:persona:](self, "initWithBundleID:persona:", a3, CFSTR("PersonalPersonaPlaceholderString"));
}

- (MIAppIdentity)initWithCoder:(id)a3
{
  id v4;
  MIAppIdentity *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSString *personaUniqueString;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MIAppIdentity;
  v5 = -[MIAppIdentity init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaUniqueString"));
    v8 = objc_claimAutoreleasedReturnValue();
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v8;

    v5->_isResolved = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isResolved"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MIAppIdentity bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("bundleID"));

  -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("personaUniqueString"));

  objc_msgSend(v6, "encodeBool:forKey:", -[MIAppIdentity isResolved](self, "isResolved"), CFSTR("isResolved"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MIAppIdentity bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleID:", v5);

  -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonaUniqueString:", v6);

  objc_msgSend(v4, "setIsResolved:", -[MIAppIdentity isResolved](self, "isResolved"));
  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MIAppIdentity bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MIAppIdentity *v4;
  MIAppIdentity *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = (MIAppIdentity *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIAppIdentity bundleID](self, "bundleID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIAppIdentity bundleID](v5, "bundleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIAppIdentity personaUniqueString](v5, "personaUniqueString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = MICompareObjects(v9, v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MIAppIdentity bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@/%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)validateAppIdentity:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v15;

  v5 = a3;
  v7 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "personaUniqueString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = 0;
        v11 = 1;
        goto LABEL_11;
      }
      v12 = CFSTR("app identity has nil personaUniqueString");
      v13 = 147;
    }
    else
    {
      v12 = CFSTR("app identity has nil bundle identifier");
      v13 = 142;
    }
  }
  else
  {
    v12 = CFSTR("app identity is nil");
    v13 = 137;
  }
  _CreateError((uint64_t)"+[MIAppIdentity validateAppIdentity:withError:]", v13, CFSTR("MIInstallerErrorDomain"), 25, 0, 0, v12, v6, v15);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v10 = objc_retainAutorelease(v10);
    v11 = 0;
    *a4 = v10;
  }
  else
  {
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (id)_eligiblePersonaForBundle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v6 = a3;
  +[MIUserManagement sharedInstance](MIUserManagement, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemAppPlaceholderBundleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  if (v10)
  {
    objc_msgSend(v7, "primaryPersonaUniqueString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    goto LABEL_18;
  }
  v28 = 0;
  +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v6, 2, &v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v28;
  v12 = v14;
  if (!v13)
  {
    objc_msgSend(v14, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("MIContainerManagerErrorDomain")) & 1) != 0)
    {
      v20 = objc_msgSend(v12, "code");

      if (v20 == 21)
        goto LABEL_25;
    }
    else
    {

    }
    v11 = 0;
LABEL_18:
    v13 = 0;
    if (!a4)
      goto LABEL_28;
LABEL_26:
    if (!v11)
    {
      v16 = objc_retainAutorelease(v12);
      *a4 = v16;
      goto LABEL_29;
    }
LABEL_28:
    v16 = v12;
    goto LABEL_29;
  }
  objc_msgSend(v13, "bundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 4)
    {
      v23 = v13;
      MOLogWrite();
    }
LABEL_25:
    v26 = v12;
    objc_msgSend(v7, "personaForBundleID:error:", v6, &v26, v23, v24, v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v26;

    v12 = v21;
    if (!a4)
      goto LABEL_28;
    goto LABEL_26;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_25;
  v27 = v12;
  -[MIAppIdentity resolvePersonaUsingModuleSpecificLogicWithError:](self, "resolvePersonaUsingModuleSpecificLogicWithError:", &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v27;

  if (!v11)
  {
    objc_msgSend(v16, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("MIInstallerErrorDomain")))
    {
      v18 = objc_msgSend(v16, "code");

      if (v18 == 161)
      {
LABEL_24:

        v12 = 0;
        goto LABEL_25;
      }
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 4)
    {
      v24 = v13;
      v25 = v16;
      v23 = v6;
      MOLogWrite();
    }
    goto LABEL_24;
  }
LABEL_29:

  return v11;
}

- (BOOL)resolvePersonaWithError:(id *)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v5 = -[MIAppIdentity isResolved](self, "isResolved");
  -[MIAppIdentity personaUniqueString](self, "personaUniqueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIAppIdentity bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = 0;
    v9 = 0;
    v10 = 1;
    goto LABEL_30;
  }
  +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSharediPad");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C803F8]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_5;
  }
  if (v6)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Invalid")))
    {
      _CreateAndLogError((uint64_t)"-[MIAppIdentity resolvePersonaWithError:]", 238, CFSTR("MIInstallerErrorDomain"), 191, 0, 0, CFSTR("Client provided invalid persona for %@"), v13, (uint64_t)v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!a3)
        goto LABEL_29;
LABEL_26:
      v8 = objc_retainAutorelease(v8);
      v10 = 0;
      v9 = 0;
      *a3 = v8;
      goto LABEL_30;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("PersonalPersonaPlaceholderString")))
    {
      v32 = 0;
      -[MIAppIdentity _eligiblePersonaForBundle:error:](self, "_eligiblePersonaForBundle:error:", v7, &v32);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v32;
      if (!v9)
      {
        _CreateAndLogError((uint64_t)"-[MIAppIdentity resolvePersonaWithError:]", 243, CFSTR("MIInstallerErrorDomain"), 191, v8, 0, CFSTR("Failed to resolve persona %@"), v15, (uint64_t)self);
        goto LABEL_25;
      }
      goto LABEL_5;
    }
    +[MIUserManagement sharedInstance](MIUserManagement, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v17 = objc_msgSend(v16, "isKnownPersonaUniqueString:error:", v6, &v31);
    v19 = v31;
    if ((v17 & 1) != 0)
    {
      objc_msgSend(v16, "systemPersonaUniqueString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v6, "isEqualToString:", v20);

      if (!v21)
      {
        v8 = v19;
LABEL_32:
        v9 = v6;

        v6 = v9;
        goto LABEL_5;
      }
      v30 = v19;
      objc_msgSend(v16, "multiPersonaSADAppBundleIDsWithError:", &v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v30;

      if (v22)
      {
        if (objc_msgSend(v22, "containsObject:", v7))
        {
          objc_msgSend(v16, "primaryPersonaUniqueString");
          v23 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v23;
        }

        goto LABEL_32;
      }
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[MIAppIdentity resolvePersonaWithError:]", 250, CFSTR("MIInstallerErrorDomain"), 191, v19, 0, CFSTR("Client provided invalid persona for %@"), v18, (uint64_t)v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (a3)
      goto LABEL_26;
    goto LABEL_29;
  }
  v29 = 0;
  -[MIAppIdentity _eligiblePersonaForBundle:error:](self, "_eligiblePersonaForBundle:error:", v7, &v29);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v29;
  if (!v9)
  {
    _CreateAndLogError((uint64_t)"-[MIAppIdentity resolvePersonaWithError:]", 271, CFSTR("MIInstallerErrorDomain"), 191, v8, 0, CFSTR("Failed to resolve persona %@"), v14, (uint64_t)self);
LABEL_25:
    v24 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v24;
    if (a3)
      goto LABEL_26;
LABEL_29:
    v10 = 0;
    v9 = 0;
    goto LABEL_30;
  }
  v6 = 0;
LABEL_5:
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    v27 = v6;
    v28 = v9;
    v26 = v7;
    MOLogWrite();
  }
  -[MIAppIdentity setPersonaUniqueString:](self, "setPersonaUniqueString:", v9, v26, v27, v28);
  v10 = 1;
  -[MIAppIdentity setIsResolved:](self, "setIsResolved:", 1);
LABEL_30:

  return v10;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void)setPersonaUniqueString:(id)a3
{
  objc_storeStrong((id *)&self->_personaUniqueString, a3);
}

- (BOOL)isResolved
{
  return self->_isResolved;
}

- (void)setIsResolved:(BOOL)a3
{
  self->_isResolved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)initWithBundleID:(uint64_t)a1 persona:.cold.1(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[MIAppIdentity initWithBundleID:persona:]";
  v3 = 2112;
  v4 = a1;
  _os_log_fault_impl(&dword_1B76F3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s: Unexpectedly got nil persona for %@", (uint8_t *)&v1, 0x16u);
}

@end
