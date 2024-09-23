@implementation GEOSignGuidanceFeedback

- (int)signTitleIndex
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_signTitleIndex;
  else
    return -1;
}

- (void)setSignTitleIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_signTitleIndex = a3;
}

- (void)setHasSignTitleIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSignTitleIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)signDetailIndex
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_signDetailIndex;
  else
    return -1;
}

- (void)setSignDetailIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_signDetailIndex = a3;
}

- (void)setHasSignDetailIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSignDetailIndex
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
  v8.super_class = (Class)GEOSignGuidanceFeedback;
  -[GEOSignGuidanceFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSignGuidanceFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSignGuidanceFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 16);
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 12));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v7 = CFSTR("signTitleIndex");
      else
        v7 = CFSTR("sign_title_index");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

      v5 = *(_BYTE *)(a1 + 16);
    }
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 8));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("signDetailIndex");
      else
        v9 = CFSTR("sign_detail_index");
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
  return -[GEOSignGuidanceFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSignGuidanceFeedback)initWithDictionary:(id)a3
{
  return (GEOSignGuidanceFeedback *)-[GEOSignGuidanceFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("signTitleIndex");
      else
        v6 = CFSTR("sign_title_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSignTitleIndex:", objc_msgSend(v7, "intValue"));

      if (a3)
        v8 = CFSTR("signDetailIndex");
      else
        v8 = CFSTR("sign_detail_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSignDetailIndex:", objc_msgSend(v9, "intValue"));

    }
  }

  return a1;
}

- (GEOSignGuidanceFeedback)initWithJSON:(id)a3
{
  return (GEOSignGuidanceFeedback *)-[GEOSignGuidanceFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSignGuidanceFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSignGuidanceFeedbackReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOSignGuidanceFeedback readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_signTitleIndex;
    *((_BYTE *)v5 + 16) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v5[2] = self->_signDetailIndex;
    *((_BYTE *)v5 + 16) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_signTitleIndex;
    *((_BYTE *)result + 16) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_signDetailIndex;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOSignGuidanceFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_signTitleIndex != *((_DWORD *)v4 + 3))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_signDetailIndex != *((_DWORD *)v4 + 2))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOSignGuidanceFeedback readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_signTitleIndex;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_signDetailIndex;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_signTitleIndex = v5[3];
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 16);
  }
  if ((v4 & 1) != 0)
  {
    self->_signDetailIndex = v5[2];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

@end
