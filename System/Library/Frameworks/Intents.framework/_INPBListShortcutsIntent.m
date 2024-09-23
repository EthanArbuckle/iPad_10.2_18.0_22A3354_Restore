@implementation _INPBListShortcutsIntent

- (void)setAppTitles:(id)a3
{
  NSArray *v4;
  NSArray *appTitles;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  appTitles = self->_appTitles;
  self->_appTitles = v4;

}

- (void)clearAppTitles
{
  -[NSArray removeAllObjects](self->_appTitles, "removeAllObjects");
}

- (void)addAppTitle:(id)a3
{
  id v4;
  NSArray *appTitles;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  appTitles = self->_appTitles;
  v8 = v4;
  if (!appTitles)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_appTitles;
    self->_appTitles = v6;

    v4 = v8;
    appTitles = self->_appTitles;
  }
  -[NSArray addObject:](appTitles, "addObject:", v4);

}

- (unint64_t)appTitlesCount
{
  return -[NSArray count](self->_appTitles, "count");
}

- (id)appTitleAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_appTitles, "objectAtIndexedSubscript:", a3);
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setOriginDevice:(int)a3
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
    self->_originDevice = a3;
  }
}

- (BOOL)hasOriginDevice
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasOriginDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)originDeviceAsString:(int)a3
{
  if ((a3 - 1) < 7)
    return *(&off_1E2293FE8 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOriginDevice:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_POD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_TV")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAC")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBListShortcutsIntentReadFrom(self, (uint64_t)a3);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_appTitles;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[_INPBListShortcutsIntent intentMetadata](self, "intentMetadata", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBListShortcutsIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBListShortcutsIntent hasOriginDevice](self, "hasOriginDevice"))
    PBDataWriterWriteInt32Field();

}

- (_INPBListShortcutsIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBListShortcutsIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBListShortcutsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBListShortcutsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBListShortcutsIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBListShortcutsIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBListShortcutsIntent *v5;
  void *v6;
  id v7;

  v5 = -[_INPBListShortcutsIntent init](+[_INPBListShortcutsIntent allocWithZone:](_INPBListShortcutsIntent, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_appTitles, "copyWithZone:", a3);
  -[_INPBListShortcutsIntent setAppTitles:](v5, "setAppTitles:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBListShortcutsIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  if (-[_INPBListShortcutsIntent hasOriginDevice](self, "hasOriginDevice"))
    -[_INPBListShortcutsIntent setOriginDevice:](v5, "setOriginDevice:", -[_INPBListShortcutsIntent originDevice](self, "originDevice"));
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
  BOOL v17;
  int v19;
  int originDevice;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBListShortcutsIntent appTitles](self, "appTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appTitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBListShortcutsIntent appTitles](self, "appTitles");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBListShortcutsIntent appTitles](self, "appTitles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appTitles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBListShortcutsIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_INPBListShortcutsIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBListShortcutsIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = -[_INPBListShortcutsIntent hasOriginDevice](self, "hasOriginDevice");
  if (v19 == objc_msgSend(v4, "hasOriginDevice"))
  {
    if (!-[_INPBListShortcutsIntent hasOriginDevice](self, "hasOriginDevice")
      || !objc_msgSend(v4, "hasOriginDevice")
      || (originDevice = self->_originDevice, originDevice == objc_msgSend(v4, "originDevice")))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSArray hash](self->_appTitles, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBListShortcutsIntent hasOriginDevice](self, "hasOriginDevice"))
    v5 = 2654435761 * self->_originDevice;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  if (-[NSArray count](self->_appTitles, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_appTitles;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("appTitle"));
  }
  -[_INPBListShortcutsIntent intentMetadata](self, "intentMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("intentMetadata"));

  if (-[_INPBListShortcutsIntent hasOriginDevice](self, "hasOriginDevice"))
  {
    v13 = -[_INPBListShortcutsIntent originDevice](self, "originDevice");
    if ((v13 - 1) >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = *(&off_1E2293FE8 + (v13 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("originDevice"));

  }
  return v3;
}

- (NSArray)appTitles
{
  return self->_appTitles;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)originDevice
{
  return self->_originDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_appTitles, 0);
}

+ (Class)appTitleType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
