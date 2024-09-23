@implementation GEORPMerchantLookupCorrections

- (BOOL)isCategoryIncorrect
{
  return self->_isCategoryIncorrect;
}

- (void)setIsCategoryIncorrect:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_isCategoryIncorrect = a3;
}

- (void)setHasIsCategoryIncorrect:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIsCategoryIncorrect
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)isMerchantIncorrect
{
  return self->_isMerchantIncorrect;
}

- (void)setIsMerchantIncorrect:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_isMerchantIncorrect = a3;
}

- (void)setHasIsMerchantIncorrect:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsMerchantIncorrect
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)isOtherIssue
{
  return self->_isOtherIssue;
}

- (void)setIsOtherIssue:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_isOtherIssue = a3;
}

- (void)setHasIsOtherIssue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsOtherIssue
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEORPMerchantLookupCorrections;
  -[GEORPMerchantLookupCorrections description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPMerchantLookupCorrections dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPMerchantLookupCorrections _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[12];
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("isCategoryIncorrect");
    else
      v7 = CFSTR("is_category_incorrect");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = a1[12];
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0)
        return v4;
      goto LABEL_14;
    }
  }
  else if ((a1[12] & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[9]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v9 = CFSTR("isMerchantIncorrect");
  else
    v9 = CFSTR("is_merchant_incorrect");
  objc_msgSend(v4, "setObject:forKey:", v8, v9);

  if ((a1[12] & 4) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[10]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("isOtherIssue");
    else
      v11 = CFSTR("is_other_issue");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPMerchantLookupCorrections _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEORPMerchantLookupCorrections)initWithDictionary:(id)a3
{
  return (GEORPMerchantLookupCorrections *)-[GEORPMerchantLookupCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("isCategoryIncorrect");
      else
        v6 = CFSTR("is_category_incorrect");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsCategoryIncorrect:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("isMerchantIncorrect");
      else
        v8 = CFSTR("is_merchant_incorrect");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsMerchantIncorrect:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("isOtherIssue");
      else
        v10 = CFSTR("is_other_issue");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsOtherIssue:", objc_msgSend(v11, "BOOLValue"));

    }
  }

  return a1;
}

- (GEORPMerchantLookupCorrections)initWithJSON:(id)a3
{
  return (GEORPMerchantLookupCorrections *)-[GEORPMerchantLookupCorrections _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPMerchantLookupCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPMerchantLookupCorrectionsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEORPMerchantLookupCorrections readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v5[9] = self->_isMerchantIncorrect;
    v5[12] |= 2u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v5[8] = self->_isCategoryIncorrect;
  v5[12] |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    v5[10] = self->_isOtherIssue;
    v5[12] |= 4u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_isCategoryIncorrect;
    *((_BYTE *)result + 12) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 9) = self->_isMerchantIncorrect;
  *((_BYTE *)result + 12) |= 2u;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 10) = self->_isOtherIssue;
  *((_BYTE *)result + 12) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEORPMerchantLookupCorrections readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
      goto LABEL_20;
    if (self->_isCategoryIncorrect)
    {
      if (!v4[8])
        goto LABEL_20;
    }
    else if (v4[8])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[12] & 1) != 0)
  {
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[12] & 2) == 0)
      goto LABEL_20;
    if (self->_isMerchantIncorrect)
    {
      if (!v4[9])
        goto LABEL_20;
    }
    else if (v4[9])
    {
      goto LABEL_20;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
    goto LABEL_20;
  }
  v5 = (v4[12] & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v4[12] & 4) != 0)
    {
      if (self->_isOtherIssue)
      {
        if (!v4[10])
          goto LABEL_20;
      }
      else if (v4[10])
      {
        goto LABEL_20;
      }
      v5 = 1;
      goto LABEL_21;
    }
LABEL_20:
    v5 = 0;
  }
LABEL_21:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEORPMerchantLookupCorrections readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v3 = 2654435761 * self->_isCategoryIncorrect;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_isMerchantIncorrect;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_isOtherIssue;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL v4;
  BOOL *v5;

  v5 = (BOOL *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5[12];
  if (!v4)
  {
    if ((v5[12] & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_isMerchantIncorrect = v5[9];
    *(_BYTE *)&self->_flags |= 2u;
    if ((v5[12] & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_isCategoryIncorrect = v5[8];
  *(_BYTE *)&self->_flags |= 1u;
  v4 = v5[12];
  if ((v4 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 4) != 0)
  {
LABEL_4:
    self->_isOtherIssue = v5[10];
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_5:

}

@end
