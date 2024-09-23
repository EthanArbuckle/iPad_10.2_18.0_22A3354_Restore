@implementation MCPayload

+ (id)_sharedHomePodPayloadClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

+ (id)installableHomePodConfigurationPayloadClasses
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "_sharedHomePodPayloadClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", objc_opt_class());
  objc_msgSend(v4, "addObject:", objc_opt_class());
  objc_msgSend(v4, "addObject:", objc_opt_class());
  return v4;
}

+ (id)remoteQueueableHomePodPayloadClasses
{
  void *v2;
  void *v3;
  void *v4;
  int AppBooleanValue;
  BOOL v6;
  Boolean keyExistsAndHasValidFormat;

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "_sharedHomePodPayloadClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", objc_opt_class());
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AcceptProfileServicePayloadOnHomePod"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
  if ((MCGestaltIsInternalBuild() & 1) != 0
    || (AppBooleanValue ? (v6 = keyExistsAndHasValidFormat == 0) : (v6 = 1), !v6))
  {
    objc_msgSend(v4, "addObject:", objc_opt_class());
  }
  return v4;
}

+ (id)_sharedWatchPayloadClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v21 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  return (id)objc_msgSend(v21, "setWithObjects:", v20, v19, v18, v17, v16, v15, v14, v13, v2, v3, v4, v5, v6, v7, v8, v9, v10,
               v11,
               objc_opt_class(),
               0);
}

+ (id)installableWatchConfigurationPayloadClasses
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "_sharedWatchPayloadClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", objc_opt_class());
  objc_msgSend(v4, "addObject:", objc_opt_class());
  return v4;
}

+ (id)remoteQueueableWatchPayloadClasses
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_sharedWatchPayloadClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (MCGestaltIsInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", objc_opt_class());
  }
  else
  {
    v3 = v2;
  }

  return v3;
}

- (BOOL)isSupportedByWatchVersions:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[MCPayload _minimumWatchVersionRequirementsForPayloads](MCPayload, "_minimumWatchVersionRequirementsForPayloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v14);
          if (v12 >= objc_msgSend(v7, "unsignedIntegerValue"))
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (id)_minimumWatchVersionRequirementsForPayloads
{
  if (_minimumWatchVersionRequirementsForPayloads_onceToken != -1)
    dispatch_once(&_minimumWatchVersionRequirementsForPayloads_onceToken, &__block_literal_global_20);
  return (id)_minimumWatchVersionRequirementsForPayloads_supportedWatchPayloads;
}

void __71__MCPayload_RemoteDevices___minimumWatchVersionRequirementsForPayloads__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[23];
  _QWORD v49[25];

  v49[23] = *MEMORY[0x1E0C80C00];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v47;
  v49[0] = &unk_1E42128F8;
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v46;
  v49[1] = &unk_1E4212910;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v45;
  v49[2] = &unk_1E4212910;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v44;
  v49[3] = &unk_1E4212910;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v43;
  v49[4] = &unk_1E4212910;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v42;
  v49[5] = &unk_1E4212910;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v41;
  v49[6] = &unk_1E4212910;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v40;
  v49[7] = &unk_1E4212928;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v39;
  v49[8] = &unk_1E4212928;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[9] = v38;
  v49[9] = &unk_1E4212928;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48[10] = v37;
  v49[10] = &unk_1E4212940;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48[11] = v36;
  v49[11] = &unk_1E4212958;
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48[12] = v35;
  v49[12] = &unk_1E4212970;
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48[13] = v34;
  v49[13] = &unk_1E4212988;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48[14] = v15;
  v49[14] = &unk_1E4212988;
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48[15] = v17;
  v49[15] = &unk_1E42129A0;
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[16] = v19;
  v49[16] = &unk_1E42129A0;
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48[17] = v21;
  v49[17] = &unk_1E42129A0;
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[18] = v23;
  v49[18] = &unk_1E42129A0;
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48[19] = v25;
  v49[19] = &unk_1E42129A0;
  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48[20] = v27;
  v49[20] = &unk_1E42129A0;
  v28 = (objc_class *)objc_opt_class();
  NSStringFromClass(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v48[21] = v29;
  v49[21] = &unk_1E42129A0;
  v30 = (objc_class *)objc_opt_class();
  NSStringFromClass(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48[22] = v31;
  v49[22] = &unk_1E42129A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 23);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)_minimumWatchVersionRequirementsForPayloads_supportedWatchPayloads;
  _minimumWatchVersionRequirementsForPayloads_supportedWatchPayloads = v32;

}

+ (id)typeStrings
{
  return 0;
}

