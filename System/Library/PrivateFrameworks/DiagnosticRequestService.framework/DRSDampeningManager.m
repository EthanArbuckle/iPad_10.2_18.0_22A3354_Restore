@implementation DRSDampeningManager

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[DRSDampeningManager enforcementSettings](self, "enforcementSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Enforcement settings:\n%@\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DRSDampeningManager defaultSignatureConfiguration](self, "defaultSignatureConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DRSDampeningManager defaultSignatureConfiguration](self, "defaultSignatureConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Default signature configuration:\n--------------------------\n%@\n"), v9);

  }
  -[DRSDampeningManager teamDampeningConfigDict](self, "teamDampeningConfigDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    objc_msgSend(v6, "appendString:", CFSTR("Team Dampening Configuration(s):\n**************************\n\n"));
    -[DRSDampeningManager teamDampeningConfigDict](self, "teamDampeningConfigDict");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __39__DRSDampeningManager_debugDescription__block_invoke;
    v21[3] = &unk_1EA3D2BE0;
    v22 = v6;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v21);

  }
  -[DRSDampeningManager resourceDampeningConfigDict](self, "resourceDampeningConfigDict");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(v6, "appendString:", CFSTR("Resource Dampening Configuration(s):\n**************************\n\n"));
    -[DRSDampeningManager resourceDampeningConfigDict](self, "resourceDampeningConfigDict");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __39__DRSDampeningManager_debugDescription__block_invoke_2;
    v19[3] = &unk_1EA3D2B68;
    v20 = v6;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v19);

  }
  if (-[DRSDampeningManager totalCap](self, "totalCap") == 0x7FFFFFFF)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Total request cap: %@\n"), CFSTR("<No cap>"));
    objc_msgSend(v6, "appendString:", v17);

  }
  else
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("Total request cap: %lu\n"), -[DRSDampeningManager totalCap](self, "totalCap"));
  }
  return v6;
}

void __39__DRSDampeningManager_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "debugDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@:\n--------------------------\n%@"), v5, v6);

}

void __39__DRSDampeningManager_debugDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "debugDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@:\n--------------------------\n%@"), v5, v6);

}

- (id)jsonCompatibleDictRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[DRSDampeningManager enforcementSettings](self, "enforcementSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsonCompatibleDictRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("EnforcementSettings"));

  -[DRSDampeningManager defaultSignatureConfiguration](self, "defaultSignatureConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsonCompatibleDictRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("DefaultSignatureConfig"));

  if (-[DRSDampeningManager totalCap](self, "totalCap") == 0x7FFFFFFF)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("<No cap>"), CFSTR("TotalCap"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DRSDampeningManager totalCap](self, "totalCap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("TotalCap"));

  }
  -[DRSDampeningManager teamDampeningConfigDict](self, "teamDampeningConfigDict");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[DRSDampeningManager teamDampeningConfigDict](self, "teamDampeningConfigDict");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __55__DRSDampeningManager_jsonCompatibleDictRepresentation__block_invoke;
    v24[3] = &unk_1EA3D2BE0;
    v25 = v11;
    v13 = v11;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v24);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("TeamDampeningConfigurations"));
  }
  -[DRSDampeningManager resourceDampeningConfigDict](self, "resourceDampeningConfigDict");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[DRSDampeningManager resourceDampeningConfigDict](self, "resourceDampeningConfigDict");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    v20 = 3221225472;
    v21 = __55__DRSDampeningManager_jsonCompatibleDictRepresentation__block_invoke_2;
    v22 = &unk_1EA3D2B68;
    v23 = v15;
    v17 = v15;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", &v19);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("ResourceDampeningConfigurations"), v19, v20, v21, v22);
  }
  return v3;
}

void __55__DRSDampeningManager_jsonCompatibleDictRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "jsonCompatibleDictRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __55__DRSDampeningManager_jsonCompatibleDictRepresentation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "jsonCompatibleDictRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

+ (id)_entityName
{
  return CFSTR("DRSDampeningManagerMO");
}

- (BOOL)isEqualToDampeningManager:(id)a3
{
  DRSDampeningManager *v4;
  DRSDampeningManager *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = (DRSDampeningManager *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_20;
  if (self != v4)
  {
    v6 = -[DRSDampeningManager totalCap](self, "totalCap");
    if (v6 != -[DRSDampeningManager totalCap](v5, "totalCap"))
      goto LABEL_20;
    -[DRSDampeningManager enforcementSettings](self, "enforcementSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSDampeningManager enforcementSettings](v5, "enforcementSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (!v9)
      goto LABEL_20;
    -[DRSDampeningManager defaultSignatureConfiguration](self, "defaultSignatureConfiguration");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10
      && (v11 = (void *)v10,
          -[DRSDampeningManager defaultSignatureConfiguration](v5, "defaultSignatureConfiguration"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          v12))
    {
      -[DRSDampeningManager defaultSignatureConfiguration](self, "defaultSignatureConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[DRSDampeningManager defaultSignatureConfiguration](v5, "defaultSignatureConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToDampeningConfiguration:", v14);

      if ((v15 & 1) == 0)
        goto LABEL_20;
    }
    else
    {
      -[DRSDampeningManager defaultSignatureConfiguration](self, "defaultSignatureConfiguration");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
        goto LABEL_17;
      -[DRSDampeningManager defaultSignatureConfiguration](v5, "defaultSignatureConfiguration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        goto LABEL_20;
    }
    -[DRSDampeningManager teamDampeningConfigDict](self, "teamDampeningConfigDict");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[DRSDampeningManager teamDampeningConfigDict](v5, "teamDampeningConfigDict");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[DRSDampeningManager teamDampeningConfigDict](self, "teamDampeningConfigDict");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSDampeningManager teamDampeningConfigDict](v5, "teamDampeningConfigDict");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToDictionary:", v23);

        if ((v24 & 1) != 0)
        {
LABEL_15:
          -[DRSDampeningManager resourceDampeningConfigDict](self, "resourceDampeningConfigDict");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[DRSDampeningManager resourceDampeningConfigDict](v5, "resourceDampeningConfigDict");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v25, "isEqualToDictionary:", v26);

LABEL_18:
          goto LABEL_21;
        }
LABEL_20:
        v16 = 0;
        goto LABEL_21;
      }
    }
    -[DRSDampeningManager teamDampeningConfigDict](self, "teamDampeningConfigDict");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      -[DRSDampeningManager teamDampeningConfigDict](v5, "teamDampeningConfigDict");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        goto LABEL_15;
      goto LABEL_20;
    }
LABEL_17:
    v25 = (void *)v17;
    v16 = 0;
    goto LABEL_18;
  }
  v16 = 1;
LABEL_21:

  return v16;
}

- (BOOL)_hasRequestsRecordCountGreaterThanOrEqualToThreshold:(unint64_t)a3 matchingPredicate:(id)a4 inContext:(id)a5 filterToObjectsMatchingClassOfRequest:(id)a6
{
  id v9;
  id v10;
  id v11;
  __objc2_class *v12;
  id *v13;
  uint64_t *v14;
  unint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  BOOL v21;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (v11)
  {
    v12 = (__objc2_class *)objc_opt_class();
    v24 = 0;
    v13 = (id *)&v24;
    v14 = &v24;
  }
  else
  {
    v12 = DRSRequest;
    v23 = 0;
    v13 = (id *)&v23;
    v14 = &v23;
  }
  v15 = -[__objc2_class requestCountForFilterPredicate:context:fetchLimit:errorOut:](v12, "requestCountForFilterPredicate:context:fetchLimit:errorOut:", v9, v10, a3 + 1, v14, v23, v24);
  v16 = *v13;
  if (v16)
  {
    DPLogHandle_DampeningManagerError();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      objc_msgSend(v16, "localizedDescription");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = CFSTR("Unknown");
      if (v18)
        v20 = (const __CFString *)v18;
      *(_DWORD *)buf = 138543362;
      v26 = v20;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ThresholdCheckError", "Encountered error while trying to check threshold count: %{public}@", buf, 0xCu);

    }
    v21 = 0;
  }
  else
  {
    v21 = v15 >= a3;
  }

  return v21;
}

