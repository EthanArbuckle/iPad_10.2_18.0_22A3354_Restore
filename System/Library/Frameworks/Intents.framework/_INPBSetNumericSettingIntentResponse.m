@implementation _INPBSetNumericSettingIntentResponse

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

- (void)setMaxValue:(id)a3
{
  objc_storeStrong((id *)&self->_maxValue, a3);
}

- (BOOL)hasMaxValue
{
  return self->_maxValue != 0;
}

- (void)setMinValue:(id)a3
{
  objc_storeStrong((id *)&self->_minValue, a3);
}

- (BOOL)hasMinValue
{
  return self->_minValue != 0;
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
  return _INPBSetNumericSettingIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[_INPBSetNumericSettingIntentResponse errorDetail](self, "errorDetail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBSetNumericSettingIntentResponse maxValue](self, "maxValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBSetNumericSettingIntentResponse maxValue](self, "maxValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetNumericSettingIntentResponse minValue](self, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBSetNumericSettingIntentResponse minValue](self, "minValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetNumericSettingIntentResponse oldValue](self, "oldValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBSetNumericSettingIntentResponse oldValue](self, "oldValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetNumericSettingIntentResponse updatedValue](self, "updatedValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBSetNumericSettingIntentResponse updatedValue](self, "updatedValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBSetNumericSettingIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetNumericSettingIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetNumericSettingIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetNumericSettingIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetNumericSettingIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetNumericSettingIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetNumericSettingIntentResponse *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = -[_INPBSetNumericSettingIntentResponse init](+[_INPBSetNumericSettingIntentResponse allocWithZone:](_INPBSetNumericSettingIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_errorDetail, "copyWithZone:", a3);
  -[_INPBSetNumericSettingIntentResponse setErrorDetail:](v5, "setErrorDetail:", v6);

  v7 = -[_INPBNumericSettingValue copyWithZone:](self->_maxValue, "copyWithZone:", a3);
  -[_INPBSetNumericSettingIntentResponse setMaxValue:](v5, "setMaxValue:", v7);

  v8 = -[_INPBNumericSettingValue copyWithZone:](self->_minValue, "copyWithZone:", a3);
  -[_INPBSetNumericSettingIntentResponse setMinValue:](v5, "setMinValue:", v8);

  v9 = -[_INPBNumericSettingValue copyWithZone:](self->_oldValue, "copyWithZone:", a3);
  -[_INPBSetNumericSettingIntentResponse setOldValue:](v5, "setOldValue:", v9);

  v10 = -[_INPBNumericSettingValue copyWithZone:](self->_updatedValue, "copyWithZone:", a3);
  -[_INPBSetNumericSettingIntentResponse setUpdatedValue:](v5, "setUpdatedValue:", v10);

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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_INPBSetNumericSettingIntentResponse errorDetail](self, "errorDetail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorDetail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBSetNumericSettingIntentResponse errorDetail](self, "errorDetail");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSetNumericSettingIntentResponse errorDetail](self, "errorDetail");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorDetail");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBSetNumericSettingIntentResponse maxValue](self, "maxValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBSetNumericSettingIntentResponse maxValue](self, "maxValue");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSetNumericSettingIntentResponse maxValue](self, "maxValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maxValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBSetNumericSettingIntentResponse minValue](self, "minValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBSetNumericSettingIntentResponse minValue](self, "minValue");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBSetNumericSettingIntentResponse minValue](self, "minValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBSetNumericSettingIntentResponse oldValue](self, "oldValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oldValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBSetNumericSettingIntentResponse oldValue](self, "oldValue");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBSetNumericSettingIntentResponse oldValue](self, "oldValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oldValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBSetNumericSettingIntentResponse updatedValue](self, "updatedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSetNumericSettingIntentResponse updatedValue](self, "updatedValue");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_INPBSetNumericSettingIntentResponse updatedValue](self, "updatedValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updatedValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_errorDetail, "hash");
  v4 = -[_INPBNumericSettingValue hash](self->_maxValue, "hash") ^ v3;
  v5 = -[_INPBNumericSettingValue hash](self->_minValue, "hash");
  v6 = v4 ^ v5 ^ -[_INPBNumericSettingValue hash](self->_oldValue, "hash");
  return v6 ^ -[_INPBNumericSettingValue hash](self->_updatedValue, "hash");
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_errorDetail)
  {
    -[_INPBSetNumericSettingIntentResponse errorDetail](self, "errorDetail");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorDetail"));

  }
  -[_INPBSetNumericSettingIntentResponse maxValue](self, "maxValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("maxValue"));

  -[_INPBSetNumericSettingIntentResponse minValue](self, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("minValue"));

  -[_INPBSetNumericSettingIntentResponse oldValue](self, "oldValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("oldValue"));

  -[_INPBSetNumericSettingIntentResponse updatedValue](self, "updatedValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("updatedValue"));

  return v3;
}

- (NSString)errorDetail
{
  return self->_errorDetail;
}

- (_INPBNumericSettingValue)maxValue
{
  return self->_maxValue;
}

- (_INPBNumericSettingValue)minValue
{
  return self->_minValue;
}

- (_INPBNumericSettingValue)oldValue
{
  return self->_oldValue;
}

- (_INPBNumericSettingValue)updatedValue
{
  return self->_updatedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedValue, 0);
  objc_storeStrong((id *)&self->_oldValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_errorDetail, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
