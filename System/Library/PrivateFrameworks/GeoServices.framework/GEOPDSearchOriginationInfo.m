@implementation GEOPDSearchOriginationInfo

- (GEOPDSearchOriginationInfo)init
{
  GEOPDSearchOriginationInfo *v2;
  GEOPDSearchOriginationInfo *v3;
  GEOPDSearchOriginationInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchOriginationInfo;
  v2 = -[GEOPDSearchOriginationInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchOriginationInfo)initWithData:(id)a3
{
  GEOPDSearchOriginationInfo *v3;
  GEOPDSearchOriginationInfo *v4;
  GEOPDSearchOriginationInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchOriginationInfo;
  v3 = -[GEOPDSearchOriginationInfo initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPDSearchOriginationInfo;
  -[GEOPDSearchOriginationInfo dealloc](&v3, sel_dealloc);
}

- (uint64_t)searchOriginationType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 2) != 0)
      return *(unsigned int *)(v1 + 72);
    else
      return 0;
  }
  return result;
}

- (void)_readRoutePlanningParameters
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
        GEOPDSearchOriginationInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutePlanningParameters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)setRoutePlanningParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 76) |= 0x10u;
    *(_BYTE *)(a1 + 76) |= 0x20u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)_readSearchClientContexts
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
        GEOPDSearchOriginationInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchClientContexts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)addSearchClientContext:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchOriginationInfo _readSearchClientContexts](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 76) |= 0x20u;
  }
}

