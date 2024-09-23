@implementation GEORPButton

- (BOOL)hasLocalizedText
{
  return self->_localizedText != 0;
}

- (NSString)localizedText
{
  return self->_localizedText;
}

- (void)setLocalizedText:(id)a3
{
  objc_storeStrong((id *)&self->_localizedText, a3);
}

- (int)buttonAction
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_buttonAction;
  else
    return 0;
}

- (void)setButtonAction:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_buttonAction = a3;
}

- (void)setHasButtonAction:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasButtonAction
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)buttonActionAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("BUTTON_ACTION_UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("OPEN_REPORTS_HOME");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsButtonAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_ACTION_UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN_REPORTS_HOME"));

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
  v8.super_class = (Class)GEORPButton;
  -[GEORPButton description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPButton dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPButton _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  int v7;
  __CFString *v8;
  const __CFString *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "localizedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("localizedText");
      else
        v6 = CFSTR("localized_text");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      v7 = *(_DWORD *)(a1 + 16);
      if (v7)
      {
        if (v7 == 1)
        {
          v8 = CFSTR("OPEN_REPORTS_HOME");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 16));
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v8 = CFSTR("BUTTON_ACTION_UNKNOWN");
      }
      if (a2)
        v9 = CFSTR("buttonAction");
      else
        v9 = CFSTR("button_action");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

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
  return -[GEORPButton _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPButton)initWithDictionary:(id)a3
{
  return (GEORPButton *)-[GEORPButton _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("localizedText");
      else
        v6 = CFSTR("localized_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setLocalizedText:", v8);

      }
      if (a3)
        v9 = CFSTR("buttonAction");
      else
        v9 = CFSTR("button_action");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BUTTON_ACTION_UNKNOWN")) & 1) != 0)
          v12 = 0;
        else
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("OPEN_REPORTS_HOME"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_19:

          goto LABEL_20;
        }
        v12 = objc_msgSend(v10, "intValue");
      }
      objc_msgSend(a1, "setButtonAction:", v12);
      goto LABEL_19;
    }
  }
LABEL_20:

  return a1;
}

- (GEORPButton)initWithJSON:(id)a3
{
  return (GEORPButton *)-[GEORPButton _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPButtonIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPButtonReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_localizedText)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPButton readAll:](self, "readAll:", 0);
  if (self->_localizedText)
    objc_msgSend(v4, "setLocalizedText:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_buttonAction;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_localizedText, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_buttonAction;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *localizedText;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEORPButton readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  localizedText = self->_localizedText;
  if ((unint64_t)localizedText | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](localizedText, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_buttonAction == *((_DWORD *)v4 + 4))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  -[GEORPButton readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_localizedText, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_buttonAction;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;

  v4 = (int *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 1))
    -[GEORPButton setLocalizedText:](self, "setLocalizedText:");
  if ((v4[5] & 1) != 0)
  {
    self->_buttonAction = v4[4];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedText, 0);
}

@end
