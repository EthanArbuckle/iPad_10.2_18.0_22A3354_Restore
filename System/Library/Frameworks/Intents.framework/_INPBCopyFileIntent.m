@implementation _INPBCopyFileIntent

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
    return off_1E228EF28[a3];
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
    return off_1E228EF28[a3];
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

- (void)setProperties:(id)a3
{
  NSArray *v4;
  NSArray *properties;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  properties = self->_properties;
  self->_properties = v4;

}

- (void)clearProperties
{
  -[NSArray removeAllObjects](self->_properties, "removeAllObjects");
}

- (void)addProperties:(id)a3
{
  id v4;
  NSArray *properties;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  properties = self->_properties;
  v8 = v4;
  if (!properties)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_properties;
    self->_properties = v6;

    v4 = v8;
    properties = self->_properties;
  }
  -[NSArray addObject:](properties, "addObject:", v4);

}

- (unint64_t)propertiesCount
{
  return -[NSArray count](self->_properties, "count");
}

- (id)propertiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_properties, "objectAtIndexedSubscript:", a3);
}

- (void)setSourceName:(id)a3
{
  objc_storeStrong((id *)&self->_sourceName, a3);
}

- (BOOL)hasSourceName
{
  return self->_sourceName != 0;
}

- (void)setSourceType:(int)a3
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
    self->_sourceType = a3;
  }
}

- (BOOL)hasSourceType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSourceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)sourceTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E228EF28[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSourceType:(id)a3
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

- (BOOL)readFrom:(id)a3
{
  return _INPBCopyFileIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBCopyFileIntent destinationName](self, "destinationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBCopyFileIntent destinationName](self, "destinationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBCopyFileIntent hasDestinationType](self, "hasDestinationType"))
    PBDataWriterWriteInt32Field();
  -[_INPBCopyFileIntent entityName](self, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBCopyFileIntent entityName](self, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBCopyFileIntent hasEntityType](self, "hasEntityType"))
    PBDataWriterWriteInt32Field();
  -[_INPBCopyFileIntent intentMetadata](self, "intentMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBCopyFileIntent intentMetadata](self, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_properties;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  -[_INPBCopyFileIntent sourceName](self, "sourceName", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBCopyFileIntent sourceName](self, "sourceName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBCopyFileIntent hasSourceType](self, "hasSourceType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBCopyFileIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCopyFileIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCopyFileIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCopyFileIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCopyFileIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBCopyFileIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCopyFileIntent *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = -[_INPBCopyFileIntent init](+[_INPBCopyFileIntent allocWithZone:](_INPBCopyFileIntent, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_destinationName, "copyWithZone:", a3);
  -[_INPBCopyFileIntent setDestinationName:](v5, "setDestinationName:", v6);

  if (-[_INPBCopyFileIntent hasDestinationType](self, "hasDestinationType"))
    -[_INPBCopyFileIntent setDestinationType:](v5, "setDestinationType:", -[_INPBCopyFileIntent destinationType](self, "destinationType"));
  v7 = -[_INPBString copyWithZone:](self->_entityName, "copyWithZone:", a3);
  -[_INPBCopyFileIntent setEntityName:](v5, "setEntityName:", v7);

  if (-[_INPBCopyFileIntent hasEntityType](self, "hasEntityType"))
    -[_INPBCopyFileIntent setEntityType:](v5, "setEntityType:", -[_INPBCopyFileIntent entityType](self, "entityType"));
  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBCopyFileIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_properties, "copyWithZone:", a3);
  -[_INPBCopyFileIntent setProperties:](v5, "setProperties:", v9);

  v10 = -[_INPBString copyWithZone:](self->_sourceName, "copyWithZone:", a3);
  -[_INPBCopyFileIntent setSourceName:](v5, "setSourceName:", v10);

  if (-[_INPBCopyFileIntent hasSourceType](self, "hasSourceType"))
    -[_INPBCopyFileIntent setSourceType:](v5, "setSourceType:", -[_INPBCopyFileIntent sourceType](self, "sourceType"));
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
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  BOOL v36;
  int v38;
  int sourceType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  -[_INPBCopyFileIntent destinationName](self, "destinationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[_INPBCopyFileIntent destinationName](self, "destinationName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBCopyFileIntent destinationName](self, "destinationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destinationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_35;
  }
  else
  {

  }
  v12 = -[_INPBCopyFileIntent hasDestinationType](self, "hasDestinationType");
  if (v12 != objc_msgSend(v4, "hasDestinationType"))
    goto LABEL_35;
  if (-[_INPBCopyFileIntent hasDestinationType](self, "hasDestinationType"))
  {
    if (objc_msgSend(v4, "hasDestinationType"))
    {
      destinationType = self->_destinationType;
      if (destinationType != objc_msgSend(v4, "destinationType"))
        goto LABEL_35;
    }
  }
  -[_INPBCopyFileIntent entityName](self, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[_INPBCopyFileIntent entityName](self, "entityName");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBCopyFileIntent entityName](self, "entityName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_35;
  }
  else
  {

  }
  v19 = -[_INPBCopyFileIntent hasEntityType](self, "hasEntityType");
  if (v19 != objc_msgSend(v4, "hasEntityType"))
    goto LABEL_35;
  if (-[_INPBCopyFileIntent hasEntityType](self, "hasEntityType"))
  {
    if (objc_msgSend(v4, "hasEntityType"))
    {
      entityType = self->_entityType;
      if (entityType != objc_msgSend(v4, "entityType"))
        goto LABEL_35;
    }
  }
  -[_INPBCopyFileIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[_INPBCopyFileIntent intentMetadata](self, "intentMetadata");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBCopyFileIntent intentMetadata](self, "intentMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_35;
  }
  else
  {

  }
  -[_INPBCopyFileIntent properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[_INPBCopyFileIntent properties](self, "properties");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_INPBCopyFileIntent properties](self, "properties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "properties");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_35;
  }
  else
  {

  }
  -[_INPBCopyFileIntent sourceName](self, "sourceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_34:

    goto LABEL_35;
  }
  -[_INPBCopyFileIntent sourceName](self, "sourceName");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_INPBCopyFileIntent sourceName](self, "sourceName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_35;
  }
  else
  {

  }
  v38 = -[_INPBCopyFileIntent hasSourceType](self, "hasSourceType");
  if (v38 == objc_msgSend(v4, "hasSourceType"))
  {
    if (!-[_INPBCopyFileIntent hasSourceType](self, "hasSourceType")
      || !objc_msgSend(v4, "hasSourceType")
      || (sourceType = self->_sourceType, sourceType == objc_msgSend(v4, "sourceType")))
    {
      v36 = 1;
      goto LABEL_36;
    }
  }
