@implementation GEOLogMsgStateMapUI

- (int)layoutInfo
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_layoutInfo;
  else
    return 0;
}

- (void)setLayoutInfo:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_layoutInfo = a3;
}

- (void)setHasLayoutInfo:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLayoutInfo
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)layoutInfoAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C23868[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLayoutInfo:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_LAYOUT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MINI_LAYOUT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARTIAL_LAYOUT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FULL_LAYOUT")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasMultiTabsState
{
  return self->_multiTabsState != 0;
}

- (GEOMultiTabsState)multiTabsState
{
  return self->_multiTabsState;
}

- (void)setMultiTabsState:(id)a3
{
  objc_storeStrong((id *)&self->_multiTabsState, a3);
}

- (int)layoutStyle
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_layoutStyle;
  else
    return 0;
}

- (void)setLayoutStyle:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_layoutStyle = a3;
}

- (void)setHasLayoutStyle:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLayoutStyle
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)layoutStyleAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C23888[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLayoutStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_STYLE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STANDARD_STYLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPACT_STYLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIDE_BAR_STYLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLOATING_STYLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("STANDARD_SIDE_STYLE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)landscape
{
  return self->_landscape;
}

- (void)setLandscape:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_landscape = a3;
}

- (void)setHasLandscape:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasLandscape
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)numberOfMapsWindows
{
  return self->_numberOfMapsWindows;
}

- (void)setNumberOfMapsWindows:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_numberOfMapsWindows = a3;
}

- (void)setHasNumberOfMapsWindows:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNumberOfMapsWindows
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)windowSize
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_windowSize;
  else
    return 1;
}

- (void)setWindowSize:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_windowSize = a3;
}

- (void)setHasWindowSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasWindowSize
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)windowSizeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E1C22C68[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWindowSize:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FULL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODERATE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SMALL")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
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
  v8.super_class = (Class)GEOLogMsgStateMapUI;
  -[GEOLogMsgStateMapUI description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateMapUI dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapUI _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  char v12;
  uint64_t v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  unsigned int v19;
  __CFString *v20;
  const __CFString *v21;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 36) & 1) != 0)
  {
    v5 = *(int *)(a1 + 16);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C23868[v5];
    }
    if (a2)
      v7 = CFSTR("layoutInfo");
    else
      v7 = CFSTR("layout_info");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "multiTabsState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("multiTabsState");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("multi_tabs_state");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v12 = *(_BYTE *)(a1 + 36);
  if ((v12 & 2) != 0)
  {
    v13 = *(int *)(a1 + 20);
    if (v13 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C23888[v13];
    }
    if (a2)
      v15 = CFSTR("layoutStyle");
    else
      v15 = CFSTR("layout_style");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

    v12 = *(_BYTE *)(a1 + 36);
  }
  if ((v12 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("landscape"));

    v12 = *(_BYTE *)(a1 + 36);
    if ((v12 & 4) == 0)
    {
LABEL_25:
      if ((v12 & 8) == 0)
        return v4;
      goto LABEL_32;
    }
  }
  else if ((v12 & 4) == 0)
  {
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("numberOfMapsWindows");
  else
    v18 = CFSTR("number_of_maps_windows");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  if ((*(_BYTE *)(a1 + 36) & 8) != 0)
  {
LABEL_32:
    v19 = *(_DWORD *)(a1 + 28) - 1;
    if (v19 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 28));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E1C22C68[v19];
    }
    if (a2)
      v21 = CFSTR("windowSize");
    else
      v21 = CFSTR("window_size");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapUI _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapUI)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapUI *)-[GEOLogMsgStateMapUI _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  GEOMultiTabsState *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("layoutInfo");
      else
        v6 = CFSTR("layout_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN_LAYOUT")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MINI_LAYOUT")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PARTIAL_LAYOUT")) & 1) != 0)
        {
          v9 = 2;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("FULL_LAYOUT")))
        {
          v9 = 3;
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_20;
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setLayoutInfo:", v9);
LABEL_20:

      if (a3)
        v10 = CFSTR("multiTabsState");
      else
        v10 = CFSTR("multi_tabs_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOMultiTabsState alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOMultiTabsState initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOMultiTabsState initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setMultiTabsState:", v13);

      }
      if (a3)
        v15 = CFSTR("layoutStyle");
      else
        v15 = CFSTR("layout_style");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNKNOWN_STYLE")) & 1) != 0)
        {
          v18 = 0;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("STANDARD_STYLE")) & 1) != 0)
        {
          v18 = 1;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("COMPACT_STYLE")) & 1) != 0)
        {
          v18 = 2;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SIDE_BAR_STYLE")) & 1) != 0)
        {
          v18 = 3;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FLOATING_STYLE")) & 1) != 0)
        {
          v18 = 4;
        }
        else if (objc_msgSend(v17, "isEqualToString:", CFSTR("STANDARD_SIDE_STYLE")))
        {
          v18 = 5;
        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_49;
        v18 = objc_msgSend(v16, "intValue");
      }
      objc_msgSend(a1, "setLayoutStyle:", v18);
LABEL_49:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("landscape"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLandscape:", objc_msgSend(v19, "BOOLValue"));

      if (a3)
        v20 = CFSTR("numberOfMapsWindows");
      else
        v20 = CFSTR("number_of_maps_windows");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNumberOfMapsWindows:", objc_msgSend(v21, "unsignedIntValue"));

      if (a3)
        v22 = CFSTR("windowSize");
      else
        v22 = CFSTR("window_size");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v23;
        if ((objc_msgSend(v24, "isEqualToString:", CFSTR("FULL")) & 1) != 0)
        {
          v25 = 1;
        }
        else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
        {
          v25 = 2;
        }
        else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("MODERATE")) & 1) != 0)
        {
          v25 = 3;
        }
        else if (objc_msgSend(v24, "isEqualToString:", CFSTR("SMALL")))
        {
          v25 = 4;
        }
        else
        {
          v25 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_73:

          goto LABEL_74;
        }
        v25 = objc_msgSend(v23, "intValue");
      }
      objc_msgSend(a1, "setWindowSize:", v25);
      goto LABEL_73;
    }
  }