+ (id)localizedDescriptionForPayloadCount:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;

  if (a3 < 2)
  {
    objc_msgSend(a1, "localizedSingularForm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "localizedPluralForm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(CFSTR("PAYLOAD_PLURAL_FORMAT"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)localizedParenthesizedFormDescriptionForPayloadCount:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;

  if (a3 < 2)
  {
    objc_msgSend(a1, "localizedSingularForm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "localizedPluralForm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedFormat(CFSTR("PAYLOAD_PAREN_PLURAL_FORMAT"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("PAYLOAD_UNKNOWN_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("PAYLOAD_UNKNOWN_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (NSDictionary)restrictions
{
  return 0;
}

- (void)setPersistentResourceID:(id)a3
{
  NSString *v4;
  NSString *persistentResourceID;

  if (self->_persistentResourceID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    persistentResourceID = self->_persistentResourceID;
    self->_persistentResourceID = v4;

  }
}

- (NSString)friendlyName
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  int v14;
  id v15;
  __int16 v16;
  MCPayload *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MCPayload displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[MCPayload displayName](self, "displayName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MCPayload identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      -[MCPayload identifier](self, "identifier");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MCPayload UUID](self, "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (v9)
      {
        -[MCPayload UUID](self, "UUID");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          v11 = v10;
          v14 = 138543618;
          v15 = (id)objc_opt_class();
          v16 = 2048;
          v17 = self;
          v12 = v15;
          _os_log_impl(&dword_19ECC4000, v11, OS_LOG_TYPE_ERROR, "Payload %{public}@ %p has no friendly name.", (uint8_t *)&v14, 0x16u);

        }
        v5 = CFSTR("Payload");
      }
    }
  }
  return (NSString *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Payload %@ %p, version %d\n"), objc_opt_class(), self, self->_version);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_payloadDescription)
    objc_msgSend(v3, "appendFormat:", CFSTR("Description : “%@”\n"), self->_payloadDescription);
  if (self->_identifier)
    objc_msgSend(v4, "appendFormat:", CFSTR("Identifier  : %@\n"), self->_identifier);
  if (self->_UUID)
    objc_msgSend(v4, "appendFormat:", CFSTR("UUID        : %@\n"), self->_UUID);
  if (self->_type)
    objc_msgSend(v4, "appendFormat:", CFSTR("Type        : %@\n"), self->_type);
  if (self->_displayName)
    objc_msgSend(v4, "appendFormat:", CFSTR("Display name: %@\n"), self->_displayName);
  if (self->_organization)
    objc_msgSend(v4, "appendFormat:", CFSTR("Organization: %@\n"), self->_organization);
  if (self->_persistentResourceID)
    objc_msgSend(v4, "appendFormat:", CFSTR("Persistent Resource ID: %@\n"), self->_persistentResourceID);
  -[MCPayload restrictions](self, "restrictions");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    objc_msgSend(v4, "appendFormat:", CFSTR("Restrictions: %@\n"), v5);

  return v4;
}

- (id)serializedDictionary
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSString *payloadDescription;
  NSString *identifier;
  NSString *UUID;
  NSString *type;
  NSString *displayName;
  NSString *organization;
  NSString *persistentResourceID;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Class"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_version);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Version"));

  payloadDescription = self->_payloadDescription;
  if (payloadDescription)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", payloadDescription, CFSTR("Description"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", identifier, CFSTR("Identifier"));
  UUID = self->_UUID;
  if (UUID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", UUID, CFSTR("UUID"));
  type = self->_type;
  if (type)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", type, CFSTR("Type"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", displayName, CFSTR("Display Name"));
  organization = self->_organization;
  if (organization)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", organization, CFSTR("Organization"));
  persistentResourceID = self->_persistentResourceID;
  if (persistentResourceID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", persistentResourceID, CFSTR("Persistent Resource ID"));
  -[MCPayload restrictions](self, "restrictions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("Restrictions"));

  return v3;
}

- (NSArray)installationWarnings
{
  return 0;
}

- (id)subtitle1Label
{
  return 0;
}

- (id)subtitle1Description
{
  return 0;
}

- (id)subtitle2Label
{
  return 0;
}

- (id)subtitle2Description
{
  return 0;
}

- (id)payloadDescriptionKeyValueSections
{
  return 0;
}

- (BOOL)containsSensitiveUserInformation
{
  return 0;
}

- (MCProfile)profile
{
  return (MCProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (NSString)type
{
  return self->_type;
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)organization
{
  return self->_organization;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)persistentResourceID
{
  return self->_persistentResourceID;
}

- (BOOL)mustInstallNonInteractively
{
  return self->_mustInstallNonInteractively;
}

- (void)setMustInstallNonInteractively:(BOOL)a3
{
  self->_mustInstallNonInteractively = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentResourceID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_destroyWeak((id *)&self->_profile);
}

+ (id)_platformSpecificConfigurationPayloadClasses
{
  if (_platformSpecificConfigurationPayloadClasses_onceToken != -1)
    dispatch_once(&_platformSpecificConfigurationPayloadClasses_onceToken, &__block_literal_global_48);
  return (id)_platformSpecificConfigurationPayloadClasses_platformPayloads;
}

void __66__MCPayload_Private___platformSpecificConfigurationPayloadClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  if (MCGestaltIsAppleTV())
  {
    +[MCPayload _installableTVConfigurationPayloadClasses](MCPayload, "_installableTVConfigurationPayloadClasses");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (MCGestaltIsHomePod())
  {
    +[MCPayload installableHomePodConfigurationPayloadClasses](MCPayload, "installableHomePodConfigurationPayloadClasses");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (MCGestaltIsWatch())
  {
    +[MCPayload installableWatchConfigurationPayloadClasses](MCPayload, "installableWatchConfigurationPayloadClasses");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (MCGestaltIsVisionDevice())
      +[MCPayload _installableVisionConfigurationPayloadClasses](MCPayload, "_installableVisionConfigurationPayloadClasses");
    else
      +[MCPayload _installablePhoneConfigurationPayloadClasses](MCPayload, "_installablePhoneConfigurationPayloadClasses");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = v0;
  objc_msgSend(v0, "allObjects");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_platformSpecificConfigurationPayloadClasses_platformPayloads;
  _platformSpecificConfigurationPayloadClasses_platformPayloads = v1;

}

+ (id)_allKnownPayloadClasses
{
  if (_allKnownPayloadClasses_onceToken != -1)
    dispatch_once(&_allKnownPayloadClasses_onceToken, &__block_literal_global_147);
  return (id)_allKnownPayloadClasses_allPayloads;
}

void __45__MCPayload_Private___allKnownPayloadClasses__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[MCPayload _installableTVConfigurationPayloadClasses](MCPayload, "_installableTVConfigurationPayloadClasses");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v0, "mutableCopy");

  +[MCPayload installableHomePodConfigurationPayloadClasses](MCPayload, "installableHomePodConfigurationPayloadClasses");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v1);

  +[MCPayload installableWatchConfigurationPayloadClasses](MCPayload, "installableWatchConfigurationPayloadClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v2);

  +[MCPayload _installableVisionConfigurationPayloadClasses](MCPayload, "_installableVisionConfigurationPayloadClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v3);

  +[MCPayload _installablePhoneConfigurationPayloadClasses](MCPayload, "_installablePhoneConfigurationPayloadClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v4);

  objc_msgSend(v7, "allObjects");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_allKnownPayloadClasses_allPayloads;
  _allKnownPayloadClasses_allPayloads = v5;

}

+ (id)_installableTVConfigurationPayloadClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  return (id)objc_msgSend(v25, "setWithObjects:", v24, v23, v22, v21, v20, v19, v18, v17, v16, v15, v14, v13, v2, v3, v4, v5, v6,
               v7,
               v8,
               v9,
               v10,
               v11,
               objc_opt_class(),
               0);
}

+ (id)_installablePhoneConfigurationPayloadClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;

  v54 = (void *)MEMORY[0x1E0C99E60];
  v53 = objc_opt_class();
  v52 = objc_opt_class();
  v51 = objc_opt_class();
  v50 = objc_opt_class();
  v49 = objc_opt_class();
  v48 = objc_opt_class();
  v47 = objc_opt_class();
  v46 = objc_opt_class();
  v45 = objc_opt_class();
  v44 = objc_opt_class();
  v43 = objc_opt_class();
  v42 = objc_opt_class();
  v41 = objc_opt_class();
  v40 = objc_opt_class();
  v39 = objc_opt_class();
  v38 = objc_opt_class();
  v37 = objc_opt_class();
  v36 = objc_opt_class();
  v35 = objc_opt_class();
  v34 = objc_opt_class();
  v33 = objc_opt_class();
  v32 = objc_opt_class();
  v31 = objc_opt_class();
  v30 = objc_opt_class();
  v29 = objc_opt_class();
  v28 = objc_opt_class();
  v27 = objc_opt_class();
  v26 = objc_opt_class();
  v25 = objc_opt_class();
  v24 = objc_opt_class();
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  return (id)objc_msgSend(v54, "setWithObjects:", v53, v52, v51, v50, v49, v48, v47, v46, v45, v44, v43, v42, v41, v40, v39, v38, v37,
               v36,
               v35,
               v34,
               v33,
               v32,
               v31,
               v30,
               v29,
               v28,
               v27,
               v26,
               v25,
               v24,
               v23,
               v22,
               v21,
               v20,
               v19,
               v18,
               v17,
               v16,
               v15,
               v14,
               v13,
               v2,
               v3,
               v4,
               v5,
               v6,
               v7,
               v8,
               v9,
               v10,
               v11,
               objc_opt_class(),
               0);
}

+ (id)_installableVisionConfigurationPayloadClasses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[33];

  v7[32] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E20];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  v7[5] = objc_opt_class();
  v7[6] = objc_opt_class();
  v7[7] = objc_opt_class();
  v7[8] = objc_opt_class();
  v7[9] = objc_opt_class();
  v7[10] = objc_opt_class();
  v7[11] = objc_opt_class();
  v7[12] = objc_opt_class();
  v7[13] = objc_opt_class();
  v7[14] = objc_opt_class();
  v7[15] = objc_opt_class();
  v7[16] = objc_opt_class();
  v7[17] = objc_opt_class();
  v7[18] = objc_opt_class();
  v7[19] = objc_opt_class();
  v7[20] = objc_opt_class();
  v7[21] = objc_opt_class();
  v7[22] = objc_opt_class();
  v7[23] = objc_opt_class();
  v7[24] = objc_opt_class();
  v7[25] = objc_opt_class();
  v7[26] = objc_opt_class();
  v7[27] = objc_opt_class();
  v7[28] = objc_opt_class();
  v7[29] = objc_opt_class();
  v7[30] = objc_opt_class();
  v7[31] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D1C1C0], "isVisionMDMEnabled"))
    objc_msgSend(v4, "addObject:", objc_opt_class());
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

+ (id)accountPayloads
{
  if (accountPayloads_once != -1)
    dispatch_once(&accountPayloads_once, &__block_literal_global_207);
  return (id)accountPayloads_set;
}

void __37__MCPayload_Private__accountPayloads__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)accountPayloads_set;
  accountPayloads_set = v1;

}

