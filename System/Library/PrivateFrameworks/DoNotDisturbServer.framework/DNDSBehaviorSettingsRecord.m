@implementation DNDSBehaviorSettingsRecord

- (DNDSBehaviorSettingsRecord)init
{
  return (DNDSBehaviorSettingsRecord *)-[DNDSBehaviorSettingsRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "interruptionBehaviorSetting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DNDSBehaviorSettingsRecord _initWithInterruptionBehaviorSetting:](self, "_initWithInterruptionBehaviorSetting:", v4);

  return v5;
}

- (id)_initWithInterruptionBehaviorSetting:(id)a3
{
  id v4;
  DNDSBehaviorSettingsRecord *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DNDSBehaviorSettingsRecord;
  v5 = -[DNDSBehaviorSettingsRecord init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = &unk_1E86DE478;
    objc_storeStrong((id *)&v5->_interruptionBehaviorSetting, v8);

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DNDSBehaviorSettingsRecord interruptionBehaviorSetting](self, "interruptionBehaviorSetting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDSBehaviorSettingsRecord *v4;
  DNDSBehaviorSettingsRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (DNDSBehaviorSettingsRecord *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSBehaviorSettingsRecord interruptionBehaviorSetting](self, "interruptionBehaviorSetting");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSBehaviorSettingsRecord interruptionBehaviorSetting](v5, "interruptionBehaviorSetting");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[DNDSBehaviorSettingsRecord interruptionBehaviorSetting](self, "interruptionBehaviorSetting");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[DNDSBehaviorSettingsRecord interruptionBehaviorSetting](v5, "interruptionBehaviorSetting");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDSBehaviorSettingsRecord interruptionBehaviorSetting](self, "interruptionBehaviorSetting");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSBehaviorSettingsRecord interruptionBehaviorSetting](v5, "interruptionBehaviorSetting");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqual:", v11);

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSBehaviorSettingsRecord interruptionBehaviorSetting](self, "interruptionBehaviorSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; interruptionBehaviorSetting: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSBehaviorSettingsRecord _initWithRecord:]([DNDSMutableBehaviorSettingsRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(v5, "bs_safeObjectForKey:ofType:", CFSTR("interruptionBehaviorSetting"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithInterruptionBehaviorSetting:", v6);
  return v7;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSBehaviorSettingsRecord interruptionBehaviorSetting](self, "interruptionBehaviorSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("interruptionBehaviorSetting"));

  return v4;
}

- (NSNumber)interruptionBehaviorSetting
{
  return self->_interruptionBehaviorSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptionBehaviorSetting, 0);
}

+ (id)_recordWithEncodedInfo:(id)a3 error:(id *)a4
{
  id v4;
  DNDSMutableBehaviorSettingsRecord *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(DNDSMutableBehaviorSettingsRecord);
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("effectiveWhileUnlocked"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "BOOLValue"))
    v7 = 1;
  else
    v7 = 2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableBehaviorSettingsRecord setInterruptionBehaviorSetting:](v5, "setInterruptionBehaviorSetting:", v8);

  return v5;
}

@end
