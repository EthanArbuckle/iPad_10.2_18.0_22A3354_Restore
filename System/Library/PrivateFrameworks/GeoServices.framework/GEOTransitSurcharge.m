@implementation GEOTransitSurcharge

- (NSMutableArray)surchargeUnits
{
  return self->_surchargeUnits;
}

- (void)setSurchargeUnits:(id)a3
{
  objc_storeStrong((id *)&self->_surchargeUnits, a3);
}

- (void)clearSurchargeUnits
{
  -[NSMutableArray removeAllObjects](self->_surchargeUnits, "removeAllObjects");
}

- (void)addSurchargeUnit:(id)a3
{
  id v4;
  NSMutableArray *surchargeUnits;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  surchargeUnits = self->_surchargeUnits;
  v8 = v4;
  if (!surchargeUnits)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_surchargeUnits;
    self->_surchargeUnits = v6;

    v4 = v8;
    surchargeUnits = self->_surchargeUnits;
  }
  -[NSMutableArray addObject:](surchargeUnits, "addObject:", v4);

}

- (unint64_t)surchargeUnitsCount
{
  return -[NSMutableArray count](self->_surchargeUnits, "count");
}

- (id)surchargeUnitAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_surchargeUnits, "objectAtIndex:", a3);
}

+ (Class)surchargeUnitType
{
  return (Class)objc_opt_class();
}

- (int)paymentType
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_paymentType;
  else
    return 0;
}

- (void)setPaymentType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_paymentType = a3;
}

- (void)setHasPaymentType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPaymentType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)paymentTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("PAYMENT_TYPE_UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("PAYMENT_TYPE_IC_CARD");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsPaymentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_TYPE_UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_TYPE_IC_CARD"));

  return v4;
}

- (unsigned)numberOfLegs
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_numberOfLegs;
  else
    return 1;
}

- (void)setNumberOfLegs:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_numberOfLegs = a3;
}

- (void)setHasNumberOfLegs:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasNumberOfLegs
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
  v8.super_class = (Class)GEOTransitSurcharge;
  -[GEOTransitSurcharge description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitSurcharge dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitSurcharge _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  char v14;
  int v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = *(id *)(a1 + 16);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("surchargeUnit");
    else
      v13 = CFSTR("surcharge_unit");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  v14 = *(_BYTE *)(a1 + 32);
  if ((v14 & 2) != 0)
  {
    v15 = *(_DWORD *)(a1 + 28);
    if (v15)
    {
      if (v15 == 1)
      {
        v16 = CFSTR("PAYMENT_TYPE_IC_CARD");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 28));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v16 = CFSTR("PAYMENT_TYPE_UNKNOWN");
    }
    if (a2)
      v17 = CFSTR("paymentType");
    else
      v17 = CFSTR("payment_type");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

    v14 = *(_BYTE *)(a1 + 32);
  }
  if ((v14 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("numberOfLegs");
    else
      v19 = CFSTR("number_of_legs");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  v20 = *(void **)(a1 + 8);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __49__GEOTransitSurcharge__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitSurcharge _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOTransitSurcharge__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitSurcharge)initWithDictionary:(id)a3
{
  return (GEOTransitSurcharge *)-[GEOTransitSurcharge _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEOTransitSurchargeUnit *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_37;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_37;
  if (a3)
    v6 = CFSTR("surchargeUnit");
  else
    v6 = CFSTR("surcharge_unit");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v5;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [GEOTransitSurchargeUnit alloc];
            if ((a3 & 1) != 0)
              v15 = -[GEOTransitSurchargeUnit initWithJSON:](v14, "initWithJSON:", v13);
            else
              v15 = -[GEOTransitSurchargeUnit initWithDictionary:](v14, "initWithDictionary:", v13);
            v16 = (void *)v15;
            objc_msgSend(a1, "addSurchargeUnit:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    v5 = v24;
  }

  if (a3)
    v17 = CFSTR("paymentType");
  else
    v17 = CFSTR("payment_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v18;
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("PAYMENT_TYPE_UNKNOWN")) & 1) != 0)
      v20 = 0;
    else
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("PAYMENT_TYPE_IC_CARD"));

    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v18, "intValue");
LABEL_30:
    objc_msgSend(a1, "setPaymentType:", v20);
  }

  if (a3)
    v21 = CFSTR("numberOfLegs");
  else
    v21 = CFSTR("number_of_legs");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setNumberOfLegs:", objc_msgSend(v22, "unsignedIntValue"));

LABEL_37:
  return a1;
}

- (GEOTransitSurcharge)initWithJSON:(id)a3
{
  return (GEOTransitSurcharge *)-[GEOTransitSurcharge _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitSurchargeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitSurchargeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_surchargeUnits;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  id v9;

  v9 = a3;
  -[GEOTransitSurcharge readAll:](self, "readAll:", 0);
  if (-[GEOTransitSurcharge surchargeUnitsCount](self, "surchargeUnitsCount"))
  {
    objc_msgSend(v9, "clearSurchargeUnits");
    v4 = -[GEOTransitSurcharge surchargeUnitsCount](self, "surchargeUnitsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOTransitSurcharge surchargeUnitAtIndex:](self, "surchargeUnitAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSurchargeUnit:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v9 + 7) = self->_paymentType;
    *((_BYTE *)v9 + 32) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v9 + 6) = self->_numberOfLegs;
    *((_BYTE *)v9 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char flags;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_surchargeUnits;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend((id)v5, "addSurchargeUnit:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_paymentType;
    *(_BYTE *)(v5 + 32) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_numberOfLegs;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *surchargeUnits;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOTransitSurcharge readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  surchargeUnits = self->_surchargeUnits;
  if ((unint64_t)surchargeUnits | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](surchargeUnits, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_paymentType != *((_DWORD *)v4 + 7))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_numberOfLegs != *((_DWORD *)v4 + 6))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOTransitSurcharge readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_surchargeUnits, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_paymentType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_numberOfLegs;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[GEOTransitSurcharge addSurchargeUnit:](self, "addSurchargeUnit:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 32);
  if ((v10 & 2) != 0)
  {
    self->_paymentType = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_flags |= 2u;
    v10 = *((_BYTE *)v4 + 32);
  }
  if ((v10 & 1) != 0)
  {
    self->_numberOfLegs = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_flags |= 1u;
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
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitSurcharge readAll:](self, "readAll:", 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_surchargeUnits;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surchargeUnits, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
