@implementation GEOPBTransitPaymentMethodSuggestion

- (GEOPBTransitPaymentMethodSuggestion)init
{
  GEOPBTransitPaymentMethodSuggestion *v2;
  GEOPBTransitPaymentMethodSuggestion *v3;
  GEOPBTransitPaymentMethodSuggestion *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitPaymentMethodSuggestion;
  v2 = -[GEOPBTransitPaymentMethodSuggestion init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitPaymentMethodSuggestion)initWithData:(id)a3
{
  GEOPBTransitPaymentMethodSuggestion *v3;
  GEOPBTransitPaymentMethodSuggestion *v4;
  GEOPBTransitPaymentMethodSuggestion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitPaymentMethodSuggestion;
  v3 = -[GEOPBTransitPaymentMethodSuggestion initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPBTransitPaymentMethodSuggestion;
  -[GEOPBTransitPaymentMethodSuggestion dealloc](&v3, sel_dealloc);
}

- (void)_readPaymentMethodIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPaymentMethodIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)paymentMethodIndexsCount
{
  -[GEOPBTransitPaymentMethodSuggestion _readPaymentMethodIndexs]((uint64_t)self);
  return self->_paymentMethodIndexs.count;
}

- (unsigned)paymentMethodIndexs
{
  -[GEOPBTransitPaymentMethodSuggestion _readPaymentMethodIndexs]((uint64_t)self);
  return self->_paymentMethodIndexs.list;
}

- (void)clearPaymentMethodIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedUInt32Clear();
}

- (void)addPaymentMethodIndex:(unsigned int)a3
{
  -[GEOPBTransitPaymentMethodSuggestion _readPaymentMethodIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (unsigned)paymentMethodIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_paymentMethodIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPBTransitPaymentMethodSuggestion _readPaymentMethodIndexs]((uint64_t)self);
  p_paymentMethodIndexs = &self->_paymentMethodIndexs;
  count = self->_paymentMethodIndexs.count;
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
  return p_paymentMethodIndexs->list[a3];
}

- (void)setPaymentMethodIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedUInt32Set();
}

- (void)_readPaymentMethodSuggestionDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPaymentMethodSuggestionDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPaymentMethodSuggestionDetails
{
  -[GEOPBTransitPaymentMethodSuggestion _readPaymentMethodSuggestionDetails]((uint64_t)self);
  return self->_paymentMethodSuggestionDetails != 0;
}

- (GEOPBTransitPaymentMethodSuggestionDetails)paymentMethodSuggestionDetails
{
  -[GEOPBTransitPaymentMethodSuggestion _readPaymentMethodSuggestionDetails]((uint64_t)self);
  return self->_paymentMethodSuggestionDetails;
}

- (void)setPaymentMethodSuggestionDetails:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_paymentMethodSuggestionDetails, a3);
}

- (int)purpose
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_purpose;
  else
    return 0;
}

- (void)setPurpose:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_purpose = a3;
}

