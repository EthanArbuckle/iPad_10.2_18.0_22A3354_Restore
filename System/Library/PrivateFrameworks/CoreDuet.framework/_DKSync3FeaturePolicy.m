@implementation _DKSync3FeaturePolicy

- (_DKSync3FeaturePolicy)init
{
  _DKSync3FeaturePolicy *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKSync3FeaturePolicy;
  result = -[_DKSync3FeaturePolicy init](&v3, sel_init);
  if (result)
    result->_isSyncDisabled = 1;
  return result;
}

- (id)initWithName:(void *)a3 properties:
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int DoesContainRequiredProperties;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)_DKSync3FeaturePolicy;
    v8 = (id *)objc_msgSendSuper2(&v27, sel_init);
    a1 = v8;
    if (v8)
    {
      *((_BYTE *)v8 + 8) = 1;
      if (v6)
      {
        if (v7)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(a1 + 4, a2);
          _DKSync3PolicyDuplicateNSStringPropertyValue(CFSTR("Feature"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("IsSyncDisabled"), v7, v9);
          _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue(CFSTR("StreamNames"), v7, v9);
          _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue(CFSTR("Sources"), v7, v9);
          _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue(CFSTR("Destinations"), v7, v9);
          _DKSync3PolicyDuplicateNSStringPropertyValue(CFSTR("Transport"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("PeriodicSyncCadenceInMinutes"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("OnlyMultiDevice"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("OnlySingleDevice"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("OldestEventToSyncInDays"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("RequiresCharging"), v7, v9);
          _DKSync3PolicyDuplicateNSArrayNSStringPropertyValue(CFSTR("RequiresCompanions"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("PushTriggersSync"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("AdditionsCountTowardTriggeredSyncBucket"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("DeletionsCountTowardTriggeredSyncBucket"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("AdditionTriggersImmediateSync"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("DeletionTriggersImmediateSync"), v7, v9);
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IsSyncDisabled"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "BOOLValue");

          *((_BYTE *)a1 + 8) = v11;
          if ((v11 & 1) == 0)
          {
            v28[0] = CFSTR("Feature");
            v28[1] = CFSTR("StreamNames");
            v28[2] = CFSTR("Transport");
            v28[3] = CFSTR("OldestEventToSyncInDays");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            DoesContainRequiredProperties = _DKSync3PolicyDoesContainRequiredProperties(v6, v9, v12);

            if (DoesContainRequiredProperties)
            {
              objc_storeStrong(a1 + 3, v9);
              objc_storeStrong(a1 + 5, (id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Feature")));
              objc_storeStrong(a1 + 6, (id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("StreamNames")));
              objc_storeStrong(a1 + 7, (id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Sources")));
              objc_storeStrong(a1 + 8, (id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Destinations")));
              objc_storeStrong(a1 + 9, (id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Transport")));
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PeriodicSyncCadenceInMinutes"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "unsignedIntegerValue");

              a1[10] = (id)v15;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OldestEventToSyncInDays"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "unsignedIntegerValue");

              a1[11] = (id)v17;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OnlyMultiDevice"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v17) = objc_msgSend(v18, "BOOLValue");

              *((_BYTE *)a1 + 9) = v17;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OnlySingleDevice"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v17) = objc_msgSend(v19, "BOOLValue");

              *((_BYTE *)a1 + 10) = v17;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RequiresCharging"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v17) = objc_msgSend(v20, "BOOLValue");

              *((_BYTE *)a1 + 11) = v17;
              objc_storeStrong(a1 + 12, (id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RequiresCompanions")));
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PushTriggersSync"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v17) = objc_msgSend(v21, "BOOLValue");

              *((_BYTE *)a1 + 12) = v17;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AdditionsCountTowardTriggeredSyncBucket"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v17) = objc_msgSend(v22, "BOOLValue");

              *((_BYTE *)a1 + 13) = v17;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DeletionsCountTowardTriggeredSyncBucket"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v17) = objc_msgSend(v23, "BOOLValue");

              *((_BYTE *)a1 + 14) = v17;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AdditionTriggersImmediateSync"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v17) = objc_msgSend(v24, "BOOLValue");

              *((_BYTE *)a1 + 15) = v17;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DeletionTriggersImmediateSync"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v17) = objc_msgSend(v25, "BOOLValue");

              *((_BYTE *)a1 + 16) = v17;
            }
          }

        }
      }
    }
  }

  return a1;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  NSString *feature;
  void *v7;
  NSArray *sources;
  NSArray *v9;
  void *v10;
  NSArray *destinations;
  NSArray *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  NSArray *requiresCompanions;
  void *v17;
  const __CFString *v18;
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ { \n"), v5);

  if (self)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("                                    name: %@\n"), self->_name);
    if (self->_isSyncDisabled)
      objc_msgSend(v3, "appendFormat:", CFSTR("                          isSyncDisabled: %@\n"), CFSTR("YES"));
    feature = self->_feature;
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("                                    name: %@\n"), 0);
    feature = 0;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("                                 feature: %@\n"), feature);
  if (self)
  {
    _CDPrettyPrintCollection(self->_streamNames, 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("                             streamNames: %@\n"), v7);

    sources = self->_sources;
  }
  else
  {
    _CDPrettyPrintCollection(0, 0, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("                             streamNames: %@\n"), v20);

    sources = 0;
  }
  if (-[NSArray count](sources, "count"))
  {
    if (self)
      v9 = self->_sources;
    else
      v9 = 0;
    _CDPrettyPrintCollection(v9, 0, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("                                 sources: %@\n"), v10);

  }
  if (self)
    destinations = self->_destinations;
  else
    destinations = 0;
  if (-[NSArray count](destinations, "count"))
  {
    if (self)
      v12 = self->_destinations;
    else
      v12 = 0;
    _CDPrettyPrintCollection(v12, 0, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("                            destinations: %@\n"), v13);

  }
  if (self)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("                               transport: %@\n"), self->_transport);
    if (self->_oldestEventToSyncInDays)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("                 oldestEventToSyncInDays: %@\n"), v14);

    }
    if (self->_onlyMultiDevice)
      objc_msgSend(v3, "appendFormat:", CFSTR("                         onlyMultiDevice: %@\n"), CFSTR("YES"));
    if (self->_onlySingleDevice)
      objc_msgSend(v3, "appendFormat:", CFSTR("                        onlySingleDevice: %@\n"), CFSTR("YES"));
    if (self->_requiresCharging)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("                        requiresCharging: %@\n"), v15);
    requiresCompanions = self->_requiresCompanions;
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("                               transport: %@\n"), 0);
    objc_msgSend(v3, "appendFormat:", CFSTR("                        requiresCharging: %@\n"), CFSTR("NO"));
    requiresCompanions = 0;
  }
  _CDPrettyPrintCollection(requiresCompanions, 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                      requiresCompanions: %@\n"), v17);

  if (self)
  {
    if (self->_pushTriggersSync)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("                        pushTriggersSync: %@\n"), v18);
    if (self->_additionsCountTowardTriggeredSyncBucket)
      objc_msgSend(v3, "appendFormat:", CFSTR(" additionsCountTowardTriggeredSyncBucket: %@\n"), CFSTR("YES"));
    if (self->_deletionsCountTowardTriggeredSyncBucket)
      objc_msgSend(v3, "appendFormat:", CFSTR(" deletionsCountTowardTriggeredSyncBucket: %@\n"), CFSTR("YES"));
    if (self->_additionTriggersImmediateSync)
      objc_msgSend(v3, "appendFormat:", CFSTR("           additionTriggersImmediateSync: %@\n"), CFSTR("YES"));
    if (self->_deletionTriggersImmediateSync)
      objc_msgSend(v3, "appendFormat:", CFSTR("           deletionTriggersImmediateSync: %@\n"), CFSTR("YES"));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("                        pushTriggersSync: %@\n"), CFSTR("NO"));
  }
  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  return v3;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiresCompanions, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_streamNames, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
