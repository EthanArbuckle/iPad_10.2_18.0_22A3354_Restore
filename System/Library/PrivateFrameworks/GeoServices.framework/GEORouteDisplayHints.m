@implementation GEORouteDisplayHints

- (NSArray)prioritizationOptions
{
  void *v3;
  unint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[GEORouteDisplayHints availablePrioritizationsCount](self, "availablePrioritizationsCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[GEORouteDisplayHints availablePrioritizationsCount](self, "availablePrioritizationsCount"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[GEORouteDisplayHints availablePrioritizationAtIndex:](self, "availablePrioritizationAtIndex:", v4));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[GEORouteDisplayHints availablePrioritizationsCount](self, "availablePrioritizationsCount"));
  }
  return (NSArray *)v3;
}

- (GEORouteDisplayHints)init
{
  GEORouteDisplayHints *v2;
  GEORouteDisplayHints *v3;
  GEORouteDisplayHints *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORouteDisplayHints;
  v2 = -[GEORouteDisplayHints init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteDisplayHints)initWithData:(id)a3
{
  GEORouteDisplayHints *v3;
  GEORouteDisplayHints *v4;
  GEORouteDisplayHints *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORouteDisplayHints;
  v3 = -[GEORouteDisplayHints initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORouteDisplayHints;
  -[GEORouteDisplayHints dealloc](&v3, sel_dealloc);
}

- (BOOL)showTransitSchedules
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 1) == 0 || self->_showTransitSchedules;
}

- (void)setShowTransitSchedules:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_showTransitSchedules = a3;
}

- (void)setHasShowTransitSchedules:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasShowTransitSchedules
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readAvailablePrioritizations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteDisplayHintsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAvailablePrioritizations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)availablePrioritizationsCount
{
  -[GEORouteDisplayHints _readAvailablePrioritizations]((uint64_t)self);
  return self->_availablePrioritizations.count;
}

- (int)availablePrioritizations
{
  -[GEORouteDisplayHints _readAvailablePrioritizations]((uint64_t)self);
  return self->_availablePrioritizations.list;
}

- (void)clearAvailablePrioritizations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedInt32Clear();
}

- (void)addAvailablePrioritization:(int)a3
{
  -[GEORouteDisplayHints _readAvailablePrioritizations]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (int)availablePrioritizationAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_availablePrioritizations;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORouteDisplayHints _readAvailablePrioritizations]((uint64_t)self);
  p_availablePrioritizations = &self->_availablePrioritizations;
  count = self->_availablePrioritizations.count;
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
  return p_availablePrioritizations->list[a3];
}

- (void)setAvailablePrioritizations:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedInt32Set();
}

- (id)availablePrioritizationsAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C20418[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAvailablePrioritizations:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_TRAVEL_TIME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_TRANSFER_COUNT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_WALKING_DISTANCE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readAvailablePaymentTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 96) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteDisplayHintsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAvailablePaymentTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)availablePaymentTypesCount
{
  -[GEORouteDisplayHints _readAvailablePaymentTypes]((uint64_t)self);
  return self->_availablePaymentTypes.count;
}

- (int)availablePaymentTypes
{
  -[GEORouteDisplayHints _readAvailablePaymentTypes]((uint64_t)self);
  return self->_availablePaymentTypes.list;
}

- (void)clearAvailablePaymentTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedInt32Clear();
}

- (void)addAvailablePaymentType:(int)a3
{
  -[GEORouteDisplayHints _readAvailablePaymentTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (int)availablePaymentTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_availablePaymentTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORouteDisplayHints _readAvailablePaymentTypes]((uint64_t)self);
  p_availablePaymentTypes = &self->_availablePaymentTypes;
  count = self->_availablePaymentTypes.count;
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
  return p_availablePaymentTypes->list[a3];
}

- (void)setAvailablePaymentTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedInt32Set();
}

- (id)availablePaymentTypesAsString:(int)a3
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

- (int)StringAsAvailablePaymentTypes:(id)a3
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

- (void)_readTransitSurchargeOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteDisplayHintsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitSurchargeOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasTransitSurchargeOptions
{
  -[GEORouteDisplayHints _readTransitSurchargeOptions]((uint64_t)self);
  return self->_transitSurchargeOptions != 0;
}

- (GEORequestOptions)transitSurchargeOptions
{
  -[GEORouteDisplayHints _readTransitSurchargeOptions]((uint64_t)self);
  return self->_transitSurchargeOptions;
}

