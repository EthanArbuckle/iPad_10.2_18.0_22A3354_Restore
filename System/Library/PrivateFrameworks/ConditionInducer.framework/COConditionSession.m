@implementation COConditionSession

- (id)userFriendlyNameForSelectedCondition
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  void *v23;

  -[COConditionSession selectedCondition](self, "selectedCondition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v14)
      -[COConditionSession userFriendlyNameForSelectedCondition].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_12;
  }
  -[COConditionSession selectedCondition](self, "selectedCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[COConditionSession conditionIsBundledWithFramework:](COConditionSession, "conditionIsBundledWithFramework:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "infoDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", CFSTR("SupportedConditionData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[COConditionSession selectedCondition](self, "selectedCondition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("Metadata"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("ConditionUserFriendlyName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    if (!v12)
      goto LABEL_9;
    goto LABEL_13;
  }
  -[COConditionSession selectedCondition](self, "selectedCondition");
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  v13 = NSClassFromString(v22);

  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[COConditionSession userFriendlyNameForSelectedCondition].cold.2(self);
LABEL_12:
    v7 = 0;
    v12 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("ConditionUserFriendlyName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_9:
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v12;
}

- (id)userFriendlyNameForSelectedProfile
{
  void *v3;
  NSString *v4;
  Class v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  -[COConditionSession selectedProfile](self, "selectedProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v7)
      -[COConditionSession userFriendlyNameForSelectedProfile].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_10;
  }
  -[COConditionSession selectedProfile](self, "selectedProfile");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = NSClassFromString(v4);

  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[COConditionSession userFriendlyNameForSelectedProfile].cold.2(self);
LABEL_10:
    v6 = 0;
    return v6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[objc_class profileFriendlyName](v5, "profileFriendlyName");
  else
    NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

+ (id)_loadExternalConditionBundleInfo:(id)a3 supportedConditionData:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSString *v24;
  objc_class *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  NSString *v44;
  Class v45;
  Class v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v52;
  void *v53;
  NSString *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v60 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v8, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!v10)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:]", 174, -1, 0, CFSTR("No class information dict found in Info.plist %s for condition %@"), v11, v12, v13, (uint64_t)"SupportedConditionData");
    goto LABEL_27;
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("Profiles"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v61)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:]", 180, -1, 0, CFSTR("Class information dictionary containing supported profiles for not found for condition %@"), v14, v15, v16, (uint64_t)v7);
LABEL_27:
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v20 = 0;
    v61 = 0;
    if (!a5)
      goto LABEL_38;
    goto LABEL_36;
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("Metadata"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:]", 186, -1, 0, CFSTR("Class information dictionary containing condition metadata for not found for condition %@"), v17, v18, v19, (uint64_t)v7);
    goto LABEL_31;
  }
  if (!objc_msgSend(v61, "count"))
  {
    createConditionInducerError((uint64_t)"+[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:]", 192, -1, 0, CFSTR("Expected at least one supported profile for %@"), v21, v22, v23, (uint64_t)v7);
LABEL_31:
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    if (!a5)
      goto LABEL_38;
    goto LABEL_36;
  }
  objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  v25 = NSClassFromString(v24);
  if (v25)
  {
    v29 = objc_alloc_init(v25);
    if (v29)
    {
      v33 = v29;
      objc_msgSend(v29, "userFriendlyNameFromDict:", v20);
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
        objc_msgSend(v9, "setObject:forKey:", v34, CFSTR("ConditionUserFriendlyName"));
      v53 = (void *)v34;
      v54 = v24;
      v56 = v10;
      v58 = v8;
      objc_msgSend(v33, "identifierNameFromDict:", v20);
      v35 = objc_claimAutoreleasedReturnValue();
      if (v35)
        objc_msgSend(v9, "setObject:forKey:", v35, CFSTR("ConditionIdentifierName"));
      v52 = (void *)v35;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v33, "isDestructiveFromDict:", v20));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v36, CFSTR("ConditionIsDestructive"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v33, "isInternalOnlyFromDict:", v20));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v37, CFSTR("ConditionIsInternalOnly"));

      v55 = v20;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v33, "persistsAfterRebootFromDict:", v20));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v9;
      objc_msgSend(v9, "setObject:forKey:", v38, CFSTR("ConditionPersistsAfterReboot"));

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v39 = v61;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      v61 = v39;
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v63 != v42)
              objc_enumerationMutation(v39);
            v44 = *(NSString **)(*((_QWORD *)&v62 + 1) + 8 * i);
            v45 = NSClassFromString(v44);
            if (v45)
            {
              v46 = v45;
              if ((!objc_msgSend(v7, "isEqualToString:", CFSTR("ThermalCondition"))
                 || !-[NSString isEqualToString:](v44, "isEqualToString:", CFSTR("ThermalNominal")))
                && (!objc_msgSend(v7, "isEqualToString:", CFSTR("GPUPerformanceState"))
                 || !-[NSString isEqualToString:](v44, "isEqualToString:", CFSTR("GPUPerformanceStateDefault"))))
              {
                v47 = (void *)MEMORY[0x24BDBCED8];
                -[objc_class info](v46, "info");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "dictionaryWithDictionary:", v48);
                v49 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v49, "setValue:forKey:", v44, CFSTR("ConditionBundleProfile"));
                objc_msgSend(v60, "setValue:forKey:", v49, v44);
                objc_msgSend(v59, "addObject:", v49);

                v39 = v61;
              }
            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        }
        while (v41);
      }

      v9 = v57;
      objc_msgSend(v57, "setObject:forKey:", v59, CFSTR("ConditionBundleArray"));
      objc_msgSend(v57, "setObject:forKey:", v60, CFSTR("ConditionBundleDict"));
      objc_msgSend(v57, "setObject:forKey:", v7, CFSTR("ConditionCacheBundlePath"));

      v50 = 0;
      v8 = v58;
      v20 = v55;
      v10 = v56;
      v24 = v54;
      goto LABEL_38;
    }
    createConditionInducerError((uint64_t)"+[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:]", 203, -1, 0, CFSTR("Failed to allocate instance of %@ for condition %@"), v30, v31, v32, (uint64_t)v24);
  }
  else
  {
    createConditionInducerError((uint64_t)"+[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:]", 198, -1, 0, CFSTR("Failed to instantiate principal class %@ for condition %@"), v26, v27, v28, (uint64_t)v24);
  }
  v50 = (id)objc_claimAutoreleasedReturnValue();
  if (!a5)
    goto LABEL_38;
LABEL_36:
  if (v50)
  {
    v50 = objc_retainAutorelease(v50);
    *a5 = v50;
  }
LABEL_38:

  return v9;
}

