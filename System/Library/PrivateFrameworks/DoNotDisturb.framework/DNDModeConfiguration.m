@implementation DNDModeConfiguration

+ (id)defaultModeConfiguration
{
  void *v2;
  void *v3;
  DNDMutableModeConfiguration *v4;
  DNDMutableModeConfiguration *v5;

  +[DNDMode defaultMode](DNDMode, "defaultMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDMutableConfiguration defaultConfiguration](DNDMutableConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [DNDMutableModeConfiguration alloc];
  v5 = -[DNDModeConfiguration initWithMode:configuration:triggers:](v4, "initWithMode:configuration:triggers:", v2, v3, MEMORY[0x1E0C9AA60]);
  -[DNDMutableModeConfiguration setAutomaticallyGenerated:](v5, "setAutomaticallyGenerated:", 1);

  return v5;
}

+ (id)defaultReduceInterruptionsMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  DNDMutableModeConfiguration *v6;
  DNDMutableModeConfiguration *v7;

  +[DNDMode defaultReduceInterruptionsMode](DNDMode, "defaultReduceInterruptionsMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDMutableConfiguration defaultConfiguration](DNDMutableConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowIntelligentManagement:", 2);
  objc_msgSend(v3, "setHideApplicationBadges:", 1);
  objc_msgSend(v3, "phoneCallBypassSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setImmediateBypassEventSourceType:", 1);
  objc_msgSend(v3, "setPhoneCallBypassSettings:", v5);
  v6 = [DNDMutableModeConfiguration alloc];
  v7 = -[DNDModeConfiguration initWithMode:configuration:triggers:](v6, "initWithMode:configuration:triggers:", v2, v3, MEMORY[0x1E0C9AA60]);
  -[DNDMutableModeConfiguration setAutomaticallyGenerated:](v7, "setAutomaticallyGenerated:", 1);

  return v7;
}

- (DNDModeConfiguration)initWithMode:(id)a3 configuration:(id)a4 triggers:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  DNDModeConfiguration *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = DNDOperatingSystemVersionNotSet;
  v17 = -1;
  LOBYTE(v15) = 0;
  v13 = -[DNDModeConfiguration initWithMode:configuration:triggers:impactsAvailability:dimsLockScreen:created:lastModified:automaticallyGenerated:compatibilityVersion:lastModifiedByVersion:lastModifiedByDeviceID:](self, "initWithMode:configuration:triggers:impactsAvailability:dimsLockScreen:created:lastModified:automaticallyGenerated:compatibilityVersion:lastModifiedByVersion:lastModifiedByDeviceID:", v11, v10, v9, 0, 0, v12, v12, v15, 2, &v16, 0);

  return v13;
}

- (DNDModeConfiguration)initWithMode:(id)a3 configuration:(id)a4 triggers:(id)a5 impactsAvailability:(unint64_t)a6 dimsLockScreen:(unint64_t)a7 created:(id)a8 lastModified:(id)a9 automaticallyGenerated:(BOOL)a10 compatibilityVersion:(int64_t)a11 lastModifiedByVersion:(id *)a12 lastModifiedByDeviceID:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  DNDModeConfiguration *v25;
  uint64_t v26;
  DNDMode *mode;
  uint64_t v28;
  DNDConfiguration *configuration;
  uint64_t v30;
  NSArray *triggers;
  uint64_t v32;
  NSDate *created;
  uint64_t v34;
  NSDate *lastModified;
  __int128 v36;
  uint64_t v37;
  NSString *lastModifiedByDeviceID;
  char v39;
  objc_super v41;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a8;
  v23 = a9;
  v24 = a13;
  v41.receiver = self;
  v41.super_class = (Class)DNDModeConfiguration;
  v25 = -[DNDModeConfiguration init](&v41, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v19, "copy");
    mode = v25->_mode;
    v25->_mode = (DNDMode *)v26;

    v28 = objc_msgSend(v20, "copy");
    configuration = v25->_configuration;
    v25->_configuration = (DNDConfiguration *)v28;

    v30 = objc_msgSend(v21, "copy");
    triggers = v25->_triggers;
    v25->_triggers = (NSArray *)v30;

    v25->_impactsAvailability = a6;
    v25->_dimsLockScreen = a7;
    v32 = objc_msgSend(v22, "copy");
    created = v25->_created;
    v25->_created = (NSDate *)v32;

    v34 = objc_msgSend(v23, "copy");
    lastModified = v25->_lastModified;
    v25->_lastModified = (NSDate *)v34;

    v25->_automaticallyGenerated = a10;
    v25->_compatibilityVersion = a11;
    v36 = *(_OWORD *)&a12->var0;
    v25->_lastModifiedByVersion.patchVersion = a12->var2;
    *(_OWORD *)&v25->_lastModifiedByVersion.majorVersion = v36;
    v37 = objc_msgSend(v24, "copy");
    lastModifiedByDeviceID = v25->_lastModifiedByDeviceID;
    v25->_lastModifiedByDeviceID = (NSString *)v37;

    if ((objc_msgSend(v20, "hasSecureData") & 1) != 0)
      v39 = 1;
    else
      v39 = -[DNDModeConfiguration _containsSecureTriggers:](v25, "_containsSecureTriggers:", v21);
    v25->_hasSecureData = v39;
  }

  return v25;
}

