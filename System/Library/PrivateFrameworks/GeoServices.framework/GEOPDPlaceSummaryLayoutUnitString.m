@implementation GEOPDPlaceSummaryLayoutUnitString

- (GEOPDPlaceSummaryLayoutUnitString)init
{
  GEOPDPlaceSummaryLayoutUnitString *v2;
  GEOPDPlaceSummaryLayoutUnitString *v3;
  GEOPDPlaceSummaryLayoutUnitString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceSummaryLayoutUnitString;
  v2 = -[GEOPDPlaceSummaryLayoutUnitString init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceSummaryLayoutUnitString)initWithData:(id)a3
{
  GEOPDPlaceSummaryLayoutUnitString *v3;
  GEOPDPlaceSummaryLayoutUnitString *v4;
  GEOPDPlaceSummaryLayoutUnitString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceSummaryLayoutUnitString;
  v3 = -[GEOPDPlaceSummaryLayoutUnitString initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readValue
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readValue_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasValue
{
  -[GEOPDPlaceSummaryLayoutUnitString _readValue]((uint64_t)self);
  return self->_value != 0;
}

- (NSString)value
{
  -[GEOPDPlaceSummaryLayoutUnitString _readValue]((uint64_t)self);
  return self->_value;
}

- (void)setValue:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_value, a3);
}

- (void)_readSymbolName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSymbolName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSymbolName
{
  -[GEOPDPlaceSummaryLayoutUnitString _readSymbolName]((uint64_t)self);
  return self->_symbolName != 0;
}

- (NSString)symbolName
{
  -[GEOPDPlaceSummaryLayoutUnitString _readSymbolName]((uint64_t)self);
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_symbolName, a3);
}

- (void)_readFormats
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormats_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)formats
{
  -[GEOPDPlaceSummaryLayoutUnitString _readFormats]((uint64_t)self);
  return self->_formats;
}

- (void)setFormats:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *formats;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  formats = self->_formats;
  self->_formats = v4;

}

- (void)clearFormats
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_formats, "removeAllObjects");
}

- (void)addFormat:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceSummaryLayoutUnitString _readFormats]((uint64_t)self);
  -[GEOPDPlaceSummaryLayoutUnitString _addNoFlagsFormat:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsFormat:(uint64_t)a1
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

- (unint64_t)formatsCount
{
  -[GEOPDPlaceSummaryLayoutUnitString _readFormats]((uint64_t)self);
  return -[NSMutableArray count](self->_formats, "count");
}

- (id)formatAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryLayoutUnitString _readFormats]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_formats, "objectAtIndex:", a3);
}

+ (Class)formatType
{
  return (Class)objc_opt_class();
}

- (unsigned)serverOverrideIdentifier
{
  return self->_serverOverrideIdentifier;
}

- (void)setServerOverrideIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_serverOverrideIdentifier = a3;
}

- (void)setHasServerOverrideIdentifier:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasServerOverrideIdentifier
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)supportMultiLineWrapping
{
  return self->_supportMultiLineWrapping;
}

- (void)setSupportMultiLineWrapping:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_supportMultiLineWrapping = a3;
}

- (void)setHasSupportMultiLineWrapping:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasSupportMultiLineWrapping
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readSymbolColor
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSymbolColor_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSymbolColor
{
  -[GEOPDPlaceSummaryLayoutUnitString _readSymbolColor]((uint64_t)self);
  return self->_symbolColor != 0;
}

- (NSString)symbolColor
{
  -[GEOPDPlaceSummaryLayoutUnitString _readSymbolColor]((uint64_t)self);
  return self->_symbolColor;
}

- (void)setSymbolColor:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_symbolColor, a3);
}

- (void)_readTextColor
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTextColor_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTextColor
{
  -[GEOPDPlaceSummaryLayoutUnitString _readTextColor]((uint64_t)self);
  return self->_textColor != 0;
}

