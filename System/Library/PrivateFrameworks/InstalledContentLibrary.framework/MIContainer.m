@implementation MIContainer

- (MIContainer)initWithContainerURL:(id)a3
{
  id v5;
  MIContainer *v6;
  MIContainer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MIContainer;
  v6 = -[MIContainer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_containerURL, a3);

  return v7;
}

- (BOOL)_deriveContainerStatusWithError:(id *)a3
{
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  id v13;

  if (-[MIContainer isTransient](self, "isTransient"))
  {
    v5 = 0;
    self->_status = 2;
LABEL_10:
    v11 = 1;
    goto LABEL_11;
  }
  v13 = 0;
  -[MIContainer infoValueForKey:error:](self, "infoValueForKey:error:", CFSTR("com.apple.MobileContainerManager.SafeHarborInfo"), &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v5 = v7;
  if (v6)
  {
    v8 = 3;
LABEL_9:
    self->_status = v8;

    goto LABEL_10;
  }
  if (!v7)
  {
LABEL_8:

    v5 = 0;
    v8 = 1;
    goto LABEL_9;
  }
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MIContainerManagerErrorDomain")) & 1) != 0)
  {
    v10 = objc_msgSend(v5, "code");

    if (v10 == 24)
      goto LABEL_8;
  }
  else
  {

  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  if (a3)
  {
    v5 = objc_retainAutorelease(v5);
    v11 = 0;
    *a3 = v5;
  }
  else
  {
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (BOOL)_doInitWithContainer:(id)a3 error:(id *)a4
{
  id v7;
  BOOL v8;
  id v9;
  void *v10;
  id v12;

  objc_storeStrong((id *)&self->_rawContainer, a3);
  v7 = a3;
  v12 = 0;
  v8 = -[MIContainer _deriveContainerStatusWithError:](self, "_deriveContainerStatusWithError:", &v12);
  v9 = v12;
  v10 = v9;
  if (a4 && !v8)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

- (MIContainer)initWithContainer:(id)a3 error:(id *)a4
{
  id v6;
  MIContainer *v7;
  MIContainer *v8;
  _BOOL4 v9;
  id v10;
  id v11;
  MIContainer *v12;
  id v14;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MIContainer;
  v7 = -[MIContainer init](&v15, sel_init);
  v8 = v7;
  if (!v7)
  {
    v11 = 0;
    goto LABEL_6;
  }
  v14 = 0;
  v9 = -[MIContainer _doInitWithContainer:error:](v7, "_doInitWithContainer:error:", v6, &v14);
  v10 = v14;
  v11 = v10;
  if (v9)
  {
LABEL_6:
    v12 = v8;
    goto LABEL_7;
  }
  if (a4)
  {
    v11 = objc_retainAutorelease(v10);
    v12 = 0;
    *a4 = v11;
  }
  else
  {
    v12 = 0;
  }
LABEL_7:

  return v12;
}

- (MIContainer)initWithToken:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  int v6;
  id v8;
  MIContainer *v9;
  void *v10;
  id v11;
  MIContainer *v12;
  MIMCMContainer *v14;
  void *v15;
  MIMCMContainer *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  id *v25;
  id v26;
  id v27;
  objc_super v28;

  v6 = a4;
  v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MIContainer;
  v9 = -[MIContainer init](&v28, sel_init);
  if (!v9)
  {
    v11 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v8, "containerURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v14 = [MIMCMContainer alloc];
    objc_msgSend(v8, "serializedContainerRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v16 = -[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:](v14, "initWithSerializedContainer:matchingWithOptions:error:", v15, ~(v6 << 16) & 0x30000, &v27);
    v17 = v27;

    if (v16)
    {
      v25 = a5;
      -[MIMCMContainer personaUniqueString](v16, "personaUniqueString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "personaUniqueString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIMCMContainer identifier](v16, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v22, "isEqualToString:", v21)
        || v20 && v19 && (objc_msgSend(v20, "isEqualToString:", v19) & 1) == 0)
      {
        _CreateAndLogError((uint64_t)"-[MIContainer initWithToken:options:error:]", 170, CFSTR("MIInstallerErrorDomain"), 186, v17, 0, CFSTR("Deserialized container object had identity %@/%@ but the token was for %@/%@"), v23, (uint64_t)v21);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v24 = 0;
      }
      else
      {
        v26 = v17;
        v24 = -[MIContainer _doInitWithContainer:error:](v9, "_doInitWithContainer:error:", v16, &v26);
        v11 = v26;
      }

      a5 = v25;
      if (v24)
        goto LABEL_4;
      if (v25)
      {
LABEL_17:
        v11 = objc_retainAutorelease(v11);
        v12 = 0;
        *a5 = v11;
        goto LABEL_7;
      }
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[MIContainer initWithToken:options:error:]", 160, CFSTR("MIInstallerErrorDomain"), 186, v17, 0, CFSTR("Failed to serialize container data %@"), v18, (uint64_t)v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (a5)
        goto LABEL_17;
    }
    v12 = 0;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v9->_containerURL, v10);
  v11 = 0;
LABEL_4:

LABEL_6:
  v12 = v9;
LABEL_7:

  return v12;
}

- (void)dealloc
{
  void *v3;
  char v4;
  unint64_t v5;
  BOOL v6;
  id v7;
  id v8;
  BOOL v9;
  MIContainer *v10;
  MIContainer *v11;
  void *v12;
  id v13;
  objc_super v14;
  id v15;
  id v16;
  char v17;

  +[MITestManager sharedInstance](MITestManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "testFlagsAreSet:", 64);

  v5 = -[MIContainer containerClass](self, "containerClass");
  v17 = 0;
  v16 = 0;
  v6 = -[MIContainer isStagedUpdateContainer:withError:](self, "isStagedUpdateContainer:withError:", &v17, &v16);
  v7 = v16;
  if (!v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v10 = self;
      v13 = v7;
      MOLogWrite();
    }
    v17 = 0;

    v7 = 0;
  }
  if (-[MIContainer isTransient](self, "isTransient", v10, v13) && !v17 && (v5 == 14 || v5 == 1) && (v4 & 1) == 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v11 = self;
      MOLogWrite();
    }
    v15 = v7;
    v9 = -[MIContainer removeUnderlyingContainerWaitingForDeletion:error:](self, "removeUnderlyingContainerWaitingForDeletion:error:", 0, &v15, v11);
    v8 = v15;

    if (!v9 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      -[MIContainer identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else
  {
    v8 = v7;
  }

  v14.receiver = self;
  v14.super_class = (Class)MIContainer;
  -[MIContainer dealloc](&v14, sel_dealloc);
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[MIContainer rawContainer](self, "rawContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)personaUniqueString
{
  void *v2;
  void *v3;

  -[MIContainer rawContainer](self, "rawContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaUniqueString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)containerClass
{
  void *v2;
  unint64_t v3;

  -[MIContainer rawContainer](self, "rawContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containerClass");

  return v3;
}

- (BOOL)isTransient
{
  void *v2;
  char v3;

  -[MIContainer rawContainer](self, "rawContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTransient");

  return v3;
}

- (BOOL)isNew
{
  void *v2;
  char v3;

  -[MIContainer rawContainer](self, "rawContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNew");

  return v3;
}

- (void)setContainerURL:(id)a3
{
  objc_storeStrong((id *)&self->_containerURL, a3);
}

- (NSURL)containerURL
{
  NSURL *containerURL;
  NSURL *v3;
  void *v4;

  containerURL = self->_containerURL;
  if (containerURL)
  {
    v3 = containerURL;
  }
  else
  {
    -[MIContainer rawContainer](self, "rawContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerURL");
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)_setContainer:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v7 = a3;
  -[MIContainer rawContainer](self, "rawContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if ((v9 & 1) == 0)
  {
    if (!v7)
    {
      -[MIContainer setContainerURL:](self, "setContainerURL:", 0);
      goto LABEL_8;
    }
    v11 = objc_msgSend(v7, "containerClass");
    if (v11 == -[MIContainer containerClass](self, "containerClass"))
    {
      objc_msgSend(v7, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIContainer identifier](self, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if ((v14 & 1) != 0)
      {

        objc_storeStrong((id *)&self->_rawContainer, a3);
LABEL_8:
        v16 = 0;
        v10 = 1;
LABEL_13:

        goto LABEL_14;
      }
      _CreateAndLogError((uint64_t)"-[MIContainer _setContainer:error:]", 279, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Attempted to set container with mismatched identifier %@ on %@"), v15, (uint64_t)v12);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (!a4)
      {
LABEL_12:
        v10 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      -[MIContainer containerClass](self, "containerClass");
      _CreateAndLogError((uint64_t)"-[MIContainer _setContainer:error:]", 273, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Attempted to set container %@ with content class %llu on %@ which represents a container with class %llu"), v17, (uint64_t)v7);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_12;
    }
    v16 = objc_retainAutorelease(v16);
    v10 = 0;
    *a4 = v16;
    goto LABEL_13;
  }
  v10 = 1;
LABEL_14:

  return v10;
}

- (BOOL)removeUnderlyingContainerWaitingForDeletion:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v15;
  _QWORD v16[2];

  v5 = a3;
  v16[1] = *MEMORY[0x1E0C80C00];
  -[MIContainer rawContainer](self, "rawContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = +[MIMCMContainer deleteContainers:waitForDeletion:error:](MIMCMContainer, "deleteContainers:waitForDeletion:error:", v8, v5, &v15);
  v10 = v15;

  if (!v9)
  {
    -[MIContainer rawContainer](self, "rawContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIContainer removeUnderlyingContainerWaitingForDeletion:error:]", 306, CFSTR("MIInstallerErrorDomain"), 4, v10, 0, CFSTR("Failed to delete container_object_t for %@"), v12, (uint64_t)v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v10 = objc_retainAutorelease(v13);
      *a4 = v10;
    }
    else
    {
      v10 = v13;
    }
  }

  return v9;
}

- (BOOL)_replaceExistingContainer:(id)a3 replacementReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v7 = a5;
  v28[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[MIContainer identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MIContainer containerClass](self, "containerClass");
  -[MIContainer rawContainer](self, "rawContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rawContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v15 = objc_msgSend(v13, "replaceExistingContainer:error:", v14, &v26);
  v16 = v26;

  if (v15)
  {
    if (v7)
    {
      -[MIContainer rawContainer](self, "rawContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v18 = objc_msgSend(v17, "reclaimDiskSpaceWithError:", &v25);
      v19 = v25;
      v20 = v18 ^ 1u;

      if ((v18 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
        MOLogWrite();

    }
    else
    {
      v20 = 0;
    }
    if (a4 == 1 && v12 == 1)
    {
      v27[0] = *MEMORY[0x1E0C9AE78];
      v27[1] = CFSTR("MobileInstallationDemotionCompleteErrorOccurred");
      v28[0] = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postNotificationName:object:userInfo:options:", CFSTR("MobileInstallationDemotionCompleteNotification"), 0, v22, 3);

      if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        MOLogWrite();

    }
  }
  else if (a6)
  {
    *a6 = objc_retainAutorelease(v16);
  }

  return v15;
}

+ (id)containersForIdentifier:(id)a3 groupContainerIdentifier:(id)a4 ofContentClass:(unint64_t)a5 forPersona:(id)a6 fetchTransient:(BOOL)a7 createIfNeeded:(BOOL)a8 error:(id *)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v40;
  id v41;
  id v42;
  unint64_t v43;
  uint64_t v44;
  BOOL v45;
  id obj;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v9 = a8;
  v10 = a7;
  v57 = *MEMORY[0x1E0C80C00];
  v14 = (uint64_t)a3;
  v15 = (unint64_t)a4;
  v16 = a6;
  v47 = (void *)objc_opt_new();
  v45 = (v14 | v15) != 0;
  if (v14 | v15)
  {
    if (v14)
    {
      v54 = 0;
      v18 = (id *)&v54;
      +[MIMCMContainer containersForBundleIdentifier:contentClass:forPersona:create:fetchTransient:error:](MIMCMContainer, "containersForBundleIdentifier:contentClass:forPersona:create:fetchTransient:error:", v14, a5, v16, v9, v10, &v54);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v15)
      {
        v22 = 0;
        goto LABEL_31;
      }
      v53 = 0;
      v18 = (id *)&v53;
      +[MIMCMContainer containersForGroupIdentifier:forPersona:create:fetchTransient:error:](MIMCMContainer, "containersForGroupIdentifier:forPersona:create:fetchTransient:error:", v15, v16, v9, v10, &v53);
      v19 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v55 = 0;
    v18 = (id *)&v55;
    +[MIMCMContainer containersForContentClass:forPersona:fetchTransient:error:](MIMCMContainer, "containersForContentClass:forPersona:fetchTransient:error:", a5, v16, v10, &v55);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v19;
  v21 = *v18;
  v22 = v21;
  if (!v20)
  {
LABEL_31:
    _CreateAndLogError((uint64_t)"+[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:]", 378, CFSTR("MIInstallerErrorDomain"), 4, v22, 0, CFSTR("Failed to retrieve any containers for identifier: %@ groupIdentifier: %@ container type: %llu persona: %@"), v17, v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    obj = 0;
    v35 = 0;
    goto LABEL_32;
  }
  v42 = v16;
  v43 = v15;
  v44 = v14;

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v20;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = 0;
    v27 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v50 != v27)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        v30 = objc_alloc((Class)objc_opt_class());
        v48 = 0;
        v31 = (void *)objc_msgSend(v30, "initWithContainer:error:", v29, &v48);
        v32 = v48;
        v33 = v32;
        if (v31)
        {
          objc_msgSend(v47, "addObject:", v31);
        }
        else
        {
          v34 = v32;

          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            v40 = v29;
            v41 = v34;
            MOLogWrite();
          }
          if (v45)
          {

            v35 = 0;
            v25 = v34;
            goto LABEL_29;
          }
          ++v26;
          v25 = v34;
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      if (v24)
        continue;
      break;
    }
  }
  else
  {
    v25 = 0;
    v26 = 0;
  }

  if (objc_msgSend(obj, "count") || !v25)
  {
    v35 = (void *)objc_msgSend(v47, "copy", v40, v41);
  }
  else
  {
    _CreateAndLogError((uint64_t)"+[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:]", 400, CFSTR("MIInstallerErrorDomain"), 4, v25, 0, CFSTR("Failed to construct MIContainer object for all %llu containers; last error is underlying error"),
      v36,
      v26);
    v37 = objc_claimAutoreleasedReturnValue();

    v35 = 0;
    v25 = (void *)v37;
  }
LABEL_29:
  v15 = v43;
  v14 = v44;
  v16 = v42;
LABEL_32:
  if (a9 && !v35)
    *a9 = objc_retainAutorelease(v25);
  v38 = v35;

  return v38;
}

+ (id)groupContainerURLsForBundleIdentifier:(id)a3 forPersona:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v32 = 0;
  +[MIMCMContainer containersForBundleIdentifier:contentClass:forPersona:create:fetchTransient:error:](MIMCMContainer, "containersForBundleIdentifier:contentClass:forPersona:create:fetchTransient:error:", v7, 7, a4, 1, 0, &v32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v32;
  v11 = v9;
  if (!v8)
  {
    _CreateAndLogError((uint64_t)"+[MIContainer groupContainerURLsForBundleIdentifier:forPersona:error:]", 423, CFSTR("MIInstallerErrorDomain"), 4, v9, 0, CFSTR("Failed to retrieve any shared data containers for %@"), v10, (uint64_t)v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    v12 = 0;
    if (!a5)
      goto LABEL_19;
    goto LABEL_17;
  }
  v25 = v9;
  v27 = v7;
  v12 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v26 = v8;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v18, "identifier", v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "containerURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v19);
        }
        else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v24 = v19;
          MOLogWrite();
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v15);
  }

  v21 = (void *)objc_msgSend(v12, "copy");
  v7 = v27;
  v22 = v25;
  v8 = v26;
  if (a5)
  {
LABEL_17:
    if (!v21)
      *a5 = objc_retainAutorelease(v22);
  }
LABEL_19:

  return v21;
}

+ (id)tempContainerWithIdentifier:(id)a3 forPersona:(id)a4 ofContentClass:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v28 = 0;
  +[MIMCMContainer transientContainerForIdentifier:contentClass:forPersona:create:error:](MIMCMContainer, "transientContainerForIdentifier:contentClass:forPersona:create:error:", v9, a5, v10, 1, &v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v28;
  if (!v11)
    goto LABEL_14;
  if ((objc_msgSend(v11, "isNew") & 1) != 0)
    goto LABEL_3;
  v24 = a6;
  v29[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v12;
  v17 = +[MIMCMContainer deleteContainers:waitForDeletion:error:](MIMCMContainer, "deleteContainers:waitForDeletion:error:", v16, 0, &v27);
  v14 = v27;

  if (v17)
  {
    v26 = v14;
    +[MIMCMContainer transientContainerForIdentifier:contentClass:forPersona:create:error:](MIMCMContainer, "transientContainerForIdentifier:contentClass:forPersona:create:error:", v9, a5, v10, 1, &v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v26;

    a6 = v24;
    if (v19)
    {
      if ((objc_msgSend(v19, "isNew") & 1) != 0)
      {
        v11 = v19;
LABEL_3:
        v25 = v12;
        v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContainer:error:", v11, &v25);
        v14 = v25;

        if (v13)
        {
          v12 = v14;
          goto LABEL_17;
        }
        _CreateAndLogError((uint64_t)"+[MIContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]", 479, CFSTR("MIInstallerErrorDomain"), 4, v14, 0, CFSTR("Failed to create MIContainer instance for %@"), v15, (uint64_t)v11);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      _CreateAndLogError((uint64_t)"+[MIContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]", 472, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Unexpectedly received existing container %@ when request was to create a new container for %@"), v21, (uint64_t)v19);
      v22 = objc_claimAutoreleasedReturnValue();
      v14 = v12;
      v11 = v19;
    }
    else
    {
      _CreateAndLogError((uint64_t)"+[MIContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]", 468, CFSTR("MIInstallerErrorDomain"), 4, v12, 0, CFSTR("Failed to create container for %@"), v20, (uint64_t)v9);
      v22 = objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v14 = v12;
    }
  }
  else
  {
    _CreateAndLogError((uint64_t)"+[MIContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]", 462, CFSTR("MIInstallerErrorDomain"), 4, v14, 0, CFSTR("Failed to delete existing transient container for %@"), v18, (uint64_t)v9);
    v22 = objc_claimAutoreleasedReturnValue();
    a6 = v24;
  }
LABEL_13:

  v12 = (id)v22;
LABEL_14:
  if (a6)
  {
    v12 = objc_retainAutorelease(v12);
    v13 = 0;
    *a6 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_17:

  return v13;
}

+ (id)containerWithIdentifier:(id)a3 forPersona:(id)a4 ofContentClass:(unint64_t)a5 createIfNeeded:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  id *v28;
  void *v30;
  id v32;
  id v33;
  id v34;
  _QWORD v35[2];

  v9 = a6;
  v35[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v34 = 0;
  +[MIMCMContainer containerForIdentifier:contentClass:forPersona:create:error:](MIMCMContainer, "containerForIdentifier:contentClass:forPersona:create:error:", v12, a5, v13, v9, &v34);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v34;
  v17 = v15;
  if (!v14)
  {
    if (!v9)
    {
      objc_msgSend(v15, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqualToString:", CFSTR("MIContainerManagerErrorDomain")) & 1) != 0)
      {
        v22 = objc_msgSend(v17, "code");

        if (v22 == 21)
        {
          LOBYTE(v18) = 0;
          v19 = 0;
          goto LABEL_17;
        }
      }
      else
      {

      }
    }
    _CreateAndLogError((uint64_t)"+[MIContainer containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:]", 504, CFSTR("MIInstallerErrorDomain"), 4, v17, 0, CFSTR("Failed to find container of class %llu with identity %@/%@"), v16, a5);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v18 = objc_msgSend(v14, "isNew");
  v33 = v17;
  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContainer:error:", v14, &v33);
  v20 = v33;

  if (v19)
  {
    v17 = v20;
    goto LABEL_17;
  }
  v23 = objc_opt_class();
  _CreateAndLogError((uint64_t)"+[MIContainer containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:]", 512, CFSTR("MIInstallerErrorDomain"), 4, v20, 0, CFSTR("Failed to create %@ instance for %@"), v24, v23);
  v25 = objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v30 = v14;
      MOLogWrite();
    }
    v35[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1, v30, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v27 = +[MIMCMContainer deleteContainers:waitForDeletion:error:](MIMCMContainer, "deleteContainers:waitForDeletion:error:", v26, 0, &v32);
    v17 = v32;

    if (!v27 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
      MOLogWrite();
LABEL_25:
    v28 = a8;

    v19 = 0;
    v17 = (id)v25;
    LOBYTE(v18) = v14 != 0;
    if (!a7)
      goto LABEL_19;
    goto LABEL_18;
  }
  v19 = 0;
  v17 = (id)v25;
LABEL_17:
  v28 = a8;
  if (a7)
LABEL_18:
    *a7 = v18;
LABEL_19:
  if (v28 && !v19)
    *v28 = objc_retainAutorelease(v17);

  return v19;
}

+ (BOOL)removeContainers:(id)a3 waitForDeletion:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "rawContainer", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  v16 = +[MIMCMContainer deleteContainers:waitForDeletion:error:](MIMCMContainer, "deleteContainers:waitForDeletion:error:", v15, v6, a5);

  return v16;
}

+ (id)containersWithClass:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C803F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "containersWithClass:personaUniqueString:error:", a3, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)containersWithClass:(unint64_t)a3 personaUniqueString:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;

  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:", 0, 0, a3, v7, 0, 0, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)recreateDefaultStructureWithError:(id *)a3
{
  void *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v12;

  -[MIContainer rawContainer](self, "rawContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = objc_msgSend(v5, "recreateDefaultStructureWithError:", &v12);
  v7 = v12;

  if ((v6 & 1) == 0)
  {
    -[MIContainer rawContainer](self, "rawContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIContainer recreateDefaultStructureWithError:]", 563, CFSTR("MIInstallerErrorDomain"), 4, v7, 0, CFSTR("Failed to recreate structure for %@"), v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v7 = objc_retainAutorelease(v10);
      *a3 = v7;
    }
    else
    {
      v7 = v10;
    }
  }

  return v6;
}

- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6
{
  _BOOL8 v7;
  uint64_t v10;
  id v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  BOOL v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  id v34;
  uint64_t v35;
  BOOL v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  MIContainer *v41;
  uint64_t v42;
  MIContainer *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;

  v7 = a5;
  v11 = a3;
  if (!v11 && a4 != 3)
  {
    _CreateAndLogError((uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 583, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Existing container was nil but replacement reason was not NewContainer; given %ld"),
      v10,
      a4);
LABEL_20:
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    goto LABEL_21;
  }
  v12 = -[MIContainer status](self, "status");
  if (v12 == 1)
  {
    -[MIContainer recreateDefaultStructureWithError:](self, "recreateDefaultStructureWithError:", 0);
    v18 = 0;
    v20 = 0;
LABEL_48:
    v28 = 1;
    goto LABEL_49;
  }
  if (v12 != 3)
  {
    if (v12 != 2)
    {
      v42 = -[MIContainer status](self, "status");
      _CreateAndLogError((uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 662, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Unknown container status: %lu"), v29, v42);
      goto LABEL_20;
    }
    -[MIContainer identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MIContainer containerClass](self, "containerClass");
    v51 = 0;
    v15 = -[MIContainer _replaceExistingContainer:replacementReason:waitForDeletion:error:](self, "_replaceExistingContainer:replacementReason:waitForDeletion:error:", v11, a4, v7, &v51);
    v16 = v51;
    v17 = v16;
    if (v15)
    {
      v18 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v16, "domain");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "isEqualToString:", CFSTR("MIContainerManagerErrorDomain")))
    {
      v31 = objc_msgSend(v17, "code");

      if (v31 == 27)
      {

        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v41 = self;
          MOLogWrite();
        }
        v50 = 0;
        v33 = -[MIContainer removeUnderlyingContainerWaitingForDeletion:error:](self, "removeUnderlyingContainerWaitingForDeletion:error:", 0, &v50, v41);
        v34 = v50;
        if (!v33)
        {
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            v43 = self;
            v44 = v34;
            MOLogWrite();
          }

          v34 = 0;
        }
        v49 = v34;
        +[MIMCMContainer containerForIdentifier:contentClass:forPersona:create:error:](MIMCMContainer, "containerForIdentifier:contentClass:forPersona:create:error:", v13, v14, 0, 0, &v49, v43, v44);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v49;

        if (v18)
        {
          v48 = v17;
          v36 = -[MIContainer _setContainer:error:](self, "_setContainer:error:", v18, &v48);
          v37 = v48;

          if (v36)
          {
            v17 = v37;
LABEL_9:
            v47 = v17;
            -[MIContainer infoValueForKey:error:](self, "infoValueForKey:error:", CFSTR("com.apple.MobileContainerManager.SafeHarborInfo"), &v47);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v47;

            if (v19)
            {
              if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
              {
                v23 = 3;
                goto LABEL_47;
              }
              -[MIContainer containerURL](self, "containerURL");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "path");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              MOLogWrite();
              v23 = 3;
            }
            else
            {
              if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
              {
                v23 = 1;
                goto LABEL_47;
              }
              -[MIContainer containerURL](self, "containerURL");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "path");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              MOLogWrite();
              v23 = 1;
            }

LABEL_47:
            self->_status = v23;

            goto LABEL_48;
          }
          _CreateAndLogError((uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 622, CFSTR("MIInstallerErrorDomain"), 22, v37, 0, CFSTR("Failed to set container after fetching existing container found when making container live for %@"), v38, (uint64_t)v13);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v17 = v37;
        }
        else
        {
          _CreateAndLogError((uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 617, CFSTR("MIInstallerErrorDomain"), 22, v17, 0, CFSTR("Failed to get existing container when replacement found the live container was already present for %@"), v35, (uint64_t)v13);
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_40;
      }
    }
    else
    {

    }
    _CreateAndLogError((uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 626, CFSTR("MIInstallerErrorDomain"), 22, v17, 0, CFSTR("Failed to make staged container live %@"), v32, (uint64_t)self);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
LABEL_40:

LABEL_21:
    if (a6)
    {
      v20 = objc_retainAutorelease(v20);
      v28 = 0;
      *a6 = v20;
    }
    else
    {
      v28 = 0;
    }
    goto LABEL_49;
  }
  v46 = 0;
  v24 = -[MIContainer setInfoValue:forKey:error:](self, "setInfoValue:forKey:error:", 0, CFSTR("com.apple.MobileContainerManager.SafeHarborInfo"), &v46);
  v20 = v46;
  if (!v24)
  {
    _CreateAndLogError((uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 644, CFSTR("MIInstallerErrorDomain"), 22, v20, 0, CFSTR("Failed to make safe harbor container live %@"), v25, (uint64_t)self);
    v39 = objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v20 = (id)v39;
    goto LABEL_21;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    -[MIContainer identifier](self, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIContainer containerURL](self, "containerURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "path");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  v18 = 0;
  v28 = 1;
  self->_status = 1;
LABEL_49:

  return v28;
}

- (BOOL)makeContainerLiveWithError:(id *)a3
{
  return -[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:](self, "makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:", 0, 3, 0, a3);
}

- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v16;

  v8 = a3;
  v9 = a4;
  -[MIContainer rawContainer](self, "rawContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v11 = objc_msgSend(v10, "setInfoValue:forKey:error:", v8, v9, &v16);
  v12 = v16;

  if ((v11 & 1) == 0)
  {
    _CreateAndLogError((uint64_t)"-[MIContainer setInfoValue:forKey:error:]", 686, CFSTR("MIInstallerErrorDomain"), 4, v12, 0, CFSTR("Failed to set value %@ for key %@ for container %@"), v13, (uint64_t)v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      v12 = objc_retainAutorelease(v14);
      *a5 = v12;
    }
    else
    {
      v12 = v14;
    }
  }

  return v11;
}

- (id)infoValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v11;

  v6 = a3;
  -[MIContainer rawContainer](self, "rawContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v7, "infoValueForKey:error:", v6, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (a4 && !v8)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  void *v4;
  char v5;
  id v6;
  id v8;

  -[MIContainer rawContainer](self, "rawContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = objc_msgSend(v4, "regenerateDirectoryUUIDWithError:", &v8);
  v6 = v8;

  if (a3 && (v5 & 1) == 0)
    *a3 = objc_retainAutorelease(v6);

  return v5;
}

- (BOOL)purgeContentWithError:(id *)a3
{
  unint64_t v5;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v13;

  v5 = -[MIContainer containerClass](self, "containerClass");
  if (v5 > 7 || ((1 << v5) & 0x94) == 0)
  {
    -[MIContainer identifier](self, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIContainer purgeContentWithError:]", 733, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Container for identifier %@ is not a data container; found class %ld."),
      v11,
      (uint64_t)v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    if (!a3)
      goto LABEL_10;
  }
  else
  {
    -[MIContainer rawContainer](self, "rawContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v8 = objc_msgSend(v7, "purgeContentWithError:", &v13);
    v9 = v13;

    if (!a3)
      goto LABEL_10;
  }
  if ((v8 & 1) == 0)
    *a3 = objc_retainAutorelease(v9);
LABEL_10:

  return v8;
}

- (unint64_t)diskUsage
{
  void *v2;
  unint64_t v3;

  -[MIContainer rawContainer](self, "rawContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "diskUsage");

  return v3;
}

+ (id)_bundleContainerForIdentifier:(id)a3 forPersona:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v13;
  id v14;

  v6 = a3;
  v14 = 0;
  +[MIBundleContainer privateAppBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "privateAppBundleContainerWithIdentifier:createIfNeeded:created:error:", v6, 0, 0, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  v9 = v8;
  if (v7)
    goto LABEL_10;
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("MIContainerManagerErrorDomain")) & 1) == 0)
  {

LABEL_7:
    v7 = 0;
    if (!a5)
      goto LABEL_10;
    goto LABEL_8;
  }
  v11 = objc_msgSend(v9, "code");

  if (v11 != 21)
    goto LABEL_7;

  v13 = 0;
  +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v6, 0, 0, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (!a5)
    goto LABEL_10;
LABEL_8:
  if (!v7)
  {
    v9 = objc_retainAutorelease(v9);
    *a5 = v9;
  }
LABEL_10:

  return v7;
}

+ (id)_allContainersForIdentifier:(id)a3 persona:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  char v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  id *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  id v49;
  void *v50;
  id *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v7 = a5;
  v68 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_opt_new();
  v56 = (void *)objc_opt_new();
  if ((v7 & 0xB) == 0)
  {
    v19 = v12;
    goto LABEL_69;
  }
  +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "primaryPersonaString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  objc_msgSend(a1, "_bundleContainerForIdentifier:forPersona:error:", v10, v14, &v65);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v65;

  if (!v15)
  {
    objc_msgSend(v16, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("MIContainerManagerErrorDomain")))
    {
      v21 = v16;
      v22 = objc_msgSend(v16, "code");

      if (v22 != 21)
      {
        v32 = 0;
        v17 = 0;
        goto LABEL_65;
      }
      if ((v7 & 4) == 0)
      {

        v55 = 0;
        v18 = 0x1E6CB5000uLL;
        goto LABEL_15;
      }
      _CreateAndLogError((uint64_t)"+[MIContainer _allContainersForIdentifier:persona:options:error:]", 820, CFSTR("MIInstallerErrorDomain"), 26, 0, 0, CFSTR("No bundle container found for identifier %@"), v23, (uint64_t)v10);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {

    }
    v17 = 0;
    v32 = 0;
    goto LABEL_65;
  }
  v55 = v16;
  objc_msgSend(v15, "bundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 1) != 0)
    objc_msgSend(v12, "addObject:", v15);
  v18 = 0x1E6CB5000;
  if (v17)
  {
    if ((v7 & 2) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_15:
  if ((v7 & 0xA) != 0)
  {
    objc_msgSend(*(id *)(v18 + 4088), "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "systemAppBundleIDToInfoMap");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "objectForKeyedSubscript:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      objc_msgSend(*(id *)(v18 + 4088), "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "internalAppBundleIDToInfoMap");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "objectForKeyedSubscript:", v10);
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        MIDiskImageManagerProxy();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "diskImageAppInfoForBundleID:", v10);
        v28 = objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            v49 = v10;
            MOLogWrite();
          }
          v31 = 0;
LABEL_35:

          v17 = (void *)v31;
          if ((v7 & 2) == 0)
          {
LABEL_7:
            if (!v17)
              goto LABEL_8;
            goto LABEL_39;
          }
LABEL_36:
          +[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:](MIDataContainer, "containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:", v10, 0, 2, v11, 0, 0, 0, v50);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
            objc_msgSend(v12, "addObjectsFromArray:", v33);

          if (!v17)
          {
LABEL_8:
            if ((v7 & 8) == 0)
              goto LABEL_64;
LABEL_54:
            v54 = v15;
            v41 = a6;
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v42 = v56;
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v58;
              do
              {
                for (i = 0; i != v44; ++i)
                {
                  if (*(_QWORD *)v58 != v45)
                    objc_enumerationMutation(v42);
                  +[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:](MIGroupContainer, "containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i), 0, 7, v11, 0, 0, 0);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v47)
                    objc_msgSend(v12, "addObjectsFromArray:", v47);

                }
                v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
              }
              while (v44);
            }

            a6 = v41;
            v15 = v54;
            goto LABEL_64;
          }
LABEL_39:
          if ((v7 & 0xA) == 0)
            goto LABEL_64;
          v53 = v15;
          v51 = a6;
          if ((v7 & 8) != 0)
            objc_msgSend(v56, "addObject:", v10);
          v52 = v17;
          objc_msgSend(v17, "appExtensionBundlesPerformingPlatformValidation:withError:", 0, 0, v49);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v62;
            do
            {
              for (j = 0; j != v36; ++j)
              {
                if (*(_QWORD *)v62 != v37)
                  objc_enumerationMutation(v34);
                objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "identifier");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                +[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:](MIPluginDataContainer, "containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:", v39, 0, 4, v11, 0, 0, 0);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                if (v40)
                  objc_msgSend(v12, "addObjectsFromArray:", v40);
                if ((v7 & 8) != 0)
                  objc_msgSend(v56, "addObject:", v39);

              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
            }
            while (v36);
          }

          a6 = v51;
          v17 = v52;
          v15 = v53;
          if ((v7 & 8) == 0)
            goto LABEL_64;
          goto LABEL_54;
        }
      }

      v26 = (void *)v28;
    }
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.bundleURL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      +[MIBundle bundleForURL:error:](MIExecutableBundle, "bundleForURL:error:", v30, 0);
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
LABEL_34:

        goto LABEL_35;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
LABEL_33:
        v31 = 0;
        goto LABEL_34;
      }
      v49 = v10;
      v50 = v30;
    }
    else
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_33;
      v49 = v10;
    }
    MOLogWrite();
    goto LABEL_33;
  }
  v17 = 0;
LABEL_64:
  v32 = (void *)objc_msgSend(v12, "copy", v49);
  v16 = v55;
LABEL_65:
  if (a6 && !v32)
    *a6 = objc_retainAutorelease(v16);
  v19 = v32;

LABEL_69:
  return v19;
}

+ (id)allContainersForAllPersonasForIdentifier:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "_allContainersForIdentifier:persona:options:error:", a3, 0, a4, a5);
}

- (BOOL)markContainerAsStagedUpdateContainer:(id *)a3
{
  uint64_t v5;
  BOOL v6;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  id v14;

  if (!-[MIContainer isTransient](self, "isTransient"))
  {
    _CreateAndLogError((uint64_t)"-[MIContainer markContainerAsStagedUpdateContainer:]", 928, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Non transient container can't be marked as a staged container"), v5, v13);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_7:
      v8 = 0;
      goto LABEL_8;
    }
LABEL_5:
    v7 = objc_retainAutorelease(v7);
    v8 = 0;
    *a3 = v7;
    goto LABEL_8;
  }
  v14 = 0;
  v6 = -[MIContainer setInfoValue:forKey:error:](self, "setInfoValue:forKey:error:", MEMORY[0x1E0C9AAB0], CFSTR("com.apple.MobileContainerManager.StagedUpdateContainer"), &v14);
  v7 = v14;
  if (!v6)
  {
    -[MIContainer identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIContainer markContainerAsStagedUpdateContainer:]", 933, CFSTR("MIInstallerErrorDomain"), 4, v7, 0, CFSTR("Failed to set staged update container attribute for identifier %@ "), v10, (uint64_t)v9);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v11;
    if (!a3)
      goto LABEL_7;
    goto LABEL_5;
  }
  v8 = 1;
LABEL_8:

  return v8;
}

- (BOOL)clearStagedUpdateContainerStatusWithError:(id *)a3
{
  uint64_t v5;
  BOOL v6;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  id v14;

  if (!-[MIContainer isTransient](self, "isTransient"))
  {
    _CreateAndLogError((uint64_t)"-[MIContainer clearStagedUpdateContainerStatusWithError:]", 952, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Clearing staged container requested for non transient container"), v5, v13);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_7:
      v8 = 0;
      goto LABEL_8;
    }
LABEL_5:
    v7 = objc_retainAutorelease(v7);
    v8 = 0;
    *a3 = v7;
    goto LABEL_8;
  }
  v14 = 0;
  v6 = -[MIContainer setInfoValue:forKey:error:](self, "setInfoValue:forKey:error:", 0, CFSTR("com.apple.MobileContainerManager.StagedUpdateContainer"), &v14);
  v7 = v14;
  if (!v6)
  {
    -[MIContainer identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIContainer clearStagedUpdateContainerStatusWithError:]", 957, CFSTR("MIInstallerErrorDomain"), 4, v7, 0, CFSTR("Failed to clear staged update container attribute for identifier %@ "), v10, (uint64_t)v9);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v11;
    if (!a3)
      goto LABEL_7;
    goto LABEL_5;
  }
  v8 = 1;
LABEL_8:

  return v8;
}

- (BOOL)isStagedUpdateContainer:(BOOL *)a3 withError:(id *)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  BOOL v15;
  id v17;

  v17 = 0;
  -[MIContainer infoValueForKey:error:](self, "infoValueForKey:error:", CFSTR("com.apple.MobileContainerManager.StagedUpdateContainer"), &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  v8 = v7;
  if (v6)
  {
    objc_opt_class();
    v9 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v10)
    {
      v13 = objc_msgSend(v10, "BOOLValue");
      if (!a3)
      {
LABEL_12:
        v15 = 1;
        goto LABEL_18;
      }
LABEL_11:
      *a3 = v13;
      goto LABEL_12;
    }
    _CreateAndLogError((uint64_t)"-[MIContainer isStagedUpdateContainer:withError:]", 988, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Value of key %@ on %@ was not a number"), v14, (uint64_t)CFSTR("com.apple.MobileContainerManager.StagedUpdateContainer"));
    v11 = v8;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v7, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("MIContainerManagerErrorDomain")))
  {
LABEL_14:

    goto LABEL_15;
  }
  v12 = objc_msgSend(v8, "code");

  if (v12 == 24)
  {

    v10 = 0;
    v13 = 0;
    v8 = 0;
    if (!a3)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_15:
  if (a4)
  {
    v8 = objc_retainAutorelease(v8);
    v10 = 0;
    v15 = 0;
    *a4 = v8;
  }
  else
  {
    v10 = 0;
    v15 = 0;
  }
LABEL_18:

  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[MIContainer status](self, "status");
  -[MIContainer rawContainer](self, "rawContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ status:%lu container:%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MIMCMContainer)rawContainer
{
  return self->_rawContainer;
}

- (void)setContainerClass:(unint64_t)a3
{
  self->_containerClass = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void)setDiskUsage:(unint64_t)a3
{
  self->_diskUsage = a3;
}

- (void)setIsTransient:(BOOL)a3
{
  self->_isTransient = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rawContainer, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
}

@end