- (id)_initWithModeConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  DNDModeConfiguration *v13;
  uint64_t v15;
  void *v17;
  _QWORD v18[3];

  v3 = a3;
  objc_msgSend(v3, "mode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "impactsAvailability");
  v7 = objc_msgSend(v3, "dimsLockScreen");
  objc_msgSend(v3, "created");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastModified");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "isAutomaticallyGenerated");
  v11 = objc_msgSend(v3, "compatibilityVersion");
  if (v3)
    objc_msgSend(v3, "lastModifiedByVersion");
  else
    memset(v18, 0, sizeof(v18));
  objc_msgSend(v3, "lastModifiedByDeviceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = v10;
  v13 = -[DNDModeConfiguration initWithMode:configuration:triggers:impactsAvailability:dimsLockScreen:created:lastModified:automaticallyGenerated:compatibilityVersion:lastModifiedByVersion:lastModifiedByDeviceID:](self, "initWithMode:configuration:triggers:impactsAvailability:dimsLockScreen:created:lastModified:automaticallyGenerated:compatibilityVersion:lastModifiedByVersion:lastModifiedByDeviceID:", v17, v4, v5, v6, v7, v8, v9, v15, v11, v18, v12);

  return v13;
}

- (unint64_t)allowSmartEntry
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_triggers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = 2;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
      v9 = objc_opt_class();
      v10 = v8;
      if (v9)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = (uint64_t)v10;
        else
          v9 = 0;
      }

      if (v9)
        break;
      if (v4 == ++v7)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v6 = 1;
  }

  return v6;
}

- (id)mergeDecision:(id)a3 reason:(id)a4
{
  DNDModeConfiguration *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = (DNDModeConfiguration *)a3;
  v7 = a4;
  v8 = DNDLogModeConfiguration;
  v9 = os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT);
  if (v6 == self)
  {
    if (v9)
    {
      v12 = 138543362;
      v13 = v7;
      v10 = "Merge decision: self; reason: %{public}@";
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    v12 = 138543362;
    v13 = v7;
    v10 = "Merge decision: other; reason: %{public}@";
LABEL_6:
    _os_log_impl(&dword_19ABEB000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0xCu);
  }

  return v6;
}

