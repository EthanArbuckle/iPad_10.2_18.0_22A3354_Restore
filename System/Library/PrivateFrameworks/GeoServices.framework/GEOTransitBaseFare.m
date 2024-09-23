@implementation GEOTransitBaseFare

- (GEOTransitBaseFare)init
{
  GEOTransitBaseFare *v2;
  GEOTransitBaseFare *v3;
  GEOTransitBaseFare *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitBaseFare;
  v2 = -[GEOTransitBaseFare init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitBaseFare)initWithData:(id)a3
{
  GEOTransitBaseFare *v3;
  GEOTransitBaseFare *v4;
  GEOTransitBaseFare *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitBaseFare;
  v3 = -[GEOTransitBaseFare initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitBaseFare;
  -[GEOTransitBaseFare dealloc](&v3, sel_dealloc);
}

- (void)_readPrice
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBaseFareReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrice_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPrice
{
  -[GEOTransitBaseFare _readPrice]((uint64_t)self);
  return self->_price != 0;
}

- (GEOTransitPrice)price
{
  -[GEOTransitBaseFare _readPrice]((uint64_t)self);
  return self->_price;
}

- (void)setPrice:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_price, a3);
}

- (int)paymentType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_paymentType;
  else
    return 0;
}

- (void)setPaymentType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_paymentType = a3;
}

- (void)setHasPaymentType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
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
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_numberOfLegs;
  else
    return 1;
}

- (void)setNumberOfLegs:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_numberOfLegs = a3;
}

- (void)setHasNumberOfLegs:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasNumberOfLegs
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readSupportedPaymentMethods
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBaseFareReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedPaymentMethods_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)supportedPaymentMethods
{
  -[GEOTransitBaseFare _readSupportedPaymentMethods]((uint64_t)self);
  return self->_supportedPaymentMethods;
}

- (void)setSupportedPaymentMethods:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *supportedPaymentMethods;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  supportedPaymentMethods = self->_supportedPaymentMethods;
  self->_supportedPaymentMethods = v4;

}

- (void)clearSupportedPaymentMethods
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_supportedPaymentMethods, "removeAllObjects");
}

- (void)addSupportedPaymentMethod:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitBaseFare _readSupportedPaymentMethods]((uint64_t)self);
  -[GEOTransitBaseFare _addNoFlagsSupportedPaymentMethod:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsSupportedPaymentMethod:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)supportedPaymentMethodsCount
{
  -[GEOTransitBaseFare _readSupportedPaymentMethods]((uint64_t)self);
  return -[NSMutableArray count](self->_supportedPaymentMethods, "count");
}

- (id)supportedPaymentMethodAtIndex:(unint64_t)a3
{
  -[GEOTransitBaseFare _readSupportedPaymentMethods]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_supportedPaymentMethods, "objectAtIndex:", a3);
}

+ (Class)supportedPaymentMethodType
{
  return (Class)objc_opt_class();
}

- (BOOL)cashOnly
{
  return self->_cashOnly;
}

- (void)setCashOnly:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  self->_cashOnly = a3;
}

- (void)setHasCashOnly:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -124;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasCashOnly
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readSupportedPaymentMethodIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBaseFareReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedPaymentMethodIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)supportedPaymentMethodIndexsCount
{
  -[GEOTransitBaseFare _readSupportedPaymentMethodIndexs]((uint64_t)self);
  return self->_supportedPaymentMethodIndexs.count;
}

- (unsigned)supportedPaymentMethodIndexs
{
  -[GEOTransitBaseFare _readSupportedPaymentMethodIndexs]((uint64_t)self);
  return self->_supportedPaymentMethodIndexs.list;
}

- (void)clearSupportedPaymentMethodIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  PBRepeatedUInt32Clear();
}

- (void)addSupportedPaymentMethodIndex:(unsigned int)a3
{
  -[GEOTransitBaseFare _readSupportedPaymentMethodIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (unsigned)supportedPaymentMethodIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_supportedPaymentMethodIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTransitBaseFare _readSupportedPaymentMethodIndexs]((uint64_t)self);
  p_supportedPaymentMethodIndexs = &self->_supportedPaymentMethodIndexs;
  count = self->_supportedPaymentMethodIndexs.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_supportedPaymentMethodIndexs->list[a3];
}

- (void)setSupportedPaymentMethodIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  PBRepeatedUInt32Set();
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
  v8.super_class = (Class)GEOTransitBaseFare;
  -[GEOTransitBaseFare description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitBaseFare dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitBaseFare _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "price");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("price"));

  }
  v8 = *(_BYTE *)(a1 + 88);
  if ((v8 & 2) != 0)
  {
    v9 = *(_DWORD *)(a1 + 80);
    if (v9)
    {
      if (v9 == 1)
      {
        v10 = CFSTR("PAYMENT_TYPE_IC_CARD");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 80));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = CFSTR("PAYMENT_TYPE_UNKNOWN");
    }
    if (a2)
      v11 = CFSTR("paymentType");
    else
      v11 = CFSTR("payment_type");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v8 = *(_BYTE *)(a1 + 88);
  }
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("numberOfLegs");
    else
      v13 = CFSTR("number_of_legs");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v15 = *(id *)(a1 + 56);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("supportedPaymentMethod");
    else
      v22 = CFSTR("supported_payment_method");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  if ((*(_BYTE *)(a1 + 88) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 84));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("cashOnly");
    else
      v24 = CFSTR("cash_only");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("supportedPaymentMethodIndex");
    else
      v26 = CFSTR("supported_payment_method_index");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  v27 = *(void **)(a1 + 16);
  if (v27)
  {
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __48__GEOTransitBaseFare__dictionaryRepresentation___block_invoke;
      v34[3] = &unk_1E1C00600;
      v31 = v30;
      v35 = v31;
      objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v34);
      v32 = v31;

      v29 = v32;
    }
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitBaseFare _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOTransitBaseFare__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitBaseFare)initWithDictionary:(id)a3
{
  return (GEOTransitBaseFare *)-[GEOTransitBaseFare _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOTransitPrice *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  GEOPBTransitPaymentMethod *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_61;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_61;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("price"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [GEOTransitPrice alloc];
    if ((a3 & 1) != 0)
      v8 = -[GEOTransitPrice initWithJSON:](v7, "initWithJSON:", v6);
    else
      v8 = -[GEOTransitPrice initWithDictionary:](v7, "initWithDictionary:", v6);
    v9 = (void *)v8;
    objc_msgSend(a1, "setPrice:", v8);

  }
  if (a3)
    v10 = CFSTR("paymentType");
  else
    v10 = CFSTR("payment_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PAYMENT_TYPE_UNKNOWN")) & 1) != 0)
      v13 = 0;
    else
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("PAYMENT_TYPE_IC_CARD"));

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_18:
    objc_msgSend(a1, "setPaymentType:", v13);
  }

  if (a3)
    v14 = CFSTR("numberOfLegs");
  else
    v14 = CFSTR("number_of_legs");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setNumberOfLegs:", objc_msgSend(v15, "unsignedIntValue"));

  if (a3)
    v16 = CFSTR("supportedPaymentMethod");
  else
    v16 = CFSTR("supported_payment_method");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = v17;
    v39 = v5;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v45 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = [GEOPBTransitPaymentMethod alloc];
            if ((a3 & 1) != 0)
              v25 = -[GEOPBTransitPaymentMethod initWithJSON:](v24, "initWithJSON:", v23);
            else
              v25 = -[GEOPBTransitPaymentMethod initWithDictionary:](v24, "initWithDictionary:", v23);
            v26 = (void *)v25;
            objc_msgSend(a1, "addSupportedPaymentMethod:", v25, v38, v39);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v20);
    }

    v17 = v38;
    v5 = v39;
  }

  if (a3)
    v27 = CFSTR("cashOnly");
  else
    v27 = CFSTR("cash_only");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27, v38, v39);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCashOnly:", objc_msgSend(v28, "BOOLValue"));

  if (a3)
    v29 = CFSTR("supportedPaymentMethodIndex");
  else
    v29 = CFSTR("supported_payment_method_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v31 = v30;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v41 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(a1, "addSupportedPaymentMethodIndex:", objc_msgSend(v36, "unsignedIntValue"));
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v33);
    }

  }
LABEL_61:

  return a1;
}