- (uint64_t)searchClientContextAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOPDSearchOriginationInfo _readSearchClientContexts](result);
    v4 = *(_QWORD *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 24) + 4 * a2);
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
  v8.super_class = (Class)GEOPDSearchOriginationInfo;
  -[GEOPDSearchOriginationInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchOriginationInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchOriginationInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;

  if (!a1)
    return 0;
  -[GEOPDSearchOriginationInfo readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 76) & 2) != 0)
  {
    v5 = *(int *)(a1 + 72);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 72));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0DE80[v5];
    }
    if (a2)
      v7 = CFSTR("searchOriginationType");
    else
      v7 = CFSTR("search_origination_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  -[GEOPDSearchOriginationInfo _readRoutePlanningParameters](a1);
  v8 = *(id *)(a1 + 48);
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("routePlanningParameters");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("route_planning_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v14 = 0;
      do
      {
        v15 = *(unsigned int *)(*v13 + 4 * v14);
        if ((_DWORD)v15)
        {
          if ((_DWORD)v15 == 1)
          {
            v16 = CFSTR("SEARCH_CLIENT_CONTEXT_HIKING");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v16 = CFSTR("SEARCH_CLIENT_CONTEXT_UNKNOWN");
        }
        objc_msgSend(v12, "addObject:", v16);

        ++v14;
        v13 = (_QWORD *)(a1 + 24);
      }
      while (v14 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v17 = CFSTR("searchClientContext");
    else
      v17 = CFSTR("search_client_context");
    objc_msgSend(v4, "setObject:forKey:", v12, v17);

  }
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    v18 = *(int *)(a1 + 68);
    if (v18 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E1C0DEA0[v18];
    }
    if (a2)
      v20 = CFSTR("clientSoftwarePlatform");
    else
      v20 = CFSTR("client_software_platform");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __56__GEOPDSearchOriginationInfo__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E1C00600;
      v25 = v24;
      v29 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v28);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchOriginationInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1042;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1043;
      GEOPDSearchOriginationInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __56__GEOPDSearchOriginationInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  int *v8;
  id v9;
  int v10;
  const __CFString *v11;
  void *v12;
  GEOPDSearchOriginationRoutePlanningParameters *v13;
  id v14;
  const __CFString *v15;
  int v16;
  void *v17;
  GEOLatLng *v18;
  GEOLatLng *v19;
  GEOLatLng *v20;
  const __CFString *v21;
  void *v22;
  char v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  const __CFString *v33;
  void *v34;
  id v35;
  int v36;
  void *v38;
  int v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("searchOriginationType");
      else
        v6 = CFSTR("search_origination_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v8 = &OBJC_IVAR___GEOPDRelatedEntitySection__reader;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v7;
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SEARCH_ORIGINATION_TYPE_DEFAULT")) & 1) != 0)
        {
          v10 = 0;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SEARCH_ORIGINATION_TYPE_ROUTE_PLANNING")) & 1) != 0)
        {
          v10 = 1;
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SEARCH_ORIGINATION_TYPE_SEARCH_ALONG_ROUTE")) & 1) != 0)
        {
          v10 = 2;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("SEARCH_ORIGINATION_TYPE_IMPLICIT")))
        {
          v10 = 3;
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_20;
        v10 = objc_msgSend(v7, "intValue");
      }
      *(_BYTE *)(a1 + 76) |= 0x20u;
      *(_BYTE *)(a1 + 76) |= 2u;
      *(_DWORD *)(a1 + 72) = v10;
LABEL_20:

      if (a3)
        v11 = CFSTR("routePlanningParameters");
      else
        v11 = CFSTR("route_planning_parameters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOPDSearchOriginationRoutePlanningParameters alloc];
        if (v13)
        {
          v14 = v12;
          v13 = -[GEOPDSearchOriginationRoutePlanningParameters init](v13, "init");
          if (v13)
          {
            if (a3)
              v15 = CFSTR("previousLocation");
            else
              v15 = CFSTR("previous_location");
            objc_msgSend(v14, "objectForKeyedSubscript:", v15);
            v16 = a3;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = [GEOLatLng alloc];
              if ((v16 & 1) != 0)
                v19 = -[GEOLatLng initWithJSON:](v18, "initWithJSON:", v17);
              else
                v19 = -[GEOLatLng initWithDictionary:](v18, "initWithDictionary:", v17);
              v20 = v19;
              -[GEOPDSearchOriginationRoutePlanningParameters setPreviousLocation:]((uint64_t)v13, v19);

              v8 = &OBJC_IVAR___GEOPDRelatedEntitySection__reader;
            }

            if (v16)
              v21 = CFSTR("isEditServerRecommendedStop");
            else
              v21 = CFSTR("is_edit_server_recommended_stop");
            objc_msgSend(v14, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = objc_msgSend(v22, "BOOLValue");
              *(_BYTE *)&v13->_flags |= 1u;
              v13->_isEditServerRecommendedStop = v23;
            }

            a3 = v16;
          }

        }
        -[GEOPDSearchOriginationInfo setRoutePlanningParameters:](a1, v13);

      }
      if (a3)
        v24 = CFSTR("searchClientContext");
      else
        v24 = CFSTR("search_client_context");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = a3;
        v40 = v5;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v38 = v25;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (!v27)
          goto LABEL_61;
        v28 = v27;
        v29 = *(_QWORD *)v42;
        while (1)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v42 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v32 = v31;
              if ((objc_msgSend(v32, "isEqualToString:", CFSTR("SEARCH_CLIENT_CONTEXT_UNKNOWN")) & 1) == 0)
                objc_msgSend(v32, "isEqualToString:", CFSTR("SEARCH_CLIENT_CONTEXT_HIKING"));

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              objc_msgSend(v31, "intValue");
            }
            -[GEOPDSearchOriginationInfo addSearchClientContext:](a1);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          if (!v28)
          {
LABEL_61:

            v5 = v40;
            v8 = &OBJC_IVAR___GEOPDRelatedEntitySection__reader;
            a3 = v39;
            v25 = v38;
            break;
          }
        }
      }

      if (a3)
        v33 = CFSTR("clientSoftwarePlatform");
      else
        v33 = CFSTR("client_software_platform");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v34;
        if ((objc_msgSend(v35, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_UNKNOWN")) & 1) != 0)
        {
          v36 = 0;
        }
        else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_IOS")) & 1) != 0)
        {
          v36 = 1;
        }
        else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_WATCHOS")) & 1) != 0)
        {
          v36 = 2;
        }
        else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_MACOS")) & 1) != 0)
        {
          v36 = 3;
        }
        else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_TVOS")) & 1) != 0)
        {
          v36 = 4;
        }
        else if (objc_msgSend(v35, "isEqualToString:", CFSTR("CLIENT_SOFTWARE_PLATFORM_WEB")))
        {
          v36 = 5;
        }
        else
        {
          v36 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_83:

          goto LABEL_84;
        }
        v36 = objc_msgSend(v34, "intValue");
      }
      *(_BYTE *)(a1 + v8[146]) |= 0x20u;
      *(_BYTE *)(a1 + v8[146]) |= 1u;
      *(_DWORD *)(a1 + 68) = v36;
      goto LABEL_83;
    }
  }
