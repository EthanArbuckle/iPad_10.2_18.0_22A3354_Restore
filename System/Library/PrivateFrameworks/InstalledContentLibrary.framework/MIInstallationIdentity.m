@implementation MIInstallationIdentity

+ (id)newIdentityForBundle:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  if (objc_msgSend(v3, "isStaticContent"))
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc((Class)objc_opt_class());
    _GenerateBuiltInAppInstallSessionID(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _GenerateBuiltInAppInstallID(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithSessionID:uniqueID:", v6, v7);

  }
  else
  {
    v9 = objc_alloc((Class)objc_opt_class());
    _UUIDData();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UUIDData();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "initWithSessionID:uniqueID:", v4, v6);
  }

  return v8;
}

+ (id)identityForUpdateOfBundle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v17;

  v6 = a3;
  v17 = 0;
  +[MIInstallationIdentity installationIdentityForBundle:settingIfNotSet:error:](MIInstallationIdentity, "installationIdentityForBundle:settingIfNotSet:error:", v6, 0, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(v8, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v15 = objc_msgSend(v9, "code");

      if (v15 == 93)
      {

        v13 = (void *)objc_msgSend(a1, "newIdentityForBundle:", v6);
        v9 = 0;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v13 = 0;
    goto LABEL_8;
  }
  v10 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v7, "installSessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _UUIDData();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithSessionID:uniqueID:", v11, v12);

LABEL_8:
  if (a4 && !v13)
    *a4 = objc_retainAutorelease(v9);

  return v13;
}

+ (id)installationIdentityForBundle:(id)a3 settingIfNotSet:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  int v9;
  uint64_t v10;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  id v19;
  int *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  id v34;
  id v35;
  id v37;
  id v38;
  id v39;

  v6 = a4;
  v8 = a3;
  v9 = objc_msgSend(v8, "bundleType");
  if ((v9 - 1) >= 6 && v9 != 9)
  {
    _CreateAndLogError((uint64_t)"+[MIInstallationIdentity installationIdentityForBundle:settingIfNotSet:error:]", 186, CFSTR("MIInstallerErrorDomain"), 3, 0, 0, CFSTR("Install session ID requested for bundle that was not an app or app extension: %@"), v10, (uint64_t)v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v8, "isStaticContent"))
  {
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc((Class)objc_opt_class());
    _GenerateBuiltInAppInstallSessionID(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _GenerateBuiltInAppInstallID(v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)objc_msgSend(v13, "initWithSessionID:uniqueID:", v14, v15);

    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v24 = 0;
LABEL_13:
    LODWORD(v17) = -1;
    if (!a5)
      goto LABEL_28;
    goto LABEL_26;
  }
  _IdentifierStorageLocationForBundle(v8);
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (const char *)objc_msgSend(v28, "fileSystemRepresentation");
  v17 = open(v16, 256);
  if ((v17 & 0x80000000) != 0)
  {
    v20 = __error();
    _CreateError((uint64_t)"+[MIInstallationIdentity installationIdentityForBundle:settingIfNotSet:error:]", 202, (void *)*MEMORY[0x1E0CB2FE0], *v20, 0, 0, CFSTR("Failed to open %s"), v21, (uint64_t)v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"+[MIInstallationIdentity installationIdentityForBundle:settingIfNotSet:error:]", 202, CFSTR("MIInstallerErrorDomain"), 4, v22, 0, CFSTR("Failed to get FD to bundle executable at %s"), v23, (uint64_t)v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_25;
  }
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(v27, "dataForExtendedAttributeNamed:length:fromFD:fdLocation:error:", CFSTR("com.apple.install_uuid"), 16, v17, v28, &v39);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v39;
  v24 = v18;
  if (v25)
  {
    v37 = v18;
    objc_msgSend(v27, "dataForExtendedAttributeNamed:length:fromFD:fdLocation:error:", CFSTR("com.apple.install_session_uuid"), 16, v17, v28, &v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v37;

    if (v26)
      v29 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSessionID:uniqueID:", v26, v25);
    else
      v29 = 0;
    v24 = v19;
    if (!a5)
      goto LABEL_28;
    goto LABEL_26;
  }
  if (!v6)
    goto LABEL_24;
  objc_msgSend(v18, "domain");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0CB2FE0]) & 1) == 0)
  {

    goto LABEL_24;
  }
  v31 = objc_msgSend(v24, "code");

  if (v31 != 93)
  {
LABEL_24:
    v25 = 0;
    v26 = 0;
LABEL_25:
    v29 = 0;
    if (!a5)
      goto LABEL_28;
    goto LABEL_26;
  }

  v32 = (void *)objc_msgSend(a1, "newIdentityForBundle:", v8);
  v38 = 0;
  v33 = objc_msgSend(v32, "_writeToBundle:error:", v8, &v38);
  v34 = v38;
  v24 = v34;
  if (v33)
  {

    v29 = v32;
    v24 = 0;
  }
  else
  {
    v29 = 0;
  }

  v25 = 0;
  v26 = 0;
  if (!a5)
    goto LABEL_28;
