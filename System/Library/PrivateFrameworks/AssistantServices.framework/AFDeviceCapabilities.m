@implementation AFDeviceCapabilities

- (AFDeviceCapabilities)initWithVoiceTriggerEnabled:(int64_t)a3
{
  AFDeviceCapabilities *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFDeviceCapabilities;
  result = -[AFDeviceCapabilities init](&v5, sel_init);
  if (result)
    result->_voiceTriggerEnabled = a3;
  return result;
}

- (AFDeviceCapabilities)initWithSerializedBackingStore:(id)a3
{
  id v5;
  void *v6;
  AFDeviceCapabilities *v7;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("voiceTriggerEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AFDeviceCapabilities initWithVoiceTriggerEnabled:](self, "initWithVoiceTriggerEnabled:", objc_msgSend(v6, "integerValue"));

  if (v7)
    objc_storeStrong((id *)&v7->_serializedBackingStore, a3);

  return v7;
}

- (id)serializedBackingStore
{
  id v3;
  void *v4;
  int64_t voiceTriggerEnabled;
  void *v6;
  void *v7;

  if (self->_serializedBackingStore)
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_serializedBackingStore);
  else
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  voiceTriggerEnabled = self->_voiceTriggerEnabled;
  if (voiceTriggerEnabled)
    goto LABEL_7;
  objc_msgSend(v3, "objectForKey:", CFSTR("voiceTriggerEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    voiceTriggerEnabled = self->_voiceTriggerEnabled;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", voiceTriggerEnabled);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("voiceTriggerEnabled"));

  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t voiceTriggerEnabled;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)AFDeviceCapabilities;
  -[AFDeviceCapabilities description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  voiceTriggerEnabled = self->_voiceTriggerEnabled;
  if (voiceTriggerEnabled > 2)
    v6 = CFSTR("(unknown)");
  else
    v6 = off_1E3A345C8[voiceTriggerEnabled];
  v7 = v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(voiceTriggerEnabled=%@)"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AFDeviceCapabilities serializedBackingStore](self, "serializedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  AFDeviceCapabilities *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (AFDeviceCapabilities *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AFDeviceCapabilities serializedBackingStore](self, "serializedBackingStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFDeviceCapabilities serializedBackingStore](v4, "serializedBackingStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (AFDeviceCapabilities)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  AFDeviceCapabilities *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("serializedBackingStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AFDeviceCapabilities initWithSerializedBackingStore:](self, "initWithSerializedBackingStore:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AFDeviceCapabilities serializedBackingStore](self, "serializedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("serializedBackingStore"));

}

- (int64_t)voiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedBackingStore, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