- (DRSDampeningManager)initWithIsInternal:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  DRSDampeningEnforcementSettings *v11;
  void *v12;
  void *v13;
  void *v14;
  DRSDampeningManager *v15;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v11 = objc_alloc_init(DRSDampeningEnforcementSettings);
  objc_msgSend((id)objc_opt_class(), "defaultResourceConfigurations:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultTeamConfigurations:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[DRSDampeningConfiguration defaultSignatureDampeningConfiguration](DRSDampeningConfiguration, "defaultSignatureDampeningConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[DRSDampeningManager initWithPersistentContainer:enforcementSettings:defaultSignatureConfiguration:totalCap:teamDampeningConfigDict:resourceDampeningConfigDict:](self, "initWithPersistentContainer:enforcementSettings:defaultSignatureConfiguration:totalCap:teamDampeningConfigDict:resourceDampeningConfigDict:", 0, v11, v14, objc_msgSend((id)objc_opt_class(), "defaultTotalCapForCurrentDevice"), v13, v12);

  return v15;
}

- (DRSDampeningManager)initWithPersistentContainer:(id)a3 enforcementSettings:(id)a4 defaultSignatureConfiguration:(id)a5 totalCap:(unint64_t)a6 teamDampeningConfigDict:(id)a7 resourceDampeningConfigDict:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  DRSDampeningManager *v24;
  NSObject *v25;
  NSObject *v26;
  DRSDampeningManager *v28;
  DRSDampeningManager *v29;
  uint64_t v30;
  NSMutableDictionary *teamDampeningConfigDict;
  uint64_t v32;
  NSDictionary *resourceDampeningConfigDict;
  dispatch_queue_t v34;
  OS_dispatch_queue *workQueue;
  id v36;
  objc_super v37;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (v17)
  {
    v36 = v16;
    v21 = v15;
    if (v19
      && (objc_msgSend(v19, "objectForKeyedSubscript:", kDRSRequestResourceTailspin),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v22,
          v22))
    {
      if (a6 != 0x7FFFFFFF && a6)
      {
        v37.receiver = self;
        v37.super_class = (Class)DRSDampeningManager;
        v28 = -[DRSDampeningManager init](&v37, sel_init);
        v29 = v28;
        v15 = v21;
        if (v28)
        {
          objc_storeStrong((id *)&v28->_persistentContainer, a3);
          objc_storeStrong((id *)&v29->_enforcementSettings, a4);
          objc_storeStrong((id *)&v29->_defaultSignatureConfiguration, a5);
          v29->_totalCap = a6;
          v30 = objc_msgSend(v18, "mutableCopy");
          teamDampeningConfigDict = v29->_teamDampeningConfigDict;
          v29->_teamDampeningConfigDict = (NSMutableDictionary *)v30;

          v32 = objc_msgSend(v20, "mutableCopy");
          resourceDampeningConfigDict = v29->_resourceDampeningConfigDict;
          v29->_resourceDampeningConfigDict = (NSDictionary *)v32;

          v34 = dispatch_queue_create("DRSDampeningManager work queue", 0);
          workQueue = v29->_workQueue;
          v29->_workQueue = (OS_dispatch_queue *)v34;

        }
        self = v29;
        v24 = self;
      }
      else
      {
        DPLogHandle_DampeningManagerError();
        v23 = objc_claimAutoreleasedReturnValue();
        v15 = v21;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidDampeningManagerInit", "Invalid total cap", buf, 2u);
        }

        v24 = 0;
      }
    }
    else
    {
      DPLogHandle_DampeningManagerError();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidDampeningManagerInit", "Invalid resource dampening configuration", buf, 2u);
      }

      v24 = 0;
      v15 = v21;
    }
    v16 = v36;
  }
  else
  {
    DPLogHandle_DampeningManagerError();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidDampeningManagerInit", "Invalid default signature configuration", buf, 2u);
    }

    v24 = 0;
  }

  return v24;
}

- (id)_predicateForUndampenedRequestsMatchingSignatureOfRequest:(id)a3 afterDate:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v5, "teamID");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "issueCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("(requestDate >= %@) AND (requestState < %llu OR requestState > %llu) AND (teamID == %@) AND (issueCategory == %@)"), v8, 4096, 4103, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  else
  {
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("(requestDate >= %@) AND (requestState < %llu OR requestState > %llu)"), v7, 4096, 4103);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)_request:(id)a3 passesHysteresis:(double)a4 countCap:(unint64_t)a5 usesSignature:(BOOL)a6 usesRequestClass:(BOOL)a7 managedObjectContext:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a8;
  if (a4 == 0.0)
  {
    LOBYTE(a5) = 1;
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v17 = v14;
    else
      v17 = 0;
    -[DRSDampeningManager _predicateForUndampenedRequestsMatchingSignatureOfRequest:afterDate:](self, "_predicateForUndampenedRequestsMatchingSignatureOfRequest:afterDate:", v17, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v19 = v14;
    else
      v19 = 0;
    LODWORD(a5) = !-[DRSDampeningManager _hasRequestsRecordCountGreaterThanOrEqualToThreshold:matchingPredicate:inContext:filterToObjectsMatchingClassOfRequest:](self, "_hasRequestsRecordCountGreaterThanOrEqualToThreshold:matchingPredicate:inContext:filterToObjectsMatchingClassOfRequest:", a5, v18, v15, v19);

  }
  return a5;
}

- (BOOL)_passesResourceHysteresis:(id)a3 config:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DRSDampeningManager enforcementSettings](self, "enforcementSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "enforcesResourceHysteresis");

  if ((v12 & 1) == 0)
  {
    DPLogHandle_DampeningManager();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceHysteresisSkipped", "Resource hysteresis is disabled", (uint8_t *)&v19, 2u);
    }
    goto LABEL_8;
  }
  if (!v9)
  {
    v13 = 1;
    goto LABEL_10;
  }
  objc_msgSend(v9, "hysteresis");
  v13 = 1;
  if (!-[DRSDampeningManager _request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:](self, "_request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:", v8, 1, 0, 1, v10))
  {
    DPLogHandle_DampeningManager();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      objc_msgSend(v8, "debugDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "requiredSystemResourceName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hysteresis");
      v19 = 138543874;
      v20 = v15;
      v21 = 2114;
      v22 = v16;
      v23 = 2048;
      v24 = v17;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestResourceRejection", "Rejecting %{public}@ due to falling within resource (%{public}@) window of %.1f seconds", (uint8_t *)&v19, 0x20u);

    }
LABEL_8:
    v13 = v12 ^ 1;

  }
LABEL_10:

  return v13;
}

- (BOOL)_passesSignatureHysteresis:(id)a3 config:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  double v13;
  char v14;
  NSObject *v15;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DRSDampeningManager enforcementSettings](self, "enforcementSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "enforcesSignatureHysteresis");

  if ((v12 & 1) == 0)
  {
    DPLogHandle_DampeningManager();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureHysteresisSkipped", "Signature hysteresis is disabled", (uint8_t *)&v19, 2u);
    }
LABEL_6:
    v14 = v12 ^ 1;

    goto LABEL_7;
  }
  objc_msgSend(v9, "hysteresis");
  if (v13 != 0.0)
  {
    objc_msgSend(v9, "hysteresis");
    v14 = 1;
    if (-[DRSDampeningManager _request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:](self, "_request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:", v8, 1, 1, 0, v10))
    {
      goto LABEL_7;
    }
    DPLogHandle_DampeningManager();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      objc_msgSend(v8, "debugDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hysteresis");
      v19 = 138543618;
      v20 = v17;
      v21 = 2048;
      v22 = v18;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureHysteresisRejection", "Rejecting %{public}@ due to falling within signature hysteresis window of %.1f seconds", (uint8_t *)&v19, 0x16u);

    }
    goto LABEL_6;
  }
  v14 = 1;
LABEL_7:

  return v14;
}

- (double)_24HoursHysteresis
{
  return 86400.0;
}