- (id)mergeWithRemoteModeConfiguration:(id)a3
{
  DNDModeConfiguration *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  DNDModeConfiguration *v11;
  DNDModeConfiguration *v12;
  NSDate *lastModified;
  void *v14;
  void *v16;
  int v17;
  void *v18;

  v4 = (DNDModeConfiguration *)a3;
  if (!v4)
  {
    v10 = CFSTR("nothing to merge with");
    goto LABEL_10;
  }
  v5 = -[DNDMode visibility](self->_mode, "visibility");
  -[DNDModeConfiguration mode](v4, "mode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "visibility");

  if (self->_automaticallyGenerated != v4->_automaticallyGenerated)
  {
    if (v5 == v7)
    {
      if (!v5)
      {
        v10 = CFSTR("automaticallyGenerated");
        if (self->_automaticallyGenerated)
          goto LABEL_30;
        goto LABEL_10;
      }
    }
    else
    {
      if (!v5 && !self->_automaticallyGenerated)
      {
        v10 = CFSTR("visibility");
        goto LABEL_10;
      }
      if (!v7 && !v4->_automaticallyGenerated)
      {
        v10 = CFSTR("visibility");
        goto LABEL_30;
      }
    }
  }
  if (v5 != v7)
    goto LABEL_35;
  v8 = -[DNDModeConfiguration resolvedCompatibilityVersion](self, "resolvedCompatibilityVersion");
  v9 = -[DNDModeConfiguration rawResolvedCompatibilityVersion](v4, "rawResolvedCompatibilityVersion");
  if (v8 == v9)
    goto LABEL_35;
  if (v8 < 3 && v9 > 3)
  {
    v10 = CFSTR("compatibilityVersion");
    goto LABEL_30;
  }
  if (v9 >= 3 || v8 <= 3)
  {
LABEL_35:
    if (-[NSDate isEqualToDate:](v4->_lastModified, "isEqualToDate:", self->_lastModified))
    {
      v10 = CFSTR("lastModified same");
LABEL_30:
      v11 = self;
      v12 = v4;
      goto LABEL_31;
    }
    lastModified = self->_lastModified;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(lastModified) = -[NSDate isEqualToDate:](lastModified, "isEqualToDate:", v14);

    if ((_DWORD)lastModified)
    {
      v10 = CFSTR("lastModified distantPast");
    }
    else
    {
      -[NSDate laterDate:](v4->_lastModified, "laterDate:", self->_lastModified);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToDate:", v4->_lastModified);

      if (v17)
      {
        v10 = CFSTR("lastModified");
        goto LABEL_30;
      }
      v10 = CFSTR("fallthrough");
    }
  }
  else
  {
    v10 = CFSTR("compatibilityVersion");
  }
LABEL_10:
  v11 = self;
  v12 = self;
LABEL_31:
  -[DNDModeConfiguration mergeDecision:reason:](v11, "mergeDecision:reason:", v12, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)hasSecureData
{
  return self->_hasSecureData;
}

- (BOOL)isSupportedConfiguration
{
  void *v3;
  char v4;
  uint64_t v6;

  -[DNDModeConfiguration mode](self, "mode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaceholder");

  if ((v4 & 1) != 0)
    return 1;
  v6 = -[DNDModeConfiguration resolvedCompatibilityVersion](self, "resolvedCompatibilityVersion");
  return v6 < 21 && v6 >= 2;
}

- (int64_t)resolvedCompatibilityVersion
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  int64_t v8;

  v3 = -[DNDModeConfiguration compatibilityVersion](self, "compatibilityVersion");
  if (v3 >= 2)
    v4 = v3;
  else
    v4 = 2;
  -[DNDModeConfiguration configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compatibilityVersion");

  if (v4 > v6)
    v6 = v4;
  -[DNDModeConfiguration triggers](self, "triggers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DNDModeConfiguration _maxTriggerCompatibilityVersion:](self, "_maxTriggerCompatibilityVersion:", v7);

  if (v6 <= v8)
    return v8;
  else
    return v6;
}

- (int64_t)rawResolvedCompatibilityVersion
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  int64_t v8;

  v3 = -[DNDModeConfiguration compatibilityVersion](self, "compatibilityVersion");
  if (v3 >= 2)
    v4 = v3;
  else
    v4 = 2;
  -[DNDModeConfiguration configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rawCompatibilityVersion");

  if (v4 > v6)
    v6 = v4;
  -[DNDModeConfiguration triggers](self, "triggers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DNDModeConfiguration _maxTriggerCompatibilityVersion:](self, "_maxTriggerCompatibilityVersion:", v7);

  if (v6 <= v8)
    return v8;
  else
    return v6;
}

- (int64_t)compatibilityVersion
{
  uint64_t compatibilityVersion;
  void *v3;
  uint64_t v4;

  compatibilityVersion = self->_compatibilityVersion;
  if (compatibilityVersion <= 20)
  {
    -[DNDModeConfiguration mode](self, "mode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "semanticType");

    if (v4 == 9)
      return 20;
  }
  return compatibilityVersion;
}

- (void)log:(id)a3 withMessage:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[DNDModeConfiguration mode](self, "mode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543618;
    v21 = v9;
    v22 = 2114;
    v23 = v7;
    _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin: %{public}@", (uint8_t *)&v20, 0x16u);
  }
  v10 = v6;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[DNDModeConfiguration shortDescription](self, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v9;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@", (uint8_t *)&v20, 0x16u);

  }
  v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[DNDModeConfiguration created](self, "created");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDModeConfiguration lastModified](self, "lastModified");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[DNDModeConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated");
    v16 = -[DNDModeConfiguration hasSecureData](self, "hasSecureData");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[DNDModeConfiguration compatibilityVersion](self, "compatibilityVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544642;
    v21 = v9;
    v22 = 2114;
    v23 = v13;
    v24 = 2114;
    v25 = v14;
    v26 = 1026;
    v27 = v15;
    v28 = 1026;
    v29 = v16;
    v30 = 2114;
    v31 = v17;
    _os_log_impl(&dword_19ABEB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] created: %{public}@; lastModified: %{public}@; isAutomaticallyGenerated: %{public}d; hasSecureData: %"
      "{public}d; compatibilityVersion: %{public}@; ",
      (uint8_t *)&v20,
      0x36u);

  }
  v18 = v12;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[DNDModeConfiguration triggers](self, "triggers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543619;
    v21 = v9;
    v22 = 2113;
    v23 = v19;
    _os_log_impl(&dword_19ABEB000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] triggers: %{private}@", (uint8_t *)&v20, 0x16u);

  }
  -[DNDConfiguration log:withPrefix:](self->_configuration, "log:withPrefix:", v18, v9);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543362;
    v21 = v9;
    _os_log_impl(&dword_19ABEB000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] End", (uint8_t *)&v20, 0xCu);
  }

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;

  -[DNDModeConfiguration mode](self, "mode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDModeConfiguration configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDModeConfiguration triggers](self, "triggers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[DNDModeConfiguration impactsAvailability](self, "impactsAvailability");
  v10 = -[DNDModeConfiguration dimsLockScreen](self, "dimsLockScreen");
  -[DNDModeConfiguration created](self, "created");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[DNDModeConfiguration lastModified](self, "lastModified");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9 ^ v12 ^ objc_msgSend(v13, "hash");
  v15 = -[DNDModeConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated");
  v16 = v15 ^ -[DNDModeConfiguration compatibilityVersion](self, "compatibilityVersion");
  v17 = v14 ^ v16 ^ -[DNDModeConfiguration hasSecureData](self, "hasSecureData");

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  DNDModeConfiguration *v4;
  DNDModeConfiguration *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  unint64_t v45;
  _BOOL4 v46;
  int64_t v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;

  v4 = (DNDModeConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDModeConfiguration created](self, "created");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeConfiguration created](v5, "created");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDModeConfiguration created](self, "created");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          LOBYTE(v12) = 0;
          goto LABEL_92;
        }
        v9 = (void *)v8;
        -[DNDModeConfiguration created](v5, "created");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v80)
        {
          LOBYTE(v12) = 0;
LABEL_91:

          goto LABEL_92;
        }
        -[DNDModeConfiguration created](self, "created");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDModeConfiguration created](v5, "created");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v11))
        {
          LOBYTE(v12) = 0;
LABEL_90:

          goto LABEL_91;
        }
        v77 = v9;
        v78 = v11;
        v79 = v10;
      }
      -[DNDModeConfiguration lastModified](self, "lastModified");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeConfiguration lastModified](v5, "lastModified");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
        goto LABEL_16;
      -[DNDModeConfiguration lastModified](self, "lastModified");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        -[DNDModeConfiguration lastModified](v5, "lastModified");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = v13;
          v74 = (void *)v17;
          -[DNDModeConfiguration lastModified](self, "lastModified");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDModeConfiguration lastModified](v5, "lastModified");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v19, "isEqual:", v20) & 1) == 0)
          {

LABEL_88:
            LOBYTE(v12) = 0;
LABEL_89:
            v11 = v78;
            v10 = v79;
            v9 = v77;
            if (v6 != v7)
              goto LABEL_90;
LABEL_92:

            goto LABEL_93;
          }
          v70 = v16;
          v71 = v19;
          v75 = v20;
          v13 = v18;
