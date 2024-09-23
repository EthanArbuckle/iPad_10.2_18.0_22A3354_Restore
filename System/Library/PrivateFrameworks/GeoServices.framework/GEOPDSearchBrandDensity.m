@implementation GEOPDSearchBrandDensity

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchBrandDensity;
  -[GEOPDSearchBrandDensity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchBrandDensity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  double v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE *)(a1 + 28);
    if ((v4 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("count"));

      v4 = *(_BYTE *)(a1 + 28);
    }
    if ((v4 & 2) != 0)
    {
      LODWORD(v3) = *(_DWORD *)(a1 + 24);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("popularitySum"));

    }
    v7 = *(_QWORD *)(a1 + 16);
    if (v7)
      objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("geohash"));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = objc_msgSend(a1, "init");
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "unsignedLongLongValue");
      *(_BYTE *)(v4 + 28) |= 1u;
      *(_QWORD *)(v4 + 8) = v6;
    }

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("popularitySum"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      *(_BYTE *)(v4 + 28) |= 2u;
      *(_DWORD *)(v4 + 24) = v8;
    }

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("geohash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      v11 = v10;
      objc_storeStrong((id *)(v4 + 16), v10);

    }
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBrandDensityReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
  if (self->_geohash)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char flags;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_count;
    *(_BYTE *)(v5 + 28) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 24) = self->_popularitySum;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_geohash, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *geohash;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_count != *((_QWORD *)v4 + 1))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_popularitySum != *((float *)v4 + 6))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  geohash = self->_geohash;
  if ((unint64_t)geohash | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](geohash, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  float popularitySum;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761u * self->_count;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    return v8 ^ v3 ^ -[NSString hash](self->_geohash, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_3:
  popularitySum = self->_popularitySum;
  v5 = popularitySum;
  if (popularitySum < 0.0)
    v5 = -popularitySum;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3 ^ -[NSString hash](self->_geohash, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geohash, 0);
}

@end
