@implementation GEOPDSearchPreferredCategory

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchPreferredCategory;
  -[GEOPDSearchPreferredCategory description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchPreferredCategory dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchPreferredCategory _dictionaryRepresentation:]((uint64_t)self);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  double v3;
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v2;
    if (*(_QWORD *)(a1 + 8))
      objc_msgSend(v2, "setObject:forKey:");
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      LODWORD(v3) = *(_DWORD *)(a1 + 16);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("score"));

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
  return -[GEOPDSearchPreferredCategory _dictionaryRepresentation:]((uint64_t)self);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchPreferredCategoryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_categoryId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_categoryId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(float *)(v5 + 16) = self->_score;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *categoryId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  categoryId = self->_categoryId;
  if ((unint64_t)categoryId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](categoryId, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_score == *((float *)v4 + 4))
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
  unint64_t v4;
  float score;
  double v6;
  long double v7;
  double v8;

  v3 = -[NSString hash](self->_categoryId, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    score = self->_score;
    v6 = score;
    if (score < 0.0)
      v6 = -score;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryId, 0);
}

@end
