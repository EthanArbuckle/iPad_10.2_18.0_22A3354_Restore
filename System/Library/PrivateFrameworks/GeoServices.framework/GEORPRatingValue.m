@implementation GEORPRatingValue

- (BOOL)hasCategoryName
{
  return self->_categoryName != 0;
}

- (GEOLocalizedString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
  objc_storeStrong((id *)&self->_categoryName, a3);
}

- (int)score
{
  return self->_score;
}

- (void)setScore:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasScore
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
  v8.super_class = (Class)GEORPRatingValue;
  -[GEORPRatingValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPRatingValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPRatingValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "categoryName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("categoryName");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("category_name");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("score"));

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
  return -[GEORPRatingValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPRatingValue)initWithDictionary:(id)a3
{
  return (GEORPRatingValue *)-[GEORPRatingValue _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOLocalizedString *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("categoryName");
      else
        v6 = CFSTR("category_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOLocalizedString alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOLocalizedString initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOLocalizedString initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setCategoryName:", v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setScore:", objc_msgSend(v11, "intValue"));

    }
  }

  return a1;
}

- (GEORPRatingValue)initWithJSON:(id)a3
{
  return (GEORPRatingValue *)-[GEORPRatingValue _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPRatingValueIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPRatingValueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_categoryName)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteSint32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPRatingValue readAll:](self, "readAll:", 0);
  if (self->_categoryName)
    objc_msgSend(v4, "setCategoryName:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_score;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOLocalizedString copyWithZone:](self->_categoryName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_score;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLocalizedString *categoryName;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEORPRatingValue readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  categoryName = self->_categoryName;
  if ((unint64_t)categoryName | *((_QWORD *)v4 + 1))
  {
    if (!-[GEOLocalizedString isEqual:](categoryName, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_score == *((_DWORD *)v4 + 4))
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
  unint64_t v3;
  uint64_t v4;

  -[GEORPRatingValue readAll:](self, "readAll:", 1);
  v3 = -[GEOLocalizedString hash](self->_categoryName, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_score;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOLocalizedString *categoryName;
  uint64_t v5;
  int *v6;

  v6 = (int *)a3;
  objc_msgSend(v6, "readAll:", 0);
  categoryName = self->_categoryName;
  v5 = *((_QWORD *)v6 + 1);
  if (categoryName)
  {
    if (v5)
      -[GEOLocalizedString mergeFrom:](categoryName, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPRatingValue setCategoryName:](self, "setCategoryName:");
  }
  if ((v6[5] & 1) != 0)
  {
    self->_score = v6[4];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryName, 0);
}

@end
