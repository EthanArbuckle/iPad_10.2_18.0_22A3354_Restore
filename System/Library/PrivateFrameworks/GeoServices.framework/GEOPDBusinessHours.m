@implementation GEOPDBusinessHours

+ (id)businessHoursForPlaceData:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = (id)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__GEOPDBusinessHours_PlaceDataExtras__businessHoursForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 64, v6);
  v4 = (void *)objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__GEOPDBusinessHours_PlaceDataExtras__businessHoursForPlaceData___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  -[GEOPDComponentValue businessHours](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
    v5 = v6;
  }
  else
  {
    *a3 = 1;
  }

}

- (GEOPDBusinessHours)init
{
  GEOPDBusinessHours *v2;
  GEOPDBusinessHours *v3;
  GEOPDBusinessHours *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDBusinessHours;
  v2 = -[GEOPDBusinessHours init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDBusinessHours)initWithData:(id)a3
{
  GEOPDBusinessHours *v3;
  GEOPDBusinessHours *v4;
  GEOPDBusinessHours *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDBusinessHours;
  v3 = -[GEOPDBusinessHours initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWeeklyHours
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBusinessHoursReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWeeklyHours_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)weeklyHours
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBusinessHours _readWeeklyHours]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)setWeeklyHours:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 88) |= 0x100u;
    objc_storeStrong((id *)(a1 + 64), a2);
  }

}

- (void)addWeeklyHours:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDBusinessHours _readWeeklyHours](a1);
    -[GEOPDBusinessHours _addNoFlagsWeeklyHours:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 88) |= 0x100u;
  }
}

- (void)_addNoFlagsWeeklyHours:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readMessage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBusinessHoursReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMessage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)message
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBusinessHours _readMessage]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (uint64_t)hoursType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 88);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if ((v2 & 4) != 0)
      return *(unsigned int *)(v1 + 84);
    else
      return 0;
  }
  return result;
}