- (BOOL)_passesSignatureCap:(id)a3 config:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  NSObject *v14;
  double v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DRSDampeningManager enforcementSettings](self, "enforcementSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "enforcesSignatureCap");

  if ((v12 & 1) == 0)
  {
    DPLogHandle_DampeningManager();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureCapSkipped", "Signature cap is disabled", (uint8_t *)&v18, 2u);
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "countCap") != 0x7FFFFFFF)
  {
    -[DRSDampeningManager _24HoursHysteresis](self, "_24HoursHysteresis");
    v13 = 1;
    if (-[DRSDampeningManager _request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:](self, "_request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:", v8, objc_msgSend(v9, "countCap"), 1, 0, v10, v15))
    {
      goto LABEL_10;
    }
    DPLogHandle_DampeningManager();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      objc_msgSend(v8, "debugDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2048;
      v21 = objc_msgSend(v9, "countCap");
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureCapRejection", "Rejecting %{public}@ due to reaching signature cap of %llu within the last 24 hours.", (uint8_t *)&v18, 0x16u);

    }
LABEL_9:
    v13 = v12 ^ 1;

    goto LABEL_10;
  }
  v13 = 1;
LABEL_10:

  return v13;
}

- (BOOL)_passesResourceCap:(id)a3 config:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  NSObject *v14;
  double v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DRSDampeningManager enforcementSettings](self, "enforcementSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "enforcesResourceCap");

  if ((v12 & 1) == 0)
  {
    DPLogHandle_DampeningManager();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceCapSkipped", "Signature cap is disabled", (uint8_t *)&v18, 2u);
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "countCap") != 0x7FFFFFFF)
  {
    -[DRSDampeningManager _24HoursHysteresis](self, "_24HoursHysteresis");
    v13 = 1;
    if (-[DRSDampeningManager _request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:](self, "_request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:", v8, objc_msgSend(v9, "countCap"), 0, 1, v10, v15))
    {
      goto LABEL_10;
    }
    DPLogHandle_DampeningManager();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      objc_msgSend(v8, "debugDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2048;
      v21 = objc_msgSend(v9, "countCap");
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceCapRejection", "Rejecting %{public}@ due to reaching resource cap of %llu within the last 24 hours.", (uint8_t *)&v18, 0x16u);

    }
LABEL_9:
    v13 = v12 ^ 1;

    goto LABEL_10;
  }
  v13 = 1;
LABEL_10:

  return v13;
}

- (BOOL)_passesTotalCap:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  double v10;
  char v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DRSDampeningManager enforcementSettings](self, "enforcementSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enforcesTotalCap");

  if ((v9 & 1) == 0)
  {
    DPLogHandle_DampeningManager();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TotalCapSkipped", "Total cap is disabled", (uint8_t *)&v15, 2u);
    }
    goto LABEL_8;
  }
  -[DRSDampeningManager _24HoursHysteresis](self, "_24HoursHysteresis");
  if (!-[DRSDampeningManager _request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:](self, "_request:passesHysteresis:countCap:usesSignature:usesRequestClass:managedObjectContext:", 0, -[DRSDampeningManager totalCap](self, "totalCap"), 0, 0, v7, v10))
  {
    DPLogHandle_DampeningManager();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      objc_msgSend(v6, "debugDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2048;
      v18 = -[DRSDampeningManager totalCap](self, "totalCap");
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TotalCapRejection", "Rejecting %{public}@ due to reaching cap of %llu within the last 24 hours.", (uint8_t *)&v15, 0x16u);

    }
LABEL_8:
    v11 = v9 ^ 1;

    goto LABEL_9;
  }
  v11 = 1;
LABEL_9:

  return v11;
}

+ (BOOL)passesAcceptanceRate:(double)a3
{
  if (a3 >= 1.0)
    return 1;
  if (a3 <= 0.0)
    return 0;
  return a3 * 1000.0 >= (double)arc4random_uniform(0x3E8u);
}

- (BOOL)_passesSignatureRandomDownsampling:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  double v14;
  int v16;
  void *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DRSDampeningManager enforcementSettings](self, "enforcementSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enforcesSignatureDownsampling");

  if ((v9 & 1) == 0)
  {
    DPLogHandle_DampeningManager();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureDownsamplingSkipped", "Downsampling is disabled", (uint8_t *)&v16, 2u);
    }
    goto LABEL_8;
  }
  v10 = (void *)objc_opt_class();
  objc_msgSend(v7, "acceptanceRate");
  if ((objc_msgSend(v10, "passesAcceptanceRate:") & 1) == 0)
  {
    DPLogHandle_DampeningManager();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      objc_msgSend(v6, "debugDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "acceptanceRate");
      v16 = 138543618;
      v17 = v13;
      v18 = 2048;
      v19 = v14 * 100.0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureDownsamplingRejection", "Rejecting %{public}@ due failing to pass the acceptance threshold of %.1f%%", (uint8_t *)&v16, 0x16u);

    }
LABEL_8:
    v11 = v9 ^ 1;

    goto LABEL_9;
  }
  v11 = 1;
LABEL_9:

  return v11;
}

- (BOOL)_passesResourceRandomDownsampling:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  double v14;
  int v16;
  void *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DRSDampeningManager enforcementSettings](self, "enforcementSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enforcesResourceDownsampling");

  if ((v9 & 1) == 0)
  {
    DPLogHandle_DampeningManager();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceDownsamplingSkipped", "Downsampling is disabled", (uint8_t *)&v16, 2u);
    }
    goto LABEL_8;
  }
  v10 = (void *)objc_opt_class();
  objc_msgSend(v7, "acceptanceRate");
  if ((objc_msgSend(v10, "passesAcceptanceRate:") & 1) == 0)
  {
    DPLogHandle_DampeningManager();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      objc_msgSend(v6, "debugDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "acceptanceRate");
      v16 = 138543618;
      v17 = v13;
      v18 = 2048;
      v19 = v14 * 100.0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SignatureDownsamplingRejection", "Rejecting %{public}@ due failing to pass the acceptance threshold of %.1f%%", (uint8_t *)&v16, 0x16u);

    }
LABEL_8:
    v11 = v9 ^ 1;

    goto LABEL_9;
  }
  v11 = 1;
LABEL_9:

  return v11;
}

- (id)dampeningConfigurationForResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[DRSDampeningManager resourceDampeningConfigDict](self, "resourceDampeningConfigDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_resourceConfigurationForRequest:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "requiredSystemResourceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSDampeningManager dampeningConfigurationForResource:](self, "dampeningConfigurationForResource:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)dampeningOutcomeForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  unint64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  -[DRSDampeningManager persistentContainer](self, "persistentContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    -[DRSDampeningManager persistentContainer](self, "persistentContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "newBackgroundContext");

    v8 = (void *)MEMORY[0x1DF0B6DC4]();
    -[DRSDampeningManager workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__DRSDampeningManager_dampeningOutcomeForRequest___block_invoke;
    v13[3] = &unk_1EA3D2C08;
    v13[4] = self;
    v14 = v4;
    v10 = v7;
    v15 = v10;
    v16 = &v17;
    dispatch_sync(v9, v13);

    objc_autoreleasePoolPop(v8);
    v11 = v18[3];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v11 = 8;
  }

  return v11;
}

void __50__DRSDampeningManager_dampeningOutcomeForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_resourceConfigurationForRequest:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = v2;
    if (objc_msgSend(*(id *)(a1 + 32), "_passesResourceHysteresis:config:managedObjectContext:", *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48)))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "_passesResourceCap:config:managedObjectContext:", *(_QWORD *)(a1 + 40), v8, *(_QWORD *)(a1 + 48)))
      {
        v3 = objc_msgSend(*(id *)(a1 + 32), "_passesResourceRandomDownsampling:config:", *(_QWORD *)(a1 + 40), v8);
        v2 = v8;
        if ((v3 & 1) != 0)
          goto LABEL_5;
        v6 = 3;
LABEL_16:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;

        return;
      }
      v6 = 2;
    }
    else
    {
      v6 = 1;
    }
    v2 = v8;
    goto LABEL_16;
  }
