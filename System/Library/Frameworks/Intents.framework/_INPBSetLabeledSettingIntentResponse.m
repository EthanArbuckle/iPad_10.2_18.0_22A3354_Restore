@implementation _INPBSetLabeledSettingIntentResponse

- (void)setErrorDetail:(id)a3
{
  NSString *v4;
  NSString *errorDetail;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  errorDetail = self->_errorDetail;
  self->_errorDetail = v4;

}

- (BOOL)hasErrorDetail
{
  return self->_errorDetail != 0;
}

- (void)setOldValue:(id)a3
{
  NSString *v4;
  NSString *oldValue;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  oldValue = self->_oldValue;
  self->_oldValue = v4;

}

- (BOOL)hasOldValue
{
  return self->_oldValue != 0;
}

- (void)setUpdatedValue:(id)a3
{
  NSString *v4;
  NSString *updatedValue;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  updatedValue = self->_updatedValue;
  self->_updatedValue = v4;

}

- (BOOL)hasUpdatedValue
{
  return self->_updatedValue != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetLabeledSettingIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_INPBSetLabeledSettingIntentResponse errorDetail](self, "errorDetail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBSetLabeledSettingIntentResponse oldValue](self, "oldValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBSetLabeledSettingIntentResponse updatedValue](self, "updatedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }

}

- (_INPBSetLabeledSettingIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetLabeledSettingIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetLabeledSettingIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetLabeledSettingIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetLabeledSettingIntentResponse initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBSetLabeledSettingIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetLabeledSettingIntentResponse *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[_INPBSetLabeledSettingIntentResponse init](+[_INPBSetLabeledSettingIntentResponse allocWithZone:](_INPBSetLabeledSettingIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_errorDetail, "copyWithZone:", a3);
  -[_INPBSetLabeledSettingIntentResponse setErrorDetail:](v5, "setErrorDetail:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_oldValue, "copyWithZone:", a3);
  -[_INPBSetLabeledSettingIntentResponse setOldValue:](v5, "setOldValue:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_updatedValue, "copyWithZone:", a3);
  -[_INPBSetLabeledSettingIntentResponse setUpdatedValue:](v5, "setUpdatedValue:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBSetLabeledSettingIntentResponse errorDetail](self, "errorDetail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorDetail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBSetLabeledSettingIntentResponse errorDetail](self, "errorDetail");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSetLabeledSettingIntentResponse errorDetail](self, "errorDetail");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorDetail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBSetLabeledSettingIntentResponse oldValue](self, "oldValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oldValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBSetLabeledSettingIntentResponse oldValue](self, "oldValue");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSetLabeledSettingIntentResponse oldValue](self, "oldValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oldValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBSetLabeledSettingIntentResponse updatedValue](self, "updatedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSetLabeledSettingIntentResponse updatedValue](self, "updatedValue");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBSetLabeledSettingIntentResponse updatedValue](self, "updatedValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updatedValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_errorDetail, "hash");
  v4 = -[NSString hash](self->_oldValue, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_updatedValue, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_errorDetail)
  {
    -[_INPBSetLabeledSettingIntentResponse errorDetail](self, "errorDetail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorDetail"));

  }
  if (self->_oldValue)
  {
    -[_INPBSetLabeledSettingIntentResponse oldValue](self, "oldValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("oldValue"));

  }
  if (self->_updatedValue)
  {
    -[_INPBSetLabeledSettingIntentResponse updatedValue](self, "updatedValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("updatedValue"));

  }
  return v3;
}

- (NSString)errorDetail
{
  return self->_errorDetail;
}

- (NSString)oldValue
{
  return self->_oldValue;
}

- (NSString)updatedValue
{
  return self->_updatedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedValue, 0);
  objc_storeStrong((id *)&self->_oldValue, 0);
  objc_storeStrong((id *)&self->_errorDetail, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