+ (id)payloadsRequiringRatchetWithStolenDeviceProtection
{
  if (payloadsRequiringRatchetWithStolenDeviceProtection_onceToken != -1)
    dispatch_once(&payloadsRequiringRatchetWithStolenDeviceProtection_onceToken, &__block_literal_global_208);
  return (id)payloadsRequiringRatchetWithStolenDeviceProtection_payloads;
}

void __72__MCPayload_Private__payloadsRequiringRatchetWithStolenDeviceProtection__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)payloadsRequiringRatchetWithStolenDeviceProtection_payloads;
  payloadsRequiringRatchetWithStolenDeviceProtection_payloads = v2;

}

+ (id)unavailablePayloadsInEphemeralMultiUser
{
  if (unavailablePayloadsInEphemeralMultiUser_once != -1)
    dispatch_once(&unavailablePayloadsInEphemeralMultiUser_once, &__block_literal_global_210);
  return (id)unavailablePayloadsInEphemeralMultiUser_set;
}

void __61__MCPayload_Private__unavailablePayloadsInEphemeralMultiUser__block_invoke()
{
  void *v0;
  void *v1;
  BOOL v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[MCPayload unavailableSystemPayloadsInEphemeralMultiUser](MCPayload, "unavailableSystemPayloadsInEphemeralMultiUser");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[MCPayload unavailableUserPayloadsInEphemeralMultiUser](MCPayload, "unavailableUserPayloadsInEphemeralMultiUser");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v2 = v0 == 0;
  else
    v2 = 1;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "addObjectsFromArray:", v3);

    objc_msgSend(v1, "intersectSet:", v0);
    v4 = objc_msgSend(v1, "copy");
  }
  v5 = (void *)unavailablePayloadsInEphemeralMultiUser_set;
  unavailablePayloadsInEphemeralMultiUser_set = v4;

}

