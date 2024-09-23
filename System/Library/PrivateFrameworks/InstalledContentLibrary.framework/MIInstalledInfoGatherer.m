@implementation MIInstalledInfoGatherer

- (void)_fixUpForBuiltInAppParallelPlaceholder
{
  void *v3;
  char v4;
  void *v5;
  unsigned int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  MIExecutableBundle *v21;
  MIExecutableBundle *builtInAppParallelPlaceholderBundle;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  MIBundleContainer *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSArray *v45;
  NSArray *dataContainers;
  MIExecutableBundle *v47;
  MIExecutableBundle *v48;
  MIBundleContainer *bundleContainer;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  MIBundleContainer *obj;
  void *v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  -[MIInstalledInfoGatherer bundle](self, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRemovableSystemApp");

  if ((v4 & 1) == 0)
  {
    -[MIInstalledInfoGatherer bundle](self, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "bundleType");

    if (v6 <= 5 && ((1 << v6) & 0x26) != 0)
    {
      -[MIInstalledInfoGatherer bundle](self, "bundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isPlaceholder");

      if (!v8)
      {
        -[MIInstalledInfoGatherer bundle](self, "bundle");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
LABEL_62:

          return;
        }
        -[MIInstalledInfoGatherer bundleContainer](self, "bundleContainer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          -[MIInstalledInfoGatherer bundle](self, "bundle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = 0;
          +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v17, 0, 0, &v60);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v60;

          if (v18)
          {
            objc_msgSend(v18, "bundle");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isPlaceholder");

            if (v20)
            {
              objc_msgSend(v18, "bundle");
              v21 = (MIExecutableBundle *)objc_claimAutoreleasedReturnValue();
              builtInAppParallelPlaceholderBundle = self->_builtInAppParallelPlaceholderBundle;
              self->_builtInAppParallelPlaceholderBundle = v21;

            }
            goto LABEL_62;
          }
          objc_msgSend(v14, "domain");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v52, "isEqualToString:", CFSTR("MIContainerManagerErrorDomain")))
          {
            v53 = objc_msgSend(v14, "code");

            if (v53 == 21)
              goto LABEL_62;
          }
          else
          {

          }
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            -[MIInstalledInfoGatherer bundle](self, "bundle");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "identifier");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            MOLogWrite();

          }
          goto LABEL_62;
        }
LABEL_51:
        v14 = 0;
        goto LABEL_62;
      }
      switch(v6)
      {
        case 5u:
          +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "coreServicesAppBundleIDToInfoMap");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIInstalledInfoGatherer bundle](self, "bundle");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v26);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            goto LABEL_23;
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            goto LABEL_51;
          break;
        case 2u:
          +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "internalAppBundleIDToInfoMap");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIInstalledInfoGatherer bundle](self, "bundle");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v30);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            goto LABEL_23;
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            goto LABEL_51;
          break;
        case 1u:
          +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "systemAppBundleIDToInfoMap");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIInstalledInfoGatherer bundle](self, "bundle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              goto LABEL_51;
            break;
          }
LABEL_23:
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.bundleURL"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            v66 = 0;
            +[MIBundle bundleForURL:error:](MIExecutableBundle, "bundleForURL:error:", v31, &v66);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v66;
            if (v32)
            {
              v33 = (void *)objc_opt_new();
              v62 = 0u;
              v63 = 0u;
              v64 = 0u;
              v65 = 0u;
              -[MIInstalledInfoGatherer personaUniqueStrings](self, "personaUniqueStrings");
              v34 = (MIBundleContainer *)objc_claimAutoreleasedReturnValue();
              v35 = -[MIBundleContainer countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
              if (v35)
              {
                v36 = v35;
                v59 = v33;
                v57 = v31;
                v37 = 0;
                v38 = *(_QWORD *)v63;
                obj = v34;
                while (2)
                {
                  v39 = 0;
                  v40 = v37;
                  v41 = v14;
                  do
                  {
                    if (*(_QWORD *)v63 != v38)
                      objc_enumerationMutation(obj);
                    v42 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v39);
                    v61 = v41;
                    objc_msgSend(v32, "dataContainerForPersona:error:", v42, &v61);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v14 = v61;

                    if (v37)
                    {
                      objc_msgSend(v59, "addObject:", v37);
                    }
                    else
                    {
                      objc_msgSend(v14, "domain");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!objc_msgSend(v43, "isEqualToString:", CFSTR("MIContainerManagerErrorDomain")))
                      {

LABEL_56:
                        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                          MOLogWrite();
                        v31 = v57;
                        bundleContainer = obj;
                        v33 = v59;
                        goto LABEL_60;
                      }
                      v44 = objc_msgSend(v14, "code");

                      if (v44 != 21)
                        goto LABEL_56;
                    }
                    ++v39;
                    v40 = v37;
                    v41 = v14;
                  }
                  while (v36 != v39);
                  v34 = obj;
                  v36 = -[MIBundleContainer countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
                  if (v36)
                    continue;
                  break;
                }

                v31 = v57;
                v33 = v59;
              }

              v45 = (NSArray *)objc_msgSend(v33, "copy");
              dataContainers = self->_dataContainers;
              self->_dataContainers = v45;

              -[MIInstalledInfoGatherer bundle](self, "bundle");
              v47 = (MIExecutableBundle *)objc_claimAutoreleasedReturnValue();
              v48 = self->_builtInAppParallelPlaceholderBundle;
              self->_builtInAppParallelPlaceholderBundle = v47;

              objc_storeStrong((id *)&self->_bundle, v32);
              bundleContainer = self->_bundleContainer;
              self->_bundleContainer = 0;
LABEL_60:

            }
            else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              objc_msgSend(v31, "path");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              MOLogWrite();

            }
            goto LABEL_62;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            goto LABEL_51;