LABEL_84:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchOriginationInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
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
    -[GEOPDSearchOriginationInfo readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v9;
    if (self->_routePlanningParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_searchClientContexts.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v9;
        ++v6;
      }
      while (v6 < self->_searchClientContexts.count);
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(_BOOL8)result
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    -[GEOPDSearchOriginationInfo _readRoutePlanningParameters](result);
    v4 = *(_QWORD *)(v3 + 48);
    return v4 && (objc_msgSend(*(id *)(v4 + 16), "hasGreenTeaWithValue:", a2) & 1) != 0;
  }
  return result;
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
      GEOPDSearchOriginationInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchOriginationInfo readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_searchOriginationType;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v9 = -[GEOPDSearchOriginationRoutePlanningParameters copyWithZone:](self->_routePlanningParameters, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_clientSoftwarePlatform;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v11 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDSearchOriginationRoutePlanningParameters *routePlanningParameters;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOPDSearchOriginationInfo readAll:]((uint64_t)self, 1);
  -[GEOPDSearchOriginationInfo readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_searchOriginationType != *((_DWORD *)v4 + 18))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  routePlanningParameters = self->_routePlanningParameters;
  if ((unint64_t)routePlanningParameters | *((_QWORD *)v4 + 6)
    && !-[GEOPDSearchOriginationRoutePlanningParameters isEqual:](routePlanningParameters, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 76) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_clientSoftwarePlatform != *((_DWORD *)v4 + 17))
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

  -[GEOPDSearchOriginationInfo readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_searchOriginationType;
  else
    v3 = 0;
  v4 = -[GEOPDSearchOriginationRoutePlanningParameters hash](self->_routePlanningParameters, "hash");
  v5 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_clientSoftwarePlatform;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(uint64_t)a1
{
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t i;
  _DWORD *v9;

  v3 = a2;
  if (!a1)
    goto LABEL_15;
  v9 = v3;
  -[GEOPDSearchOriginationInfo readAll:]((uint64_t)v3, 0);
  v4 = (uint64_t)v9;
  if ((v9[19] & 2) != 0)
  {
    *(_DWORD *)(a1 + 72) = v9[18];
    *(_BYTE *)(a1 + 76) |= 2u;
  }
  v5 = *(_QWORD *)(a1 + 48);
  v6 = (void *)*((_QWORD *)v9 + 6);
  if (v5)
  {
    if (v6)
    {
      -[GEOPDSearchOriginationRoutePlanningParameters mergeFrom:](v5, v6);
LABEL_9:
      v4 = (uint64_t)v9;
    }
  }
  else if (v6)
  {
    -[GEOPDSearchOriginationInfo setRoutePlanningParameters:](a1, v6);
    goto LABEL_9;
  }
  -[GEOPDSearchOriginationInfo _readSearchClientContexts](v4);
  v3 = v9;
  v7 = *((_QWORD *)v9 + 4);
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      -[GEOPDSearchOriginationInfo searchClientContextAtIndex:]((uint64_t)v3, i);
      -[GEOPDSearchOriginationInfo addSearchClientContext:](a1);
      v3 = v9;
    }
  }
  if ((v3[19] & 1) != 0)
  {
    *(_DWORD *)(a1 + 68) = v3[17];
    *(_BYTE *)(a1 + 76) |= 1u;
  }
LABEL_15:

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 4u;
    *(_BYTE *)(a1 + 76) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSearchOriginationInfo readAll:](a1, 0);
      -[GEOPDSearchOriginationRoutePlanningParameters clearUnknownFields:](*(_QWORD *)(a1 + 48), 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDSearchOriginationInfo)initWithTraits:(id)a3
{
  id v4;
  GEOPDSearchOriginationInfo *v5;
  GEOPDSearchOriginationRoutePlanningParameters *v6;
  void *v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPDSearchOriginationInfo;
  v5 = -[GEOPDSearchOriginationInfo init](&v13, sel_init);
  if (v5)
  {
    switch(objc_msgSend(v4, "searchOriginationType"))
    {
      case 0u:
        *(_BYTE *)&v5->_flags |= 0x20u;
        *(_BYTE *)&v5->_flags |= 2u;
        v5->_searchOriginationType = 0;
        break;
      case 1u:
        *(_BYTE *)&v5->_flags |= 0x20u;
        *(_BYTE *)&v5->_flags |= 2u;
        v5->_searchOriginationType = 1;
        v6 = objc_alloc_init(GEOPDSearchOriginationRoutePlanningParameters);
        objc_msgSend(v4, "searchOriginationPreviousLatlng");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPDSearchOriginationRoutePlanningParameters setPreviousLocation:]((uint64_t)v6, v7);

        v8 = objc_msgSend(v4, "searchOriginationEditingServerWaypoints");
        if (v6)
        {
          *(_BYTE *)&v6->_flags |= 1u;
          v6->_isEditServerRecommendedStop = v8;
        }
        -[GEOPDSearchOriginationInfo setRoutePlanningParameters:]((uint64_t)v5, v6);

        break;
      case 2u:
        *(_BYTE *)&v5->_flags |= 0x20u;
        *(_BYTE *)&v5->_flags |= 2u;
        v9 = 2;
        goto LABEL_9;
      case 3u:
        *(_BYTE *)&v5->_flags |= 0x20u;
        *(_BYTE *)&v5->_flags |= 2u;
        v9 = 3;
LABEL_9:
        v5->_searchOriginationType = v9;
        break;
      default:
        break;
    }
    if (GEOConfigGetBOOL(MapsFeaturesConfig_HikingWatchEnabled, (uint64_t)off_1EDF4B188)
      && ((objc_msgSend(v4, "isWithinHikingBoundary") & 1) != 0
       || objc_msgSend(v4, "isWithinHikingBufferRegion")))
    {
      -[GEOPDSearchOriginationInfo addSearchClientContext:]((uint64_t)v5);
    }
    v10 = objc_msgSend(v4, "devicePlatform") - 1;
    if (v10 > 3)
      v11 = 0;
    else
      v11 = dword_189CE3CF0[v10];
    *(_BYTE *)&v5->_flags |= 0x20u;
    *(_BYTE *)&v5->_flags |= 1u;
    v5->_clientSoftwarePlatform = v11;
  }

  return v5;
}

@end
