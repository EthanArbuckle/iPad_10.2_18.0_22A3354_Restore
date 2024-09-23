@implementation GEOPDSearchBrowseCategorySuggestionParameters

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDSearchBrowseCategorySuggestionParameters _readSearchOriginationInfo](result);
    if (-[GEOPDSearchOriginationInfo hasGreenTeaWithValue:](*(_QWORD *)(v3 + 72), a2))
    {
      return 1;
    }
    else
    {
      -[GEOPDSearchBrowseCategorySuggestionParameters _readViewportInfo](v3);
      return objc_msgSend(*(id *)(v3 + 88), "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:]((uint64_t)v3, 0);
  v4 = *(void **)(a1 + 88);
  v5 = *((_QWORD *)v3 + 11);
  if (v4)
  {
    if (v5)
      objc_msgSend(v4, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOPDSearchBrowseCategorySuggestionParameters setViewportInfo:](a1, *((void **)v3 + 11));
  }
  v6 = *((_WORD *)v3 + 62);
  if ((v6 & 1) != 0)
  {
    *(_QWORD *)(a1 + 64) = *((_QWORD *)v3 + 8);
    *(_WORD *)(a1 + 124) |= 1u;
    v6 = *((_WORD *)v3 + 62);
    if ((v6 & 2) == 0)
    {
LABEL_8:
      if ((v6 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_21;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_8;
  }
  *(_DWORD *)(a1 + 108) = *((_DWORD *)v3 + 27);
  *(_WORD *)(a1 + 124) |= 2u;
  v6 = *((_WORD *)v3 + 62);
  if ((v6 & 0x10) == 0)
  {
LABEL_9:
    if ((v6 & 8) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_21:
  *(_BYTE *)(a1 + 120) = *((_BYTE *)v3 + 120);
  *(_WORD *)(a1 + 124) |= 0x10u;
  if ((*((_WORD *)v3 + 62) & 8) != 0)
  {
LABEL_10:
    *(_DWORD *)(a1 + 116) = *((_DWORD *)v3 + 29);
    *(_WORD *)(a1 + 124) |= 8u;
  }
LABEL_11:
  -[GEOPDSearchBrowseCategorySuggestionParameters _readEngineTypes]((uint64_t)v3);
  v7 = *((_QWORD *)v3 + 4);
  if (v7)
  {
    v8 = 0;
    v9 = *MEMORY[0x1E0C99858];
    do
    {
      -[GEOPDSearchBrowseCategorySuggestionParameters _readEngineTypes]((uint64_t)v3);
      v10 = *((_QWORD *)v3 + 4);
      if (v10 <= v8)
      {
        v11 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v8, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v9, v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "raise");

      }
      -[GEOPDSearchBrowseCategorySuggestionParameters addEngineType:](a1);
      ++v8;
    }
    while (v7 != v8);
  }
  v14 = *(_QWORD *)(a1 + 80);
  v15 = (void *)*((_QWORD *)v3 + 10);
  if (v14)
  {
    if (v15)
      -[GEOPDVenueIdentifier mergeFrom:](v14, v15);
  }
  else if (v15)
  {
    -[GEOPDSearchBrowseCategorySuggestionParameters setVenueFilter:](a1, v15);
  }
  v16 = *((_WORD *)v3 + 62);
  if ((v16 & 0x40) != 0)
  {
    *(_BYTE *)(a1 + 122) = *((_BYTE *)v3 + 122);
    *(_WORD *)(a1 + 124) |= 0x40u;
    v16 = *((_WORD *)v3 + 62);
    if ((v16 & 0x20) == 0)
    {
LABEL_27:
      if ((v16 & 4) == 0)
        goto LABEL_28;
      goto LABEL_35;
    }
  }
  else if ((v16 & 0x20) == 0)
  {
    goto LABEL_27;
  }
  *(_BYTE *)(a1 + 121) = *((_BYTE *)v3 + 121);
  *(_WORD *)(a1 + 124) |= 0x20u;
  v16 = *((_WORD *)v3 + 62);
  if ((v16 & 4) == 0)
  {
LABEL_28:
    if ((v16 & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_35:
  *(_DWORD *)(a1 + 112) = *((_DWORD *)v3 + 28);
  *(_WORD *)(a1 + 124) |= 4u;
  if ((*((_WORD *)v3 + 62) & 0x80) != 0)
  {
LABEL_29:
    *(_BYTE *)(a1 + 123) = *((_BYTE *)v3 + 123);
    *(_WORD *)(a1 + 124) |= 0x80u;
  }
LABEL_30:
  v17 = *(_QWORD *)(a1 + 48);
  v18 = (void *)*((_QWORD *)v3 + 6);
  if (v17)
  {
    if (v18)
      -[GEOPDSSearchEvChargingParameters mergeFrom:](v17, v18);
  }
  else if (v18)
  {
    -[GEOPDSearchBrowseCategorySuggestionParameters setEvChargingParameters:](a1, v18);
  }
  v19 = *(_QWORD *)(a1 + 72);
  v20 = (void *)*((_QWORD *)v3 + 9);
  if (v19)
  {
    if (v20)
      -[GEOPDSearchOriginationInfo mergeFrom:](v19, v20);
  }
  else if (v20)
  {
    -[GEOPDSearchBrowseCategorySuggestionParameters setSearchOriginationInfo:](a1, v20);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = *((id *)v3 + 7);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        -[GEOPDSearchBrowseCategorySuggestionParameters addInputCategory:](a1, *(void **)(*((_QWORD *)&v26 + 1) + 8 * i));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v23);
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 124) |= 0x100u;
    *(_WORD *)(a1 + 124) |= 0x8000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDSearchBrowseCategorySuggestionParameters readAll:](a1, 0);
    objc_msgSend(*(id *)(a1 + 88), "clearUnknownFields:", 1);
    -[GEOPDVenueIdentifier clearUnknownFields:](*(_QWORD *)(a1 + 80), 1);
    -[GEOPDSSearchEvChargingParameters clearUnknownFields:](*(_QWORD *)(a1 + 48), 1);
    -[GEOPDSearchOriginationInfo clearUnknownFields:](*(_QWORD *)(a1 + 72), 1);
  }
}

- (GEOPDSearchBrowseCategorySuggestionParameters)init
{
  GEOPDSearchBrowseCategorySuggestionParameters *v2;
  GEOPDSearchBrowseCategorySuggestionParameters *v3;
  GEOPDSearchBrowseCategorySuggestionParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchBrowseCategorySuggestionParameters;
  v2 = -[GEOPDSearchBrowseCategorySuggestionParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchBrowseCategorySuggestionParameters)initWithData:(id)a3
{
  GEOPDSearchBrowseCategorySuggestionParameters *v3;
  GEOPDSearchBrowseCategorySuggestionParameters *v4;
  GEOPDSearchBrowseCategorySuggestionParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchBrowseCategorySuggestionParameters;
  v3 = -[GEOPDSearchBrowseCategorySuggestionParameters initWithData:](&v7, sel_initWithData_, a3);
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchBrowseCategorySuggestionParameters;
  -[GEOPDSearchBrowseCategorySuggestionParameters dealloc](&v3, sel_dealloc);
}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 124) & 0x4000) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_5069);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 124) |= 0x4000u;
    *(_WORD *)(a1 + 124) |= 0x8000u;
    objc_storeStrong((id *)(a1 + 88), a2);
  }

}

