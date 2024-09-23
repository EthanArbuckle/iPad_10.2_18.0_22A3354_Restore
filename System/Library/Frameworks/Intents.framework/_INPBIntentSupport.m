@implementation _INPBIntentSupport

- (void)setIntentsRestrictedWhileLockeds:(id)a3
{
  NSArray *v4;
  NSArray *intentsRestrictedWhileLockeds;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentsRestrictedWhileLockeds = self->_intentsRestrictedWhileLockeds;
  self->_intentsRestrictedWhileLockeds = v4;

}

- (void)clearIntentsRestrictedWhileLockeds
{
  -[NSArray removeAllObjects](self->_intentsRestrictedWhileLockeds, "removeAllObjects");
}

- (void)addIntentsRestrictedWhileLocked:(id)a3
{
  id v4;
  NSArray *intentsRestrictedWhileLockeds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentsRestrictedWhileLockeds = self->_intentsRestrictedWhileLockeds;
  v8 = v4;
  if (!intentsRestrictedWhileLockeds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentsRestrictedWhileLockeds;
    self->_intentsRestrictedWhileLockeds = v6;

    v4 = v8;
    intentsRestrictedWhileLockeds = self->_intentsRestrictedWhileLockeds;
  }
  -[NSArray addObject:](intentsRestrictedWhileLockeds, "addObject:", v4);

}

- (unint64_t)intentsRestrictedWhileLockedsCount
{
  return -[NSArray count](self->_intentsRestrictedWhileLockeds, "count");
}

- (id)intentsRestrictedWhileLockedAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentsRestrictedWhileLockeds, "objectAtIndexedSubscript:", a3);
}

- (void)setIntentsSupporteds:(id)a3
{
  NSArray *v4;
  NSArray *intentsSupporteds;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentsSupporteds = self->_intentsSupporteds;
  self->_intentsSupporteds = v4;

}

- (void)clearIntentsSupporteds
{
  -[NSArray removeAllObjects](self->_intentsSupporteds, "removeAllObjects");
}

- (void)addIntentsSupported:(id)a3
{
  id v4;
  NSArray *intentsSupporteds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentsSupporteds = self->_intentsSupporteds;
  v8 = v4;
  if (!intentsSupporteds)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentsSupporteds;
    self->_intentsSupporteds = v6;

    v4 = v8;
    intentsSupporteds = self->_intentsSupporteds;
  }
  -[NSArray addObject:](intentsSupporteds, "addObject:", v4);

}

- (unint64_t)intentsSupportedsCount
{
  return -[NSArray count](self->_intentsSupporteds, "count");
}

- (id)intentsSupportedAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentsSupporteds, "objectAtIndexedSubscript:", a3);
}

- (void)setSupportedMediaCategories:(id)a3
{
  NSArray *v4;
  NSArray *supportedMediaCategories;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  supportedMediaCategories = self->_supportedMediaCategories;
  self->_supportedMediaCategories = v4;

}

- (void)clearSupportedMediaCategories
{
  -[NSArray removeAllObjects](self->_supportedMediaCategories, "removeAllObjects");
}

- (void)addSupportedMediaCategories:(id)a3
{
  id v4;
  NSArray *supportedMediaCategories;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  supportedMediaCategories = self->_supportedMediaCategories;
  v8 = v4;
  if (!supportedMediaCategories)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_supportedMediaCategories;
    self->_supportedMediaCategories = v6;

    v4 = v8;
    supportedMediaCategories = self->_supportedMediaCategories;
  }
  -[NSArray addObject:](supportedMediaCategories, "addObject:", v4);

}

- (unint64_t)supportedMediaCategoriesCount
{
  return -[NSArray count](self->_supportedMediaCategories, "count");
}

- (id)supportedMediaCategoriesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_supportedMediaCategories, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentSupportReadFrom(self, (uint64_t)a3);
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
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_intentsRestrictedWhileLockeds;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_intentsSupporteds;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_supportedMediaCategories;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (_INPBIntentSupport)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentSupport *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentSupport *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentSupport *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentSupport initWithData:](self, "initWithData:", v6);

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
  -[_INPBIntentSupport data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentSupport *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[_INPBIntentSupport init](+[_INPBIntentSupport allocWithZone:](_INPBIntentSupport, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_intentsRestrictedWhileLockeds, "copyWithZone:", a3);
  -[_INPBIntentSupport setIntentsRestrictedWhileLockeds:](v5, "setIntentsRestrictedWhileLockeds:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_intentsSupporteds, "copyWithZone:", a3);
  -[_INPBIntentSupport setIntentsSupporteds:](v5, "setIntentsSupporteds:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_supportedMediaCategories, "copyWithZone:", a3);
  -[_INPBIntentSupport setSupportedMediaCategories:](v5, "setSupportedMediaCategories:", v8);

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
  -[_INPBIntentSupport intentsRestrictedWhileLockeds](self, "intentsRestrictedWhileLockeds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentsRestrictedWhileLockeds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBIntentSupport intentsRestrictedWhileLockeds](self, "intentsRestrictedWhileLockeds");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntentSupport intentsRestrictedWhileLockeds](self, "intentsRestrictedWhileLockeds");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentsRestrictedWhileLockeds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBIntentSupport intentsSupporteds](self, "intentsSupporteds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentsSupporteds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBIntentSupport intentsSupporteds](self, "intentsSupporteds");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBIntentSupport intentsSupporteds](self, "intentsSupporteds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentsSupporteds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBIntentSupport supportedMediaCategories](self, "supportedMediaCategories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedMediaCategories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBIntentSupport supportedMediaCategories](self, "supportedMediaCategories");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBIntentSupport supportedMediaCategories](self, "supportedMediaCategories");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "supportedMediaCategories");
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
  uint64_t v4;

  v3 = -[NSArray hash](self->_intentsRestrictedWhileLockeds, "hash");
  v4 = -[NSArray hash](self->_intentsSupporteds, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_supportedMediaCategories, "hash");
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_intentsRestrictedWhileLockeds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v5 = self->_intentsRestrictedWhileLockeds;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("intents_restricted_while_locked"));
  }
  if (-[NSArray count](self->_intentsSupporteds, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = self->_intentsSupporteds;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "dictionaryRepresentation", (_QWORD)v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("intents_supported"));
  }
  if (self->_supportedMediaCategories)
  {
    -[_INPBIntentSupport supportedMediaCategories](self, "supportedMediaCategories");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("supported_media_categories"));

  }
  return v3;
}

- (NSArray)intentsRestrictedWhileLockeds
{
  return self->_intentsRestrictedWhileLockeds;
}

- (NSArray)intentsSupporteds
{
  return self->_intentsSupporteds;
}

- (NSArray)supportedMediaCategories
{
  return self->_supportedMediaCategories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMediaCategories, 0);
  objc_storeStrong((id *)&self->_intentsSupporteds, 0);
  objc_storeStrong((id *)&self->_intentsRestrictedWhileLockeds, 0);
}

+ (Class)intentsRestrictedWhileLockedType
{
  return (Class)objc_opt_class();
}

+ (Class)intentsSupportedType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
