@implementation _DKSync3TransportPolicy

- (_DKSync3TransportPolicy)init
{
  _DKSync3TransportPolicy *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKSync3TransportPolicy;
  result = -[_DKSync3TransportPolicy init](&v3, sel_init);
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
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  objc_super v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v31.receiver = a1;
    v31.super_class = (Class)_DKSync3TransportPolicy;
    v8 = (id *)objc_msgSendSuper2(&v31, sel_init);
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
          objc_storeStrong(a1 + 3, a2);
          _DKSync3PolicyDuplicateNSStringPropertyValue(CFSTR("Transport"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("IsSyncDisabled"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("MaximumSyncsPerDay"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("SyncBatchSizeInEvents"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("MaximumBatchesPerSync"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("MaximumSyncWindowInSeconds"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("MinimumTimeBetweenSyncsInSeconds"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("SingleDevicePeriodicSyncCadenceInDays"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("AdditionsBucketCountTriggeringSync"), v7, v9);
          _DKSync3PolicyDuplicateNSNumberPropertyValue(CFSTR("DeletionsBucketCountTriggeringSync"), v7, v9);
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IsSyncDisabled"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "BOOLValue");

          *((_BYTE *)a1 + 8) = v11;
          if ((v11 & 1) == 0)
          {
            v32[0] = CFSTR("Transport");
            v32[1] = CFSTR("SyncBatchSizeInEvents");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            DoesContainRequiredProperties = _DKSync3PolicyDoesContainRequiredProperties(v6, v9, v12);

            if (DoesContainRequiredProperties)
            {
              objc_storeStrong(a1 + 2, v9);
              objc_storeStrong(a1 + 4, (id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Transport")));
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MaximumSyncsPerDay"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "unsignedIntegerValue");

              a1[5] = (id)v15;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SyncBatchSizeInEvents"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "unsignedIntegerValue");

              a1[6] = (id)v17;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MaximumBatchesPerSync"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "unsignedIntegerValue");

              a1[7] = (id)v19;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MaximumSyncWindowInSeconds"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "unsignedIntegerValue");

              a1[8] = (id)v21;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MinimumTimeBetweenSyncsInSeconds"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "unsignedIntegerValue");

              a1[9] = (id)v23;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SingleDevicePeriodicSyncCadenceInDays"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "unsignedIntegerValue");

              a1[10] = (id)v25;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AdditionsBucketCountTriggeringSync"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "unsignedIntegerValue");

              a1[11] = (id)v27;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DeletionsBucketCountTriggeringSync"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "unsignedIntegerValue");

              a1[12] = (id)v29;
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
  NSString *transport;
  unint64_t maximumSyncsPerDay;
  void *v8;
  unint64_t syncBatchSizeInEvents;
  void *v10;
  unint64_t maximumBatchesPerSync;
  void *v12;
  unint64_t minimumSyncWindowInSeconds;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

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
    transport = self->_transport;
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("                                    name: %@\n"), 0);
    transport = 0;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("                               transport: %@\n"), transport);
  if (self)
    maximumSyncsPerDay = self->_maximumSyncsPerDay;
  else
    maximumSyncsPerDay = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", maximumSyncsPerDay);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                      maximumSyncsPerDay: %@\n"), v8);

  if (self)
    syncBatchSizeInEvents = self->_syncBatchSizeInEvents;
  else
    syncBatchSizeInEvents = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", syncBatchSizeInEvents);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                   syncBatchSizeInEvents: %@\n"), v10);

  if (self)
    maximumBatchesPerSync = self->_maximumBatchesPerSync;
  else
    maximumBatchesPerSync = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", maximumBatchesPerSync);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("                   maximumBatchesPerSync: %@\n"), v12);

  if (self)
    minimumSyncWindowInSeconds = self->_minimumSyncWindowInSeconds;
  else
    minimumSyncWindowInSeconds = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", minimumSyncWindowInSeconds);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("              minimumSyncWindowInSeconds: %@\n"), v14);

  if (!self)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("        minimumTimeBetweenSyncsInSeconds: %@\n"), v17);
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_minimumTimeBetweenSyncsInSeconds);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("        minimumTimeBetweenSyncsInSeconds: %@\n"), v15);

  if (self->_additionsBucketCountTriggeringSync)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("      additionsBucketCountTriggeringSync: %@\n"), v16);

  }
  if (self->_deletionsBucketCountTriggeringSync)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("      deletionsBucketCountTriggeringSync: %@\n"), v17);
LABEL_18:

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
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
