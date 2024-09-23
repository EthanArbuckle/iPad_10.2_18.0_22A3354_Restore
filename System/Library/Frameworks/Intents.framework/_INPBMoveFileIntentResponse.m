@implementation _INPBMoveFileIntentResponse

- (void)setDestinationName:(id)a3
{
  objc_storeStrong((id *)&self->_destinationName, a3);
}

- (BOOL)hasDestinationName
{
  return self->_destinationName != 0;
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
    return off_1E228ED88[a3];
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

- (void)setOverwrite:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_overwrite = a3;
}

- (BOOL)hasOverwrite
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasOverwrite:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setSourceName:(id)a3
{
  objc_storeStrong((id *)&self->_sourceName, a3);
}

- (BOOL)hasSourceName
{
  return self->_sourceName != 0;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_success = a3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBMoveFileIntentResponseReadFrom(self, (uint64_t)a3);
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBMoveFileIntentResponse destinationName](self, "destinationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBMoveFileIntentResponse destinationName](self, "destinationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_entityNames;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
  if (-[_INPBMoveFileIntentResponse hasOverwrite](self, "hasOverwrite", v15))
    PBDataWriterWriteBOOLField();
  -[_INPBMoveFileIntentResponse sourceName](self, "sourceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBMoveFileIntentResponse sourceName](self, "sourceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBMoveFileIntentResponse hasSuccess](self, "hasSuccess"))
    PBDataWriterWriteBOOLField();

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBMoveFileIntentResponse clearEntityTypes](self, "clearEntityTypes");
  v3.receiver = self;
  v3.super_class = (Class)_INPBMoveFileIntentResponse;
  -[_INPBMoveFileIntentResponse dealloc](&v3, sel_dealloc);
}

- (_INPBMoveFileIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBMoveFileIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBMoveFileIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBMoveFileIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBMoveFileIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBMoveFileIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBMoveFileIntentResponse *v5;
  id v6;
  void *v7;
  id v8;

  v5 = -[_INPBMoveFileIntentResponse init](+[_INPBMoveFileIntentResponse allocWithZone:](_INPBMoveFileIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_destinationName, "copyWithZone:", a3);
  -[_INPBMoveFileIntentResponse setDestinationName:](v5, "setDestinationName:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_entityNames, "copyWithZone:", a3);
  -[_INPBMoveFileIntentResponse setEntityNames:](v5, "setEntityNames:", v7);

  PBRepeatedInt32Copy();
  if (-[_INPBMoveFileIntentResponse hasOverwrite](self, "hasOverwrite"))
    -[_INPBMoveFileIntentResponse setOverwrite:](v5, "setOverwrite:", -[_INPBMoveFileIntentResponse overwrite](self, "overwrite"));
  v8 = -[_INPBString copyWithZone:](self->_sourceName, "copyWithZone:", a3);
  -[_INPBMoveFileIntentResponse setSourceName:](v5, "setSourceName:", v8);

  if (-[_INPBMoveFileIntentResponse hasSuccess](self, "hasSuccess"))
    -[_INPBMoveFileIntentResponse setSuccess:](v5, "setSuccess:", -[_INPBMoveFileIntentResponse success](self, "success"));
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
  int overwrite;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  int v26;
  int success;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBMoveFileIntentResponse destinationName](self, "destinationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBMoveFileIntentResponse destinationName](self, "destinationName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBMoveFileIntentResponse destinationName](self, "destinationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "destinationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBMoveFileIntentResponse entityNames](self, "entityNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBMoveFileIntentResponse entityNames](self, "entityNames");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBMoveFileIntentResponse entityNames](self, "entityNames");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityNames");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_22;
  v17 = -[_INPBMoveFileIntentResponse hasOverwrite](self, "hasOverwrite");
  if (v17 != objc_msgSend(v4, "hasOverwrite"))
    goto LABEL_22;
  if (-[_INPBMoveFileIntentResponse hasOverwrite](self, "hasOverwrite"))
  {
    if (objc_msgSend(v4, "hasOverwrite"))
    {
      overwrite = self->_overwrite;
      if (overwrite != objc_msgSend(v4, "overwrite"))
        goto LABEL_22;
    }
  }
  -[_INPBMoveFileIntentResponse sourceName](self, "sourceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  -[_INPBMoveFileIntentResponse sourceName](self, "sourceName");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBMoveFileIntentResponse sourceName](self, "sourceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_22;
  }
  else
  {

  }
  v26 = -[_INPBMoveFileIntentResponse hasSuccess](self, "hasSuccess");
  if (v26 == objc_msgSend(v4, "hasSuccess"))
  {
    if (!-[_INPBMoveFileIntentResponse hasSuccess](self, "hasSuccess")
      || !objc_msgSend(v4, "hasSuccess")
      || (success = self->_success, success == objc_msgSend(v4, "success")))
    {
      v24 = 1;
      goto LABEL_23;
    }
  }
LABEL_22:
  v24 = 0;
LABEL_23:

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v3 = -[_INPBString hash](self->_destinationName, "hash");
  v4 = -[NSArray hash](self->_entityNames, "hash");
  v5 = PBRepeatedInt32Hash();
  if (-[_INPBMoveFileIntentResponse hasOverwrite](self, "hasOverwrite"))
    v6 = 2654435761 * self->_overwrite;
  else
    v6 = 0;
  v7 = -[_INPBString hash](self->_sourceName, "hash");
  if (-[_INPBMoveFileIntentResponse hasSuccess](self, "hasSuccess"))
    v8 = 2654435761 * self->_success;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBMoveFileIntentResponse destinationName](self, "destinationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("destinationName"));

  if (-[NSArray count](self->_entityNames, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = self->_entityNames;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("entityName"));
  }
  if (self->_entityTypes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBMoveFileIntentResponse entityTypesCount](self, "entityTypesCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBMoveFileIntentResponse entityTypesCount](self, "entityTypesCount"))
    {
      v14 = 0;
      do
      {
        v15 = self->_entityTypes.list[v14];
        if (v15 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_entityTypes.list[v14]);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_1E228ED88[v15];
        }
        objc_msgSend(v13, "addObject:", v16);

        ++v14;
      }
      while (v14 < -[_INPBMoveFileIntentResponse entityTypesCount](self, "entityTypesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("entityType"));

  }
  if (-[_INPBMoveFileIntentResponse hasOverwrite](self, "hasOverwrite"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBMoveFileIntentResponse overwrite](self, "overwrite"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("overwrite"));

  }
  -[_INPBMoveFileIntentResponse sourceName](self, "sourceName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("sourceName"));

  if (-[_INPBMoveFileIntentResponse hasSuccess](self, "hasSuccess"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBMoveFileIntentResponse success](self, "success"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("success"));

  }
  return v3;
}

- (_INPBString)destinationName
{
  return self->_destinationName;
}

- (NSArray)entityNames
{
  return self->_entityNames;
}

- (BOOL)overwrite
{
  return self->_overwrite;
}

- (_INPBString)sourceName
{
  return self->_sourceName;
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_entityNames, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
}

+ (Class)entityNameType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