- (NSString)textColor
{
  -[GEOPDPlaceSummaryLayoutUnitString _readTextColor]((uint64_t)self);
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (void)_readStyleAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_6);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)styleAttributes
{
  -[GEOPDPlaceSummaryLayoutUnitString _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *styleAttributes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  styleAttributes = self->_styleAttributes;
  self->_styleAttributes = v4;

}

- (void)clearStyleAttributes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_styleAttributes, "removeAllObjects");
}

- (void)addStyleAttributes:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceSummaryLayoutUnitString _readStyleAttributes]((uint64_t)self);
  -[GEOPDPlaceSummaryLayoutUnitString _addNoFlagsStyleAttributes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsStyleAttributes:(uint64_t)a1
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

- (unint64_t)styleAttributesCount
{
  -[GEOPDPlaceSummaryLayoutUnitString _readStyleAttributes]((uint64_t)self);
  return -[NSMutableArray count](self->_styleAttributes, "count");
}

- (id)styleAttributesAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryLayoutUnitString _readStyleAttributes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_styleAttributes, "objectAtIndex:", a3);
}

+ (Class)styleAttributesType
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
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitString;
  -[GEOPDPlaceSummaryLayoutUnitString description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceSummaryLayoutUnitString dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitString _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int16 v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  const __CFString *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("value"));

  objc_msgSend((id)a1, "symbolName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (a2)
      v7 = CFSTR("symbolName");
    else
      v7 = CFSTR("symbol_name");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);
  }

  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = *(id *)(a1 + 16);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("format"));
  }
  v16 = *(_WORD *)(a1 + 84);
  if ((v16 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("serverOverrideIdentifier");
    else
      v18 = CFSTR("server_override_identifier");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    v16 = *(_WORD *)(a1 + 84);
  }
  if ((v16 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("supportMultiLineWrapping");
    else
      v20 = CFSTR("support_multi_line_wrapping");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  objc_msgSend((id)a1, "symbolColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (a2)
      v22 = CFSTR("symbolColor");
    else
      v22 = CFSTR("symbol_color");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);
  }

  objc_msgSend((id)a1, "textColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if (a2)
      v24 = CFSTR("textColor");
    else
      v24 = CFSTR("text_color");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);
  }

  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = *(id *)(a1 + 24);
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v31, "jsonRepresentation");
          else
            objc_msgSend(v31, "dictionaryRepresentation", (_QWORD)v35);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v32, (_QWORD)v35);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v28);
    }

    if (a2)
      v33 = CFSTR("styleAttributes");
    else
      v33 = CFSTR("style_attributes");
    objc_msgSend(v4, "setObject:forKey:", v25, v33, (_QWORD)v35);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitString _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutUnitString)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitString *)-[GEOPDPlaceSummaryLayoutUnitString _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOPDPlaceSummaryFormat *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  GEOStyleAttributes *v39;
  uint64_t v40;
  void *v41;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setValue:", v7);

      }
      if (a3)
        v8 = CFSTR("symbolName");
      else
        v8 = CFSTR("symbol_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(a1, "setSymbolName:", v10);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("format"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v43 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v49 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = [GEOPDPlaceSummaryFormat alloc];
                if ((a3 & 1) != 0)
                  v19 = -[GEOPDPlaceSummaryFormat initWithJSON:](v18, "initWithJSON:", v17);
                else
                  v19 = -[GEOPDPlaceSummaryFormat initWithDictionary:](v18, "initWithDictionary:", v17);
                v20 = (void *)v19;
                objc_msgSend(a1, "addFormat:", v19);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
          }
          while (v14);
        }

        v5 = v43;
      }

      if (a3)
        v21 = CFSTR("serverOverrideIdentifier");
      else
        v21 = CFSTR("server_override_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setServerOverrideIdentifier:", objc_msgSend(v22, "unsignedIntValue"));

      if (a3)
        v23 = CFSTR("supportMultiLineWrapping");
      else
        v23 = CFSTR("support_multi_line_wrapping");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSupportMultiLineWrapping:", objc_msgSend(v24, "BOOLValue"));

      if (a3)
        v25 = CFSTR("symbolColor");
      else
        v25 = CFSTR("symbol_color");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = (void *)objc_msgSend(v26, "copy");
        objc_msgSend(a1, "setSymbolColor:", v27);

      }
      if (a3)
        v28 = CFSTR("textColor");
      else
        v28 = CFSTR("text_color");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = (void *)objc_msgSend(v29, "copy");
        objc_msgSend(a1, "setTextColor:", v30);

      }
      if (a3)
        v31 = CFSTR("styleAttributes");
      else
        v31 = CFSTR("style_attributes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v33 = v32;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v45 != v36)
                objc_enumerationMutation(v33);
              v38 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v39 = [GEOStyleAttributes alloc];
                if ((a3 & 1) != 0)
                  v40 = -[GEOStyleAttributes initWithJSON:](v39, "initWithJSON:", v38);
                else
                  v40 = -[GEOStyleAttributes initWithDictionary:](v39, "initWithDictionary:", v38);
                v41 = (void *)v40;
                objc_msgSend(a1, "addStyleAttributes:", v40);

              }
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v35);
        }

        v5 = v43;
      }

    }
  }

  return a1;
}