- (BOOL)setUpWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  BOOL v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  __CFString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;

  -[COConditionSession condition](self, "condition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    createConditionInducerError((uint64_t)"-[COConditionSession setUpWithError:]", 261, -1, 0, CFSTR("Need a valid condition first"), v6, v7, v8, v42);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_19;
    goto LABEL_18;
  }
  -[COConditionSession userFriendlyNameForSelectedProfile](self, "userFriendlyNameForSelectedProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[COConditionSession selectedProfile](self, "selectedProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[COConditionSession userFriendlyNameForSelectedCondition](self, "userFriendlyNameForSelectedCondition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v10 = -[COConditionSession createStatusBar:conditionClassDescription:withProfileDescription:error:](self, "createStatusBar:conditionClassDescription:withProfileDescription:error:", CFSTR("setting up"), v9, v5, &v45);
  v11 = v45;

  if (!v10)
  {
    createConditionInducerError((uint64_t)"-[COConditionSession setUpWithError:]", 272, -1, v11, CFSTR("Failed to create status bar with title 'Setup'."), v12, v13, v14, v42);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3)
      goto LABEL_19;
    goto LABEL_18;
  }
  -[COConditionSession condition](self, "condition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "active");

  if (v16)
  {
    -[COConditionSession condition](self, "condition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tearDown");

  }
  -[COConditionSession additionalArguments](self, "additionalArguments");
  v18 = objc_claimAutoreleasedReturnValue();
  -[COConditionSession condition](self, "condition");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAdditionalArguments:", v18);

  -[COConditionSession condition](self, "condition");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[COConditionSession additionalArguments](self, "additionalArguments");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[COConditionSession bundle](self, "bundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v11;
  LOBYTE(v18) = +[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:](COConditionSession, "updateConditionCache:forCondition:additionalArguments:conditionBundle:error:", 1, v20, v21, v22, &v44);
  v23 = v44;

  if ((v18 & 1) == 0)
  {
    v36 = CFSTR("Failed to update cache.");
    v37 = 284;
    v38 = v23;
    goto LABEL_17;
  }
  -[COConditionSession condition](self, "condition");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "setUp");

  if ((v28 & 1) == 0)
  {
    v36 = CFSTR("Failed to set up condition.");
    v37 = 289;
    v38 = 0;
LABEL_17:
    createConditionInducerError((uint64_t)"-[COConditionSession setUpWithError:]", v37, -1, v38, v36, v24, v25, v26, v42);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
LABEL_19:
      -[COConditionSession userFriendlyNameForSelectedCondition](self, "userFriendlyNameForSelectedCondition");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[COConditionSession createStatusBar:conditionClassDescription:withProfileDescription:error:](self, "createStatusBar:conditionClassDescription:withProfileDescription:error:", CFSTR("tearing down"), v39, v5, 0);

      -[COConditionSession tearDownWithError:](self, "tearDownWithError:", 0);
      v35 = 0;
      goto LABEL_20;
    }
LABEL_18:
    *a3 = objc_retainAutorelease(v31);
    goto LABEL_19;
  }
  -[COConditionSession userFriendlyNameForSelectedCondition](self, "userFriendlyNameForSelectedCondition");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v23;
  v30 = -[COConditionSession createStatusBar:conditionClassDescription:withProfileDescription:error:](self, "createStatusBar:conditionClassDescription:withProfileDescription:error:", CFSTR("running"), v29, v5, &v43);
  v31 = v43;

  if (!v30)
  {
    createConditionInducerError((uint64_t)"-[COConditionSession setUpWithError:]", 294, -1, v31, CFSTR("Failed to create status bar with title 'Running'."), v32, v33, v34, v42);
    v41 = objc_claimAutoreleasedReturnValue();

    v31 = (id)v41;
    if (!a3)
      goto LABEL_19;
    goto LABEL_18;
  }
  v35 = 1;
LABEL_20:

  return v35;
}

- (BOOL)tearDownWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  __CFString *v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v23;

  -[COConditionSession userFriendlyNameForSelectedProfile](self, "userFriendlyNameForSelectedProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COConditionSession condition](self, "condition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!v5)
    {
      -[COConditionSession selectedProfile](self, "selectedProfile");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[COConditionSession userFriendlyNameForSelectedCondition](self, "userFriendlyNameForSelectedCondition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[COConditionSession createStatusBar:conditionClassDescription:withProfileDescription:error:](self, "createStatusBar:conditionClassDescription:withProfileDescription:error:", CFSTR("tearing down"), v10, v5, a3);

    if (v11)
    {
      -[COConditionSession condition](self, "condition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tearDown");

      -[COConditionSession condition](self, "condition");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[COConditionSession additionalArguments](self, "additionalArguments");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[COConditionSession bundle](self, "bundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:](COConditionSession, "updateConditionCache:forCondition:additionalArguments:conditionBundle:error:", 0, v13, v14, v15, 0);

      -[COConditionSession freeStatusBar](self, "freeStatusBar");
      v16 = 0;
      v17 = 1;
      goto LABEL_11;
    }
    v18 = CFSTR("Failed to create status bar with title 'Teardown'");
    v19 = 331;
    v20 = -1;
  }
  else
  {
    v18 = CFSTR("Condition not running.");
    v19 = 321;
    v20 = -10;
  }
  createConditionInducerError((uint64_t)"-[COConditionSession tearDownWithError:]", v19, v20, 0, v18, v7, v8, v9, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v21;
  if (a3)
  {
    v16 = objc_retainAutorelease(v21);
    v17 = 0;
    *a3 = v16;
  }
  else
  {
    v17 = 0;
  }
LABEL_11:

  return v17;
}

- (id)className
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;

  -[COConditionSession condition](self, "condition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[COConditionSession condition](self, "condition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getBundleURLsAtPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = *MEMORY[0x24BDBCC60];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, v5, 7, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "pathExtension", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14 && !objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("bundle")))
          objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)bundleToDict:(id)a3
{
  id v3;
  COConditionBundle *v4;
  COConditionBundle *v5;
  BOOL v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v42;
  id v43;
  COConditionBundle *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = -[COConditionBundle initWithURL:]([COConditionBundle alloc], "initWithURL:", v3);
    v5 = v4;
    if (v4)
    {
      v50 = 0;
      v6 = -[COConditionBundle loadAndReturnError:](v4, "loadAndReturnError:", &v50);
      v7 = v50;
      v8 = v7;
      if (v6)
      {
        v42 = v7;
        v45 = v3;
        v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
        -[COConditionBundle conditions](v5, "conditions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = v5;
        -[COConditionBundle conditions](v5, "conditions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v47 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              v19 = (void *)MEMORY[0x24BDBCED8];
              objc_msgSend(v18, "info", v42);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "dictionaryWithDictionary:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              NSStringFromClass((Class)v18);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setValue:forKey:", v22, CFSTR("ConditionBundleProfile"));

              objc_msgSend(v12, "addObject:", v21);
              NSStringFromClass((Class)v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setValue:forKey:", v21, v23);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          }
          while (v15);
        }

        v24 = v43;
        objc_msgSend(v43, "setObject:forKey:", v12, CFSTR("ConditionBundleArray"));
        v5 = v44;
        v25 = (objc_class *)-[COConditionBundle principalClass](v44, "principalClass");
        if (v25)
        {
          v26 = objc_alloc_init(v25);
          objc_msgSend(v26, "userFriendlyName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend(v43, "setObject:forKey:", v27, CFSTR("ConditionUserFriendlyName"));
          objc_msgSend(v26, "identifierName", v42);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            objc_msgSend(v43, "setObject:forKey:", v28, CFSTR("ConditionIdentifierName"));
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v26, "isDestructive"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKey:", v29, CFSTR("ConditionIsDestructive"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v26, "isInternalOnly"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKey:", v30, CFSTR("ConditionIsInternalOnly"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v26, "persistsAfterReboot"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKey:", v31, CFSTR("ConditionPersistsAfterReboot"));

          v3 = v45;
          v32 = v42;
        }
        else
        {
          v3 = v45;
          v32 = v42;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            +[COConditionSession bundleToDict:].cold.3();
        }
        objc_msgSend(v43, "setObject:forKey:", v9, CFSTR("ConditionBundleDict"), v42);

        goto LABEL_29;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[COConditionSession bundleToDict:].cold.4(v3, v8);

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      +[COConditionSession bundleToDict:].cold.2(v3);
    }
    v24 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v33)
    +[COConditionSession bundleToDict:].cold.1(v33, v34, v35, v36, v37, v38, v39, v40);
  v24 = 0;
LABEL_30:

  return v24;
}

- (BOOL)loadProfileForBundle:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  BOOL v22;

  v6 = a3;
  -[COConditionSession bundle](self, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[COConditionSession bundle](self, "bundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_msgSend(v11, "classNamed:", v6);

    if (v12)
    {
      v16 = objc_alloc_init(v12);
      -[COConditionSession setCondition:](self, "setCondition:", v16);

      -[COConditionSession condition](self, "condition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v21 = 0;
        v22 = 1;
        goto LABEL_11;
      }
      createConditionInducerError((uint64_t)"-[COConditionSession loadProfileForBundle:withError:]", 448, -1, 0, CFSTR("Failed to instantiate %@"), v18, v19, v20, (uint64_t)v6);
    }
    else
    {
      createConditionInducerError((uint64_t)"-[COConditionSession loadProfileForBundle:withError:]", 442, -1, 0, CFSTR("Failed to load class %@"), v13, v14, v15, (uint64_t)v6);
    }
  }
  else
  {
    createConditionInducerError((uint64_t)"-[COConditionSession loadProfileForBundle:withError:]", 436, -1, 0, CFSTR("No bundle loaded for %@"), v8, v9, v10, (uint64_t)v6);
  }
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v21 = objc_retainAutorelease(v21);
    v22 = 0;
    *a4 = v21;
  }
  else
  {
    v22 = 0;
  }
LABEL_11:

  return v22;
}

- (BOOL)_setupBundleAtPath:(id)a3 withError:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  COConditionBundle *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  COConditionSession *v19;
  const __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  BOOL v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (!v9)
  {
    v21 = CFSTR("Must supply valid bundle URL to loadBundle");
    v22 = 469;
    goto LABEL_11;
  }
  v10 = -[COConditionBundle initWithURL:]([COConditionBundle alloc], "initWithURL:", v9);
  -[COConditionSession setBundle:](self, "setBundle:", v10);

  -[COConditionSession bundle](self, "bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v9, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    createConditionInducerError((uint64_t)"-[COConditionSession _setupBundleAtPath:withError:]", 475, -1, 0, CFSTR("Failed to intialize bundle for %@."), v24, v25, v26, (uint64_t)v23);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
LABEL_12:
      v27 = objc_retainAutorelease(v27);
      v28 = 0;
      *a4 = v27;
      goto LABEL_23;
    }
LABEL_9:
    v28 = 0;
    goto LABEL_23;
  }
  -[COConditionSession bundle](self, "bundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "loadAndReturnError:", a4);

  if ((v13 & 1) == 0)
  {
    v21 = CFSTR("Failed to load bundle.");
    v22 = 480;
LABEL_11:
    createConditionInducerError((uint64_t)"-[COConditionSession _setupBundleAtPath:withError:]", v22, -1, 0, v21, v6, v7, v8, v41);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
      goto LABEL_12;
    goto LABEL_9;
  }
  -[COConditionSession bundle](self, "bundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForInfoDictionaryKey:", CFSTR("ProhibitOnCarryDevice"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[COConditionSession setWarning:](self, "setWarning:", v15);

  -[COConditionSession warning](self, "warning");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v20 = CFSTR("Danger! - This condition has potential to corrupt user data");
    v19 = self;
    goto LABEL_14;
  }
  -[COConditionSession warning](self, "warning");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (!v18)
  {
    v19 = self;
    v20 = 0;
LABEL_14:
    -[COConditionSession setWarning:](v19, "setWarning:", v20);
  }
  v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[COConditionSession setClassDict:](self, "setClassDict:", v29);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[COConditionSession bundle](self, "bundle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "conditions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        -[COConditionSession classDict](self, "classDict");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "description");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromClass((Class)v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setValue:forKey:", v38, v39);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v33);
  }

  v27 = 0;
  v28 = 1;
LABEL_23:

  return v28;
}

+ (id)findBundleURLForConditionClass:(id)a3 andError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  id v18;
  void *v19;
  id v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/AppleInternal/Tests/com.apple.ConditionInducer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("bundle"));

  if (v8)
  {
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("bundle"));
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
  }
  v10 = objc_alloc(MEMORY[0x24BDBCF48]);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v6, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initFileURLWithPath:relativeToURL:", v5, v11);

  if (v12)
  {
    v21 = 0;
    v16 = objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", &v21);
    v17 = v21;
    if ((v16 & 1) != 0)
    {
      v18 = v12;
      goto LABEL_10;
    }
  }
  else
  {
    v17 = 0;
  }
  v19 = v17;
  createConditionInducerError((uint64_t)"+[COConditionSession findBundleURLForConditionClass:andError:]", 524, -1, 0, CFSTR("Failed to create bundle URL (%@)"), v13, v14, v15, (uint64_t)v5);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v17 = objc_retainAutorelease(v17);
    v18 = 0;
    *a4 = v17;
  }
  else
  {
    v18 = 0;
  }
