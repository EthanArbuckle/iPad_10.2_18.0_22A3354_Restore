@implementation GEORPSuggestionEntry

- (int)type
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E1C0EF60[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTION_TYPE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTION_TYPE_SERVER_SEARCH_COMPLETION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTION_TYPE_ADDRESS_BOOK_CONTACT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTION_TYPE_ROUTINE_SUGGESTION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTION_TYPE_HISTORY_DIRECTIONS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTION_TYPE_HISTORY_PLACE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTION_TYPE_HISTORY_SEARCH")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTION_TYPE_RECENT_CONTACT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTION_TYPE_SEARCH_SUGGESTION")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSMutableArray)displayLines
{
  return self->_displayLines;
}

- (void)setDisplayLines:(id)a3
{
  objc_storeStrong((id *)&self->_displayLines, a3);
}

- (void)clearDisplayLines
{
  -[NSMutableArray removeAllObjects](self->_displayLines, "removeAllObjects");
}

- (void)addDisplayLine:(id)a3
{
  id v4;
  NSMutableArray *displayLines;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  displayLines = self->_displayLines;
  v8 = v4;
  if (!displayLines)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_displayLines;
    self->_displayLines = v6;

    v4 = v8;
    displayLines = self->_displayLines;
  }
  -[NSMutableArray addObject:](displayLines, "addObject:", v4);

}

- (unint64_t)displayLinesCount
{
  return -[NSMutableArray count](self->_displayLines, "count");
}

- (id)displayLineAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_displayLines, "objectAtIndex:", a3);
}

+ (Class)displayLineType
{
  return (Class)objc_opt_class();
}

- (unsigned)serverSearchCompletionSectionIndex
{
  return self->_serverSearchCompletionSectionIndex;
}

- (void)setServerSearchCompletionSectionIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_serverSearchCompletionSectionIndex = a3;
}

- (void)setHasServerSearchCompletionSectionIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasServerSearchCompletionSectionIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)serverSearchCompletionEntryIndex
{
  return self->_serverSearchCompletionEntryIndex;
}

- (void)setServerSearchCompletionEntryIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_serverSearchCompletionEntryIndex = a3;
}

- (void)setHasServerSearchCompletionEntryIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasServerSearchCompletionEntryIndex
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEORPSuggestionEntry;
  -[GEORPSuggestionEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPSuggestionEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPSuggestionEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  char v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 28) & 4) != 0)
    {
      v5 = *(int *)(a1 + 24);
      if (v5 >= 9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C0EF60[v5];
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    }
    if (*(_QWORD *)(a1 + 8))
    {
      objc_msgSend((id)a1, "displayLines");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v8 = CFSTR("displayLine");
      else
        v8 = CFSTR("display_line");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    v9 = *(_BYTE *)(a1 + 28);
    if ((v9 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v11 = CFSTR("serverSearchCompletionSectionIndex");
      else
        v11 = CFSTR("server_search_completion_section_index");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

      v9 = *(_BYTE *)(a1 + 28);
    }
    if ((v9 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v13 = CFSTR("serverSearchCompletionEntryIndex");
      else
        v13 = CFSTR("server_search_completion_entry_index");
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPSuggestionEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPSuggestionEntry)initWithDictionary:(id)a3
{
  return (GEORPSuggestionEntry *)-[GEORPSuggestionEntry _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_52;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_52;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SUGGESTION_TYPE_NONE")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SUGGESTION_TYPE_SERVER_SEARCH_COMPLETION")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SUGGESTION_TYPE_ADDRESS_BOOK_CONTACT")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SUGGESTION_TYPE_ROUTINE_SUGGESTION")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SUGGESTION_TYPE_HISTORY_DIRECTIONS")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SUGGESTION_TYPE_HISTORY_PLACE")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SUGGESTION_TYPE_HISTORY_SEARCH")) & 1) != 0)
    {
      v8 = 6;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SUGGESTION_TYPE_RECENT_CONTACT")) & 1) != 0)
    {
      v8 = 7;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("SUGGESTION_TYPE_SEARCH_SUGGESTION")))
    {
      v8 = 8;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_26:
    objc_msgSend(a1, "setType:", v8);
  }

  if (a3)
    v9 = CFSTR("displayLine");
  else
    v9 = CFSTR("display_line");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = (void *)objc_msgSend(v16, "copy", (_QWORD)v23);
            objc_msgSend(a1, "addDisplayLine:", v17);

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

  }
  if (a3)
    v18 = CFSTR("serverSearchCompletionSectionIndex");
  else
    v18 = CFSTR("server_search_completion_section_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18, (_QWORD)v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setServerSearchCompletionSectionIndex:", objc_msgSend(v19, "unsignedIntValue"));

  if (a3)
    v20 = CFSTR("serverSearchCompletionEntryIndex");
  else
    v20 = CFSTR("server_search_completion_entry_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setServerSearchCompletionEntryIndex:", objc_msgSend(v21, "unsignedIntValue"));

LABEL_52:
  return a1;
}

- (GEORPSuggestionEntry)initWithJSON:(id)a3
{
  return (GEORPSuggestionEntry *)-[GEORPSuggestionEntry _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPSuggestionEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPSuggestionEntryReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_displayLines;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  _DWORD *v9;

  v9 = a3;
  -[GEORPSuggestionEntry readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v9[6] = self->_type;
    *((_BYTE *)v9 + 28) |= 4u;
  }
  if (-[GEORPSuggestionEntry displayLinesCount](self, "displayLinesCount"))
  {
    objc_msgSend(v9, "clearDisplayLines");
    v4 = -[GEORPSuggestionEntry displayLinesCount](self, "displayLinesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPSuggestionEntry displayLineAtIndex:](self, "displayLineAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addDisplayLine:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v9[5] = self->_serverSearchCompletionSectionIndex;
    *((_BYTE *)v9 + 28) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v9[4] = self->_serverSearchCompletionEntryIndex;
    *((_BYTE *)v9 + 28) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char flags;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(_BYTE *)(v5 + 28) |= 4u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_displayLines;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v6, "addDisplayLine:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_serverSearchCompletionSectionIndex;
    *(_BYTE *)(v6 + 28) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_serverSearchCompletionEntryIndex;
    *(_BYTE *)(v6 + 28) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *displayLines;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEORPSuggestionEntry readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 28);
  if ((flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_type != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  displayLines = self->_displayLines;
  if ((unint64_t)displayLines | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](displayLines, "isEqual:"))
    {
LABEL_19:
      v8 = 0;
      goto LABEL_20;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 28);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_serverSearchCompletionSectionIndex != *((_DWORD *)v4 + 5))
      goto LABEL_19;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_19;
  }
  v8 = (v6 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_serverSearchCompletionEntryIndex != *((_DWORD *)v4 + 4))
      goto LABEL_19;
    v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEORPSuggestionEntry readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_displayLines, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v5 = 2654435761 * self->_serverSearchCompletionSectionIndex;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_serverSearchCompletionEntryIndex;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_flags |= 4u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[GEORPSuggestionEntry addDisplayLine:](self, "addDisplayLine:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 28);
  if ((v10 & 2) != 0)
  {
    self->_serverSearchCompletionSectionIndex = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_flags |= 2u;
    v10 = *((_BYTE *)v4 + 28);
  }
  if ((v10 & 1) != 0)
  {
    self->_serverSearchCompletionEntryIndex = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLines, 0);
}

@end
