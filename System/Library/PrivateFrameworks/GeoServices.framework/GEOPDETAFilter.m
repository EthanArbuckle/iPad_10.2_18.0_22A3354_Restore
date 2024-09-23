@implementation GEOPDETAFilter

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
        v6 = (int *)&readAll__recursiveTag_3159;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3160;
      GEOPDETAFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDETAFilterCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

+ (id)etaFilterForTraits:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "hasNavigationTransportType"))
    {
      v18 = objc_msgSend(v5, "navigationTransportType");
      objc_msgSend(v5, "automobileOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transitOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "walkingOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cyclingOptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_etaFilterWithTransportTypes:transportTypesCount:automobileOptions:transitOptions:walkingOptions:cyclingOptions:", &v18, 1, v6, v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = objc_msgSend(v5, "transportTypes");
      v12 = objc_msgSend(v5, "transportTypesCount");
      objc_msgSend(v5, "automobileOptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transitOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "walkingOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cyclingOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_etaFilterWithTransportTypes:transportTypesCount:automobileOptions:transitOptions:walkingOptions:cyclingOptions:", v11, v12, v13, v14, v15, v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)etaFilterForRouteAttributes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  unint64_t v11;
  _DWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v19[16];

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  v6 = objc_msgSend(v4, "additionalTransportTypesCount");
  v7 = v6 + objc_msgSend(v5, "hasMainTransportType");
  v8 = malloc_type_malloc(4 * v7, 0x100004052888210uLL);
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: transportTypes != ((void *)0)", v19, 2u);
    }
    goto LABEL_12;
  }
  v9 = v8;
  if (objc_msgSend(v5, "hasMainTransportType"))
  {
    *v9 = objc_msgSend(v5, "mainTransportType");
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v5, "additionalTransportTypesCount"))
  {
    v11 = 0;
    v12 = &v9[v10];
    do
    {
      v12[v11] = *(_DWORD *)(objc_msgSend(v5, "additionalTransportTypes") + 4 * v11);
      ++v11;
    }
    while (v11 < objc_msgSend(v5, "additionalTransportTypesCount"));
  }
  objc_msgSend(v5, "automobileOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "walkingOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cyclingOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_etaFilterWithTransportTypes:transportTypesCount:automobileOptions:transitOptions:walkingOptions:cyclingOptions:", v9, v7, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  free(v9);
LABEL_13:

  return v17;
}

