@implementation _INPBSearchAlarmIntent

- (void)setAlarmSearch:(id)a3
{
  objc_storeStrong((id *)&self->_alarmSearch, a3);
}

- (BOOL)hasAlarmSearch
{
  return self->_alarmSearch != 0;
}

- (void)setAlarmSearchType:(int)a3
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
    self->_alarmSearchType = a3;
  }
}

- (BOOL)hasAlarmSearchType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAlarmSearchType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)alarmSearchTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E2294E78[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAlarmSearchType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIND")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WHEN_IS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOW_LONG_UNTIL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READ")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HOW_MANY")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAlarms:(id)a3
{
  NSArray *v4;
  NSArray *alarms;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  alarms = self->_alarms;
  self->_alarms = v4;

}

- (void)clearAlarms
{
  -[NSArray removeAllObjects](self->_alarms, "removeAllObjects");
}

- (void)addAlarms:(id)a3
{
  id v4;
  NSArray *alarms;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  alarms = self->_alarms;
  v8 = v4;
  if (!alarms)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alarms;
    self->_alarms = v6;

    v4 = v8;
    alarms = self->_alarms;
  }
  -[NSArray addObject:](alarms, "addObject:", v4);

}

- (unint64_t)alarmsCount
{
  return -[NSArray count](self->_alarms, "count");
}

- (id)alarmsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_alarms, "objectAtIndexedSubscript:", a3);
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
  return _INPBSearchAlarmIntentReadFrom(self, (uint64_t)a3);
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
  -[_INPBSearchAlarmIntent alarmSearch](self, "alarmSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBSearchAlarmIntent alarmSearch](self, "alarmSearch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSearchAlarmIntent hasAlarmSearchType](self, "hasAlarmSearchType"))
    PBDataWriterWriteInt32Field();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_alarms;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[_INPBSearchAlarmIntent intentMetadata](self, "intentMetadata", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBSearchAlarmIntent intentMetadata](self, "intentMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBSearchAlarmIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchAlarmIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchAlarmIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchAlarmIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchAlarmIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSearchAlarmIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchAlarmIntent *v5;
  id v6;
  void *v7;
  id v8;

  v5 = -[_INPBSearchAlarmIntent init](+[_INPBSearchAlarmIntent allocWithZone:](_INPBSearchAlarmIntent, "allocWithZone:"), "init");
  v6 = -[_INPBAlarmSearch copyWithZone:](self->_alarmSearch, "copyWithZone:", a3);
  -[_INPBSearchAlarmIntent setAlarmSearch:](v5, "setAlarmSearch:", v6);

  if (-[_INPBSearchAlarmIntent hasAlarmSearchType](self, "hasAlarmSearchType"))
    -[_INPBSearchAlarmIntent setAlarmSearchType:](v5, "setAlarmSearchType:", -[_INPBSearchAlarmIntent alarmSearchType](self, "alarmSearchType"));
  v7 = (void *)-[NSArray copyWithZone:](self->_alarms, "copyWithZone:", a3);
  -[_INPBSearchAlarmIntent setAlarms:](v5, "setAlarms:", v7);

  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSearchAlarmIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

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
  int alarmSearchType;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[_INPBSearchAlarmIntent alarmSearch](self, "alarmSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarmSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBSearchAlarmIntent alarmSearch](self, "alarmSearch");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSearchAlarmIntent alarmSearch](self, "alarmSearch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alarmSearch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_21;
  }
  else
  {

  }
  v12 = -[_INPBSearchAlarmIntent hasAlarmSearchType](self, "hasAlarmSearchType");
  if (v12 != objc_msgSend(v4, "hasAlarmSearchType"))
    goto LABEL_21;
  if (-[_INPBSearchAlarmIntent hasAlarmSearchType](self, "hasAlarmSearchType"))
  {
    if (objc_msgSend(v4, "hasAlarmSearchType"))
    {
      alarmSearchType = self->_alarmSearchType;
      if (alarmSearchType != objc_msgSend(v4, "alarmSearchType"))
        goto LABEL_21;
    }
  }
  -[_INPBSearchAlarmIntent alarms](self, "alarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBSearchAlarmIntent alarms](self, "alarms");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBSearchAlarmIntent alarms](self, "alarms");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alarms");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBSearchAlarmIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSearchAlarmIntent intentMetadata](self, "intentMetadata");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[_INPBSearchAlarmIntent intentMetadata](self, "intentMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[_INPBAlarmSearch hash](self->_alarmSearch, "hash");
  if (-[_INPBSearchAlarmIntent hasAlarmSearchType](self, "hasAlarmSearchType"))
    v4 = 2654435761 * self->_alarmSearchType;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSArray hash](self->_alarms, "hash");
  return v5 ^ v6 ^ -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
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
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSearchAlarmIntent alarmSearch](self, "alarmSearch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alarmSearch"));

  if (-[_INPBSearchAlarmIntent hasAlarmSearchType](self, "hasAlarmSearchType"))
  {
    v6 = -[_INPBSearchAlarmIntent alarmSearchType](self, "alarmSearchType");
    if (v6 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2294E78[v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("alarmSearchType"));

  }
  if (-[NSArray count](self->_alarms, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_alarms;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("alarms"));
  }
  -[_INPBSearchAlarmIntent intentMetadata](self, "intentMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("intentMetadata"));

  return v3;
}

- (_INPBAlarmSearch)alarmSearch
{
  return self->_alarmSearch;
}

- (int)alarmSearchType
{
  return self->_alarmSearchType;
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_alarmSearch, 0);
}

+ (Class)alarmsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
