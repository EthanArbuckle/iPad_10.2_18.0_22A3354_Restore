@implementation GEOPDFactoid

+ (BOOL)factoidPairAvailableForPlaceData:(id)a3
{
  id v3;
  BOOL v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__GEOPDFactoid_PlaceDataExtras__factoidPairAvailableForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 23, v6);
  v4 = *((_DWORD *)v8 + 6) > 1u;
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __66__GEOPDFactoid_PlaceDataExtras__factoidPairAvailableForPlaceData___block_invoke(uint64_t result, uint64_t a2, BOOL *a3)
{
  if (a2)
  {
    if (*(_QWORD *)(a2 + 232))
      *a3 = ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) > 1u;
  }
  return result;
}

+ (id)factoidsForPlaceData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__GEOPDFactoid_PlaceDataExtras__factoidsForPlaceData___block_invoke;
  v10[3] = &unk_1E1C09968;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateValidComponentValuesOfType:usingBlock:", 23, v10);

  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

void __54__GEOPDFactoid_PlaceDataExtras__factoidsForPlaceData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (v3 && *((_QWORD *)v3 + 29))
  {
    v4 = *(void **)(a1 + 32);
    v6 = v3;
    -[GEOPDComponentValue factoid]((id *)v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    v3 = v6;
  }

}

- (id)bestLocalizedPlaceName
{
  void *v2;
  void *v3;

  -[GEOPDFactoid placeNames]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
    *(_WORD *)(a1 + 112) |= 0x10u;
    *(_WORD *)(a1 + 112) |= 0x1000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDFactoid readAll:](a1, 0);
    objc_msgSend(*(id *)(a1 + 48), "clearUnknownFields:", 1);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = *(id *)(a1 + 56);
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

    v8 = *(_QWORD *)(a1 + 24);
    if (v8)
    {
      v9 = *(void **)(v8 + 8);
      *(_QWORD *)(v8 + 8) = 0;

    }
  }
}

- (GEOPDFactoid)init
{
  GEOPDFactoid *v2;
  GEOPDFactoid *v3;
  GEOPDFactoid *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDFactoid;
  v2 = -[GEOPDFactoid init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDFactoid)initWithData:(id)a3
{
  GEOPDFactoid *v3;
  GEOPDFactoid *v4;
  GEOPDFactoid *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDFactoid;
  v3 = -[GEOPDFactoid initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDFactoidReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_3915);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)title
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDFactoid _readTitle]((uint64_t)a1);
    a1 = (id *)v1[10];
  }
  return a1;
}

- (void)_readText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDFactoidReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readText_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)text
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDFactoid _readText]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)_readIcon
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDFactoidReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIcon_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)icon
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDFactoid _readIcon]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (uint64_t)unit
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 112);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 96));
    if ((v2 & 4) != 0)
      return *(unsigned int *)(v1 + 104);
    else
      return 0;
  }
  return result;
}

- (void)_readPlaceId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDFactoidReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceId_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)placeId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDFactoid _readPlaceId]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readPlaceNames
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDFactoidReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceNames_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)placeNames
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDFactoid _readPlaceNames]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)addPlaceName:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDFactoid _readPlaceNames](a1);
    -[GEOPDFactoid _addNoFlagsPlaceName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 112) |= 0x1000u;
  }
}

- (void)_addNoFlagsPlaceName:(uint64_t)a1
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

- (uint64_t)entryType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 112);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 96));
    if ((v2 & 2) != 0)
      return *(unsigned int *)(v1 + 100);
    else
      return 0;
  }
  return result;
}