+ (id)hrnRequiredPayloads
{
  if (hrnRequiredPayloads_onceToken != -1)
    dispatch_once(&hrnRequiredPayloads_onceToken, &__block_literal_global_211);
  return (id)hrnRequiredPayloads_payloads;
}

void __41__MCPayload_Private__hrnRequiredPayloads__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)hrnRequiredPayloads_payloads;
  hrnRequiredPayloads_payloads = v2;

}

+ (id)mdmAdoptablePayloads
{
  if (mdmAdoptablePayloads_onceToken != -1)
    dispatch_once(&mdmAdoptablePayloads_onceToken, &__block_literal_global_212_0);
  return (id)mdmAdoptablePayloads_payloads;
}

void __42__MCPayload_Private__mdmAdoptablePayloads__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)mdmAdoptablePayloads_payloads;
  mdmAdoptablePayloads_payloads = v2;

}

+ (id)cellularRequiredPayloads
{
  if (cellularRequiredPayloads_onceToken != -1)
    dispatch_once(&cellularRequiredPayloads_onceToken, &__block_literal_global_213);
  return (id)cellularRequiredPayloads_payloads;
}

void __46__MCPayload_Private__cellularRequiredPayloads__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)cellularRequiredPayloads_payloads;
  cellularRequiredPayloads_payloads = v2;

}

