@implementation GEOSuggestionItem

- (BOOL)hasSuggestionString
{
  return self->_suggestionString != 0;
}

- (NSString)suggestionString
{
  return self->_suggestionString;
}

- (void)setSuggestionString:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionString, a3);
}

- (BOOL)initiallyVisible
{
  return self->_initiallyVisible;
}

- (void)setInitiallyVisible:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_initiallyVisible = a3;
}

- (void)setHasInitiallyVisible:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasInitiallyVisible
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)eventuallyVisible
{
  return self->_eventuallyVisible;
}

- (void)setEventuallyVisible:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_eventuallyVisible = a3;
}

- (void)setHasEventuallyVisible:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEventuallyVisible
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)tappingCount
{
  return self->_tappingCount;
}

- (void)setTappingCount:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_tappingCount = a3;
}

- (void)setHasTappingCount:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTappingCount
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
  v8.super_class = (Class)GEOSuggestionItem;
  -[GEOSuggestionItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSuggestionItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSuggestionItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "suggestionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("suggestionString");
    else
      v6 = CFSTR("suggestion_string");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_BYTE *)(a1 + 24);
  if ((v7 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 21));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("initiallyVisible");
    else
      v9 = CFSTR("initially_visible");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v7 = *(_BYTE *)(a1 + 24);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 1) == 0)
        return v4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)(a1 + 24) & 2) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("eventuallyVisible");
  else
    v11 = CFSTR("eventually_visible");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("tappingCount");
    else
      v13 = CFSTR("tapping_count");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSuggestionItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSuggestionItem)initWithDictionary:(id)a3
{
  return (GEOSuggestionItem *)-[GEOSuggestionItem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("suggestionString");
      else
        v6 = CFSTR("suggestion_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setSuggestionString:", v8);

      }
      if (a3)
        v9 = CFSTR("initiallyVisible");
      else
        v9 = CFSTR("initially_visible");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setInitiallyVisible:", objc_msgSend(v10, "BOOLValue"));

      if (a3)
        v11 = CFSTR("eventuallyVisible");
      else
        v11 = CFSTR("eventually_visible");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setEventuallyVisible:", objc_msgSend(v12, "BOOLValue"));

      if (a3)
        v13 = CFSTR("tappingCount");
      else
        v13 = CFSTR("tapping_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTappingCount:", objc_msgSend(v14, "intValue"));

    }
  }

  return a1;
}

- (GEOSuggestionItem)initWithJSON:(id)a3
{
  return (GEOSuggestionItem *)-[GEOSuggestionItem _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSuggestionItemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSuggestionItemReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_suggestionString)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_7:

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOSuggestionItem readAll:](self, "readAll:", 0);
  if (self->_suggestionString)
    objc_msgSend(v5, "setSuggestionString:");
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *((_BYTE *)v5 + 20) = self->_eventuallyVisible;
    *((_BYTE *)v5 + 24) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_BYTE *)v5 + 21) = self->_initiallyVisible;
  *((_BYTE *)v5 + 24) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 4) = self->_tappingCount;
    *((_BYTE *)v5 + 24) |= 1u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_suggestionString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v5 + 20) = self->_eventuallyVisible;
    *(_BYTE *)(v5 + 24) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_BYTE *)(v5 + 21) = self->_initiallyVisible;
  *(_BYTE *)(v5 + 24) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_tappingCount;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *suggestionString;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOSuggestionItem readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  suggestionString = self->_suggestionString;
  if ((unint64_t)suggestionString | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](suggestionString, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
      goto LABEL_24;
    if (self->_initiallyVisible)
    {
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 21))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) != 0)
    {
      if (self->_eventuallyVisible)
      {
        if (!*((_BYTE *)v4 + 20))
          goto LABEL_24;
        goto LABEL_20;
      }
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_20;
    }
LABEL_24:
    v6 = 0;
    goto LABEL_25;
  }
  if ((*((_BYTE *)v4 + 24) & 2) != 0)
    goto LABEL_24;
LABEL_20:
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_tappingCount != *((_DWORD *)v4 + 4))
      goto LABEL_24;
    v6 = 1;
  }
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOSuggestionItem readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_suggestionString, "hash");
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_initiallyVisible;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_eventuallyVisible;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_tappingCount;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 1))
    -[GEOSuggestionItem setSuggestionString:](self, "setSuggestionString:");
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 4) == 0)
  {
    if ((*((_BYTE *)v5 + 24) & 2) == 0)
      goto LABEL_5;
LABEL_9:
    self->_eventuallyVisible = *((_BYTE *)v5 + 20);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v5 + 24) & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  self->_initiallyVisible = *((_BYTE *)v5 + 21);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((v4 & 1) != 0)
  {
LABEL_6:
    self->_tappingCount = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionString, 0);
}

@end