- (void)_readColor
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDFactoidReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readColor_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)color
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDFactoid _readColor]((uint64_t)a1);
    a1 = (id *)v1[3];
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
  v8.super_class = (Class)GEOPDFactoid;
  -[GEOPDFactoid description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDFactoid dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDFactoid _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  __CFString *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  id v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDFactoid readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDFactoid title]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("title"));

  -[GEOPDFactoid text]((id *)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("text"));

  if ((*(_WORD *)(a1 + 112) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("number"));

  }
  -[GEOPDFactoid icon]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("icon"));

  if ((*(_WORD *)(a1 + 112) & 4) != 0)
  {
    v9 = *(int *)(a1 + 104);
    if (v9 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 104));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C0BA68[v9];
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("unit"));

  }
  -[GEOPDFactoid placeId]((id *)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("placeId");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("place_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v16 = *(id *)(a1 + 56);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v46 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("placeName");
    else
      v22 = CFSTR("place_name");
    objc_msgSend(v4, "setObject:forKey:", v15, v22);

  }
  v23 = *(_WORD *)(a1 + 112);
  if ((v23 & 2) != 0)
  {
    v24 = *(int *)(a1 + 100);
    if (v24 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 100));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_1E1C0BAB0[v24];
    }
    if (a2)
      v26 = CFSTR("entryType");
    else
      v26 = CFSTR("entry_type");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

    v23 = *(_WORD *)(a1 + 112);
  }
  if ((v23 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 108));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("canBeDisplayedInPlaceSummary");
    else
      v28 = CFSTR("can_be_displayed_in_place_summary");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
  {
    v29 = *(void **)(a1 + 8);
    if (v29)
    {
      v30 = v29;
      objc_sync_enter(v30);
      GEOPDFactoidReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSymbolColor_tags);
      objc_sync_exit(v30);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v31 = *(id *)(a1 + 64);
  if (v31)
  {
    if (a2)
      v32 = CFSTR("symbolColor");
    else
      v32 = CFSTR("symbol_color");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);
  }

  -[GEOPDFactoid color]((id *)a1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v33, "jsonRepresentation");
    else
      objc_msgSend(v33, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("color"));

  }
  v36 = *(void **)(a1 + 16);
  if (v36)
  {
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __42__GEOPDFactoid__dictionaryRepresentation___block_invoke;
      v43[3] = &unk_1E1C00600;
      v40 = v39;
      v44 = v40;
      objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v43);
      v41 = v40;

    }
    else
    {
      v41 = v37;
    }
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDFactoid _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_3943;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3944;
      GEOPDFactoidReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDFactoidCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

void __42__GEOPDFactoid__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  const __CFString *v21;
  void *v22;
  GEOPDMapsIdentifier *v23;
  GEOPDMapsIdentifier *v24;
  GEOPDMapsIdentifier *v25;
  GEOPDMapsIdentifier *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  GEOLocalizedString *v35;
  GEOLocalizedString *v36;
  GEOLocalizedString *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  int v41;
  const __CFString *v42;
  void *v43;
  char v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  GEOPDColor *v50;
  id v51;
  void *v52;
  id v53;
  int v54;
  GEOPDColor *v55;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      v9 = v8;
      *(_WORD *)(v6 + 112) |= 0x800u;
      *(_WORD *)(v6 + 112) |= 0x1000u;
      objc_storeStrong((id *)(v6 + 80), v8);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("text"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      v12 = v11;
      *(_WORD *)(v6 + 112) |= 0x400u;
      *(_WORD *)(v6 + 112) |= 0x1000u;
      objc_storeStrong((id *)(v6 + 72), v11);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("number"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "doubleValue");
      *(_WORD *)(v6 + 112) |= 0x1000u;
      *(_WORD *)(v6 + 112) |= 1u;
      *(_QWORD *)(v6 + 40) = v14;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("icon"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      v17 = v16;
      *(_WORD *)(v6 + 112) |= 0x40u;
      *(_WORD *)(v6 + 112) |= 0x1000u;
      objc_storeStrong((id *)(v6 + 32), v16);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("unit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v18;
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("UNIT_TYPE_NONE")) & 1) != 0)
      {
        v20 = 0;
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("UNIT_TYPE_COUNT")) & 1) != 0)
      {
        v20 = 1;
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("UNIT_TYPE_METERS")) & 1) != 0)
      {
        v20 = 2;
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("UNIT_TYPE_SQUARE_METERS")) & 1) != 0)
      {
        v20 = 3;
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("UNIT_TYPE_CUBIC_METERS")) & 1) != 0)
      {
        v20 = 4;
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("UNIT_TYPE_KILOMETERS")) & 1) != 0)
      {
        v20 = 5;
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("UNIT_TYPE_SQUARE_KILOMETERS")) & 1) != 0)
      {
        v20 = 6;
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("UNIT_TYPE_CUBIC_KILOMETERS")) & 1) != 0)
      {
        v20 = 7;
      }
      else if (objc_msgSend(v19, "isEqualToString:", CFSTR("UNIT_TYPE_MILLISECONDS")))
      {
        v20 = 8;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_34;
      v20 = objc_msgSend(v18, "intValue");
    }
    *(_WORD *)(v6 + 112) |= 0x1000u;
    *(_WORD *)(v6 + 112) |= 4u;
    *(_DWORD *)(v6 + 104) = v20;