LABEL_16:
          -[DNDModeConfiguration mode](self, "mode");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDModeConfiguration mode](v5, "mode");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v21;
          if (v21 == v22)
          {
            v27 = v75;
LABEL_24:
            -[DNDModeConfiguration configuration](self, "configuration");
            v28 = objc_claimAutoreleasedReturnValue();
            -[DNDModeConfiguration configuration](v5, "configuration");
            v29 = objc_claimAutoreleasedReturnValue();
            v73 = (void *)v28;
            v30 = v28 == v29;
            v31 = (void *)v29;
            if (v30)
            {
              v65 = v22;
              v36 = v27;
LABEL_34:
              -[DNDModeConfiguration triggers](self, "triggers");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDModeConfiguration triggers](v5, "triggers");
              v66 = v37;
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              if (v37 == v67)
              {
                v64 = v31;
                v75 = v36;
                v59 = v13;
                v42 = v68;
              }
              else
              {
                -[DNDModeConfiguration triggers](self, "triggers");
                v38 = objc_claimAutoreleasedReturnValue();
                if (!v38)
                {

                  LOBYTE(v12) = 0;
                  v51 = v73;
                  v44 = v65;
                  if (v73 == v31)
                  {
LABEL_76:

                    if (v76 != v44)
                    {

                    }
                    if (v13 == v14)
                      goto LABEL_80;
LABEL_79:

LABEL_80:
                    goto LABEL_89;
                  }
LABEL_75:

                  goto LABEL_76;
                }
                v39 = (void *)v38;
                -[DNDModeConfiguration triggers](v5, "triggers");
                v40 = objc_claimAutoreleasedReturnValue();
                v58 = v39;
                if (!v40)
                {
                  LOBYTE(v12) = 0;
                  v51 = v73;
                  v44 = v65;
                  goto LABEL_74;
                }
                v55 = (void *)v40;
                -[DNDModeConfiguration triggers](self, "triggers");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDModeConfiguration triggers](v5, "triggers");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = v41;
                if (!objc_msgSend(v41, "isEqual:"))
                {
                  LOBYTE(v12) = 0;
                  v44 = v65;
LABEL_73:

                  v51 = v73;
LABEL_74:

                  if (v51 == v31)
                    goto LABEL_76;
                  goto LABEL_75;
                }
                v64 = v31;
                v75 = v36;
                v59 = v13;
                v42 = v68;
              }
              v43 = -[DNDModeConfiguration impactsAvailability](self, "impactsAvailability");
              v44 = v65;
              v68 = v42;
              if (v43 != -[DNDModeConfiguration impactsAvailability](v5, "impactsAvailability")
                || (v45 = -[DNDModeConfiguration dimsLockScreen](self, "dimsLockScreen"),
                    v45 != -[DNDModeConfiguration dimsLockScreen](v5, "dimsLockScreen"))
                || (v46 = -[DNDModeConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated"),
                    v46 != -[DNDModeConfiguration isAutomaticallyGenerated](v5, "isAutomaticallyGenerated"))
                || (v47 = -[DNDModeConfiguration compatibilityVersion](self, "compatibilityVersion"),
                    v47 != -[DNDModeConfiguration compatibilityVersion](v5, "compatibilityVersion")))
              {
                if (v66 != v67)
                {

                  LOBYTE(v12) = 0;
                  v49 = v73;
                  v31 = v64;
                  v13 = v59;
                  if (v73 == v64)
                    goto LABEL_53;
                  goto LABEL_52;
                }
                LOBYTE(v12) = 0;
                v13 = v59;
                v31 = v64;
LABEL_69:

                v49 = v73;
                if (v73 == v31)
                {
LABEL_53:

                  if (v76 != v65)
                  {

                  }
                  if (v13 == v14)
                    goto LABEL_80;
                  goto LABEL_79;
                }
LABEL_52:

                goto LABEL_53;
              }
              v48 = -[DNDModeConfiguration hasSecureData](self, "hasSecureData");
              v12 = v48 ^ -[DNDModeConfiguration hasSecureData](v5, "hasSecureData") ^ 1;
              v13 = v59;
              v31 = v64;
              if (v66 == v67)
                goto LABEL_69;
              goto LABEL_73;
            }
            -[DNDModeConfiguration configuration](self, "configuration");
            v32 = objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              v62 = (void *)v32;
              -[DNDModeConfiguration configuration](v5, "configuration");
              v33 = objc_claimAutoreleasedReturnValue();
              if (v33)
              {
                v63 = v31;
                v75 = v27;
                v60 = (void *)v33;
                -[DNDModeConfiguration configuration](self, "configuration");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDModeConfiguration configuration](v5, "configuration");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v34, "isEqual:", v35) & 1) != 0)
                {
                  v65 = v22;
                  v56 = v35;
                  v57 = v34;
                  v36 = v75;
                  v31 = v63;
                  goto LABEL_34;
                }

                if (v76 == v22)
                {

                }
                else
                {

                }
                v50 = v71;
                if (v13 == v14)
                  goto LABEL_86;

