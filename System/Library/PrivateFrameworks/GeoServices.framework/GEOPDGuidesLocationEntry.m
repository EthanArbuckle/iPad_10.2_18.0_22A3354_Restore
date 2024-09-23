@implementation GEOPDGuidesLocationEntry

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  id *v3;

  if (result)
  {
    v3 = (id *)result;
    -[GEOPDGuidesLocationEntry _readCenter](result);
    if ((objc_msgSend(v3[6], "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDGuidesLocationEntry _readMapRegion]((uint64_t)v3);
    if ((objc_msgSend(v3[7], "hasGreenTeaWithValue:", a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDGuidesLocationEntry _readPlaceId]((uint64_t)v3);
      return objc_msgSend(v3[8], "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
    goto LABEL_49;
  v30 = v3;
  -[GEOPDGuidesLocationEntry readAll:]((uint64_t)v3, 0);
  v4 = (uint64_t)v30;
  v5 = *(void **)(a1 + 64);
  v6 = *((_QWORD *)v30 + 8);
  if (v5)
  {
    if (!v6)
      goto LABEL_8;
    objc_msgSend(v5, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_8;
    -[GEOPDGuidesLocationEntry setPlaceId:](a1, *((void **)v30 + 8));
  }
  v4 = (uint64_t)v30;
LABEL_8:
  v7 = *(_WORD *)(v4 + 100);
  if ((v7 & 1) != 0)
  {
    *(_DWORD *)(a1 + 92) = *(_DWORD *)(v4 + 92);
    *(_WORD *)(a1 + 100) |= 1u;
    v7 = *(_WORD *)(v4 + 100);
  }
  if ((v7 & 2) != 0)
  {
    *(_DWORD *)(a1 + 96) = *(_DWORD *)(v4 + 96);
    *(_WORD *)(a1 + 100) |= 2u;
  }
  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(void **)(v4 + 72);
  if (v8)
  {
    if (!v9)
      goto LABEL_32;
    v10 = v9;
    -[GEOPDGuidesLocationEntryTypeWorldWide readAll:]((uint64_t)v10, 0);
    v11 = (void *)*((_QWORD *)v10 + 4);
    if (v11)
      -[GEOPDGuidesLocationEntryTypeWorldWide setName:](v8, v11);
    v12 = *(_QWORD *)(v8 + 40);
    v13 = (void *)*((_QWORD *)v10 + 5);
    if (v12)
    {
      if (v13)
        -[GEOPDCaptionedPhoto mergeFrom:](v12, v13);
    }
    else if (v13)
    {
      -[GEOPDGuidesLocationEntryTypeWorldWide setPhoto:](v8, v13);
    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = *((id *)v10 + 3);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v14);
          -[GEOPDGuidesLocationEntryTypeWorldWide addGuideLocationImage:](v8, *(void **)(*((_QWORD *)&v31 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v16);
    }

  }
  else
  {
    if (!v9)
      goto LABEL_32;
    -[GEOPDGuidesLocationEntry setWorldwide:](a1, v9);
  }
  v4 = (uint64_t)v30;
LABEL_32:
  v19 = *(void **)(a1 + 56);
  v20 = *(_QWORD *)(v4 + 56);
  if (v19)
  {
    if (!v20)
      goto LABEL_38;
    objc_msgSend(v19, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_38;
    -[GEOPDGuidesLocationEntry setMapRegion:](a1, *(void **)(v4 + 56));
  }
  v4 = (uint64_t)v30;
LABEL_38:
  v21 = *(void **)(a1 + 48);
  v22 = *(_QWORD *)(v4 + 48);
  if (v21)
  {
    if (!v22)
      goto LABEL_44;
    objc_msgSend(v21, "mergeFrom:");
  }
  else
  {
    if (!v22)
      goto LABEL_44;
    -[GEOPDGuidesLocationEntry setCenter:](a1, *(void **)(v4 + 48));
  }
  v4 = (uint64_t)v30;
LABEL_44:
  -[GEOPDGuidesLocationEntry _readGeoIdCandidates](v4);
  v3 = v30;
  v23 = *((_QWORD *)v30 + 4);
  if (v23)
  {
    v24 = 0;
    v25 = *MEMORY[0x1E0C99858];
    do
    {
      -[GEOPDGuidesLocationEntry _readGeoIdCandidates]((uint64_t)v3);
      v26 = *((_QWORD *)v30 + 4);
      if (v26 <= v24)
      {
        v27 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v24, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "exceptionWithName:reason:userInfo:", v25, v28, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "raise");

      }
      -[GEOPDGuidesLocationEntry addGeoIdCandidate:](a1);
      v3 = v30;
      ++v24;
    }
    while (v23 != v24);
  }
LABEL_49:

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 100) |= 4u;
    *(_WORD *)(a1 + 100) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDGuidesLocationEntry readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 64), "clearUnknownFields:", 1);
      -[GEOPDGuidesLocationEntryTypeWorldWide clearUnknownFields:](*(_QWORD *)(a1 + 72), 1);
      objc_msgSend(*(id *)(a1 + 56), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(a1 + 48), "clearUnknownFields:", 1);
    }
  }
}

- (GEOPDGuidesLocationEntry)init
{
  GEOPDGuidesLocationEntry *v2;
  GEOPDGuidesLocationEntry *v3;
  GEOPDGuidesLocationEntry *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesLocationEntry;
  v2 = -[GEOPDGuidesLocationEntry init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesLocationEntry)initWithData:(id)a3
{
  GEOPDGuidesLocationEntry *v3;
  GEOPDGuidesLocationEntry *v4;
  GEOPDGuidesLocationEntry *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesLocationEntry;
  v3 = -[GEOPDGuidesLocationEntry initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDGuidesLocationEntry;
  -[GEOPDGuidesLocationEntry dealloc](&v3, sel_dealloc);
}

- (void)_readPlaceId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceId_tags_4190);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)placeId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesLocationEntry _readPlaceId]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)setPlaceId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x40u;
  *(_WORD *)(a1 + 100) |= 0x100u;
  objc_storeStrong((id *)(a1 + 64), a2);

}