LABEL_34:

    if (a3)
      v21 = CFSTR("placeId");
    else
      v21 = CFSTR("place_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = [GEOPDMapsIdentifier alloc];
      if ((a3 & 1) != 0)
        v24 = -[GEOPDMapsIdentifier initWithJSON:](v23, "initWithJSON:", v22);
      else
        v24 = -[GEOPDMapsIdentifier initWithDictionary:](v23, "initWithDictionary:", v22);
      v25 = v24;
      v26 = v24;
      *(_WORD *)(v6 + 112) |= 0x80u;
      *(_WORD *)(v6 + 112) |= 0x1000u;
      objc_storeStrong((id *)(v6 + 48), v25);

    }
    if (a3)
      v27 = CFSTR("placeName");
    else
      v27 = CFSTR("place_name");
    objc_msgSend(v5, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = v5;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v29 = v28;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v59 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v35 = [GEOLocalizedString alloc];
              if ((a3 & 1) != 0)
                v36 = -[GEOLocalizedString initWithJSON:](v35, "initWithJSON:", v34);
              else
                v36 = -[GEOLocalizedString initWithDictionary:](v35, "initWithDictionary:", v34);
              v37 = v36;
              -[GEOPDFactoid addPlaceName:](v6, v36);

            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        }
        while (v31);
      }

      v5 = v57;
    }

    if (a3)
      v38 = CFSTR("entryType");
    else
      v38 = CFSTR("entry_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = v39;
      if ((objc_msgSend(v40, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
      {
        v41 = 0;
      }
      else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("NUM_PORTS")) & 1) != 0)
      {
        v41 = 1;
      }
      else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("HIKING_DIFFICULTY")) & 1) != 0)
      {
        v41 = 2;
      }
      else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("HIKING_POINT_TO_POINT")) & 1) != 0)
      {
        v41 = 3;
      }
      else if ((objc_msgSend(v40, "isEqualToString:", CFSTR("HIKING_LENGTH")) & 1) != 0)
      {
        v41 = 4;
      }
      else if (objc_msgSend(v40, "isEqualToString:", CFSTR("ELEVATION")))
      {
        v41 = 5;
      }
      else
      {
        v41 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_80;
      v41 = objc_msgSend(v39, "intValue");
    }
    *(_WORD *)(v6 + 112) |= 0x1000u;
    *(_WORD *)(v6 + 112) |= 2u;
    *(_DWORD *)(v6 + 100) = v41;
LABEL_80:

    if (a3)
      v42 = CFSTR("canBeDisplayedInPlaceSummary");
    else
      v42 = CFSTR("can_be_displayed_in_place_summary");
    objc_msgSend(v5, "objectForKeyedSubscript:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = objc_msgSend(v43, "BOOLValue");
      *(_WORD *)(v6 + 112) |= 0x1000u;
      *(_WORD *)(v6 + 112) |= 8u;
      *(_BYTE *)(v6 + 108) = v44;
    }

    if (a3)
      v45 = CFSTR("symbolColor");
    else
      v45 = CFSTR("symbol_color");
    objc_msgSend(v5, "objectForKeyedSubscript:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = (void *)objc_msgSend(v46, "copy");
      v48 = v47;
      *(_WORD *)(v6 + 112) |= 0x200u;
      *(_WORD *)(v6 + 112) |= 0x1000u;
      objc_storeStrong((id *)(v6 + 64), v47);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("color"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_114;
    v50 = [GEOPDColor alloc];
    if (!v50)
    {
LABEL_113:
      v55 = v50;
      *(_WORD *)(v6 + 112) |= 0x20u;
      *(_WORD *)(v6 + 112) |= 0x1000u;
      objc_storeStrong((id *)(v6 + 24), v50);

LABEL_114:
      goto LABEL_115;
    }
    v51 = v49;
    v50 = -[GEOPDColor init](v50, "init");
    if (!v50)
    {
LABEL_112:

      goto LABEL_113;
    }
    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("systemColor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = v52;
      if ((objc_msgSend(v53, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
      {
        v54 = 0;
      }
      else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("CYAN")) & 1) != 0)
      {
        v54 = 1;
      }
      else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("GREEN")) & 1) != 0)
      {
        v54 = 2;
      }
      else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("MAPS_HIKING_DIFFICULTY_EASY")) & 1) != 0)
      {
        v54 = 3;
      }
      else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("MAPS_HIKING_DIFFICULTY_MEDIUM")) & 1) != 0)
      {
        v54 = 4;
      }
      else if (objc_msgSend(v53, "isEqualToString:", CFSTR("MAPS_HIKING_DIFFICULTY_HARD")))
      {
        v54 = 5;
      }
      else
      {
        v54 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_111:

        goto LABEL_112;
      }
      v54 = objc_msgSend(v52, "intValue");
    }
    *(_BYTE *)&v50->_flags |= 1u;
    v50->_systemColor = v54;
    goto LABEL_111;
  }