LABEL_35:
  v36 = 0;
LABEL_36:

  return v36;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v3 = -[_INPBString hash](self->_destinationName, "hash");
  if (-[_INPBCopyFileIntent hasDestinationType](self, "hasDestinationType"))
    v4 = 2654435761 * self->_destinationType;
  else
    v4 = 0;
  v5 = -[_INPBString hash](self->_entityName, "hash");
  if (-[_INPBCopyFileIntent hasEntityType](self, "hasEntityType"))
    v6 = 2654435761 * self->_entityType;
  else
    v6 = 0;
  v7 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v8 = -[NSArray hash](self->_properties, "hash");
  v9 = -[_INPBString hash](self->_sourceName, "hash");
  if (-[_INPBCopyFileIntent hasSourceType](self, "hasSourceType"))
    v10 = 2654435761 * self->_sourceType;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
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
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBCopyFileIntent destinationName](self, "destinationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("destinationName"));

  if (-[_INPBCopyFileIntent hasDestinationType](self, "hasDestinationType"))
  {
    v6 = -[_INPBCopyFileIntent destinationType](self, "destinationType");
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E228EF28[v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("destinationType"));

  }
  -[_INPBCopyFileIntent entityName](self, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entityName"));

  if (-[_INPBCopyFileIntent hasEntityType](self, "hasEntityType"))
  {
    v10 = -[_INPBCopyFileIntent entityType](self, "entityType");
    if (v10 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E228EF28[v10];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("entityType"));

  }
  -[_INPBCopyFileIntent intentMetadata](self, "intentMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("intentMetadata"));

  if (-[NSArray count](self->_properties, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = self->_properties;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v19), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("properties"));
  }
  -[_INPBCopyFileIntent sourceName](self, "sourceName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("sourceName"));

  if (-[_INPBCopyFileIntent hasSourceType](self, "hasSourceType"))
  {
    v23 = -[_INPBCopyFileIntent sourceType](self, "sourceType");
    if (v23 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E228EF28[v23];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("sourceType"));

  }
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

- (NSArray)properties
{
  return self->_properties;
}

- (_INPBString)sourceName
{
  return self->_sourceName;
}

- (int)sourceType
{
  return self->_sourceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
}

+ (Class)propertiesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
