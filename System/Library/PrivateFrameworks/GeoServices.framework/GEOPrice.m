@implementation GEOPrice

- (float)amount
{
  return self->_amount;
}

- (void)setAmount:(float)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_amount = a3;
}

- (void)setHasAmount:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAmount
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasCurrencyCode
{
  return self->_currencyCode != 0;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_storeStrong((id *)&self->_currencyCode, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPrice;
  -[GEOPrice description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPrice dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPrice _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("amount"));

  }
  objc_msgSend((id)a1, "currencyCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("currencyCode");
    else
      v8 = CFSTR("currency_code");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  v9 = *(void **)(a1 + 8);
  if (v9)
  {
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __38__GEOPrice__dictionaryRepresentation___block_invoke;
      v16[3] = &unk_1E1C00600;
      v13 = v12;
      v17 = v13;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);
      v14 = v13;

      v11 = v14;
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPrice _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __38__GEOPrice__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPrice)initWithDictionary:(id)a3
{
  return (GEOPrice *)-[GEOPrice _initWithDictionary:isJSON:](self, a3, 0);
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
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("amount"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "floatValue");
        objc_msgSend(a1, "setAmount:");
      }

      if (a3)
        v7 = CFSTR("currencyCode");
      else
        v7 = CFSTR("currency_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(a1, "setCurrencyCode:", v9);

      }
    }
  }

  return a1;
}

- (GEOPrice)initWithJSON:(id)a3
{
  return (GEOPrice *)-[GEOPrice _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPriceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPriceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_currencyCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEOPrice readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = LODWORD(self->_amount);
    *((_BYTE *)v5 + 28) |= 1u;
  }
  if (self->_currencyCode)
  {
    objc_msgSend(v5, "setCurrencyCode:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(float *)(v5 + 24) = self->_amount;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *currencyCode;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEOPrice readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_amount != *((float *)v4 + 6))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  currencyCode = self->_currencyCode;
  if ((unint64_t)currencyCode | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](currencyCode, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  float amount;
  double v5;
  long double v6;
  double v7;

  -[GEOPrice readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    amount = self->_amount;
    v5 = amount;
    if (amount < 0.0)
      v5 = -amount;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  return -[NSString hash](self->_currencyCode, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  float *v4;
  float *v5;

  v5 = (float *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if (((_BYTE)v5[7] & 1) != 0)
  {
    self->_amount = v5[6];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v5 + 2))
  {
    -[GEOPrice setCurrencyCode:](self, "setCurrencyCode:");
    v4 = v5;
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
    -[GEOPrice readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (double)value
{
  float v2;

  -[GEOPrice amount](self, "amount");
  return v2;
}

@end
