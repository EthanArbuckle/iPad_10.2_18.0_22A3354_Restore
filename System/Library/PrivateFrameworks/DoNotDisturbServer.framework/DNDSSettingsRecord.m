@implementation DNDSSettingsRecord

+ (id)backingStoreWithFileURL:(id)a3
{
  id v4;
  DNDSJSONBackingStore *v5;

  v4 = a3;
  v5 = -[DNDSJSONBackingStore initWithRecordClass:fileURL:versionNumber:]([DNDSJSONBackingStore alloc], "initWithRecordClass:fileURL:versionNumber:", a1, v4, 2);

  return v5;
}

+ (id)recordWithEncodedInfo:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  DNDSMutableSettingsRecord *v11;

  v5 = a3;
  +[DNDSBehaviorSettingsRecord _recordWithEncodedInfo:error:](DNDSBehaviorSettingsRecord, "_recordWithEncodedInfo:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSScheduleSettingsRecord _recordWithEncodedInfo:error:](DNDSScheduleSettingsRecord, "_recordWithEncodedInfo:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSBypassSettingsRecord _recordWithEncodedInfo:error:](DNDSBypassSettingsRecord, "_recordWithEncodedInfo:error:", v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9 || v8 == 0)
  {
    v11 = 0;
  }
  else
  {
    v11 = objc_alloc_init(DNDSMutableSettingsRecord);
    -[DNDSMutableSettingsRecord setBehaviorSettings:](v11, "setBehaviorSettings:", v6);
    -[DNDSMutableSettingsRecord setScheduleSettings:](v11, "setScheduleSettings:", v7);
    -[DNDSMutableSettingsRecord setPhoneCallBypassSettings:](v11, "setPhoneCallBypassSettings:", v8);
  }

  return v11;
}

- (DNDSSettingsRecord)init
{
  return (DNDSSettingsRecord *)-[DNDSSettingsRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "behaviorSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneCallBypassSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[DNDSSettingsRecord _initWithBehaviorSettings:phoneCallBypassSettings:scheduleSettings:configurations:](self, "_initWithBehaviorSettings:phoneCallBypassSettings:scheduleSettings:configurations:", v5, v6, v7, v8);
  return v9;
}

- (id)_initWithBehaviorSettings:(id)a3 phoneCallBypassSettings:(id)a4 scheduleSettings:(id)a5 configurations:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DNDSSettingsRecord *v14;
  void *v15;
  void *v16;
  DNDSBehaviorSettingsRecord *v17;
  DNDSBehaviorSettingsRecord *behaviorSettings;
  void *v19;
  void *v20;
  DNDSBypassSettingsRecord *v21;
  DNDSBypassSettingsRecord *phoneCallBypassSettings;
  void *v23;
  void *v24;
  DNDSScheduleSettingsRecord *v25;
  DNDSScheduleSettingsRecord *scheduleSettings;
  void *v27;
  void *v28;
  DNDSConfigurationsRecord *v29;
  DNDSConfigurationsRecord *configurations;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)DNDSSettingsRecord;
  v14 = -[DNDSSettingsRecord init](&v32, sel_init);
  if (v14)
  {
    v15 = (void *)objc_msgSend(v10, "copy");
    v16 = v15;
    if (v15)
      v17 = v15;
    else
      v17 = objc_alloc_init(DNDSBehaviorSettingsRecord);
    behaviorSettings = v14->_behaviorSettings;
    v14->_behaviorSettings = v17;

    v19 = (void *)objc_msgSend(v11, "copy");
    v20 = v19;
    if (v19)
      v21 = v19;
    else
      v21 = objc_alloc_init(DNDSBypassSettingsRecord);
    phoneCallBypassSettings = v14->_phoneCallBypassSettings;
    v14->_phoneCallBypassSettings = v21;

    v23 = (void *)objc_msgSend(v12, "copy");
    v24 = v23;
    if (v23)
      v25 = v23;
    else
      v25 = objc_alloc_init(DNDSScheduleSettingsRecord);
    scheduleSettings = v14->_scheduleSettings;
    v14->_scheduleSettings = v25;

    v27 = (void *)objc_msgSend(v13, "copy");
    v28 = v27;
    if (v27)
      v29 = v27;
    else
      v29 = objc_alloc_init(DNDSConfigurationsRecord);
    configurations = v14->_configurations;
    v14->_configurations = v29;

  }
  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[DNDSSettingsRecord behaviorSettings](self, "behaviorSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSSettingsRecord phoneCallBypassSettings](self, "phoneCallBypassSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSSettingsRecord scheduleSettings](self, "scheduleSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDSSettingsRecord configurations](self, "configurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  DNDSSettingsRecord *v4;
  DNDSSettingsRecord *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v4 = (DNDSSettingsRecord *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSSettingsRecord behaviorSettings](self, "behaviorSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSSettingsRecord behaviorSettings](v5, "behaviorSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDSSettingsRecord behaviorSettings](self, "behaviorSettings");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
          goto LABEL_50;
        }
        v9 = (void *)v8;
        -[DNDSSettingsRecord behaviorSettings](v5, "behaviorSettings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_49:

          goto LABEL_50;
        }
        -[DNDSSettingsRecord behaviorSettings](self, "behaviorSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSSettingsRecord behaviorSettings](v5, "behaviorSettings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_48:

          goto LABEL_49;
        }
        v49 = v12;
        v50 = v11;
        v51 = v10;
        v52 = v9;
      }
      -[DNDSSettingsRecord phoneCallBypassSettings](self, "phoneCallBypassSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSSettingsRecord phoneCallBypassSettings](v5, "phoneCallBypassSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDSSettingsRecord phoneCallBypassSettings](self, "phoneCallBypassSettings");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[DNDSSettingsRecord phoneCallBypassSettings](v5, "phoneCallBypassSettings");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            v48 = v14;
            -[DNDSSettingsRecord phoneCallBypassSettings](self, "phoneCallBypassSettings");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSSettingsRecord phoneCallBypassSettings](v5, "phoneCallBypassSettings");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v20, "isEqual:", v21) & 1) == 0)
            {

              goto LABEL_38;
            }
            v43 = v20;
            v44 = v19;
            v45 = v17;
            v14 = v21;
            goto LABEL_17;
          }

        }
        goto LABEL_38;
      }
      v48 = v14;
