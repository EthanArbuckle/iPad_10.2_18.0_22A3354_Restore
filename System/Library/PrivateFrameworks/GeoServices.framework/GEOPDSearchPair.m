@implementation GEOPDSearchPair

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchPair;
  -[GEOPDSearchPair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchPair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  void *v3;
  double v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 8));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("key"));

    LODWORD(v4) = *(_DWORD *)(a1 + 12);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("val"));

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
  void *v6;
  int v7;

  v3 = a2;
  v4 = objc_msgSend(a1, "init");
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("key"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *(_DWORD *)(v4 + 8) = objc_msgSend(v5, "intValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("val"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      *(_DWORD *)(v4 + 12) = v7;
    }

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchPairReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteFloatField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_key;
  *((_DWORD *)result + 3) = LODWORD(self->_val);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_key == *((_DWORD *)v4 + 2)
    && self->_val == *((float *)v4 + 3);

  return v5;
}

- (unint64_t)hash
{
  uint64_t key;
  float val;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  key = self->_key;
  val = self->_val;
  v4 = val;
  if (val < 0.0)
    v4 = -val;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 >= 0.0)
    v10 = v9;
  return v10 ^ (2654435761 * key);
}

@end