LABEL_115:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDFactoidReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1FE0) == 0))
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
    -[GEOPDFactoid readAll:]((uint64_t)self, 0);
    if (self->_title)
      PBDataWriterWriteStringField();
    if (self->_text)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_icon)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_placeId)
      PBDataWriterWriteSubmessage();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_placeNames;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_symbolColor)
      PBDataWriterWriteStringField();
    if (self->_color)
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
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int16 flags;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  PBUnknownFields *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDFactoidReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDFactoid readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  v11 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 40) = self->_number;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  v13 = -[NSString copyWithZone:](self->_icon, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_unit;
    *(_WORD *)(v5 + 112) |= 4u;
  }
  v15 = -[GEOPDMapsIdentifier copyWithZone:](self->_placeId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = self->_placeNames;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v29);
        -[GEOPDFactoid addPlaceName:](v5, v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v18);
  }

  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_entryType;
    *(_WORD *)(v5 + 112) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 108) = self->_canBeDisplayedInPlaceSummary;
    *(_WORD *)(v5 + 112) |= 8u;
  }
  v23 = -[NSString copyWithZone:](self->_symbolColor, "copyWithZone:", a3, (_QWORD)v29);
  v24 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v23;

  v25 = -[GEOPDColor copyWithZone:](self->_color, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v25;

  v27 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v27;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  NSString *text;
  __int16 flags;
  __int16 v8;
  NSString *icon;
  GEOPDMapsIdentifier *placeId;
  NSMutableArray *placeNames;
  __int16 v12;
  __int16 v13;
  NSString *symbolColor;
  GEOPDColor *color;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  -[GEOPDFactoid readAll:]((uint64_t)self, 1);
  -[GEOPDFactoid readAll:]((uint64_t)v4, 1);
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_40;
  }
  text = self->_text;
  if ((unint64_t)text | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](text, "isEqual:"))
      goto LABEL_40;
  }
  flags = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 56);
  if ((flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_number != *((double *)v4 + 5))
      goto LABEL_40;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_40;
  }
  icon = self->_icon;
  if ((unint64_t)icon | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](icon, "isEqual:"))
      goto LABEL_40;
    flags = (__int16)self->_flags;
    v8 = *((_WORD *)v4 + 56);
  }
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_unit != *((_DWORD *)v4 + 26))
      goto LABEL_40;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_40;
  }
  placeId = self->_placeId;
  if ((unint64_t)placeId | *((_QWORD *)v4 + 6) && !-[GEOPDMapsIdentifier isEqual:](placeId, "isEqual:"))
    goto LABEL_40;
  placeNames = self->_placeNames;
  if ((unint64_t)placeNames | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](placeNames, "isEqual:"))
      goto LABEL_40;
  }
  v12 = (__int16)self->_flags;
  v13 = *((_WORD *)v4 + 56);
  if ((v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_entryType != *((_DWORD *)v4 + 25))
      goto LABEL_40;
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((v12 & 8) != 0)
  {
    if ((v13 & 8) != 0)
    {
      if (self->_canBeDisplayedInPlaceSummary)
      {
        if (!*((_BYTE *)v4 + 108))
          goto LABEL_40;
        goto LABEL_36;
      }
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_36;
    }
LABEL_40:
    v16 = 0;
    goto LABEL_41;
  }
  if ((v13 & 8) != 0)
    goto LABEL_40;
LABEL_36:
  symbolColor = self->_symbolColor;
  if ((unint64_t)symbolColor | *((_QWORD *)v4 + 8)
    && !-[NSString isEqual:](symbolColor, "isEqual:"))
  {
    goto LABEL_40;
  }
  color = self->_color;
  if ((unint64_t)color | *((_QWORD *)v4 + 3))
    v16 = -[GEOPDColor isEqual:](color, "isEqual:");
  else
    v16 = 1;
LABEL_41:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  double number;
  double v7;
  long double v8;
  double v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int16 flags;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;

  -[GEOPDFactoid readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_text, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    number = self->_number;
    v7 = -number;
    if (number >= 0.0)
      v7 = self->_number;
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
  v10 = -[NSString hash](self->_icon, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v11 = 2654435761 * self->_unit;
  else
    v11 = 0;
  v12 = -[GEOPDMapsIdentifier hash](self->_placeId, "hash");
  v13 = -[NSMutableArray hash](self->_placeNames, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v15 = 2654435761 * self->_entryType;
    if ((flags & 8) != 0)
      goto LABEL_14;
LABEL_16:
    v16 = 0;
    goto LABEL_17;
  }
  v15 = 0;
  if ((flags & 8) == 0)
    goto LABEL_16;
LABEL_14:
  v16 = 2654435761 * self->_canBeDisplayedInPlaceSummary;
LABEL_17:
  v17 = v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13;
  v18 = v15 ^ v16 ^ -[NSString hash](self->_symbolColor, "hash");
  return v17 ^ v18 ^ -[GEOPDColor hash](self->_color, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_symbolColor, 0);
  objc_storeStrong((id *)&self->_placeNames, 0);
  objc_storeStrong((id *)&self->_placeId, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
