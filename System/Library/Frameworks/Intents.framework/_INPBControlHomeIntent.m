@implementation _INPBControlHomeIntent

- (void)setContents:(id)a3
{
  NSArray *v4;
  NSArray *contents;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  contents = self->_contents;
  self->_contents = v4;

}

- (void)clearContents
{
  -[NSArray removeAllObjects](self->_contents, "removeAllObjects");
}

- (void)addContents:(id)a3
{
  id v4;
  NSArray *contents;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  contents = self->_contents;
  v8 = v4;
  if (!contents)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_contents;
    self->_contents = v6;

    v4 = v8;
    contents = self->_contents;
  }
  -[NSArray addObject:](contents, "addObject:", v4);

}

- (unint64_t)contentsCount
{
  return -[NSArray count](self->_contents, "count");
}

- (id)contentsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_contents, "objectAtIndexedSubscript:", a3);
}

- (void)setFilters:(id)a3
{
  NSArray *v4;
  NSArray *filters;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  filters = self->_filters;
  self->_filters = v4;

}

- (void)clearFilters
{
  -[NSArray removeAllObjects](self->_filters, "removeAllObjects");
}

- (void)addFilters:(id)a3
{
  id v4;
  NSArray *filters;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  filters = self->_filters;
  v8 = v4;
  if (!filters)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_filters;
    self->_filters = v6;

    v4 = v8;
    filters = self->_filters;
  }
  -[NSArray addObject:](filters, "addObject:", v4);

}

- (unint64_t)filtersCount
{
  return -[NSArray count](self->_filters, "count");
}

- (id)filtersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_filters, "objectAtIndexedSubscript:", a3);
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (void)setUserTask:(id)a3
{
  objc_storeStrong((id *)&self->_userTask, a3);
}

- (BOOL)hasUserTask
{
  return self->_userTask != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBControlHomeIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_contents;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = self->_filters;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v12);
  }

  -[_INPBControlHomeIntent intentMetadata](self, "intentMetadata", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_INPBControlHomeIntent intentMetadata](self, "intentMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBControlHomeIntent time](self, "time");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[_INPBControlHomeIntent time](self, "time");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBControlHomeIntent userTask](self, "userTask");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[_INPBControlHomeIntent userTask](self, "userTask");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBControlHomeIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBControlHomeIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBControlHomeIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBControlHomeIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBControlHomeIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBControlHomeIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBControlHomeIntent *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v5 = -[_INPBControlHomeIntent init](+[_INPBControlHomeIntent allocWithZone:](_INPBControlHomeIntent, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_contents, "copyWithZone:", a3);
  -[_INPBControlHomeIntent setContents:](v5, "setContents:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_filters, "copyWithZone:", a3);
  -[_INPBControlHomeIntent setFilters:](v5, "setFilters:", v7);

  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBControlHomeIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  v9 = -[_INPBDateTimeRange copyWithZone:](self->_time, "copyWithZone:", a3);
  -[_INPBControlHomeIntent setTime:](v5, "setTime:", v9);

  v10 = -[_INPBHomeUserTask copyWithZone:](self->_userTask, "copyWithZone:", a3);
  -[_INPBControlHomeIntent setUserTask:](v5, "setUserTask:", v10);

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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_INPBControlHomeIntent contents](self, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBControlHomeIntent contents](self, "contents");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBControlHomeIntent contents](self, "contents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBControlHomeIntent filters](self, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBControlHomeIntent filters](self, "filters");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBControlHomeIntent filters](self, "filters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBControlHomeIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBControlHomeIntent intentMetadata](self, "intentMetadata");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBControlHomeIntent intentMetadata](self, "intentMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBControlHomeIntent time](self, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBControlHomeIntent time](self, "time");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBControlHomeIntent time](self, "time");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "time");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBControlHomeIntent userTask](self, "userTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBControlHomeIntent userTask](self, "userTask");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_INPBControlHomeIntent userTask](self, "userTask");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userTask");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NSArray hash](self->_contents, "hash");
  v4 = -[NSArray hash](self->_filters, "hash") ^ v3;
  v5 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v6 = v4 ^ v5 ^ -[_INPBDateTimeRange hash](self->_time, "hash");
  return v6 ^ -[_INPBHomeUserTask hash](self->_userTask, "hash");
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
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_contents, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = self->_contents;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("contents"));
  }
  if (-[NSArray count](self->_filters, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = self->_filters;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v16), "dictionaryRepresentation", (_QWORD)v25);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("filters"));
  }
  -[_INPBControlHomeIntent intentMetadata](self, "intentMetadata", (_QWORD)v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("intentMetadata"));

  -[_INPBControlHomeIntent time](self, "time");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("time"));

  -[_INPBControlHomeIntent userTask](self, "userTask");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("userTask"));

  return v3;
}

- (NSArray)contents
{
  return self->_contents;
}

- (NSArray)filters
{
  return self->_filters;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDateTimeRange)time
{
  return self->_time;
}

- (_INPBHomeUserTask)userTask
{
  return self->_userTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userTask, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

+ (Class)contentsType
{
  return (Class)objc_opt_class();
}

+ (Class)filtersType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