+ (id)supervisedRequiredPayloads
{
  if (supervisedRequiredPayloads_onceToken != -1)
    dispatch_once(&supervisedRequiredPayloads_onceToken, &__block_literal_global_214_0);
  return (id)supervisedRequiredPayloads_supervisedOnlyPayloadClasses;
}

void __48__MCPayload_Private__supervisedRequiredPayloads__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[11];

  v4[10] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supervisedRequiredPayloads_supervisedOnlyPayloadClasses;
  supervisedRequiredPayloads_supervisedOnlyPayloadClasses = v2;

}

+ (id)unavailableSystemPayloadsInEphemeralMultiUser
{
  if (unavailableSystemPayloadsInEphemeralMultiUser_once != -1)
    dispatch_once(&unavailableSystemPayloadsInEphemeralMultiUser_once, &__block_literal_global_216_0);
  return (id)unavailableSystemPayloadsInEphemeralMultiUser_set;
}

void __67__MCPayload_Private__unavailableSystemPayloadsInEphemeralMultiUser__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[15];

  v4[14] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v4[13] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 14);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)unavailableSystemPayloadsInEphemeralMultiUser_set;
  unavailableSystemPayloadsInEphemeralMultiUser_set = v2;

}

+ (id)unavailableUserPayloadsInEphemeralMultiUser
{
  if (unavailableUserPayloadsInEphemeralMultiUser_once != -1)
    dispatch_once(&unavailableUserPayloadsInEphemeralMultiUser_once, &__block_literal_global_217_0);
  return (id)unavailableUserPayloadsInEphemeralMultiUser_set;
}

void __65__MCPayload_Private__unavailableUserPayloadsInEphemeralMultiUser__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[35];

  v4[34] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v4[13] = objc_opt_class();
  v4[14] = objc_opt_class();
  v4[15] = objc_opt_class();
  v4[16] = objc_opt_class();
  v4[17] = objc_opt_class();
  v4[18] = objc_opt_class();
  v4[19] = objc_opt_class();
  v4[20] = objc_opt_class();
  v4[21] = objc_opt_class();
  v4[22] = objc_opt_class();
  v4[23] = objc_opt_class();
  v4[24] = objc_opt_class();
  v4[25] = objc_opt_class();
  v4[26] = objc_opt_class();
  v4[27] = objc_opt_class();
  v4[28] = objc_opt_class();
  v4[29] = objc_opt_class();
  v4[30] = objc_opt_class();
  v4[31] = objc_opt_class();
  v4[32] = objc_opt_class();
  v4[33] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 34);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)unavailableUserPayloadsInEphemeralMultiUser_set;
  unavailableUserPayloadsInEphemeralMultiUser_set = v2;

}

+ (id)availablePayloadsForUserEnrollment
{
  if (availablePayloadsForUserEnrollment_once != -1)
    dispatch_once(&availablePayloadsForUserEnrollment_once, &__block_literal_global_218_0);
  return (id)availablePayloadsForUserEnrollment_set;
}

void __56__MCPayload_Private__availablePayloadsForUserEnrollment__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[31];

  v5[30] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E20];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  v5[3] = objc_opt_class();
  v5[4] = objc_opt_class();
  v5[5] = objc_opt_class();
  v5[6] = objc_opt_class();
  v5[7] = objc_opt_class();
  v5[8] = objc_opt_class();
  v5[9] = objc_opt_class();
  v5[10] = objc_opt_class();
  v5[11] = objc_opt_class();
  v5[12] = objc_opt_class();
  v5[13] = objc_opt_class();
  v5[14] = objc_opt_class();
  v5[15] = objc_opt_class();
  v5[16] = objc_opt_class();
  v5[17] = objc_opt_class();
  v5[18] = objc_opt_class();
  v5[19] = objc_opt_class();
  v5[20] = objc_opt_class();
  v5[21] = objc_opt_class();
  v5[22] = objc_opt_class();
  v5[23] = objc_opt_class();
  v5[24] = objc_opt_class();
  v5[25] = objc_opt_class();
  v5[26] = objc_opt_class();
  v5[27] = objc_opt_class();
  v5[28] = objc_opt_class();
  v5[29] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 30);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[MCFeatureOverrides allowVPNInUserEnrollment](MCFeatureOverrides, "allowVPNInUserEnrollment"))
    objc_msgSend(v2, "addObject:", objc_opt_class());
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)availablePayloadsForUserEnrollment_set;
  availablePayloadsForUserEnrollment_set = v3;

}