LABEL_74:

  return a1;
}

- (GEOLogMsgStateMapUI)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapUI *)-[GEOLogMsgStateMapUI _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapUIIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapUIReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_multiTabsState)
    PBDataWriterWriteSubmessage();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0)
        goto LABEL_8;
LABEL_13:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_13;
LABEL_8:
  if ((flags & 8) != 0)
LABEL_9:
    PBDataWriterWriteInt32Field();
LABEL_10:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char flags;
  _DWORD *v6;

  v6 = a3;
  -[GEOLogMsgStateMapUI readAll:](self, "readAll:", 0);
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v6[4] = self->_layoutInfo;
    *((_BYTE *)v6 + 36) |= 1u;
  }
  if (self->_multiTabsState)
  {
    objc_msgSend(v6, "setMultiTabsState:");
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v4[5] = self->_layoutStyle;
    *((_BYTE *)v4 + 36) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0)
        goto LABEL_8;
LABEL_13:
      v4[6] = self->_numberOfMapsWindows;
      *((_BYTE *)v4 + 36) |= 4u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)v4 + 32) = self->_landscape;
  *((_BYTE *)v4 + 36) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_13;
LABEL_8:
  if ((flags & 8) != 0)
  {
LABEL_9:
    v4[7] = self->_windowSize;
    *((_BYTE *)v4 + 36) |= 8u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_layoutInfo;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v7 = -[GEOMultiTabsState copyWithZone:](self->_multiTabsState, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_layoutStyle;
    *(_BYTE *)(v6 + 36) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0)
        goto LABEL_6;
LABEL_11:
      *(_DWORD *)(v6 + 24) = self->_numberOfMapsWindows;
      *(_BYTE *)(v6 + 36) |= 4u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        return (id)v6;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 32) = self->_landscape;
  *(_BYTE *)(v6 + 36) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((flags & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 28) = self->_windowSize;
    *(_BYTE *)(v6 + 36) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOMultiTabsState *multiTabsState;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[GEOLogMsgStateMapUI readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 36);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_layoutInfo != *((_DWORD *)v4 + 4))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_32;
  }
  multiTabsState = self->_multiTabsState;
  if ((unint64_t)multiTabsState | *((_QWORD *)v4 + 1))
  {
    if (!-[GEOMultiTabsState isEqual:](multiTabsState, "isEqual:"))
      goto LABEL_32;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 36);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_layoutStyle != *((_DWORD *)v4 + 5))
      goto LABEL_32;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) != 0)
    {
      if (self->_landscape)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_32;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_23;
    }
LABEL_32:
    v8 = 0;
    goto LABEL_33;
  }
  if ((v6 & 0x10) != 0)
    goto LABEL_32;
LABEL_23:
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_numberOfMapsWindows != *((_DWORD *)v4 + 6))
      goto LABEL_32;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_32;
  }
  v8 = (v6 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_windowSize != *((_DWORD *)v4 + 7))
      goto LABEL_32;
    v8 = 1;
  }
LABEL_33:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOLogMsgStateMapUI readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_layoutInfo;
  else
    v3 = 0;
  v4 = -[GEOMultiTabsState hash](self->_multiTabsState, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v5 = 2654435761 * self->_layoutStyle;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_landscape;
      if ((*(_BYTE *)&self->_flags & 4) != 0)
        goto LABEL_7;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_8;
LABEL_12:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = 2654435761 * self->_numberOfMapsWindows;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_12;
LABEL_8:
  v8 = 2654435761 * self->_windowSize;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOMultiTabsState *multiTabsState;
  uint64_t v6;
  char v7;
  int *v8;

  v8 = (int *)a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  if ((v8[9] & 1) != 0)
  {
    self->_layoutInfo = v8[4];
    *(_BYTE *)&self->_flags |= 1u;
  }
  multiTabsState = self->_multiTabsState;
  v6 = *((_QWORD *)v8 + 1);
  if (multiTabsState)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOMultiTabsState mergeFrom:](multiTabsState, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOLogMsgStateMapUI setMultiTabsState:](self, "setMultiTabsState:");
  }
  v4 = v8;
LABEL_9:
  v7 = *((_BYTE *)v4 + 36);
  if ((v7 & 2) != 0)
  {
    self->_layoutStyle = v4[5];
    *(_BYTE *)&self->_flags |= 2u;
    v7 = *((_BYTE *)v4 + 36);
    if ((v7 & 0x10) == 0)
    {
LABEL_11:
      if ((v7 & 4) == 0)
        goto LABEL_12;
LABEL_17:
      self->_numberOfMapsWindows = v4[6];
      *(_BYTE *)&self->_flags |= 4u;
      if ((v4[9] & 8) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v4[9] & 0x10) == 0)
  {
    goto LABEL_11;
  }
  self->_landscape = *((_BYTE *)v4 + 32);
  *(_BYTE *)&self->_flags |= 0x10u;
  v7 = *((_BYTE *)v4 + 36);
  if ((v7 & 4) != 0)
    goto LABEL_17;
LABEL_12:
  if ((v7 & 8) != 0)
  {
LABEL_13:
    self->_windowSize = v4[7];
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_14:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiTabsState, 0);
}

@end