- (void)_readEngineTypes
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 124) & 0x200) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEngineTypes_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)addEngineType:(uint64_t)a1
{
  -[GEOPDSearchBrowseCategorySuggestionParameters _readEngineTypes](a1);
  PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)(a1 + 124) |= 0x200u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  *(_WORD *)(a1 + 124) |= 0x8000u;
}

- (uint64_t)setEngineTypes:(uint64_t)result count:
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    *(_WORD *)(v1 + 124) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
    *(_WORD *)(v1 + 124) |= 0x8000u;
    return PBRepeatedInt32Set();
  }
  return result;
}

- (void)setVenueFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 124) |= 0x2000u;
  *(_WORD *)(a1 + 124) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 80), a2);

}

- (void)setEvChargingParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 124) |= 0x400u;
    *(_WORD *)(a1 + 124) |= 0x8000u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)_readSearchOriginationInfo
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 124) & 0x1000) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchOriginationInfo_tags_5071);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setSearchOriginationInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 124) |= 0x1000u;
    *(_WORD *)(a1 + 124) |= 0x8000u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }

}

- (void)_readInputCategorys
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 124) & 0x800) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInputCategorys_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)addInputCategory:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchBrowseCategorySuggestionParameters _readInputCategorys](a1);
    -[GEOPDSearchBrowseCategorySuggestionParameters _addNoFlagsInputCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 124) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_WORD *)(a1 + 124) |= 0x8000u;
  }
}