+ (id)payloadsFromArray:(id)a3 isStub:(BOOL)a4 profile:(id)a5 outError:(id *)a6
{
  _BOOL8 v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v7 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v30 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = 0;
          +[MCPayload payloadFromDictionary:isStub:profile:outError:](MCPayload, "payloadFromDictionary:isStub:profile:outError:", v14, v7, v30, &v31);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v31;
          if (v22)
            objc_msgSend(v29, "addObject:", v22);
        }
        else
        {
          v24 = (void *)MEMORY[0x1E0CB35C8];
          MCErrorArray(CFSTR("ERROR_PAYLOAD_MALFORMED"), v15, v16, v17, v18, v19, v20, v21, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), 2000, v22, CFSTR("MCFatalError"));
          v23 = (id)objc_claimAutoreleasedReturnValue();
        }

        if (v23)
        {

          if (a6)
          {
            v23 = objc_retainAutorelease(v23);
            v26 = 0;
            *a6 = v23;
          }
          else
          {
            v26 = 0;
          }
          v25 = v29;
          goto LABEL_18;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v11)
        continue;
      break;
    }
  }

  v25 = v29;
  v26 = v29;
  v23 = 0;
LABEL_18:

  return v26;
}

+ (id)payloadFromDictionary:(id)a3 isStub:(BOOL)a4 profile:(id)a5 outError:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  MCUnknownPayload *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  MCUnknownPayload *v48;
  void *v49;
  void *v51;
  void *v52;
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("PayloadType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v10;
  if (a4)
  {
    v12 = 0;
  }
  else
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    if (_removedPayloadClasses_onceToken != -1)
      dispatch_once(&_removedPayloadClasses_onceToken, &__block_literal_global_284);
    v13 = (id)_removedPayloadClasses_array;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v63;
LABEL_7:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v63 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * v17), "typeStrings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "containsObject:", v11);

        if (v19)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
          if (v15)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      v20 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v67 = v11;
        _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_DEBUG, "Payload class for type “%{public}@” was deprecated on current platform. Converting to Unknown Payload.", buf, 0xCu);
      }
      v21 = [MCUnknownPayload alloc];
      v22 = (void *)objc_msgSend(v9, "mutableCopy");
      v61 = 0;
      v23 = -[MCUnknownPayload initWithDictionary:profile:outError:](v21, "initWithDictionary:profile:outError:", v22, v54, &v61);
      v12 = (unint64_t)v61;

      v10 = v54;
      if (!v23)
        goto LABEL_23;
      if (!v12)
        goto LABEL_48;
      goto LABEL_18;
    }
LABEL_13:

    v12 = 0;
    v10 = v54;
  }
LABEL_23:
  v28 = +[MCFeatureOverrides shouldDisablePlatformPayloadFilter](MCFeatureOverrides, "shouldDisablePlatformPayloadFilter");
  objc_msgSend(a1, "_platformSpecificConfigurationPayloadClasses");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v28)
  {
    objc_msgSend(a1, "_allKnownPayloadClasses");
    v31 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = v29;
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v32 = v31;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v33)
  {
    v34 = v33;
    v51 = v30;
    v52 = v9;
    v35 = *(_QWORD *)v58;
LABEL_28:
    v36 = 0;
    while (1)
    {
      if (*(_QWORD *)v58 != v35)
        objc_enumerationMutation(v32);
      v37 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v36);
      objc_msgSend(v37, "typeStrings", v51);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "containsObject:", v11);

      if (v39)
        break;
      if (v34 == ++v36)
      {
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
        if (v34)
          goto LABEL_28;
        v23 = 0;
        v9 = v52;
        v10 = v54;
        goto LABEL_42;
      }
    }
    v40 = objc_alloc((Class)v37);
    v41 = (void *)objc_msgSend(v52, "mutableCopy");
    v56 = (id)v12;
    v10 = v54;
    v23 = objc_msgSend(v40, "initWithDictionary:profile:outError:", v41, v54, &v56);
    v42 = v56;

    if (!v28)
    {
      v12 = (unint64_t)v42;
      v9 = v52;
LABEL_42:
      v30 = v51;
      goto LABEL_43;
    }
    v30 = v51;
    if ((objc_msgSend(v51, "containsObject:", v37) & 1) == 0)
    {
      v43 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v44 = v43;
        NSStringFromClass((Class)v37);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v67 = v45;
        _os_log_impl(&dword_19ECC4000, v44, OS_LOG_TYPE_ERROR, "Platform payload filter has been disabled. Allowing %{public}@ payload despite it being unsupported.", buf, 0xCu);

        v30 = v51;
      }
    }
    v12 = (unint64_t)v42;
    v9 = v52;
  }
  else
  {
    v23 = 0;
  }