LABEL_26:
  if (!v29)
    *a5 = objc_retainAutorelease(v24);
LABEL_28:
  if ((v17 & 0x80000000) == 0)
    close(v17);
  v35 = v29;

  return v35;
}

- (MIInstallationIdentity)initWithSessionID:(id)a3 uniqueID:(id)a4
{
  id v6;
  id v7;
  MIInstallationIdentity *v8;
  MIInstallationIdentity *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstallationIdentity;
  v8 = -[MIInstallationIdentity init](&v11, sel_init);
  if (!v8)
    goto LABEL_5;
  if (objc_msgSend(v6, "length") != 16)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_12;
LABEL_11:
    MOLogWrite();
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "length") != 16)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_12;
    goto LABEL_11;
  }
  -[MIInstallationIdentity setInstallSessionID:](v8, "setInstallSessionID:", v6);
  -[MIInstallationIdentity setUniqueInstallID:](v8, "setUniqueInstallID:", v7);
LABEL_5:
  v9 = v8;
LABEL_13:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  MIInstallationIdentity *v4;
  MIInstallationIdentity *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;

  v4 = (MIInstallationIdentity *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIInstallationIdentity uniqueInstallID](v5, "uniqueInstallID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIInstallationIdentity uniqueInstallID](self, "uniqueInstallID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if ((v8 != 0) != (v9 != 0) || v8 && v9 && !objc_msgSend(v8, "isEqual:", v9))
        goto LABEL_14;

      -[MIInstallationIdentity installSessionID](v5, "installSessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIInstallationIdentity installSessionID](self, "installSessionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      v13 = v12;
      v10 = v13;
      if ((v8 != 0) != (v13 != 0) || v8 && v13 && !objc_msgSend(v8, "isEqual:", v13))
LABEL_14:
        v14 = 0;
      else
        v14 = 1;

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MIInstallationIdentity installSessionID](self, "installSessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MIInstallationIdentity uniqueInstallID](self, "uniqueInstallID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MIInstallationIdentity installSessionID](self, "installSessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIInstallationIdentity uniqueInstallID](self, "uniqueInstallID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSessionID:uniqueID:", v5, v6);

  return v7;
}

- (BOOL)_writeToBundle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  int v20;
  void *v21;
  int v22;
  BOOL v23;
  int *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIInstallationIdentity uniqueInstallID](self, "uniqueInstallID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIInstallationIdentity installSessionID](self, "installSessionID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v6, "thisBundleAndAllContainedBundlesWithError:", &v41);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v41;
  v10 = v9;
  if (!v8)
  {
    LODWORD(v19) = -1;
    if (a4)
LABEL_17:
      *a4 = objc_retainAutorelease(v10);
    goto LABEL_18;
  }
  v34 = v9;
  v29 = v8;
  v30 = v6;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (!v12)
  {
LABEL_15:

    v23 = 1;
    v8 = v29;
    v6 = v30;
    v10 = v34;
    goto LABEL_21;
  }
  v13 = v12;
  v14 = *(_QWORD *)v38;
  v31 = v11;