- (void)setHasPurpose:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasPurpose
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)purposeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0E020[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPurpose:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_PURPOSE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_PURPOSE_PRIMARY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_METHOD_PURPOSE_COVERAGE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0E038[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_SUGGESTION_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_SUGGESTION_TYPE_OPEN_LOOP_EXPRESS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_SUGGESTION_TYPE_OPEN_LOOP_NON_EXPRESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_SUGGESTION_TYPE_CLOSED_LOOP_DCI")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_SUGGESTION_TYPE_CLOSED_LOOP_NON_DCI")))
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
  v8.super_class = (Class)GEOPBTransitPaymentMethodSuggestion;
  -[GEOPBTransitPaymentMethodSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitPaymentMethodSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitPaymentMethodSuggestion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  char v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("paymentMethodIndex");
    else
      v6 = CFSTR("payment_method_index");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  objc_msgSend((id)a1, "paymentMethodSuggestionDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("paymentMethodSuggestionDetails");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("payment_method_suggestion_details");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  v11 = *(_BYTE *)(a1 + 76);
  if ((v11 & 1) != 0)
  {
    v12 = *(int *)(a1 + 68);
    if (v12 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E1C0E020[v12];
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("purpose"));

    v11 = *(_BYTE *)(a1 + 76);
  }
  if ((v11 & 2) != 0)
  {
    v14 = *(int *)(a1 + 72);
    if (v14 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 72));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E1C0E038[v14];
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("type"));

  }
  v16 = *(void **)(a1 + 16);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __65__GEOPBTransitPaymentMethodSuggestion__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitPaymentMethodSuggestion _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __65__GEOPBTransitPaymentMethodSuggestion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitPaymentMethodSuggestion)initWithDictionary:(id)a3
{
  return (GEOPBTransitPaymentMethodSuggestion *)-[GEOPBTransitPaymentMethodSuggestion _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v13;
  const __CFString *v14;
  void *v15;
  GEOPBTransitPaymentMethodSuggestionDetails *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("paymentMethodIndex");
      else
        v6 = CFSTR("payment_method_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v27 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addPaymentMethodIndex:", objc_msgSend(v13, "unsignedIntValue", (_QWORD)v26));
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v14 = CFSTR("paymentMethodSuggestionDetails");
      else
        v14 = CFSTR("payment_method_suggestion_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14, (_QWORD)v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOPBTransitPaymentMethodSuggestionDetails alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOPBTransitPaymentMethodSuggestionDetails initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOPBTransitPaymentMethodSuggestionDetails initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setPaymentMethodSuggestionDetails:", v17);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("purpose"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v19;
        if ((objc_msgSend(v20, "isEqualToString:", CFSTR("PAYMENT_METHOD_PURPOSE_UNKNOWN")) & 1) != 0)
        {
          v21 = 0;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("PAYMENT_METHOD_PURPOSE_PRIMARY")) & 1) != 0)
        {
          v21 = 1;
        }
        else if (objc_msgSend(v20, "isEqualToString:", CFSTR("PAYMENT_METHOD_PURPOSE_COVERAGE")))
        {
          v21 = 2;
        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_37;
        v21 = objc_msgSend(v19, "intValue");
      }
      objc_msgSend(a1, "setPurpose:", v21);
LABEL_37:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v22;
        if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PAYMENT_SUGGESTION_TYPE_UNKNOWN")) & 1) != 0)
        {
          v24 = 0;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PAYMENT_SUGGESTION_TYPE_OPEN_LOOP_EXPRESS")) & 1) != 0)
        {
          v24 = 1;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PAYMENT_SUGGESTION_TYPE_OPEN_LOOP_NON_EXPRESS")) & 1) != 0)
        {
          v24 = 2;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PAYMENT_SUGGESTION_TYPE_CLOSED_LOOP_DCI")) & 1) != 0)
        {
          v24 = 3;
        }
        else if (objc_msgSend(v23, "isEqualToString:", CFSTR("PAYMENT_SUGGESTION_TYPE_CLOSED_LOOP_NON_DCI")))
        {
          v24 = 4;
        }
        else
        {
          v24 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_53:

          goto LABEL_54;
        }
        v24 = objc_msgSend(v22, "intValue");
      }
      objc_msgSend(a1, "setType:", v24);
      goto LABEL_53;
    }
  }
LABEL_54:

  return a1;
}