LABEL_5:

  objc_msgSend(*(id *)(a1 + 32), "dampeningConfigurationForRequestSignature:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "_passesSignatureHysteresis:config:managedObjectContext:", *(_QWORD *)(a1 + 40)))
  {
    v7 = 4;
LABEL_20:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7;

    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_passesSignatureCap:config:managedObjectContext:", *(_QWORD *)(a1 + 40), v9, *(_QWORD *)(a1 + 48)))
  {
    v7 = 5;
    goto LABEL_20;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_passesSignatureRandomDownsampling:config:", *(_QWORD *)(a1 + 40), v9) & 1) == 0)
  {
    v7 = 6;
    goto LABEL_20;
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "_passesTotalCap:managedObjectContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)) & 1) != 0)
  {
    DPLogHandle_DampeningManager();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      objc_msgSend(*(id *)(a1 + 40), "debugDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AcceptingRequest", "Accepted %{public}@", buf, 0xCu);

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 7;
  }
}

+ (unint64_t)defaultTotalCapForIsInternal:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5
{
  unint64_t v5;

  v5 = 20;
  if (a4 || a5)
    v5 = 50;
  if (a3)
    return 100;
  else
    return v5;
}

+ (unint64_t)defaultTotalCapForCurrentDevice
{
  void *v3;
  unint64_t v4;

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "defaultTotalCapForIsInternal:isSeed:isCarrier:", objc_msgSend(v3, "isInternal"), objc_msgSend(v3, "isSeed"), objc_msgSend(v3, "isCarrier"));

  return v4;
}

+ (id)defaultTeamConfigurationForTeamForCurrentDevice:(id)a3 teamConfigurationDirectory:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "defaultTeamConfigurationsForCurrentDevice:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)defaultTeamConfigurationForTeam:(id)a3 isInternal:(BOOL)a4 isSeed:(BOOL)a5 isCarrier:(BOOL)a6 platform:(unsigned __int8)a7
{
  uint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  void *v13;
  void *v14;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  objc_msgSend(a1, "defaultTeamConfigurations:isSeed:isCarrier:platform:", v10, v9, v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_nandTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  DRSTeamDampeningConfiguration *v6;
  void *v7;

  v6 = 0;
  if (a6 <= 6u && ((1 << a6) & 0x46) != 0)
  {
    +[DRSDampeningConfiguration nandDefaultConfiguration](DRSDampeningConfiguration, "nandDefaultConfiguration", a3, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", v7, 0);

  }
  return v6;
}

+ (id)_memoryToolsTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  _BOOL4 v6;
  DRSTeamDampeningConfiguration *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (a3 || a4)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[DRSDampeningConfiguration memoryToolsDefaultConfiguration](DRSDampeningConfiguration, "memoryToolsDefaultConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, kDRSDMMemoryToolsMemgraphDmonThresholdCategory);

    if (v6)
      +[DRSDampeningConfiguration memoryToolsInternalMemgraphOverTimeConfiguration](DRSDampeningConfiguration, "memoryToolsInternalMemgraphOverTimeConfiguration");
    else
      +[DRSDampeningConfiguration memoryToolsDefaultConfiguration](DRSDampeningConfiguration, "memoryToolsDefaultConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, kDRSDMMemoryToolsMemgraphOverTimeCategory);

    v7 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v8);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)_nonWatchOShangTracerTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  DRSTeamDampeningConfiguration *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v5)
  {
    +[DRSDampeningConfiguration hangTracerNonWatchOSInternalDownsamplingConfiguration](DRSDampeningConfiguration, "hangTracerNonWatchOSInternalDownsamplingConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DRSDampeningConfiguration hangTracerNonWatchOSInternalNoDownsamplingConfiguration](DRSDampeningConfiguration, "hangTracerNonWatchOSInternalNoDownsamplingConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, kDRSDMHangTracerFirstPartyMicroHangIssueCategory);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, kDRSDMHangTracerFirstPartyNormalHangIssueCategory);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, kDRSDMHangTracerFirstPartyLongHangIssueCategory);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, kDRSDMHangTracerThirdPartyNormalHangIssueCategory);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, kDRSDMHangTracerThirdPartyLongHangIssueCategory);
    v9 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v6);

  }
  else
  {
    if (v4)
      +[DRSDampeningConfiguration hangTracerNonWatchOSSeedConfiguration](DRSDampeningConfiguration, "hangTracerNonWatchOSSeedConfiguration");
    else
      +[DRSDampeningConfiguration hangTracerNonWatchOSCustomerConfiguration](DRSDampeningConfiguration, "hangTracerNonWatchOSCustomerConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, kDRSDMHangTracerFirstPartyLongHangIssueCategory);

    v9 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v6);
  }

  return v9;
}

+ (id)_watchOS_hangTracerTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4
{
  DRSTeamDampeningConfiguration *v4;
  id v5;
  void *v6;
  void *v7;

  if (a3 || a4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[DRSDampeningConfiguration hangTracerWatchOSInternalOrSeedDownsamplingConfiguration](DRSDampeningConfiguration, "hangTracerWatchOSInternalOrSeedDownsamplingConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[DRSDampeningConfiguration hangTracerWatchOSInternalOrSeedNoDownsamplingConfiguration](DRSDampeningConfiguration, "hangTracerWatchOSInternalOrSeedNoDownsamplingConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, kDRSDMHangTracerFirstPartyNormalHangIssueCategory);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, kDRSDMHangTracerFirstPartyLongHangIssueCategory);
    v4 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v5);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)_hangTracerTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  void *v7;

  v7 = 0;
  switch(a6)
  {
    case 2u:
    case 4u:
    case 6u:
      objc_msgSend(a1, "_nonWatchOShangTracerTeamConfiguration:isSeed:", a3, a4, a5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3u:
      objc_msgSend(a1, "_watchOS_hangTracerTeamConfiguration:isSeed:", a3, a4, a5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v7;
  }
  return v7;
}

+ (id)_sentryTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  DRSTeamDampeningConfiguration *v7;
  id v8;
  void *v9;

  if (a5)
    return 0;
  if (a6 == 1 && a3 || (v7 = 0, a3 || a4) && a6 == 2)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[DRSDampeningConfiguration sentryAppLaunchConfiguration](DRSDampeningConfiguration, "sentryAppLaunchConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, kDRSDMSentryAppLaunchIssueCategory);

    v7 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v8);
  }
  return v7;
}

+ (id)_coreAudioTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6;
  id v7;
  void *v8;
  DRSTeamDampeningConfiguration *v9;

  v6 = (a6 - 1) < 4 || a6 == 6;
  if (v6 && a3)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[DRSDampeningConfiguration coreAudioOverloadConfiguration](DRSDampeningConfiguration, "coreAudioOverloadConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, kDRSDMCoreAudioOverloadIssueCategory);

    v9 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v7);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)_drmTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  int v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  DRSTeamDampeningConfiguration *v12;

  if (a5)
    return 0;
  v7 = a6;
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((v7 - 1) < 3)
    goto LABEL_6;
  if (v7 == 4)
    goto LABEL_8;
  if (v7 == 6)
  {
LABEL_6:
    +[DRSDampeningConfiguration drmResourceUsageConfiguration](DRSDampeningConfiguration, "drmResourceUsageConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, kDRSDMDRMResourceUsageIssueCategory);

    if ((v7 - 1) < 4 || v7 == 6)
    {
LABEL_8:
      if (v8)
      {
        +[DRSDampeningConfiguration drmRogueTaskConfiguration](DRSDampeningConfiguration, "drmRogueTaskConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, kDRSDMDRMRogueTaskIssueCategory);

      }
    }
  }
  if (objc_msgSend(v9, "count"))
    v12 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v9);
  else
    v12 = 0;

  return v12;
}

+ (id)_coreAnimationTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  DRSTeamDampeningConfiguration *v6;
  id v7;
  void *v8;

  v6 = 0;
  if (a6 <= 6u && ((1 << a6) & 0x5C) != 0)
  {
    if (a5)
    {
LABEL_4:
      v6 = 0;
      return v6;
    }
    if (a6 == 2)
    {
      if (!a3 && !a4)
        goto LABEL_4;
    }
    else if (!a3)
    {
      goto LABEL_4;
    }
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[DRSDampeningConfiguration caHitchesConfiguration](DRSDampeningConfiguration, "caHitchesConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, kDRSDMCoreAnimationHitchesCategory);

    v6 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v7);
  }
  return v6;
}