LABEL_10:

  return v18;
}

- (BOOL)loadBundleWithPath:(id)a3 andError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v30;
  id v31;
  id v32;
  id v33;

  v6 = a3;
  v10 = v6;
  if (!v6)
  {
    createConditionInducerError((uint64_t)"-[COConditionSession loadBundleWithPath:andError:]", 543, -1, 0, CFSTR("Invalid path to bundle"), v7, v8, v9, v30);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  objc_msgSend(v6, "stringByExpandingTildeInPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "hasPrefix:", CFSTR("/")) & 1) != 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v11);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    if (!v10)
    {
LABEL_12:
      createConditionInducerError((uint64_t)"-[COConditionSession loadBundleWithPath:andError:]", 561, -1, 0, CFSTR("Failed to create bundle URL (%@)"), v12, v13, v14, (uint64_t)v11);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v16;
      if (!a4)
        goto LABEL_17;
      goto LABEL_15;
    }
  }
  else
  {
    v33 = 0;
    +[COConditionSession findBundleURLForConditionClass:andError:](COConditionSession, "findBundleURLForConditionClass:andError:", v11, &v33);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v33;
    if (!v10)
    {
      createConditionInducerError((uint64_t)"-[COConditionSession loadBundleWithPath:andError:]", 553, -1, 0, CFSTR("Failed to find bundle for (%@)"), v19, v20, v21, (uint64_t)v11);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (!a4)
      {
LABEL_17:
        v27 = 0;
        goto LABEL_18;
      }
LABEL_15:
      v18 = objc_retainAutorelease(v18);
      v27 = 0;
      *a4 = v18;
      goto LABEL_18;
    }
  }
  v32 = v15;
  v22 = objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", &v32);
  v17 = v32;

  if ((v22 & 1) == 0)
  {
    v16 = v10;
    goto LABEL_12;
  }
  v31 = v17;
  v23 = -[COConditionSession _setupBundleAtPath:withError:](self, "_setupBundleAtPath:withError:", v10, &v31);
  v18 = v31;

  if (!v23)
  {
    createConditionInducerError((uint64_t)"-[COConditionSession loadBundleWithPath:andError:]", 567, -1, 0, CFSTR("Failed to load bundle %@."), v24, v25, v26, (uint64_t)v10);
    v28 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v28;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  -[COConditionSession setBundleURL:](self, "setBundleURL:", v10);
  v27 = 1;
LABEL_18:

  return v27;
}

- (BOOL)createStatusBar:(id)a3 conditionClassDescription:(id)a4 withProfileDescription:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  COStatusBar *v17;
  void *v18;
  void *v19;
  COStatusBar *v20;
  void *v21;
  id v22;
  BOOL v23;
  __CFString *v24;
  uint64_t v25;
  uint64_t v27;

  v10 = a3;
  v11 = a4;
  v15 = a5;
  if (v10)
  {
    -[COConditionSession statusBar](self, "statusBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v17 = [COStatusBar alloc];
      -[COConditionSession notifyTeardownBeganCallback](self, "notifyTeardownBeganCallback");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[COConditionSession statusBarPopupFinishedTeardownCallback](self, "statusBarPopupFinishedTeardownCallback");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[COStatusBar initWithConditionClass:profile:teardownBeganCb:teardownCompleteCb:](v17, "initWithConditionClass:profile:teardownBeganCb:teardownCompleteCb:", v11, v15, v18, v19);
      -[COConditionSession setStatusBar:](self, "setStatusBar:", v20);

    }
    -[COConditionSession statusBar](self, "statusBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = 0;
      v23 = 1;
      goto LABEL_11;
    }
    v24 = CFSTR("Failed to intialize status bar with title %@.");
    v27 = (uint64_t)v10;
    v25 = 601;
  }
  else
  {
    v24 = CFSTR("Must supply an action (e.g. running or setting up) for the status bar");
    v25 = 591;
  }
  createConditionInducerError((uint64_t)"-[COConditionSession createStatusBar:conditionClassDescription:withProfileDescription:error:]", v25, -1, 0, v24, v12, v13, v14, v27);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    v22 = objc_retainAutorelease(v22);
    v23 = 0;
    *a6 = v22;
  }
  else
  {
    v23 = 0;
  }