LABEL_43:
          -[MIInstalledInfoGatherer bundle](self, "bundle");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();
LABEL_50:

          goto LABEL_51;
        default:
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            goto LABEL_51;
          goto LABEL_43;
      }
      -[MIInstalledInfoGatherer bundle](self, "bundle");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "identifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

      goto LABEL_50;
    }
  }
}

- (void)_initWithBundle:(id)a3 dataContainers:(id)a4
{
  id v7;
  id v8;
  NSArray *v9;
  NSArray *dataContainers;

  objc_storeStrong((id *)&self->_bundle, a3);
  v7 = a3;
  v8 = a4;
  v9 = (NSArray *)objc_msgSend(v8, "copy");

  dataContainers = self->_dataContainers;
  self->_dataContainers = v9;

  -[MIInstalledInfoGatherer _fixUpForBuiltInAppParallelPlaceholder](self, "_fixUpForBuiltInAppParallelPlaceholder");
}

- (MIInstalledInfoGatherer)initWithBundle:(id)a3 dataContainers:(id)a4
{
  id v6;
  id v7;
  MIInstalledInfoGatherer *v8;
  MIInstalledInfoGatherer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstalledInfoGatherer;
  v8 = -[MIInstalledInfoGatherer init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[MIInstalledInfoGatherer _initWithBundle:dataContainers:](v8, "_initWithBundle:dataContainers:", v6, v7);

  return v9;
}

- (MIInstalledInfoGatherer)initWithBundle:(id)a3 dataContainer:(id)a4
{
  id v6;
  id v7;
  MIInstalledInfoGatherer *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstalledInfoGatherer;
  v8 = -[MIInstalledInfoGatherer init](&v11, sel_init);
  if (v8)
  {
    if (v7)
    {
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    -[MIInstalledInfoGatherer _initWithBundle:dataContainers:](v8, "_initWithBundle:dataContainers:", v6, v9);

  }
  return v8;
}

- (void)_initWithBundleContainer:(id)a3 forPersonas:(id)a4
{
  MIBundleContainer *v6;
  id v7;
  MIExecutableBundle *v8;
  MIExecutableBundle *bundle;
  MIBundleContainer *bundleContainer;
  MIBundleContainer *v11;
  NSArray *v12;
  NSArray *personaUniqueStrings;

  v6 = (MIBundleContainer *)a3;
  v7 = a4;
  -[MIBundleContainer bundle](v6, "bundle");
  v8 = (MIExecutableBundle *)objc_claimAutoreleasedReturnValue();
  bundle = self->_bundle;
  self->_bundle = v8;

  bundleContainer = self->_bundleContainer;
  self->_bundleContainer = v6;
  v11 = v6;

  v12 = (NSArray *)objc_msgSend(v7, "copy");
  personaUniqueStrings = self->_personaUniqueStrings;
  self->_personaUniqueStrings = v12;

  -[MIInstalledInfoGatherer _fixUpForBuiltInAppParallelPlaceholder](self, "_fixUpForBuiltInAppParallelPlaceholder");
}

- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 forPersonas:(id)a4
{
  id v6;
  id v7;
  MIInstalledInfoGatherer *v8;
  MIInstalledInfoGatherer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstalledInfoGatherer;
  v8 = -[MIInstalledInfoGatherer init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[MIInstalledInfoGatherer _initWithBundleContainer:forPersonas:](v8, "_initWithBundleContainer:forPersonas:", v6, v7);

  return v9;
}

- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 forPersona:(id)a4
{
  id v6;
  id v7;
  MIInstalledInfoGatherer *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstalledInfoGatherer;
  v8 = -[MIInstalledInfoGatherer init](&v11, sel_init);
  if (v8)
  {
    if (v7)
    {
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    -[MIInstalledInfoGatherer _initWithBundleContainer:forPersonas:](v8, "_initWithBundleContainer:forPersonas:", v6, v9);

  }
  return v8;
}

- (void)_initWithBundleContainer:(id)a3 dataContainers:(id)a4
{
  id v7;
  id v8;
  void *v9;
  MIExecutableBundle *v10;
  MIExecutableBundle *bundle;
  NSArray *v12;
  NSArray *dataContainers;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *personaUniqueStrings;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v7, "bundle");
  v10 = (MIExecutableBundle *)objc_claimAutoreleasedReturnValue();
  bundle = self->_bundle;
  self->_bundle = v10;

  objc_storeStrong((id *)&self->_bundleContainer, a3);
  v12 = (NSArray *)objc_msgSend(v8, "copy");
  dataContainers = self->_dataContainers;
  self->_dataContainers = v12;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v19, "personaUniqueString", (_QWORD)v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v19, "personaUniqueString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v21);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  v22 = (NSArray *)objc_msgSend(v9, "copy");
  personaUniqueStrings = self->_personaUniqueStrings;
  self->_personaUniqueStrings = v22;

  -[MIInstalledInfoGatherer _fixUpForBuiltInAppParallelPlaceholder](self, "_fixUpForBuiltInAppParallelPlaceholder");
}

- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 dataContainer:(id)a4
{
  id v6;
  id v7;
  MIInstalledInfoGatherer *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstalledInfoGatherer;
  v8 = -[MIInstalledInfoGatherer init](&v11, sel_init);
  if (v8)
  {
    if (v7)
    {
      v12[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    -[MIInstalledInfoGatherer _initWithBundleContainer:dataContainers:](v8, "_initWithBundleContainer:dataContainers:", v6, v9);

  }
  return v8;
}

- (MIInstalledInfoGatherer)initWithBundleContainer:(id)a3 dataContainers:(id)a4
{
  id v6;
  id v7;
  MIInstalledInfoGatherer *v8;
  MIInstalledInfoGatherer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIInstalledInfoGatherer;
  v8 = -[MIInstalledInfoGatherer init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[MIInstalledInfoGatherer _initWithBundleContainer:dataContainers:](v8, "_initWithBundleContainer:dataContainers:", v6, v7);

  return v9;
}

- (void)_initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainers:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSArray *v13;
  NSArray *dataContainers;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *personaUniqueStrings;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_opt_new();
  objc_storeStrong((id *)&self->_bundle, a3);
  v13 = (NSArray *)objc_msgSend(v11, "copy");
  dataContainers = self->_dataContainers;
  self->_dataContainers = v13;

  objc_storeStrong((id *)&self->_owningBundleIdentifier, a4);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v20, "personaUniqueString", (_QWORD)v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v20, "personaUniqueString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v22);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v17);
  }

  v23 = (NSArray *)objc_msgSend(v12, "copy");
  personaUniqueStrings = self->_personaUniqueStrings;
  self->_personaUniqueStrings = v23;

}

- (MIInstalledInfoGatherer)initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainers:(id)a5
{
  id v8;
  id v9;
  id v10;
  MIInstalledInfoGatherer *v11;
  MIInstalledInfoGatherer *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MIInstalledInfoGatherer;
  v11 = -[MIInstalledInfoGatherer init](&v14, sel_init);
  v12 = v11;
  if (v11)
    -[MIInstalledInfoGatherer _initWithAppExtensionBundle:inBundleIdentifier:dataContainers:](v11, "_initWithAppExtensionBundle:inBundleIdentifier:dataContainers:", v8, v9, v10);

  return v12;
}

- (MIInstalledInfoGatherer)initWithAppExtensionBundle:(id)a3 inBundleIdentifier:(id)a4 dataContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  MIInstalledInfoGatherer *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MIInstalledInfoGatherer;
  v11 = -[MIInstalledInfoGatherer init](&v14, sel_init);
  if (v11)
  {
    if (v10)
    {
      v15[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    -[MIInstalledInfoGatherer _initWithAppExtensionBundle:inBundleIdentifier:dataContainers:](v11, "_initWithAppExtensionBundle:inBundleIdentifier:dataContainers:", v8, v9, v12);

  }
  return v11;
}

- (id)_sandboxEnvironmentForDataContainer:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  objc_msgSend(a3, "containerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("tmp"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v10[0] = CFSTR("HOME");
    v10[1] = CFSTR("CFFIXED_USER_HOME");
    v11[0] = v5;
    v11[1] = v5;
    v10[2] = CFSTR("TMPDIR");
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v8 = 0;
  }

  return v8;
}

- (id)_groupContainersDictionaryForPersona:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  id v13;
  id v14;
  id v15;

  v4 = a3;
  -[MIInstalledInfoGatherer bundle](self, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MIInstalledInfoGatherer dataContainers](self, "dataContainers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v15 = 0;
    +[MIContainer groupContainerURLsForBundleIdentifier:forPersona:error:](MIContainer, "groupContainerURLsForBundleIdentifier:forPersona:error:", v6, v4, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    if (!v8 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v13 = v4;
      v14 = v9;
      v12 = v6;
      MOLogWrite();
    }
    v10 = (void *)objc_msgSend(v8, "copy", v12, v13, v14);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_staticDiskUsage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MIInstalledInfoGatherer bundleContainer](self, "bundleContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[MIInstalledInfoGatherer bundleContainer](self, "bundleContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "diskUsage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_stashedAppRecordForStashedContainer:(id)a3
{
  id v4;
  void *v5;
  MIInstalledInfoGatherer *v6;
  void *v7;
  MIInstalledInfoGatherer *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = [MIInstalledInfoGatherer alloc];
  -[MIInstalledInfoGatherer personaUniqueStrings](self, "personaUniqueStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MIInstalledInfoGatherer initWithBundleContainer:forPersonas:](v6, "initWithBundleContainer:forPersonas:", v4, v7);

  v18 = 0;
  LOBYTE(v6) = -[MIInstalledInfoGatherer _populateBundleRecord:error:](v8, "_populateBundleRecord:error:", v5, &v18);
  v9 = v18;
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    v17 = v9;
    objc_msgSend(v4, "stashMetadataWithError:", &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;

    if (v11)
    {
      objc_msgSend(v11, "dateStashed");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setStashedAtTimestamp:", v13);

      objc_msgSend(v11, "dateOriginallyInstalled");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setStashOriginalInstallTimestamp:", v14);
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
      v14 = v12;
      v12 = 0;
    }

    v15 = v5;
    v10 = v12;
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v15 = 0;
  }

  return v15;
}

- (id)_buildBundlePersonaRecordWithDataContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "personaUniqueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataContainerURL:", v7);

  -[MIInstalledInfoGatherer _sandboxEnvironmentForDataContainer:](self, "_sandboxEnvironmentForDataContainer:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setEnvironmentVariables:", v8);
  -[MIInstalledInfoGatherer _groupContainersDictionaryForPersona:](self, "_groupContainersDictionaryForPersona:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupContainerURLs:", v9);

  return v5;
}

- (BOOL)_populateBundleRecordValues:(id)a3 signingInfo:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  BOOL v45;
  int v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  const __CFString *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  char v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  BOOL v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v109;
  void *v110;
  id v111;
  id v112;
  id v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  void *v123;
  MIInstalledInfoGatherer *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[MIInstalledInfoGatherer bundle](self, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = self;
  -[MIInstalledInfoGatherer bundleContainer](self, "bundleContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "bundleType");
  v12 = objc_msgSend(v9, "isPlaceholder");
  objc_msgSend(v7, "setIsPlaceholder:", v12);
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBundleIdentifier:", v13);

  objc_msgSend(v9, "bundleVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBundleVersion:", v14);

  objc_msgSend(v9, "bundleShortVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBundleShortVersion:", v15);

  objc_msgSend(v9, "bundleURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBundleURL:", v16);

  v17 = v11 - 1;
  if ((v11 - 1) > 9)
    v18 = 0;
  else
    v18 = qword_1B7795858[(char)v17];
  objc_msgSend(v7, "setApplicationType:", v18);
  objc_msgSend(v9, "counterpartIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCounterpartIdentifiers:", v19);

  objc_msgSend(v7, "setCompatibilityState:", objc_msgSend(v9, "compatibilityState"));
  objc_msgSend(v7, "setIsOnMountedDiskImage:", v11 == 3);
  objc_msgSend(v8, "signatureVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if (v17 < 6 || v11 == 9)
    {
      objc_msgSend(v9, "bundleSignatureVersionWithError:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }
  objc_msgSend(v7, "setSignatureVersion:", v20);
  objc_msgSend(v7, "setIsContainerized:", objc_msgSend(v9, "needsDataContainer"));
  if (v8)
  {
    objc_msgSend(v8, "entitlements");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHasAppGroupContainers:", MIHasAnyApplicationGroupEntitlements(v21));

    objc_msgSend(v8, "entitlements");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHasSystemContainer:", MIHasSystemContainerEntitlement(v22));

    objc_msgSend(v8, "entitlements");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHasSystemGroupContainers:", MIHasAnySystemGroupEntitlements(v23));

    v24 = objc_msgSend(v9, "codeSignatureVerificationState");
    if ((unint64_t)(v24 - 1) <= 1)
    {
      v25 = v10;
      v134 = 0;
      v26 = objc_msgSend(v9, "updateMCMWithCodeSigningInfoAsAdvanceCopy:withError:", 0, &v134);
      v27 = v134;
      if ((v26 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        objc_msgSend(v9, "identifier");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v27;
        MOLogWrite();

      }
      v10 = v25;
    }
    if ((objc_msgSend(v8, "signingInfoSource", v109, v111) & 0xFFFFFFFFFFFFFFFELL) != 2)
      objc_msgSend(v7, "setCodeSigningInfoNotAuthoritative:", 1);
    if (v24 == 1)
    {

      v8 = 0;
    }
    objc_msgSend(v8, "entitlements");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEntitlements:", v28);

    objc_msgSend(v8, "signerIdentity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v8, "codeSignerType");
    if ((unint64_t)(v30 - 1) >= 6)
      v31 = 0;
    else
      v31 = v30;
    objc_msgSend(v7, "setCodeSignerType:", v31);
    v32 = objc_msgSend(v8, "codeSignerType");
    if (v29)
    {
      v33 = v32;
      objc_msgSend(v7, "setSignerIdentity:", v29);
      if (v33 == 3)
      {
        v34 = objc_msgSend(v8, "profileValidationType");
        if ((unint64_t)(v34 - 1) >= 4)
          v35 = 0;
        else
          v35 = v34;
        objc_msgSend(v7, "setProfileValidationType:", v35);
      }
      objc_msgSend(v8, "signerOrganization");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSignerOrganization:", v36);

    }
    objc_msgSend(v8, "teamIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTeamIdentifier:", v37);

    objc_msgSend(v8, "codeInfoIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCodeInfoIdentifier:", v38);

  }
  else
  {
    objc_msgSend(v7, "setCodeSigningInfoNotAuthoritative:", 1);
  }
  if (objc_msgSend(v9, "codeSignatureVerificationState") == 6)
  {
    objc_msgSend(v7, "setIsNoLongerCompatible:", 1);
  }
  else if (objc_msgSend(v9, "codeSignatureVerificationState") != 1)
  {
    objc_msgSend(v9, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCodeInfoIdentifier:", v39);

  }
  -[MIInstalledInfoGatherer dataContainers](v124, "dataContainers");
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v40;
  if (v11 == 6 && !v40)
  {
    objc_msgSend(v9, "bundleURL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIInstalledInfoGatherer _populateBundleRecordValues:signingInfo:error:]", 598, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Discovered app extension without data containers %@"), v43, (uint64_t)v42);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  v46 = v12;
  v47 = 0;
  v118 = v20;
  v119 = (void *)v40;
  if (v11 == 4)
  {
    v54 = CFSTR("user");
    if (!v10)
    {
LABEL_115:
      v55 = v47;
      objc_msgSend(v9, "bundleURL");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIInstalledInfoGatherer _populateBundleRecordValues:signingInfo:error:]", 637, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Discovered %@ app without bundle container %@"), v106, (uint64_t)v54);
      goto LABEL_116;
    }
  }
  else
  {
    if (v11 != 1)
      goto LABEL_48;
    v115 = v10;
    objc_msgSend(v9, "bundleParentDirectoryURL");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "path");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "systemAppsDirectory");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "path");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v49, "isEqualToString:", v52);

    if ((v53 & 1) != 0)
    {
      v47 = 0;
      v10 = v115;
      v20 = v118;
      v41 = v119;
      v11 = 1;
      goto LABEL_48;
    }
    if (v46)
    {
      v133 = 0;
      objc_msgSend(v9, "lsInstallTypeWithError:", &v133);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v133;
      v10 = v115;
      v20 = v118;
      if (v70)
      {
        if (objc_msgSend(v70, "unsignedIntegerValue") == 7)
        {
          v71 = 3;
        }
        else if (objc_msgSend(v70, "unsignedIntegerValue") == 8)
        {
          v71 = 4;
        }
        else
        {
          v71 = 1;
        }
      }
      else
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v109 = v9;
          v111 = v121;
          MOLogWrite();
        }

        v121 = 0;
        v71 = 1;
      }
      +[MISystemAppState sharedList](MISystemAppState, "sharedList", v109, v111);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "addIdentifier:withState:", v105, v71);

    }
    else
    {
      +[MISystemAppState sharedList](MISystemAppState, "sharedList");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "addIdentifier:withState:", v78, 1);
      v121 = 0;
      v10 = v115;
      v20 = v118;
    }
    v41 = v119;
    v11 = 1;

    v54 = CFSTR("system");
    v47 = v121;
    if (!v10)
      goto LABEL_115;
  }
  if (v41 || !objc_msgSend(v10, "shouldHaveCorrespondingDataContainer"))
  {
LABEL_48:
    v120 = v47;
    -[MIInstalledInfoGatherer owningBundleIdentifier](v124, "owningBundleIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      if (v10)
        goto LABEL_50;
      goto LABEL_76;
    }
    v64 = v11;
    objc_msgSend(v9, "bundleURL");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "URLByAppendingPathComponent:isDirectory:", CFSTR("Settings.bundle"), 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    +[MIFileManager defaultManager](MIFileManager, "defaultManager");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = 0;
    v68 = objc_msgSend(v67, "itemExistsAtURL:error:", v66, &v132);
    v69 = v132;

    if (v68)
    {
      objc_msgSend(v7, "setHasSettingsBundle:", 1);
      v11 = v64;
      goto LABEL_75;
    }
    objc_msgSend(v69, "domain");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v72, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v73 = objc_msgSend(v69, "code");

      v94 = v73 == 2;
      v11 = v64;
      if (v94)
        goto LABEL_75;
    }
    else
    {

      v11 = v64;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v109 = v66;
      v111 = v69;
      MOLogWrite();
    }
LABEL_75:

    v41 = v119;
    if (v10)
    {
LABEL_50:
      v131 = 0;
      objc_msgSend(v10, "bundleMetadataWithError:", &v131, v109, v111);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v131;
      if (!v58)
        goto LABEL_126;
      objc_msgSend(v58, "watchKitAppExecutableHash");
      v60 = objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        v61 = (void *)v60;
        v62 = v9;
        v63 = v120;
LABEL_125:

        v120 = v63;
        v9 = v62;
        v20 = v118;
LABEL_126:
        -[MIInstalledInfoGatherer _staticDiskUsage](v124, "_staticDiskUsage", v110, v112);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setStaticDiskUsage:", v107);

        if (!v41)
        {
LABEL_127:
          v45 = 1;
LABEL_128:
          v44 = v120;
          goto LABEL_129;
        }
LABEL_79:
        v117 = v9;
        v79 = (void *)objc_opt_new();
        v125 = 0u;
        v126 = 0u;
        v127 = 0u;
        v128 = 0u;
        v80 = v41;
        v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
        if (v81)
        {
          v82 = v81;
          v123 = v79;
          v114 = v7;
          v116 = v10;
          v113 = v8;
          v83 = 0;
          v84 = 0;
          v85 = *(_QWORD *)v126;
          do
          {
            v86 = v80;
            v87 = 0;
            v88 = v84;
            do
            {
              if (*(_QWORD *)v126 != v85)
                objc_enumerationMutation(v86);
              v89 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v87);
              objc_msgSend(v89, "personaUniqueString", v109);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              -[MIInstalledInfoGatherer _buildBundlePersonaRecordWithDataContainer:](v124, "_buildBundlePersonaRecordWithDataContainer:", v89);
              v84 = (id)objc_claimAutoreleasedReturnValue();

              if (v90)
                objc_msgSend(v123, "setObject:forKeyedSubscript:", v84, v90);
              +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "primaryPersonaString");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = objc_msgSend(v90, "isEqualToString:", v92);

              if (v90)
                v94 = v93 == 0;
              else
                v94 = 0;
              if (!v94)
              {
                v95 = v84;

                v83 = v95;
              }

              ++v87;
              v88 = v84;
            }
            while (v82 != v87);
            v80 = v86;
            v82 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v125, v135, 16);
          }
          while (v82);

          v8 = v113;
          v7 = v114;
          v10 = v116;
          v79 = v123;
          if (v83)
            goto LABEL_97;
        }
        else
        {

          v84 = 0;
        }
        v84 = v84;
        v83 = v84;
LABEL_97:
        objc_msgSend(v83, "dataContainerURL", v109);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDataContainerURL:", v96);

        objc_msgSend(v83, "environmentVariables");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setEnvironmentVariables:", v97);

        objc_msgSend(v83, "groupContainerURLs");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setGroupContainers:", v98);

        +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v99, "deviceHasPersonas");

        v41 = v119;
        if (v100)
          v101 = objc_msgSend(v79, "copy");
        else
          v101 = objc_opt_new();
        v102 = (void *)v101;
        objc_msgSend(v7, "setPersonasRecordMap:", v101);

        v45 = 1;
        v9 = v117;
        v20 = v118;
        goto LABEL_128;
      }
      v130 = v120;
      v62 = v9;
      objc_msgSend(v9, "watchKitAppExecutableHashWithError:", &v130);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v130;

      if (v61)
      {
        objc_msgSend(v58, "setWatchKitAppExecutableHash:", v61);
        v129 = v63;
        v74 = v10;
        v75 = objc_msgSend(v10, "saveBundleMetadata:withError:", v58, &v129);
        v76 = v129;

        if ((v75 & 1) != 0 || gLogHandle && *(int *)(gLogHandle + 44) < 3)
          goto LABEL_123;
        objc_msgSend(v62, "identifier");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = v77;
        v112 = v76;
        MOLogWrite();
LABEL_122:

LABEL_123:
        v63 = v76;
LABEL_124:
        v10 = v74;
        v41 = v119;
        goto LABEL_125;
      }
      v74 = v10;
      objc_msgSend(v63, "domain");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v77, "isEqualToString:", CFSTR("MIInstallerErrorDomain"))
        || objc_msgSend(v63, "code") != 85)
      {
        objc_msgSend(v63, "domain");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v103, "isEqualToString:", CFSTR("MIInstallerErrorDomain")) & 1) != 0)
        {
          v104 = objc_msgSend(v63, "code");

          if (v104 == 139)
          {
LABEL_130:
            v61 = 0;
            goto LABEL_124;
          }
        }
        else
        {

        }
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          goto LABEL_130;
        objc_msgSend(v62, "identifier");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = v77;
        v112 = v63;
        MOLogWrite();
      }
      v61 = 0;
      v76 = v63;
      goto LABEL_122;
    }
