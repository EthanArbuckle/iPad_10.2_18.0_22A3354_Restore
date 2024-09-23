@implementation _INPBCreateFileIntent

- (void)setDestinationName:(id)a3
{
  objc_storeStrong((id *)&self->_destinationName, a3);
}

- (BOOL)hasDestinationName
{
  return self->_destinationName != 0;
}

- (void)setDestinationType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_destinationType = a3;
  }
}

- (BOOL)hasDestinationType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDestinationType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)destinationTypeAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_1E228CD68 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDestinationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FILE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOLDER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REFERENCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("URL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setEntityName:(id)a3
{
  objc_storeStrong((id *)&self->_entityName, a3);
}

- (BOOL)hasEntityName
{
  return self->_entityName != 0;
}

- (void)setEntityType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_entityType = a3;
  }
}

- (BOOL)hasEntityType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEntityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)entityTypeAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_1E228CD68 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEntityType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FILE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOLDER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REFERENCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("URL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateFileIntentReadFrom(self, (uint64_t)a3);
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
  id v11;

  v11 = a3;
  -[_INPBCreateFileIntent destinationName](self, "destinationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBCreateFileIntent destinationName](self, "destinationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBCreateFileIntent hasDestinationType](self, "hasDestinationType"))
    PBDataWriterWriteInt32Field();
  -[_INPBCreateFileIntent entityName](self, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBCreateFileIntent entityName](self, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBCreateFileIntent hasEntityType](self, "hasEntityType"))
    PBDataWriterWriteInt32Field();
  -[_INPBCreateFileIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[_INPBCreateFileIntent intentMetadata](self, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }

}

- (_INPBCreateFileIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCreateFileIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCreateFileIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCreateFileIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCreateFileIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBCreateFileIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCreateFileIntent *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBCreateFileIntent init](+[_INPBCreateFileIntent allocWithZone:](_INPBCreateFileIntent, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_destinationName, "copyWithZone:", a3);
  -[_INPBCreateFileIntent setDestinationName:](v5, "setDestinationName:", v6);

  if (-[_INPBCreateFileIntent hasDestinationType](self, "hasDestinationType"))
    -[_INPBCreateFileIntent setDestinationType:](v5, "setDestinationType:", -[_INPBCreateFileIntent destinationType](self, "destinationType"));
  v7 = -[_INPBString copyWithZone:](self->_entityName, "copyWithZone:", a3);
  -[_INPBCreateFileIntent setEntityName:](v5, "setEntityName:", v7);

  if (-[_INPBCreateFileIntent hasEntityType](self, "hasEntityType"))
    -[_INPBCreateFileIntent setEntityType:](v5, "setEntityType:", -[_INPBCreateFileIntent entityType](self, "entityType"));
  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBCreateFileIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

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
  int v12;
  int destinationType;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int entityType;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[_INPBCreateFileIntent destinationName](self, "destinationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[_INPBCreateFileIntent destinationName](self, "destinationName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBCreateFileIntent destinationName](self, "destinationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destinationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_25;
  }
  else
  {

  }
  v12 = -[_INPBCreateFileIntent hasDestinationType](self, "hasDestinationType");
  if (v12 != objc_msgSend(v4, "hasDestinationType"))
    goto LABEL_25;
  if (-[_INPBCreateFileIntent hasDestinationType](self, "hasDestinationType"))
  {
    if (objc_msgSend(v4, "hasDestinationType"))
    {
      destinationType = self->_destinationType;
      if (destinationType != objc_msgSend(v4, "destinationType"))
        goto LABEL_25;
    }
  }
  -[_INPBCreateFileIntent entityName](self, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_24;
  -[_INPBCreateFileIntent entityName](self, "entityName");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBCreateFileIntent entityName](self, "entityName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_25;
  }
  else
  {

  }
  v19 = -[_INPBCreateFileIntent hasEntityType](self, "hasEntityType");
  if (v19 != objc_msgSend(v4, "hasEntityType"))
    goto LABEL_25;
  if (-[_INPBCreateFileIntent hasEntityType](self, "hasEntityType"))
  {
    if (objc_msgSend(v4, "hasEntityType"))
    {
      entityType = self->_entityType;
      if (entityType != objc_msgSend(v4, "entityType"))
        goto LABEL_25;
    }
  }
  -[_INPBCreateFileIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBCreateFileIntent intentMetadata](self, "intentMetadata");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {

LABEL_28:
      v26 = 1;
      goto LABEL_26;
    }
    v22 = (void *)v21;
    -[_INPBCreateFileIntent intentMetadata](self, "intentMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if ((v25 & 1) != 0)
      goto LABEL_28;
  }
  else
  {
LABEL_24:

  }
LABEL_25:
  v26 = 0;
LABEL_26:

  return v26;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[_INPBString hash](self->_destinationName, "hash");
  if (-[_INPBCreateFileIntent hasDestinationType](self, "hasDestinationType"))
    v4 = 2654435761 * self->_destinationType;
  else
    v4 = 0;
  v5 = -[_INPBString hash](self->_entityName, "hash");
  if (-[_INPBCreateFileIntent hasEntityType](self, "hasEntityType"))
    v6 = 2654435761 * self->_entityType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBCreateFileIntent destinationName](self, "destinationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("destinationName"));

  if (-[_INPBCreateFileIntent hasDestinationType](self, "hasDestinationType"))
  {
    v6 = -[_INPBCreateFileIntent destinationType](self, "destinationType");
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E228CD68 + v6);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("destinationType"));

  }
  -[_INPBCreateFileIntent entityName](self, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entityName"));

  if (-[_INPBCreateFileIntent hasEntityType](self, "hasEntityType"))
  {
    v10 = -[_INPBCreateFileIntent entityType](self, "entityType");
    if (v10 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = *(&off_1E228CD68 + v10);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("entityType"));

  }
  -[_INPBCreateFileIntent intentMetadata](self, "intentMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("intentMetadata"));

  return v3;
}

- (_INPBString)destinationName
{
  return self->_destinationName;
}

- (int)destinationType
{
  return self->_destinationType;
}

- (_INPBString)entityName
{
  return self->_entityName;
}

- (int)entityType
{
  return self->_entityType;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
