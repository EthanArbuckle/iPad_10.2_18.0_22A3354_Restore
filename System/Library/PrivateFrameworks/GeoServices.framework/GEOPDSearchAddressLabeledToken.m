@implementation GEOPDSearchAddressLabeledToken

- (GEOPDSearchAddressLabeledToken)init
{
  GEOPDSearchAddressLabeledToken *v2;
  GEOPDSearchAddressLabeledToken *v3;
  GEOPDSearchAddressLabeledToken *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchAddressLabeledToken;
  v2 = -[GEOPDSearchAddressLabeledToken init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchAddressLabeledToken)initWithData:(id)a3
{
  GEOPDSearchAddressLabeledToken *v3;
  GEOPDSearchAddressLabeledToken *v4;
  GEOPDSearchAddressLabeledToken *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchAddressLabeledToken;
  v3 = -[GEOPDSearchAddressLabeledToken initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addGeoDecoration:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 2) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeoDecorations_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSearchAddressLabeledToken _addNoFlagsGeoDecoration:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 80) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_BYTE *)(a1 + 80) |= 0x40u;
  }
}

- (void)_addNoFlagsGeoDecoration:(uint64_t)a1
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

- (void)_readUnPaddedDoorNumbers
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUnPaddedDoorNumbers_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)addUnPaddedDoorNumbers:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchAddressLabeledToken _readUnPaddedDoorNumbers](a1);
    -[GEOPDSearchAddressLabeledToken _addNoFlagsUnPaddedDoorNumbers:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 80) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_BYTE *)(a1 + 80) |= 0x40u;
  }
}