LABEL_76:
    if (v11 == 10)
      objc_msgSend(v7, "setIsPlaceholder:", 1);
    if (!v41)
      goto LABEL_127;
    goto LABEL_79;
  }
  v55 = v47;
  objc_msgSend(v9, "bundleURL");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError((uint64_t)"-[MIInstalledInfoGatherer _populateBundleRecordValues:signingInfo:error:]", 642, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Discovered %@ app without data container %@"), v56, (uint64_t)v54);
LABEL_116:
  v44 = (id)objc_claimAutoreleasedReturnValue();

LABEL_37:
  if (a5)
  {
    v44 = objc_retainAutorelease(v44);
    v45 = 0;
    *a5 = v44;
  }
  else
  {
    v45 = 0;
  }
LABEL_129:

  return v45;
}

- (void)_populateAppRecordValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MIInstalledInfoGatherer bundle](self, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v5, "bundleType");
  -[MIInstalledInfoGatherer bundleContainer](self, "bundleContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "driverKitExtensionBundlesWithError:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v13), "bundleURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    v15 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v4, "setDriverKitExtensionURLs:", v15);

  }
  if (v6)
  {
    +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "allowsInternalSecurityPolicy");

    if (v17)
    {
      objc_msgSend(v6, "stashedBundleContainerWithError:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[MIInstalledInfoGatherer _stashedAppRecordForStashedContainer:](self, "_stashedAppRecordForStashedContainer:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setStashedVersions:", v20);

      }
    }
    objc_msgSend(v6, "containerURL");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      v23 = objc_msgSend(v6, "hasParallelPlaceholder");

      if (v23)
      {
        objc_msgSend(v6, "parallelPlaceholderURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setParallelPlaceholderURL:", v24);

      }
    }
    objc_msgSend(v4, "setIsUpdatedSystemApp:", (v28 & 0xFFFFFFFB) == 1);
  }
  else
  {
    -[MIInstalledInfoGatherer builtInAppParallelPlaceholderBundle](self, "builtInAppParallelPlaceholderBundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[MIInstalledInfoGatherer builtInAppParallelPlaceholderBundle](self, "builtInAppParallelPlaceholderBundle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bundleURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setParallelPlaceholderURL:", v27);

    }
  }

}

