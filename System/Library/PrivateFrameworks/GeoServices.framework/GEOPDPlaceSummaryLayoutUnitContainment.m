@implementation GEOPDPlaceSummaryLayoutUnitContainment

- (int)containmentType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_containmentType;
  else
    return 0;
}

- (void)setContainmentType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_containmentType = a3;
}

- (void)setHasContainmentType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasContainmentType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)containmentTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0E4E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsContainmentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTAINMENT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTAINMENT_TYPE_PARENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTAINMENT_TYPE_SUMMARY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTAINMENT_TYPE_GEO")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONTAINMENT_TYPE_CAT_GEO")))
  {
    v4 = 4;
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
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitContainment;
  -[GEOPDPlaceSummaryLayoutUnitContainment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceSummaryLayoutUnitContainment dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitContainment _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 12) & 1) != 0)
    {
      v5 = *(int *)(a1 + 8);
      if (v5 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C0E4E8[v5];
      }
      if (a2)
        v7 = CFSTR("containmentType");
      else
        v7 = CFSTR("containment_type");
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
  return -[GEOPDPlaceSummaryLayoutUnitContainment _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutUnitContainment)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitContainment *)-[GEOPDPlaceSummaryLayoutUnitContainment _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("containmentType");
      else
        v6 = CFSTR("containment_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CONTAINMENT_TYPE_UNKNOWN")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CONTAINMENT_TYPE_PARENT")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CONTAINMENT_TYPE_SUMMARY")) & 1) != 0)
        {
          v9 = 2;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CONTAINMENT_TYPE_GEO")) & 1) != 0)
        {
          v9 = 3;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("CONTAINMENT_TYPE_CAT_GEO")))
        {
          v9 = 4;
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
        {
LABEL_22:

          goto LABEL_23;
        }
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setContainmentType:", v9);
      goto LABEL_22;
    }
  }
LABEL_23:

  return a1;
}

- (GEOPDPlaceSummaryLayoutUnitContainment)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitContainment *)-[GEOPDPlaceSummaryLayoutUnitContainment _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitContainmentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitContainmentReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;

  v4 = a3;
  -[GEOPDPlaceSummaryLayoutUnitContainment readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[2] = self->_containmentType;
    *((_BYTE *)v4 + 12) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_containmentType;
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
  -[GEOPDPlaceSummaryLayoutUnitContainment readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = (*((_BYTE *)v4 + 12) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 12) & 1) != 0 && self->_containmentType == *((_DWORD *)v4 + 2))
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
  -[GEOPDPlaceSummaryLayoutUnitContainment readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return 2654435761 * self->_containmentType;
  else
    return 0;
}

- (void)mergeFrom:(id)a3
{
  int *v4;

  v4 = (int *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((v4[3] & 1) != 0)
  {
    self->_containmentType = v4[2];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

@end
