@implementation GEOPDPlaceSummaryLayoutUnitCuratedGuides

- (unsigned)minNumGuides
{
  return self->_minNumGuides;
}

- (void)setMinNumGuides:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_minNumGuides = a3;
}

- (void)setHasMinNumGuides:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMinNumGuides
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
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitCuratedGuides;
  -[GEOPDPlaceSummaryLayoutUnitCuratedGuides description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceSummaryLayoutUnitCuratedGuides dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitCuratedGuides _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 12) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 8));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("minNumGuides");
      else
        v6 = CFSTR("min_num_guides");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

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
  return -[GEOPDPlaceSummaryLayoutUnitCuratedGuides _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutUnitCuratedGuides)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitCuratedGuides *)-[GEOPDPlaceSummaryLayoutUnitCuratedGuides _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("minNumGuides");
      else
        v6 = CFSTR("min_num_guides");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMinNumGuides:", objc_msgSend(v7, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOPDPlaceSummaryLayoutUnitCuratedGuides)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitCuratedGuides *)-[GEOPDPlaceSummaryLayoutUnitCuratedGuides _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitCuratedGuidesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitCuratedGuidesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;

  v4 = a3;
  -[GEOPDPlaceSummaryLayoutUnitCuratedGuides readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[2] = self->_minNumGuides;
    *((_BYTE *)v4 + 12) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_minNumGuides;
    *((_BYTE *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  -[GEOPDPlaceSummaryLayoutUnitCuratedGuides readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = (*((_BYTE *)v4 + 12) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 12) & 1) != 0 && self->_minNumGuides == *((_DWORD *)v4 + 2))
    {
      v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  -[GEOPDPlaceSummaryLayoutUnitCuratedGuides readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return 2654435761 * self->_minNumGuides;
  else
    return 0;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((v4[3] & 1) != 0)
  {
    self->_minNumGuides = v4[2];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

@end