- (void)setTransitSurchargeOptions:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_transitSurchargeOptions, a3);
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
  v8.super_class = (Class)GEORouteDisplayHints;
  -[GEORouteDisplayHints description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteDisplayHints dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteDisplayHints _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  int v30;
  _QWORD v31[4];
  id v32;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 96) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 92));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("showTransitSchedules");
    else
      v6 = CFSTR("show_transit_schedules");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v9 = 0;
      do
      {
        v10 = *(int *)(*v8 + 4 * v9);
        if (v10 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = off_1E1C20418[v10];
        }
        objc_msgSend(v7, "addObject:", v11);

        ++v9;
        v8 = (_QWORD *)(a1 + 48);
      }
      while (v9 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v12 = CFSTR("availablePrioritization");
    else
      v12 = CFSTR("available_prioritization");
    objc_msgSend(v4, "setObject:forKey:", v7, v12);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v30 = a2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v15 = 0;
      do
      {
        v16 = *(unsigned int *)(*v14 + 4 * v15);
        if ((_DWORD)v16)
        {
          if ((_DWORD)v16 == 1)
          {
            v17 = CFSTR("PAYMENT_TYPE_IC_CARD");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v17 = CFSTR("PAYMENT_TYPE_UNKNOWN");
        }
        objc_msgSend(v13, "addObject:", v17);

        ++v15;
        v14 = (_QWORD *)(a1 + 24);
      }
      while (v15 < *(_QWORD *)(a1 + 32));
    }
    a2 = v30;
    if (v30)
      v18 = CFSTR("availablePaymentType");
    else
      v18 = CFSTR("available_payment_type");
    objc_msgSend(v4, "setObject:forKey:", v13, v18);

  }
  objc_msgSend((id)a1, "transitSurchargeOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("transitSurchargeOptions");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("transit_surcharge_options");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  v23 = *(void **)(a1 + 16);
  if (v23)
  {
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __50__GEORouteDisplayHints__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E1C00600;
      v27 = v26;
      v32 = v27;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v31);
      v28 = v27;

      v25 = v28;
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORouteDisplayHints _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEORouteDisplayHints__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORouteDisplayHints)initWithDictionary:(id)a3
{
  return (GEORouteDisplayHints *)-[GEORouteDisplayHints _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  GEORequestOptions *v31;
  void *v32;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("showTransitSchedules");
      else
        v7 = CFSTR("show_transit_schedules");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setShowTransitSchedules:", objc_msgSend(v8, "BOOLValue"));

      if (a3)
        v9 = CFSTR("availablePrioritization");
      else
        v9 = CFSTR("available_prioritization");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v36 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v34 = v10;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (!v12)
          goto LABEL_33;
        v13 = v12;
        v14 = *(_QWORD *)v42;
        while (1)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v42 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = v16;
              if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_DEFAULT")) & 1) != 0)
              {
                v18 = 0;
              }
              else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_TRAVEL_TIME")) & 1) != 0)
              {
                v18 = 1;
              }
              else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_TRANSFER_COUNT")) & 1) != 0)
              {
                v18 = 2;
              }
              else if (objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_WALKING_DISTANCE")))
              {
                v18 = 3;
              }
              else
              {
                v18 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v18 = objc_msgSend(v16, "intValue");
            }
            objc_msgSend(v6, "addAvailablePrioritization:", v18);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
          if (!v13)
          {
LABEL_33:

            v5 = v36;
            v10 = v34;
            break;
          }
        }
      }

      if (a3)
        v19 = CFSTR("availablePaymentType");
      else
        v19 = CFSTR("available_payment_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = v20;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (!v22)
          goto LABEL_53;
        v23 = v22;
        v24 = *(_QWORD *)v38;
        while (1)
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v38 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = v26;
              if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PAYMENT_TYPE_UNKNOWN")) & 1) != 0)
                v28 = 0;
              else
                v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("PAYMENT_TYPE_IC_CARD"));

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v28 = objc_msgSend(v26, "intValue");
            }
            objc_msgSend(v6, "addAvailablePaymentType:", v28);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (!v23)
          {
LABEL_53:

            v5 = v36;
            v20 = v35;
            break;
          }
        }
      }

      if (a3)
        v29 = CFSTR("transitSurchargeOptions");
      else
        v29 = CFSTR("transit_surcharge_options");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = [GEORequestOptions alloc];
        if (v31)
          v32 = (void *)-[GEORequestOptions _initWithDictionary:isJSON:]((uint64_t)v31, v30, a3);
        else
          v32 = 0;
        objc_msgSend(v6, "setTransitSurchargeOptions:", v32);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEORouteDisplayHints)initWithJSON:(id)a3
{
  return (GEORouteDisplayHints *)-[GEORouteDisplayHints _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1095;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1096;
    GEORouteDisplayHintsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteDisplayHintsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteDisplayHintsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3C) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORouteDisplayHints readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_availablePrioritizations.count)
    {
      PBDataWriterPlaceMark();
      if (self->_availablePrioritizations.count)
      {
        v6 = 0;
        do
        {
          PBDataWriterWriteInt32Field();
          ++v6;
        }
        while (v6 < self->_availablePrioritizations.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_availablePaymentTypes.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_availablePaymentTypes.count);
    }
    if (self->_transitSurchargeOptions)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  id *v10;

  v10 = (id *)a3;
  -[GEORouteDisplayHints readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 20) = self->_readerMarkPos;
  *((_DWORD *)v10 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v10 + 92) = self->_showTransitSchedules;
    *((_BYTE *)v10 + 96) |= 1u;
  }
  if (-[GEORouteDisplayHints availablePrioritizationsCount](self, "availablePrioritizationsCount"))
  {
    objc_msgSend(v10, "clearAvailablePrioritizations");
    v4 = -[GEORouteDisplayHints availablePrioritizationsCount](self, "availablePrioritizationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v10, "addAvailablePrioritization:", -[GEORouteDisplayHints availablePrioritizationAtIndex:](self, "availablePrioritizationAtIndex:", i));
    }
  }
  if (-[GEORouteDisplayHints availablePaymentTypesCount](self, "availablePaymentTypesCount"))
  {
    objc_msgSend(v10, "clearAvailablePaymentTypes");
    v7 = -[GEORouteDisplayHints availablePaymentTypesCount](self, "availablePaymentTypesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v10, "addAvailablePaymentType:", -[GEORouteDisplayHints availablePaymentTypeAtIndex:](self, "availablePaymentTypeAtIndex:", j));
    }
  }
  if (self->_transitSurchargeOptions)
    objc_msgSend(v10, "setTransitSurchargeOptions:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  PBUnknownFields *v11;

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
      GEORouteDisplayHintsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORouteDisplayHints readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 92) = self->_showTransitSchedules;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  v9 = -[GEORequestOptions copyWithZone:](self->_transitSurchargeOptions, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  v11 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORequestOptions *transitSurchargeOptions;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEORouteDisplayHints readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) != 0)
    {
      if (self->_showTransitSchedules)
      {
        if (!*((_BYTE *)v4 + 92))
          goto LABEL_14;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 92))
        goto LABEL_10;
    }
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*((_BYTE *)v4 + 96) & 1) != 0)
    goto LABEL_14;