LABEL_11:

  return v23;
}

- (void)freeStatusBar
{
  -[COConditionSession setStatusBar:](self, "setStatusBar:", 0);
}

+ (id)getBootSessionUUID
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v11;
  _OWORD v12[16];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  memset(v12, 0, sizeof(v12));
  v11 = 256;
  if (sysctlbyname("kern.bootsessionuuid", v12, &v11, 0, 0))
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      +[COConditionSession getBootSessionUUID].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)loadConditionCacheWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint8_t buf[8];
  id v42;

  umask(0);
  v4 = open_dprotected_np((const char *)objc_msgSend(CFSTR("/var/mobile/Library/Preferences/com.apple.LoadedConditionInducer.plist"), "fileSystemRepresentation"), 770, 4, 0);
  if ((_DWORD)v4 != -1)
  {
    v5 = v4;
    if (flock(v4, 2))
    {
      createConditionInducerError((uint64_t)"+[COConditionSession loadConditionCacheWithError:]", 656, -1, 0, CFSTR("Failed to lock file."), v6, v7, v8, 438);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      goto LABEL_14;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:", v5);
    v13 = v19;
    if (v19)
    {
      objc_msgSend(v19, "readDataToEndOfFile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v42 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v10, 0, 0, &v42);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v42;
        isNSDictionary(v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          +[COConditionSession removeStaleConditions:](COConditionSession, "removeStaleConditions:", v11);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "isEqualToDictionary:", v11) & 1) != 0)
          {
            v9 = v26;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Stale keys were detected and removed from the condition cache", buf, 2u);
            }
            v40 = v26;
            v31 = +[COConditionSession writeConditionCache:toFileDescriptor:error:](COConditionSession, "writeConditionCache:toFileDescriptor:error:", v12, v5, &v40);
            v9 = v40;

            if (!v31)
            {
              v32 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v32)
                +[COConditionSession loadConditionCacheWithError:].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);
              goto LABEL_14;
            }
          }
          v12 = v12;
          v18 = v12;
LABEL_15:
          flock(v5, 8);
          close(v5);
          if (!a3)
            goto LABEL_18;
          goto LABEL_16;
        }
        createConditionInducerError((uint64_t)"+[COConditionSession loadConditionCacheWithError:]", 677, -1, v26, CFSTR("Failed to serialize property list."), v27, v28, v29, 438);
        v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
        v18 = 0;
        goto LABEL_15;
      }
      createConditionInducerError((uint64_t)"+[COConditionSession loadConditionCacheWithError:]", 668, -1, 0, CFSTR("Failed to read file."), v23, v24, v25, 438);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      createConditionInducerError((uint64_t)"+[COConditionSession loadConditionCacheWithError:]", 662, -1, 0, CFSTR("Failed to intialize file handle."), v20, v21, v22, 438);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = 0;
    }
    v11 = 0;
    v12 = 0;
    goto LABEL_14;
  }
  __error();
  v14 = __error();
  strerror(*v14);
  createConditionInducerError((uint64_t)"+[COConditionSession loadConditionCacheWithError:]", 650, -1, 0, CFSTR("Failed to open %@: %d (%s)"), v15, v16, v17, (uint64_t)CFSTR("/var/mobile/Library/Preferences/com.apple.LoadedConditionInducer.plist"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v13 = 0;
  v12 = 0;
  v11 = 0;
  v10 = 0;
  if (!a3)
    goto LABEL_18;
LABEL_16:
  if (!v18)
    *a3 = objc_retainAutorelease(v9);
LABEL_18:

  return v18;
}

+ (BOOL)writeConditionCache:(id)a3 toFileDescriptor:(int)a4 error:(id *)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  ssize_t v13;
  BOOL v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  id v21;

  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 100, 0, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  if (v7)
  {
    lseek(a4, 0, 0);
    v12 = objc_retainAutorelease(v7);
    v13 = write(a4, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
    if (v13 == objc_msgSend(v12, "length"))
    {
      v14 = 1;
      goto LABEL_9;
    }
    v15 = CFSTR("Failed to write file.");
    v16 = 720;
    v17 = 0;
  }
  else
  {
    v15 = CFSTR("Failed to serialize property list.");
    v16 = 714;
    v17 = v11;
  }
  createConditionInducerError((uint64_t)"+[COConditionSession writeConditionCache:toFileDescriptor:error:]", v16, -1, v17, v15, v8, v9, v10, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    v11 = objc_retainAutorelease(v18);
    v14 = 0;
    *a5 = v11;
  }
  else
  {
    v14 = 0;
    v11 = v18;
  }
LABEL_9:

  return v14;
}

- (id)copyLoadedConditionClassName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[COConditionSession loadConditionCacheWithError:](COConditionSession, "loadConditionCacheWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[COConditionSession bundle](self, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundlePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)removeStaleConditions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  +[COConditionSession getBootSessionUUID](COConditionSession, "getBootSessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v3, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v20)
  {
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v7 = 138412802;
    v19 = v7;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10, v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("ConditionCacheClassBootUUID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && objc_msgSend(v5, "compare:options:", v12, 1))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ConditionCacheClassBootUUID"));
            v13 = v8;
            v14 = v6;
            v15 = v3;
            v16 = v4;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v26 = v5;
            v27 = 2112;
            v28 = v10;
            v29 = 2112;
            v30 = v17;
            _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "The current boot sesssion is %@. Condition %@ was induced in a previous boot session (%@) and is now no longer running. Removing from cache", buf, 0x20u);

            v4 = v16;
            v3 = v15;
            v6 = v14;
            v8 = v13;
          }
        }
        else
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);
        }

      }
      v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v20);
  }

  return v4;
}

