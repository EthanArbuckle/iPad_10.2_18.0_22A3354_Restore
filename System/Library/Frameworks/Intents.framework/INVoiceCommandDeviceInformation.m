@implementation INVoiceCommandDeviceInformation

- (INVoiceCommandDeviceInformation)initWithDeviceIdiom:(int64_t)a3 isHomePodInUltimateMode:(id)a4
{
  id v6;
  INVoiceCommandDeviceInformation *v7;
  INVoiceCommandDeviceInformation *v8;
  uint64_t v9;
  NSNumber *isHomePodInUltimateMode;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INVoiceCommandDeviceInformation;
  v7 = -[INVoiceCommandDeviceInformation init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_deviceIdiom = a3;
    v9 = objc_msgSend(v6, "copy");
    isHomePodInUltimateMode = v8->_isHomePodInUltimateMode;
    v8->_isHomePodInUltimateMode = (NSNumber *)v9;

  }
  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceIdiom);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSNumber hash](self->_isHomePodInUltimateMode, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  INVoiceCommandDeviceInformation *v4;
  INVoiceCommandDeviceInformation *v5;
  NSNumber *isHomePodInUltimateMode;
  BOOL v7;

  v4 = (INVoiceCommandDeviceInformation *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v7 = 0;
      if (self->_deviceIdiom == v5->_deviceIdiom)
      {
        isHomePodInUltimateMode = self->_isHomePodInUltimateMode;
        if (isHomePodInUltimateMode == v5->_isHomePodInUltimateMode
          || -[NSNumber isEqual:](isHomePodInUltimateMode, "isEqual:"))
        {
          v7 = 1;
        }
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (INVoiceCommandDeviceInformation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  INVoiceCommandDeviceInformation *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceIdiom"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isHomePodInUltimateMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[INVoiceCommandDeviceInformation initWithDeviceIdiom:isHomePodInUltimateMode:](self, "initWithDeviceIdiom:isHomePodInUltimateMode:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t deviceIdiom;
  id v5;

  deviceIdiom = self->_deviceIdiom;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", deviceIdiom, CFSTR("deviceIdiom"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isHomePodInUltimateMode, CFSTR("isHomePodInUltimateMode"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_deviceIdiom - 1;
  if (v8 > 6)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E2292EE0[v8];
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("deviceIdiom"));

  objc_msgSend(v6, "encodeObject:", self->_isHomePodInUltimateMode);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("isHomePodInUltimateMode"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INVoiceCommandDeviceInformation descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INVoiceCommandDeviceInformation;
  -[INVoiceCommandDeviceInformation description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INVoiceCommandDeviceInformation _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  NSNumber *isHomePodInUltimateMode;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("deviceIdiom");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceIdiom);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("isHomePodInUltimateMode");
  v9[0] = v3;
  isHomePodInUltimateMode = self->_isHomePodInUltimateMode;
  v5 = isHomePodInUltimateMode;
  if (!isHomePodInUltimateMode)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isHomePodInUltimateMode)

  return v6;
}

- (int64_t)deviceIdiom
{
  return self->_deviceIdiom;
}

- (NSNumber)isHomePodInUltimateMode
{
  return self->_isHomePodInUltimateMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isHomePodInUltimateMode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceIdiom"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = INDeviceIdiomWithString(v7);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isHomePodInUltimateMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDeviceIdiom:isHomePodInUltimateMode:", v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
