@implementation LSStashedAppMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSStashedAppMetadata)initWithCoder:(id)a3
{
  LSStashedAppMetadata *v4;
  uint64_t v5;
  NSString *exactBundleVersion;
  uint64_t v7;
  NSString *bundleShortVersion;
  uint64_t v9;
  NSDate *dateStashed;
  uint64_t v11;
  NSDate *dateOriginallyInstalled;
  uint64_t v13;
  NSString *signerOrganization;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)LSStashedAppMetadata;
  v4 = -[LSStashedAppMetadata init](&v16, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exactBundleVersion"));
    v5 = objc_claimAutoreleasedReturnValue();
    exactBundleVersion = v4->_exactBundleVersion;
    v4->_exactBundleVersion = (NSString *)v5;

    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleShortVersion"));
    v7 = objc_claimAutoreleasedReturnValue();
    bundleShortVersion = v4->_bundleShortVersion;
    v4->_bundleShortVersion = (NSString *)v7;

    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateStashed"));
    v9 = objc_claimAutoreleasedReturnValue();
    dateStashed = v4->_dateStashed;
    v4->_dateStashed = (NSDate *)v9;

    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateOriginallyInstalled"));
    v11 = objc_claimAutoreleasedReturnValue();
    dateOriginallyInstalled = v4->_dateOriginallyInstalled;
    v4->_dateOriginallyInstalled = (NSDate *)v11;

    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signerOrganization"));
    v13 = objc_claimAutoreleasedReturnValue();
    signerOrganization = v4->_signerOrganization;
    v4->_signerOrganization = (NSString *)v13;

    v4->_validationState = objc_msgSend(a3, "decodeIntForKey:", CFSTR("validationState"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_exactBundleVersion, CFSTR("exactBundleVersion"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_bundleShortVersion, CFSTR("bundleShortVersion"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_dateStashed, CFSTR("dateStashed"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_dateOriginallyInstalled, CFSTR("dateOriginallyInstalled"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_signerOrganization, CFSTR("signerOrganization"));
  objc_msgSend(a3, "encodeInt:forKey:", self->_validationState, CFSTR("validationState"));
}

- (LSStashedAppMetadata)initWithContext:(LSContext *)a3 unitID:(unsigned int)a4
{
  void *v5;
  LSStashedAppMetadata *v6;
  uint64_t v7;
  NSString *exactBundleVersion;
  uint64_t v9;
  NSString *bundleShortVersion;
  void *v11;
  int v12;
  uint64_t v13;
  NSDate *dateStashed;
  void *v15;
  int v16;
  uint64_t v17;
  NSDate *dateOriginallyInstalled;
  uint64_t v19;
  NSString *signerOrganization;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  +[_LSLazyPropertyList lazyPropertyListWithContext:unit:](_LSLazyPropertyList, "lazyPropertyListWithContext:unit:", a3, *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v25.receiver = self;
    v25.super_class = (Class)LSStashedAppMetadata;
    v6 = -[LSStashedAppMetadata init](&v25, sel_init);
    if (v6)
    {
      objc_msgSend(v5, "objectForKey:ofClass:", *MEMORY[0x1E0C9AE90], objc_opt_class());
      v7 = objc_claimAutoreleasedReturnValue();
      exactBundleVersion = v6->_exactBundleVersion;
      v6->_exactBundleVersion = (NSString *)v7;

      objc_msgSend(v5, "objectForKey:ofClass:", *MEMORY[0x1E0C9AAF0], objc_opt_class());
      v9 = objc_claimAutoreleasedReturnValue();
      bundleShortVersion = v6->_bundleShortVersion;
      v6->_bundleShortVersion = (NSString *)v9;

      objc_msgSend(v5, "objectForKey:ofClass:", CFSTR("StashedAtTimestamp"), objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "longValue");

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v12);
      v13 = objc_claimAutoreleasedReturnValue();
      dateStashed = v6->_dateStashed;
      v6->_dateStashed = (NSDate *)v13;

      objc_msgSend(v5, "objectForKey:ofClass:", CFSTR("StashOriginalInstallTimestamp"), objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "longValue");

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v16);
      v17 = objc_claimAutoreleasedReturnValue();
      dateOriginallyInstalled = v6->_dateOriginallyInstalled;
      v6->_dateOriginallyInstalled = (NSDate *)v17;

      objc_msgSend(v5, "objectForKey:ofClass:", CFSTR("SignerOrganization"), objc_opt_class());
      v19 = objc_claimAutoreleasedReturnValue();
      signerOrganization = v6->_signerOrganization;
      v6->_signerOrganization = (NSString *)v19;

      self = (LSStashedAppMetadata *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v5, "objectForKey:ofClass:", CFSTR("ProfileValidated"), objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        -[LSStashedAppMetadata setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v21, CFSTR("ProfileValidated"));

      objc_msgSend(v5, "objectForKey:ofClass:", CFSTR("UPPValidated"), objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        -[LSStashedAppMetadata setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v22, CFSTR("UPPValidated"));

      objc_msgSend(v5, "objectForKey:ofClass:", CFSTR("FreeProfileValidated"), objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        -[LSStashedAppMetadata setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v23, CFSTR("FreeProfileValidated"));

      v6->_validationState = _LSGetProfileValidationStateFromInstallDictionary((const __CFDictionary *)self);
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isProfileValidated
{
  return self->_validationState != 0;
}

- (BOOL)isUPPValidated
{
  return self->_validationState == 2;
}

- (BOOL)isFreeProfileValidated
{
  return self->_validationState == 3;
}

- (NSString)exactBundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)bundleShortVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)dateStashed
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)dateOriginallyInstalled
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)signerOrganization
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signerOrganization, 0);
  objc_storeStrong((id *)&self->_dateOriginallyInstalled, 0);
  objc_storeStrong((id *)&self->_dateStashed, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_exactBundleVersion, 0);
}

@end
