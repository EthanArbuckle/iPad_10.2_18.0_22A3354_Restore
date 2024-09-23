@implementation MIDataContainer

+ (id)dataContainerForExecutableBundle:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 temporary:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  _BOOL4 v10;
  _BOOL8 v11;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v10 = a6;
  v11 = a5;
  v13 = a3;
  v14 = a4;
  v15 = objc_msgSend(v13, "dataContainerContentClass");
  if (v15)
  {
    v17 = v15;
    if (v10)
    {
      if (a7)
        *a7 = 1;
      v18 = (void *)objc_opt_class();
      objc_msgSend(v13, "identifier");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "tempContainerWithIdentifier:forPersona:ofContentClass:error:", v19, v14, v17, a8);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = (void *)objc_opt_class();
      objc_msgSend(v13, "identifier");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:", v19, v14, v17, v11, a7, a8);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v20;
  }
  else
  {
    _CreateAndLogError((uint64_t)"+[MIDataContainer dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:]", 39, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Can't get data container for bundle %@"), v16, (uint64_t)v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v21;
    if (a8)
    {
      v19 = objc_retainAutorelease(v21);
      v22 = 0;
      *a8 = v19;
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (int)contentProtectionClass
{
  int result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;

  result = self->_contentProtectionClass;
  if (!result)
  {
    v7 = 0;
    -[MIContainer infoValueForKey:error:](self, "infoValueForKey:error:", CFSTR("com.apple.MobileInstallation.ContentProtectionClass"), &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v5 = v4;
    v6 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;

    if (v6)
    {
      self->_contentProtectionClass = objc_msgSend(v6, "intValue");

      return self->_contentProtectionClass;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

- (void)setContentProtectionClass:(int)a3
{
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = -[MIContainer setInfoValue:forKey:error:](self, "setInfoValue:forKey:error:", v5, CFSTR("com.apple.MobileInstallation.ContentProtectionClass"), &v9);
  v7 = v9;

  if (v6)
  {
    self->_contentProtectionClass = a3;
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    -[MIContainer identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
}

- (id)_oldCompatiblityLinkDestination
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v18;
  id v19;

  v19 = 0;
  -[MIContainer infoValueForKey:error:](self, "infoValueForKey:error:", CFSTR("com.apple.MobileInstallation.WorkaroundBundleSymlinkName"), &v19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  if (!v3
    || ((objc_opt_class(), v5 = v3, (objc_opt_isKindOfClass() & 1) == 0)
      ? (v6 = 0)
      : (v6 = v5),
        v5,
        v6,
        !v6))
  {
    objc_msgSend(v4, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("MIContainerManagerErrorDomain")))
    {
      v15 = objc_msgSend(v4, "code");

      if (v15 == 24)
        goto LABEL_19;
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIContainer containerURL](self, "containerURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
      v10 = 0;
      v11 = v4;
LABEL_17:

      goto LABEL_18;
    }
LABEL_19:
    v10 = 0;
    goto LABEL_20;
  }
  -[MIContainer containerURL](self, "containerURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  objc_msgSend(v9, "destinationOfSymbolicLinkAtURL:error:", v8, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;

  if (!v10)
  {
    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {

      goto LABEL_22;
    }
    v13 = objc_msgSend(v11, "code");

    if (v13 != 2)
    {
LABEL_22:
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_18;
      objc_msgSend(v8, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
      goto LABEL_17;
    }
  }
LABEL_18:

  v4 = v11;
LABEL_20:

  return v10;
}

- (void)makeSymlinkToBundleInContainerIfNeeded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  BOOL v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v4 = a3;
  objc_msgSend(v4, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "compatibilityLinkDestination");
    v6 = objc_claimAutoreleasedReturnValue();
    -[MIDataContainer _oldCompatiblityLinkDestination](self, "_oldCompatiblityLinkDestination");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (!(v6 | v7))
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) < 7)
        goto LABEL_15;
LABEL_14:
      MOLogWrite();
LABEL_15:
      v9 = 0;
LABEL_46:

      goto LABEL_47;
    }
    if (v6 && v7)
    {
      if (objc_msgSend((id)v6, "isEqual:", v7))
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) < 7)
          goto LABEL_15;
        goto LABEL_14;
      }
    }
    else if (!v7)
    {
      v9 = 0;
      if (!v6)
        goto LABEL_46;
LABEL_33:
      -[MIContainer containerURL](self, "containerURL", v28, v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v6, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        objc_msgSend(v19, "path");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();

      }
      +[MIFileManager defaultManager](MIFileManager, "defaultManager", v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeItemAtURL:error:", v19, 0);

      +[MIFileManager defaultManager](MIFileManager, "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v9;
      v22 = objc_msgSend(v21, "createSymbolicLinkAtURL:withDestinationURL:error:", v19, v6, &v33);
      v23 = v33;

      if ((v22 & 1) != 0)
      {
        objc_msgSend((id)v6, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v23;
        v25 = -[MIContainer setInfoValue:forKey:error:](self, "setInfoValue:forKey:error:", v24, CFSTR("com.apple.MobileInstallation.WorkaroundBundleSymlinkName"), &v32);
        v26 = v32;

        if (!v25 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
          MOLogWrite();
        v23 = v26;
      }
      else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        objc_msgSend(v19, "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v6, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();

      }
      v9 = v23;
      goto LABEL_46;
    }
    -[MIContainer containerURL](self, "containerURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      objc_msgSend(v12, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    +[MIFileManager defaultManager](MIFileManager, "defaultManager", v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v14 = objc_msgSend(v13, "removeItemAtURL:error:", v12, &v35);
    v15 = v35;

    if ((v14 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      objc_msgSend(v12, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v15;
      MOLogWrite();

    }
    if (v6)
    {
      v9 = v15;
    }
    else
    {
      v34 = v15;
      v16 = -[MIContainer setInfoValue:forKey:error:](self, "setInfoValue:forKey:error:", 0, CFSTR("com.apple.MobileInstallation.WorkaroundBundleSymlinkName"), &v34);
      v9 = v34;

      if (!v16 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        v28 = self;
        v30 = v9;
        MOLogWrite();
      }
    }

    if (!v6)
      goto LABEL_46;
    goto LABEL_33;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
LABEL_47:

}

@end
