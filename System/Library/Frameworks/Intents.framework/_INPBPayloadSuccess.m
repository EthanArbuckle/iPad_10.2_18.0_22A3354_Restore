@implementation _INPBPayloadSuccess

- (void)setResolvedKeyPath:(id)a3
{
  NSString *v4;
  NSString *resolvedKeyPath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  resolvedKeyPath = self->_resolvedKeyPath;
  self->_resolvedKeyPath = v4;

}

- (BOOL)hasResolvedKeyPath
{
  return self->_resolvedKeyPath != 0;
}

- (void)setResolvedValue:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedValue, a3);
}

- (BOOL)hasResolvedValue
{
  return self->_resolvedValue != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPayloadSuccessReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_INPBPayloadSuccess resolvedKeyPath](self, "resolvedKeyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBPayloadSuccess resolvedValue](self, "resolvedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBPayloadSuccess resolvedValue](self, "resolvedValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBPayloadSuccess)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPayloadSuccess *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPayloadSuccess *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPayloadSuccess *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPayloadSuccess initWithData:](self, "initWithData:", v6);

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
  -[_INPBPayloadSuccess data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPayloadSuccess *v5;
  void *v6;
  id v7;

  v5 = -[_INPBPayloadSuccess init](+[_INPBPayloadSuccess allocWithZone:](_INPBPayloadSuccess, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_resolvedKeyPath, "copyWithZone:", a3);
  -[_INPBPayloadSuccess setResolvedKeyPath:](v5, "setResolvedKeyPath:", v6);

  v7 = -[_INPBIntentSlotValue copyWithZone:](self->_resolvedValue, "copyWithZone:", a3);
  -[_INPBPayloadSuccess setResolvedValue:](v5, "setResolvedValue:", v7);

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBPayloadSuccess resolvedKeyPath](self, "resolvedKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBPayloadSuccess resolvedKeyPath](self, "resolvedKeyPath");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBPayloadSuccess resolvedKeyPath](self, "resolvedKeyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolvedKeyPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBPayloadSuccess resolvedValue](self, "resolvedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBPayloadSuccess resolvedValue](self, "resolvedValue");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBPayloadSuccess resolvedValue](self, "resolvedValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolvedValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_resolvedKeyPath, "hash");
  return -[_INPBIntentSlotValue hash](self->_resolvedValue, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_resolvedKeyPath)
  {
    -[_INPBPayloadSuccess resolvedKeyPath](self, "resolvedKeyPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("resolvedKeyPath"));

  }
  -[_INPBPayloadSuccess resolvedValue](self, "resolvedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("resolvedValue"));

  return v3;
}

- (NSString)resolvedKeyPath
{
  return self->_resolvedKeyPath;
}

- (_INPBIntentSlotValue)resolvedValue
{
  return self->_resolvedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedValue, 0);
  objc_storeStrong((id *)&self->_resolvedKeyPath, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