- (void)_addNoFlagsInputCategory:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchBrowseCategorySuggestionParameters;
  -[GEOPDSearchBrowseCategorySuggestionParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchBrowseCategorySuggestionParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchBrowseCategorySuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  __CFString *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  __int16 v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  uint64_t v44;
  __CFString *v45;
  id v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  id v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  const __CFString *v59;
  _QWORD v60[4];
  id v61;

  if (!a1)
    return 0;
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchBrowseCategorySuggestionParameters _readViewportInfo](a1);
  v5 = *(id *)(a1 + 88);
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("viewport_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  v9 = *(_WORD *)(a1 + 124);
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("requestLocalTimestamp");
    else
      v11 = CFSTR("request_local_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v9 = *(_WORD *)(a1 + 124);
    if ((v9 & 2) == 0)
    {
LABEL_9:
      if ((v9 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_20;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 108));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("minimumNumberOfCategories");
  else
    v13 = CFSTR("minimum_number_of_categories");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  v9 = *(_WORD *)(a1 + 124);
  if ((v9 & 0x10) == 0)
  {
LABEL_10:
    if ((v9 & 8) == 0)
      goto LABEL_31;
    goto LABEL_24;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 120));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("isCarplayRequest");
  else
    v15 = CFSTR("is_carplay_request");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  if ((*(_WORD *)(a1 + 124) & 8) != 0)
  {
LABEL_24:
    v16 = *(int *)(a1 + 116);
    if (v16 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 116));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E1C04EB8[v16];
    }
    if (a2)
      v18 = CFSTR("suggestionType");
    else
      v18 = CFSTR("suggestion_type");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
LABEL_31:
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v21 = 0;
      do
      {
        v22 = *(int *)(*v20 + 4 * v21);
        if (v22 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = off_1E1C04ED0[v22];
        }
        objc_msgSend(v19, "addObject:", v23);

        ++v21;
        v20 = (_QWORD *)(a1 + 24);
      }
      while (v21 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v24 = CFSTR("engineType");
    else
      v24 = CFSTR("engine_type");
    objc_msgSend(v4, "setObject:forKey:", v19, v24);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 124) & 0x2000) == 0)
  {
    v25 = *(void **)(a1 + 8);
    if (v25)
    {
      v26 = v25;
      objc_sync_enter(v26);
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVenueFilter_tags);
      objc_sync_exit(v26);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  v27 = *(id *)(a1 + 80);
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("venueFilter");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("venue_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  v31 = *(_WORD *)(a1 + 124);
  if ((v31 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 122));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v41 = CFSTR("isFromNoQueryState");
    else
      v41 = CFSTR("is_from_no_query_state");
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

    v31 = *(_WORD *)(a1 + 124);
    if ((v31 & 0x20) == 0)
    {
LABEL_52:
      if ((v31 & 4) == 0)
        goto LABEL_53;
LABEL_72:
      v44 = *(int *)(a1 + 112);
      if (v44 >= 6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 112));
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = off_1E1C05158[v44];
      }
      if (a2)
        v59 = CFSTR("preferredTransportType");
      else
        v59 = CFSTR("preferred_transport_type");
      objc_msgSend(v4, "setObject:forKey:", v45, v59);

      if ((*(_WORD *)(a1 + 124) & 0x80) == 0)
        goto LABEL_58;
      goto LABEL_54;
    }
  }
  else if ((v31 & 0x20) == 0)
  {
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 121));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v43 = CFSTR("isFlatCategoryListRequest");
  else
    v43 = CFSTR("is_flat_category_list_request");
  objc_msgSend(v4, "setObject:forKey:", v42, v43);

  v31 = *(_WORD *)(a1 + 124);
  if ((v31 & 4) != 0)
    goto LABEL_72;
