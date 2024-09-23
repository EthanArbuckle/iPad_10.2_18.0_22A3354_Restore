@implementation ATXPBInfoEngineCachedSuggestions

- (uint64_t)setLength:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 32) |= 1u;
    *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasLength:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xFE | a2;
  return result;
}

- (uint64_t)hasLength
{
  if (result)
    return *(_BYTE *)(result + 32) & 1;
  return result;
}

- (uint64_t)clearCachedSuggestionIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "removeAllObjects");
  return result;
}

- (void)addCachedSuggestionIds:(uint64_t)a1
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

- (uint64_t)cachedSuggestionIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "count");
  return result;
}

- (id)cachedSuggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[2], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)clearCachedSuggestionSourceIds
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "removeAllObjects");
  return result;
}

- (void)addCachedSuggestionSourceIds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)cachedSuggestionSourceIdsCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 24), "count");
  return result;
}

- (id)cachedSuggestionSourceIdsAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[3], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
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
  v8.super_class = (Class)ATXPBInfoEngineCachedSuggestions;
  -[ATXPBInfoEngineCachedSuggestions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBInfoEngineCachedSuggestions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *cachedSuggestionIds;
  NSMutableArray *cachedSuggestionSourceIds;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_length);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("length"));

  }
  cachedSuggestionIds = self->_cachedSuggestionIds;
  if (cachedSuggestionIds)
    objc_msgSend(v3, "setObject:forKey:", cachedSuggestionIds, CFSTR("cachedSuggestionIds"));
  cachedSuggestionSourceIds = self->_cachedSuggestionSourceIds;
  if (cachedSuggestionSourceIds)
    objc_msgSend(v3, "setObject:forKey:", cachedSuggestionSourceIds, CFSTR("cachedSuggestionSourceIds"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBInfoEngineCachedSuggestionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_cachedSuggestionIds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_cachedSuggestionSourceIds;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  id v11;

  v11 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 32) & 1) != 0)
    {
      *((_QWORD *)v11 + 1) = *(_QWORD *)(a1 + 8);
      *((_BYTE *)v11 + 32) |= 1u;
    }
    if (objc_msgSend(*(id *)(a1 + 16), "count"))
    {
      if (v11)
        objc_msgSend(*((id *)v11 + 2), "removeAllObjects");
      v3 = objc_msgSend(*(id *)(a1 + 16), "count");
      if (v3)
      {
        v4 = v3;
        for (i = 0; i != v4; ++i)
        {
          objc_msgSend(*(id *)(a1 + 16), "objectAtIndex:", i);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionIds:]((uint64_t)v11, v6);

        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 24), "count"))
    {
      if (v11)
        objc_msgSend(*((id *)v11 + 3), "removeAllObjects");
      v7 = objc_msgSend(*(id *)(a1 + 24), "count");
      if (v7)
      {
        v8 = v7;
        for (j = 0; j != v8; ++j)
        {
          objc_msgSend(*(id *)(a1 + 24), "objectAtIndex:", j);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionSourceIds:]((uint64_t)v11, v10);

        }
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
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_length;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_cachedSuggestionIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "copyWithZone:", a3);
        -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionIds:]((uint64_t)v6, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_cachedSuggestionSourceIds;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (_QWORD)v20);
        -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionSourceIds:]((uint64_t)v6, v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *cachedSuggestionIds;
  NSMutableArray *cachedSuggestionSourceIds;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_length != *((_QWORD *)v4 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  cachedSuggestionIds = self->_cachedSuggestionIds;
  if ((unint64_t)cachedSuggestionIds | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](cachedSuggestionIds, "isEqual:"))
  {
    goto LABEL_11;
  }
  cachedSuggestionSourceIds = self->_cachedSuggestionSourceIds;
  if ((unint64_t)cachedSuggestionSourceIds | *((_QWORD *)v4 + 3))
    v7 = -[NSMutableArray isEqual:](cachedSuggestionSourceIds, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_length;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_cachedSuggestionIds, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_cachedSuggestionSourceIds, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id *v3;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (((_BYTE)v3[4] & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = v3[1];
      *(_BYTE *)(a1 + 32) |= 1u;
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = v3[2];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionIds:](a1, *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v4[3];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionSourceIds:](a1, *(void **)(*((_QWORD *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v12);
    }

  }
}

- (uint64_t)length
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)cachedSuggestionIds
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)setCachedSuggestionIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (uint64_t)cachedSuggestionSourceIds
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void)setCachedSuggestionSourceIds:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSuggestionSourceIds, 0);
  objc_storeStrong((id *)&self->_cachedSuggestionIds, 0);
}

@end
