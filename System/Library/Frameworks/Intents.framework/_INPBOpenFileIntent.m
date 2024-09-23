@implementation _INPBOpenFileIntent

- (void)setAppId:(id)a3
{
  objc_storeStrong((id *)&self->_appId, a3);
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
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
    return off_1E228B620[a3];
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

- (void)setScope:(int)a3
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
    self->_scope = a3;
  }
}

- (BOOL)hasScope
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasScope:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)scopeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E228B640[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsScope:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTORY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOLUME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("COMPUTER")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setScopeEntityName:(id)a3
{
  objc_storeStrong((id *)&self->_scopeEntityName, a3);
}

- (BOOL)hasScopeEntityName
{
  return self->_scopeEntityName != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBOpenFileIntentReadFrom(self, (uint64_t)a3);
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
  -[_INPBOpenFileIntent appId](self, "appId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBOpenFileIntent appId](self, "appId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBOpenFileIntent entityName](self, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBOpenFileIntent entityName](self, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBOpenFileIntent hasEntityType](self, "hasEntityType"))
    PBDataWriterWriteInt32Field();
  -[_INPBOpenFileIntent intentMetadata](self, "intentMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBOpenFileIntent intentMetadata](self, "intentMetadata");
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

  if (-[_INPBOpenFileIntent hasScope](self, "hasScope", v18))
    PBDataWriterWriteInt32Field();
  -[_INPBOpenFileIntent scopeEntityName](self, "scopeEntityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBOpenFileIntent scopeEntityName](self, "scopeEntityName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBOpenFileIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBOpenFileIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBOpenFileIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBOpenFileIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBOpenFileIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBOpenFileIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBOpenFileIntent *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = -[_INPBOpenFileIntent init](+[_INPBOpenFileIntent allocWithZone:](_INPBOpenFileIntent, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_appId, "copyWithZone:", a3);
  -[_INPBOpenFileIntent setAppId:](v5, "setAppId:", v6);

  v7 = -[_INPBString copyWithZone:](self->_entityName, "copyWithZone:", a3);
  -[_INPBOpenFileIntent setEntityName:](v5, "setEntityName:", v7);

  if (-[_INPBOpenFileIntent hasEntityType](self, "hasEntityType"))
    -[_INPBOpenFileIntent setEntityType:](v5, "setEntityType:", -[_INPBOpenFileIntent entityType](self, "entityType"));
  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBOpenFileIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  v9 = (void *)-[NSArray copyWithZone:](self->_properties, "copyWithZone:", a3);
  -[_INPBOpenFileIntent setProperties:](v5, "setProperties:", v9);

  if (-[_INPBOpenFileIntent hasScope](self, "hasScope"))
    -[_INPBOpenFileIntent setScope:](v5, "setScope:", -[_INPBOpenFileIntent scope](self, "scope"));
  v10 = -[_INPBString copyWithZone:](self->_scopeEntityName, "copyWithZone:", a3);
  -[_INPBOpenFileIntent setScopeEntityName:](v5, "setScopeEntityName:", v10);

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
  int v17;
  int entityType;
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
  int v29;
  int scope;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  BOOL v36;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  -[_INPBOpenFileIntent appId](self, "appId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[_INPBOpenFileIntent appId](self, "appId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBOpenFileIntent appId](self, "appId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_35;
  }
  else
  {

  }
  -[_INPBOpenFileIntent entityName](self, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[_INPBOpenFileIntent entityName](self, "entityName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBOpenFileIntent entityName](self, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_35;
  }
  else
  {

  }
  v17 = -[_INPBOpenFileIntent hasEntityType](self, "hasEntityType");
  if (v17 != objc_msgSend(v4, "hasEntityType"))
    goto LABEL_35;
  if (-[_INPBOpenFileIntent hasEntityType](self, "hasEntityType"))
  {
    if (objc_msgSend(v4, "hasEntityType"))
    {
      entityType = self->_entityType;
      if (entityType != objc_msgSend(v4, "entityType"))
        goto LABEL_35;
    }
  }
  -[_INPBOpenFileIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[_INPBOpenFileIntent intentMetadata](self, "intentMetadata");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBOpenFileIntent intentMetadata](self, "intentMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_35;
  }
  else
  {

  }
  -[_INPBOpenFileIntent properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_34;
  -[_INPBOpenFileIntent properties](self, "properties");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBOpenFileIntent properties](self, "properties");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "properties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_35;
  }
  else
  {

  }
  v29 = -[_INPBOpenFileIntent hasScope](self, "hasScope");
  if (v29 != objc_msgSend(v4, "hasScope"))
    goto LABEL_35;
  if (-[_INPBOpenFileIntent hasScope](self, "hasScope"))
  {
    if (objc_msgSend(v4, "hasScope"))
    {
      scope = self->_scope;
      if (scope != objc_msgSend(v4, "scope"))
        goto LABEL_35;
    }
  }
  -[_INPBOpenFileIntent scopeEntityName](self, "scopeEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopeEntityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBOpenFileIntent scopeEntityName](self, "scopeEntityName");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!v31)
    {

LABEL_38:
      v36 = 1;
      goto LABEL_36;
    }
    v32 = (void *)v31;
    -[_INPBOpenFileIntent scopeEntityName](self, "scopeEntityName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scopeEntityName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if ((v35 & 1) != 0)
      goto LABEL_38;
  }
  else
  {
LABEL_34:

  }
LABEL_35:
  v36 = 0;
LABEL_36:

  return v36;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[_INPBString hash](self->_appId, "hash");
  v4 = -[_INPBString hash](self->_entityName, "hash");
  if (-[_INPBOpenFileIntent hasEntityType](self, "hasEntityType"))
    v5 = 2654435761 * self->_entityType;
  else
    v5 = 0;
  v6 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v7 = -[NSArray hash](self->_properties, "hash");
  if (-[_INPBOpenFileIntent hasScope](self, "hasScope"))
    v8 = 2654435761 * self->_scope;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[_INPBString hash](self->_scopeEntityName, "hash");
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
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBOpenFileIntent appId](self, "appId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appId"));

  -[_INPBOpenFileIntent entityName](self, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("entityName"));

  if (-[_INPBOpenFileIntent hasEntityType](self, "hasEntityType"))
  {
    v8 = -[_INPBOpenFileIntent entityType](self, "entityType");
    if (v8 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E228B620[v8];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entityType"));

  }
  -[_INPBOpenFileIntent intentMetadata](self, "intentMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("intentMetadata"));

  if (-[NSArray count](self->_properties, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = self->_properties;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("properties"));
  }
  if (-[_INPBOpenFileIntent hasScope](self, "hasScope"))
  {
    v19 = -[_INPBOpenFileIntent scope](self, "scope");
    if (v19 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v19);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E228B640[v19];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("scope"));

  }
  -[_INPBOpenFileIntent scopeEntityName](self, "scopeEntityName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("scopeEntityName"));

  return v3;
}

- (_INPBString)appId
{
  return self->_appId;
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

- (int)scope
{
  return self->_scope;
}

- (_INPBString)scopeEntityName
{
  return self->_scopeEntityName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeEntityName, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_appId, 0);
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
