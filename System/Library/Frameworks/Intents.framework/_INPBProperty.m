@implementation _INPBProperty

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (void)setRole:(id)a3
{
  NSString *v4;
  NSString *role;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  role = self->_role;
  self->_role = v4;

}

- (BOOL)hasRole
{
  return self->_role != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPropertyReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_INPBProperty payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBProperty payload](self, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBProperty role](self, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();

}

- (_INPBProperty)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBProperty *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBProperty *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBProperty *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBProperty initWithData:](self, "initWithData:", v6);

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
  -[_INPBProperty data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBProperty *v5;
  id v6;
  void *v7;

  v5 = -[_INPBProperty init](+[_INPBProperty allocWithZone:](_INPBProperty, "allocWithZone:"), "init");
  v6 = -[_INPBIntentSlotValue copyWithZone:](self->_payload, "copyWithZone:", a3);
  -[_INPBProperty setPayload:](v5, "setPayload:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_role, "copyWithZone:", a3);
  -[_INPBProperty setRole:](v5, "setRole:", v7);

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
  -[_INPBProperty payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBProperty payload](self, "payload");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBProperty payload](self, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBProperty role](self, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBProperty role](self, "role");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBProperty role](self, "role");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "role");
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
  unint64_t v3;

  v3 = -[_INPBIntentSlotValue hash](self->_payload, "hash");
  return -[NSString hash](self->_role, "hash") ^ v3;
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
  -[_INPBProperty payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("payload"));

  if (self->_role)
  {
    -[_INPBProperty role](self, "role");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("role"));

  }
  return v3;
}

- (_INPBIntentSlotValue)payload
{
  return self->_payload;
}

- (NSString)role
{
  return self->_role;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
