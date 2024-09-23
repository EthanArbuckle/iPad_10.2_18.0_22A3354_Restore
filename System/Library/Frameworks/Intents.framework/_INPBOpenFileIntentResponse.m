@implementation _INPBOpenFileIntentResponse

- (void)setEntities:(id)a3
{
  NSArray *v4;
  NSArray *entities;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  entities = self->_entities;
  self->_entities = v4;

}

- (void)clearEntities
{
  -[NSArray removeAllObjects](self->_entities, "removeAllObjects");
}

- (void)addEntities:(id)a3
{
  id v4;
  NSArray *entities;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  entities = self->_entities;
  v8 = v4;
  if (!entities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_entities;
    self->_entities = v6;

    v4 = v8;
    entities = self->_entities;
  }
  -[NSArray addObject:](entities, "addObject:", v4);

}

- (unint64_t)entitiesCount
{
  return -[NSArray count](self->_entities, "count");
}

- (id)entitiesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_entities, "objectAtIndexedSubscript:", a3);
}

- (void)setNumResults:(id)a3
{
  objc_storeStrong((id *)&self->_numResults, a3);
}

- (BOOL)hasNumResults
{
  return self->_numResults != 0;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_success = a3;
}

- (BOOL)hasSuccess
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBOpenFileIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_entities;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[_INPBOpenFileIntentResponse numResults](self, "numResults", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBOpenFileIntentResponse numResults](self, "numResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBOpenFileIntentResponse query](self, "query");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBOpenFileIntentResponse query](self, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBOpenFileIntentResponse hasSuccess](self, "hasSuccess"))
    PBDataWriterWriteBOOLField();

}

- (_INPBOpenFileIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBOpenFileIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBOpenFileIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBOpenFileIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBOpenFileIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBOpenFileIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBOpenFileIntentResponse *v5;
  void *v6;
  id v7;
  id v8;

  v5 = -[_INPBOpenFileIntentResponse init](+[_INPBOpenFileIntentResponse allocWithZone:](_INPBOpenFileIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_entities, "copyWithZone:", a3);
  -[_INPBOpenFileIntentResponse setEntities:](v5, "setEntities:", v6);

  v7 = -[_INPBInteger copyWithZone:](self->_numResults, "copyWithZone:", a3);
  -[_INPBOpenFileIntentResponse setNumResults:](v5, "setNumResults:", v7);

  v8 = -[_INPBString copyWithZone:](self->_query, "copyWithZone:", a3);
  -[_INPBOpenFileIntentResponse setQuery:](v5, "setQuery:", v8);

  if (-[_INPBOpenFileIntentResponse hasSuccess](self, "hasSuccess"))
    -[_INPBOpenFileIntentResponse setSuccess:](v5, "setSuccess:", -[_INPBOpenFileIntentResponse success](self, "success"));
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
  BOOL v22;
  int v24;
  int success;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBOpenFileIntentResponse entities](self, "entities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBOpenFileIntentResponse entities](self, "entities");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBOpenFileIntentResponse entities](self, "entities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBOpenFileIntentResponse numResults](self, "numResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBOpenFileIntentResponse numResults](self, "numResults");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBOpenFileIntentResponse numResults](self, "numResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBOpenFileIntentResponse query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[_INPBOpenFileIntentResponse query](self, "query");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBOpenFileIntentResponse query](self, "query");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "query");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  v24 = -[_INPBOpenFileIntentResponse hasSuccess](self, "hasSuccess");
  if (v24 == objc_msgSend(v4, "hasSuccess"))
  {
    if (!-[_INPBOpenFileIntentResponse hasSuccess](self, "hasSuccess")
      || !objc_msgSend(v4, "hasSuccess")
      || (success = self->_success, success == objc_msgSend(v4, "success")))
    {
      v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NSArray hash](self->_entities, "hash");
  v4 = -[_INPBInteger hash](self->_numResults, "hash");
  v5 = -[_INPBString hash](self->_query, "hash");
  if (-[_INPBOpenFileIntentResponse hasSuccess](self, "hasSuccess"))
    v6 = 2654435761 * self->_success;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_entities, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_entities;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("entities"));
  }
  -[_INPBOpenFileIntentResponse numResults](self, "numResults", (_QWORD)v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("numResults"));

  -[_INPBOpenFileIntentResponse query](self, "query");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("query"));

  if (-[_INPBOpenFileIntentResponse hasSuccess](self, "hasSuccess"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBOpenFileIntentResponse success](self, "success"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("success"));

  }
  return v3;
}

- (NSArray)entities
{
  return self->_entities;
}

- (_INPBInteger)numResults
{
  return self->_numResults;
}

- (_INPBString)query
{
  return self->_query;
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_numResults, 0);
  objc_storeStrong((id *)&self->_entities, 0);
}

+ (Class)entitiesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
