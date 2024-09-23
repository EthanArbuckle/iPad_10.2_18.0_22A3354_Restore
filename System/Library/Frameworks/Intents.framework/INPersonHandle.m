@implementation INPersonHandle

- (INPersonHandle)initWithValue:(NSString *)value type:(INPersonHandleType)type
{
  return -[INPersonHandle initWithValue:type:label:](self, "initWithValue:type:label:", value, type, 0);
}

- (INPersonHandle)initWithValue:(NSString *)value type:(INPersonHandleType)type label:(INPersonHandleLabel)label
{
  NSString *v8;
  NSString *v9;
  INPersonHandle *v10;
  uint64_t v11;
  NSString *v12;
  objc_super v14;

  v8 = value;
  v9 = label;
  v14.receiver = self;
  v14.super_class = (Class)INPersonHandle;
  v10 = -[INPersonHandle init](&v14, sel_init);
  if (v10)
  {
    v11 = -[NSString copy](v8, "copy");
    v12 = v10->_value;
    v10->_value = (NSString *)v11;

    v10->_type = type;
    objc_storeStrong((id *)&v10->_label, label);
  }

  return v10;
}

- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 emergencyType:(int64_t)a6
{
  return -[INPersonHandle initWithValue:type:label:emergencyType:faceTimeType:suggested:](self, "initWithValue:type:label:emergencyType:faceTimeType:suggested:", a3, a4, a5, a6, 0, 0);
}

- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 faceTimeType:(int64_t)a6
{
  return -[INPersonHandle initWithValue:type:label:emergencyType:faceTimeType:suggested:](self, "initWithValue:type:label:emergencyType:faceTimeType:suggested:", a3, a4, a5, 0, a6, 0);
}

- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 suggested:(BOOL)a6
{
  return -[INPersonHandle initWithValue:type:label:emergencyType:faceTimeType:suggested:](self, "initWithValue:type:label:emergencyType:faceTimeType:suggested:", a3, a4, a5, 0, 0, a6);
}

- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 emergencyType:(int64_t)a6 suggested:(BOOL)a7
{
  return -[INPersonHandle initWithValue:type:label:emergencyType:faceTimeType:suggested:](self, "initWithValue:type:label:emergencyType:faceTimeType:suggested:", a3, a4, a5, a6, 0, a7);
}

- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 emergencyType:(int64_t)a6 faceTimeType:(int64_t)a7 suggested:(BOOL)a8
{
  id v14;
  id v15;
  INPersonHandle *v16;
  uint64_t v17;
  NSString *value;
  objc_super v20;

  v14 = a3;
  v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)INPersonHandle;
  v16 = -[INPersonHandle init](&v20, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    value = v16->_value;
    v16->_value = (NSString *)v17;

    v16->_type = a4;
    objc_storeStrong((id *)&v16->_label, a5);
    v16->_emergencyType = a6;
    v16->_faceTimeType = a7;
    v16->_suggested = a8;
  }

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  void *v7;
  unint64_t v8;

  v3 = -[NSString hash](self->_value, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[NSString hash](self->_label, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_emergencyType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash") ^ self->_suggested;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSString *value;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    value = self->_value;
    if (value != (NSString *)v5[2] && (-[NSString isEqual:](value, "isEqual:") & 1) == 0)
    {
      if (self->_type == 1 || v5[3] == 1)
        goto LABEL_11;
      v7 = 0;
      if (!PNPhoneNumbersEqual())
        goto LABEL_12;
    }
    if (self->_type == v5[3] && self->_emergencyType == v5[5] && self->_faceTimeType == v5[6])
    {
      v7 = self->_suggested == *((unsigned __int8 *)v5 + 8);
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("value"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_emergencyType, CFSTR("emergencyType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_faceTimeType, CFSTR("faceTimeType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_suggested, CFSTR("suggested"));

}

- (INPersonHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  INPersonHandle *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("emergencyType"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("faceTimeType"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suggested"));

  v11 = -[INPersonHandle initWithValue:type:label:emergencyType:faceTimeType:suggested:](self, "initWithValue:type:label:emergencyType:faceTimeType:suggested:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (NSString)description
{
  return (NSString *)-[INPersonHandle descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INPersonHandle;
  -[INPersonHandle description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INPersonHandle _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *value;
  void *v4;
  INPersonHandleType v5;
  int v6;
  __CFString *v7;
  NSString *label;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("value");
  value = self->_value;
  v4 = value;
  if (!value)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[0] = v4;
  v12[1] = CFSTR("type");
  v5 = -[INPersonHandle type](self, "type");
  if (v5 <= INPersonHandleTypeEmailAddress)
  {
    if (v5 == INPersonHandleTypeUnknown)
    {
      v6 = 0;
      v7 = CFSTR("Unknown");
      goto LABEL_15;
    }
    if (v5 == INPersonHandleTypeEmailAddress)
    {
      v6 = 0;
      v7 = CFSTR("EmailAddress");
      goto LABEL_15;
    }
  }
  else
  {
    switch(v5)
    {
      case 2:
        v6 = 0;
        v7 = CFSTR("PhoneNumber");
        goto LABEL_15;
      case 103:
        v6 = 0;
        v7 = CFSTR("Website");
        goto LABEL_15;
      case 104:
        v6 = 0;
        v7 = CFSTR("InstantMessage");
        goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = 1;
LABEL_15:
  v13[1] = v7;
  v12[2] = CFSTR("label");
  label = self->_label;
  v9 = label;
  if (!label)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (label)
  {
    if (!v6)
      goto LABEL_19;
LABEL_22:

    if (value)
      return v10;
LABEL_23:

    return v10;
  }

  if (v6)
    goto LABEL_22;
LABEL_19:
  if (!value)
    goto LABEL_23;
  return v10;
}

- (NSString)value
{
  return self->_value;
}

- (INPersonHandleType)type
{
  return self->_type;
}

- (INPersonHandleLabel)label
{
  return self->_label;
}

- (int64_t)emergencyType
{
  return self->_emergencyType;
}

- (int64_t)faceTimeType
{
  return self->_faceTimeType;
}

- (BOOL)isSuggested
{
  return self->_suggested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