- (void)_addNoFlagsUnPaddedDoorNumbers:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchAddressLabeledToken;
  -[GEOPDSearchAddressLabeledToken description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchAddressLabeledToken dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchAddressLabeledToken _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  const __CFString *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchAddressLabeledToken readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 76));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v6 = CFSTR("labelType");
  else
    v6 = CFSTR("label_type");
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = *(id *)(a1 + 24);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v12, "jsonRepresentation");
          else
            objc_msgSend(v12, "dictionaryRepresentation", (_QWORD)v36);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13, (_QWORD)v36);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v9);
    }

    if (a2)
      v14 = CFSTR("geoDecoration");
    else
      v14 = CFSTR("geo_decoration");
    objc_msgSend(v4, "setObject:forKey:", v7, v14, (_QWORD)v36);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
  {
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = v15;
      objc_sync_enter(v16);
      GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readToken_tags_2);
      objc_sync_exit(v16);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v17 = *(id *)(a1 + 48);
  if (v17)
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("token"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 80) & 4) == 0)
  {
    v18 = *(void **)(a1 + 8);
    if (v18)
    {
      v19 = v18;
      objc_sync_enter(v19);
      GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabel_tags_2);
      objc_sync_exit(v19);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v20 = *(id *)(a1 + 32);
  if (v20)
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("label"));

  if (*(_QWORD *)(a1 + 56))
  {
    -[GEOPDSearchAddressLabeledToken _readUnPaddedDoorNumbers](a1);
    v21 = *(id *)(a1 + 56);
    if (a2)
      v22 = CFSTR("unPaddedDoorNumbers");
    else
      v22 = CFSTR("un_padded_door_numbers");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 80) & 1) == 0)
  {
    v23 = *(void **)(a1 + 8);
    if (v23)
    {
      v24 = v23;
      objc_sync_enter(v24);
      GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbbrDecoration_tags);
      objc_sync_exit(v24);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v25 = *(id *)(a1 + 16);
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("abbrDecoration");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("abbr_decoration");
    }
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_BYTE *)(a1 + 80) & 8) == 0)
  {
    v29 = *(void **)(a1 + 8);
    if (v29)
    {
      v30 = v29;
      objc_sync_enter(v30);
      GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStreetRelaxationDecoration_tags);
      objc_sync_exit(v30);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v31 = *(id *)(a1 + 40);
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("streetRelaxationDecoration");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("street_relaxation_decoration");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchAddressLabeledToken _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_106;
      else
        v6 = (int *)&readAll__nonRecursiveTag_107;
      GEOPDSearchAddressLabeledTokenReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchAddressLabeledTokenCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  GEOPDSearchStringStringPair *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  GEOPDSearchGeoDecoration *v38;
  void *v39;
  id v40;
  const __CFString *v41;
  void *v42;
  GEOPDSearchGeoDecoration *v43;
  void *v44;
  id v45;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("labelType");
    else
      v7 = CFSTR("label_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "intValue");
      *(_BYTE *)(v6 + 80) |= 0x40u;
      *(_DWORD *)(v6 + 76) = v9;
    }

    if (a3)
      v10 = CFSTR("geoDecoration");
    else
      v10 = CFSTR("geo_decoration");
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = a3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v53;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v53 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v16);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = [GEOPDSearchStringStringPair alloc];
              if (v18)
                v19 = (void *)-[GEOPDSearchStringStringPair _initWithDictionary:isJSON:](v18, v17);
              else
                v19 = 0;
              -[GEOPDSearchAddressLabeledToken addGeoDecoration:](v6, v19);

            }
            ++v16;
          }
          while (v14 != v16);
          v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
          v14 = v20;
        }
        while (v20);
      }

      a3 = v47;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("token"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      v23 = v22;
      *(_BYTE *)(v6 + 80) |= 0x10u;
      *(_BYTE *)(v6 + 80) |= 0x40u;
      objc_storeStrong((id *)(v6 + 48), v22);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("label"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      v26 = v25;
      *(_BYTE *)(v6 + 80) |= 4u;
      *(_BYTE *)(v6 + 80) |= 0x40u;
      objc_storeStrong((id *)(v6 + 32), v25);

    }
    if (a3)
      v27 = CFSTR("unPaddedDoorNumbers");
    else
      v27 = CFSTR("un_padded_door_numbers");
    objc_msgSend(v5, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v29 = v28;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v49;
        do
        {
          v33 = 0;
          do
          {
            if (*(_QWORD *)v49 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v33);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v35 = (void *)objc_msgSend(v34, "copy");
              -[GEOPDSearchAddressLabeledToken addUnPaddedDoorNumbers:](v6, v35);

            }
            ++v33;
          }
          while (v31 != v33);
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        }
        while (v31);
      }

      a3 = v47;
    }

    if (a3)
      v36 = CFSTR("abbrDecoration");
    else
      v36 = CFSTR("abbr_decoration");
    objc_msgSend(v5, "objectForKeyedSubscript:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = [GEOPDSearchGeoDecoration alloc];
      if (v38)
        v39 = (void *)-[GEOPDSearchGeoDecoration _initWithDictionary:isJSON:](v38, v37, a3);
      else
        v39 = 0;
      v40 = v39;
      *(_BYTE *)(v6 + 80) |= 1u;
      *(_BYTE *)(v6 + 80) |= 0x40u;
      objc_storeStrong((id *)(v6 + 16), v39);

    }
    if (a3)
      v41 = CFSTR("streetRelaxationDecoration");
    else
      v41 = CFSTR("street_relaxation_decoration");
    objc_msgSend(v5, "objectForKeyedSubscript:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = [GEOPDSearchGeoDecoration alloc];
      if (v43)
        v44 = (void *)-[GEOPDSearchGeoDecoration _initWithDictionary:isJSON:](v43, v42, a3);
      else
        v44 = 0;
      v45 = v44;
      *(_BYTE *)(v6 + 80) |= 8u;
      *(_BYTE *)(v6 + 80) |= 0x40u;
      objc_storeStrong((id *)(v6 + 40), v44);

    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchAddressLabeledTokenReadAllFrom((uint64_t)self, a3, 0);
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
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchAddressLabeledTokenIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchAddressLabeledToken readAll:]((uint64_t)self, 0);
    PBDataWriterWriteInt32Field();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_geoDecorations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    PBDataWriterWriteStringField();
    PBDataWriterWriteStringField();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_unPaddedDoorNumbers;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if (self->_abbrDecoration)
      PBDataWriterWriteSubmessage();
    if (self->_streetRelaxationDecoration)
      PBDataWriterWriteSubmessage();
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchAddressLabeledTokenReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchAddressLabeledToken readAll:]((uint64_t)self, 0);
  *(_DWORD *)(v5 + 76) = self->_labelType;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = self->_geoDecorations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSearchAddressLabeledToken addGeoDecoration:](v5, v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }

  v13 = -[NSString copyWithZone:](self->_token, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = self->_unPaddedDoorNumbers;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v27);
        -[GEOPDSearchAddressLabeledToken addUnPaddedDoorNumbers:](v5, v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v18);
  }

  v22 = -[GEOPDSearchGeoDecoration copyWithZone:](self->_abbrDecoration, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;

  v24 = -[GEOPDSearchGeoDecoration copyWithZone:](self->_streetRelaxationDecoration, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *geoDecorations;
  NSString *token;
  NSString *label;
  NSMutableArray *unPaddedDoorNumbers;
  GEOPDSearchGeoDecoration *abbrDecoration;
  GEOPDSearchGeoDecoration *streetRelaxationDecoration;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOPDSearchAddressLabeledToken readAll:]((uint64_t)self, 1),
        -[GEOPDSearchAddressLabeledToken readAll:]((uint64_t)v4, 1),
        self->_labelType == *((_DWORD *)v4 + 19))
    && ((geoDecorations = self->_geoDecorations, !((unint64_t)geoDecorations | v4[3]))
     || -[NSMutableArray isEqual:](geoDecorations, "isEqual:"))
    && ((token = self->_token, !((unint64_t)token | v4[6]))
     || -[NSString isEqual:](token, "isEqual:"))
    && ((label = self->_label, !((unint64_t)label | v4[4]))
     || -[NSString isEqual:](label, "isEqual:"))
    && ((unPaddedDoorNumbers = self->_unPaddedDoorNumbers, !((unint64_t)unPaddedDoorNumbers | v4[7]))
     || -[NSMutableArray isEqual:](unPaddedDoorNumbers, "isEqual:"))
    && ((abbrDecoration = self->_abbrDecoration, !((unint64_t)abbrDecoration | v4[2]))
     || -[GEOPDSearchGeoDecoration isEqual:](abbrDecoration, "isEqual:")))
  {
    streetRelaxationDecoration = self->_streetRelaxationDecoration;
    if ((unint64_t)streetRelaxationDecoration | v4[5])
      v11 = -[GEOPDSearchGeoDecoration isEqual:](streetRelaxationDecoration, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;

  -[GEOPDSearchAddressLabeledToken readAll:]((uint64_t)self, 1);
  v3 = 2654435761 * self->_labelType;
  v4 = -[NSMutableArray hash](self->_geoDecorations, "hash");
  v5 = v4 ^ -[NSString hash](self->_token, "hash");
  v6 = v5 ^ -[NSString hash](self->_label, "hash");
  v7 = v6 ^ -[NSMutableArray hash](self->_unPaddedDoorNumbers, "hash");
  v8 = v7 ^ -[GEOPDSearchGeoDecoration hash](self->_abbrDecoration, "hash") ^ v3;
  return v8 ^ -[GEOPDSearchGeoDecoration hash](self->_streetRelaxationDecoration, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unPaddedDoorNumbers, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_streetRelaxationDecoration, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_geoDecorations, 0);
  objc_storeStrong((id *)&self->_abbrDecoration, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