+ (id)_etaFilterWithTransportTypes:(int *)a3 transportTypesCount:(unint64_t)a4 automobileOptions:(id)a5 transitOptions:(id)a6 walkingOptions:(id)a7 cyclingOptions:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = objc_alloc_init((Class)a1);
  v18 = v17;
  if (a4)
    -[GEOPDETAFilter setTransportTypes:count:]((uint64_t)v17);
  if (v13)
    -[GEOPDETAFilter setAutomobileOptions:]((uint64_t)v18, v13);
  if (v14)
    -[GEOPDETAFilter setTransitOptions:]((uint64_t)v18, v14);
  if (v16)
  {
    -[GEOPDETAFilter setWalkingOptions:]((uint64_t)v18, v15);
    -[GEOPDETAFilter setCyclingOptions:]((uint64_t)v18, v16);
  }

  return v18;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a2;
  v4 = (uint64_t)v3;
  if (!a1)
    goto LABEL_44;
  v22 = (uint64_t)v3;
  -[GEOPDETAFilter readAll:]((uint64_t)v3, 0);
  v4 = v22;
  if (v22)
  {
    -[GEOPDETAFilter _readTransportTypes](v22);
    v4 = v22;
    v5 = *(_QWORD *)(v22 + 32);
    if (v5)
    {
      v6 = 0;
      v7 = *MEMORY[0x1E0C99858];
      do
      {
        -[GEOPDETAFilter _readTransportTypes](v4);
        v8 = *(_QWORD *)(v22 + 32);
        if (v8 <= v6)
        {
          v9 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v6, v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v7, v10, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "raise");

        }
        -[GEOPDETAFilter addTransportType:](a1);
        v4 = v22;
        ++v6;
      }
      while (v5 != v6);
    }
  }
  if ((*(_WORD *)(v4 + 104) & 2) != 0)
  {
    *(_BYTE *)(a1 + 101) = *(_BYTE *)(v4 + 101);
    *(_WORD *)(a1 + 104) |= 2u;
  }
  v12 = *(void **)(a1 + 48);
  v13 = *(_QWORD *)(v4 + 48);
  if (v12)
  {
    if (!v13)
      goto LABEL_16;
    objc_msgSend(v12, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_16;
    -[GEOPDETAFilter setAutomobileOptions:](a1, *(void **)(v4 + 48));
  }
  v4 = v22;
LABEL_16:
  v14 = *(void **)(a1 + 64);
  v15 = *(_QWORD *)(v4 + 64);
  if (v14)
  {
    if (!v15)
      goto LABEL_22;
    objc_msgSend(v14, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_22;
    -[GEOPDETAFilter setCyclingOptions:](a1, *(void **)(v4 + 64));
  }
  v4 = v22;
LABEL_22:
  v16 = *(void **)(a1 + 72);
  v17 = *(_QWORD *)(v4 + 72);
  if (v16)
  {
    if (!v17)
      goto LABEL_28;
    objc_msgSend(v16, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_28;
    -[GEOPDETAFilter setTransitOptions:](a1, *(void **)(v4 + 72));
  }
  v4 = v22;
LABEL_28:
  v18 = *(void **)(a1 + 80);
  v19 = *(_QWORD *)(v4 + 80);
  if (v18)
  {
    if (!v19)
      goto LABEL_34;
    objc_msgSend(v18, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_34;
    -[GEOPDETAFilter setWalkingOptions:](a1, *(void **)(v4 + 80));
  }
  v4 = v22;
LABEL_34:
  if ((*(_WORD *)(v4 + 104) & 4) != 0)
  {
    *(_BYTE *)(a1 + 102) = *(_BYTE *)(v4 + 102);
    *(_WORD *)(a1 + 104) |= 4u;
  }
  v20 = *(void **)(a1 + 56);
  v21 = *(_QWORD *)(v4 + 56);
  if (v20)
  {
    if (!v21)
      goto LABEL_42;
    objc_msgSend(v20, "mergeFrom:");
  }
  else
  {
    if (!v21)
      goto LABEL_42;
    -[GEOPDETAFilter setClientCapabilities:](a1, *(void **)(v4 + 56));
  }
  v4 = v22;
LABEL_42:
  if ((*(_WORD *)(v4 + 104) & 1) != 0)
  {
    *(_BYTE *)(a1 + 100) = *(_BYTE *)(v4 + 100);
    *(_WORD *)(a1 + 104) |= 1u;
  }
LABEL_44:

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 8u;
    *(_WORD *)(a1 + 104) |= 0x400u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDETAFilter readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 48), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(a1 + 64), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(a1 + 72), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(a1 + 80), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(a1 + 56), "clearUnknownFields:", 1);
    }
  }
}

- (GEOPDETAFilter)init
{
  GEOPDETAFilter *v2;
  GEOPDETAFilter *v3;
  GEOPDETAFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDETAFilter;
  v2 = -[GEOPDETAFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDETAFilter)initWithData:(id)a3
{
  GEOPDETAFilter *v3;
  GEOPDETAFilter *v4;
  GEOPDETAFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDETAFilter;
  v3 = -[GEOPDETAFilter initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPDETAFilter;
  -[GEOPDETAFilter dealloc](&v3, sel_dealloc);
}

- (void)_readTransportTypes
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDETAFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransportTypes_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
}

- (void)addTransportType:(uint64_t)a1
{
  -[GEOPDETAFilter _readTransportTypes](a1);
  PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)(a1 + 104) |= 0x10u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  *(_WORD *)(a1 + 104) |= 0x400u;
}

- (uint64_t)setTransportTypes:(uint64_t)result count:
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    *(_WORD *)(v1 + 104) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 96));
    *(_WORD *)(v1 + 104) |= 0x400u;
    return PBRepeatedInt32Set();
  }
  return result;
}

- (void)_readAutomobileOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDETAFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutomobileOptions_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)automobileOptions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDETAFilter _readAutomobileOptions]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setAutomobileOptions:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 104) |= 0x20u;
    *(_WORD *)(a1 + 104) |= 0x400u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)setCyclingOptions:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 104) |= 0x80u;
    *(_WORD *)(a1 + 104) |= 0x400u;
    objc_storeStrong((id *)(a1 + 64), a2);
  }

}

- (void)setTransitOptions:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 104) |= 0x100u;
    *(_WORD *)(a1 + 104) |= 0x400u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }

}

- (void)setWalkingOptions:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 104) |= 0x200u;
    *(_WORD *)(a1 + 104) |= 0x400u;
    objc_storeStrong((id *)(a1 + 80), a2);
  }

}