- (GEOPDPlaceSummaryLayoutUnitString)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitString *)-[GEOPDPlaceSummaryLayoutUnitString _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_1007;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1008;
    GEOPDPlaceSummaryLayoutUnitStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDPlaceSummaryLayoutUnitStringCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitStringIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitStringReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 flags;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1FC) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceSummaryLayoutUnitString readAll:](self, "readAll:", 0);
    if (self->_value)
      PBDataWriterWriteStringField();
    if (self->_symbolName)
      PBDataWriterWriteStringField();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_formats;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_symbolColor)
      PBDataWriterWriteStringField();
    if (self->_textColor)
      PBDataWriterWriteStringField();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_styleAttributes;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }

  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOPDPlaceSummaryLayoutUnitString _readFormats]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_formats;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  __int16 flags;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id *v13;

  v13 = (id *)a3;
  -[GEOPDPlaceSummaryLayoutUnitString readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 16) = self->_readerMarkPos;
  *((_DWORD *)v13 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_value)
    objc_msgSend(v13, "setValue:");
  if (self->_symbolName)
    objc_msgSend(v13, "setSymbolName:");
  if (-[GEOPDPlaceSummaryLayoutUnitString formatsCount](self, "formatsCount"))
  {
    objc_msgSend(v13, "clearFormats");
    v4 = -[GEOPDPlaceSummaryLayoutUnitString formatsCount](self, "formatsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPDPlaceSummaryLayoutUnitString formatAtIndex:](self, "formatAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addFormat:", v7);

      }
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v13 + 19) = self->_serverOverrideIdentifier;
    *((_WORD *)v13 + 42) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v13 + 80) = self->_supportMultiLineWrapping;
    *((_WORD *)v13 + 42) |= 2u;
  }
  if (self->_symbolColor)
    objc_msgSend(v13, "setSymbolColor:");
  if (self->_textColor)
    objc_msgSend(v13, "setTextColor:");
  if (-[GEOPDPlaceSummaryLayoutUnitString styleAttributesCount](self, "styleAttributesCount"))
  {
    objc_msgSend(v13, "clearStyleAttributes");
    v9 = -[GEOPDPlaceSummaryLayoutUnitString styleAttributesCount](self, "styleAttributesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOPDPlaceSummaryLayoutUnitString styleAttributesAtIndex:](self, "styleAttributesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addStyleAttributes:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int16 flags;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceSummaryLayoutUnitStringReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceSummaryLayoutUnitString readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v11 = -[NSString copyWithZone:](self->_symbolName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = self->_formats;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addFormat:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v14);
  }

  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_serverOverrideIdentifier;
    *(_WORD *)(v5 + 84) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_supportMultiLineWrapping;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  v19 = -[NSString copyWithZone:](self->_symbolColor, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v19;

  v21 = -[NSString copyWithZone:](self->_textColor, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v21;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = self->_styleAttributes;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v8);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend((id)v5, "addStyleAttributes:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v23);
  }
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *value;
  NSString *symbolName;
  NSMutableArray *formats;
  __int16 flags;
  __int16 v9;
  NSString *symbolColor;
  NSString *textColor;
  NSMutableArray *styleAttributes;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEOPDPlaceSummaryLayoutUnitString readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](value, "isEqual:"))
      goto LABEL_27;
  }
  symbolName = self->_symbolName;
  if ((unint64_t)symbolName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](symbolName, "isEqual:"))
      goto LABEL_27;
  }
  formats = self->_formats;
  if ((unint64_t)formats | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](formats, "isEqual:"))
      goto LABEL_27;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 42);
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_serverOverrideIdentifier != *((_DWORD *)v4 + 19))
      goto LABEL_27;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_27;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) != 0)
    {
      if (self->_supportMultiLineWrapping)
      {
        if (!*((_BYTE *)v4 + 80))
          goto LABEL_27;
        goto LABEL_21;
      }
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_21;
    }
