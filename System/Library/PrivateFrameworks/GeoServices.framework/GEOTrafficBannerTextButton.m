@implementation GEOTrafficBannerTextButton

- (BOOL)hasText
{
  return self->_text != 0;
}

- (GEOFormattedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (int)action
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_action;
  else
    return 0;
}

- (void)setAction:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C08758[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISMISS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ACCEPT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)buttonDisplay
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_buttonDisplay;
  else
    return 0;
}

- (void)setButtonDisplay:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_buttonDisplay = a3;
}

- (void)setHasButtonDisplay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasButtonDisplay
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)buttonDisplayAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C08770[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsButtonDisplay:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISPLAY_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISPLAY_DEFAULT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DISPLAY_AFTER_USER_INTERACTION")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
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
  v8.super_class = (Class)GEOTrafficBannerTextButton;
  -[GEOTrafficBannerTextButton description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTrafficBannerTextButton dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrafficBannerTextButton _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("text"));

  }
  v8 = *(_BYTE *)(a1 + 32);
  if ((v8 & 1) != 0)
  {
    v9 = *(int *)(a1 + 24);
    if (v9 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C08758[v9];
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("action"));

    v8 = *(_BYTE *)(a1 + 32);
  }
  if ((v8 & 2) != 0)
  {
    v11 = *(int *)(a1 + 28);
    if (v11 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 28));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C08770[v11];
    }
    if (a2)
      v13 = CFSTR("buttonDisplay");
    else
      v13 = CFSTR("button_display");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  v14 = *(void **)(a1 + 8);
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __56__GEOTrafficBannerTextButton__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v18 = v17;
      v22 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTrafficBannerTextButton _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOTrafficBannerTextButton__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOTrafficBannerTextButton)initWithDictionary:(id)a3
{
  return (GEOTrafficBannerTextButton *)-[GEOTrafficBannerTextButton _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOFormattedString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("text"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOFormattedString initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOFormattedString initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setText:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("action"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
        {
          v12 = 0;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("DISMISS")) & 1) != 0)
        {
          v12 = 1;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ACCEPT")))
        {
          v12 = 2;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_20;
        v12 = objc_msgSend(v10, "intValue");
      }
      objc_msgSend(a1, "setAction:", v12);
LABEL_20:

      if (a3)
        v13 = CFSTR("buttonDisplay");
      else
        v13 = CFSTR("button_display");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("DISPLAY_UNKNOWN")) & 1) != 0)
        {
          v16 = 0;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("DISPLAY_DEFAULT")) & 1) != 0)
        {
          v16 = 1;
        }
        else if (objc_msgSend(v15, "isEqualToString:", CFSTR("DISPLAY_AFTER_USER_INTERACTION")))
        {
          v16 = 2;
        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_35:

          goto LABEL_36;
        }
        v16 = objc_msgSend(v14, "intValue");
      }
      objc_msgSend(a1, "setButtonDisplay:", v16);
      goto LABEL_35;
    }
  }
LABEL_36:

  return a1;
}

- (GEOTrafficBannerTextButton)initWithJSON:(id)a3
{
  return (GEOTrafficBannerTextButton *)-[GEOTrafficBannerTextButton _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrafficBannerTextButtonIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrafficBannerTextButtonReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_text)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOTrafficBannerTextButton readAll:](self, "readAll:", 0);
  if (self->_text)
    objc_msgSend(v5, "setText:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_action;
    *((_BYTE *)v5 + 32) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 7) = self->_buttonDisplay;
    *((_BYTE *)v5 + 32) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOFormattedString copyWithZone:](self->_text, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_action;
    *(_BYTE *)(v5 + 32) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_buttonDisplay;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOFormattedString *text;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOTrafficBannerTextButton readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  text = self->_text;
  if ((unint64_t)text | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOFormattedString isEqual:](text, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_action != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_buttonDisplay != *((_DWORD *)v4 + 7))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOTrafficBannerTextButton readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_text, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_action;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_buttonDisplay;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  GEOFormattedString *text;
  uint64_t v5;
  char v6;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  text = self->_text;
  v5 = *((_QWORD *)v7 + 2);
  if (text)
  {
    if (v5)
      -[GEOFormattedString mergeFrom:](text, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOTrafficBannerTextButton setText:](self, "setText:");
  }
  v6 = *((_BYTE *)v7 + 32);
  if ((v6 & 1) != 0)
  {
    self->_action = v7[6];
    *(_BYTE *)&self->_flags |= 1u;
    v6 = *((_BYTE *)v7 + 32);
  }
  if ((v6 & 2) != 0)
  {
    self->_buttonDisplay = v7[7];
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTrafficBannerTextButton readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_text, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