- (void)_readHoursThreshold
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDBusinessHoursReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHoursThreshold_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)hoursThreshold
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDBusinessHours _readHoursThreshold]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
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
  v8.super_class = (Class)GEOPDBusinessHours;
  -[GEOPDBusinessHours description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBusinessHours dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBusinessHours _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDBusinessHours readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v6 = *(id *)(a1 + 64);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v42 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v10, "jsonRepresentation");
          else
            objc_msgSend(v10, "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v7);
    }

    if (a2)
      v12 = CFSTR("weeklyHours");
    else
      v12 = CFSTR("weekly_hours");
    objc_msgSend(v4, "setObject:forKey:", v5, v12);

  }
  v13 = *(_WORD *)(a1 + 88);
  if ((v13 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("start"));

    v13 = *(_WORD *)(a1 + 88);
  }
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("end"));

  }
  -[GEOPDBusinessHours message]((id *)a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v16, "jsonRepresentation");
    else
      objc_msgSend(v16, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("message"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
  {
    v19 = *(void **)(a1 + 8);
    if (v19)
    {
      v20 = v19;
      objc_sync_enter(v20);
      GEOPDBusinessHoursReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShortMessage_tags);
      objc_sync_exit(v20);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v21 = *(id *)(a1 + 48);
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("shortMessage");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("short_message");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  if ((*(_WORD *)(a1 + 88) & 4) != 0)
  {
    v25 = *(int *)(a1 + 84);
    if (v25 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E1C0B780[v25];
    }
    if (a2)
      v27 = CFSTR("hoursType");
    else
      v27 = CFSTR("hours_type");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  -[GEOPDBusinessHours hoursThreshold]((id *)a1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("hoursThreshold");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("hours_threshold");
    }
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  v32 = *(void **)(a1 + 16);
  if (v32)
  {
    objc_msgSend(v32, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v33, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __48__GEOPDBusinessHours__dictionaryRepresentation___block_invoke;
      v39[3] = &unk_1E1C00600;
      v36 = v35;
      v40 = v36;
      objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v39);
      v37 = v36;

    }
    else
    {
      v37 = v33;
    }
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDBusinessHours _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_775;
      else
        v6 = (int *)&readAll__nonRecursiveTag_776;
      GEOPDBusinessHoursReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDBusinessHoursCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __48__GEOPDBusinessHours__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  GEOPDHours *v15;
  GEOPDHours *v16;
  GEOPDHours *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  GEOLocalizedString *v23;
  GEOLocalizedString *v24;
  GEOLocalizedString *v25;
  GEOLocalizedString *v26;
  const __CFString *v27;
  void *v28;
  GEOLocalizedString *v29;
  GEOLocalizedString *v30;
  GEOLocalizedString *v31;
  GEOLocalizedString *v32;
  const __CFString *v33;
  void *v34;
  id v35;
  int v36;
  const __CFString *v37;
  void *v38;
  GEOPDHoursThreshold *v39;
  void *v40;
  id v41;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_63;
  if (a3)
    v7 = CFSTR("weeklyHours");
  else
    v7 = CFSTR("weekly_hours");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = v5;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v45 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = [GEOPDHours alloc];
            if ((a3 & 1) != 0)
              v16 = -[GEOPDHours initWithJSON:](v15, "initWithJSON:", v14);
            else
              v16 = -[GEOPDHours initWithDictionary:](v15, "initWithDictionary:", v14);
            v17 = v16;
            -[GEOPDBusinessHours addWeeklyHours:](v6, v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v11);
    }

    v5 = v43;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("start"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = objc_msgSend(v18, "unsignedLongLongValue");
    *(_WORD *)(v6 + 88) |= 0x100u;
    *(_WORD *)(v6 + 88) |= 2u;
    *(_QWORD *)(v6 + 56) = v19;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("end"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_msgSend(v20, "unsignedLongLongValue");
    *(_WORD *)(v6 + 88) |= 0x100u;
    *(_WORD *)(v6 + 88) |= 1u;
    *(_QWORD *)(v6 + 24) = v21;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("message"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = [GEOLocalizedString alloc];
    if ((a3 & 1) != 0)
      v24 = -[GEOLocalizedString initWithJSON:](v23, "initWithJSON:", v22);
    else
      v24 = -[GEOLocalizedString initWithDictionary:](v23, "initWithDictionary:", v22);
    v25 = v24;
    v26 = v24;
    *(_WORD *)(v6 + 88) |= 0x20u;
    *(_WORD *)(v6 + 88) |= 0x100u;
    objc_storeStrong((id *)(v6 + 40), v25);

  }
  if (a3)
    v27 = CFSTR("shortMessage");
  else
    v27 = CFSTR("short_message");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = [GEOLocalizedString alloc];
    if ((a3 & 1) != 0)
      v30 = -[GEOLocalizedString initWithJSON:](v29, "initWithJSON:", v28);
    else
      v30 = -[GEOLocalizedString initWithDictionary:](v29, "initWithDictionary:", v28);
    v31 = v30;
    v32 = v30;
    *(_WORD *)(v6 + 88) |= 0x40u;
    *(_WORD *)(v6 + 88) |= 0x100u;
    objc_storeStrong((id *)(v6 + 48), v31);

  }
  if (a3)
    v33 = CFSTR("hoursType");
  else
    v33 = CFSTR("hours_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = v34;
    if ((objc_msgSend(v35, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v36 = 0;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("NORMAL")) & 1) != 0)
    {
      v36 = 1;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("SPECIAL")) & 1) != 0)
    {
      v36 = 2;
    }
    else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TEMPORARY_CLOSURE")) & 1) != 0)
    {
      v36 = 3;
    }
    else if (objc_msgSend(v35, "isEqualToString:", CFSTR("PERMANENT_CLOSURE")))
    {
      v36 = 4;
    }
    else
    {
      v36 = 0;
    }

    goto LABEL_54;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = objc_msgSend(v34, "intValue");
LABEL_54:
    *(_WORD *)(v6 + 88) |= 0x100u;
    *(_WORD *)(v6 + 88) |= 4u;
    *(_DWORD *)(v6 + 84) = v36;
  }

  if (a3)
    v37 = CFSTR("hoursThreshold");
  else
    v37 = CFSTR("hours_threshold");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = [GEOPDHoursThreshold alloc];
    if (v39)
      v40 = (void *)-[GEOPDHoursThreshold _initWithDictionary:isJSON:](v39, v38, a3);
    else
      v40 = 0;
    v41 = v40;
    *(_WORD *)(v6 + 88) |= 0x10u;
    *(_WORD *)(v6 + 88) |= 0x100u;
    objc_storeStrong((id *)(v6 + 32), v40);

  }
LABEL_63:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDBusinessHoursReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 flags;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDBusinessHoursIsDirty((uint64_t)self) & 1) == 0)
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDBusinessHours readAll:]((uint64_t)self, 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_weeklyHours;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_message)
      PBDataWriterWriteSubmessage();
    if (self->_shortMessage)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_hoursThreshold)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
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
  __int16 flags;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  PBUnknownFields *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDBusinessHoursReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDBusinessHours readAll:]((uint64_t)self, 0);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = self->_weeklyHours;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v23);
        -[GEOPDBusinessHours addWeeklyHours:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_start;
    *(_WORD *)(v5 + 88) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_end;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  v15 = -[GEOLocalizedString copyWithZone:](self->_message, "copyWithZone:", a3, (_QWORD)v23);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = -[GEOLocalizedString copyWithZone:](self->_shortMessage, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_hoursType;
    *(_WORD *)(v5 + 88) |= 4u;
  }
  v19 = -[GEOPDHoursThreshold copyWithZone:](self->_hoursThreshold, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v19;

  v21 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *weeklyHours;
  __int16 flags;
  __int16 v7;
  GEOLocalizedString *message;
  GEOLocalizedString *shortMessage;
  __int16 v10;
  GEOPDHoursThreshold *hoursThreshold;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEOPDBusinessHours readAll:]((uint64_t)self, 1);
  -[GEOPDBusinessHours readAll:]((uint64_t)v4, 1);
  weeklyHours = self->_weeklyHours;
  if ((unint64_t)weeklyHours | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](weeklyHours, "isEqual:"))
      goto LABEL_25;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 44);
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_start != *((_QWORD *)v4 + 7))
      goto LABEL_25;
  }
  else if ((v7 & 2) != 0)
  {
LABEL_25:
    v12 = 0;
    goto LABEL_26;
  }
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_end != *((_QWORD *)v4 + 3))
      goto LABEL_25;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_25;
  }
  message = self->_message;
  if ((unint64_t)message | *((_QWORD *)v4 + 5) && !-[GEOLocalizedString isEqual:](message, "isEqual:"))
    goto LABEL_25;
  shortMessage = self->_shortMessage;
  if ((unint64_t)shortMessage | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLocalizedString isEqual:](shortMessage, "isEqual:"))
      goto LABEL_25;
  }
  v10 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_hoursType != *((_DWORD *)v4 + 21))
      goto LABEL_25;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_25;
  }
  hoursThreshold = self->_hoursThreshold;
  if ((unint64_t)hoursThreshold | *((_QWORD *)v4 + 4))
    v12 = -[GEOPDHoursThreshold isEqual:](hoursThreshold, "isEqual:");
  else
    v12 = 1;
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  __int16 flags;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  -[GEOPDBusinessHours readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_weeklyHours, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v5 = 2654435761u * self->_start;
    if ((flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((flags & 1) != 0)
    {
LABEL_3:
      v6 = 2654435761u * self->_end;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = -[GEOLocalizedString hash](self->_message, "hash");
  v8 = -[GEOLocalizedString hash](self->_shortMessage, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v9 = 2654435761 * self->_hoursType;
  else
    v9 = 0;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[GEOPDHoursThreshold hash](self->_hoursThreshold, "hash");
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 8u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDBusinessHours readAll:](a1, 0);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = *(id *)(a1 + 64);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "clearUnknownFields:", 1, (_QWORD)v10);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    objc_msgSend(*(id *)(a1 + 40), "clearUnknownFields:", 1);
    objc_msgSend(*(id *)(a1 + 48), "clearUnknownFields:", 1);
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = *(void **)(v8 + 8);
      *(_QWORD *)(v8 + 8) = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weeklyHours, 0);
  objc_storeStrong((id *)&self->_shortMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_hoursThreshold, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
