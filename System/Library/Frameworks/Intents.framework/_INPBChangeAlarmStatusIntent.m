@implementation _INPBChangeAlarmStatusIntent

- (void)setAlarmSearch:(id)a3
{
  objc_storeStrong((id *)&self->_alarmSearch, a3);
}

- (BOOL)hasAlarmSearch
{
  return self->_alarmSearch != 0;
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

- (void)setOperation:(int)a3
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
    self->_operation = a3;
  }
}

- (BOOL)hasOperation
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasOperation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)operationAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E2294BF0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOperation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DISMISS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBChangeAlarmStatusIntentReadFrom(self, (uint64_t)a3);
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
  -[_INPBChangeAlarmStatusIntent alarmSearch](self, "alarmSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBChangeAlarmStatusIntent alarmSearch](self, "alarmSearch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
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

  -[_INPBChangeAlarmStatusIntent intentMetadata](self, "intentMetadata", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBChangeAlarmStatusIntent intentMetadata](self, "intentMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBChangeAlarmStatusIntent hasOperation](self, "hasOperation"))
    PBDataWriterWriteInt32Field();

}

- (_INPBChangeAlarmStatusIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBChangeAlarmStatusIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBChangeAlarmStatusIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBChangeAlarmStatusIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBChangeAlarmStatusIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBChangeAlarmStatusIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBChangeAlarmStatusIntent *v5;
  id v6;
  void *v7;
  id v8;

  v5 = -[_INPBChangeAlarmStatusIntent init](+[_INPBChangeAlarmStatusIntent allocWithZone:](_INPBChangeAlarmStatusIntent, "allocWithZone:"), "init");
  v6 = -[_INPBAlarmSearch copyWithZone:](self->_alarmSearch, "copyWithZone:", a3);
  -[_INPBChangeAlarmStatusIntent setAlarmSearch:](v5, "setAlarmSearch:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_alarms, "copyWithZone:", a3);
  -[_INPBChangeAlarmStatusIntent setAlarms:](v5, "setAlarms:", v7);

  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBChangeAlarmStatusIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  if (-[_INPBChangeAlarmStatusIntent hasOperation](self, "hasOperation"))
    -[_INPBChangeAlarmStatusIntent setOperation:](v5, "setOperation:", -[_INPBChangeAlarmStatusIntent operation](self, "operation"));
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
  int operation;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBChangeAlarmStatusIntent alarmSearch](self, "alarmSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarmSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBChangeAlarmStatusIntent alarmSearch](self, "alarmSearch");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBChangeAlarmStatusIntent alarmSearch](self, "alarmSearch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alarmSearch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBChangeAlarmStatusIntent alarms](self, "alarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBChangeAlarmStatusIntent alarms](self, "alarms");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBChangeAlarmStatusIntent alarms](self, "alarms");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alarms");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBChangeAlarmStatusIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  -[_INPBChangeAlarmStatusIntent intentMetadata](self, "intentMetadata");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBChangeAlarmStatusIntent intentMetadata](self, "intentMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_17;
  }
  else
  {

  }
  v24 = -[_INPBChangeAlarmStatusIntent hasOperation](self, "hasOperation");
  if (v24 == objc_msgSend(v4, "hasOperation"))
  {
    if (!-[_INPBChangeAlarmStatusIntent hasOperation](self, "hasOperation")
      || !objc_msgSend(v4, "hasOperation")
      || (operation = self->_operation, operation == objc_msgSend(v4, "operation")))
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
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[_INPBAlarmSearch hash](self->_alarmSearch, "hash");
  v4 = -[NSArray hash](self->_alarms, "hash");
  v5 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBChangeAlarmStatusIntent hasOperation](self, "hasOperation"))
    v6 = 2654435761 * self->_operation;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
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
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBChangeAlarmStatusIntent alarmSearch](self, "alarmSearch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alarmSearch"));

  if (-[NSArray count](self->_alarms, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = self->_alarms;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("alarms"));
  }
  -[_INPBChangeAlarmStatusIntent intentMetadata](self, "intentMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("intentMetadata"));

  if (-[_INPBChangeAlarmStatusIntent hasOperation](self, "hasOperation"))
  {
    v15 = -[_INPBChangeAlarmStatusIntent operation](self, "operation");
    if ((v15 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E2294BF0[(v15 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("operation"));

  }
  return v3;
}

- (_INPBAlarmSearch)alarmSearch
{
  return self->_alarmSearch;
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)operation
{
  return self->_operation;
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
