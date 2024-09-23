@implementation DNDSGlobalConfiguration

+ (id)backingStoreWithFileURL:(id)a3
{
  id v4;
  DNDSJSONBackingStore *v5;

  v4 = a3;
  v5 = -[DNDSJSONBackingStore initWithRecordClass:fileURL:versionNumber:]([DNDSJSONBackingStore alloc], "initWithRecordClass:fileURL:versionNumber:", a1, v4, 1);

  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  void *v25;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("preventAutoReply"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v23 = objc_msgSend(v7, "unsignedIntegerValue");
  else
    v23 = 0;
  objc_msgSend(v5, "bs_safeDictionaryForKey:", CFSTR("bypassSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v6;
  if (v9)
  {
    v10 = +[DNDSBypassSettingsRecord newWithDictionaryRepresentation:context:](DNDSBypassSettingsRecord, "newWithDictionaryRepresentation:context:", v9, v6);
    objc_msgSend(MEMORY[0x1E0D1D5A8], "settingsForRecord:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("modesCanImpactAvailability"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = objc_msgSend(v12, "unsignedIntegerValue");
  else
    v14 = 0;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("lastModified"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v16, "dateWithTimeIntervalSince1970:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("automaticallyGenerated"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    v20 = objc_msgSend(v18, "BOOLValue");
  else
    v20 = 0;
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPreventAutoReply:bypassSettings:modesCanImpactAvailability:lastModified:automaticallyGenerated:", v23, v11, v14, v17, v20);

  return v21;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[DNDSGlobalConfiguration bypassSettings](self, "bypassSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dictionaryRepresentationWithContext:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDSGlobalConfiguration preventAutoReply](self, "preventAutoReply"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("preventAutoReply"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("bypassSettings"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DNDSGlobalConfiguration modesCanImpactAvailability](self, "modesCanImpactAvailability"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("modesCanImpactAvailability"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[DNDSGlobalConfiguration lastModified](self, "lastModified");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("lastModified"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSGlobalConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("automaticallyGenerated"));

  return v8;
}

- (DNDSGlobalConfiguration)init
{
  return (DNDSGlobalConfiguration *)-[DNDSGlobalConfiguration _initWithConfiguration:](self, "_initWithConfiguration:", 0);
}

- (DNDSGlobalConfiguration)initWithPreventAutoReply:(unint64_t)a3 bypassSettings:(id)a4 modesCanImpactAvailability:(unint64_t)a5 lastModified:(id)a6 automaticallyGenerated:(BOOL)a7
{
  id v12;
  id v13;
  DNDSGlobalConfiguration *v14;
  DNDSGlobalConfiguration *v15;
  uint64_t v16;
  DNDBypassSettings *bypassSettings;
  uint64_t v18;
  NSDate *lastModified;
  objc_super v21;

  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)DNDSGlobalConfiguration;
  v14 = -[DNDSGlobalConfiguration init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_preventAutoReply = a3;
    v16 = objc_msgSend(v12, "copy");
    bypassSettings = v15->_bypassSettings;
    v15->_bypassSettings = (DNDBypassSettings *)v16;

    v15->_modesCanImpactAvailability = a5;
    v18 = objc_msgSend(v13, "copy");
    lastModified = v15->_lastModified;
    v15->_lastModified = (NSDate *)v18;

    v15->_automaticallyGenerated = a7;
  }

  return v15;
}

- (id)_initWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  DNDSGlobalConfiguration *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "preventAutoReply");
  objc_msgSend(v4, "bypassSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "modesCanImpactAvailability");
  objc_msgSend(v4, "lastModified");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[DNDSGlobalConfiguration initWithPreventAutoReply:bypassSettings:modesCanImpactAvailability:lastModified:automaticallyGenerated:](self, "initWithPreventAutoReply:bypassSettings:modesCanImpactAvailability:lastModified:automaticallyGenerated:", v5, v6, v7, v9, objc_msgSend(v4, "isAutomaticallyGenerated"));
  if (!v8)

  return v10;
}

- (id)mergeWithGlobalConfiguration:(id)a3
{
  DNDSGlobalConfiguration *v4;
  id *p_isa;
  DNDSGlobalConfiguration *v6;
  NSDate *lastModified;
  void *v8;
  DNDSGlobalConfiguration *v9;
  void *v11;
  int v12;

  v4 = (DNDSGlobalConfiguration *)a3;
  p_isa = (id *)&v4->super.isa;
  if (!v4)
    goto LABEL_8;
  if (self->_automaticallyGenerated)
  {
    v6 = v4;
    if (!v4->_automaticallyGenerated)
      goto LABEL_9;
  }
  else if (v4->_automaticallyGenerated)
  {
LABEL_8:
    v6 = self;
    goto LABEL_9;
  }
  lastModified = self->_lastModified;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(lastModified) = -[NSDate isEqualToDate:](lastModified, "isEqualToDate:", v8);

  if ((lastModified & 1) != 0
    || (objc_msgSend(p_isa[4], "isEqualToDate:", self->_lastModified) & 1) != 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(p_isa[4], "laterDate:", self->_lastModified);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToDate:", p_isa[4]);

  if (v12)
    v6 = (DNDSGlobalConfiguration *)p_isa;
  else
    v6 = self;
LABEL_9:
  v9 = v6;

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_lastModified, "hash");
  return -[DNDBypassSettings hash](self->_bypassSettings, "hash") ^ v3 ^ self->_preventAutoReply ^ self->_modesCanImpactAvailability ^ self->_automaticallyGenerated;
}

- (BOOL)isEqual:(id)a3
{
  DNDSGlobalConfiguration *v4;
  DNDSGlobalConfiguration *v5;
  unint64_t v6;
  _BOOL4 v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = (DNDSGlobalConfiguration *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DNDSGlobalConfiguration preventAutoReply](self, "preventAutoReply");
      if (v6 != -[DNDSGlobalConfiguration preventAutoReply](v5, "preventAutoReply")
        || (v7 = -[DNDSGlobalConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated"),
            v7 != -[DNDSGlobalConfiguration isAutomaticallyGenerated](v5, "isAutomaticallyGenerated"))
        || (v8 = -[DNDSGlobalConfiguration modesCanImpactAvailability](self, "modesCanImpactAvailability"),
            v8 != -[DNDSGlobalConfiguration modesCanImpactAvailability](v5, "modesCanImpactAvailability")))
      {
        v16 = 0;
LABEL_14:

        goto LABEL_15;
      }
      -[DNDSGlobalConfiguration lastModified](self, "lastModified");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSGlobalConfiguration lastModified](v5, "lastModified");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        -[DNDSGlobalConfiguration lastModified](self, "lastModified");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v16 = 0;
LABEL_30:

          goto LABEL_14;
        }
        v12 = (void *)v11;
        -[DNDSGlobalConfiguration lastModified](v5, "lastModified");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v16 = 0;
LABEL_29:

          goto LABEL_30;
        }
        -[DNDSGlobalConfiguration lastModified](self, "lastModified");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSGlobalConfiguration lastModified](v5, "lastModified");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "isEqual:", v15))
        {
          v16 = 0;
LABEL_28:

          goto LABEL_29;
        }
        v26 = v15;
        v27 = v14;
        v28 = v13;
        v29 = v12;
      }
      -[DNDSGlobalConfiguration bypassSettings](self, "bypassSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSGlobalConfiguration bypassSettings](v5, "bypassSettings");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v18 == (void *)v19)
      {

        v16 = 1;
      }
      else
      {
        v20 = (void *)v19;
        -[DNDSGlobalConfiguration bypassSettings](self, "bypassSettings");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          -[DNDSGlobalConfiguration bypassSettings](v5, "bypassSettings");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            -[DNDSGlobalConfiguration bypassSettings](self, "bypassSettings");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSGlobalConfiguration bypassSettings](v5, "bypassSettings");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v25, "isEqual:", v24);

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {

          v16 = 0;
        }
      }
      v13 = v28;
      v12 = v29;
      v15 = v26;
      v14 = v27;
      if (v9 == v10)
        goto LABEL_30;
      goto LABEL_28;
    }
    v16 = 0;
  }
LABEL_15:

  return v16;
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
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  DNDEnabledSettingToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSGlobalConfiguration bypassSettings](self, "bypassSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DNDEnabledSettingToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSGlobalConfiguration lastModified](self, "lastModified");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DNDSGlobalConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; preventAutoReply: %@; bypassSettings: %@; modesCanImpactAvailability: %@; lastModified: %@; automaticallyGenerated: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSGlobalConfiguration _initWithConfiguration:]([DNDSMutableGlobalConfiguration alloc], "_initWithConfiguration:", self);
}

- (unint64_t)preventAutoReply
{
  return self->_preventAutoReply;
}

- (DNDBypassSettings)bypassSettings
{
  return self->_bypassSettings;
}

- (unint64_t)modesCanImpactAvailability
{
  return self->_modesCanImpactAvailability;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (BOOL)isAutomaticallyGenerated
{
  return self->_automaticallyGenerated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_bypassSettings, 0);
}

@end
