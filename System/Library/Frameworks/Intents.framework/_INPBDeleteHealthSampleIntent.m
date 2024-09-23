@implementation _INPBDeleteHealthSampleIntent

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setSampleUuids:(id)a3
{
  NSArray *v4;
  NSArray *sampleUuids;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  sampleUuids = self->_sampleUuids;
  self->_sampleUuids = v4;

}

- (void)clearSampleUuids
{
  -[NSArray removeAllObjects](self->_sampleUuids, "removeAllObjects");
}

- (void)addSampleUuids:(id)a3
{
  id v4;
  NSArray *sampleUuids;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  sampleUuids = self->_sampleUuids;
  v8 = v4;
  if (!sampleUuids)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sampleUuids;
    self->_sampleUuids = v6;

    v4 = v8;
    sampleUuids = self->_sampleUuids;
  }
  -[NSArray addObject:](sampleUuids, "addObject:", v4);

}

- (unint64_t)sampleUuidsCount
{
  return -[NSArray count](self->_sampleUuids, "count");
}

- (id)sampleUuidsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_sampleUuids, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteHealthSampleIntentReadFrom(self, (uint64_t)a3);
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
  -[_INPBDeleteHealthSampleIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBDeleteHealthSampleIntent intentMetadata](self, "intentMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_sampleUuids;
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

- (_INPBDeleteHealthSampleIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDeleteHealthSampleIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDeleteHealthSampleIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDeleteHealthSampleIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDeleteHealthSampleIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBDeleteHealthSampleIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDeleteHealthSampleIntent *v5;
  id v6;
  void *v7;

  v5 = -[_INPBDeleteHealthSampleIntent init](+[_INPBDeleteHealthSampleIntent allocWithZone:](_INPBDeleteHealthSampleIntent, "allocWithZone:"), "init");
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBDeleteHealthSampleIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_sampleUuids, "copyWithZone:", a3);
  -[_INPBDeleteHealthSampleIntent setSampleUuids:](v5, "setSampleUuids:", v7);

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
  -[_INPBDeleteHealthSampleIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBDeleteHealthSampleIntent intentMetadata](self, "intentMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBDeleteHealthSampleIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBDeleteHealthSampleIntent sampleUuids](self, "sampleUuids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampleUuids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBDeleteHealthSampleIntent sampleUuids](self, "sampleUuids");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBDeleteHealthSampleIntent sampleUuids](self, "sampleUuids");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sampleUuids");
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

  v3 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  return -[NSArray hash](self->_sampleUuids, "hash") ^ v3;
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
  -[_INPBDeleteHealthSampleIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentMetadata"));

  if (-[NSArray count](self->_sampleUuids, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_sampleUuids;
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

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sampleUuids"));
  }
  return v3;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)sampleUuids
{
  return self->_sampleUuids;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleUuids, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (Class)sampleUuidsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