+ (BOOL)updateConditionCache:(BOOL)a3 forCondition:(id)a4 additionalArguments:(id)a5 conditionBundle:(id)a6 error:(id *)a7
{
  _BOOL4 v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  __CFString *v32;
  uint64_t v33;
  int *v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  BOOL v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const __CFString *v71;
  id v72;
  id v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16 = a6;
  if (!v11)
  {
    v32 = CFSTR("Invalid input.");
    v33 = 773;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Preferences/com.apple.LoadedConditionInducer.plist"));

  umask(0);
  v19 = open_dprotected_np((const char *)objc_msgSend(CFSTR("/var/mobile/Library/Preferences/com.apple.LoadedConditionInducer.plist"), "fileSystemRepresentation"), 770, 4, 0);
  if ((_DWORD)v19 == -1)
  {
    __error();
    v34 = __error();
    strerror(*v34);
    v32 = CFSTR("Failed to open %@: %d (%s)");
    v71 = CFSTR("/var/mobile/Library/Preferences/com.apple.LoadedConditionInducer.plist");
    v33 = 786;
LABEL_10:
    createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", v33, -1, 0, v32, v13, v14, v15, (uint64_t)v71);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v31) = 0;
    if (!a7)
      goto LABEL_13;
    goto LABEL_11;
  }
  v20 = v19;
  v80 = v12;
  v81 = v16;
  v79 = a7;
  if (flock(v19, 6))
  {
    createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", 792, -1, 0, CFSTR("Failed to lock file."), v21, v22, v23, 438);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
LABEL_5:
    v30 = 0;
    LOBYTE(v31) = 0;
    goto LABEL_6;
  }
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:", v20);
  v31 = (uint64_t)v36;
  if (!v36)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", 798, -1, 0, CFSTR("Failed to initialize file handle."), v37, v38, v39, 438);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_6;
  }
  if (!v18)
  {
    v44 = 0;
    v78 = 0;
LABEL_22:
    v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (v29)
    {
      v76 = 0;
      v77 = (void *)v31;
      goto LABEL_24;
    }
    createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", 826, -1, 0, CFSTR("Failed to intialize dictionary."), v48, v49, v50, 438);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    v28 = 0;
    v26 = (void *)v31;
LABEL_50:
    v30 = 0;
    LOBYTE(v31) = 0;
    v25 = v78;
    goto LABEL_6;
  }
  objc_msgSend(v36, "readDataToEndOfFile");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", 805, -1, 0, CFSTR("Failed to read file."), v40, v41, v42, 438);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v27 = 0;
    v28 = 0;
    v26 = (void *)v31;
    goto LABEL_5;
  }
  v84 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v29, 0, 0, &v84);
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = v84;
  v78 = v29;
  if (!v43)
    goto LABEL_22;
  v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v43);
  if (!v29)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", 817, -1, 0, CFSTR("Failed to intialize dictionary."), v45, v46, v47, 438);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    v28 = 0;
    v26 = (void *)v31;
    v27 = (void *)v43;
    goto LABEL_50;
  }
  v76 = (void *)v43;
  v77 = (void *)v31;
LABEL_24:
  objc_msgSend(v11, "identifierName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    objc_msgSend(v16, "bundlePath");
    v73 = v44;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "lastPathComponent");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringByDeletingPathExtension");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v73;
  }
  if (+[COConditionSession conditionIsBundledWithFramework:](COConditionSession, "conditionIsBundledWithFramework:", v30))
  {
    v83 = v44;
    +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", v30, &v83);
    v53 = v44;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v83;

    if (v54)
      v74 = objc_msgSend(v11, "persistsAfterRebootFromDict:", v54);
    else
      v74 = 1;

    v44 = v72;
  }
  else
  {
    v74 = objc_msgSend(v11, "persistsAfterReboot");
  }
  +[COConditionSession removeStaleConditions:](COConditionSession, "removeStaleConditions:", v29);
  v31 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (!v29)
    {
      createConditionInducerError((uint64_t)"+[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:]", 851, -1, 0, CFSTR("Failed to initialize dictionary."), v55, v56, v57, 438);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      v28 = (void *)v31;
      LOBYTE(v31) = 0;
      v26 = v77;
      v25 = v78;
      v27 = v76;
      goto LABEL_6;
    }
    v58 = (void *)v31;
    v59 = (objc_class *)objc_opt_class();
    NSStringFromClass(v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v60, CFSTR("ConditionCacheClassName"));

    if ((v74 & 1) == 0)
    {
      +[COConditionSession getBootSessionUUID](COConditionSession, "getBootSessionUUID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v61, CFSTR("ConditionCacheClassBootUUID"));

    }
    if (v12)
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v12, CFSTR("ConditionCacheClassArguments"));
    v31 = (uint64_t)v58;
    objc_msgSend(v58, "setObject:forKeyedSubscript:", v29, v30);
  }
  else
  {
    objc_msgSend((id)v31, "removeObjectForKey:", v30);
    v29 = 0;
  }
  v82 = v44;
  v75 = (void *)v31;
  v62 = +[COConditionSession writeConditionCache:toFileDescriptor:error:](COConditionSession, "writeConditionCache:toFileDescriptor:error:", v31, v20, &v82);
  v24 = v82;

  if (v62)
  {
    LOBYTE(v31) = 1;
  }
  else
  {
    v63 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v63)
      +[COConditionSession updateConditionCache:forCondition:additionalArguments:conditionBundle:error:].cold.1(v63, v64, v65, v66, v67, v68, v69, v70);
    LOBYTE(v31) = 0;
  }
  v26 = v77;
  v25 = v78;
  v28 = v75;
  v27 = v76;
LABEL_6:
  flock(v20, 8);
  close(v20);

  v12 = v80;
  v16 = v81;
  a7 = v79;
  if (!v79)
    goto LABEL_13;
LABEL_11:
  if ((v31 & 1) == 0)
    *a7 = objc_retainAutorelease(v24);
LABEL_13:

  return v31;
}

+ (id)prepareInfoDictForBuiltInCondition:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v22;
  id v23;

  v5 = a3;
  +[COConditionSession loadInformationDict](COConditionSession, "loadInformationDict");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    createConditionInducerError((uint64_t)"+[COConditionSession prepareInfoDictForBuiltInCondition:error:]", 901, -1, 0, CFSTR("Failed to load Info.plist from COCondtionSession"), v6, v7, v8, v22);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v15 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SupportedConditionData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v23 = 0;
    +[COConditionSession _loadExternalConditionBundleInfo:supportedConditionData:error:](COConditionSession, "_loadExternalConditionBundleInfo:supportedConditionData:error:", v5, v11, &v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v23;
    if (!v15)
    {
      createConditionInducerError((uint64_t)"+[COConditionSession prepareInfoDictForBuiltInCondition:error:]", 913, -1, v19, CFSTR("Unable to load data for %@"), v16, v17, v18, (uint64_t)v5);
      v20 = objc_claimAutoreleasedReturnValue();

      v19 = (id)v20;
      if (!a4)
        goto LABEL_10;
      goto LABEL_8;
    }
LABEL_7:
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  createConditionInducerError((uint64_t)"+[COConditionSession prepareInfoDictForBuiltInCondition:error:]", 907, -1, 0, CFSTR("Failed to load supported condition data from COCondtionSession"), v12, v13, v14, v22);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if (!a4)
    goto LABEL_10;
LABEL_8:
  if (v19)
    *a4 = objc_retainAutorelease(v19);
LABEL_10:

  return v15;
}

+ (id)loadInformationDict
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[COConditionSession loadInformationDict].cold.1();
    v4 = 0;
  }

  return v4;
}

+ (id)conditionsBundledWithFramework
{
  void *v2;
  void *v3;
  void *v4;

  +[COConditionSession loadInformationDict](COConditionSession, "loadInformationDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SupportedConditionsiOS");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[COConditionSession conditionsBundledWithFramework].cold.1();
    v4 = 0;
  }

  return v4;
}

+ (BOOL)conditionIsBundledWithFramework:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  +[COConditionSession conditionsBundledWithFramework](COConditionSession, "conditionsBundledWithFramework");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v3);

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (COConditionSession)initWithConditionIdentifier:(id)a3 profile:(id)a4
{
  return -[COConditionSession initWithConditionIdentifier:profile:additionalArgs:](self, "initWithConditionIdentifier:profile:additionalArgs:", a3, a4, 0);
}

- (COConditionSession)initWithConditionIdentifier:(id)a3 profile:(id)a4 additionalArgs:(id)a5
{
  id v9;
  id v10;
  id v11;
  COConditionSession *v12;
  COConditionSession *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  COConditionSession *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *setUpQueue;
  dispatch_queue_t v33;
  OS_dispatch_queue *tearDownQueue;
  objc_super v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)COConditionSession;
  v12 = -[COConditionSession init](&v36, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_12;
  objc_storeStrong((id *)&v12->_selectedCondition, a3);
  objc_storeStrong((id *)&v13->_selectedProfile, a4);
  if (!v9 || !v10)
  {
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v22)
      -[COConditionSession initWithConditionIdentifier:profile:additionalArgs:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_10;
  }
  if ((objc_msgSend(v9, "containsString:", CFSTR("/")) & 1) == 0
    && !objc_msgSend(v10, "containsString:", CFSTR("/")))
  {
    objc_storeStrong((id *)&v13->_additionalArguments, a5);
    v31 = dispatch_queue_create("com.apple.ConditionInducerFramework.setUp", 0);
    setUpQueue = v13->_setUpQueue;
    v13->_setUpQueue = (OS_dispatch_queue *)v31;

    v33 = dispatch_queue_create("com.apple.ConditionInducerFramework.tearDown", 0);
    tearDownQueue = v13->_tearDownQueue;
    v13->_tearDownQueue = (OS_dispatch_queue *)v33;

LABEL_12:
    v30 = v13;
    goto LABEL_13;
  }
  v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v14)
    -[COConditionSession initWithConditionIdentifier:profile:additionalArgs:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_10:
  v30 = 0;
LABEL_13:

  return v30;
}