+ (id)_skylightTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  DRSTeamDampeningConfiguration *v8;
  id v9;
  void *v10;

  if ((a3 || a4) && a6 == 1 && !a5)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[DRSDampeningConfiguration skylightHitchesConfiguration](DRSDampeningConfiguration, "skylightHitchesConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, kDRSDMSkylightHitchesCategory);

    v8 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v9);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)_rapidTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6;
  DRSTeamDampeningConfiguration *v7;
  id v8;
  void *v9;

  v6 = (a6 - 1) < 4 || a6 == 6;
  if (v6 && !a5)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[DRSDampeningConfiguration rapidMicroDiagnosticsConfiguration](DRSDampeningConfiguration, "rapidMicroDiagnosticsConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, kDRSDMRapidMicroDiagnosticIssueCategory[0]);

    v7 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v8);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)_nandGBBTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  DRSTeamDampeningConfiguration *v6;
  id v7;
  void *v8;

  v6 = 0;
  if (a6 <= 6u && ((1 << a6) & 0x46) != 0)
  {
    v6 = 0;
    if (a3 && !a5)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      +[DRSDampeningConfiguration nandAutoGBBSweepConfiguration](DRSDampeningConfiguration, "nandAutoGBBSweepConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, kDRSDMNandAutoGBBSweepIssueCategory);

      v6 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v7);
    }
  }
  return v6;
}

+ (id)_workflowResponsivenessDampeningConfiguration:(BOOL)a3
{
  if (a3)
    +[DRSDampeningConfiguration spindumpWorkflowResponsivenessConfiguration_Internal](DRSDampeningConfiguration, "spindumpWorkflowResponsivenessConfiguration_Internal");
  else
    +[DRSDampeningConfiguration spindumpWorkflowResponsivenessConfiguration_External](DRSDampeningConfiguration, "spindumpWorkflowResponsivenessConfiguration_External");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_spindumpTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  DRSTeamDampeningConfiguration *v6;
  int v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;

  if (a5)
  {
    v6 = 0;
  }
  else
  {
    v7 = a6;
    v8 = a3;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v7 == 1)
    {
      if (v8)
        +[DRSDampeningConfiguration spindumpMacOSSlowHIDConfiguration_Internal](DRSDampeningConfiguration, "spindumpMacOSSlowHIDConfiguration_Internal");
      else
        +[DRSDampeningConfiguration spindumpMacOSSlowHIDConfiguration_SeedRC](DRSDampeningConfiguration, "spindumpMacOSSlowHIDConfiguration_SeedRC");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, kDRSDMSpindumpSlowHIDIssueCategory);

    }
    objc_msgSend(a1, "_workflowResponsivenessDampeningConfiguration:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, kDRSDMSpindumpWorkflowResponsivenessCategory);

    v6 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v10);
  }
  return v6;
}

+ (id)_ppsTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6;
  DRSTeamDampeningConfiguration *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (a6 - 1) < 4 || a6 == 6;
  if (v6 && !a5)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[DRSDampeningConfiguration ppsArchiveConfiguration](DRSDampeningConfiguration, "ppsArchiveConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, kDRSDMPPSArchiveIssueCategory);

    +[DRSDampeningConfiguration ppsCEArchiveConfiguration](DRSDampeningConfiguration, "ppsCEArchiveConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, kDRSDMPPSCEArchiveIssueCategory);

    +[DRSDampeningConfiguration ppsXCArchiveConfiguration](DRSDampeningConfiguration, "ppsXCArchiveConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, kDRSDMPPSXCArchiveIssueCategory[0]);

    +[DRSDampeningConfiguration ppsSafeguardArchiveConfiguration](DRSDampeningConfiguration, "ppsSafeguardArchiveConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, kDRSDMPPSSafeguardArchiveIssueCategory[0]);

    +[DRSDampeningConfiguration ppsBGArchiveConfiguration](DRSDampeningConfiguration, "ppsBGArchiveConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, kDRSDMPPSBGArchiveIssueCategory);

    v7 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v8);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)_watchdogdTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  DRSTeamDampeningConfiguration *v6;
  BOOL v7;
  void *v8;

  v6 = 0;
  v7 = (a6 - 1) < 4 || a6 == 6;
  if (v7 && a3 && !a5)
  {
    +[DRSDampeningConfiguration watchdogdDefaultConfiguration](DRSDampeningConfiguration, "watchdogdDefaultConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", v8, 0);

  }
  return v6;
}

+ (id)_mailTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  DRSTeamDampeningConfiguration *v6;
  _BOOL4 v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v6 = 0;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (a6 <= 6u && ((1 << a6) & 0x46) != 0)
  {
    if (a5)
      return 0;
    v8 = a4;
    v14 = kDRSDMMailSQLQueryPerformanceIssueCategory;
    +[DRSDampeningConfiguration sqlQueryPerformanceConfiguration](DRSDampeningConfiguration, "sqlQueryPerformanceConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if (a3 || v8)
    {
      +[DRSDampeningConfiguration mailIssueCategoryConfiguration](DRSDampeningConfiguration, "mailIssueCategoryConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, kDRSDMMailMessageListIssueCategory);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, kDRSDMMailConversationViewIssueCategory);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, kDRSDMMailMiscResponsivenessIssueCategory);

    }
    v6 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v12);

  }
  return v6;
}

+ (id)_RMETeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  void *v9;
  void *v10;
  DRSTeamDampeningConfiguration *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a3 && !a4 || a6 != 6 || a5)
    return 0;
  +[DRSDampeningConfiguration RMEIssueCategoryConfiguration](DRSDampeningConfiguration, "RMEIssueCategoryConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = kDRSDMRMEMemoryExceptionIssueCategory;
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v10);

  return v11;
}

+ (id)_abcTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  BOOL v6;
  DRSTeamDampeningConfiguration *v7;
  void *v8;

  v6 = (a6 - 1) < 4 || a6 == 6;
  if (v6 && (a3 || a4 || a5))
  {
    +[DRSDampeningConfiguration abcDefaultConfiguration](DRSDampeningConfiguration, "abcDefaultConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", v8, 0);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)_newsTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  DRSTeamDampeningConfiguration *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v6 = 0;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3 && !a5 && (a6 - 3) >= 0xFFFFFFFE)
  {
    v10 = kDRSDMNewsSlowFeedIssueCategory;
    +[DRSDampeningConfiguration newsConfiguration](DRSDampeningConfiguration, "newsConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v8);
  }
  return v6;
}

+ (id)_libtraceTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  DRSTeamDampeningConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v6 = 0;
  v12[2] = *MEMORY[0x1E0C80C00];
  if (a3 && !a5)
  {
    v11[0] = kDRSDMLibtraceQuarantineIssueCategory;
    +[DRSDampeningConfiguration libtraceQuarantineConfiguration](DRSDampeningConfiguration, "libtraceQuarantineConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = kDRSDMLibtraceLoggingSampleIssueCategory;
    v12[0] = v7;
    +[DRSDampeningConfiguration libtraceLoggingSampleConfiguration](DRSDampeningConfiguration, "libtraceLoggingSampleConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v9);
  }
  return v6;
}

+ (id)_spotlightTeamConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  DRSTeamDampeningConfiguration *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v6 = 0;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3 && !a5)
  {
    v6 = 0;
    if (a6 <= 6u && ((1 << a6) & 0x46) != 0)
    {
      v10 = kDRSDMSpotlightInternalWatchdogIssueCategory;
      +[DRSDampeningConfiguration spotlightInternalWatchdogConfiguration](DRSDampeningConfiguration, "spotlightInternalWatchdogConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = -[DRSTeamDampeningConfiguration initWithDefaultConfiguration:issueCategoryToConfigurationDict:]([DRSTeamDampeningConfiguration alloc], "initWithDefaultConfiguration:issueCategoryToConfigurationDict:", 0, v8);
    }
  }
  return v6;
}