- (uint64_t)type
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 100);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 88));
    if ((v2 & 2) != 0)
      return *(unsigned int *)(v1 + 96);
    else
      return 0;
  }
  return result;
}

- (void)_readWorldwide
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWorldwide_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)worldwide
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesLocationEntry _readWorldwide]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)setWorldwide:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 100) |= 0x80u;
    *(_WORD *)(a1 + 100) |= 0x100u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }

}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_4191);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)setMapRegion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x20u;
  *(_WORD *)(a1 + 100) |= 0x100u;
  objc_storeStrong((id *)(a1 + 56), a2);

}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)setCenter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 100) |= 0x10u;
  *(_WORD *)(a1 + 100) |= 0x100u;
  objc_storeStrong((id *)(a1 + 48), a2);

}

- (void)_readGeoIdCandidates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeoIdCandidates_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)addGeoIdCandidate:(uint64_t)a1
{
  -[GEOPDGuidesLocationEntry _readGeoIdCandidates](a1);
  PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)(a1 + 100) |= 8u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  *(_WORD *)(a1 + 100) |= 0x100u;
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
  v8.super_class = (Class)GEOPDGuidesLocationEntry;
  -[GEOPDGuidesLocationEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGuidesLocationEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesLocationEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v33[4];
  id v34;

  if (!a1)
    return 0;
  -[GEOPDGuidesLocationEntry readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGuidesLocationEntry placeId]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("placeId");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("place_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  v9 = *(_WORD *)(a1 + 100);
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("numGuides");
    else
      v11 = CFSTR("num_guides");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v9 = *(_WORD *)(a1 + 100);
  }
  if ((v9 & 2) != 0)
  {
    v12 = *(int *)(a1 + 96);
    if (v12 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 96));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E1C0BB10[v12];
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("type"));

  }
  -[GEOPDGuidesLocationEntry worldwide]((id *)a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v14, "jsonRepresentation");
    else
      objc_msgSend(v14, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("worldwide"));

  }
  -[GEOPDGuidesLocationEntry _readMapRegion](a1);
  v17 = *(id *)(a1 + 56);
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("mapRegion");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  -[GEOPDGuidesLocationEntry _readCenter](a1);
  v21 = *(id *)(a1 + 48);
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v21, "jsonRepresentation");
    else
      objc_msgSend(v21, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("center"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt64NSArray();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("geoIdCandidate");
    else
      v25 = CFSTR("geo_id_candidate");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  v26 = *(void **)(a1 + 16);
  if (v26)
  {
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __54__GEOPDGuidesLocationEntry__dictionaryRepresentation___block_invoke;
      v33[3] = &unk_1E1C00600;
      v30 = v29;
      v34 = v30;
      objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v33);
      v31 = v30;

      v28 = v31;
    }
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDGuidesLocationEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_4201;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4202;
      GEOPDGuidesLocationEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDGuidesLocationEntryCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __54__GEOPDGuidesLocationEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  const __CFString *v6;
  void *v7;
  GEOPDMapsIdentifier *v8;
  GEOPDMapsIdentifier *v9;
  GEOPDMapsIdentifier *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  GEOPDGuidesLocationEntryTypeWorldWide *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  GEOPDCaptionedPhoto *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  GEOPDGuideLocationImage *v34;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  void *v38;
  GEOMapRegion *v39;
  GEOMapRegion *v40;
  GEOMapRegion *v41;
  void *v42;
  GEOLatLng *v43;
  GEOLatLng *v44;
  GEOLatLng *v45;
  const __CFString *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v55;
  id v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_86;
  a1 = objc_msgSend((id)a1, "init");
  if (!a1)
    goto LABEL_86;
  if (a3)
    v6 = CFSTR("placeId");
  else
    v6 = CFSTR("place_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOPDMapsIdentifier alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOPDMapsIdentifier initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOPDMapsIdentifier initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = v9;
    -[GEOPDGuidesLocationEntry setPlaceId:](a1, v9);

  }
  if (a3)
    v11 = CFSTR("numGuides");
  else
    v11 = CFSTR("num_guides");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v12, "unsignedIntValue");
    *(_WORD *)(a1 + 100) |= 0x100u;
    *(_WORD *)(a1 + 100) |= 1u;
    *(_DWORD *)(a1 + 92) = v13;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("GUIDES_LOCATION_ENTRY_TYPE_UNKNOWN")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("GUIDES_LOCATION_ENTRY_TYPE_PLACE")) & 1) != 0)
    {
      v16 = 1;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("GUIDES_LOCATION_ENTRY_TYPE_WORLDWIDE")))
    {
      v16 = 2;
    }
    else
    {
      v16 = 0;
    }

    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(v14, "intValue");
