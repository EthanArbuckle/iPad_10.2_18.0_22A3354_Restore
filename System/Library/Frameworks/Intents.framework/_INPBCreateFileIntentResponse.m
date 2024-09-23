@implementation _INPBCreateFileIntentResponse

- (void)setDestinationName:(id)a3
{
  objc_storeStrong((id *)&self->_destinationName, a3);
}

- (BOOL)hasDestinationName
{
  return self->_destinationName != 0;
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
    return off_1E228D6D8[a3];
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

- (void)setOverwrite:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_overwrite = a3;
}

- (BOOL)hasOverwrite
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasOverwrite:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_success = a3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateFileIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_INPBCreateFileIntentResponse destinationName](self, "destinationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBCreateFileIntentResponse destinationName](self, "destinationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCreateFileIntentResponse entityName](self, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBCreateFileIntentResponse entityName](self, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBCreateFileIntentResponse hasEntityType](self, "hasEntityType"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBCreateFileIntentResponse hasOverwrite](self, "hasOverwrite"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBCreateFileIntentResponse hasSuccess](self, "hasSuccess"))
    PBDataWriterWriteBOOLField();

}

- (_INPBCreateFileIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCreateFileIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCreateFileIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCreateFileIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCreateFileIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBCreateFileIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCreateFileIntentResponse *v5;
  id v6;
  id v7;

  v5 = -[_INPBCreateFileIntentResponse init](+[_INPBCreateFileIntentResponse allocWithZone:](_INPBCreateFileIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_destinationName, "copyWithZone:", a3);
  -[_INPBCreateFileIntentResponse setDestinationName:](v5, "setDestinationName:", v6);

  v7 = -[_INPBString copyWithZone:](self->_entityName, "copyWithZone:", a3);
  -[_INPBCreateFileIntentResponse setEntityName:](v5, "setEntityName:", v7);

  if (-[_INPBCreateFileIntentResponse hasEntityType](self, "hasEntityType"))
    -[_INPBCreateFileIntentResponse setEntityType:](v5, "setEntityType:", -[_INPBCreateFileIntentResponse entityType](self, "entityType"));
  if (-[_INPBCreateFileIntentResponse hasOverwrite](self, "hasOverwrite"))
    -[_INPBCreateFileIntentResponse setOverwrite:](v5, "setOverwrite:", -[_INPBCreateFileIntentResponse overwrite](self, "overwrite"));
  if (-[_INPBCreateFileIntentResponse hasSuccess](self, "hasSuccess"))
    -[_INPBCreateFileIntentResponse setSuccess:](v5, "setSuccess:", -[_INPBCreateFileIntentResponse success](self, "success"));
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
  BOOL v17;
  int v19;
  int entityType;
  int v21;
  int overwrite;
  int v23;
  int success;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBCreateFileIntentResponse destinationName](self, "destinationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBCreateFileIntentResponse destinationName](self, "destinationName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBCreateFileIntentResponse destinationName](self, "destinationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destinationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBCreateFileIntentResponse entityName](self, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_INPBCreateFileIntentResponse entityName](self, "entityName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBCreateFileIntentResponse entityName](self, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = -[_INPBCreateFileIntentResponse hasEntityType](self, "hasEntityType");
  if (v19 == objc_msgSend(v4, "hasEntityType"))
  {
    if (!-[_INPBCreateFileIntentResponse hasEntityType](self, "hasEntityType")
      || !objc_msgSend(v4, "hasEntityType")
      || (entityType = self->_entityType, entityType == objc_msgSend(v4, "entityType")))
    {
      v21 = -[_INPBCreateFileIntentResponse hasOverwrite](self, "hasOverwrite");
      if (v21 == objc_msgSend(v4, "hasOverwrite"))
      {
        if (!-[_INPBCreateFileIntentResponse hasOverwrite](self, "hasOverwrite")
          || !objc_msgSend(v4, "hasOverwrite")
          || (overwrite = self->_overwrite, overwrite == objc_msgSend(v4, "overwrite")))
        {
          v23 = -[_INPBCreateFileIntentResponse hasSuccess](self, "hasSuccess");
          if (v23 == objc_msgSend(v4, "hasSuccess"))
          {
            if (!-[_INPBCreateFileIntentResponse hasSuccess](self, "hasSuccess")
              || !objc_msgSend(v4, "hasSuccess")
              || (success = self->_success, success == objc_msgSend(v4, "success")))
            {
              v17 = 1;
              goto LABEL_13;
            }
          }
        }
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[_INPBString hash](self->_destinationName, "hash");
  v4 = -[_INPBString hash](self->_entityName, "hash");
  if (-[_INPBCreateFileIntentResponse hasEntityType](self, "hasEntityType"))
    v5 = 2654435761 * self->_entityType;
  else
    v5 = 0;
  if (-[_INPBCreateFileIntentResponse hasOverwrite](self, "hasOverwrite"))
    v6 = 2654435761 * self->_overwrite;
  else
    v6 = 0;
  if (-[_INPBCreateFileIntentResponse hasSuccess](self, "hasSuccess"))
    v7 = 2654435761 * self->_success;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBCreateFileIntentResponse destinationName](self, "destinationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("destinationName"));

  -[_INPBCreateFileIntentResponse entityName](self, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("entityName"));

  if (-[_INPBCreateFileIntentResponse hasEntityType](self, "hasEntityType"))
  {
    v8 = -[_INPBCreateFileIntentResponse entityType](self, "entityType");
    if (v8 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E228D6D8[v8];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entityType"));

  }
  if (-[_INPBCreateFileIntentResponse hasOverwrite](self, "hasOverwrite"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBCreateFileIntentResponse overwrite](self, "overwrite"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("overwrite"));

  }
  if (-[_INPBCreateFileIntentResponse hasSuccess](self, "hasSuccess"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBCreateFileIntentResponse success](self, "success"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("success"));

  }
  return v3;
}

- (_INPBString)destinationName
{
  return self->_destinationName;
}

- (_INPBString)entityName
{
  return self->_entityName;
}

- (int)entityType
{
  return self->_entityType;
}

- (BOOL)overwrite
{
  return self->_overwrite;
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
