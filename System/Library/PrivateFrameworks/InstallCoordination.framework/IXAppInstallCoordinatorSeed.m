@implementation IXAppInstallCoordinatorSeed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXAppInstallCoordinatorSeed)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  IXAppInstallCoordinatorSeed *v14;
  void *v16;
  IXApplicationIdentity *v17;
  void *v18;
  NSObject *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IXAppInstallCoordinatorSeed;
  v5 = -[IXAppInstallCoordinatorSeed init](&v20, sel_init);
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v5 + 3) = objc_msgSend(v8, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creatorEUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)v5 + 2) = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)v5 + 4) = objc_msgSend(v10, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identity"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v11;

  if (!*((_QWORD *)v5 + 5))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = -[IXApplicationIdentity initWithBundleIdentifier:]([IXApplicationIdentity alloc], "initWithBundleIdentifier:", v16);
      v18 = (void *)*((_QWORD *)v5 + 5);
      *((_QWORD *)v5 + 5) = v17;

      if (*((_QWORD *)v5 + 5))
      {

        goto LABEL_3;
      }
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[IXAppInstallCoordinatorSeed initWithCoder:].cold.2((uint64_t)v16, (uint64_t *)v5 + 2, v19);
    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[IXAppInstallCoordinatorSeed initWithCoder:].cold.1((uint64_t)v5, v19);
    }

    v14 = 0;
    goto LABEL_7;
  }
LABEL_3:
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("installationDomain")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installationDomain"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v5 + 6) = objc_msgSend(v13, "unsignedIntegerValue");

  }
  else
  {
    *((_QWORD *)v5 + 6) = 1;
  }
LABEL_6:
  v14 = (IXAppInstallCoordinatorSeed *)v5;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[IXAppInstallCoordinatorSeed uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uniqueIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IXAppInstallCoordinatorSeed creator](self, "creator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("creator"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[IXAppInstallCoordinatorSeed creatorEUID](self, "creatorEUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("creatorEUID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IXAppInstallCoordinatorSeed intent](self, "intent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("intent"));

  -[IXAppInstallCoordinatorSeed identity](self, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("identity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IXAppInstallCoordinatorSeed installationDomain](self, "installationDomain"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("installationDomain"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[IXAppInstallCoordinatorSeed uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniqueIdentifier:", v5);

  objc_msgSend(v4, "setCreator:", -[IXAppInstallCoordinatorSeed creator](self, "creator"));
  objc_msgSend(v4, "setCreatorEUID:", -[IXAppInstallCoordinatorSeed creatorEUID](self, "creatorEUID"));
  objc_msgSend(v4, "setIntent:", -[IXAppInstallCoordinatorSeed intent](self, "intent"));
  -[IXAppInstallCoordinatorSeed identity](self, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentity:", v6);

  objc_msgSend(v4, "setInstallationDomain:", -[IXAppInstallCoordinatorSeed installationDomain](self, "installationDomain"));
  return v4;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (unint64_t)creator
{
  return self->_creator;
}

- (void)setCreator:(unint64_t)a3
{
  self->_creator = a3;
}

- (unsigned)creatorEUID
{
  return self->_creatorEUID;
}

- (void)setCreatorEUID:(unsigned int)a3
{
  self->_creatorEUID = a3;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (IXApplicationIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (void)setInstallationDomain:(unint64_t)a3
{
  self->_installationDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[IXAppInstallCoordinatorSeed initWithCoder:]";
  v4 = 2112;
  v5 = a1;
  _os_log_fault_impl(&dword_1A4BF6000, a2, OS_LOG_TYPE_FAULT, "%s: Both identity and bundleID were nil for %@", (uint8_t *)&v2, 0x16u);
}

- (void)initWithCoder:(os_log_t)log .cold.2(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315650;
  v5 = "-[IXAppInstallCoordinatorSeed initWithCoder:]";
  v6 = 2112;
  v7 = a1;
  v8 = 2112;
  v9 = v3;
  _os_log_fault_impl(&dword_1A4BF6000, log, OS_LOG_TYPE_FAULT, "%s: Identity was nil when deserializing IXAppInstallCoordinatorSeed for bundle ID %@ with unique identifier %@", (uint8_t *)&v4, 0x20u);
}

@end
