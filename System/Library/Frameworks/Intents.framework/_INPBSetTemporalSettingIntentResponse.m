@implementation _INPBSetTemporalSettingIntentResponse

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
  objc_storeStrong((id *)&self->_oldValue, a3);
}

- (BOOL)hasOldValue
{
  return self->_oldValue != 0;
}

- (void)setUpdatedValue:(id)a3
{
  objc_storeStrong((id *)&self->_updatedValue, a3);
}

- (BOOL)hasUpdatedValue
{
  return self->_updatedValue != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetTemporalSettingIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_INPBSetTemporalSettingIntentResponse errorDetail](self, "errorDetail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBSetTemporalSettingIntentResponse oldValue](self, "oldValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBSetTemporalSettingIntentResponse oldValue](self, "oldValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetTemporalSettingIntentResponse updatedValue](self, "updatedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBSetTemporalSettingIntentResponse updatedValue](self, "updatedValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBSetTemporalSettingIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetTemporalSettingIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetTemporalSettingIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetTemporalSettingIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetTemporalSettingIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetTemporalSettingIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetTemporalSettingIntentResponse *v5;
  void *v6;
  id v7;
  id v8;

  v5 = -[_INPBSetTemporalSettingIntentResponse init](+[_INPBSetTemporalSettingIntentResponse allocWithZone:](_INPBSetTemporalSettingIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_errorDetail, "copyWithZone:", a3);
  -[_INPBSetTemporalSettingIntentResponse setErrorDetail:](v5, "setErrorDetail:", v6);

  v7 = -[_INPBDateTimeRange copyWithZone:](self->_oldValue, "copyWithZone:", a3);
  -[_INPBSetTemporalSettingIntentResponse setOldValue:](v5, "setOldValue:", v7);

  v8 = -[_INPBDateTimeRange copyWithZone:](self->_updatedValue, "copyWithZone:", a3);
  -[_INPBSetTemporalSettingIntentResponse setUpdatedValue:](v5, "setUpdatedValue:", v8);

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
  -[_INPBSetTemporalSettingIntentResponse errorDetail](self, "errorDetail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorDetail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBSetTemporalSettingIntentResponse errorDetail](self, "errorDetail");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSetTemporalSettingIntentResponse errorDetail](self, "errorDetail");
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
  -[_INPBSetTemporalSettingIntentResponse oldValue](self, "oldValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oldValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBSetTemporalSettingIntentResponse oldValue](self, "oldValue");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSetTemporalSettingIntentResponse oldValue](self, "oldValue");
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
  -[_INPBSetTemporalSettingIntentResponse updatedValue](self, "updatedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSetTemporalSettingIntentResponse updatedValue](self, "updatedValue");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBSetTemporalSettingIntentResponse updatedValue](self, "updatedValue");
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
  unint64_t v4;

  v3 = -[NSString hash](self->_errorDetail, "hash");
  v4 = -[_INPBDateTimeRange hash](self->_oldValue, "hash") ^ v3;
  return v4 ^ -[_INPBDateTimeRange hash](self->_updatedValue, "hash");
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
    -[_INPBSetTemporalSettingIntentResponse errorDetail](self, "errorDetail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorDetail"));

  }
  -[_INPBSetTemporalSettingIntentResponse oldValue](self, "oldValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("oldValue"));

  -[_INPBSetTemporalSettingIntentResponse updatedValue](self, "updatedValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("updatedValue"));

  return v3;
}

- (NSString)errorDetail
{
  return self->_errorDetail;
}

- (_INPBDateTimeRange)oldValue
{
  return self->_oldValue;
}

- (_INPBDateTimeRange)updatedValue
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
