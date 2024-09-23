@implementation GEORPDebugSettings

- (int)mode
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_mode;
  else
    return 0;
}

- (void)setMode:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMode
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)modeAsString:(int)a3
{
  if (a3 < 3)
    return *((id *)&off_1E1C14908 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEBUG_MODE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONITORING_SERVICE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("E2E_TESTING")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSMutableArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_keywords, a3);
}

- (void)clearKeywords
{
  -[NSMutableArray removeAllObjects](self->_keywords, "removeAllObjects");
}

- (void)addKeywords:(id)a3
{
  id v4;
  NSMutableArray *keywords;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  keywords = self->_keywords;
  v8 = v4;
  if (!keywords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_keywords;
    self->_keywords = v6;

    v4 = v8;
    keywords = self->_keywords;
  }
  -[NSMutableArray addObject:](keywords, "addObject:", v4);

}

- (unint64_t)keywordsCount
{
  return -[NSMutableArray count](self->_keywords, "count");
}

- (id)keywordsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keywords, "objectAtIndex:", a3);
}

+ (Class)keywordsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEORPDebugSettings;
  -[GEORPDebugSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPDebugSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      v3 = *(int *)(a1 + 16);
      if (v3 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = (void *)*((_QWORD *)&off_1E1C14908 + v3);
      }
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("mode"));

    }
    if (*(_QWORD *)(a1 + 8))
    {
      objc_msgSend((id)a1, "keywords");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("keywords"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEORPDebugSettings)initWithDictionary:(id)a3
{
  return (GEORPDebugSettings *)-[GEORPDebugSettings _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
    goto LABEL_27;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_27;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DEBUG_MODE_UNKNOWN")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MONITORING_SERVICE")) & 1) != 0)
    {
      v6 = 1;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("E2E_TESTING")))
    {
      v6 = 2;
    }
    else
    {
      v6 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v4, "intValue");
LABEL_14:
    objc_msgSend(a1, "setMode:", v6);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("keywords"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = (void *)objc_msgSend(v13, "copy", (_QWORD)v16);
            objc_msgSend(a1, "addKeywords:", v14);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
LABEL_27:

  return a1;
}

- (GEORPDebugSettings)initWithJSON:(id)a3
{
  return (GEORPDebugSettings *)-[GEORPDebugSettings _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDebugSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDebugSettingsReadAllFrom((uint64_t)self, a3);
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
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_keywords;
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

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _DWORD *v8;

  v8 = a3;
  -[GEORPDebugSettings readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v8[4] = self->_mode;
    *((_BYTE *)v8 + 20) |= 1u;
  }
  if (-[GEORPDebugSettings keywordsCount](self, "keywordsCount"))
  {
    objc_msgSend(v8, "clearKeywords");
    v4 = -[GEORPDebugSettings keywordsCount](self, "keywordsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPDebugSettings keywordsAtIndex:](self, "keywordsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addKeywords:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_mode;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_keywords;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend(v6, "addKeywords:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *keywords;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEORPDebugSettings readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_mode != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  keywords = self->_keywords;
  if ((unint64_t)keywords | *((_QWORD *)v4 + 1))
    v6 = -[NSMutableArray isEqual:](keywords, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEORPDebugSettings readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_mode;
  else
    v3 = 0;
  return -[NSMutableArray hash](self->_keywords, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
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
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_mode = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        -[GEORPDebugSettings addKeywords:](self, "addKeywords:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywords, 0);
}

@end
