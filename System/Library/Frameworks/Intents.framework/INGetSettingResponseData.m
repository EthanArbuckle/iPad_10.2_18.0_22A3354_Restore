@implementation INGetSettingResponseData

- (INGetSettingResponseData)initWithSettingMetadata:(id)a3 numericValue:(id)a4 boundedValue:(int64_t)a5 binaryValue:(int64_t)a6 labeledValue:(id)a7
{
  id v12;
  id v13;
  id v14;
  INGetSettingResponseData *v15;
  uint64_t v16;
  INSettingMetadata *settingMetadata;
  uint64_t v18;
  INNumericSettingValue *numericValue;
  uint64_t v20;
  NSString *labeledValue;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)INGetSettingResponseData;
  v15 = -[INGetSettingResponseData init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    settingMetadata = v15->_settingMetadata;
    v15->_settingMetadata = (INSettingMetadata *)v16;

    v18 = objc_msgSend(v13, "copy");
    numericValue = v15->_numericValue;
    v15->_numericValue = (INNumericSettingValue *)v18;

    v15->_boundedValue = a5;
    v15->_binaryValue = a6;
    v20 = objc_msgSend(v14, "copy");
    labeledValue = v15->_labeledValue;
    v15->_labeledValue = (NSString *)v20;

  }
  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;

  v3 = -[INSettingMetadata hash](self->_settingMetadata, "hash");
  v4 = -[INNumericSettingValue hash](self->_numericValue, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_boundedValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_binaryValue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_labeledValue, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  INGetSettingResponseData *v4;
  INGetSettingResponseData *v5;
  INSettingMetadata *settingMetadata;
  INNumericSettingValue *numericValue;
  NSString *labeledValue;
  BOOL v9;

  v4 = (INGetSettingResponseData *)a3;
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
      settingMetadata = self->_settingMetadata;
      v9 = 0;
      if (settingMetadata == v5->_settingMetadata || -[INSettingMetadata isEqual:](settingMetadata, "isEqual:"))
      {
        numericValue = self->_numericValue;
        if ((numericValue == v5->_numericValue || -[INNumericSettingValue isEqual:](numericValue, "isEqual:"))
          && self->_boundedValue == v5->_boundedValue
          && self->_binaryValue == v5->_binaryValue)
        {
          labeledValue = self->_labeledValue;
          if (labeledValue == v5->_labeledValue || -[NSString isEqual:](labeledValue, "isEqual:"))
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

- (INGetSettingResponseData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  INGetSettingResponseData *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settingMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numericValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("boundedValue"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("binaryValue"));
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("labeledValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[INGetSettingResponseData initWithSettingMetadata:numericValue:boundedValue:binaryValue:labeledValue:](self, "initWithSettingMetadata:numericValue:boundedValue:binaryValue:labeledValue:", v5, v6, v7, v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  INSettingMetadata *settingMetadata;
  id v5;

  settingMetadata = self->_settingMetadata;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", settingMetadata, CFSTR("settingMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numericValue, CFSTR("numericValue"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_boundedValue, CFSTR("boundedValue"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_binaryValue, CFSTR("binaryValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_labeledValue, CFSTR("labeledValue"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  unint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_settingMetadata);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("settingMetadata"));

  objc_msgSend(v6, "encodeObject:", self->_numericValue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("numericValue"));

  v10 = self->_boundedValue - 1;
  if (v10 > 2)
    v11 = CFSTR("unknown");
  else
    v11 = off_1E2294920[v10];
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("boundedValue"));

  v13 = self->_binaryValue - 1;
  if (v13 > 2)
    v14 = CFSTR("unknown");
  else
    v14 = *(&off_1E22946E8 + v13);
  v15 = v14;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("binaryValue"));

  objc_msgSend(v6, "encodeObject:", self->_labeledValue);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("labeledValue"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INGetSettingResponseData descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INGetSettingResponseData;
  -[INGetSettingResponseData description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INGetSettingResponseData _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INSettingMetadata *settingMetadata;
  void *v4;
  INNumericSettingValue *numericValue;
  void *v6;
  void *v7;
  void *v8;
  NSString *labeledValue;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("settingMetadata");
  settingMetadata = self->_settingMetadata;
  v4 = settingMetadata;
  if (!settingMetadata)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("numericValue");
  numericValue = self->_numericValue;
  v6 = numericValue;
  if (!numericValue)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("boundedValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_boundedValue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("binaryValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_binaryValue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  v13[4] = CFSTR("labeledValue");
  labeledValue = self->_labeledValue;
  v10 = labeledValue;
  if (!labeledValue)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!labeledValue)

  if (!numericValue)
  {

    if (settingMetadata)
      return v11;
LABEL_13:

    return v11;
  }
  if (!settingMetadata)
    goto LABEL_13;
  return v11;
}

- (INSettingMetadata)settingMetadata
{
  return self->_settingMetadata;
}

- (INNumericSettingValue)numericValue
{
  return self->_numericValue;
}

- (int64_t)boundedValue
{
  return self->_boundedValue;
}

- (int64_t)binaryValue
{
  return self->_binaryValue;
}

- (NSString)labeledValue
{
  return self->_labeledValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeledValue, 0);
  objc_storeStrong((id *)&self->_numericValue, 0);
  objc_storeStrong((id *)&self->_settingMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("settingMetadata"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("numericValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("boundedValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = INBoundedSettingValueWithString(v15);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("binaryValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = INBinarySettingValueWithString(v17);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("labeledValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSettingMetadata:numericValue:boundedValue:binaryValue:labeledValue:", v11, v14, v16, v18, v19);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
