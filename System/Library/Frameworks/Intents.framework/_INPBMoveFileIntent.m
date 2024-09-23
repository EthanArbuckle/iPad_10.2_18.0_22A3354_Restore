@implementation _INPBMoveFileIntent

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
    return off_1E228BF30[a3];
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

- (void)setEntityNames:(id)a3
{
  NSArray *v4;
  NSArray *entityNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  entityNames = self->_entityNames;
  self->_entityNames = v4;

}

- (void)clearEntityNames
{
  -[NSArray removeAllObjects](self->_entityNames, "removeAllObjects");
}

- (void)addEntityName:(id)a3
{
  id v4;
  NSArray *entityNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  entityNames = self->_entityNames;
  v8 = v4;
  if (!entityNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_entityNames;
    self->_entityNames = v6;

    v4 = v8;
    entityNames = self->_entityNames;
  }
  -[NSArray addObject:](entityNames, "addObject:", v4);

}

- (unint64_t)entityNamesCount
{
  return -[NSArray count](self->_entityNames, "count");
}

- (id)entityNameAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_entityNames, "objectAtIndexedSubscript:", a3);
}

- (void)setEntityTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)entityTypes
{
  return self->_entityTypes.list;
}

- (void)clearEntityTypes
{
  PBRepeatedInt32Clear();
}

- (void)addEntityType:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)entityTypesCount
{
  return self->_entityTypes.count;
}

- (int)entityTypeAtIndex:(unint64_t)a3
{
  return self->_entityTypes.list[a3];
}

- (id)entityTypesAsString:(int)a3
{
  if (a3 < 4)
    return off_1E228BF30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEntityTypes:(id)a3
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
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_sourceType = a3;
  }
}

- (BOOL)hasSourceType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSourceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)sourceTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E228BF30[a3];
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
  return _INPBMoveFileIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBMoveFileIntent destinationName](self, "destinationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBMoveFileIntent destinationName](self, "destinationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBMoveFileIntent hasDestinationType](self, "hasDestinationType"))
    PBDataWriterWriteInt32Field();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = self->_entityNames;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v9);
  }

  if (self->_entityTypes.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_entityTypes.count);
  }
  -[_INPBMoveFileIntent intentMetadata](self, "intentMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBMoveFileIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = self->_properties;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

  -[_INPBMoveFileIntent sourceName](self, "sourceName", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_INPBMoveFileIntent sourceName](self, "sourceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBMoveFileIntent hasSourceType](self, "hasSourceType"))
    PBDataWriterWriteInt32Field();

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBMoveFileIntent clearEntityTypes](self, "clearEntityTypes");
  v3.receiver = self;
  v3.super_class = (Class)_INPBMoveFileIntent;
  -[_INPBMoveFileIntent dealloc](&v3, sel_dealloc);
}

