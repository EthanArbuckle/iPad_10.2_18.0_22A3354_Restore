@implementation MIBundleMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIBundleMetadata)initWithCoder:(id)a3
{
  id v4;
  MIBundleMetadata *v5;
  uint64_t v6;
  NSDate *installDate;
  uint64_t v8;
  NSString *installBuildVersion;
  void *v10;
  void *v11;
  uint64_t v12;
  NSError *placeholderFailureUnderlyingError;
  void *v14;
  uint64_t v15;
  NSString *watchKitAppExecutableHash;
  void *v17;
  uint64_t v18;
  NSString *alternateIconName;
  uint64_t v20;
  NSString *linkedParentBundleID;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSSet *linkedChildBundleIDs;

  v4 = a3;
  v5 = -[MIBundleMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    installDate = v5->_installDate;
    v5->_installDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installBuildVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    installBuildVersion = v5->_installBuildVersion;
    v5->_installBuildVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installType = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholderFailureReason"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_placeholderFailureReason = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholderFailureUnderlyingError"));
    v12 = objc_claimAutoreleasedReturnValue();
    placeholderFailureUnderlyingError = v5->_placeholderFailureUnderlyingError;
    v5->_placeholderFailureUnderlyingError = (NSError *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholderFailureUnderlyingErrorSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_placeholderFailureUnderlyingErrorSource = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchKitAppExecutableHash"));
    v15 = objc_claimAutoreleasedReturnValue();
    watchKitAppExecutableHash = v5->_watchKitAppExecutableHash;
    v5->_watchKitAppExecutableHash = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoInstallOverride"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_autoInstallOverride = objc_msgSend(v17, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alternateIconName"));
    v18 = objc_claimAutoreleasedReturnValue();
    alternateIconName = v5->_alternateIconName;
    v5->_alternateIconName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkedParentBundleID"));
    v20 = objc_claimAutoreleasedReturnValue();
    linkedParentBundleID = v5->_linkedParentBundleID;
    v5->_linkedParentBundleID = (NSString *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("linkedChildBundleIDs"));
    v25 = objc_claimAutoreleasedReturnValue();
    linkedChildBundleIDs = v5->_linkedChildBundleIDs;
    v5->_linkedChildBundleIDs = (NSSet *)v25;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MIBundleMetadata installDate](self, "installDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setInstallDate:", v6);

  -[MIBundleMetadata installBuildVersion](self, "installBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setInstallBuildVersion:", v8);

  objc_msgSend(v4, "setInstallType:", -[MIBundleMetadata installType](self, "installType"));
  objc_msgSend(v4, "setPlaceholderFailureReason:", -[MIBundleMetadata placeholderFailureReason](self, "placeholderFailureReason"));
  -[MIBundleMetadata placeholderFailureUnderlyingError](self, "placeholderFailureUnderlyingError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPlaceholderFailureUnderlyingError:", v10);

  objc_msgSend(v4, "setPlaceholderFailureUnderlyingErrorSource:", -[MIBundleMetadata placeholderFailureUnderlyingErrorSource](self, "placeholderFailureUnderlyingErrorSource"));
  -[MIBundleMetadata watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setWatchKitAppExecutableHash:", v12);

  objc_msgSend(v4, "setAutoInstallOverride:", -[MIBundleMetadata autoInstallOverride](self, "autoInstallOverride"));
  -[MIBundleMetadata alternateIconName](self, "alternateIconName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setAlternateIconName:", v14);

  -[MIBundleMetadata linkedParentBundleID](self, "linkedParentBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setLinkedParentBundleID:", v16);

  -[MIBundleMetadata linkedChildBundleIDs](self, "linkedChildBundleIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setLinkedChildBundleIDs:", v18);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[MIBundleMetadata installDate](self, "installDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("installDate"));

  -[MIBundleMetadata installBuildVersion](self, "installBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("installBuildVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MIBundleMetadata installType](self, "installType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("installType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MIBundleMetadata placeholderFailureReason](self, "placeholderFailureReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("placeholderFailureReason"));

  -[MIBundleMetadata placeholderFailureUnderlyingError](self, "placeholderFailureUnderlyingError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("placeholderFailureUnderlyingError"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MIBundleMetadata placeholderFailureUnderlyingErrorSource](self, "placeholderFailureUnderlyingErrorSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("placeholderFailureUnderlyingErrorSource"));

  -[MIBundleMetadata watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("watchKitAppExecutableHash"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MIBundleMetadata autoInstallOverride](self, "autoInstallOverride"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("autoInstallOverride"));

  -[MIBundleMetadata alternateIconName](self, "alternateIconName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("alternateIconName"));

  -[MIBundleMetadata linkedParentBundleID](self, "linkedParentBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("linkedParentBundleID"));

  -[MIBundleMetadata linkedChildBundleIDs](self, "linkedChildBundleIDs");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("linkedChildBundleIDs"));

}

- (BOOL)isEqual:(id)a3
{
  MIBundleMetadata *v4;
  MIBundleMetadata *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  unint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  unint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  BOOL v30;

  v4 = (MIBundleMetadata *)a3;
  if (v4 == self)
  {
    v30 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIBundleMetadata installDate](self, "installDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundleMetadata installDate](v5, "installDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MICompareObjects(v6, v7);

      if (!v8)
        goto LABEL_16;
      -[MIBundleMetadata installBuildVersion](self, "installBuildVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundleMetadata installBuildVersion](v5, "installBuildVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MICompareObjects(v9, v10);

      if (!v11)
        goto LABEL_16;
      v12 = -[MIBundleMetadata installType](self, "installType");
      if (v12 != -[MIBundleMetadata installType](v5, "installType"))
        goto LABEL_16;
      v13 = -[MIBundleMetadata placeholderFailureReason](self, "placeholderFailureReason");
      if (v13 != -[MIBundleMetadata placeholderFailureReason](v5, "placeholderFailureReason"))
        goto LABEL_16;
      -[MIBundleMetadata placeholderFailureUnderlyingError](self, "placeholderFailureUnderlyingError");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundleMetadata placeholderFailureUnderlyingError](v5, "placeholderFailureUnderlyingError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MICompareObjects(v14, v15);

      if (!v16)
        goto LABEL_16;
      v17 = -[MIBundleMetadata placeholderFailureUnderlyingErrorSource](self, "placeholderFailureUnderlyingErrorSource");
      if (v17 != -[MIBundleMetadata placeholderFailureUnderlyingErrorSource](v5, "placeholderFailureUnderlyingErrorSource"))goto LABEL_16;
      -[MIBundleMetadata watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundleMetadata watchKitAppExecutableHash](v5, "watchKitAppExecutableHash");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MICompareObjects(v18, v19);

      if (!v20)
        goto LABEL_16;
      v21 = -[MIBundleMetadata autoInstallOverride](self, "autoInstallOverride");
      if (v21 != -[MIBundleMetadata autoInstallOverride](v5, "autoInstallOverride"))
        goto LABEL_16;
      -[MIBundleMetadata alternateIconName](self, "alternateIconName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundleMetadata alternateIconName](v5, "alternateIconName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MICompareObjects(v22, v23);

      if (!v24)
        goto LABEL_16;
      -[MIBundleMetadata linkedParentBundleID](self, "linkedParentBundleID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundleMetadata linkedParentBundleID](v5, "linkedParentBundleID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MICompareObjects(v25, v26);

      if (v27)
      {
        -[MIBundleMetadata linkedChildBundleIDs](self, "linkedChildBundleIDs");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIBundleMetadata linkedChildBundleIDs](v5, "linkedChildBundleIDs");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = MICompareObjects(v28, v29);

      }
      else
      {
LABEL_16:
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
    }
  }

  return v30;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;

  v21 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundleMetadata installDate](self, "installDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundleMetadata installBuildVersion](self, "installBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MIBundleMetadata installType](self, "installType");
  v7 = -[MIBundleMetadata placeholderFailureReason](self, "placeholderFailureReason");
  -[MIBundleMetadata placeholderFailureUnderlyingError](self, "placeholderFailureUnderlyingError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MIBundleMetadata placeholderFailureUnderlyingErrorSource](self, "placeholderFailureUnderlyingErrorSource");
  -[MIBundleMetadata watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MIBundleMetadata autoInstallOverride](self, "autoInstallOverride");
  -[MIBundleMetadata alternateIconName](self, "alternateIconName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@<%p> installDate=%@, installBuildVersion=%@, installType=%lu, placeholderFailureReason=%lu, placeholderFailureUnderlyingError=%@, placeholderFailureUnderlyingErrorSource=%lu, watchKitAppExecutableHash=%@, autoInstallOverride=%lu, alternateIconName=%@"), v20, self, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[MIBundleMetadata linkedParentBundleID](self, "linkedParentBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundleMetadata linkedChildBundleIDs](self, "linkedChildBundleIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@, linkedParentBundleID=%@ linkedChildBundleIDs=%@"), v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stringByAppendingString:", CFSTR(">"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)metadataFromURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v25;
  id v26;

  v5 = a3;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 3, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v7, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v17 = objc_msgSend(v8, "code");

      if (v17 == 260)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend(v5, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MIBundleMetadata metadataFromURL:error:]", 156, CFSTR("MIInstallerErrorDomain"), 130, v8, 0, CFSTR("Failed to read bundle metadata from %@"), v21, (uint64_t)v20);
    v22 = objc_claimAutoreleasedReturnValue();

    v9 = 0;
    v11 = 0;
    v8 = (void *)v22;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  v25 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v6, &v25);
  v10 = v25;

  if (!v9)
  {
    objc_msgSend(v5, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MIBundleMetadata metadataFromURL:error:]", 163, CFSTR("MIInstallerErrorDomain"), 130, v10, 0, CFSTR("Failed to read bundle metadata from %@"), v19, (uint64_t)v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    v9 = 0;
    v11 = 0;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v9, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MIBundleMetadata metadataFromURL:error:]", 169, CFSTR("MIInstallerErrorDomain"), 130, v12, 0, CFSTR("Failed to decode bundle metadata from %@"), v14, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v15;
  }
  objc_msgSend(v9, "finishDecoding");
  v8 = v10;
  if (a4)
  {
LABEL_15:
    if (!v11)
      *a4 = objc_retainAutorelease(v8);
  }
LABEL_17:
  v23 = v11;

  return v23;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v7, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v7, "encodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v15 = 0;
    v9 = objc_msgSend(v8, "writeToURL:options:error:", v6, 268435457, &v15);
    v10 = v15;
    if ((v9 & 1) == 0)
    {
      objc_msgSend(v6, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIBundleMetadata serializeToURL:error:]", 207, CFSTR("MIInstallerErrorDomain"), 4, v10, 0, CFSTR("Failed to write serialized MIBundleMetadata to %@"), v12, (uint64_t)v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v13;
    }
    if (a4 && v10)
    {
      v10 = objc_retainAutorelease(v10);
      *a4 = v10;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10 == 0;
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (void)setInstallDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)installBuildVersion
{
  return self->_installBuildVersion;
}

- (void)setInstallBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)installType
{
  return self->_installType;
}

- (void)setInstallType:(unint64_t)a3
{
  self->_installType = a3;
}

- (unint64_t)placeholderFailureReason
{
  return self->_placeholderFailureReason;
}

- (void)setPlaceholderFailureReason:(unint64_t)a3
{
  self->_placeholderFailureReason = a3;
}

- (NSError)placeholderFailureUnderlyingError
{
  return self->_placeholderFailureUnderlyingError;
}

- (void)setPlaceholderFailureUnderlyingError:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderFailureUnderlyingError, a3);
}

- (unint64_t)placeholderFailureUnderlyingErrorSource
{
  return self->_placeholderFailureUnderlyingErrorSource;
}

- (void)setPlaceholderFailureUnderlyingErrorSource:(unint64_t)a3
{
  self->_placeholderFailureUnderlyingErrorSource = a3;
}

- (NSString)watchKitAppExecutableHash
{
  return self->_watchKitAppExecutableHash;
}

- (void)setWatchKitAppExecutableHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)autoInstallOverride
{
  return self->_autoInstallOverride;
}

- (void)setAutoInstallOverride:(unint64_t)a3
{
  self->_autoInstallOverride = a3;
}

- (NSString)alternateIconName
{
  return self->_alternateIconName;
}

- (void)setAlternateIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)linkedParentBundleID
{
  return self->_linkedParentBundleID;
}

- (void)setLinkedParentBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSSet)linkedChildBundleIDs
{
  return self->_linkedChildBundleIDs;
}

- (void)setLinkedChildBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedChildBundleIDs, 0);
  objc_storeStrong((id *)&self->_linkedParentBundleID, 0);
  objc_storeStrong((id *)&self->_alternateIconName, 0);
  objc_storeStrong((id *)&self->_watchKitAppExecutableHash, 0);
  objc_storeStrong((id *)&self->_placeholderFailureUnderlyingError, 0);
  objc_storeStrong((id *)&self->_installBuildVersion, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
}

@end
