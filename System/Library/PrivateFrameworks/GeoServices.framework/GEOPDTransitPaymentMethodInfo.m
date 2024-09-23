@implementation GEOPDTransitPaymentMethodInfo

- (GEOPDTransitPaymentMethodInfo)init
{
  GEOPDTransitPaymentMethodInfo *v2;
  GEOPDTransitPaymentMethodInfo *v3;
  GEOPDTransitPaymentMethodInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitPaymentMethodInfo;
  v2 = -[GEOPDTransitPaymentMethodInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTransitPaymentMethodInfo)initWithData:(id)a3
{
  GEOPDTransitPaymentMethodInfo *v3;
  GEOPDTransitPaymentMethodInfo *v4;
  GEOPDTransitPaymentMethodInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitPaymentMethodInfo;
  v3 = -[GEOPDTransitPaymentMethodInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPaymentMethodSuggestions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitPaymentMethodInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPaymentMethodSuggestions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)paymentMethodSuggestions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitPaymentMethodInfo _readPaymentMethodSuggestions]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addPaymentMethodSuggestion:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitPaymentMethodInfo _readPaymentMethodSuggestions](a1);
    -[GEOPDTransitPaymentMethodInfo _addNoFlagsPaymentMethodSuggestion:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsPaymentMethodSuggestion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readPaymentMethods
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitPaymentMethodInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPaymentMethods_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)paymentMethods
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitPaymentMethodInfo _readPaymentMethods]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)addPaymentMethod:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitPaymentMethodInfo _readPaymentMethods](a1);
    -[GEOPDTransitPaymentMethodInfo _addNoFlagsPaymentMethod:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsPaymentMethod:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

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
  v8.super_class = (Class)GEOPDTransitPaymentMethodInfo;
  -[GEOPDTransitPaymentMethodInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTransitPaymentMethodInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitPaymentMethodInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDTransitPaymentMethodInfo readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("paymentMethodSuggestion");
    else
      v13 = CFSTR("payment_method_suggestion");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v15 = *(id *)(a1 + 40);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("paymentMethod");
    else
      v22 = CFSTR("payment_method");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("cachingRadiusMeters");
    else
      v24 = CFSTR("caching_radius_meters");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  v25 = *(void **)(a1 + 16);
  if (v25)
  {
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __59__GEOPDTransitPaymentMethodInfo__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E1C00600;
      v29 = v28;
      v33 = v29;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v32);
      v30 = v29;

      v27 = v30;
    }
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitPaymentMethodInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_7068;
      else
        v6 = (int *)&readAll__nonRecursiveTag_7069;
      GEOPDTransitPaymentMethodInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDTransitPaymentMethodInfoCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __59__GEOPDTransitPaymentMethodInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitPaymentMethodInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v14 = self->_paymentMethods;
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v29 != v16)
              objc_enumerationMutation(v14);
            if (GEOPBTransitPaymentMethodIsDirty(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i)))
            {

              goto LABEL_3;
            }
          }
          v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          if (v15)
            continue;
          break;
        }
      }

    }
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
LABEL_3:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTransitPaymentMethodInfo readAll:]((uint64_t)self, 0);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = self->_paymentMethodSuggestions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v7; ++j)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v7);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = self->_paymentMethods;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        for (k = 0; k != v11; ++k)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v11);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  PBUnknownFields *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDTransitPaymentMethodInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitPaymentMethodInfo readAll:]((uint64_t)self, 0);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = self->_paymentMethodSuggestions;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDTransitPaymentMethodInfo addPaymentMethodSuggestion:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_paymentMethods;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v21);
        -[GEOPDTransitPaymentMethodInfo addPaymentMethod:](v5, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_cachingRadiusMeters;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *paymentMethodSuggestions;
  NSMutableArray *paymentMethods;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOPDTransitPaymentMethodInfo readAll:]((uint64_t)self, 1);
  -[GEOPDTransitPaymentMethodInfo readAll:]((uint64_t)v4, 1);
  paymentMethodSuggestions = self->_paymentMethodSuggestions;
  if ((unint64_t)paymentMethodSuggestions | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](paymentMethodSuggestions, "isEqual:"))
      goto LABEL_10;
  }
  paymentMethods = self->_paymentMethods;
  if ((unint64_t)paymentMethods | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](paymentMethods, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) != 0 && self->_cachingRadiusMeters == *((double *)v4 + 3))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double cachingRadiusMeters;
  double v7;
  long double v8;
  double v9;

  -[GEOPDTransitPaymentMethodInfo readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_paymentMethodSuggestions, "hash");
  v4 = -[NSMutableArray hash](self->_paymentMethods, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    cachingRadiusMeters = self->_cachingRadiusMeters;
    v7 = -cachingRadiusMeters;
    if (cachingRadiusMeters >= 0.0)
      v7 = self->_cachingRadiusMeters;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethods, 0);
  objc_storeStrong((id *)&self->_paymentMethodSuggestions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