- (_INPBMoveFileIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBMoveFileIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBMoveFileIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBMoveFileIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBMoveFileIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBMoveFileIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBMoveFileIntent *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = -[_INPBMoveFileIntent init](+[_INPBMoveFileIntent allocWithZone:](_INPBMoveFileIntent, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_destinationName, "copyWithZone:", a3);
  -[_INPBMoveFileIntent setDestinationName:](v5, "setDestinationName:", v6);

  if (-[_INPBMoveFileIntent hasDestinationType](self, "hasDestinationType"))
    -[_INPBMoveFileIntent setDestinationType:](v5, "setDestinationType:", -[_INPBMoveFileIntent destinationType](self, "destinationType"));
  v7 = (void *)-[NSArray copyWithZone:](self->_entityNames, "copyWithZone:", a3);
  -[_INPBMoveFileIntent setEntityNames:](v5, "setEntityNames:", v7);

  PBRepeatedInt32Copy();
  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBMoveFileIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_properties, "copyWithZone:", a3);
  -[_INPBMoveFileIntent setProperties:](v5, "setProperties:", v9);

  v10 = -[_INPBString copyWithZone:](self->_sourceName, "copyWithZone:", a3);
  -[_INPBMoveFileIntent setSourceName:](v5, "setSourceName:", v10);

  if (-[_INPBMoveFileIntent hasSourceType](self, "hasSourceType"))
    -[_INPBMoveFileIntent setSourceType:](v5, "setSourceType:", -[_INPBMoveFileIntent sourceType](self, "sourceType"));
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  BOOL v34;
  int v36;
  int sourceType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[_INPBMoveFileIntent destinationName](self, "destinationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBMoveFileIntent destinationName](self, "destinationName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBMoveFileIntent destinationName](self, "destinationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destinationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  v12 = -[_INPBMoveFileIntent hasDestinationType](self, "hasDestinationType");
  if (v12 != objc_msgSend(v4, "hasDestinationType"))
    goto LABEL_32;
  if (-[_INPBMoveFileIntent hasDestinationType](self, "hasDestinationType"))
  {
    if (objc_msgSend(v4, "hasDestinationType"))
    {
      destinationType = self->_destinationType;
      if (destinationType != objc_msgSend(v4, "destinationType"))
        goto LABEL_32;
    }
  }
  -[_INPBMoveFileIntent entityNames](self, "entityNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBMoveFileIntent entityNames](self, "entityNames");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBMoveFileIntent entityNames](self, "entityNames");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityNames");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_32;
  }
  else
  {

  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_32;
  -[_INPBMoveFileIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBMoveFileIntent intentMetadata](self, "intentMetadata");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBMoveFileIntent intentMetadata](self, "intentMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBMoveFileIntent properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBMoveFileIntent properties](self, "properties");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBMoveFileIntent properties](self, "properties");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "properties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBMoveFileIntent sourceName](self, "sourceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  -[_INPBMoveFileIntent sourceName](self, "sourceName");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_INPBMoveFileIntent sourceName](self, "sourceName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_32;
  }
  else
  {

  }
  v36 = -[_INPBMoveFileIntent hasSourceType](self, "hasSourceType");
  if (v36 == objc_msgSend(v4, "hasSourceType"))
  {
    if (!-[_INPBMoveFileIntent hasSourceType](self, "hasSourceType")
      || !objc_msgSend(v4, "hasSourceType")
      || (sourceType = self->_sourceType, sourceType == objc_msgSend(v4, "sourceType")))
    {
      v34 = 1;
      goto LABEL_33;
    }
  }
LABEL_32:
  v34 = 0;
LABEL_33:

  return v34;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v3 = -[_INPBString hash](self->_destinationName, "hash");
  if (-[_INPBMoveFileIntent hasDestinationType](self, "hasDestinationType"))
    v4 = 2654435761 * self->_destinationType;
  else
    v4 = 0;
  v5 = -[NSArray hash](self->_entityNames, "hash");
  v6 = PBRepeatedInt32Hash();
  v7 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v8 = -[NSArray hash](self->_properties, "hash");
  v9 = -[_INPBString hash](self->_sourceName, "hash");
  if (-[_INPBMoveFileIntent hasSourceType](self, "hasSourceType"))
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
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBMoveFileIntent destinationName](self, "destinationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("destinationName"));

  if (-[_INPBMoveFileIntent hasDestinationType](self, "hasDestinationType"))
  {
    v6 = -[_INPBMoveFileIntent destinationType](self, "destinationType");
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E228BF30[v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("destinationType"));

  }
  if (-[NSArray count](self->_entityNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v9 = self->_entityNames;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v38;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v13), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("entityName"));
  }
  if (self->_entityTypes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBMoveFileIntent entityTypesCount](self, "entityTypesCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBMoveFileIntent entityTypesCount](self, "entityTypesCount"))
    {
      v16 = 0;
      do
      {
        v17 = self->_entityTypes.list[v16];
        if (v17 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_entityTypes.list[v16]);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = off_1E228BF30[v17];
        }
        objc_msgSend(v15, "addObject:", v18);

        ++v16;
      }
      while (v16 < -[_INPBMoveFileIntent entityTypesCount](self, "entityTypesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("entityType"));

  }
  -[_INPBMoveFileIntent intentMetadata](self, "intentMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("intentMetadata"));

  if (-[NSArray count](self->_properties, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v22 = self->_properties;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v26), "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("properties"));
  }
  -[_INPBMoveFileIntent sourceName](self, "sourceName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryRepresentation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("sourceName"));

  if (-[_INPBMoveFileIntent hasSourceType](self, "hasSourceType"))
  {
    v30 = -[_INPBMoveFileIntent sourceType](self, "sourceType");
    if (v30 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v30);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E228BF30[v30];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("sourceType"));

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

- (NSArray)entityNames
{
  return self->_entityNames;
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
  objc_storeStrong((id *)&self->_entityNames, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
}

+ (Class)entityNameType
{
  return (Class)objc_opt_class();
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