LABEL_17:
      -[DNDSSettingsRecord scheduleSettings](self, "scheduleSettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSSettingsRecord scheduleSettings](v5, "scheduleSettings");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 == v47)
      {
        v46 = v22;
        goto LABEL_25;
      }
      -[DNDSSettingsRecord scheduleSettings](self, "scheduleSettings");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        -[DNDSSettingsRecord scheduleSettings](v5, "scheduleSettings");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v40 = v14;
          v42 = v25;
          -[DNDSSettingsRecord scheduleSettings](self, "scheduleSettings");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSSettingsRecord scheduleSettings](v5, "scheduleSettings");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v26, "isEqual:", v27) & 1) != 0)
          {
            v37 = v27;
            v38 = v26;
            v39 = v24;
            v46 = v22;
            v14 = v40;
LABEL_25:
            -[DNDSSettingsRecord configurations](self, "configurations");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSSettingsRecord configurations](v5, "configurations");
            v29 = objc_claimAutoreleasedReturnValue();
            if (v28 == (void *)v29)
            {

              v13 = 1;
            }
            else
            {
              v30 = (void *)v29;
              -[DNDSSettingsRecord configurations](self, "configurations");
              v31 = objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                v41 = (void *)v31;
                -[DNDSSettingsRecord configurations](v5, "configurations");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (v32)
                {
                  v36 = v32;
                  -[DNDSSettingsRecord configurations](self, "configurations");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DNDSSettingsRecord configurations](v5, "configurations");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = objc_msgSend(v35, "isEqual:", v33);

                  v32 = v36;
                }
                else
                {
                  v13 = 0;
                }

              }
              else
              {

                v13 = 0;
              }
            }
            if (v46 != v47)
            {

            }
            if (v48 != v15)
            {

            }
LABEL_47:
            v10 = v51;
            v9 = v52;
            v11 = v50;
            v12 = v49;
            if (v6 != v7)
              goto LABEL_48;
LABEL_50:

            goto LABEL_51;
          }

          v14 = v40;
          v25 = v42;
        }

      }
      if (v48 != v15)
      {

      }
LABEL_38:
      v13 = 0;
      goto LABEL_47;
    }
    v13 = 0;
  }
LABEL_51:

  return v13;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSSettingsRecord behaviorSettings](self, "behaviorSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSettingsRecord phoneCallBypassSettings](self, "phoneCallBypassSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSettingsRecord scheduleSettings](self, "scheduleSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSettingsRecord configurations](self, "configurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; behaviorSettings: %@; phoneCallBypassSettings: %@; scheduleSettings: %@; configurations: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSSettingsRecord _initWithRecord:]([DNDSMutableSettingsRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("behaviorSettings"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[DNDSBehaviorSettingsRecord newWithDictionaryRepresentation:context:](DNDSBehaviorSettingsRecord, "newWithDictionaryRepresentation:context:", v8, v6);
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("phoneCallBypassSettings"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[DNDSBypassSettingsRecord newWithDictionaryRepresentation:context:](DNDSBypassSettingsRecord, "newWithDictionaryRepresentation:context:", v10, v6);
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("scheduleSettings"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[DNDSScheduleSettingsRecord newWithDictionaryRepresentation:context:](DNDSScheduleSettingsRecord, "newWithDictionaryRepresentation:context:", v12, v6);
  objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("configurations"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = +[DNDSConfigurationsRecord newWithDictionaryRepresentation:context:](DNDSConfigurationsRecord, "newWithDictionaryRepresentation:context:", v14, v6);
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithBehaviorSettings:phoneCallBypassSettings:scheduleSettings:configurations:", v9, v11, v13, v15);

  return v16;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSettingsRecord behaviorSettings](self, "behaviorSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentationWithContext:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("behaviorSettings"));
  -[DNDSSettingsRecord phoneCallBypassSettings](self, "phoneCallBypassSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentationWithContext:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("phoneCallBypassSettings"));
  -[DNDSSettingsRecord scheduleSettings](self, "scheduleSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentationWithContext:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("scheduleSettings"));
  -[DNDSSettingsRecord configurations](self, "configurations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentationWithContext:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("configurations"));
  return v6;
}

- (DNDSBehaviorSettingsRecord)behaviorSettings
{
  return self->_behaviorSettings;
}

- (DNDSBypassSettingsRecord)phoneCallBypassSettings
{
  return self->_phoneCallBypassSettings;
}

- (DNDSScheduleSettingsRecord)scheduleSettings
{
  return self->_scheduleSettings;
}

- (DNDSConfigurationsRecord)configurations
{
  return self->_configurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_scheduleSettings, 0);
  objc_storeStrong((id *)&self->_phoneCallBypassSettings, 0);
  objc_storeStrong((id *)&self->_behaviorSettings, 0);
}

@end
