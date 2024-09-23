@implementation MCConferenceRoomDisplayPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.conferenceroomdisplay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
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

  return MCLocalizedFormat(CFSTR("CONFERENCE_ROOM_DISPLAY_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("CONFERENCE_ROOM_DISPLAY_PLURAL"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCConferenceRoomDisplayPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCConferenceRoomDisplayPayload *v9;
  uint64_t v10;
  id v11;
  NSString *customMessage;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MCConferenceRoomDisplayPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v25, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (v9)
  {
    v24 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Message"), 0, &v24);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v24;
    customMessage = v9->_customMessage;
    v9->_customMessage = (NSString *)v10;

    if (v11)
    {
      -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (a5)
        *a5 = objc_retainAutorelease(v13);
      v15 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = (void *)objc_opt_class();
        v18 = v17;
        objc_msgSend(v14, "MCVerboseDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v17;
        v28 = 2114;
        v29 = v19;
        _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v9 = 0;
    }
    if (objc_msgSend(v8, "count"))
    {
      v20 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v21 = v20;
        -[MCPayload friendlyName](v9, "friendlyName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        v28 = 2114;
        v29 = v8;
        _os_log_impl(&dword_19ECC4000, v21, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

      }
    }

  }
  return v9;
}

- (id)configuration
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCConferenceRoomDisplayPayload customMessage](self, "customMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Message"));

  return v3;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCConferenceRoomDisplayPayload;
  -[MCPayload stubDictionary](&v6, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCConferenceRoomDisplayPayload configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  uint64_t v5;
  MCKeyValue *v6;
  void *v7;
  void *v8;
  MCKeyValue *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[MCConferenceRoomDisplayPayload customMessage](self, "customMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = [MCKeyValue alloc];
    -[MCConferenceRoomDisplayPayload customMessage](self, "customMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("CONFERENCE_ROOM_DISPLAY_CUSTOM_MESSAGE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MCKeyValue initWithLocalizedString:localizedKey:](v6, "initWithLocalizedString:localizedKey:", v7, v8);

    objc_msgSend(v3, "addObject:", v9);
  }
  if (objc_msgSend(v3, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)customMessage
{
  return self->_customMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customMessage, 0);
}

@end