+ (id)defaultTeamConfigurationsForCurrentDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(a1, "defaultTeamConfigurations:isSeed:isCarrier:platform:plistDirectoryPath:errorOut:", objc_msgSend(v5, "isInternal"), objc_msgSend(v5, "isSeed"), objc_msgSend(v5, "isCarrier"), objc_msgSend(v5, "platform"), v4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v7)
  {
    DPLogHandle_DampeningManagerError();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamConfigFetchFailed", "Failed due to error %{public}@", buf, 0xCu);
    }

  }
  return v6;
}

+ (id)defaultTeamConfigurations:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "_nandTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, kDRSDMNandTeamID[0]);

  objc_msgSend(a1, "_hangTracerTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, kDRSDMHangTracerTeamID);

  objc_msgSend(a1, "_memoryToolsTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, kDRSDMMemoryToolsTeamID);

  objc_msgSend(a1, "_sentryTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, kDRSDMSentryTeamID);

  objc_msgSend(a1, "_coreAudioTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, kDRSDMCoreAudioTeamID);

  objc_msgSend(a1, "_spindumpTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, kDRSDMSpindumpTeamID);

  objc_msgSend(a1, "_drmTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, kDRSDMDRMTeamID);

  objc_msgSend(a1, "_coreAnimationTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, kDRSDMCoreAnimationTeamID);

  objc_msgSend(a1, "_skylightTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, kDRSDMSkylightTeamID);

  objc_msgSend(a1, "_watchdogdTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, kDRSDMWatchdogdTeamID);

  objc_msgSend(a1, "_rapidTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, kDRSDMRapidTeamID[0]);

  objc_msgSend(a1, "_ppsTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, kDRSDMPPSTeamID[0]);

  objc_msgSend(a1, "_nandGBBTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, kDRSDMNandGBBTeamID);

  objc_msgSend(a1, "_mailTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, kDRSDMMailTeamID);

  objc_msgSend(a1, "_RMETeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, kDRSDMReportMemoryExceptionTeamID);

  objc_msgSend(a1, "_abcTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, kDRSDMAutoBugCaptureTeamID);

  objc_msgSend(a1, "_newsTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, kDRSDMNewsTeamID);

  objc_msgSend(a1, "_libtraceTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v29, kDRSDMLibtraceTeamID);

  objc_msgSend(a1, "_spotlightTeamConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, kDRSDMSpotlightTeamID);

  if (!objc_msgSend(v11, "count"))
  {

    v11 = 0;
  }
  return v11;
}

+ (id)defaultTeamConfigurations:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6 plistDirectoryPath:(id)a7 errorOut:(id *)a8
{
  uint64_t v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v14 = a7;
  objc_msgSend(a1, "defaultTeamConfigurations:isSeed:isCarrier:platform:", v12, v11, v10, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    +[DRSTeamDampeningConfiguration teamIdToTeamDampeningConfigFromPlistDirectoryPath:errorOut:](DRSTeamDampeningConfiguration, "teamIdToTeamDampeningConfigFromPlistDirectoryPath:errorOut:", v14, a8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (id)objc_msgSend(v16, "mutableCopy");
      objc_msgSend(v18, "addEntriesFromDictionary:", v17);
    }
    else
    {
      v18 = v16;
    }

  }
  else
  {
    v18 = v15;
  }

  return v18;
}

+ (id)_defaultTailspinConfiguration:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  return -[DRSDampeningConfiguration initWithHysteresis:cap:acceptanceRate:]([DRSDampeningConfiguration alloc], "initWithHysteresis:cap:acceptanceRate:", 0x7FFFFFFFLL, 300.0, 1.0);
}

+ (id)defaultResourceConfigurations:(BOOL)a3 isSeed:(BOOL)a4 isCarrier:(BOOL)a5 platform:(unsigned __int8)a6
{
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  void *v12;
  void *v13;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "_defaultTailspinConfiguration:isSeed:isCarrier:platform:", v9, v8, v7, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[DRSTailspinRequest requiredSystemResourceName](DRSTailspinRequest, "requiredSystemResourceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v13);

  }
  if (!objc_msgSend(v11, "count"))
  {

    v11 = 0;
  }
  return v11;
}

- (BOOL)writeConfigurationPlistsToDirectory:(id)a3 createDirIfMissing:(BOOL)a4 errorOut:(id *)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  id v40;
  char v41;
  uint8_t v42[4];
  int v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v8, &v41);

  if ((v10 & 1) != 0)
  {
    if (!v41)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' already exists but it's a file"), v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _dampeningManagerError(v11);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      DPLogHandle_DampeningManagerError();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v12))
        goto LABEL_26;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      v13 = "'%{public}@' exists and is not a directory";
LABEL_25:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigurationPlistDirWritingError", v13, buf, 0xCu);
LABEL_26:
      v18 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    if (!a4)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' doesn't exist and we have not been told to create it"), v8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _dampeningManagerError(v23);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      DPLogHandle_DampeningManagerError();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v12))
        goto LABEL_26;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      v13 = "'%{public}@' does not exist and we have not been told to create it";
      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v15 = objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v40);
    v12 = v40;

    if (!v15)
    {
      DPLogHandle_DampeningManagerError();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v26))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v12;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigurationPlistDirCreationError", "Failed to create '%{public}@' due to error: %{public}@", buf, 0x16u);
      }

      if (a5)
      {
        v12 = objc_retainAutorelease(v12);
        v18 = 0;
        *a5 = v12;
        goto LABEL_31;
      }
      goto LABEL_26;
    }
    DPLogHandle_DampeningManager();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigurationPlistDirCreation", "Created '%{public}@'", buf, 0xCu);
    }

  }
  -[DRSDampeningManager jsonCompatibleDictRepresentation](self, "jsonCompatibleDictRepresentation");
  v12 = objc_claimAutoreleasedReturnValue();
  -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("TeamDampeningConfigurations"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__8;
    v46 = __Block_byref_object_dispose__8;
    v47 = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __87__DRSDampeningManager_writeConfigurationPlistsToDirectory_createDirIfMissing_errorOut___block_invoke;
    v27[3] = &unk_1EA3D2C30;
    v28 = v8;
    v29 = &v32;
    v30 = &v36;
    v31 = buf;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v27);
    v18 = *((_BYTE *)v37 + 24) == 0;
    if (*((_BYTE *)v37 + 24))
    {
      DPLogHandle_DampeningManagerError();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v19))
      {
        v20 = *((_DWORD *)v33 + 6);
        *(_DWORD *)v42 = 67240192;
        v43 = v20;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerPlistWriteFailure", "Failed after writing %{public}u plists", v42, 8u);
      }

      if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        _dampeningManagerError(CFSTR("Unknown error"));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v21;

      }
      if (a5)
        *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    DPLogHandle_DampeningManager();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoTeamConfigurationsToWrite", (const char *)&unk_1DBC04191, buf, 2u);
    }

    v18 = 1;
  }

LABEL_31:
  return v18;
}

void __87__DRSDampeningManager_writeConfigurationPlistsToDirectory_createDirIfMissing_errorOut___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v21;
  v13 = v21;
  if (v11)
  {
    if (objc_msgSend(v11, "writeToFile:atomically:", v10, 1))
    {
      DPLogHandle_DampeningManager();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v10;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamPlistWriteSuccess", "Wrote %{public}@", buf, 0xCu);
      }

      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
      DPLogHandle_DampeningManagerError();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v16))
      {
        *(_DWORD *)buf = 138543618;
        v23 = v7;
        v24 = 2114;
        v25 = v10;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamPlistWriteFailure", "Failed to write plist for %{public}@ to path %{public}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write plist to path '%@'"), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _dampeningManagerError(v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    DPLogHandle_DampeningManagerError();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v7;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamPlistSerializationFailure", "Failed to serialize config for %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v12);
  }

}

+ (id)defaultResourceConfigurationsForCurrentDevice
{
  void *v3;
  void *v4;

  +[DRSSystemProfile sharedInstance](DRSSystemProfile, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultResourceConfigurations:isSeed:isCarrier:platform:", objc_msgSend(v3, "isInternal"), objc_msgSend(v3, "isSeed"), objc_msgSend(v3, "isCarrier"), objc_msgSend(v3, "platform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (DRSDampeningManager)initWithPersistentContainer:(id)a3 teamConfigurationDirectory:(id)a4
{
  id v6;
  id v7;
  DRSDampeningEnforcementSettings *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  DRSDampeningManager *v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(DRSDampeningEnforcementSettings);
  objc_msgSend((id)objc_opt_class(), "defaultResourceConfigurationsForCurrentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[DRSDampeningConfiguration defaultSignatureDampeningConfiguration](DRSDampeningConfiguration, "defaultSignatureDampeningConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)objc_opt_class(), "defaultTotalCapForCurrentDevice");
  objc_msgSend((id)objc_opt_class(), "defaultTeamConfigurationsForCurrentDevice:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[DRSDampeningManager initWithPersistentContainer:enforcementSettings:defaultSignatureConfiguration:totalCap:teamDampeningConfigDict:resourceDampeningConfigDict:](self, "initWithPersistentContainer:enforcementSettings:defaultSignatureConfiguration:totalCap:teamDampeningConfigDict:resourceDampeningConfigDict:", v7, v8, v10, v11, v12, v9);
  return v13;
}

- (id)dampeningConfigurationForTeamID:(id)a3 issueCategory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[DRSDampeningManager teamDampeningConfigDict](self, "teamDampeningConfigDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "configurationForIssueCategory:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      -[DRSDampeningManager defaultSignatureConfiguration](self, "defaultSignatureConfiguration");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

  }
  else
  {
    -[DRSDampeningManager defaultSignatureConfiguration](self, "defaultSignatureConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)dampeningConfigurationForRequestSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "teamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "issueCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DRSDampeningManager dampeningConfigurationForTeamID:issueCategory:](self, "dampeningConfigurationForTeamID:issueCategory:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_ON_MOC_QUEUE_existingMOFromContext:(id)a3 errorOut:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  id v15;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a3;
  objc_msgSend(a1, "_entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "executeFetchRequest:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a4)
  {
    DPLogHandle_CoreDataError();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      objc_msgSend(*a4, "localizedDescription");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("Unknown");
      if (v12)
        v14 = (const __CFString *)v12;
      v17 = 138543362;
      v18 = v14;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerRemoveFailure", "Encountered error when fetching dampening manager from store: %{public}@", (uint8_t *)&v17, 0xCu);

    }
    v15 = 0;
  }
  else
  {
    v15 = v10;
  }

  return v15;
}

+ (BOOL)removeExistingDampeningManagerStateFromManagedObjectContext:(id)a3 errorOut:(id *)a4
{
  id v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  uint64_t *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__8;
  v14[4] = __Block_byref_object_dispose__8;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__DRSDampeningManager_removeExistingDampeningManagerStateFromManagedObjectContext_errorOut___block_invoke;
  v9[3] = &unk_1EA3D1878;
  v13 = a1;
  v6 = v5;
  v10 = v6;
  v11 = v14;
  v12 = &v16;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  v7 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);

  return v7;
}

void __92__DRSDampeningManager_removeExistingDampeningManagerStateFromManagedObjectContext_errorOut___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[7];
  v3 = a1[4];
  v17 = 0;
  objc_msgSend(v2, "_ON_MOC_QUEUE_existingMOFromContext:errorOut:", v3, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
  v6 = v17;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v5);
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend((id)a1[4], "deleteObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), (_QWORD)v13);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }

    v12 = *(_QWORD *)(a1[6] + 8);
  }
  else
  {
    v12 = *(_QWORD *)(a1[6] + 8);
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    {
      *(_BYTE *)(v12 + 24) = 0;
      goto LABEL_13;
    }
  }
  *(_BYTE *)(v12 + 24) = 1;
LABEL_13:

}

+ (id)dampeningManagerFromPersistentContainer:(id)a3 deleteBadState:(BOOL)a4 errorOut:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(v8, "newBackgroundContext");
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__8;
  v42 = __Block_byref_object_dispose__8;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__8;
  v36 = __Block_byref_object_dispose__8;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__8;
  v30 = __Block_byref_object_dispose__8;
  v31 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__DRSDampeningManager_dampeningManagerFromPersistentContainer_deleteBadState_errorOut___block_invoke;
  v19[3] = &unk_1EA3D2C58;
  v22 = &v32;
  v25 = a1;
  v11 = v9;
  v20 = v11;
  v23 = &v26;
  v24 = &v38;
  v12 = v8;
  v21 = v12;
  objc_msgSend(v11, "performBlockAndWait:", v19);
  if (v6 && v27[5] && objc_msgSend((id)v33[5], "count"))
  {
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __87__DRSDampeningManager_dampeningManagerFromPersistentContainer_deleteBadState_errorOut___block_invoke_379;
    v15[3] = &unk_1EA3D2C80;
    v17 = &v32;
    v16 = v11;
    v18 = &v26;
    objc_msgSend(v16, "performBlockAndWait:", v15);

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v27[5]);
  v13 = (id)v39[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v13;
}

void __87__DRSDampeningManager_dampeningManagerFromPersistentContainer_deleteBadState_errorOut___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const __CFString **v16;
  uint64_t *v17;
  DRSDampeningManager *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[4];
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[9];
  v3 = a1[4];
  v27 = 0;
  objc_msgSend(v2, "_ON_MOC_QUEUE_existingMOFromContext:errorOut:", v3, &v27);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v27;
  v6 = v27;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v5);
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    DPLogHandle_CoreDataError();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "localizedDescription");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("Unknown");
      if (v10)
        v12 = (const __CFString *)v10;
      *(_DWORD *)buf = 138543362;
      v33 = v12;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerFetchFailure", "Encountered error when fetching dampening manager from store: %{public}@", buf, 0xCu);

    }
    goto LABEL_18;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count"))
  {
    DPLogHandle_CoreData();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerFetchMiss", "No persisted dampening manager", buf, 2u);
    }
    goto LABEL_18;
  }
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count") >= 2)
  {
    DPLogHandle_CoreDataError();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerFetchMultiples", "Found more than one manager", buf, 2u);
    }

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("Found more than one persisted dampening manager");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v31;
    v17 = &v30;