- (void)_populateAppExtensionRecordValues:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MIInstalledInfoGatherer owningBundleIdentifier](self, "owningBundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtensionOwnerBundleID:", v5);

}

- (void)_populatePlaceholderRecordValues:(id)a3 signingInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;

  v6 = a3;
  v7 = a4;
  -[MIInstalledInfoGatherer bundle](self, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIInstalledInfoGatherer bundleContainer](self, "bundleContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "bundleType");
  objc_msgSend(v7, "entitlements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIsOnDemandInstallCapable:", MIHasOnDemandInstallCapableEntitlement(v11));
  MICopyParentIdentifiersEntitlement(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setParentIdentifiers:", v12);

  objc_msgSend(v6, "setIsSwiftPlaygroundsApp:", MIHasSwiftPlaygroundsAppEntitlement(v11));
  MICopyAppManagementDomainEntitlement(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAppManagementDomain:", v13);

  objc_msgSend(v6, "setIsWebNotificationBundle:", MIHasWebKitPushBundleEntitlement(v11));
  objc_msgSend(v6, "setIsBeta:", MIHasBetaReportsActiveEntitlement(v11));
  objc_msgSend(v6, "setIsMarketplace:", MIHasMarketplaceEntitlement(v11));
  if ((v10 - 1) >= 5 && v10 != 9)
  {
    v16 = 0;
    if (!v9)
      goto LABEL_53;
LABEL_16:
    v50 = 0;
    objc_msgSend(v9, "bundleMetadataWithError:", &v50, v37, v41);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v50;
    v46 = v22;
    if (v21)
    {
      objc_msgSend(v21, "alternateIconName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlternateIconName:", v23);

      objc_msgSend(v21, "linkedParentBundleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLinkedParentBundleID:", v24);

      objc_msgSend(v21, "installDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInstallDate:", v25);

      if (objc_msgSend(v8, "isPlaceholder"))
      {
        objc_msgSend(v6, "setPlaceholderFailureReason:", objc_msgSend(v21, "placeholderFailureReason"));
        goto LABEL_28;
      }
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v38 = v9;
        v42 = v22;
        MOLogWrite();
      }
      if ((objc_msgSend(v8, "isPlaceholder", v38, v42) & 1) != 0)
      {
LABEL_28:
        objc_msgSend(v9, "containerURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v6, "setBundleContainerURL:", v27);
        }
        else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v38 = v9;
          MOLogWrite();
        }
        v49 = v16;
        objc_msgSend(v8, "lsInstallTypeWithError:", &v49, v38);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v49;

        if (v28)
        {
          objc_msgSend(v6, "setLsInstallType:", v28);
        }
        else
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            v39 = v8;
            v42 = v29;
            MOLogWrite();
          }

          v29 = 0;
        }
        objc_msgSend(v8, "watchKitV2AppBundleWithError:", 0, v39, v42);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v21;
        if (!v30)
        {
          v33 = 1;
LABEL_52:
          objc_msgSend(v6, "setIsEligibleForWatchAppInstall:", v33, v40, v43);

          v16 = v29;
          goto LABEL_53;
        }
        v48 = v29;
        v45 = v9;
        objc_msgSend(v9, "iTunesMetadataWithError:", &v48);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v48;

        if (v31)
        {
          v33 = objc_msgSend(v31, "isEligibleForWatchAppInstall");
LABEL_51:

          v29 = v32;
          v9 = v45;
          goto LABEL_52;
        }
        objc_msgSend(v32, "userInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "domain");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
        {
          v44 = objc_msgSend(v35, "code");

          if (v44 == 260)
          {
LABEL_50:

            v32 = 0;
            v33 = 1;
            goto LABEL_51;
          }
        }
        else
        {

        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v40 = v45;
          v43 = v32;
          MOLogWrite();
        }
        goto LABEL_50;
      }
    }
    objc_msgSend(v8, "fairPlaySinfInfoWithError:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      if (objc_msgSend(v8, "needsSinf"))
      {
        v26 = (void *)objc_opt_new();
        objc_msgSend(v26, "setIsMissingRequiredSINF:", 1);
      }
      else
      {
        v26 = 0;
      }
    }
    objc_msgSend(v6, "setSinfInfo:", v26);

    goto LABEL_28;
  }
  objc_msgSend(v6, "setIsDeletable:", objc_msgSend(v8, "isDeletable"));
  v51 = 0;
  objc_msgSend(v8, "installationIdentitySettingIfNotSet:withError:", 0, &v51);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v51;
  v16 = v15;
  if (v14)
  {
    objc_msgSend(v14, "uniqueInstallID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUniqueInstallID:", v17);

    objc_msgSend(v14, "installSessionID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInstallSessionID:", v18);
    goto LABEL_15;
  }
  objc_msgSend(v15, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {

    goto LABEL_11;
  }
  v20 = objc_msgSend(v16, "code");

  if (v20 != 93)
  {
LABEL_11:
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v37 = v8;
      v41 = v16;
      MOLogWrite();
    }
  }
  v18 = v16;
  v16 = 0;
