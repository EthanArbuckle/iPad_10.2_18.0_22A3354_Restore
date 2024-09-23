@implementation _INPBSetDefrosterSettingsInCarIntent

- (void)setCarName:(id)a3
{
  objc_storeStrong((id *)&self->_carName, a3);
}

- (BOOL)hasCarName
{
  return self->_carName != 0;
}

- (void)setDefroster:(int)a3
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
    self->_defroster = a3;
  }
}

- (BOOL)hasDefroster
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDefroster:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)defrosterAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E228C010[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDefroster:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRONT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ALL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setEnable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_enable = a3;
}

- (BOOL)hasEnable
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEnable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
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
  return _INPBSetDefrosterSettingsInCarIntentReadFrom(self, (uint64_t)a3);
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
  -[_INPBSetDefrosterSettingsInCarIntent carName](self, "carName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSetDefrosterSettingsInCarIntent carName](self, "carName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSetDefrosterSettingsInCarIntent hasDefroster](self, "hasDefroster"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBSetDefrosterSettingsInCarIntent hasEnable](self, "hasEnable"))
    PBDataWriterWriteBOOLField();
  -[_INPBSetDefrosterSettingsInCarIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[_INPBSetDefrosterSettingsInCarIntent intentMetadata](self, "intentMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (_INPBSetDefrosterSettingsInCarIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetDefrosterSettingsInCarIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetDefrosterSettingsInCarIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetDefrosterSettingsInCarIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetDefrosterSettingsInCarIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetDefrosterSettingsInCarIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetDefrosterSettingsInCarIntent *v5;
  id v6;
  id v7;

  v5 = -[_INPBSetDefrosterSettingsInCarIntent init](+[_INPBSetDefrosterSettingsInCarIntent allocWithZone:](_INPBSetDefrosterSettingsInCarIntent, "allocWithZone:"), "init");
  v6 = -[_INPBDataString copyWithZone:](self->_carName, "copyWithZone:", a3);
  -[_INPBSetDefrosterSettingsInCarIntent setCarName:](v5, "setCarName:", v6);

  if (-[_INPBSetDefrosterSettingsInCarIntent hasDefroster](self, "hasDefroster"))
    -[_INPBSetDefrosterSettingsInCarIntent setDefroster:](v5, "setDefroster:", -[_INPBSetDefrosterSettingsInCarIntent defroster](self, "defroster"));
  if (-[_INPBSetDefrosterSettingsInCarIntent hasEnable](self, "hasEnable"))
    -[_INPBSetDefrosterSettingsInCarIntent setEnable:](v5, "setEnable:", -[_INPBSetDefrosterSettingsInCarIntent enable](self, "enable"));
  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSetDefrosterSettingsInCarIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

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
  int defroster;
  int v14;
  int enable;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  BOOL v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[_INPBSetDefrosterSettingsInCarIntent carName](self, "carName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_19;
  -[_INPBSetDefrosterSettingsInCarIntent carName](self, "carName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSetDefrosterSettingsInCarIntent carName](self, "carName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_20;
  }
  else
  {

  }
  v12 = -[_INPBSetDefrosterSettingsInCarIntent hasDefroster](self, "hasDefroster");
  if (v12 != objc_msgSend(v4, "hasDefroster"))
    goto LABEL_20;
  if (-[_INPBSetDefrosterSettingsInCarIntent hasDefroster](self, "hasDefroster"))
  {
    if (objc_msgSend(v4, "hasDefroster"))
    {
      defroster = self->_defroster;
      if (defroster != objc_msgSend(v4, "defroster"))
        goto LABEL_20;
    }
  }
  v14 = -[_INPBSetDefrosterSettingsInCarIntent hasEnable](self, "hasEnable");
  if (v14 != objc_msgSend(v4, "hasEnable"))
    goto LABEL_20;
  if (-[_INPBSetDefrosterSettingsInCarIntent hasEnable](self, "hasEnable"))
  {
    if (objc_msgSend(v4, "hasEnable"))
    {
      enable = self->_enable;
      if (enable != objc_msgSend(v4, "enable"))
        goto LABEL_20;
    }
  }
  -[_INPBSetDefrosterSettingsInCarIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSetDefrosterSettingsInCarIntent intentMetadata](self, "intentMetadata");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {

LABEL_23:
      v21 = 1;
      goto LABEL_21;
    }
    v17 = (void *)v16;
    -[_INPBSetDefrosterSettingsInCarIntent intentMetadata](self, "intentMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if ((v20 & 1) != 0)
      goto LABEL_23;
  }
  else
  {
LABEL_19:

  }
LABEL_20:
  v21 = 0;
LABEL_21:

  return v21;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[_INPBDataString hash](self->_carName, "hash");
  if (-[_INPBSetDefrosterSettingsInCarIntent hasDefroster](self, "hasDefroster"))
    v4 = 2654435761 * self->_defroster;
  else
    v4 = 0;
  if (-[_INPBSetDefrosterSettingsInCarIntent hasEnable](self, "hasEnable"))
    v5 = 2654435761 * self->_enable;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
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
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSetDefrosterSettingsInCarIntent carName](self, "carName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("carName"));

  if (-[_INPBSetDefrosterSettingsInCarIntent hasDefroster](self, "hasDefroster"))
  {
    v6 = -[_INPBSetDefrosterSettingsInCarIntent defroster](self, "defroster");
    if ((v6 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E228C010[(v6 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("defroster"));

  }
  if (-[_INPBSetDefrosterSettingsInCarIntent hasEnable](self, "hasEnable"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSetDefrosterSettingsInCarIntent enable](self, "enable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("enable"));

  }
  -[_INPBSetDefrosterSettingsInCarIntent intentMetadata](self, "intentMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("intentMetadata"));

  return v3;
}

- (_INPBDataString)carName
{
  return self->_carName;
}

- (int)defroster
{
  return self->_defroster;
}

- (BOOL)enable
{
  return self->_enable;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_carName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