LABEL_17:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticPipelinePersistenceError"), 0, v9);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1[7] + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

LABEL_18:
    goto LABEL_19;
  }
  v18 = [DRSDampeningManager alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSDampeningManager _ON_MOC_QUEUE_initWith:persistentContainer:](v18, "_ON_MOC_QUEUE_initWith:persistentContainer:", v19, a1[5]);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(a1[8] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  if (!*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
  {
    DPLogHandle_CoreDataError();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerFetchInitFailure", "Failed to initialize dampening manager", buf, 2u);
    }

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR("Failed to create MO for dampening manager");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v29;
    v17 = &v28;
    goto LABEL_17;
  }
LABEL_19:

}

void __87__DRSDampeningManager_dampeningManagerFromPersistentContainer_deleteBadState_errorOut___block_invoke_379(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const __CFString *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  DPLogHandle_CoreDataError();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerBadStateClean", "Cleaning bad persisted state and starting over.", buf, 2u);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "deleteObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v5);
  }

  v8 = *(void **)(a1 + 32);
  v16 = 0;
  v9 = objc_msgSend(v8, "save:", &v16);
  v10 = v16;
  v11 = v16;
  if ((v9 & 1) == 0)
  {
    DPLogHandle_CoreDataError();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      objc_msgSend(v11, "localizedDescription");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("Unknown");
      if (v13)
        v15 = (const __CFString *)v13;
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerDeleteFailure", "Failed to save deletion of multiple dampening managers due to error: %{public}@", buf, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);
  }

}