- (GEOPBTransitPaymentMethodSuggestion)initWithJSON:(id)a3
{
  return (GEOPBTransitPaymentMethodSuggestion *)-[GEOPBTransitPaymentMethodSuggestion _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_604_1;
    else
      v8 = (int *)&readAll__nonRecursiveTag_605_1;
    GEOPBTransitPaymentMethodSuggestionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOPBTransitPaymentMethodSuggestionDetails readAll:](self->_paymentMethodSuggestionDetails, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitPaymentMethodSuggestionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitPaymentMethodSuggestionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  char flags;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBTransitPaymentMethodSuggestionIsDirty((uint64_t)self) & 1) == 0)
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPBTransitPaymentMethodSuggestion readAll:](self, "readAll:", 0);
    v5 = v10;
    if (self->_paymentMethodIndexs.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        v5 = v10;
        ++v6;
      }
      while (v6 < self->_paymentMethodIndexs.count);
    }
    if (self->_paymentMethodSuggestionDetails)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v10;
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v10;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  char flags;
  id *v8;

  v8 = (id *)a3;
  -[GEOPBTransitPaymentMethodSuggestion readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 14) = self->_readerMarkPos;
  *((_DWORD *)v8 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOPBTransitPaymentMethodSuggestion paymentMethodIndexsCount](self, "paymentMethodIndexsCount"))
  {
    objc_msgSend(v8, "clearPaymentMethodIndexs");
    v4 = -[GEOPBTransitPaymentMethodSuggestion paymentMethodIndexsCount](self, "paymentMethodIndexsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v8, "addPaymentMethodIndex:", -[GEOPBTransitPaymentMethodSuggestion paymentMethodIndexAtIndex:](self, "paymentMethodIndexAtIndex:", i));
    }
  }
  if (self->_paymentMethodSuggestionDetails)
    objc_msgSend(v8, "setPaymentMethodSuggestionDetails:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v8 + 17) = self->_purpose;
    *((_BYTE *)v8 + 76) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v8 + 18) = self->_type;
    *((_BYTE *)v8 + 76) |= 2u;
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
  PBUnknownFields *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPBTransitPaymentMethodSuggestionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitPaymentMethodSuggestion readAll:](self, "readAll:", 0);
  PBRepeatedUInt32Copy();
  v9 = -[GEOPBTransitPaymentMethodSuggestionDetails copyWithZone:](self->_paymentMethodSuggestionDetails, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_purpose;
    *(_BYTE *)(v5 + 76) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_type;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v12 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPBTransitPaymentMethodSuggestionDetails *paymentMethodSuggestionDetails;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOPBTransitPaymentMethodSuggestion readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_14;
  paymentMethodSuggestionDetails = self->_paymentMethodSuggestionDetails;
  if ((unint64_t)paymentMethodSuggestionDetails | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPBTransitPaymentMethodSuggestionDetails isEqual:](paymentMethodSuggestionDetails, "isEqual:"))
      goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_purpose != *((_DWORD *)v4 + 17))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  v6 = (*((_BYTE *)v4 + 76) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_type != *((_DWORD *)v4 + 18))
      goto LABEL_14;
    v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPBTransitPaymentMethodSuggestion readAll:](self, "readAll:", 1);
  v3 = PBRepeatedUInt32Hash();
  v4 = -[GEOPBTransitPaymentMethodSuggestionDetails hash](self->_paymentMethodSuggestionDetails, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5 = 2654435761 * self->_purpose;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_type;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  GEOPBTransitPaymentMethodSuggestionDetails *paymentMethodSuggestionDetails;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;

  v11 = a3;
  objc_msgSend(v11, "readAll:", 0);
  v4 = objc_msgSend(v11, "paymentMethodIndexsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOPBTransitPaymentMethodSuggestion addPaymentMethodIndex:](self, "addPaymentMethodIndex:", objc_msgSend(v11, "paymentMethodIndexAtIndex:", i));
  }
  paymentMethodSuggestionDetails = self->_paymentMethodSuggestionDetails;
  v8 = v11;
  v9 = v11[6];
  if (paymentMethodSuggestionDetails)
  {
    if (!v9)
      goto LABEL_10;
    -[GEOPBTransitPaymentMethodSuggestionDetails mergeFrom:](paymentMethodSuggestionDetails, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_10;
    -[GEOPBTransitPaymentMethodSuggestion setPaymentMethodSuggestionDetails:](self, "setPaymentMethodSuggestionDetails:");
  }
  v8 = v11;
LABEL_10:
  v10 = *((_BYTE *)v8 + 76);
  if ((v10 & 1) != 0)
  {
    self->_purpose = *((_DWORD *)v8 + 17);
    *(_BYTE *)&self->_flags |= 1u;
    v10 = *((_BYTE *)v8 + 76);
  }
  if ((v10 & 2) != 0)
  {
    self->_type = *((_DWORD *)v8 + 18);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitPaymentMethodSuggestionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_608);
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

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPBTransitPaymentMethodSuggestion readAll:](self, "readAll:", 0);
    -[GEOPBTransitPaymentMethodSuggestionDetails clearUnknownFields:](self->_paymentMethodSuggestionDetails, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethodSuggestionDetails, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