- (void)dealloc
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_21F8CF000, MEMORY[0x24BDACB70], v0, "Failed to tear down condition: %{public}@ (%{public}@)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_9();
}

void __29__COConditionSession_dealloc__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)listAvailableConditions
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  int *v25;
  uint64_t v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint8_t v42[4];
  int v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/AppleInternal/Tests/com.apple.ConditionInducer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[COConditionSession getBundleURLsAtPath:](COConditionSession, "getBundleURLsAtPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    v25 = &v43;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        +[COConditionSession bundleToDict:](COConditionSession, "bundleToDict:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v9, "path");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("ConditionCacheBundlePath"));

          objc_msgSend(v10, "addEntriesFromDictionary:", v11);
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          +[COConditionSession listAvailableConditions].cold.2(v42, (uint64_t)v9, v25);
        }
        objc_msgSend(v2, "addObject:", v10, v25);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    }
    while (v6);
  }

  +[COConditionSession conditionsBundledWithFramework](COConditionSession, "conditionsBundledWithFramework");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      v18 = MEMORY[0x24BDACB70];
      v26 = 138412546;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
          v28 = 0;
          +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", v20, &v28, v26);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v28;
          if (v22)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v22, "description");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v26;
              v38 = v20;
              v39 = 2112;
              v40 = v23;
              _os_log_error_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Encountered an error loading externally-supported condition %@ from framework: %@", buf, 0x16u);

              v18 = MEMORY[0x24BDACB70];
            }
          }
          else
          {
            objc_msgSend(v2, "addObject:", v21);
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v16);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[COConditionSession listAvailableConditions].cold.1();
  }

  return v2;
}

+ (id)getActiveConditions
{
  void *v2;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    +[COConditionSession getActiveConditions].cold.2();
  +[COConditionSession loadConditionCacheWithError:](COConditionSession, "loadConditionCacheWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    +[COConditionSession getActiveConditions].cold.1();
  return v2;
}

+ (void)logSignpostWithConditionStates
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[COConditionSession getActiveConditions](COConditionSession, "getActiveConditions");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x24BDBD1B8];
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.cltm"));
  if (!v4)
    v4 = objc_alloc_init(MEMORY[0x24BDBCF50]);
  _copySignpostLowSeverityLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    objc_msgSend(v4, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_21F8CF000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConditionsStateSignpost", "Active Conditions: %{public}@\ncltm settings: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

- (BOOL)hasActiveCondition
{
  void *v2;
  void *v3;
  BOOL v4;

  +[COConditionSession getActiveConditions](COConditionSession, "getActiveConditions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "count") != 0;
  else
    v4 = 0;

  return v4;
}

- (BOOL)startConditionWithCallback:(id)a3
{
  return -[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:](self, "startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:", a3, 0, 0);
}

- (BOOL)startConditionWithCallback:(id)a3 andStatusBarNotificationCallback:(id)a4
{
  return -[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:](self, "startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:", a3, 0, a4);
}

- (BOOL)startConditionWithCallback:(id)a3 teardownStartedCallback:(id)a4 teardownFinishedCallback:(id)a5
{
  void *v8;
  id statusBarPopupFinishedTeardownCallback;
  void *v10;
  id notifyTeardownBeganCallback;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  id *v17;
  BOOL v18;
  void *v19;
  id *v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t i;
  NSString *v37;
  Class v38;
  void *v39;
  void *v40;
  NSString *v41;
  objc_class *v42;
  id v43;
  void *v44;
  _BOOL4 v45;
  NSObject *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  BOOL v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  dispatch_block_t block;
  void *v78;
  id v79;
  id v80;
  void (**v81)(id, _QWORD);
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id obj;
  id v87;
  id v88;
  _QWORD v89[7];
  _QWORD v90[5];
  id v91;
  uint64_t v92;
  _QWORD v93[4];
  id v94;
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  void *v98;
  uint8_t v99[4];
  uint64_t v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v81 = (void (**)(id, _QWORD))a3;
  v79 = a4;
  v80 = a5;
  v92 = 0;
  v93[0] = &v92;
  v93[1] = 0x3032000000;
  v93[2] = __Block_byref_object_copy__0;
  v93[3] = __Block_byref_object_dispose__0;
  v94 = 0;
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x3032000000;
  v90[3] = __Block_byref_object_copy__0;
  v90[4] = __Block_byref_object_dispose__0;
  v91 = 0;
  v89[0] = MEMORY[0x24BDAC760];
  v89[1] = 3221225472;
  v89[2] = __98__COConditionSession_startConditionWithCallback_teardownStartedCallback_teardownFinishedCallback___block_invoke;
  v89[3] = &unk_24E4712A0;
  v89[4] = self;
  v89[5] = v90;
  v89[6] = &v92;
  block = (dispatch_block_t)MEMORY[0x2207CD70C](v89);
  v8 = (void *)MEMORY[0x2207CD70C](v80);
  statusBarPopupFinishedTeardownCallback = self->_statusBarPopupFinishedTeardownCallback;
  self->_statusBarPopupFinishedTeardownCallback = v8;

  v10 = (void *)MEMORY[0x2207CD70C](v79);
  notifyTeardownBeganCallback = self->_notifyTeardownBeganCallback;
  self->_notifyTeardownBeganCallback = v10;

  -[COConditionSession selectedCondition](self, "selectedCondition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[COConditionSession conditionIsBundledWithFramework:](COConditionSession, "conditionIsBundledWithFramework:", v12);

  if ((a4 & 1) == 0)
  {
    -[COConditionSession selectedCondition](self, "selectedCondition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id *)(v93[0] + 40);
    v88 = *(id *)(v93[0] + 40);
    v18 = -[COConditionSession loadBundleWithPath:andError:](self, "loadBundleWithPath:andError:", v16, &v88);
    objc_storeStrong(v17, v88);

    if (v18)
    {
      -[COConditionSession selectedProfile](self, "selectedProfile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id *)(v93[0] + 40);
      v87 = *(id *)(v93[0] + 40);
      v21 = -[COConditionSession loadProfileForBundle:withError:](self, "loadProfileForBundle:withError:", v19, &v87);
      objc_storeStrong(v20, v87);

      v78 = 0;
      if (v21)
        goto LABEL_25;
LABEL_41:
      v69 = 0;
      goto LABEL_42;
    }
LABEL_9:
    v78 = 0;
    goto LABEL_41;
  }
  -[COConditionSession selectedCondition](self, "selectedCondition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id *)(v93[0] + 40);
  obj = *(id *)(v93[0] + 40);
  +[COConditionSession prepareInfoDictForBuiltInCondition:error:](COConditionSession, "prepareInfoDictForBuiltInCondition:error:", v13, &obj);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v14, obj);

  if (!v78)
  {
    v22 = *(void **)(v93[0] + 40);
    -[COConditionSession selectedCondition](self, "selectedCondition");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    createConditionInducerError((uint64_t)"-[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:]", 1124, -1, v22, CFSTR("Unable to load data for %@"), v24, v25, v26, (uint64_t)v23);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(v93[0] + 40);
    *(_QWORD *)(v93[0] + 40) = v27;

    goto LABEL_9;
  }
  objc_msgSend(v78, "valueForKey:", CFSTR("ConditionIsDestructive"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[COConditionSession setWarning:](self, "setWarning:", CFSTR("WARNING! - This condition should only be used on test devices as it can change your data"));
  }
  else
  {
    -[COConditionSession warning](self, "warning");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length") == 0;

    if (v30)
      -[COConditionSession setWarning:](self, "setWarning:", 0);
  }
  v31 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[COConditionSession setClassDict:](self, "setClassDict:", v31);

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  objc_msgSend(v78, "objectForKey:", CFSTR("ConditionBundleDict"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v82, v101, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v83;
    v35 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v83 != v34)
          objc_enumerationMutation(v32);
        v37 = *(NSString **)(*((_QWORD *)&v82 + 1) + 8 * i);
        v38 = NSClassFromString(v37);
        if (v38)
        {
          -[COConditionSession classDict](self, "classDict");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[objc_class description](v38, "description");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setValue:forKey:", v40, v37);

        }
        else if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          -[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:].cold.2(v99, (uint64_t)v37, &v100);
        }
      }
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v82, v101, 16);
    }
    while (v33);
  }

  -[COConditionSession selectedProfile](self, "selectedProfile");
  v41 = (NSString *)objc_claimAutoreleasedReturnValue();
  v42 = NSClassFromString(v41);

  if (!v42)
  {
    -[COConditionSession selectedProfile](self, "selectedProfile");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    createConditionInducerError((uint64_t)"-[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:]", 1149, -1, 0, CFSTR("Failed to load framework class %@"), v61, v62, v63, (uint64_t)v60);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = *(void **)(v93[0] + 40);
    *(_QWORD *)(v93[0] + 40) = v64;

    goto LABEL_41;
  }
  v43 = objc_alloc_init(v42);
  -[COConditionSession setCondition:](self, "setCondition:", v43);

  -[COConditionSession condition](self, "condition");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44 == 0;

  if (v45)
  {
    -[COConditionSession selectedProfile](self, "selectedProfile");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    createConditionInducerError((uint64_t)"-[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:]", 1156, -1, 0, CFSTR("Failed to instantiate framework class %@"), v71, v72, v73, (uint64_t)v70);
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = *(void **)(v93[0] + 40);
    *(_QWORD *)(v93[0] + 40) = v74;

    goto LABEL_41;
  }
LABEL_25:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Running Setup", buf, 2u);
  }
  _copySignpostLowSeverityLogHandle();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v46))
  {
    -[COConditionSession selectedCondition](self, "selectedCondition");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[COConditionSession selectedProfile](self, "selectedProfile");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v96 = v47;
    v97 = 2114;
    v98 = v48;
    _os_signpost_emit_with_name_impl(&dword_21F8CF000, v46, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "induce-setup", "%{public}@ %{public}@", buf, 0x16u);

  }
  -[COConditionSession setUpQueue](self, "setUpQueue");
  v49 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v49, block);

  _copySignpostLowSeverityLogHandle();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v50))
  {
    -[COConditionSession selectedCondition](self, "selectedCondition");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[COConditionSession selectedProfile](self, "selectedProfile");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v96 = v51;
    v97 = 2114;
    v98 = v52;
    _os_signpost_emit_with_name_impl(&dword_21F8CF000, v50, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "induce-setup", "%{public}@ %{public}@", buf, 0x16u);

  }
  if (*(_QWORD *)(v93[0] + 40))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:].cold.1((uint64_t)v93, v53, v54, v55, v56, v57, v58, v59);
    goto LABEL_41;
  }
  _copySignpostLowSeverityLogHandle();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v66))
  {
    -[COConditionSession selectedCondition](self, "selectedCondition");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[COConditionSession selectedProfile](self, "selectedProfile");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v96 = v67;
    v97 = 2114;
    v98 = v68;
    _os_signpost_emit_with_name_impl(&dword_21F8CF000, v66, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "induce", "%{public}@ %{public}@", buf, 0x16u);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Setup Complete... Condition Running", buf, 2u);
  }
  v69 = 1;