LABEL_43:

  if (!(v12 | v23))
  {
    v46 = v30;
    v47 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v67 = v11;
      _os_log_impl(&dword_19ECC4000, v47, OS_LOG_TYPE_DEBUG, "No payload class for type “%{public}@” on current platform. Converting to Unknown Payload.", buf, 0xCu);
    }
    v48 = [MCUnknownPayload alloc];
    v49 = (void *)objc_msgSend(v9, "mutableCopy");
    v55 = 0;
    v23 = -[MCUnknownPayload initWithDictionary:profile:outError:](v48, "initWithDictionary:profile:outError:", v49, v10, &v55);
    v12 = (unint64_t)v55;

    v30 = v46;
  }

  if (!v12)
  {
LABEL_48:
    v27 = (id)v23;
    goto LABEL_49;
  }
LABEL_18:
  if (a6)
    *a6 = objc_retainAutorelease((id)v12);
  v24 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v25 = v24;
    objc_msgSend((id)v12, "MCVerboseDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v67 = v11;
    v68 = 2114;
    v69 = v26;
    _os_log_impl(&dword_19ECC4000, v25, OS_LOG_TYPE_ERROR, "Cannot create profile of type “%{public}@”. Error: %{public}@", buf, 0x16u);

  }
  v27 = 0;
LABEL_49:

  return v27;
}

+ (id)missingFieldErrorWithField:(id)a3 underlyingError:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), 2002, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)badFieldTypeErrorWithField:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), 2003, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)badFieldValueErrorWithField:(id)a3
{
  return (id)objc_msgSend(a1, "badFieldValueErrorWithField:underlyingError:", a3, 0);
}

+ (id)badFieldValueErrorWithField:(id)a3 underlyingError:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  MCErrorArray(CFSTR("ERROR_PAYLOAD_FIELD_BAD_VALUE_P_FIELD"), v7, v8, v9, v10, v11, v12, v13, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCPayloadErrorDomain"), 2004, v14, v6, CFSTR("MCFatalError"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)conflictingFieldValueErrorWithUnderlyingError:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a3;
  MCErrorVaArray(CFSTR("ERROR_PAYLOAD_FIELD_CONFLICTING_P_FIELDS"), &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCPayloadErrorDomain"), 2004, v5, v4, CFSTR("MCFatalError"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MCPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCPayload *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t version;
  NSObject *v23;
  uint64_t v24;
  NSString *type;
  uint64_t v26;
  NSString *identifier;
  uint64_t v28;
  NSString *UUID;
  uint64_t v30;
  NSString *payloadDescription;
  void *v32;
  void *v33;
  void *persistentResourceID;
  NSString *v35;
  NSString *v36;
  uint64_t v37;
  uint64_t v38;
  NSString *displayName;
  uint64_t v40;
  NSString *organization;
  id WeakRetained;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  objc_super v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v60.receiver = self;
  v60.super_class = (Class)MCPayload;
  v10 = -[MCPayload init](&v60, sel_init);
  if (!v10)
    goto LABEL_34;
  v59 = 0;
  +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PayloadVersion"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v59);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSString *)v59;
  if (!v12)
  {
    v10->_version = (int)objc_msgSend(v11, "intValue");
    v14 = objc_msgSend(v9, "isStub");
    version = v10->_version;
    if (v14)
    {
      if (version != 1)
      {
        v23 = _MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_ERROR, "WARNING: payload contains PayloadVersion other than “1”.", buf, 2u);
        }
      }
    }
    else if (version != 1)
    {
      v32 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(CFSTR("ERROR_PAYLOAD_UNSUPPORTED_VERSION"), v15, v16, v17, v18, v19, v20, v21, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), 2001, v33, CFSTR("MCFatalError"));
      persistentResourceID = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (NSString *)objc_msgSend(persistentResourceID, "MCCopyAsPrimaryError");
      goto LABEL_27;
    }
    objc_storeWeak((id *)&v10->_profile, v9);
    v58 = 0;
    +[MCProfile removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PayloadType"), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v58);
    v24 = objc_claimAutoreleasedReturnValue();
    v13 = (NSString *)v58;
    type = v10->_type;
    v10->_type = (NSString *)v24;

    if (!v13)
    {
      v57 = 0;
      +[MCProfile removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PayloadIdentifier"), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v57);
      v26 = objc_claimAutoreleasedReturnValue();
      v13 = (NSString *)v57;
      identifier = v10->_identifier;
      v10->_identifier = (NSString *)v26;

      if (!v13)
      {
        v56 = 0;
        +[MCProfile removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PayloadUUID"), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v56);
        v28 = objc_claimAutoreleasedReturnValue();
        v13 = (NSString *)v56;
        UUID = v10->_UUID;
        v10->_UUID = (NSString *)v28;

      }
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("PayloadDescription"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
LABEL_21:
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("PayloadDescription"));
      if (v13)
        goto LABEL_28;
      v55 = 0;
      +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PayloadDisplayName"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v55);
      v38 = objc_claimAutoreleasedReturnValue();
      v13 = (NSString *)v55;
      displayName = v10->_displayName;
      v10->_displayName = (NSString *)v38;

      if (!v13)
      {
        v54 = 0;
        +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PayloadOrganization"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v54);
        v40 = objc_claimAutoreleasedReturnValue();
        v13 = (NSString *)v54;
        organization = v10->_organization;
        v10->_organization = (NSString *)v40;

      }
      WeakRetained = objc_loadWeakRetained((id *)&v10->_profile);
      v43 = objc_msgSend(WeakRetained, "isStub");

      if (!v43 || v13)
      {
LABEL_28:

        if (!v13)
          goto LABEL_34;
        goto LABEL_29;
      }
      v53 = 0;
      +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PersistentResourceID"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v53);
      v44 = objc_claimAutoreleasedReturnValue();
      v13 = (NSString *)v53;
      persistentResourceID = v10->_persistentResourceID;
      v10->_persistentResourceID = (NSString *)v44;
LABEL_27:

      goto LABEL_28;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      MCStringFromArrayOfStrings(v33);
      v30 = objc_claimAutoreleasedReturnValue();
      payloadDescription = v10->_payloadDescription;
      v10->_payloadDescription = (NSString *)v30;

      if (v10->_payloadDescription)
        goto LABEL_21;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v33;
        v36 = v10->_payloadDescription;
        v10->_payloadDescription = v35;
LABEL_20:

        goto LABEL_21;
      }
    }
    +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("PayloadDescription"));
    v37 = objc_claimAutoreleasedReturnValue();
    v36 = v13;
    v13 = (NSString *)v37;
    goto LABEL_20;
  }
  v13 = v12;