LABEL_84:
                goto LABEL_85;
              }

            }
            if (v76 == v22)
            {

            }
            else
            {

            }
            v50 = v71;
            if (v13 == v14)
              goto LABEL_86;

            goto LABEL_84;
          }
          -[DNDModeConfiguration mode](self, "mode");
          v23 = objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v72 = (void *)v23;
            -[DNDModeConfiguration mode](v5, "mode");
            v24 = objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              v69 = (void *)v24;
              -[DNDModeConfiguration mode](self, "mode");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDModeConfiguration mode](v5, "mode");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v25, "isEqual:", v26) & 1) != 0)
              {
                v61 = v25;
                v68 = v26;
                v27 = v75;
                goto LABEL_24;
              }

            }
            if (v13 != v14)
            {

LABEL_87:
              goto LABEL_88;
            }
          }
          else
          {

            if (v13 != v14)
            {

LABEL_85:
              goto LABEL_86;
            }
          }

          goto LABEL_87;
        }

      }
LABEL_86:

      goto LABEL_87;
    }
    LOBYTE(v12) = 0;
  }
LABEL_93:

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];

  v17 = (void *)MEMORY[0x1E0CB3940];
  v16 = objc_opt_class();
  -[DNDModeConfiguration mode](self, "mode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeConfiguration configuration](self, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeConfiguration triggers](self, "triggers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  DNDEnabledSettingToString(-[DNDModeConfiguration impactsAvailability](self, "impactsAvailability"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  DNDEnabledSettingToString(-[DNDModeConfiguration dimsLockScreen](self, "dimsLockScreen"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeConfiguration created](self, "created");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeConfiguration lastModified](self, "lastModified");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDModeConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DNDCompatibilityVersionToString(-[DNDModeConfiguration compatibilityVersion](self, "compatibilityVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DNDCompatibilityVersionToString(-[DNDModeConfiguration resolvedCompatibilityVersion](self, "resolvedCompatibilityVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDModeConfiguration hasSecureData](self, "hasSecureData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeConfiguration lastModifiedByVersion](self, "lastModifiedByVersion");
  DNDStringFromOperatingSystemVersion(v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeConfiguration lastModifiedByDeviceID](self, "lastModifiedByDeviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p; mode: %@; configuration: %@; triggers: %@; impactsAvailability: %@; dimsLockScreen: %@; created: %@; lastModified: %@; automaticallyGenerated: %@; compatibilityVersion: %@; resolvedCompatibilityVersion: %@; hasSecureData: %@; modFrameworkVersion: %@; modDeviceID: %@>"),
    v16,
    self,
    v15,
    v19,
    v18,
    v13,
    v14,
    v12,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDModeConfiguration mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DNDEnabledSettingToString(-[DNDModeConfiguration impactsAvailability](self, "impactsAvailability"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DNDEnabledSettingToString(-[DNDModeConfiguration dimsLockScreen](self, "dimsLockScreen"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; mode: %@; impactsAvailability: %@; dimsLockScreen: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDModeConfiguration _initWithModeConfiguration:](+[DNDMutableModeConfiguration allocWithZone:](DNDMutableModeConfiguration, "allocWithZone:", a3), "_initWithModeConfiguration:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeConfiguration)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  DNDModeConfiguration *v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[3];

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("triggers"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("impactsAvailability")))
    v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("impactsAvailability"));
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("dimsLockScreen")))
    v17 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("dimsLockScreen"));
  else
    v17 = 0;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("created"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModified"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModifiedByVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModifiedByDeviceID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("automaticallyGenerated"));
  v13 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("compatibilityVersion"));
  DNDOperatingSystemVersionFromString(v10, v22);
  LOBYTE(v16) = v12;
  v14 = -[DNDModeConfiguration initWithMode:configuration:triggers:impactsAvailability:dimsLockScreen:created:lastModified:automaticallyGenerated:compatibilityVersion:lastModifiedByVersion:lastModifiedByDeviceID:](self, "initWithMode:configuration:triggers:impactsAvailability:dimsLockScreen:created:lastModified:automaticallyGenerated:compatibilityVersion:lastModifiedByVersion:lastModifiedByDeviceID:", v21, v19, v18, v7, v17, v8, v9, v16, v13, v22, v11);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v4 = a3;
  -[DNDModeConfiguration mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("mode"));

  -[DNDModeConfiguration configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("configuration"));

  -[DNDModeConfiguration triggers](self, "triggers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("triggers"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeConfiguration impactsAvailability](self, "impactsAvailability"), CFSTR("impactsAvailability"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeConfiguration dimsLockScreen](self, "dimsLockScreen"), CFSTR("dimsLockScreen"));
  -[DNDModeConfiguration created](self, "created");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("created"));

  -[DNDModeConfiguration lastModified](self, "lastModified");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("lastModified"));

  -[DNDModeConfiguration lastModifiedByVersion](self, "lastModifiedByVersion");
  DNDStringFromOperatingSystemVersion(v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("lastModifiedByVersion"));

  -[DNDModeConfiguration lastModifiedByDeviceID](self, "lastModifiedByDeviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("lastModifiedByDeviceID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[DNDModeConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated"), CFSTR("automaticallyGenerated"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeConfiguration compatibilityVersion](self, "compatibilityVersion"), CFSTR("compatibilityVersion"));

}

- (void)diffAgainstObject:(id)a3 usingDiffBuilder:(id)a4 withDescription:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
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
  void *v31;
  _QWORD v32[3];
  _QWORD v33[3];

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    -[DNDModeConfiguration mode](self, "mode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diffObject:againstObject:withDescription:", v10, v11, CFSTR("mode"));

    -[DNDModeConfiguration configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diffObject:againstObject:withDescription:", v12, v13, CFSTR("configuration"));

    -[DNDModeConfiguration triggers](self, "triggers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "triggers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diffObject:againstObject:withDescription:", v14, v15, CFSTR("triggers"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDModeConfiguration impactsAvailability](self, "impactsAvailability"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "impactsAvailability"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diffObject:againstObject:withDescription:", v16, v17, CFSTR("impactsAvailability"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDModeConfiguration dimsLockScreen](self, "dimsLockScreen"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "dimsLockScreen"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diffObject:againstObject:withDescription:", v18, v19, CFSTR("dimsLockScreen"));

    -[DNDModeConfiguration created](self, "created");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "created");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diffObject:againstObject:withDescription:", v20, v21, CFSTR("created"));

    -[DNDModeConfiguration lastModified](self, "lastModified");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastModified");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diffObject:againstObject:withDescription:", v22, v23, CFSTR("lastModified"));

    -[DNDModeConfiguration lastModifiedByVersion](self, "lastModifiedByVersion");
    DNDStringFromOperatingSystemVersion(v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v9, "lastModifiedByVersion");
    else
      memset(v32, 0, sizeof(v32));
    DNDStringFromOperatingSystemVersion(v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diffObject:againstObject:withDescription:", v24, v25, CFSTR("lastModifiedByVersion"));

    -[DNDModeConfiguration lastModifiedByDeviceID](self, "lastModifiedByDeviceID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastModifiedByDeviceID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diffObject:againstObject:withDescription:", v26, v27, CFSTR("lastModifiedByDeviceID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDModeConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "isAutomaticallyGenerated"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diffObject:againstObject:withDescription:", v28, v29, CFSTR("isAutomaticallyGenerated"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[DNDModeConfiguration compatibilityVersion](self, "compatibilityVersion"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "compatibilityVersion"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diffObject:againstObject:withDescription:", v30, v31, CFSTR("compatibilityVersion"));

  }
}

- (BOOL)_containsSecureTriggers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "hasSecureData", (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (int64_t)_maxTriggerCompatibilityVersion:(id)a3
{
  id v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = 2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "compatibilityVersion");
        if (v4 <= v9)
          v4 = v9;
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v4;
}

- (DNDMode)mode
{
  return self->_mode;
}

- (DNDConfiguration)configuration
{
  return self->_configuration;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (unint64_t)impactsAvailability
{
  return self->_impactsAvailability;
}

- (unint64_t)dimsLockScreen
{
  return self->_dimsLockScreen;
}

- (NSDate)created
{
  return self->_created;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastModifiedByVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)((char *)self + 64);
  return self;
}

- (NSString)lastModifiedByDeviceID
{
  return self->_lastModifiedByDeviceID;
}

- (BOOL)isAutomaticallyGenerated
{
  return self->_automaticallyGenerated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedByDeviceID, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