LABEL_42:
  if (v81)
    v81[2](v81, *(_QWORD *)(v93[0] + 40));

  _Block_object_dispose(v90, 8);
  _Block_object_dispose(&v92, 8);

  return v69;
}

void __98__COConditionSession_startConditionWithCallback_teardownStartedCallback_teardownFinishedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  id obj;

  v2 = objc_msgSend(*(id *)(a1 + 32), "copyLoadedConditionClassName");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v5, "selectedCondition");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    createConditionInducerError((uint64_t)"-[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:]_block_invoke", 1103, -1, 0, CFSTR("Condition is already running: %@ %@"), v6, v7, v8, (uint64_t)v21);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v12 + 40);
    v13 = objc_msgSend(v5, "setUpWithError:", &obj);
    objc_storeStrong((id *)(v12 + 40), obj);
    if ((v13 & 1) == 0)
    {
      createConditionInducerError((uint64_t)"-[COConditionSession startConditionWithCallback:teardownStartedCallback:teardownFinishedCallback:]_block_invoke", 1105, -1, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("Setup failed."), v14, v15, v16, v20);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
  }
}

- (BOOL)stopConditionWithCallback:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v18[6];
  uint8_t v19[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    +[COConditionSession getActiveConditions](COConditionSession, "getActiveConditions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Tearing down active condition before we destroy the object: %@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  _copySignpostLowSeverityLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    -[COConditionSession selectedCondition](self, "selectedCondition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[COConditionSession selectedProfile](self, "selectedProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v19 = 138543618;
    v20 = v7;
    v21 = 2114;
    v22 = v8;
    _os_signpost_emit_with_name_impl(&dword_21F8CF000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "induce-teardown", "%{public}@ %{public}@", v19, 0x16u);

  }
  -[COConditionSession tearDownQueue](self, "tearDownQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __48__COConditionSession_stopConditionWithCallback___block_invoke;
  v18[3] = &unk_24E471318;
  v18[4] = self;
  v18[5] = &buf;
  dispatch_sync(v9, v18);

  -[COConditionSession setUpQueue](self, "setUpQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v10, &__block_literal_global_1);

  _copySignpostLowSeverityLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    -[COConditionSession selectedCondition](self, "selectedCondition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[COConditionSession selectedProfile](self, "selectedProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v19 = 138543618;
    v20 = v12;
    v21 = 2114;
    v22 = v13;
    _os_signpost_emit_with_name_impl(&dword_21F8CF000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "induce-teardown", "%{public}@ %{public}@", v19, 0x16u);

  }
  _copySignpostLowSeverityLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    -[COConditionSession selectedCondition](self, "selectedCondition");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[COConditionSession selectedProfile](self, "selectedProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v19 = 138543618;
    v20 = v15;
    v21 = 2114;
    v22 = v16;
    _os_signpost_emit_with_name_impl(&dword_21F8CF000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "induce", "%{public}@ %{public}@", v19, 0x16u);

  }
  if (v4 && *(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    v4[2](v4);
  _Block_object_dispose(&buf, 8);

  return 1;
}

void __48__COConditionSession_stopConditionWithCallback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "tearDownWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0)
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "code");
    createConditionInducerError((uint64_t)"-[COConditionSession stopConditionWithCallback:]_block_invoke", 1198, v5, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("Teardown failed."), v6, v7, v8, v12);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

+ (BOOL)tearDownAllConditionsWithErrors:(id *)a3
{
  uint64_t v3;
  char v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  COConditionSession *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id *v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  uint64_t v31;
  id obj;
  id v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[6];
  id v38;
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  +[COConditionSession getActiveConditions](COConditionSession, "getActiveConditions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v36, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (!v3)
  {

    v4 = 1;
    goto LABEL_25;
  }
  v4 = 1;
  v35 = *(_QWORD *)v47;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v47 != v35)
        objc_enumerationMutation(obj);
      v6 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
      v40 = 0;
      v41 = &v40;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__0;
      v44 = __Block_byref_object_dispose__0;
      v45 = 0;
      objc_msgSend(v36, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("ConditionCacheClassName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("ConditionCacheClassArguments"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        createConditionInducerError((uint64_t)"+[COConditionSession tearDownAllConditionsWithErrors:]", 1265, -1, 0, CFSTR("Missing subclass info for %@, skipping teardown"), v9, v10, v11, v6);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v41[5];
        v41[5] = v17;

        objc_msgSend(v34, "setObject:forKey:", v41[5], v6);
        v4 = 0;
        goto LABEL_20;
      }
      v16 = -[COConditionSession initWithConditionIdentifier:profile:additionalArgs:]([COConditionSession alloc], "initWithConditionIdentifier:profile:additionalArgs:", v6, v8, v12);
      if (!v16)
      {
        createConditionInducerError((uint64_t)"+[COConditionSession tearDownAllConditionsWithErrors:]", 1235, -1, 0, CFSTR("Failed to instantiate condition session for conditionKey:%@ profile:%@ args:%@"), v13, v14, v15, v6);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v41[5];
        v41[5] = v19;

        objc_msgSend(v34, "setObject:forKey:", v41[5], v6);
LABEL_18:
        v4 = 0;
        goto LABEL_19;
      }
      if (+[COConditionSession conditionIsBundledWithFramework:](COConditionSession, "conditionIsBundledWithFramework:", v6))
      {
LABEL_9:
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __54__COConditionSession_tearDownAllConditionsWithErrors___block_invoke;
        v37[3] = &unk_24E471488;
        v37[4] = v6;
        v37[5] = &v40;
        -[COConditionSession stopConditionWithCallback:](v16, "stopConditionWithCallback:", v37);
        goto LABEL_16;
      }
      v21 = (id *)(v41 + 5);
      v39 = (id)v41[5];
      v22 = -[COConditionSession loadBundleWithPath:andError:](v16, "loadBundleWithPath:andError:", v6, &v39);
      objc_storeStrong(v21, v39);
      if (v22)
      {
        v26 = (id *)(v41 + 5);
        v38 = (id)v41[5];
        v27 = -[COConditionSession loadProfileForBundle:withError:](v16, "loadProfileForBundle:withError:", v8, &v38);
        objc_storeStrong(v26, v38);
        if (v27)
          goto LABEL_9;
      }
      else
      {
        createConditionInducerError((uint64_t)"+[COConditionSession tearDownAllConditionsWithErrors:]", 1247, -1, 0, CFSTR("Failed to load bundle"), v23, v24, v25, v31);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKey:", v28, v6);

        v4 = 0;
      }
LABEL_16:
      v29 = v41[5];
      if (v29)
      {
        objc_msgSend(v34, "setObject:forKey:", v29, v6);
        goto LABEL_18;
      }
LABEL_19:

LABEL_20:
      _Block_object_dispose(&v40, 8);

    }
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  }
  while (v3);

  if (!((a3 == 0) | v4 & 1))
  {
    v4 = 0;
    *a3 = objc_retainAutorelease(v34);
  }
LABEL_25:

  return v4 & 1;
}

void __54__COConditionSession_tearDownAllConditionsWithErrors___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (objc_msgSend(v4, "code") == -10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "No need to tear down %@ because it's not running", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (NSString)selectedCondition
{
  return self->_selectedCondition;
}

- (NSString)selectedProfile
{
  return self->_selectedProfile;
}

- (NSArray)additionalArguments
{
  return self->_additionalArguments;
}

- (COCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_storeStrong((id *)&self->_condition, a3);
}

- (COConditionBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (NSMutableDictionary)classDict
{
  return self->_classDict;
}

- (void)setClassDict:(id)a3
{
  objc_storeStrong((id *)&self->_classDict, a3);
}

- (NSString)warning
{
  return self->_warning;
}

- (void)setWarning:(id)a3
{
  objc_storeStrong((id *)&self->_warning, a3);
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_bundleURL, a3);
}

- (COStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setStatusBar:(id)a3
{
  objc_storeStrong((id *)&self->_statusBar, a3);
}

- (OS_dispatch_queue)setUpQueue
{
  return self->_setUpQueue;
}

- (void)setSetUpQueue:(id)a3
{
  objc_storeStrong((id *)&self->_setUpQueue, a3);
}

- (OS_dispatch_queue)tearDownQueue
{
  return self->_tearDownQueue;
}

- (void)setTearDownQueue:(id)a3
{
  objc_storeStrong((id *)&self->_tearDownQueue, a3);
}

- (id)statusBarPopupFinishedTeardownCallback
{
  return self->_statusBarPopupFinishedTeardownCallback;
}

- (void)setStatusBarPopupFinishedTeardownCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)notifyTeardownBeganCallback
{
  return self->_notifyTeardownBeganCallback;
}

- (void)setNotifyTeardownBeganCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyTeardownBeganCallback, 0);
  objc_storeStrong(&self->_statusBarPopupFinishedTeardownCallback, 0);
  objc_storeStrong((id *)&self->_tearDownQueue, 0);
  objc_storeStrong((id *)&self->_setUpQueue, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_warning, 0);
  objc_storeStrong((id *)&self->_classDict, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_additionalArguments, 0);
  objc_storeStrong((id *)&self->_selectedProfile, 0);
  objc_storeStrong((id *)&self->_selectedCondition, 0);
}

- (void)userFriendlyNameForSelectedCondition
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "selectedCondition");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "Unable to find a class named %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)userFriendlyNameForSelectedProfile
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "selectedProfile");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "Unable to find a class named %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

