@implementation _INPBDoubleList

- (void)setConditionType:(id)a3
{
  objc_storeStrong((id *)&self->_conditionType, a3);
}

- (BOOL)hasConditionType
{
  return self->_conditionType != 0;
}

- (void)setDataStrings:(id)a3
{
  NSArray *v4;
  NSArray *dataStrings;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  dataStrings = self->_dataStrings;
  self->_dataStrings = v4;

}

- (void)clearDataStrings
{
  -[NSArray removeAllObjects](self->_dataStrings, "removeAllObjects");
}

- (void)addDataString:(id)a3
{
  id v4;
  NSArray *dataStrings;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  dataStrings = self->_dataStrings;
  v8 = v4;
  if (!dataStrings)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dataStrings;
    self->_dataStrings = v6;

    v4 = v8;
    dataStrings = self->_dataStrings;
  }
  -[NSArray addObject:](dataStrings, "addObject:", v4);

}

- (unint64_t)dataStringsCount
{
  return -[NSArray count](self->_dataStrings, "count");
}

- (id)dataStringAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_dataStrings, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDoubleListReadFrom(self, (uint64_t)a3);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBDoubleList conditionType](self, "conditionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBDoubleList conditionType](self, "conditionType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_dataStrings;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (_INPBDoubleList)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDoubleList *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDoubleList *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDoubleList *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDoubleList initWithData:](self, "initWithData:", v6);

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
  -[_INPBDoubleList data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDoubleList *v5;
  id v6;
  void *v7;

  v5 = -[_INPBDoubleList init](+[_INPBDoubleList allocWithZone:](_INPBDoubleList, "allocWithZone:"), "init");
  v6 = -[_INPBCondition copyWithZone:](self->_conditionType, "copyWithZone:", a3);
  -[_INPBDoubleList setConditionType:](v5, "setConditionType:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_dataStrings, "copyWithZone:", a3);
  -[_INPBDoubleList setDataStrings:](v5, "setDataStrings:", v7);

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBDoubleList conditionType](self, "conditionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conditionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBDoubleList conditionType](self, "conditionType");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBDoubleList conditionType](self, "conditionType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conditionType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBDoubleList dataStrings](self, "dataStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBDoubleList dataStrings](self, "dataStrings");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBDoubleList dataStrings](self, "dataStrings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataStrings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[_INPBCondition hash](self->_conditionType, "hash");
  return -[NSArray hash](self->_dataStrings, "hash") ^ v3;
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBDoubleList conditionType](self, "conditionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("conditionType"));

  if (-[NSArray count](self->_dataStrings, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_dataStrings;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "dictionaryRepresentation", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("dataString"));
  }
  return v3;
}

- (_INPBCondition)conditionType
{
  return self->_conditionType;
}

- (NSArray)dataStrings
{
  return self->_dataStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStrings, 0);
  objc_storeStrong((id *)&self->_conditionType, 0);
}

+ (Class)dataStringType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