LABEL_53:
  if ((v31 & 0x80) != 0)
  {
LABEL_54:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 123));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v33 = CFSTR("isWidgetRequest");
    else
      v33 = CFSTR("is_widget_request");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
LABEL_58:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 124) & 0x400) == 0)
  {
    v34 = *(void **)(a1 + 8);
    if (v34)
    {
      v35 = v34;
      objc_sync_enter(v35);
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvChargingParameters_tags_5070);
      objc_sync_exit(v35);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  v36 = *(id *)(a1 + 48);
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v36, "jsonRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("evChargingParameters");
    }
    else
    {
      objc_msgSend(v36, "dictionaryRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("ev_charging_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  -[GEOPDSearchBrowseCategorySuggestionParameters _readSearchOriginationInfo](a1);
  v46 = *(id *)(a1 + 72);
  v47 = v46;
  if (v46)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v46, "jsonRepresentation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("searchOriginationInfo");
    }
    else
    {
      objc_msgSend(v46, "dictionaryRepresentation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("search_origination_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v48, v49);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    -[GEOPDSearchBrowseCategorySuggestionParameters _readInputCategorys](a1);
    v50 = *(id *)(a1 + 56);
    if (a2)
      v51 = CFSTR("inputCategory");
    else
      v51 = CFSTR("input_category");
    objc_msgSend(v4, "setObject:forKey:", v50, v51);

  }
  v52 = *(void **)(a1 + 16);
  if (v52)
  {
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v53, "count"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __75__GEOPDSearchBrowseCategorySuggestionParameters__dictionaryRepresentation___block_invoke;
      v60[3] = &unk_1E1C00600;
      v56 = v55;
      v61 = v56;
      objc_msgSend(v54, "enumerateKeysAndObjectsUsingBlock:", v60);
      v57 = v56;

      v54 = v57;
    }
    objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchBrowseCategorySuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5104;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5105;
      GEOPDSearchBrowseCategorySuggestionParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchBrowseCategorySuggestionParametersCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

void __75__GEOPDSearchBrowseCategorySuggestionParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  GEOPDViewportInfo *v9;
  GEOPDViewportInfo *v10;
  GEOPDViewportInfo *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  void *v19;
  char v20;
  const __CFString *v21;
  void *v22;
  id v23;
  int v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  const __CFString *v34;
  void *v35;
  GEOPDVenueIdentifier *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  char v40;
  const __CFString *v41;
  void *v42;
  char v43;
  const __CFString *v44;
  void *v45;
  id v46;
  int v47;
  const __CFString *v48;
  void *v49;
  char v50;
  const __CFString *v51;
  void *v52;
  GEOPDSSearchEvChargingParameters *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  GEOPDSearchOriginationInfo *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  void *v66;
  void *v67;
  void *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_135;
  if (a3)
    v7 = CFSTR("viewportInfo");
  else
    v7 = CFSTR("viewport_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = [GEOPDViewportInfo alloc];
    if ((a3 & 1) != 0)
      v10 = -[GEOPDViewportInfo initWithJSON:](v9, "initWithJSON:", v8);
    else
      v10 = -[GEOPDViewportInfo initWithDictionary:](v9, "initWithDictionary:", v8);
    v11 = v10;
    -[GEOPDSearchBrowseCategorySuggestionParameters setViewportInfo:](v6, v10);

  }
  if (a3)
    v12 = CFSTR("requestLocalTimestamp");
  else
    v12 = CFSTR("request_local_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "doubleValue");
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 1u;
    *(_QWORD *)(v6 + 64) = v14;
  }

  if (a3)
    v15 = CFSTR("minimumNumberOfCategories");
  else
    v15 = CFSTR("minimum_number_of_categories");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_msgSend(v16, "intValue");
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 2u;
    *(_DWORD *)(v6 + 108) = v17;
  }

  if (a3)
    v18 = CFSTR("isCarplayRequest");
  else
    v18 = CFSTR("is_carplay_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v19, "BOOLValue");
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 0x10u;
    *(_BYTE *)(v6 + 120) = v20;
  }

  if (a3)
    v21 = CFSTR("suggestionType");
  else
    v21 = CFSTR("suggestion_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v22;
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SEARCH_BROWSE_CATEGORY_SUGGESTION_TYPE_UNKNOWN")) & 1) != 0)
    {
      v24 = 0;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SEARCH_BROWSE_CATEGORY_SUGGESTION_TYPE_DEFAULT")) & 1) != 0)
    {
      v24 = 1;
    }
    else if (objc_msgSend(v23, "isEqualToString:", CFSTR("SEARCH_BROWSE_CATEGORY_SUGGESTION_TYPE_NAV")))
    {
      v24 = 2;
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
      goto LABEL_40;
    v24 = objc_msgSend(v22, "intValue");
  }
  *(_WORD *)(v6 + 124) |= 0x8000u;
  *(_WORD *)(v6 + 124) |= 8u;
  *(_DWORD *)(v6 + 116) = v24;
LABEL_40:

  if (a3)
    v25 = CFSTR("engineType");
  else
    v25 = CFSTR("engine_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v70 = v5;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v69 = v26;
    v27 = v26;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    if (!v28)
      goto LABEL_62;
    v29 = v28;
    v30 = *(_QWORD *)v76;
    while (1)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v76 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = v32;
          if ((objc_msgSend(v33, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_UNKNOWN")) & 1) == 0
            && (objc_msgSend(v33, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_GASOLINE")) & 1) == 0
            && (objc_msgSend(v33, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_DIESEL")) & 1) == 0
            && (objc_msgSend(v33, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_ELECTRIC")) & 1) == 0)
          {
            objc_msgSend(v33, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_CNG"));
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(v32, "intValue");
        }
        -[GEOPDSearchBrowseCategorySuggestionParameters addEngineType:](v6);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
      if (!v29)
      {
LABEL_62:

        v5 = v70;
        v26 = v69;
        break;
      }
    }
  }

  if (a3)
    v34 = CFSTR("venueFilter");
  else
    v34 = CFSTR("venue_filter");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = [GEOPDVenueIdentifier alloc];
    if (v36)
      v37 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v36, v35, a3);
    else
      v37 = 0;
    -[GEOPDSearchBrowseCategorySuggestionParameters setVenueFilter:](v6, v37);

  }
  if (a3)
    v38 = CFSTR("isFromNoQueryState");
  else
    v38 = CFSTR("is_from_no_query_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = objc_msgSend(v39, "BOOLValue");
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 0x40u;
    *(_BYTE *)(v6 + 122) = v40;
  }

  if (a3)
    v41 = CFSTR("isFlatCategoryListRequest");
  else
    v41 = CFSTR("is_flat_category_list_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = objc_msgSend(v42, "BOOLValue");
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 0x20u;
    *(_BYTE *)(v6 + 121) = v43;
  }

  if (a3)
    v44 = CFSTR("preferredTransportType");
  else
    v44 = CFSTR("preferred_transport_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = v45;
    if ((objc_msgSend(v46, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_NONE")) & 1) != 0)
    {
      v47 = 0;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_DRIVING")) & 1) != 0)
    {
      v47 = 1;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_WALKING")) & 1) != 0)
    {
      v47 = 2;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_TRANSIT")) & 1) != 0)
    {
      v47 = 3;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_RIDESHARE")) & 1) != 0)
    {
      v47 = 4;
    }
    else if (objc_msgSend(v46, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_CYCLING")))
    {
      v47 = 5;
    }
    else
    {
      v47 = 0;
    }

    goto LABEL_100;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = objc_msgSend(v45, "intValue");
LABEL_100:
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 4u;
    *(_DWORD *)(v6 + 112) = v47;
  }

  if (a3)
    v48 = CFSTR("isWidgetRequest");
  else
    v48 = CFSTR("is_widget_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = objc_msgSend(v49, "BOOLValue");
    *(_WORD *)(v6 + 124) |= 0x8000u;
    *(_WORD *)(v6 + 124) |= 0x80u;
    *(_BYTE *)(v6 + 123) = v50;
  }

  if (a3)
    v51 = CFSTR("evChargingParameters");
  else
    v51 = CFSTR("ev_charging_parameters");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = [GEOPDSSearchEvChargingParameters alloc];
    if (v53)
      v54 = -[GEOPDSSearchEvChargingParameters _initWithDictionary:isJSON:](v53, v52, a3);
    else
      v54 = 0;
    -[GEOPDSearchBrowseCategorySuggestionParameters setEvChargingParameters:](v6, v54);

  }
  if (a3)
    v55 = CFSTR("searchOriginationInfo");
  else
    v55 = CFSTR("search_origination_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = [GEOPDSearchOriginationInfo alloc];
    if (v57)
      v58 = (void *)-[GEOPDSearchOriginationInfo _initWithDictionary:isJSON:]((uint64_t)v57, v56, a3);
    else
      v58 = 0;
    -[GEOPDSearchBrowseCategorySuggestionParameters setSearchOriginationInfo:](v6, v58);

  }
  if (a3)
    v59 = CFSTR("inputCategory");
  else
    v59 = CFSTR("input_category");
  objc_msgSend(v5, "objectForKeyedSubscript:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v61 = v60;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v63; ++j)
        {
          if (*(_QWORD *)v72 != v64)
            objc_enumerationMutation(v61);
          v66 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v67 = (void *)objc_msgSend(v66, "copy");
            -[GEOPDSearchBrowseCategorySuggestionParameters addInputCategory:](v6, v67);

          }
        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      }
      while (v63);
    }

  }
LABEL_135:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBrowseCategorySuggestionParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  unint64_t v7;
  __int16 v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PBDataReader *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchBrowseCategorySuggestionParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v14);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
    goto LABEL_41;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:]((uint64_t)self, 0);
  if (self->_viewportInfo)
    PBDataWriterWriteSubmessage();
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_34;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_flags & 8) != 0)
LABEL_9:
    PBDataWriterWriteInt32Field();
LABEL_10:
  if (self->_engineTypes.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_engineTypes.count);
  }
  if (self->_venueFilter)
    PBDataWriterWriteSubmessage();
  v8 = (__int16)self->_flags;
  if ((v8 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v8 = (__int16)self->_flags;
    if ((v8 & 0x20) == 0)
    {
LABEL_17:
      if ((v8 & 4) == 0)
        goto LABEL_18;
LABEL_38:
      PBDataWriterWriteInt32Field();
      if ((*(_WORD *)&self->_flags & 0x80) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((v8 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  v8 = (__int16)self->_flags;
  if ((v8 & 4) != 0)
    goto LABEL_38;
LABEL_18:
  if ((v8 & 0x80) != 0)
LABEL_19:
    PBDataWriterWriteBOOLField();
LABEL_20:
  if (self->_evChargingParameters)
    PBDataWriterWriteSubmessage();
  if (self->_searchOriginationInfo)
    PBDataWriterWriteSubmessage();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_inputCategorys;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        PBDataWriterWriteStringField();
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
LABEL_41:

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
  __int16 v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  PBUnknownFields *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
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
    if ((*(_WORD *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchBrowseCategorySuggestionParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v9;

  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 64) = self->_requestLocalTimestamp;
    *(_WORD *)(v5 + 124) |= 1u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_26;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 108) = self->_minimumNumberOfCategories;
  *(_WORD *)(v5 + 124) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_8:
    if ((flags & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_26:
  *(_BYTE *)(v5 + 120) = self->_isCarplayRequest;
  *(_WORD *)(v5 + 124) |= 0x10u;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 116) = self->_suggestionType;
    *(_WORD *)(v5 + 124) |= 8u;
  }
LABEL_10:
  PBRepeatedInt32Copy();
  v12 = -[GEOPDVenueIdentifier copyWithZone:](self->_venueFilter, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v12;

  v14 = (__int16)self->_flags;
  if ((v14 & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 122) = self->_isFromNoQueryState;
    *(_WORD *)(v5 + 124) |= 0x40u;
    v14 = (__int16)self->_flags;
    if ((v14 & 0x20) == 0)
    {
LABEL_12:
      if ((v14 & 4) == 0)
        goto LABEL_13;
LABEL_30:
      *(_DWORD *)(v5 + 112) = self->_preferredTransportType;
      *(_WORD *)(v5 + 124) |= 4u;
      if ((*(_WORD *)&self->_flags & 0x80) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((v14 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  *(_BYTE *)(v5 + 121) = self->_isFlatCategoryListRequest;
  *(_WORD *)(v5 + 124) |= 0x20u;
  v14 = (__int16)self->_flags;
  if ((v14 & 4) != 0)
    goto LABEL_30;
LABEL_13:
  if ((v14 & 0x80) != 0)
  {
LABEL_14:
    *(_BYTE *)(v5 + 123) = self->_isWidgetRequest;
    *(_WORD *)(v5 + 124) |= 0x80u;
  }
LABEL_15:
  v15 = -[GEOPDSSearchEvChargingParameters copyWithZone:](self->_evChargingParameters, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = -[GEOPDSearchOriginationInfo copyWithZone:](self->_searchOriginationInfo, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v17;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self->_inputCategorys;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v26);
        -[GEOPDSearchBrowseCategorySuggestionParameters addInputCategory:](v5, v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v20);
  }

  v24 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v24;
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDViewportInfo *viewportInfo;
  __int16 flags;
  __int16 v7;
  GEOPDVenueIdentifier *venueFilter;
  __int16 v9;
  __int16 v10;
  GEOPDSSearchEvChargingParameters *evChargingParameters;
  GEOPDSearchOriginationInfo *searchOriginationInfo;
  NSMutableArray *inputCategorys;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_65;
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:]((uint64_t)self, 1);
  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:]((uint64_t)v4, 1);
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
      goto LABEL_65;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 62);
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_requestLocalTimestamp != *((double *)v4 + 8))
      goto LABEL_65;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_minimumNumberOfCategories != *((_DWORD *)v4 + 27))
      goto LABEL_65;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0)
      goto LABEL_65;
    if (self->_isCarplayRequest)
    {
      if (!*((_BYTE *)v4 + 120))
        goto LABEL_65;
    }
    else if (*((_BYTE *)v4 + 120))
    {
      goto LABEL_65;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_suggestionType != *((_DWORD *)v4 + 29))
      goto LABEL_65;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_65;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_65;
  venueFilter = self->_venueFilter;
  if ((unint64_t)venueFilter | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOPDVenueIdentifier isEqual:](venueFilter, "isEqual:"))
      goto LABEL_65;
  }
  v9 = (__int16)self->_flags;
  v10 = *((_WORD *)v4 + 62);
  if ((v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0)
      goto LABEL_65;
    if (self->_isFromNoQueryState)
    {
      if (!*((_BYTE *)v4 + 122))
        goto LABEL_65;
    }
    else if (*((_BYTE *)v4 + 122))
    {
      goto LABEL_65;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if ((v9 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0)
      goto LABEL_65;
    if (self->_isFlatCategoryListRequest)
    {
      if (!*((_BYTE *)v4 + 121))
        goto LABEL_65;
    }
    else if (*((_BYTE *)v4 + 121))
    {
      goto LABEL_65;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_preferredTransportType != *((_DWORD *)v4 + 28))
      goto LABEL_65;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((v9 & 0x80) != 0)
  {
    if ((v10 & 0x80) != 0)
    {
      if (self->_isWidgetRequest)
      {
        if (!*((_BYTE *)v4 + 123))
          goto LABEL_65;
        goto LABEL_59;
      }
      if (!*((_BYTE *)v4 + 123))
        goto LABEL_59;
    }
LABEL_65:
    v14 = 0;
    goto LABEL_66;
  }
  if ((v10 & 0x80) != 0)
    goto LABEL_65;
LABEL_59:
  evChargingParameters = self->_evChargingParameters;
  if ((unint64_t)evChargingParameters | *((_QWORD *)v4 + 6)
    && !-[GEOPDSSearchEvChargingParameters isEqual:](evChargingParameters, "isEqual:"))
  {
    goto LABEL_65;
  }
  searchOriginationInfo = self->_searchOriginationInfo;
  if ((unint64_t)searchOriginationInfo | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDSearchOriginationInfo isEqual:](searchOriginationInfo, "isEqual:"))
      goto LABEL_65;
  }
  inputCategorys = self->_inputCategorys;
  if ((unint64_t)inputCategorys | *((_QWORD *)v4 + 7))
    v14 = -[NSMutableArray isEqual:](inputCategorys, "isEqual:");
  else
    v14 = 1;
LABEL_66:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  __int16 flags;
  unint64_t v5;
  double requestLocalTimestamp;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  -[GEOPDSearchBrowseCategorySuggestionParameters readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    requestLocalTimestamp = self->_requestLocalTimestamp;
    v7 = -requestLocalTimestamp;
    if (requestLocalTimestamp >= 0.0)
      v7 = self->_requestLocalTimestamp;
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
  if ((flags & 2) == 0)
  {
    v10 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_11;
LABEL_14:
    v11 = 0;
    if ((flags & 8) != 0)
      goto LABEL_12;
    goto LABEL_15;
  }
  v10 = 2654435761 * self->_minimumNumberOfCategories;
  if ((flags & 0x10) == 0)
    goto LABEL_14;
LABEL_11:
  v11 = 2654435761 * self->_isCarplayRequest;
  if ((flags & 8) != 0)
  {
LABEL_12:
    v12 = 2654435761 * self->_suggestionType;
    goto LABEL_16;
  }
LABEL_15:
  v12 = 0;
LABEL_16:
  v13 = PBRepeatedInt32Hash();
  v14 = -[GEOPDVenueIdentifier hash](self->_venueFilter, "hash");
  v15 = (__int16)self->_flags;
  if ((v15 & 0x40) != 0)
  {
    v16 = 2654435761 * self->_isFromNoQueryState;
    if ((v15 & 0x20) != 0)
    {
LABEL_18:
      v17 = 2654435761 * self->_isFlatCategoryListRequest;
      if ((v15 & 4) != 0)
        goto LABEL_19;
LABEL_23:
      v18 = 0;
      if ((v15 & 0x80) != 0)
        goto LABEL_20;
LABEL_24:
      v19 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    v16 = 0;
    if ((v15 & 0x20) != 0)
      goto LABEL_18;
  }
  v17 = 0;
  if ((v15 & 4) == 0)
    goto LABEL_23;
LABEL_19:
  v18 = 2654435761 * self->_preferredTransportType;
  if ((v15 & 0x80) == 0)
    goto LABEL_24;
LABEL_20:
  v19 = 2654435761 * self->_isWidgetRequest;
LABEL_25:
  v20 = v5 ^ v3 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  v21 = v16 ^ v17 ^ v18 ^ v19 ^ -[GEOPDSSearchEvChargingParameters hash](self->_evChargingParameters, "hash");
  v22 = v20 ^ v21 ^ -[GEOPDSearchOriginationInfo hash](self->_searchOriginationInfo, "hash");
  return v22 ^ -[NSMutableArray hash](self->_inputCategorys, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_venueFilter, 0);
  objc_storeStrong((id *)&self->_searchOriginationInfo, 0);
  objc_storeStrong((id *)&self->_inputCategorys, 0);
  objc_storeStrong((id *)&self->_evChargingParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
