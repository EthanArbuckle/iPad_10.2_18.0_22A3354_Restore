@implementation APMetric

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_relayData, 0);
  objc_storeStrong((id *)&self->_branch, 0);
  objc_storeStrong((id *)&self->_trace, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_internalProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)addInternalPropertyValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSDictionary *v21;
  NSDictionary *internalProperties;
  NSDictionary *v23;
  NSDictionary *v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11 = v7;
  if (v6 && v7)
  {
    if (self->_internalProperties)
    {
      objc_msgSend_internalProperties(self, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend_mutableCopy(v12, v13, v14, v15);

      objc_msgSend_setValue_forKey_(v16, v17, (uint64_t)v6, (uint64_t)v11);
      v21 = (NSDictionary *)objc_msgSend_copy(v16, v18, v19, v20);
      internalProperties = self->_internalProperties;
      self->_internalProperties = v21;

    }
    else
    {
      v25 = v7;
      v26[0] = v6;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v26, (uint64_t)&v25, 1);
      v23 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v24 = self->_internalProperties;
      self->_internalProperties = v23;

    }
  }

}

- (int64_t)purpose
{
  return self->_purpose;
}

- (int64_t)metric
{
  return self->_metric;
}

- (BOOL)validateMetricAndSetupIdentifiers:(id)a3
{
  return 1;
}

- (APMetric)initWithCoder:(id)a3
{
  id v4;
  APMetric *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSDate *timestamp;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSString *contentIdentifier;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSString *contextIdentifier;
  const char *v34;
  uint64_t v35;
  NSDictionary *properties;
  const char *v37;
  uint64_t v38;
  NSDictionary *internalProperties;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  NSString *trace;
  const char *v48;
  uint64_t v49;
  NSArray *branch;
  const char *v51;
  uint64_t v52;
  NSDictionary *relayData;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  NSString *handle;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  NSArray *environment;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  APMetric *v71;
  void *context;
  objc_super v74;

  v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)APMetric;
  v5 = -[APMetric init](&v74, sel_init);
  if (!v5)
    goto LABEL_3;
  context = (void *)MEMORY[0x1D17CBC78]();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend_setWithObjects_(v6, v15, v7, v16, v8, v9, v10, v11, v12, v13, v14, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_purpose = (int)objc_msgSend_decodeInt32ForKey_(v4, v18, (uint64_t)CFSTR("purpose"), v19);
  v5->_metric = (int)objc_msgSend_decodeInt32ForKey_(v4, v20, (uint64_t)CFSTR("metric"), v21);
  v22 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, (uint64_t)CFSTR("timestamp"));
  v24 = objc_claimAutoreleasedReturnValue();
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v24;

  v26 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("content_identifier"));
  v28 = objc_claimAutoreleasedReturnValue();
  contentIdentifier = v5->_contentIdentifier;
  v5->_contentIdentifier = (NSString *)v28;

  v30 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, (uint64_t)CFSTR("context_identifier"));
  v32 = objc_claimAutoreleasedReturnValue();
  contextIdentifier = v5->_contextIdentifier;
  v5->_contextIdentifier = (NSString *)v32;

  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v17, (uint64_t)CFSTR("properties"));
  v35 = objc_claimAutoreleasedReturnValue();
  properties = v5->_properties;
  v5->_properties = (NSDictionary *)v35;

  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v37, (uint64_t)v17, (uint64_t)CFSTR("internal_properties"));
  v38 = objc_claimAutoreleasedReturnValue();
  internalProperties = v5->_internalProperties;
  v5->_internalProperties = (NSDictionary *)v38;

  v5->_options = (int)objc_msgSend_decodeInt32ForKey_(v4, v40, (uint64_t)CFSTR("options"), v41);
  v5->_order = (int)objc_msgSend_decodeInt32ForKey_(v4, v42, (uint64_t)CFSTR("order"), v43);
  v44 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, (uint64_t)CFSTR("trace"));
  v46 = objc_claimAutoreleasedReturnValue();
  trace = v5->_trace;
  v5->_trace = (NSString *)v46;

  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v48, (uint64_t)v17, (uint64_t)CFSTR("branch"));
  v49 = objc_claimAutoreleasedReturnValue();
  branch = v5->_branch;
  v5->_branch = (NSArray *)v49;

  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v51, (uint64_t)v17, (uint64_t)CFSTR("relay"));
  v52 = objc_claimAutoreleasedReturnValue();
  relayData = v5->_relayData;
  v5->_relayData = (NSDictionary *)v52;

  v54 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, (uint64_t)CFSTR("handle"));
  v56 = objc_claimAutoreleasedReturnValue();
  handle = v5->_handle;
  v5->_handle = (NSString *)v56;

  v58 = (void *)MEMORY[0x1E0C99E60];
  v59 = objc_opt_class();
  v60 = objc_opt_class();
  objc_msgSend_setWithObjects_(v58, v61, v59, v62, v60, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v64, (uint64_t)v63, (uint64_t)CFSTR("environment"));
  v65 = objc_claimAutoreleasedReturnValue();
  environment = v5->_environment;
  v5->_environment = (NSArray *)v65;

  v5->_source = objc_msgSend_decodeInt32ForKey_(v4, v67, (uint64_t)CFSTR("source"), v68);
  LODWORD(v59) = objc_msgSend_validateMetricAndSetupIdentifiers_(v5, v69, (uint64_t)v4, v70);

  objc_autoreleasePoolPop(context);
  v71 = 0;
  if ((_DWORD)v59)
