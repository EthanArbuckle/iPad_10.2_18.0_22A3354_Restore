@implementation _INPBShowHomeIntent

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

- (BOOL)readFrom:(id)a3
{
  return _INPBShowHomeIntentReadFrom(self, (uint64_t)a3);
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
  v5 = self->_filters;
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

  -[_INPBShowHomeIntent intentMetadata](self, "intentMetadata", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBShowHomeIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBShowHomeIntent time](self, "time");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBShowHomeIntent time](self, "time");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBShowHomeIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBShowHomeIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBShowHomeIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBShowHomeIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBShowHomeIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBShowHomeIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBShowHomeIntent *v5;
  void *v6;
  id v7;
  id v8;

  v5 = -[_INPBShowHomeIntent init](+[_INPBShowHomeIntent allocWithZone:](_INPBShowHomeIntent, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_filters, "copyWithZone:", a3);
  -[_INPBShowHomeIntent setFilters:](v5, "setFilters:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBShowHomeIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  v8 = -[_INPBDateTimeRange copyWithZone:](self->_time, "copyWithZone:", a3);
  -[_INPBShowHomeIntent setTime:](v5, "setTime:", v8);

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
  -[_INPBShowHomeIntent filters](self, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBShowHomeIntent filters](self, "filters");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBShowHomeIntent filters](self, "filters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBShowHomeIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBShowHomeIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBShowHomeIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBShowHomeIntent time](self, "time");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBShowHomeIntent time](self, "time");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBShowHomeIntent time](self, "time");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "time");
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
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSArray hash](self->_filters, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  return v4 ^ -[_INPBDateTimeRange hash](self->_time, "hash");
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_filters, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_filters;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("filters"));
  }
  -[_INPBShowHomeIntent intentMetadata](self, "intentMetadata", (_QWORD)v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("intentMetadata"));

  -[_INPBShowHomeIntent time](self, "time");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("time"));

  return v3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_filters, 0);
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
