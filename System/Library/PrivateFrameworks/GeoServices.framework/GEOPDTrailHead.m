@implementation GEOPDTrailHead

+ (GEOPDTrailHead)trailHeadWithPlaceData:(id)a3
{
  id v3;
  id v4;
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
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__GEOPDTrailHead_PlaceDataExtras__trailHeadWithPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 98, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOPDTrailHead *)v4;
}

void __58__GEOPDTrailHead_PlaceDataExtras__trailHeadWithPlaceData___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  -[GEOPDComponentValue trailHead](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5);
    v5 = v6;
    *a3 = 1;
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  int *v12;
  uint64_t j;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDTrailHead _readMapsIds](a1);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = *(id *)(a1 + 24);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "hasGreenTeaWithValue:", a2) & 1) != 0)
        {
LABEL_41:
          v27 = 1;
          goto LABEL_42;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      if (v6)
        continue;
      break;
    }
  }

  -[GEOPDTrailHead _readTrails](a1);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v32;
    v11 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
    v12 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
    v29 = *(_QWORD *)v32;
    do
    {
      v30 = v9;
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v4);
        v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        if (v14)
        {
          -[GEOPDTrail _readFactoid](*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
          v15 = *(_QWORD *)(v14 + v11[461]);
          if (v15)
          {
            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            v16 = *(id *)(v15 + v12[471]);
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v44;
              while (2)
              {
                for (k = 0; k != v18; ++k)
                {
                  if (*(_QWORD *)v44 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * k);
                  if (v21)
                  {
                    -[GEOPDFactoid _readPlaceId](*(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * k));
                    if ((objc_msgSend(*(id *)(v21 + 48), "hasGreenTeaWithValue:", a2) & 1) != 0)
                    {

                      goto LABEL_41;
                    }
                  }
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
                if (v18)
                  continue;
                break;
              }
            }

          }
          -[GEOPDTrail _readMapsIds](v14);
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v22 = *(id *)(v14 + 56);
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v40;
            while (2)
            {
              for (m = 0; m != v24; ++m)
              {
                if (*(_QWORD *)v40 != v25)
                  objc_enumerationMutation(v22);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * m), "hasGreenTeaWithValue:", a2, v29) & 1) != 0)
                {

                  goto LABEL_41;
                }
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
              if (v24)
                continue;
              break;
            }
          }

          v11 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
        }
        v10 = v29;
        v12 = &OBJC_IVAR___GEOPDGroundViewLabelInfo__startHeading;
      }
      v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
    }
    while (v9);
  }
  v27 = 0;
LABEL_42:

  return v27;
}

- (GEOPDTrailHead)init
{
  GEOPDTrailHead *v2;
  GEOPDTrailHead *v3;
  GEOPDTrailHead *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDTrailHead;
  v2 = -[GEOPDTrailHead init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTrailHead)initWithData:(id)a3
{
  GEOPDTrailHead *v3;
  GEOPDTrailHead *v4;
  GEOPDTrailHead *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDTrailHead;
  v3 = -[GEOPDTrailHead initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTrails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTrailHeadReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)trails
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTrailHead _readTrails]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addTrail:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTrailHead _readTrails](a1);
    -[GEOPDTrailHead _addNoFlagsTrail:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsTrail:(uint64_t)a1
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

- (void)_readMapsIds
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_BYTE *)(a1 + 60) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDTrailHeadReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsIds_tags_6828);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
}

- (void)addMapsId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTrailHead _readMapsIds](a1);
    -[GEOPDTrailHead _addNoFlagsMapsId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsMapsId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)hikingDisplayType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 60);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 52);
    else
      return 0;
  }
  return result;
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
  v8.super_class = (Class)GEOPDTrailHead;
  -[GEOPDTrailHead description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTrailHead dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTrailHead _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  const __CFString *v21;
  char v22;
  int v23;
  __CFString *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v35[4];
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
  if (!a1)
    return 0;
  -[GEOPDTrailHead readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v42 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("trail"));
  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v14 = *(id *)(a1 + 24);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v16);
    }

    if (a2)
      v21 = CFSTR("mapsId");
    else
      v21 = CFSTR("maps_id");
    objc_msgSend(v4, "setObject:forKey:", v13, v21);

  }
  v22 = *(_BYTE *)(a1 + 60);
  if ((v22 & 1) != 0)
  {
    v23 = *(_DWORD *)(a1 + 52);
    if (v23)
    {
      if (v23 == 1)
      {
        v24 = CFSTR("HIKING_DISPLAY_TYPE_TRAIL");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 52));
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v24 = CFSTR("HIKING_DISPLAY_TYPE_TRAIL_HEAD");
    }
    if (a2)
      v25 = CFSTR("hikingDisplayType");
    else
      v25 = CFSTR("hiking_display_type");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

    v22 = *(_BYTE *)(a1 + 60);
  }
  if ((v22 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v27 = CFSTR("numInlineItems");
    else
      v27 = CFSTR("num_inline_items");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  v28 = *(void **)(a1 + 16);
  if (v28)
  {
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v29, "count"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __44__GEOPDTrailHead__dictionaryRepresentation___block_invoke;
      v35[3] = &unk_1E1C00600;
      v32 = v31;
      v36 = v32;
      objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v35);
      v33 = v32;

      v30 = v33;
    }
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTrailHead _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_6835;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6836;
      GEOPDTrailHeadReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDTrailHeadCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __44__GEOPDTrailHead__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDTrailHeadReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  char flags;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTrailHead readAll:]((uint64_t)self, 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_trails;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = self->_mapsIds;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v11);
    }

    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
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
  char flags;
  PBUnknownFields *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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
      GEOPDTrailHeadReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTrailHead readAll:]((uint64_t)self, 0);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_trails;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDTrailHead addTrail:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_mapsIds;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v22);
        -[GEOPDTrailHead addMapsId:](v5, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v15);
  }

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_hikingDisplayType;
    *(_BYTE *)(v5 + 60) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_numInlineItems;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v20 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *trails;
  NSMutableArray *mapsIds;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOPDTrailHead readAll:]((uint64_t)self, 1);
  -[GEOPDTrailHead readAll:]((uint64_t)v4, 1);
  trails = self->_trails;
  if ((unint64_t)trails | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](trails, "isEqual:"))
      goto LABEL_15;
  }
  mapsIds = self->_mapsIds;
  if ((unint64_t)mapsIds | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](mapsIds, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_hikingDisplayType != *((_DWORD *)v4 + 13))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 60) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_numInlineItems != *((_DWORD *)v4 + 14))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPDTrailHead readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_trails, "hash");
  v4 = -[NSMutableArray hash](self->_mapsIds, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5 = 2654435761 * self->_hikingDisplayType;
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
  v6 = 2654435761 * self->_numInlineItems;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trails, 0);
  objc_storeStrong((id *)&self->_mapsIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
