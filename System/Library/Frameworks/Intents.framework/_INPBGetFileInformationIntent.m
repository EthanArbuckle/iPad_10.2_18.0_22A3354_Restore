@implementation _INPBGetFileInformationIntent

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
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_entityType = a3;
  }
}

- (BOOL)hasEntityType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEntityType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)entityTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E228E338[a3];
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

- (void)setPropertyName:(int)a3
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
    self->_propertyName = a3;
  }
}

- (BOOL)hasPropertyName
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPropertyName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)propertyNameAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E228E358[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPropertyName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIZE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTENTS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTHOR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CREATION_TIME")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCESSED_TIME")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODIFIED_TIME")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRINTED_TIME")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SENDER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECIPIENT")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAGE_COUNT")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAG")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FILE_TYPE")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setQualifier:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_qualifier = a3;
  }
}

- (BOOL)hasQualifier
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasQualifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)qualifierAsString:(int)a3
{
  if (a3 < 5)
    return off_1E228E3B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsQualifier:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EQUAL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AT_LEAST")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AT_MOST")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MIN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAX")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetFileInformationIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_INPBGetFileInformationIntent entityName](self, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBGetFileInformationIntent entityName](self, "entityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBGetFileInformationIntent hasEntityType](self, "hasEntityType"))
    PBDataWriterWriteInt32Field();
  -[_INPBGetFileInformationIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBGetFileInformationIntent intentMetadata](self, "intentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBGetFileInformationIntent hasPropertyName](self, "hasPropertyName"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBGetFileInformationIntent hasQualifier](self, "hasQualifier"))
    PBDataWriterWriteInt32Field();

}

- (_INPBGetFileInformationIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBGetFileInformationIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBGetFileInformationIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBGetFileInformationIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBGetFileInformationIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBGetFileInformationIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBGetFileInformationIntent *v5;
  id v6;
  id v7;

  v5 = -[_INPBGetFileInformationIntent init](+[_INPBGetFileInformationIntent allocWithZone:](_INPBGetFileInformationIntent, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_entityName, "copyWithZone:", a3);
  -[_INPBGetFileInformationIntent setEntityName:](v5, "setEntityName:", v6);

  if (-[_INPBGetFileInformationIntent hasEntityType](self, "hasEntityType"))
    -[_INPBGetFileInformationIntent setEntityType:](v5, "setEntityType:", -[_INPBGetFileInformationIntent entityType](self, "entityType"));
  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBGetFileInformationIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  if (-[_INPBGetFileInformationIntent hasPropertyName](self, "hasPropertyName"))
    -[_INPBGetFileInformationIntent setPropertyName:](v5, "setPropertyName:", -[_INPBGetFileInformationIntent propertyName](self, "propertyName"));
  if (-[_INPBGetFileInformationIntent hasQualifier](self, "hasQualifier"))
    -[_INPBGetFileInformationIntent setQualifier:](v5, "setQualifier:", -[_INPBGetFileInformationIntent qualifier](self, "qualifier"));
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
  int entityType;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  int v21;
  int propertyName;
  int v23;
  int qualifier;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[_INPBGetFileInformationIntent entityName](self, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_15;
  -[_INPBGetFileInformationIntent entityName](self, "entityName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBGetFileInformationIntent entityName](self, "entityName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_16;
  }
  else
  {

  }
  v12 = -[_INPBGetFileInformationIntent hasEntityType](self, "hasEntityType");
  if (v12 != objc_msgSend(v4, "hasEntityType"))
    goto LABEL_16;
  if (-[_INPBGetFileInformationIntent hasEntityType](self, "hasEntityType"))
  {
    if (objc_msgSend(v4, "hasEntityType"))
    {
      entityType = self->_entityType;
      if (entityType != objc_msgSend(v4, "entityType"))
        goto LABEL_16;
    }
  }
  -[_INPBGetFileInformationIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_15:

    goto LABEL_16;
  }
  -[_INPBGetFileInformationIntent intentMetadata](self, "intentMetadata");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBGetFileInformationIntent intentMetadata](self, "intentMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_16;
  }
  else
  {

  }
  v21 = -[_INPBGetFileInformationIntent hasPropertyName](self, "hasPropertyName");
  if (v21 == objc_msgSend(v4, "hasPropertyName"))
  {
    if (!-[_INPBGetFileInformationIntent hasPropertyName](self, "hasPropertyName")
      || !objc_msgSend(v4, "hasPropertyName")
      || (propertyName = self->_propertyName, propertyName == objc_msgSend(v4, "propertyName")))
    {
      v23 = -[_INPBGetFileInformationIntent hasQualifier](self, "hasQualifier");
      if (v23 == objc_msgSend(v4, "hasQualifier"))
      {
        if (!-[_INPBGetFileInformationIntent hasQualifier](self, "hasQualifier")
          || !objc_msgSend(v4, "hasQualifier")
          || (qualifier = self->_qualifier, qualifier == objc_msgSend(v4, "qualifier")))
        {
          v19 = 1;
          goto LABEL_17;
        }
      }
    }
  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[_INPBString hash](self->_entityName, "hash");
  if (-[_INPBGetFileInformationIntent hasEntityType](self, "hasEntityType"))
    v4 = 2654435761 * self->_entityType;
  else
    v4 = 0;
  v5 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBGetFileInformationIntent hasPropertyName](self, "hasPropertyName"))
    v6 = 2654435761 * self->_propertyName;
  else
    v6 = 0;
  if (-[_INPBGetFileInformationIntent hasQualifier](self, "hasQualifier"))
    v7 = 2654435761 * self->_qualifier;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBGetFileInformationIntent entityName](self, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entityName"));

  if (-[_INPBGetFileInformationIntent hasEntityType](self, "hasEntityType"))
  {
    v6 = -[_INPBGetFileInformationIntent entityType](self, "entityType");
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E228E338[v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("entityType"));

  }
  -[_INPBGetFileInformationIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intentMetadata"));

  if (-[_INPBGetFileInformationIntent hasPropertyName](self, "hasPropertyName"))
  {
    v10 = -[_INPBGetFileInformationIntent propertyName](self, "propertyName");
    if (v10 >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E228E358[v10];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("propertyName"));

  }
  if (-[_INPBGetFileInformationIntent hasQualifier](self, "hasQualifier"))
  {
    v12 = -[_INPBGetFileInformationIntent qualifier](self, "qualifier");
    if (v12 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E228E3B8[v12];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("qualifier"));

  }
  return v3;
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

- (int)propertyName
{
  return self->_propertyName;
}

- (int)qualifier
{
  return self->_qualifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