LABEL_27:
    *(_WORD *)(a1 + 100) |= 0x100u;
    *(_WORD *)(a1 + 100) |= 2u;
    *(_DWORD *)(a1 + 96) = v16;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("worldwide"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEOPDGuidesLocationEntryTypeWorldWide alloc];
    if (v18)
    {
      v19 = v17;
      v18 = -[GEOPDGuidesLocationEntryTypeWorldWide init](v18, "init");
      if (v18)
      {
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("name"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = (void *)objc_msgSend(v20, "copy");
          -[GEOPDGuidesLocationEntryTypeWorldWide setName:]((uint64_t)v18, v21);

        }
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("photo"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = [GEOPDCaptionedPhoto alloc];
          if (v23)
            v24 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v23, v22, a3);
          else
            v24 = 0;
          -[GEOPDGuidesLocationEntryTypeWorldWide setPhoto:]((uint64_t)v18, v24);

        }
        if (a3)
          v25 = CFSTR("guideLocationImage");
        else
          v25 = CFSTR("guide_location_image");
        objc_msgSend(v19, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v56 = v19;
          v57 = v17;
          v27 = a3;
          v58 = v5;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v55 = v26;
          v28 = v26;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v64;
            do
            {
              v32 = 0;
              do
              {
                if (*(_QWORD *)v64 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v32);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v34 = [GEOPDGuideLocationImage alloc];
                  if (v34)
                    v35 = (void *)-[GEOPDGuideLocationImage _initWithDictionary:isJSON:](v34, v33, v27);
                  else
                    v35 = 0;
                  -[GEOPDGuidesLocationEntryTypeWorldWide addGuideLocationImage:]((uint64_t)v18, v35);

                }
                ++v32;
              }
              while (v30 != v32);
              v36 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
              v30 = v36;
            }
            while (v36);
          }

          v5 = v58;
          a3 = v27;
          v26 = v55;
          v19 = v56;
        }

      }
    }
    -[GEOPDGuidesLocationEntry setWorldwide:](a1, v18);

  }
  if (a3)
    v37 = CFSTR("mapRegion");
  else
    v37 = CFSTR("map_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37, v55, v56, v57, v58);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v40 = -[GEOMapRegion initWithJSON:](v39, "initWithJSON:", v38);
    else
      v40 = -[GEOMapRegion initWithDictionary:](v39, "initWithDictionary:", v38);
    v41 = v40;
    -[GEOPDGuidesLocationEntry setMapRegion:](a1, v40);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("center"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v44 = -[GEOLatLng initWithJSON:](v43, "initWithJSON:", v42);
    else
      v44 = -[GEOLatLng initWithDictionary:](v43, "initWithDictionary:", v42);
    v45 = v44;
    -[GEOPDGuidesLocationEntry setCenter:](a1, v44);

  }
  if (a3)
    v46 = CFSTR("geoIdCandidate");
  else
    v46 = CFSTR("geo_id_candidate");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v48 = v47;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v60 != v51)
            objc_enumerationMutation(v48);
          v53 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v53, "unsignedLongLongValue");
            -[GEOPDGuidesLocationEntry addGeoIdCandidate:](a1);
          }
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      }
      while (v50);
    }

  }