LABEL_15:

  if (v9)
    goto LABEL_16;
LABEL_53:

}

- (id)bundleRecordWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  ICLSystemAppPlaceholderRecord *v8;
  ICLSystemAppPlaceholderRecord *v9;
  _BOOL4 v10;
  id v11;
  ICLSystemAppPlaceholderRecord *v12;
  uint64_t v13;
  id v15;

  -[MIInstalledInfoGatherer bundle](self, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v5, "bundleType"))
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 0xBu:
      v8 = (ICLSystemAppPlaceholderRecord *)objc_opt_new();
      goto LABEL_4;
    case 9u:
      objc_msgSend(v5, "bundleURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIInstalledInfoGatherer bundleRecordWithError:]", 983, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Embedded watch apps don't get reported to Launch Services: %@"), v13, (uint64_t)v6);
      goto LABEL_8;
    case 0xAu:
      v8 = [ICLSystemAppPlaceholderRecord alloc];
LABEL_4:
      v9 = v8;
      v15 = 0;
      v10 = -[MIInstalledInfoGatherer _populateBundleRecord:error:](self, "_populateBundleRecord:error:", v8, &v15);
      v11 = v15;
      if (!v10)
        goto LABEL_9;
      v9 = v9;
      v12 = v9;
      if (!a3)
        goto LABEL_12;
      goto LABEL_10;
    default:
      objc_msgSend(v5, "bundleURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIInstalledInfoGatherer bundleRecordWithError:]", 987, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Unable to determine application type for %@"), v7, (uint64_t)v6);
LABEL_8:
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v9 = 0;
LABEL_9:
      v12 = 0;
      if (a3)
      {
LABEL_10:
        if (!v12)
          *a3 = objc_retainAutorelease(v11);
      }
LABEL_12:

      return v12;
  }
}

