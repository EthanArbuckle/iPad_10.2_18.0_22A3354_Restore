@implementation _INPBDeleteAlarmIntent

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

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteAlarmIntentReadFrom(self, (uint64_t)a3);
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
  -[_INPBDeleteAlarmIntent alarmSearch](self, "alarmSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBDeleteAlarmIntent alarmSearch](self, "alarmSearch");
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

  -[_INPBDeleteAlarmIntent intentMetadata](self, "intentMetadata", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBDeleteAlarmIntent intentMetadata](self, "intentMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBDeleteAlarmIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDeleteAlarmIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDeleteAlarmIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDeleteAlarmIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDeleteAlarmIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBDeleteAlarmIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDeleteAlarmIntent *v5;
  id v6;
  void *v7;
  id v8;

  v5 = -[_INPBDeleteAlarmIntent init](+[_INPBDeleteAlarmIntent allocWithZone:](_INPBDeleteAlarmIntent, "allocWithZone:"), "init");
  v6 = -[_INPBAlarmSearch copyWithZone:](self->_alarmSearch, "copyWithZone:", a3);
  -[_INPBDeleteAlarmIntent setAlarmSearch:](v5, "setAlarmSearch:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_alarms, "copyWithZone:", a3);
  -[_INPBDeleteAlarmIntent setAlarms:](v5, "setAlarms:", v7);

  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBDeleteAlarmIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBDeleteAlarmIntent alarmSearch](self, "alarmSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarmSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBDeleteAlarmIntent alarmSearch](self, "alarmSearch");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBDeleteAlarmIntent alarmSearch](self, "alarmSearch");
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
  -[_INPBDeleteAlarmIntent alarms](self, "alarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBDeleteAlarmIntent alarms](self, "alarms");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBDeleteAlarmIntent alarms](self, "alarms");
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
  -[_INPBDeleteAlarmIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBDeleteAlarmIntent intentMetadata](self, "intentMetadata");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBDeleteAlarmIntent intentMetadata](self, "intentMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

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

  v3 = -[_INPBAlarmSearch hash](self->_alarmSearch, "hash");
  v4 = -[NSArray hash](self->_alarms, "hash") ^ v3;
  return v4 ^ -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
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
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBDeleteAlarmIntent alarmSearch](self, "alarmSearch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alarmSearch"));

  if (-[NSArray count](self->_alarms, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_alarms;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "dictionaryRepresentation", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("alarms"));
  }
  -[_INPBDeleteAlarmIntent intentMetadata](self, "intentMetadata", (_QWORD)v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("intentMetadata"));

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