LABEL_10:
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual())
    goto LABEL_14;
  transitSurchargeOptions = self->_transitSurchargeOptions;
  if ((unint64_t)transitSurchargeOptions | *((_QWORD *)v4 + 9))
    v6 = -[GEORequestOptions isEqual:](transitSurchargeOptions, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEORouteDisplayHints readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_showTransitSchedules;
  else
    v3 = 0;
  v4 = PBRepeatedInt32Hash() ^ v3;
  v5 = v4 ^ PBRepeatedInt32Hash();
  return v5 ^ -[GEORequestOptions hash](self->_transitSurchargeOptions, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  GEORequestOptions *transitSurchargeOptions;
  BOOL *v11;
  void *v12;
  BOOL *v13;

  v13 = (BOOL *)a3;
  objc_msgSend(v13, "readAll:", 0);
  if (v13[96])
  {
    self->_showTransitSchedules = v13[92];
    *(_BYTE *)&self->_flags |= 1u;
  }
  v4 = objc_msgSend(v13, "availablePrioritizationsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEORouteDisplayHints addAvailablePrioritization:](self, "addAvailablePrioritization:", objc_msgSend(v13, "availablePrioritizationAtIndex:", i));
  }
  v7 = objc_msgSend(v13, "availablePaymentTypesCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
      -[GEORouteDisplayHints addAvailablePaymentType:](self, "addAvailablePaymentType:", objc_msgSend(v13, "availablePaymentTypeAtIndex:", j));
  }
  transitSurchargeOptions = self->_transitSurchargeOptions;
  v11 = v13;
  v12 = (void *)*((_QWORD *)v13 + 9);
  if (transitSurchargeOptions)
  {
    if (v12)
    {
      -[GEORequestOptions mergeFrom:]((uint64_t)transitSurchargeOptions, v12);
LABEL_14:
      v11 = v13;
    }
  }
  else if (v12)
  {
    -[GEORouteDisplayHints setTransitSurchargeOptions:](self, "setTransitSurchargeOptions:", *((_QWORD *)v13 + 9));
    goto LABEL_14;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORouteDisplayHintsReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_1099);
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
  *(_BYTE *)&self->_flags |= 0x22u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORouteDisplayHints readAll:](self, "readAll:", 0);
    -[GEORequestOptions clearUnknownFields:]((uint64_t)self->_transitSurchargeOptions, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitSurchargeOptions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