- (id)_ON_MOC_QUEUE_initWith:(id)a3 persistentContainer:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  DRSDampeningConfiguration *v26;
  void *v27;
  DRSDampeningEnforcementSettings *v28;
  void *v29;
  NSObject *v30;
  DRSDampeningManager *v31;
  DRSDampeningManager *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[16];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v33 = self;
  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v34 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v5, "teamConfigurations");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
        v13 = -[DRSTeamDampeningConfiguration _initWithTeamDampeningConfigMO_ON_MOC_QUEUE:]([DRSTeamDampeningConfiguration alloc], "_initWithTeamDampeningConfigMO_ON_MOC_QUEUE:", v12, v33);
        if (!v13)
        {
          DPLogHandle_DampeningManagerError();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v16))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerMORestoreFailure", "Failed to initialize dampening manager from persistence", buf, 2u);
          }
          v31 = 0;
          v25 = v34;
          goto LABEL_29;
        }
        v14 = v13;
        objc_msgSend(v12, "teamID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (!objc_msgSend(v6, "count"))
  {

    v6 = 0;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v5, "resourceConfigurations");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    while (2)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v20);
        v22 = -[DRSDampeningConfiguration _initWithMO_ON_MOC_QUEUE:]([DRSDampeningConfiguration alloc], "_initWithMO_ON_MOC_QUEUE:", v21);
        if (!v22)
        {
          DPLogHandle_DampeningManagerError();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v30))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningManagerMORestoreFailure", "Failed to initialize resource dampening configurations from persistence", buf, 2u);
          }
          v31 = 0;
          v25 = v34;
          goto LABEL_28;
        }
        v23 = v22;
        objc_msgSend(v21, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, v24);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v18)
        continue;
      break;
    }
  }

  if (!objc_msgSend(v7, "count"))
  {

    v7 = 0;
  }
  v25 = v34;
  v26 = [DRSDampeningConfiguration alloc];
  objc_msgSend(v5, "defaultSignatureConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[DRSDampeningConfiguration _initWithMO_ON_MOC_QUEUE:](v26, "_initWithMO_ON_MOC_QUEUE:", v27);

  v28 = [DRSDampeningEnforcementSettings alloc];
  objc_msgSend(v5, "enforcementSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[DRSDampeningEnforcementSettings initWithMO:](v28, "initWithMO:", v29);

  v31 = -[DRSDampeningManager initWithPersistentContainer:enforcementSettings:defaultSignatureConfiguration:totalCap:teamDampeningConfigDict:resourceDampeningConfigDict:](v33, "initWithPersistentContainer:enforcementSettings:defaultSignatureConfiguration:totalCap:teamDampeningConfigDict:resourceDampeningConfigDict:", v34, v30, v16, objc_msgSend(v5, "totalCap"), v6, v7);
LABEL_28:

LABEL_29:
  return v31;
}

- (id)_ON_MOC_QUEUE_moRepresentationInContext:(id)a3
{
  id v4;
  DRSDampeningManagerMO *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  DRSDampeningManagerMO *v13;
  DRSDampeningManagerMO *v14;
  void *v15;
  DRSDampeningManagerMO *v16;
  _QWORD v18[4];
  id v19;
  DRSDampeningManagerMO *v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  DRSDampeningManagerMO *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v4 = a3;
  v5 = -[DRSDampeningManagerMO initWithContext:]([DRSDampeningManagerMO alloc], "initWithContext:", v4);
  -[DRSDampeningManager defaultSignatureConfiguration](self, "defaultSignatureConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_ON_MOC_QUEUE_moRepresentationInContext:identifier:", v4, CFSTR("DEFAULT_CONFIGURATION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSDampeningManagerMO setDefaultSignatureConfiguration:](v5, "setDefaultSignatureConfiguration:", v7);

  -[DRSDampeningManager enforcementSettings](self, "enforcementSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_moRepresentation:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSDampeningManagerMO setEnforcementSettings:](v5, "setEnforcementSettings:", v9);

  -[DRSDampeningManagerMO setTotalCap:](v5, "setTotalCap:", -[DRSDampeningManager totalCap](self, "totalCap"));
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[DRSDampeningManager teamDampeningConfigDict](self, "teamDampeningConfigDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __63__DRSDampeningManager__ON_MOC_QUEUE_moRepresentationInContext___block_invoke;
  v22[3] = &unk_1EA3D2CA8;
  v12 = v4;
  v23 = v12;
  v25 = &v26;
  v13 = v5;
  v24 = v13;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v22);

  if (*((_BYTE *)v27 + 24))
  {
    v14 = 0;
  }
  else
  {
    -[DRSDampeningManager resourceDampeningConfigDict](self, "resourceDampeningConfigDict");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __63__DRSDampeningManager__ON_MOC_QUEUE_moRepresentationInContext___block_invoke_383;
    v18[3] = &unk_1EA3D2BB8;
    v19 = v12;
    v21 = &v26;
    v16 = v13;
    v20 = v16;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v18);

    if (*((_BYTE *)v27 + 24))
      v14 = 0;
    else
      v14 = v16;

  }
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __63__DRSDampeningManager__ON_MOC_QUEUE_moRepresentationInContext___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "_ON_MOC_QUEUE_moRepresentationInContext:teamID:", *(_QWORD *)(a1 + 32), a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addTeamConfigurationsObject:", v6);
  }
  else
  {
    DPLogHandle_DampeningManagerError();

    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void __63__DRSDampeningManager__ON_MOC_QUEUE_moRepresentationInContext___block_invoke_383(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "_ON_MOC_QUEUE_moRepresentationInContext:identifier:", *(_QWORD *)(a1 + 32), a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addResourceConfigurationsObject:", v6);
  }
  else
  {
    DPLogHandle_DampeningManagerError();

    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)saveToPersistentContainerWithErrorOut:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  -[DRSDampeningManager persistentContainer](self, "persistentContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DRSDampeningManager persistentContainer](self, "persistentContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "newBackgroundContext");

    if (objc_msgSend((id)objc_opt_class(), "removeExistingDampeningManagerStateFromManagedObjectContext:errorOut:", v7, a3))
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__8;
      v19 = __Block_byref_object_dispose__8;
      v20 = 0;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __61__DRSDampeningManager_saveToPersistentContainerWithErrorOut___block_invoke;
      v11[3] = &unk_1EA3D13B8;
      v11[4] = self;
      v7 = v7;
      v12 = v7;
      v13 = &v15;
      v14 = &v21;
      objc_msgSend(v7, "performBlockAndWait:", v11);
      v8 = *((_BYTE *)v22 + 24) != 0;
      if (*((_BYTE *)v22 + 24))
      {
        DPLogHandle_CoreData();

      }
      else
      {
        DPLogHandle_CoreDataError();

        if (a3)
          *a3 = objc_retainAutorelease((id)v16[5]);
      }

      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v21, 8);
    }
    else
    {
      v8 = 0;
    }
    goto LABEL_12;
  }
  if (a3)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("Tried to save a dampening manager with no persistent containter");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticPipelinePersistenceError"), 0, v7);
    v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

    return v8;
  }
  return 0;
}

void __61__DRSDampeningManager_saveToPersistentContainerWithErrorOut___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_ON_MOC_QUEUE_moRepresentationInContext:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v4 + 40);
    v5 = objc_msgSend(v3, "save:", &obj);
    objc_storeStrong((id *)(v4 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("Failed to create MO for dampening manager");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("DiagnosticPipelinePersistenceError"), 0, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (DRSDampeningConfiguration)defaultSignatureConfiguration
{
  return self->_defaultSignatureConfiguration;
}

- (void)setDefaultSignatureConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSignatureConfiguration, a3);
}

- (DRSDampeningEnforcementSettings)enforcementSettings
{
  return self->_enforcementSettings;
}

- (unint64_t)totalCap
{
  return self->_totalCap;
}

- (void)setTotalCap:(unint64_t)a3
{
  self->_totalCap = a3;
}

- (NSMutableDictionary)teamDampeningConfigDict
{
  return self->_teamDampeningConfigDict;
}

- (NSDictionary)resourceDampeningConfigDict
{
  return self->_resourceDampeningConfigDict;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_resourceDampeningConfigDict, 0);
  objc_storeStrong((id *)&self->_teamDampeningConfigDict, 0);
  objc_storeStrong((id *)&self->_enforcementSettings, 0);
  objc_storeStrong((id *)&self->_defaultSignatureConfiguration, 0);
}

@end