LABEL_29:
  -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v13);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (a5)
    *a5 = objc_retainAutorelease(v45);
  v47 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v48 = v47;
    v49 = (void *)objc_opt_class();
    v50 = v49;
    objc_msgSend(v46, "MCVerboseDescription");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v62 = v49;
    v63 = 2114;
    v64 = v51;
    _os_log_impl(&dword_19ECC4000, v48, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

  }
  v10 = 0;
LABEL_34:

  return v10;
}

- (id)malformedPayloadErrorWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[MCPayload profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "friendlyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB35C8];
  if (v6)
    MCErrorArray(CFSTR("ERROR_PAYLOAD_MALFORMED_P_ID"), v7, v8, v9, v10, v11, v12, v13, v6);
  else
    MCErrorArray(CFSTR("ERROR_PAYLOAD_MALFORMED"), v7, v8, v9, v10, v11, v12, v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCPayloadErrorDomain"), 2000, v15, v4, CFSTR("MCFatalError"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("PayloadVersion"));

  objc_msgSend(v3, "setObject:forKey:", self->_type, CFSTR("PayloadType"));
  objc_msgSend(v3, "setObject:forKey:", self->_identifier, CFSTR("PayloadIdentifier"));
  objc_msgSend(v3, "setObject:forKey:", self->_UUID, CFSTR("PayloadUUID"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_payloadDescription, CFSTR("PayloadDescription"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_displayName, CFSTR("PayloadDisplayName"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_organization, CFSTR("PayloadOrganization"));
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_persistentResourceID, CFSTR("PersistentResourceID"));
  return v3;
}

+ (id)wrapperPayloadDictionary
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("PayloadVersion"));

  return v2;
}

- (id)filterForUserEnrollmentOutError:(id *)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  +[MCPayload availablePayloadsForUserEnrollment](MCPayload, "availablePayloadsForUserEnrollment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", objc_opt_class());
  if (a3 && (v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    -[MCPayload type](self, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MCErrorArray(CFSTR("ERROR_UNACCEPTABLE_PAYLOAD_IN_USER_ENROLLMENT_P_TYPE"), v9, v10, v11, v12, v13, v14, v15, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCInstallationErrorDomain"), 4029, v16, CFSTR("MCFatalError"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end
