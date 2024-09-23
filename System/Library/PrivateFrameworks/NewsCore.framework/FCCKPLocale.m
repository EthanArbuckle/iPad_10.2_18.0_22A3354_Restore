@implementation FCCKPLocale

- (void)setRegionCode:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setLanguageCode:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_enabledKeyboards, 0);
  objc_storeStrong((id *)&self->_activeKeyboard, 0);
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

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_languageCode)
    PBDataWriterWriteStringField();
  if (self->_regionCode)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_enabledKeyboards;
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

  if (self->_activeKeyboard)
    PBDataWriterWriteStringField();

}

- (void)addEnabledKeyboards:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)FCCKPLocale;
  -[FCCKPLocale description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKPLocale dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *languageCode;
  NSString *regionCode;
  NSMutableArray *enabledKeyboards;
  NSString *activeKeyboard;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  languageCode = self->_languageCode;
  if (languageCode)
    objc_msgSend(v3, "setObject:forKey:", languageCode, CFSTR("languageCode"));
  regionCode = self->_regionCode;
  if (regionCode)
    objc_msgSend(v4, "setObject:forKey:", regionCode, CFSTR("regionCode"));
  enabledKeyboards = self->_enabledKeyboards;
  if (enabledKeyboards)
    objc_msgSend(v4, "setObject:forKey:", enabledKeyboards, CFSTR("enabledKeyboards"));
  activeKeyboard = self->_activeKeyboard;
  if (activeKeyboard)
    objc_msgSend(v4, "setObject:forKey:", activeKeyboard, CFSTR("activeKeyboard"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPLocaleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_languageCode, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_regionCode, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_enabledKeyboards;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v19);
        -[FCCKPLocale addEnabledKeyboards:]((uint64_t)v5, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v16 = -[NSString copyWithZone:](self->_activeKeyboard, "copyWithZone:", a3);
  v17 = (void *)v5[1];
  v5[1] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *languageCode;
  NSString *regionCode;
  NSMutableArray *enabledKeyboards;
  NSString *activeKeyboard;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((languageCode = self->_languageCode, !((unint64_t)languageCode | v4[3]))
     || -[NSString isEqual:](languageCode, "isEqual:"))
    && ((regionCode = self->_regionCode, !((unint64_t)regionCode | v4[4]))
     || -[NSString isEqual:](regionCode, "isEqual:"))
    && ((enabledKeyboards = self->_enabledKeyboards, !((unint64_t)enabledKeyboards | v4[2]))
     || -[NSMutableArray isEqual:](enabledKeyboards, "isEqual:")))
  {
    activeKeyboard = self->_activeKeyboard;
    if ((unint64_t)activeKeyboard | v4[1])
      v9 = -[NSString isEqual:](activeKeyboard, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_languageCode, "hash");
  v4 = -[NSString hash](self->_regionCode, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_enabledKeyboards, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_activeKeyboard, "hash");
}

@end