LABEL_86:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGuidesLocationEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  id v6;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDGuidesLocationEntryIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDGuidesLocationEntry readAll:]((uint64_t)self, 0);
    if (self->_placeId)
      PBDataWriterWriteSubmessage();
    flags = (__int16)self->_flags;
    v6 = v10;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v6 = v10;
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v10;
    }
    if (self->_worldwide)
    {
      PBDataWriterWriteSubmessage();
      v6 = v10;
    }
    if (self->_mapRegion)
    {
      PBDataWriterWriteSubmessage();
      v6 = v10;
    }
    if (self->_center)
    {
      PBDataWriterWriteSubmessage();
      v6 = v10;
    }
    if (self->_geoIdCandidates.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        v6 = v10;
        ++v7;
      }
      while (v7 < self->_geoIdCandidates.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
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
  __int16 flags;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  PBUnknownFields *v18;

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
      GEOPDGuidesLocationEntryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGuidesLocationEntry readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDMapsIdentifier copyWithZone:](self->_placeId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_numGuides;
    *(_WORD *)(v5 + 100) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_type;
    *(_WORD *)(v5 + 100) |= 2u;
  }
  v12 = -[GEOPDGuidesLocationEntryTypeWorldWide copyWithZone:](self->_worldwide, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  v14 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  PBRepeatedUInt64Copy();
  v18 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDMapsIdentifier *placeId;
  __int16 flags;
  __int16 v7;
  GEOPDGuidesLocationEntryTypeWorldWide *worldwide;
  GEOMapRegion *mapRegion;
  GEOLatLng *center;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOPDGuidesLocationEntry readAll:]((uint64_t)self, 1);
  -[GEOPDGuidesLocationEntry readAll:]((uint64_t)v4, 1);
  placeId = self->_placeId;
  if ((unint64_t)placeId | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](placeId, "isEqual:"))
      goto LABEL_21;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 50);
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_numGuides != *((_DWORD *)v4 + 23))
      goto LABEL_21;
  }
  else if ((v7 & 1) != 0)
  {
LABEL_21:
    IsEqual = 0;
    goto LABEL_22;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_type != *((_DWORD *)v4 + 24))
      goto LABEL_21;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_21;
  }
  worldwide = self->_worldwide;
  if ((unint64_t)worldwide | *((_QWORD *)v4 + 9)
    && !-[GEOPDGuidesLocationEntryTypeWorldWide isEqual:](worldwide, "isEqual:"))
  {
    goto LABEL_21;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_21;
  }
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_21;
  }
  IsEqual = PBRepeatedUInt64IsEqual();
LABEL_22:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  __int16 flags;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  -[GEOPDGuidesLocationEntry readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDMapsIdentifier hash](self->_placeId, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v5 = 2654435761 * self->_numGuides;
    if ((flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = 0;
  if ((flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_type;
LABEL_6:
  v7 = v5 ^ v3 ^ v6 ^ -[GEOPDGuidesLocationEntryTypeWorldWide hash](self->_worldwide, "hash");
  v8 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  v9 = v8 ^ -[GEOLatLng hash](self->_center, "hash");
  return v7 ^ v9 ^ PBRepeatedUInt64Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_worldwide, 0);
  objc_storeStrong((id *)&self->_placeId, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