LABEL_27:
    v13 = 0;
    goto LABEL_28;
  }
  if ((v9 & 2) != 0)
    goto LABEL_27;
LABEL_21:
  symbolColor = self->_symbolColor;
  if ((unint64_t)symbolColor | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](symbolColor, "isEqual:"))
  {
    goto LABEL_27;
  }
  textColor = self->_textColor;
  if ((unint64_t)textColor | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](textColor, "isEqual:"))
      goto LABEL_27;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 3))
    v13 = -[NSMutableArray isEqual:](styleAttributes, "isEqual:");
  else
    v13 = 1;
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  __int16 flags;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;

  -[GEOPDPlaceSummaryLayoutUnitString readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_value, "hash");
  v4 = -[NSString hash](self->_symbolName, "hash");
  v5 = -[NSMutableArray hash](self->_formats, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v7 = 2654435761 * self->_serverOverrideIdentifier;
    if ((flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v7 = 0;
  if ((flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v8 = 2654435761 * self->_supportMultiLineWrapping;
LABEL_6:
  v9 = v4 ^ v3 ^ v5 ^ v7;
  v10 = v8 ^ -[NSString hash](self->_symbolColor, "hash");
  v11 = v9 ^ v10 ^ -[NSString hash](self->_textColor, "hash");
  return v11 ^ -[NSMutableArray hash](self->_styleAttributes, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 7))
    -[GEOPDPlaceSummaryLayoutUnitString setValue:](self, "setValue:");
  if (*((_QWORD *)v4 + 5))
    -[GEOPDPlaceSummaryLayoutUnitString setSymbolName:](self, "setSymbolName:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        -[GEOPDPlaceSummaryLayoutUnitString addFormat:](self, "addFormat:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v10 = *((_WORD *)v4 + 42);
  if ((v10 & 1) != 0)
  {
    self->_serverOverrideIdentifier = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 1u;
    v10 = *((_WORD *)v4 + 42);
  }
  if ((v10 & 2) != 0)
  {
    self->_supportMultiLineWrapping = *((_BYTE *)v4 + 80);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 4))
    -[GEOPDPlaceSummaryLayoutUnitString setSymbolColor:](self, "setSymbolColor:");
  if (*((_QWORD *)v4 + 6))
    -[GEOPDPlaceSummaryLayoutUnitString setTextColor:](self, "setTextColor:");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v4 + 3);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[GEOPDPlaceSummaryLayoutUnitString addStyleAttributes:](self, "addStyleAttributes:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_symbolColor, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_formats, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
