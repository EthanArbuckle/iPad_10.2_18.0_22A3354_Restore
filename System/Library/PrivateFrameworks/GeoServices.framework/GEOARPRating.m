@implementation GEOARPRating

- (BOOL)rating
{
  return self->_rating;
}

- (void)setRating:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_rating = a3;
}

- (void)setHasRating:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasRating
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasDisplayedText
{
  return self->_displayedText != 0;
}

- (NSString)displayedText
{
  return self->_displayedText;
}

- (void)setDisplayedText:(id)a3
{
  objc_storeStrong((id *)&self->_displayedText, a3);
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
  v8.super_class = (Class)GEOARPRating;
  -[GEOARPRating description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOARPRating dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOARPRating _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a1[20] & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[16]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("rating"));

    }
    objc_msgSend(a1, "displayedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (a2)
        v7 = CFSTR("displayedText");
      else
        v7 = CFSTR("displayed_text");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);
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
  return -[GEOARPRating _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOARPRating)initWithDictionary:(id)a3
{
  return (GEOARPRating *)-[GEOARPRating _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rating"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRating:", objc_msgSend(v6, "BOOLValue"));

      if (a3)
        v7 = CFSTR("displayedText");
      else
        v7 = CFSTR("displayed_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(a1, "setDisplayedText:", v9);

      }
    }
  }

  return a1;
}

- (GEOARPRating)initWithJSON:(id)a3
{
  return (GEOARPRating *)-[GEOARPRating _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOARPRatingIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOARPRatingReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_displayedText)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  _BYTE *v5;

  v5 = a3;
  -[GEOARPRating readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5[16] = self->_rating;
    v5[20] |= 1u;
  }
  if (self->_displayedText)
  {
    objc_msgSend(v5, "setDisplayedText:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_rating;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_displayedText, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSString *displayedText;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  -[GEOARPRating readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0)
    {
      if (self->_rating)
      {
        if (*((_BYTE *)v4 + 16))
          goto LABEL_12;
      }
      else if (!*((_BYTE *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
    goto LABEL_6;
LABEL_12:
  displayedText = self->_displayedText;
  if ((unint64_t)displayedText | *((_QWORD *)v4 + 1))
    v5 = -[NSString isEqual:](displayedText, "isEqual:");
  else
    v5 = 1;
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOARPRating readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_rating;
  else
    v3 = 0;
  return -[NSString hash](self->_displayedText, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v5 = (BOOL *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if (v5[20])
  {
    self->_rating = v5[16];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v5 + 1))
  {
    -[GEOARPRating setDisplayedText:](self, "setDisplayedText:");
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedText, 0);
}

@end
