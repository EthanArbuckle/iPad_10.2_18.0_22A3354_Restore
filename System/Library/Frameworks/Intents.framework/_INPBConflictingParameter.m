@implementation _INPBConflictingParameter

- (void)setAlternateItems:(id)a3
{
  NSArray *v4;
  NSArray *alternateItems;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  alternateItems = self->_alternateItems;
  self->_alternateItems = v4;

}

- (void)clearAlternateItems
{
  -[NSArray removeAllObjects](self->_alternateItems, "removeAllObjects");
}

- (void)addAlternateItems:(id)a3
{
  id v4;
  NSArray *alternateItems;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  alternateItems = self->_alternateItems;
  v8 = v4;
  if (!alternateItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alternateItems;
    self->_alternateItems = v6;

    v4 = v8;
    alternateItems = self->_alternateItems;
  }
  -[NSArray addObject:](alternateItems, "addObject:", v4);

}

- (unint64_t)alternateItemsCount
{
  return -[NSArray count](self->_alternateItems, "count");
}

- (id)alternateItemsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_alternateItems, "objectAtIndexedSubscript:", a3);
}

- (void)setKeyPath:(id)a3
{
  NSString *v4;
  NSString *keyPath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  keyPath = self->_keyPath;
  self->_keyPath = v4;

}

- (BOOL)hasKeyPath
{
  return self->_keyPath != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBConflictingParameterReadFrom(self, (uint64_t)a3);
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_alternateItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[_INPBConflictingParameter keyPath](self, "keyPath", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();

}

- (_INPBConflictingParameter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBConflictingParameter *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBConflictingParameter *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBConflictingParameter *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBConflictingParameter initWithData:](self, "initWithData:", v6);

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
  -[_INPBConflictingParameter data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBConflictingParameter *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBConflictingParameter init](+[_INPBConflictingParameter allocWithZone:](_INPBConflictingParameter, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_alternateItems, "copyWithZone:", a3);
  -[_INPBConflictingParameter setAlternateItems:](v5, "setAlternateItems:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_keyPath, "copyWithZone:", a3);
  -[_INPBConflictingParameter setKeyPath:](v5, "setKeyPath:", v7);

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
  -[_INPBConflictingParameter alternateItems](self, "alternateItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternateItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBConflictingParameter alternateItems](self, "alternateItems");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBConflictingParameter alternateItems](self, "alternateItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternateItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBConflictingParameter keyPath](self, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBConflictingParameter keyPath](self, "keyPath");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBConflictingParameter keyPath](self, "keyPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyPath");
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
  uint64_t v3;

  v3 = -[NSArray hash](self->_alternateItems, "hash");
  return -[NSString hash](self->_keyPath, "hash") ^ v3;
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_alternateItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_alternateItems;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alternateItems"));
  }
  if (self->_keyPath)
  {
    -[_INPBConflictingParameter keyPath](self, "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("keyPath"));

  }
  return v3;
}

- (NSArray)alternateItems
{
  return self->_alternateItems;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_alternateItems, 0);
}

+ (Class)alternateItemsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