+ (void)bundleToDict:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Must supply a bundle URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

+ (void)bundleToDict:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "Failed to intialize bundle for %@.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

+ (void)bundleToDict:.cold.3()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_2_1(v0);
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "No Principal class set for %@?? Bad!", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

+ (void)bundleToDict:(void *)a1 .cold.4(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_21F8CF000, MEMORY[0x24BDACB70], v4, "Failed to load bundle for %@, got error %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)getBootSessionUUID
{
  OUTLINED_FUNCTION_4(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Failed to get a kernel boot session UUID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

+ (void)loadConditionCacheWithError:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Failed to update the condition cache after cleaning", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

+ (void)updateConditionCache:(uint64_t)a3 forCondition:(uint64_t)a4 additionalArguments:(uint64_t)a5 conditionBundle:(uint64_t)a6 error:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Failed to write condition cache to file", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

+ (void)loadInformationDict
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_2_1(v0);
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "Failed to load Info bundle for %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

+ (void)conditionsBundledWithFramework
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_2_1(v0);
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "Failed to load Info bundle dictionary for %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConditionIdentifier:(uint64_t)a3 profile:(uint64_t)a4 additionalArgs:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "You may not pass paths as the condition or profile. See results of listAvailableConditions for valid invocations", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)initWithConditionIdentifier:(uint64_t)a3 profile:(uint64_t)a4 additionalArgs:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Must provide non-nil values for condition and profile!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

+ (void)listAvailableConditions
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_1(&dword_21F8CF000, MEMORY[0x24BDACB70], (uint64_t)a3, "Failed to load a valid bundle for %@", a1);
}

+ (void)getActiveConditions
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "GETTING Loaded Conditions", v0, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)startConditionWithCallback:(uint64_t)a3 teardownStartedCallback:(uint64_t)a4 teardownFinishedCallback:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Failed to set up condition: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)startConditionWithCallback:(uint8_t *)a1 teardownStartedCallback:(uint64_t)a2 teardownFinishedCallback:(_QWORD *)a3 .cold.2(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_1(&dword_21F8CF000, MEMORY[0x24BDACB70], (uint64_t)a3, "Failed to load class from name: %@", a1);
}

@end
