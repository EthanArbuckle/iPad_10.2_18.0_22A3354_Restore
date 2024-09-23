@implementation INSettingMetadata

- (INSettingMetadata)initWithSettingId:(id)a3 targetDevice:(id)a4 targetApp:(id)a5
{
  id v8;
  id v9;
  id v10;
  INSettingMetadata *v11;
  uint64_t v12;
  NSString *settingId;
  uint64_t v14;
  INSettingDevice *targetDevice;
  uint64_t v16;
  INAppIdentifier *targetApp;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)INSettingMetadata;
  v11 = -[INSettingMetadata init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    settingId = v11->_settingId;
    v11->_settingId = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    targetDevice = v11->_targetDevice;
    v11->_targetDevice = (INSettingDevice *)v14;

    v16 = objc_msgSend(v10, "copy");
    targetApp = v11->_targetApp;
    v11->_targetApp = (INAppIdentifier *)v16;

  }
  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_settingId, "hash");
  v4 = -[INSettingDevice hash](self->_targetDevice, "hash") ^ v3;
  return v4 ^ -[INAppIdentifier hash](self->_targetApp, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INSettingMetadata *v4;
  INSettingMetadata *v5;
  NSString *settingId;
  INSettingDevice *targetDevice;
  INAppIdentifier *targetApp;
  BOOL v9;

  v4 = (INSettingMetadata *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      settingId = self->_settingId;
      v9 = 0;
      if (settingId == v5->_settingId || -[NSString isEqual:](settingId, "isEqual:"))
      {
        targetDevice = self->_targetDevice;
        if (targetDevice == v5->_targetDevice || -[INSettingDevice isEqual:](targetDevice, "isEqual:"))
        {
          targetApp = self->_targetApp;
          if (targetApp == v5->_targetApp || -[INAppIdentifier isEqual:](targetApp, "isEqual:"))
            v9 = 1;
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (INSettingMetadata)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  INSettingMetadata *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("settingId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetDevice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetApp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[INSettingMetadata initWithSettingId:targetDevice:targetApp:](self, "initWithSettingId:targetDevice:targetApp:", v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *settingId;
  id v5;

  settingId = self->_settingId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", settingId, CFSTR("settingId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetDevice, CFSTR("targetDevice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetApp, CFSTR("targetApp"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_settingId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("settingId"));

  objc_msgSend(v6, "encodeObject:", self->_targetDevice);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("targetDevice"));

  objc_msgSend(v6, "encodeObject:", self->_targetApp);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("targetApp"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INSettingMetadata descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INSettingMetadata;
  -[INSettingMetadata description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSettingMetadata _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *settingId;
  void *v4;
  INSettingDevice *targetDevice;
  void *v6;
  INAppIdentifier *targetApp;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("settingId");
  settingId = self->_settingId;
  v4 = settingId;
  if (!settingId)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("targetDevice");
  targetDevice = self->_targetDevice;
  v6 = targetDevice;
  if (!targetDevice)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("targetApp");
  targetApp = self->_targetApp;
  v8 = targetApp;
  if (!targetApp)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (targetApp)
  {
    if (targetDevice)
      goto LABEL_9;
LABEL_12:

    if (settingId)
      return v9;
LABEL_13:

    return v9;
  }

  if (!targetDevice)
    goto LABEL_12;
LABEL_9:
  if (!settingId)
    goto LABEL_13;
  return v9;
}

- (NSString)settingId
{
  return self->_settingId;
}

- (INSettingDevice)targetDevice
{
  return self->_targetDevice;
}

- (INAppIdentifier)targetApp
{
  return self->_targetApp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetApp, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_settingId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("settingId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("targetDevice"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("targetApp"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSettingId:targetDevice:targetApp:", v9, v12, v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