LABEL_4:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v38 != v14)
      objc_enumerationMutation(v11);
    v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v15);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v16, "mayHaveExecutableProgram"))
      goto LABEL_13;
    _IdentifierStorageLocationForBundle(v16);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (const char *)objc_msgSend(v17, "fileSystemRepresentation");
    v19 = open(v18, 256);
    if ((v19 & 0x80000000) != 0)
    {
      v21 = v7;
      v25 = __error();
      _CreateError((uint64_t)"-[MIInstallationIdentity _writeToBundle:error:]", 340, (void *)*MEMORY[0x1E0CB2FE0], *v25, 0, 0, CFSTR("Failed to open %s"), v26, (uint64_t)v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIInstallationIdentity _writeToBundle:error:]", 340, CFSTR("MIInstallerErrorDomain"), 4, v27, 0, CFSTR("Failed to get FD to bundle executable at %s"), v28, (uint64_t)v18);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }
    v36 = v34;
    v20 = objc_msgSend(v7, "setData:forExtendedAttributeNamed:onFD:fdLocation:error:", v33, CFSTR("com.apple.install_uuid"), v19, v17, &v36);
    v10 = v36;

    if (!v20)
    {
      v21 = v7;
      goto LABEL_25;
    }
    v35 = v10;
    v21 = v7;
    v22 = objc_msgSend(v7, "setData:forExtendedAttributeNamed:onFD:fdLocation:error:", v32, CFSTR("com.apple.install_session_uuid"), v19, v17, &v35);
    v34 = v35;

    if (!v22)
      break;
    close(v19);

    v7 = v21;
    v11 = v31;
LABEL_13:
    if (v13 == ++v15)
    {
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v13)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  v10 = v34;
LABEL_25:

  v8 = v29;
  v6 = v30;
  v7 = v21;
  if (a4)
    goto LABEL_17;
LABEL_18:
  if ((v19 & 0x80000000) == 0)
    close(v19);
  v23 = 0;
LABEL_21:

  return v23;
}

- (BOOL)writeToBundle:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  BOOL v10;
  id v12;

  v6 = a3;
  if ((objc_msgSend(v6, "isAppTypeBundle") & 1) != 0)
  {
    if (!objc_msgSend(v6, "isStaticContent"))
    {
      v12 = 0;
      v10 = -[MIInstallationIdentity _writeToBundle:error:](self, "_writeToBundle:error:", v6, &v12);
      v9 = v12;
      if (!a4)
        goto LABEL_10;
      goto LABEL_8;
    }
    _CreateAndLogError((uint64_t)"-[MIInstallationIdentity writeToBundle:error:]", 380, CFSTR("MIInstallerErrorDomain"), 3, 0, 0, CFSTR("Cannot set installation identity for bundle that uses a static identity: %@"), v8, (uint64_t)v6);
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[MIInstallationIdentity writeToBundle:error:]", 375, CFSTR("MIInstallerErrorDomain"), 3, 0, 0, CFSTR("Cannot set installation identity for non-app bundle %@"), v7, (uint64_t)v6);
  }
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (!a4)
    goto LABEL_10;
LABEL_8:
  if (!v10)
    *a4 = objc_retainAutorelease(v9);
LABEL_10:

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIInstallationIdentity uniqueInstallID](self, "uniqueInstallID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIInstallationIdentity installSessionID](self, "installSessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ 0x%p uniqueInstallID=%@ installSessionID=%@"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)installSessionIDEAName
{
  return CFSTR("com.apple.install_session_uuid");
}

+ (id)uniqueInstallIDEAName
{
  return CFSTR("com.apple.install_uuid");
}

- (NSData)installSessionID
{
  return self->_installSessionID;
}

- (void)setInstallSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)uniqueInstallID
{
  return self->_uniqueInstallID;
}

- (void)setUniqueInstallID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueInstallID, 0);
  objc_storeStrong((id *)&self->_installSessionID, 0);
}

@end
