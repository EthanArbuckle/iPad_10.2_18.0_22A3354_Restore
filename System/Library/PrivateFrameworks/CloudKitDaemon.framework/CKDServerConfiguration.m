@implementation CKDServerConfiguration

- (BOOL)isExpired
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  BOOL v8;

  objc_msgSend_expiry(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(MEMORY[0x1E0C99D68], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_compare_(v3, v7, (uint64_t)v6) == -1;

  return v8;
}

- (NSDate)expiry
{
  return self->_expiry;
}

- (BOOL)applicationWithBundleID:(id)a3 canSyncUsingVersion:(id)a4 forContainerID:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  CKDServerConfiguration *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  char v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend_length(v9, v11, v12))
  {
    objc_msgSend_stringByAppendingString_(v8, v13, (uint64_t)v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self;
    objc_sync_enter(v15);
    objc_msgSend_allowedAppVersionsCache(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v21 = (void *)objc_opt_new();
      objc_msgSend_setAllowedAppVersionsCache_(v15, v22, (uint64_t)v21);

    }
    objc_msgSend_allowedAppVersionsCache(v15, v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      objc_msgSend_values(v15, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)CFSTR("bundleIds"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectForKeyedSubscript_(v30, v31, (uint64_t)v8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = compareVersionStrings(v32, v9);
      if (v33 == -1 || v33 == 0 || v32 == 0)
        v25 = (void *)MEMORY[0x1E0C9AAB0];
      else
        v25 = (void *)MEMORY[0x1E0C9AAA0];
      objc_msgSend_allowedAppVersionsCache(v15, v34, v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v38, v39, (uint64_t)v25, v14);

    }
    objc_sync_exit(v15);

    v42 = objc_msgSend_BOOLValue(v25, v40, v41);
  }
  else
  {
    v42 = 1;
  }

  return v42;
}

- (NSMutableDictionary)allowedAppVersionsCache
{
  return self->_allowedAppVersionsCache;
}

- (unint64_t)c2AllOperationMetricsReportFrequency:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("c2MetricsLegacy.allOperationMetrics.reportFrequency"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2AllOperationGroupMetricsReportFrequencyBase:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("c2MetricsLegacy.allOperationGroupMetrics.reportFrequencyBase"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2AllOperationMetricsReportFrequencyBase:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("c2MetricsLegacy.allOperationMetrics.reportFrequencyBase"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2AllOperationGroupMetricsReportFrequency:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("c2MetricsLegacy.allOperationGroupMetrics.reportFrequency"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (id)valueForKeyPath:(id)a3 forContainerID:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_valuesForContainerID_(self, v7, (uint64_t)a4);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, v22, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v8);
        objc_msgSend_valueForKeyPath_(*(void **)(*((_QWORD *)&v18 + 1) + 8 * v14), v11, (uint64_t)v6, (_QWORD)v18);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          goto LABEL_11;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)valuesForContainerID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  NSDictionary *values;

  v4 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    objc_msgSend_objectForKeyedSubscript_(self->_values, v5, (uint64_t)CFSTR("containerOverrides"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v4, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v8, v12, (uint64_t)v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend_addObject_(v7, v14, (uint64_t)v13);
    }

  }
  if (objc_msgSend_isAppleInternal(v4, v5, v6))
  {
    objc_msgSend_objectForKeyedSubscript_(self->_values, v15, (uint64_t)CFSTR("appleOverrides"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend_addObject_(v7, v17, (uint64_t)v16);
    }

  }
  values = self->_values;
  if (values)
    objc_msgSend_addObject_(v7, v15, (uint64_t)values);

  return v7;
}

- (unint64_t)maxBatchSize:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;

  v4 = (void *)MEMORY[0x1E0C94C00];
  v5 = a3;
  objc_msgSend_sharedOptions(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_maxBatchSize(v8, v9, v10);

  objc_msgSend_valueForKeyPath_forContainerID_(self, v12, (uint64_t)CFSTR("maxBatchSize"), v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend_unsignedIntegerValue(v13, v14, v15);

  return v11;
}

- (unint64_t)c2NetworkMetricsReportFrequencyBase:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("c2MetricsLegacy.reportFrequencyBase"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2NetworkMetricsReportFrequency:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("c2MetricsLegacy.reportFrequency"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2ClientOperationMetricsReportFrequencyBase:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("c2MetricsLegacy.clientOperationMetrics.reportFrequencyBase"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2ClientOperationMetricsReportFrequency:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("c2MetricsLegacy.clientOperationMetrics.reportFrequency"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (BOOL)allowExpiredDNSBehavior:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  char v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;

  v4 = (void *)MEMORY[0x1E0C94C00];
  v5 = a3;
  objc_msgSend_sharedOptions(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_allowExpiredDNSBehavior(v8, v9, v10);

  objc_msgSend_valueForKeyPath_forContainerID_(self, v12, (uint64_t)CFSTR("allowExpiredDNSBehavior"), v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend_BOOLValue(v13, v14, v15);

  return v11;
}

- (CKDServerConfiguration)initWithValues:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKDServerConfiguration *v7;
  uint64_t v8;
  NSDictionary *values;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSDate *expiry;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDServerConfiguration;
  v7 = -[CKDServerConfiguration init](&v21, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_copy(v4, v5, v6);
    values = v7->_values;
    v7->_values = (NSDictionary *)v8;

    objc_msgSend_objectForKeyedSubscript_(v4, v10, (uint64_t)CFSTR("expiresAfterSeconds"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    if (v11)
    {
      v15 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend_doubleValue(v11, v12, v13);
      objc_msgSend_dateWithTimeIntervalSinceNow_(v15, v16, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      expiry = v7->_expiry;
      v7->_expiry = (NSDate *)v18;

    }
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expiry(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_values(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v12, (uint64_t)CFSTR("<%@ %p> (Expires %@, Values %@)"), v5, self, v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (int64_t)tokenRegisterDays:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  int64_t v6;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("pushTokenRegisterDays"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend_integerValue(v3, v4, v5);
  else
    v6 = -1;

  return v6;
}

- (id)transcodeServerPublicKeyURLs:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("assetKeyEncryption"), a3);
}

- (id)cloudMediaProcessingPublicKeyURLString:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("cmpIdentityUrl"), a3);
}

- (BOOL)allowCloudMediaProcessingOffloadForSeed:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  char v7;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("allowCmpOffloadForSeed"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
    v7 = objc_msgSend_BOOLValue(v3, v4, v5);
  else
    v7 = 0;

  return v7;
}

- (BOOL)allowCloudMediaProcessingOffloadForGM:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  char v7;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("allowCmpOffloadForGM"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
    v7 = objc_msgSend_BOOLValue(v3, v4, v5);
  else
    v7 = 0;

  return v7;
}

- (double)publicIdentitiesExpirationTimeout:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;

  v4 = (void *)MEMORY[0x1E0C94C00];
  v5 = a3;
  objc_msgSend_sharedOptions(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicIdentitiesExpirationTimeout(v8, v9, v10);
  v12 = v11;

  objc_msgSend_valueForKeyPath_forContainerID_(self, v13, (uint64_t)CFSTR("expirationTimeout"), v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_doubleValue(v14, v15, v16);
    v12 = v17;
  }

  return v12;
}

- (unint64_t)c2ClientApplicationMetricsReportFrequency:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("c2MetricsLegacy.applicationMetrics.reportFrequency"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2ClientApplicationMetricsReportFrequencyBase:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("c2MetricsLegacy.applicationMetrics.reportFrequencyBase"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (id)chunkProfileConfigurationVersion:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("chunkProfileConfiguration.version"), a3);
}

- (id)chunkProfileConfigurationFileExtensionToProfileMap:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_valuesForContainerID_(self, v6, (uint64_t)v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend_reverseObjectEnumerator(v7, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v20, v24, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v10);
        objc_msgSend_valueForKeyPath_(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v16), v13, (uint64_t)CFSTR("chunkProfileConfiguration.fileExtensionToProfileMap"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_addEntriesFromDictionary_(v5, v18, (uint64_t)v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v20, v24, 16);
    }
    while (v14);
  }

  return v5;
}

- (id)chunkProfileConfigurationDefaultProfilePolicy:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("chunkProfileConfiguration.defaultProfilePolicy"), a3);
}

- (id)iCloudAppSiteAssociationData
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  char isKindOfClass;

  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("iCloudAppSiteAssociationData"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    objc_msgSend_allKeys(v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend_objectForKeyedSubscript_(v3, v10, (uint64_t)v9),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v11,
          (isKindOfClass & 1) == 0))
    {

      v9 = v3;
      v3 = 0;
    }

  }
  return v3;
}

- (unint64_t)maxInlineMergeableDeltaSize:(id)a3
{
  unint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;

  v3 = 92160;
  objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("maxInlineMergeableDeltaSize"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend_unsignedIntegerValue(v4, v5, v6);

  return v3;
}

- (id)suggestedMergeableDeltaSize:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_forContainerID_(self, a2, (uint64_t)CFSTR("suggestedMergeableDeltaSize"), a3);
}

- (CKDServerConfiguration)initWithPropertyDictionary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  CKDServerConfiguration *v8;
  const char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSDictionary *values;
  uint64_t v26;
  NSDate *expiry;

  v4 = a3;
  v8 = (CKDServerConfiguration *)objc_msgSend_init(self, v5, v6);
  if (v8)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v7, (uint64_t)CFSTR("valuesData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0C99E60]);
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      v19 = (void *)objc_msgSend_initWithObjects_(v11, v18, v12, v13, v14, v15, v16, v17, 0);
      objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E0CB3710], v20, (uint64_t)v19, v10, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend_mutableCopy(v21, v22, v23);
      values = v8->_values;
      v8->_values = (NSDictionary *)v24;

    }
    objc_msgSend_objectForKeyedSubscript_(v4, v9, (uint64_t)CFSTR("expiry"));
    v26 = objc_claimAutoreleasedReturnValue();
    expiry = v8->_expiry;
    v8->_expiry = (NSDate *)v26;

  }
  return v8;
}

- (id)dictionaryPropertyEncoding
{
  void *v3;
  NSDictionary *values;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  NSDate *expiry;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB36F8];
  values = self->_values;
  if (values)
  {
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], a2, (uint64_t)values, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v3, v9, (uint64_t)v8, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14[0] = CFSTR("valuesData");
  v14[1] = CFSTR("expiry");
  v15[0] = v7;
  expiry = self->_expiry;
  v11 = expiry;
  if (!expiry)
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v5, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v11;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!expiry)

  return v12;
}

- (NSDictionary)values
{
  return self->_values;
}

- (void)setAllowedAppVersionsCache:(id)a3
{
  objc_storeStrong((id *)&self->_allowedAppVersionsCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedAppVersionsCache, 0);
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