LABEL_3:
    v71 = v5;

  return v71;
}

- (id)_properties
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  __CFString *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend_properties(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend_allKeys(v4, v5, v6, v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v9)
  {
    v12 = v9;
    v13 = 0;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v4, v10, v16, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_description(v17, v19, v20, v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v22;
        if (v13)
        {
          objc_msgSend_stringWithFormat_(v18, v23, (uint64_t)CFSTR("%@ %@: %@"), v24, v13, v16, v22);
          v26 = objc_claimAutoreleasedReturnValue();

          v13 = (__CFString *)v26;
        }
        else
        {
          objc_msgSend_stringWithFormat_(v18, v23, (uint64_t)CFSTR(" %@: %@"), v24, v16, v22);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  if (v13)
    v27 = v13;
  else
    v27 = &stru_1E8C4E328;
  v28 = v27;

  return v28;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (id)_internalProperties
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  __CFString *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend_internalProperties(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend_allKeys(v4, v5, v6, v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v9)
  {
    v12 = v9;
    v13 = 0;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v4, v10, v16, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_description(v17, v19, v20, v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v22;
        if (v13)
        {
          objc_msgSend_stringWithFormat_(v18, v23, (uint64_t)CFSTR("%@ %@: %@"), v24, v13, v16, v22);
          v26 = objc_claimAutoreleasedReturnValue();

          v13 = (__CFString *)v26;
        }
        else
        {
          objc_msgSend_stringWithFormat_(v18, v23, (uint64_t)CFSTR(" %@: %@"), v24, v16, v22);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  if (v13)
    v27 = v13;
  else
    v27 = &stru_1E8C4E328;
  v28 = v27;

  return v28;
}

- (NSDictionary)internalProperties
{
  return self->_internalProperties;
}

- (id)_relayData
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  __CFString *v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend_relayData(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend_allKeys(v4, v5, v6, v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v9)
  {
    v12 = v9;
    v13 = 0;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v4, v10, v16, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_description(v17, v19, v20, v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v22;
        if (v13)
        {
          objc_msgSend_stringWithFormat_(v18, v23, (uint64_t)CFSTR("%@ %@: %@"), v24, v13, v16, v22);
          v26 = objc_claimAutoreleasedReturnValue();

          v13 = (__CFString *)v26;
        }
        else
        {
          objc_msgSend_stringWithFormat_(v18, v23, (uint64_t)CFSTR(" %@: %@"), v24, v16, v22);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  if (v13)
    v27 = v13;
  else
    v27 = &stru_1E8C4E328;
  v28 = v27;

  return v28;
}

- (NSDictionary)relayData
{
  return self->_relayData;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t purpose_low;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  id v20;

  purpose_low = LODWORD(self->_purpose);
  v20 = a3;
  objc_msgSend_encodeInt32_forKey_(v20, v5, purpose_low, (uint64_t)CFSTR("purpose"));
  objc_msgSend_encodeInt32_forKey_(v20, v6, LODWORD(self->_metric), (uint64_t)CFSTR("metric"));
  objc_msgSend_encodeObject_forKey_(v20, v7, (uint64_t)self->_timestamp, (uint64_t)CFSTR("timestamp"));
  objc_msgSend_encodeObject_forKey_(v20, v8, (uint64_t)self->_contentIdentifier, (uint64_t)CFSTR("content_identifier"));
  objc_msgSend_encodeObject_forKey_(v20, v9, (uint64_t)self->_contextIdentifier, (uint64_t)CFSTR("context_identifier"));
  objc_msgSend_encodeObject_forKey_(v20, v10, (uint64_t)self->_properties, (uint64_t)CFSTR("properties"));
  objc_msgSend_encodeObject_forKey_(v20, v11, (uint64_t)self->_internalProperties, (uint64_t)CFSTR("internal_properties"));
  objc_msgSend_encodeInt32_forKey_(v20, v12, LODWORD(self->_options), (uint64_t)CFSTR("options"));
  objc_msgSend_encodeObject_forKey_(v20, v13, (uint64_t)self->_handle, (uint64_t)CFSTR("handle"));
  objc_msgSend_encodeInt32_forKey_(v20, v14, LODWORD(self->_order), (uint64_t)CFSTR("order"));
  objc_msgSend_encodeObject_forKey_(v20, v15, (uint64_t)self->_trace, (uint64_t)CFSTR("trace"));
  objc_msgSend_encodeObject_forKey_(v20, v16, (uint64_t)self->_branch, (uint64_t)CFSTR("branch"));
  objc_msgSend_encodeObject_forKey_(v20, v17, (uint64_t)self->_relayData, (uint64_t)CFSTR("relay"));
  objc_msgSend_encodeObject_forKey_(v20, v18, (uint64_t)self->_environment, (uint64_t)CFSTR("environment"));
  objc_msgSend_encodeInt32_forKey_(v20, v19, self->_source, (uint64_t)CFSTR("source"));

}

- (id)_options
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  __CFString *v10;

  objc_msgSend__optionsArray(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    objc_msgSend_componentsJoinedByString_(v4, v8, (uint64_t)CFSTR("|"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("none");
  }

  return v10;
}

- (id)_optionsArray
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = objc_msgSend_options(self, a2, v2, v3);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  if (v4 >= 0xFFFFFFFF80000000)
    objc_msgSend_addObject_(v8, v9, (uint64_t)CFSTR("flush"), v10);
  return v11;
}

- (int64_t)options
{
  return self->_options;
}

- (id)copyWithZone:(_NSZone *)a3
{
  APMetric *v3;
  const char *v4;
  void *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  APMetric *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  v22 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v4, (uint64_t)v3, 1, &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  objc_sync_exit(v3);

  if (v6)
  {
    APLogForCategory(0x1DuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v3;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1CF251000, v7, OS_LOG_TYPE_ERROR, "Error archiving metric %@! error: %@", buf, 0x16u);
    }

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("Error archiving metric %@! error: %@"), v9, v3, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    APSimulateCrash((const char *)5, v10, 0);

  }
  v11 = (void *)MEMORY[0x1E0CB3710];
  v12 = objc_opt_class();
  v21 = v6;
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v11, v13, v12, (uint64_t)v5, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v21;

  if (v15)
  {
    APLogForCategory(0x1DuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v3;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1CF251000, v16, OS_LOG_TYPE_ERROR, "Error unarchiving metric %@! error: %@", buf, 0x16u);
    }

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v17, (uint64_t)CFSTR("Error unarchiving metric %@! error: %@"), v18, v3, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    APSimulateCrash((const char *)5, v19, 0);

  }
  return v14;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)order
{
  return self->_order;
}

- (NSArray)environment
{
  return self->_environment;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setSource:(unsigned int)a3
{
  self->_source = a3;
}

- (NSString)trace
{
  return self->_trace;
}

- (unsigned)source
{
  return self->_source;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSArray)branch
{
  return self->_branch;
}

- (APMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 branch:(id)a8 properties:(id)a9 internalProperties:(id)a10 relayData:(id)a11 environment:(id)a12 order:(int64_t)a13 options:(int64_t)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  APMetric *v28;
  APMetric *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSDate *timestamp;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSDictionary *properties;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSDictionary *internalProperties;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSDictionary *relayData;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSString *handle;
  APMetric *v55;
  NSObject *log;
  id obj;
  id v60;
  id v61;
  id v62;
  objc_super v63;
  uint8_t buf[4];
  int v65;
  __int16 v66;
  int v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v62 = a5;
  v61 = a6;
  v20 = a7;
  obj = a8;
  v60 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  if (!objc_msgSend_dictionaryContainsContainers(v21, v25, v26, v27))
    goto LABEL_12;
  if (a4 > 1499)
  {
    if (a4 == 1500 || a4 == 2801 || a4 == 2803)
      goto LABEL_12;
  }
  else if ((unint64_t)(a4 - 1403) <= 3 && a4 != 1404)
  {
    goto LABEL_12;
  }
  APLogForCategory(0x1DuLL);
  log = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v65 = a4;
    v66 = 1024;
    v67 = a3;
    _os_log_impl(&dword_1CF251000, log, OS_LOG_TYPE_DEFAULT, "Metric (%d) for purpose (%d) has a property that is a container!", buf, 0xEu);
  }

LABEL_12:
  v63.receiver = self;
  v63.super_class = (Class)APMetric;
  v28 = -[APMetric init](&v63, sel_init);
  v29 = v28;
  if (!v28)
    goto LABEL_16;
  v28->_purpose = a3;
  v28->_metric = a4;
  objc_storeStrong((id *)&v28->_contentIdentifier, a5);
  objc_storeStrong((id *)&v29->_contextIdentifier, a6);
  objc_msgSend_date(MEMORY[0x1E0C99D68], v30, v31, v32);
  v33 = objc_claimAutoreleasedReturnValue();
  timestamp = v29->_timestamp;
  v29->_timestamp = (NSDate *)v33;

  v38 = objc_msgSend_copy(v21, v35, v36, v37);
  properties = v29->_properties;
  v29->_properties = (NSDictionary *)v38;

  v43 = objc_msgSend_copy(v22, v40, v41, v42);
  internalProperties = v29->_internalProperties;
  v29->_internalProperties = (NSDictionary *)v43;

  v29->_options = a14;
  objc_storeStrong((id *)&v29->_contextIdentifier, a6);
  v29->_purpose = a3;
  objc_storeStrong((id *)&v29->_branch, obj);
  v48 = objc_msgSend_copy(v23, v45, v46, v47);
  relayData = v29->_relayData;
  v29->_relayData = (NSDictionary *)v48;

  objc_storeStrong((id *)&v29->_environment, a12);
  v29->_order = a13;
  if (v20)
  {
    v53 = objc_msgSend_copy(v20, v50, v51, v52);
    handle = v29->_handle;
    v29->_handle = (NSString *)v53;

  }
  v55 = 0;
  if (objc_msgSend_validateMetricAndSetupIdentifiers_(v29, v50, 0, v52, a12))
LABEL_16:
    v55 = v29;

  return v55;
}

- (NSString)bundleIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_internalProperties(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("bundle_identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)updatePurpose:(int64_t)a3
{
  ((void (*)(APMetric *, char *, int64_t))MEMORY[0x1E0DE7D20])(self, sel_setPurpose_, a3);
}

- (id)_addOptionsToProperties:(id)a3
{
  return a3;
}

- (id)_descriptionWithFormat:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __CFString *v43;
  __CFString *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  id v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  __CFString *v92;
  void *v93;
  __CFString *v94;
  id v95;
  uint8_t buf[4];
  void *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB36A8];
  v5 = a3;
  objc_msgSend_apLocalSharedFormatter(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timestamp(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v9;
  objc_msgSend_stringFromDate_(v9, v14, (uint64_t)v13, v15);
  v91 = objc_claimAutoreleasedReturnValue();

  v89 = objc_msgSend_purpose(self, v16, v17, v18);
  v88 = objc_msgSend_metric(self, v19, v20, v21);
  objc_msgSend_handle(self, v22, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  v27 = CFSTR("none");
  if (v25)
    v28 = (__CFString *)v25;
  else
    v28 = CFSTR("none");
  v94 = v28;

  objc_msgSend__options(self, v29, v30, v31);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentIdentifier(self, v32, v33, v34);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  if (v35)
    v37 = (__CFString *)v35;
  else
    v37 = CFSTR("none");
  v92 = v37;

  objc_msgSend_contextIdentifier(self, v38, v39, v40);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v41;
  if (v41)
    v43 = (__CFString *)v41;
  else
    v43 = CFSTR("none");
  v44 = v43;

  objc_msgSend_bundleIdentifier(self, v45, v46, v47);
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v48;
  if (v48)
    v50 = (__CFString *)v48;
  else
    v50 = CFSTR("none");
  v51 = v50;

  objc_msgSend__properties(self, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__internalProperties(self, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__relayData(self, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend_order(self, v64, v65, v66);
  objc_msgSend_environment(self, v68, v69, v70);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    objc_msgSend_environment(self, v71, v72, v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v75, v76, (uint64_t)CFSTR(","), v77);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v95 = 0;
  v78 = (void *)v91;
  objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x1E0CB3940], v79, (uint64_t)v5, (uint64_t)CFSTR("%@%ld%ld%@%@%@%@%@%@%@%@%ld%@"), &v95, v91, v89, v88, v94, v93, v92, v44, v51, v55, v59, v63, v67, v27);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = v95;
  if (v81)
  {
    APLogForCategory(0x1DuLL);
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v81, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v97 = v86;
      _os_log_impl(&dword_1CF251000, v82, OS_LOG_TYPE_ERROR, "Error retrieving description for metric: %@", buf, 0xCu);

      v78 = (void *)v91;
    }

  }
  return v80;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  __CFString *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  __CFString *v121;
  _QWORD v122[13];
  _QWORD v123[15];

  v123[13] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, a2, v2, v3))
  {
    v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v10 = (void *)objc_msgSend_initWithSuiteName_(v7, v8, (uint64_t)CFSTR("com.apple.AdPlatforms"), v9);
    if (objc_msgSend_BOOLForKey_(v10, v11, (uint64_t)CFSTR("AutomationLoggingEnabled"), v12))
    {
      objc_msgSend_apUTCSharedFormatter(MEMORY[0x1E0CB36A8], v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timestamp(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringFromDate_(v16, v21, (uint64_t)v20, v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v27 = objc_msgSend_purpose(self, v24, v25, v26);
      v31 = objc_msgSend_metric(self, v28, v29, v30);
      objc_msgSend_handle(self, v32, v33, v34);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      v37 = &stru_1E8C4E328;
      if (v35)
        v37 = (__CFString *)v35;
      v121 = v37;

      objc_msgSend__optionsArray(self, v38, v39, v40);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contentIdentifier(self, v41, v42, v43);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bundleIdentifier(self, v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v47;
      if (v47)
      {
        v118 = v47;
      }
      else
      {
        objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v48, v49, v50);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bundleIdentifier(v54, v55, v56, v57);
        v118 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend_contextIdentifier(self, v58, v59, v60);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_properties(self, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__addOptionsToProperties_(self, v65, (uint64_t)v64, v66);
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_internalProperties(self, v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v70;
      if (v70)
      {
        v75 = v70;
      }
      else
      {
        objc_msgSend_dictionary(MEMORY[0x1E0C99D80], v71, v72, v73);
        v75 = (id)objc_claimAutoreleasedReturnValue();
      }
      v115 = v75;

      objc_msgSend_relayData(self, v76, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v79;
      if (v79)
      {
        v84 = v79;
      }
      else
      {
        objc_msgSend_dictionary(MEMORY[0x1E0C99D80], v80, v81, v82);
        v84 = (id)objc_claimAutoreleasedReturnValue();
      }
      v114 = v84;

      v88 = objc_msgSend_order(self, v85, v86, v87);
      objc_msgSend_environment(self, v89, v90, v91);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      if (v95)
      {
        objc_msgSend_environment(self, v92, v93, v94);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_componentsJoinedByString_(v96, v97, (uint64_t)CFSTR(","), v98);
        v112 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v112 = &stru_1E8C4E328;
      }

      v123[0] = v23;
      v122[0] = CFSTR("TS");
      v122[1] = CFSTR("R");
      v113 = (void *)v23;
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v99, v27, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v123[1] = v101;
      v122[2] = CFSTR("M");
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v102, v31, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v123[2] = v104;
      v123[3] = v121;
      v122[3] = CFSTR("H");
      v122[4] = CFSTR("O");
      v123[4] = v120;
      v123[5] = v119;
      v122[5] = CFSTR("CI");
      v122[6] = CFSTR("CX");
      v123[6] = v117;
      v123[7] = v118;
      v122[7] = CFSTR("BID");
      v122[8] = CFSTR("P");
      v123[8] = v116;
      v123[9] = v115;
      v122[9] = CFSTR("IP");
      v122[10] = CFSTR("ORD");
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v105, v88, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v123[10] = v107;
      v123[11] = v114;
      v122[11] = CFSTR("REL");
      v122[12] = CFSTR("ENV");
      v123[12] = v112;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v108, (uint64_t)v123, (uint64_t)v122, 13);
      v109 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_jsonStringWithOptions_(v109, v110, 1, v111);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend__descriptionWithFormat_(self, v13, (uint64_t)CFSTR("%@ Purpose: %ld Metric: %ld H: %@ Options: %@, CID: %@ CX: %@ BID: %@ P: %@ IP: %@ REL: %@, ORD: %ld ENV: %@"), v15);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return (NSString *)v53;
  }
  else
  {
    objc_msgSend__descriptionWithFormat_(self, v5, (uint64_t)CFSTR("%@ R: %ld M: %ld H: %@ O: %@, CI: %@ CX: %@ BID: %@ P: %@ IP: %@ REL: %@, ORD: %ld ENV: %@"), v6);
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (void)setTrace:(id)a3
{
  objc_storeStrong((id *)&self->_trace, a3);
}

- (void)setBranch:(id)a3
{
  objc_storeStrong((id *)&self->_branch, a3);
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

@end