- (void)setClientCapabilities:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 104) |= 0x40u;
  *(_WORD *)(a1 + 104) |= 0x400u;
  objc_storeStrong((id *)(a1 + 56), a2);

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
  v8.super_class = (Class)GEOPDETAFilter;
  -[GEOPDETAFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDETAFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDETAFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v47[4];
  id v48;

  if (!a1)
    return 0;
  -[GEOPDETAFilter readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v7 = 0;
      do
      {
        v8 = *(int *)(*v6 + 4 * v7);
        if (v8 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E1C0B920[v8];
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = (_QWORD *)(a1 + 24);
      }
      while (v7 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v10 = CFSTR("transportType");
    else
      v10 = CFSTR("transport_type");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  if ((*(_WORD *)(a1 + 104) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 101));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("includeHistoricTravelTime");
    else
      v12 = CFSTR("include_historic_travel_time");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  -[GEOPDETAFilter automobileOptions]((id *)a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v13, "jsonRepresentation");
    else
      objc_msgSend(v13, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("automobileOptions"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
  {
    v16 = *(void **)(a1 + 8);
    if (v16)
    {
      v17 = v16;
      objc_sync_enter(v17);
      GEOPDETAFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCyclingOptions_tags_1);
      objc_sync_exit(v17);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v18 = *(id *)(a1 + 64);
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v18, "jsonRepresentation");
    else
      objc_msgSend(v18, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("cyclingOptions"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
  {
    v21 = *(void **)(a1 + 8);
    if (v21)
    {
      v22 = v21;
      objc_sync_enter(v22);
      GEOPDETAFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitOptions_tags_1);
      objc_sync_exit(v22);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v23 = *(id *)(a1 + 72);
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v23, "jsonRepresentation");
    else
      objc_msgSend(v23, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("transitOptions"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
  {
    v26 = *(void **)(a1 + 8);
    if (v26)
    {
      v27 = v26;
      objc_sync_enter(v27);
      GEOPDETAFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWalkingOptions_tags_1);
      objc_sync_exit(v27);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v28 = *(id *)(a1 + 80);
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v28, "jsonRepresentation");
    else
      objc_msgSend(v28, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("walkingOptions"));

  }
  if ((*(_WORD *)(a1 + 104) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 102));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("includeRouteTrafficDetail");
    else
      v32 = CFSTR("include_route_traffic_detail");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
  {
    v33 = *(void **)(a1 + 8);
    if (v33)
    {
      v34 = v33;
      objc_sync_enter(v34);
      GEOPDETAFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientCapabilities_tags_0);
      objc_sync_exit(v34);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v35 = *(id *)(a1 + 56);
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v35, "jsonRepresentation");
    else
      objc_msgSend(v35, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("clientCapabilities"));

  }
  if ((*(_WORD *)(a1 + 104) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 100));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v39 = CFSTR("includeEtaRouteIncidents");
    else
      v39 = CFSTR("include_eta_route_incidents");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __44__GEOPDETAFilter__dictionaryRepresentation___block_invoke;
      v47[3] = &unk_1E1C00600;
      v44 = v43;
      v48 = v44;
      objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v47);
      v45 = v44;

      v42 = v45;
    }
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDETAFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPDETAFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  char v18;
  void *v19;
  GEOAutomobileOptions *v20;
  GEOAutomobileOptions *v21;
  GEOAutomobileOptions *v22;
  void *v23;
  GEOCyclingOptions *v24;
  GEOCyclingOptions *v25;
  GEOCyclingOptions *v26;
  void *v27;
  GEOTransitOptions *v28;
  GEOTransitOptions *v29;
  GEOTransitOptions *v30;
  void *v31;
  GEOWalkingOptions *v32;
  GEOWalkingOptions *v33;
  GEOWalkingOptions *v34;
  const __CFString *v35;
  void *v36;
  char v37;
  void *v38;
  GEOClientCapabilities *v39;
  GEOClientCapabilities *v40;
  GEOClientCapabilities *v41;
  const __CFString *v42;
  void *v43;
  char v44;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("transportType");
      else
        v7 = CFSTR("transport_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = v5;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = v8;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        if (!v10)
          goto LABEL_27;
        v11 = v10;
        v12 = *(_QWORD *)v49;
        while (1)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v49 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) == 0
                && (objc_msgSend(v15, "isEqualToString:", CFSTR("TRANSIT")) & 1) == 0
                && (objc_msgSend(v15, "isEqualToString:", CFSTR("WALKING")) & 1) == 0
                && (objc_msgSend(v15, "isEqualToString:", CFSTR("BICYCLE")) & 1) == 0
                && (objc_msgSend(v15, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) == 0
                && (objc_msgSend(v15, "isEqualToString:", CFSTR("FERRY")) & 1) == 0)
              {
                objc_msgSend(v15, "isEqualToString:", CFSTR("RIDESHARE"));
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              objc_msgSend(v14, "intValue");
            }
            -[GEOPDETAFilter addTransportType:](v6);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
          if (!v11)
          {
LABEL_27:

            v5 = v47;
            v8 = v46;
            break;
          }
        }
      }

      if (a3)
        v16 = CFSTR("includeHistoricTravelTime");
      else
        v16 = CFSTR("include_historic_travel_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = objc_msgSend(v17, "BOOLValue");
        *(_WORD *)(v6 + 104) |= 0x400u;
        *(_WORD *)(v6 + 104) |= 2u;
        *(_BYTE *)(v6 + 101) = v18;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("automobileOptions"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOAutomobileOptions alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEOAutomobileOptions initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEOAutomobileOptions initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = v21;
        -[GEOPDETAFilter setAutomobileOptions:](v6, v21);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cyclingOptions"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = [GEOCyclingOptions alloc];
        if ((a3 & 1) != 0)
          v25 = -[GEOCyclingOptions initWithJSON:](v24, "initWithJSON:", v23);
        else
          v25 = -[GEOCyclingOptions initWithDictionary:](v24, "initWithDictionary:", v23);
        v26 = v25;
        -[GEOPDETAFilter setCyclingOptions:](v6, v25);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transitOptions"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = [GEOTransitOptions alloc];
        if ((a3 & 1) != 0)
          v29 = -[GEOTransitOptions initWithJSON:](v28, "initWithJSON:", v27);
        else
          v29 = -[GEOTransitOptions initWithDictionary:](v28, "initWithDictionary:", v27);
        v30 = v29;
        -[GEOPDETAFilter setTransitOptions:](v6, v29);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("walkingOptions"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = [GEOWalkingOptions alloc];
        if ((a3 & 1) != 0)
          v33 = -[GEOWalkingOptions initWithJSON:](v32, "initWithJSON:", v31);
        else
          v33 = -[GEOWalkingOptions initWithDictionary:](v32, "initWithDictionary:", v31);
        v34 = v33;
        -[GEOPDETAFilter setWalkingOptions:](v6, v33);

      }
      if (a3)
        v35 = CFSTR("includeRouteTrafficDetail");
      else
        v35 = CFSTR("include_route_traffic_detail");
      objc_msgSend(v5, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = objc_msgSend(v36, "BOOLValue");
        *(_WORD *)(v6 + 104) |= 0x400u;
        *(_WORD *)(v6 + 104) |= 4u;
        *(_BYTE *)(v6 + 102) = v37;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientCapabilities"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = [GEOClientCapabilities alloc];
        if ((a3 & 1) != 0)
          v40 = -[GEOClientCapabilities initWithJSON:](v39, "initWithJSON:", v38);
        else
          v40 = -[GEOClientCapabilities initWithDictionary:](v39, "initWithDictionary:", v38);
        v41 = v40;
        -[GEOPDETAFilter setClientCapabilities:](v6, v40);

      }
      if (a3)
        v42 = CFSTR("includeEtaRouteIncidents");
      else
        v42 = CFSTR("include_eta_route_incidents");
      objc_msgSend(v5, "objectForKeyedSubscript:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = objc_msgSend(v43, "BOOLValue");
        *(_WORD *)(v6 + 104) |= 0x400u;
        *(_WORD *)(v6 + 104) |= 1u;
        *(_BYTE *)(v6 + 100) = v44;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDETAFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDETAFilterIsDirty((uint64_t)self))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDETAFilter readAll:]((uint64_t)self, 0);
    v5 = v9;
    if (self->_transportTypes.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v9;
        ++v6;
      }
      while (v6 < self->_transportTypes.count);
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
    }
    if (self->_automobileOptions)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_cyclingOptions)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_transitOptions)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_walkingOptions)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if ((*(_WORD *)&self->_flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
    }
    if (self->_clientCapabilities)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
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
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  PBUnknownFields *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDETAFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDETAFilter readAll:]((uint64_t)self, 0);
  PBRepeatedInt32Copy();
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 101) = self->_includeHistoricTravelTime;
    *(_WORD *)(v5 + 104) |= 2u;
  }
  v9 = -[GEOAutomobileOptions copyWithZone:](self->_automobileOptions, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[GEOCyclingOptions copyWithZone:](self->_cyclingOptions, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  v13 = -[GEOTransitOptions copyWithZone:](self->_transitOptions, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v13;

  v15 = -[GEOWalkingOptions copyWithZone:](self->_walkingOptions, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v15;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 102) = self->_includeRouteTrafficDetail;
    *(_WORD *)(v5 + 104) |= 4u;
  }
  v17 = -[GEOClientCapabilities copyWithZone:](self->_clientCapabilities, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v17;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 100) = self->_includeEtaRouteIncidents;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEOAutomobileOptions *automobileOptions;
  GEOCyclingOptions *cyclingOptions;
  GEOTransitOptions *transitOptions;
  GEOWalkingOptions *walkingOptions;
  __int16 flags;
  __int16 v11;
  GEOClientCapabilities *clientCapabilities;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[GEOPDETAFilter readAll:]((uint64_t)self, 1);
  -[GEOPDETAFilter readAll:]((uint64_t)v4, 1);
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_32;
  v5 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0)
      goto LABEL_32;
    if (self->_includeHistoricTravelTime)
    {
      if (!*((_BYTE *)v4 + 101))
        goto LABEL_32;
    }
    else if (*((_BYTE *)v4 + 101))
    {
      goto LABEL_32;
    }
  }
  else if ((v5 & 2) != 0)
  {
    goto LABEL_32;
  }
  automobileOptions = self->_automobileOptions;
  if ((unint64_t)automobileOptions | *((_QWORD *)v4 + 6)
    && !-[GEOAutomobileOptions isEqual:](automobileOptions, "isEqual:"))
  {
    goto LABEL_32;
  }
  cyclingOptions = self->_cyclingOptions;
  if ((unint64_t)cyclingOptions | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOCyclingOptions isEqual:](cyclingOptions, "isEqual:"))
      goto LABEL_32;
  }
  transitOptions = self->_transitOptions;
  if ((unint64_t)transitOptions | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOTransitOptions isEqual:](transitOptions, "isEqual:"))
      goto LABEL_32;
  }
  walkingOptions = self->_walkingOptions;
  if ((unint64_t)walkingOptions | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOWalkingOptions isEqual:](walkingOptions, "isEqual:"))
      goto LABEL_32;
  }
  flags = (__int16)self->_flags;
  v11 = *((_WORD *)v4 + 52);
  if ((flags & 4) != 0)
  {
    if ((v11 & 4) == 0)
      goto LABEL_32;
    if (self->_includeRouteTrafficDetail)
    {
      if (!*((_BYTE *)v4 + 102))
        goto LABEL_32;
    }
    else if (*((_BYTE *)v4 + 102))
    {
      goto LABEL_32;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_32;
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOClientCapabilities isEqual:](clientCapabilities, "isEqual:"))
      goto LABEL_32;
    flags = (__int16)self->_flags;
    v11 = *((_WORD *)v4 + 52);
  }
  v13 = (v11 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v11 & 1) != 0)
    {
      if (self->_includeEtaRouteIncidents)
      {
        if (!*((_BYTE *)v4 + 100))
          goto LABEL_32;
      }
      else if (*((_BYTE *)v4 + 100))
      {
        goto LABEL_32;
      }
      v13 = 1;
      goto LABEL_33;
    }
LABEL_32:
    v13 = 0;
  }
LABEL_33:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  -[GEOPDETAFilter readAll:]((uint64_t)self, 1);
  v3 = PBRepeatedInt32Hash();
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v4 = 2654435761 * self->_includeHistoricTravelTime;
  else
    v4 = 0;
  v5 = -[GEOAutomobileOptions hash](self->_automobileOptions, "hash");
  v6 = -[GEOCyclingOptions hash](self->_cyclingOptions, "hash");
  v7 = -[GEOTransitOptions hash](self->_transitOptions, "hash");
  v8 = -[GEOWalkingOptions hash](self->_walkingOptions, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v9 = 2654435761 * self->_includeRouteTrafficDetail;
  else
    v9 = 0;
  v10 = -[GEOClientCapabilities hash](self->_clientCapabilities, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v11 = 2654435761 * self->_includeEtaRouteIncidents;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