- (BOOL)_populateBundleRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  const __CFString *v20;
  char v21;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MIInstalledInfoGatherer bundle](self, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[MIInstalledInfoGatherer bundle](self, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (MILogHandleForSignpost_onceToken != -1)
    dispatch_once(&MILogHandleForSignpost_onceToken, &__block_literal_global_3);
  v10 = MILogHandleForSignpost_logHandle;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_signpost_emit_with_name_impl(&dword_1B76F3000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GenerateDict", "Generating ICL bundle record for %@", buf, 0xCu);
  }
  v25 = 0;
  objc_msgSend(v9, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 0, 0, 0, 0, 0, &v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v25;
  v13 = v12;
  if (!v11)
  {
    objc_msgSend(v12, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("MIInstallerErrorDomain"))
      && objc_msgSend(v13, "code") == 71)
    {
      v15 = objc_msgSend(v9, "bundleType");

      if (v15 == 7)
        goto LABEL_14;
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 4)
    {
      objc_msgSend(v9, "bundleURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
LABEL_14:

  v24 = 0;
  v17 = -[MIInstalledInfoGatherer _populateBundleRecordValues:signingInfo:error:](self, "_populateBundleRecordValues:signingInfo:error:", v6, v11, &v24);
  v18 = v24;
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MIInstalledInfoGatherer _populateAppRecordValues:](self, "_populateAppRecordValues:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MIInstalledInfoGatherer _populateAppExtensionRecordValues:](self, "_populateAppExtensionRecordValues:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MIInstalledInfoGatherer _populatePlaceholderRecordValues:signingInfo:](self, "_populatePlaceholderRecordValues:signingInfo:", v6, v11);
  }
  if (MILogHandleForSignpost_onceToken != -1)
    dispatch_once(&MILogHandleForSignpost_onceToken, &__block_literal_global_3);
  v19 = MILogHandleForSignpost_logHandle;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle))
  {
    v20 = CFSTR("[FAIL] ");
    if (v17)
      v20 = &stru_1E6CC0B98;
    *(_DWORD *)buf = 138412546;
    v27 = v20;
    v28 = 2112;
    v29 = v8;
    _os_signpost_emit_with_name_impl(&dword_1B76F3000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GenerateDict", "%@Done generating ICL bundle record for %@", buf, 0x16u);
  }
  if (a4)
    v21 = v17;
  else
    v21 = 1;
  if ((v21 & 1) == 0)
    *a4 = objc_retainAutorelease(v18);

  return v17;
}

- (MIExecutableBundle)bundle
{
  return self->_bundle;
}

- (MIExecutableBundle)builtInAppParallelPlaceholderBundle
{
  return self->_builtInAppParallelPlaceholderBundle;
}

- (MIBundleContainer)bundleContainer
{
  return self->_bundleContainer;
}

- (NSArray)personaUniqueStrings
{
  return self->_personaUniqueStrings;
}

- (NSArray)dataContainers
{
  return self->_dataContainers;
}

- (NSString)owningBundleIdentifier
{
  return self->_owningBundleIdentifier;
}

- (NSURL)parentBundleURL
{
  return self->_parentBundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBundleURL, 0);
  objc_storeStrong((id *)&self->_owningBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dataContainers, 0);
  objc_storeStrong((id *)&self->_personaUniqueStrings, 0);
  objc_storeStrong((id *)&self->_bundleContainer, 0);
  objc_storeStrong((id *)&self->_builtInAppParallelPlaceholderBundle, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