- (GEOTransitBaseFare)initWithJSON:(id)a3
{
  return (GEOTransitBaseFare *)-[GEOTransitBaseFare _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_154;
    else
      v8 = (int *)&readAll__nonRecursiveTag_155;
    GEOTransitBaseFareReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitBaseFareCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitBaseFareIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitBaseFareReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 0xFu))
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v13);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTransitBaseFare readAll:](self, "readAll:", 0);
    if (self->_price)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_supportedPaymentMethods;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_supportedPaymentMethodIndexs.count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v11;
      }
      while (v11 < self->_supportedPaymentMethodIndexs.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  id *v12;

  v12 = (id *)a3;
  -[GEOTransitBaseFare readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 16) = self->_readerMarkPos;
  *((_DWORD *)v12 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_price)
    objc_msgSend(v12, "setPrice:");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v12 + 20) = self->_paymentType;
    *((_BYTE *)v12 + 88) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v12 + 19) = self->_numberOfLegs;
    *((_BYTE *)v12 + 88) |= 1u;
  }
  if (-[GEOTransitBaseFare supportedPaymentMethodsCount](self, "supportedPaymentMethodsCount"))
  {
    objc_msgSend(v12, "clearSupportedPaymentMethods");
    v5 = -[GEOTransitBaseFare supportedPaymentMethodsCount](self, "supportedPaymentMethodsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOTransitBaseFare supportedPaymentMethodAtIndex:](self, "supportedPaymentMethodAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSupportedPaymentMethod:", v8);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_BYTE *)v12 + 84) = self->_cashOnly;
    *((_BYTE *)v12 + 88) |= 4u;
  }
  if (-[GEOTransitBaseFare supportedPaymentMethodIndexsCount](self, "supportedPaymentMethodIndexsCount"))
  {
    objc_msgSend(v12, "clearSupportedPaymentMethodIndexs");
    v9 = -[GEOTransitBaseFare supportedPaymentMethodIndexsCount](self, "supportedPaymentMethodIndexsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v12, "addSupportedPaymentMethodIndex:", -[GEOTransitBaseFare supportedPaymentMethodIndexAtIndex:](self, "supportedPaymentMethodIndexAtIndex:", j));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  char flags;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  PBUnknownFields *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTransitBaseFareReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitBaseFare readAll:](self, "readAll:", 0);
  v9 = -[GEOTransitPrice copyWithZone:](self->_price, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_paymentType;
    *(_BYTE *)(v5 + 88) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_numberOfLegs;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_supportedPaymentMethods;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addSupportedPaymentMethod:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 84) = self->_cashOnly;
    *(_BYTE *)(v5 + 88) |= 4u;
  }
  PBRepeatedUInt32Copy();
  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOTransitPrice *price;
  char flags;
  char v7;
  NSMutableArray *supportedPaymentMethods;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOTransitBaseFare readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  price = self->_price;
  if ((unint64_t)price | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOTransitPrice isEqual:](price, "isEqual:"))
      goto LABEL_21;
  }
  flags = (char)self->_flags;
  v7 = *((_BYTE *)v4 + 88);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_paymentType != *((_DWORD *)v4 + 20))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_numberOfLegs != *((_DWORD *)v4 + 19))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    goto LABEL_21;
  }
  supportedPaymentMethods = self->_supportedPaymentMethods;
  if ((unint64_t)supportedPaymentMethods | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](supportedPaymentMethods, "isEqual:"))
      goto LABEL_21;
    flags = (char)self->_flags;
    v7 = *((_BYTE *)v4 + 88);
  }
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) != 0)
    {
      if (self->_cashOnly)
      {
        if (!*((_BYTE *)v4 + 84))
          goto LABEL_21;
      }
      else if (*((_BYTE *)v4 + 84))
      {
        goto LABEL_21;
      }
LABEL_27:
      IsEqual = PBRepeatedUInt32IsEqual();
      goto LABEL_22;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_27;
  }
LABEL_21:
  IsEqual = 0;
LABEL_22:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOTransitBaseFare readAll:](self, "readAll:", 1);
  v3 = -[GEOTransitPrice hash](self->_price, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_paymentType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_numberOfLegs;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSMutableArray hash](self->_supportedPaymentMethods, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v7 = 2654435761 * self->_cashOnly;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOTransitPrice *price;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  price = self->_price;
  v6 = *((_QWORD *)v4 + 6);
  if (price)
  {
    if (v6)
      -[GEOTransitPrice mergeFrom:](price, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOTransitBaseFare setPrice:](self, "setPrice:");
  }
  v7 = *((_BYTE *)v4 + 88);
  if ((v7 & 2) != 0)
  {
    self->_paymentType = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_flags |= 2u;
    v7 = *((_BYTE *)v4 + 88);
  }
  if ((v7 & 1) != 0)
  {
    self->_numberOfLegs = *((_DWORD *)v4 + 19);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = *((id *)v4 + 7);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        -[GEOTransitBaseFare addSupportedPaymentMethod:](self, "addSupportedPaymentMethod:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    self->_cashOnly = *((_BYTE *)v4 + 84);
    *(_BYTE *)&self->_flags |= 4u;
  }
  v13 = objc_msgSend(v4, "supportedPaymentMethodIndexsCount", (_QWORD)v16);
  if (v13)
  {
    v14 = v13;
    for (j = 0; j != v14; ++j)
      -[GEOTransitBaseFare addSupportedPaymentMethodIndex:](self, "addSupportedPaymentMethodIndex:", objc_msgSend(v4, "supportedPaymentMethodIndexAtIndex:", j));
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTransitBaseFareReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_158);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x88u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitBaseFare readAll:](self, "readAll:", 0);
    -[GEOTransitPrice clearUnknownFields:](self->_price, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_supportedPaymentMethods;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPaymentMethods, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (NSDecimalNumber)value
{
  void *v3;
  double v4;
  double v5;
  void *v6;

  if (-[GEOTransitBaseFare hasPrice](self, "hasPrice"))
  {
    -[GEOTransitBaseFare price](self, "price");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (double)(int)objc_msgSend(v3, "amountInCents");
    if (objc_msgSend(v3, "subunit"))
      v5 = (double)objc_msgSend(v3, "subunit");
    else
      v5 = 1.0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithDouble:", v4 / v5);

  }
  else
  {
    v6 = 0;
  }
  return (NSDecimalNumber *)v6;
}

- (NSString)currencyCode
{
  void *v2;
  void *v3;

  -[GEOTransitBaseFare price](self, "price");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currencyCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)type
{
  return -[GEOTransitBaseFare hasPaymentType](self, "hasPaymentType")
      && -[GEOTransitBaseFare paymentType](self, "paymentType") == 1;
}

- (NSArray)supportedICCardProviders
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[GEOTransitBaseFare supportedPaymentMethodsCount](self, "supportedPaymentMethodsCount"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GEOTransitBaseFare supportedPaymentMethods](self, "supportedPaymentMethods", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
        {
          objc_msgSend(v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v13;
}

@end
