@implementation NTPBLanguageBucket

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)clearValues
{
  -[NSMutableArray removeAllObjects](self->_values, "removeAllObjects");
}

- (void)addValues:(id)a3
{
  id v4;
  NSMutableArray *values;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  values = self->_values;
  v8 = v4;
  if (!values)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_values;
    self->_values = v6;

    v4 = v8;
    values = self->_values;
  }
  -[NSMutableArray addObject:](values, "addObject:", v4);

}

- (unint64_t)valuesCount
{
  return -[NSMutableArray count](self->_values, "count");
}

- (id)valuesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_values, "objectAtIndex:", a3);
}

+ (Class)valuesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasGroupingFlags
{
  return self->_groupingFlags != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBLanguageBucket;
  -[NTPBLanguageBucket description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBLanguageBucket dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  NSMutableArray *values;
  NTPBGroupingFlags *groupingFlags;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  values = self->_values;
  if (values)
    objc_msgSend(v4, "setObject:forKey:", values, CFSTR("values"));
  groupingFlags = self->_groupingFlags;
  if (groupingFlags)
  {
    -[NTPBGroupingFlags dictionaryRepresentation](groupingFlags, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("grouping_flags"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBLanguageBucketReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_key)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_values;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_groupingFlags)
    PBDataWriterWriteSubmessage();

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_values;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addValues:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v14 = -[NTPBGroupingFlags copyWithZone:](self->_groupingFlags, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  NSMutableArray *values;
  NTPBGroupingFlags *groupingFlags;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((key = self->_key, !((unint64_t)key | v4[2])) || -[NSString isEqual:](key, "isEqual:"))
    && ((values = self->_values, !((unint64_t)values | v4[3]))
     || -[NSMutableArray isEqual:](values, "isEqual:")))
  {
    groupingFlags = self->_groupingFlags;
    if ((unint64_t)groupingFlags | v4[1])
      v8 = -[NTPBGroupingFlags isEqual:](groupingFlags, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSMutableArray hash](self->_values, "hash") ^ v3;
  return v4 ^ -[NTPBGroupingFlags hash](self->_groupingFlags, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NTPBGroupingFlags *groupingFlags;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[NTPBLanguageBucket setKey:](self, "setKey:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[NTPBLanguageBucket addValues:](self, "addValues:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  groupingFlags = self->_groupingFlags;
  v11 = *((_QWORD *)v4 + 1);
  if (groupingFlags)
  {
    if (v11)
      -[NTPBGroupingFlags mergeFrom:](groupingFlags, "mergeFrom:");
  }
  else if (v11)
  {
    -[NTPBLanguageBucket setGroupingFlags:](self, "setGroupingFlags:");
  }

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (NTPBGroupingFlags)groupingFlags
{
  return self->_groupingFlags;
}

- (void)setGroupingFlags:(id)a3
{
  objc_storeStrong((id *)&self->_groupingFlags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_groupingFlags, 0);
}

@end
