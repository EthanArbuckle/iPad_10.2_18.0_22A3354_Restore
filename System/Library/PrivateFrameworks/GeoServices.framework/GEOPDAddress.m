@implementation GEOPDAddress

- (GEOPDAddress)init
{
  GEOPDAddress *v2;
  GEOPDAddress *v3;
  GEOPDAddress *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAddress;
  v2 = -[GEOPDAddress init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAddress)initWithData:(id)a3
{
  GEOPDAddress *v3;
  GEOPDAddress *v4;
  GEOPDAddress *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAddress;
  v3 = -[GEOPDAddress initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocalizedAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizedAddress_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)localizedAddress
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAddress _readLocalizedAddress]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setLocalizedAddress:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 64) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)addLocalizedAddress:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDAddress _readLocalizedAddress](a1);
    -[GEOPDAddress _addNoFlagsLocalizedAddress:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 64) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsLocalizedAddress:(uint64_t)a1
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

- (void)_readSpokenNavigationAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenNavigationAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)spokenNavigationAddress
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAddress _readSpokenNavigationAddress]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setSpokenNavigationAddress:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 64) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)addSpokenNavigationAddress:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDAddress _readSpokenNavigationAddress](a1);
    -[GEOPDAddress _addNoFlagsSpokenNavigationAddress:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 64) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsSpokenNavigationAddress:(uint64_t)a1
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

- (void)_readSpokenStructuredAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenStructuredAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)spokenStructuredAddress
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAddress _readSpokenStructuredAddress]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setSpokenStructuredAddress:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 64) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 64) |= 0x20u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }

}

- (void)addSpokenStructuredAddress:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDAddress _readSpokenStructuredAddress](a1);
    -[GEOPDAddress _addNoFlagsSpokenStructuredAddress:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 64) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsSpokenStructuredAddress:(uint64_t)a1
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

- (uint64_t)knownAccuracy
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 64);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 60);
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
  v8.super_class = (Class)GEOPDAddress;
  -[GEOPDAddress description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAddress dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAddress _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  __CFString *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
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
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDAddress readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v6 = *(id *)(a1 + 24);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v53 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("localizedAddress");
    else
      v13 = CFSTR("localized_address");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v15 = *(id *)(a1 + 32);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v49 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("spokenNavigationAddress");
    else
      v22 = CFSTR("spoken_navigation_address");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v24 = *(id *)(a1 + 40);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v45;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v45 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v26);
    }

    if (a2)
      v31 = CFSTR("spokenStructuredAddress");
    else
      v31 = CFSTR("spoken_structured_address");
    objc_msgSend(v4, "setObject:forKey:", v23, v31);

  }
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    v32 = *(int *)(a1 + 60);
    if (v32 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = off_1E1C0BF90[v32];
    }
    if (a2)
      v34 = CFSTR("knownAccuracy");
    else
      v34 = CFSTR("known_accuracy");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  v35 = *(void **)(a1 + 16);
  if (v35)
  {
    objc_msgSend(v35, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __42__GEOPDAddress__dictionaryRepresentation___block_invoke;
      v42[3] = &unk_1E1C00600;
      v39 = v38;
      v43 = v39;
      objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v42);
      v40 = v39;

      v37 = v40;
    }
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAddress _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_137_1;
      else
        v6 = (int *)&readAll__nonRecursiveTag_138_1;
      GEOPDAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDAddressCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __42__GEOPDAddress__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDAddressReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t v6;
  char flags;
  uint64_t v8;
  uint64_t v9;
  uint64_t m;
  uint64_t v11;
  uint64_t v12;
  uint64_t n;
  os_unfair_lock_s *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  NSMutableArray *obj;
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
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  v6 = 8;
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), flags = (char)self->_flags, (flags & 0x3C) != 0))
  {
LABEL_27:
    os_unfair_lock_unlock(p_readerLock);
    -[GEOPDAddress readAll:]((uint64_t)self, 0);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v20 = self->_localizedAddress;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v20);
          PBDataWriterWriteSubmessage();
        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      }
      while (v21);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v24 = self->_spokenNavigationAddress;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v24);
          PBDataWriterWriteSubmessage();
        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v37, v54, 16);
      }
      while (v25);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v28 = self->_spokenStructuredAddress;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v34 != v30)
            objc_enumerationMutation(v28);
          PBDataWriterWriteSubmessage();
        }
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v33, v53, 16);
      }
      while (v29);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      obj = self->_spokenNavigationAddress;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v50;
        while (2)
        {
          for (m = 0; m != v8; ++m)
          {
            if (*(_QWORD *)v50 != v9)
              objc_enumerationMutation(obj);
            if (GEOLocalizedStringIsDirty(*(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * m)))
            {
LABEL_26:

              goto LABEL_27;
            }
          }
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          if (v8)
            continue;
          break;
        }
      }

      flags = (char)self->_flags;
    }
    if ((flags & 0x10) != 0)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      obj = self->_spokenStructuredAddress;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v46;
        while (2)
        {
          for (n = 0; n != v11; ++n)
          {
            if (*(_QWORD *)v46 != v12)
              objc_enumerationMutation(obj);
            v14 = p_readerLock;
            v15 = v6;
            v16 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * n);
            if (v16)
            {
              os_unfair_lock_lock_with_options();
              os_unfair_lock_assert_owner((const os_unfair_lock *)(v16 + 48));
              v17 = *(_BYTE *)(v16 + 52) & 0xE;
              os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 48));
              if (v17)
              {
                p_readerLock = v14;
                goto LABEL_26;
              }
            }
            v6 = v15;
            p_readerLock = v14;
          }
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
          if (v11)
            continue;
          break;
        }
      }

    }
    v18 = *(id *)((char *)&self->super.super.isa + v6);
    objc_sync_enter(v18);
    *(_QWORD *)(*(char **)((char *)&self->super.super.isa + v6) + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v6), "seekToOffset:", self->_readerMarkPos);
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v6), "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
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
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  PBUnknownFields *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
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
      GEOPDAddressReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_29;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAddress readAll:]((uint64_t)self, 0);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = self->_localizedAddress;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDAddress addLocalizedAddress:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v10);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = self->_spokenNavigationAddress;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDAddress addSpokenNavigationAddress:](v5, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v15);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self->_spokenStructuredAddress;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v26);
        -[GEOPDAddress addSpokenStructuredAddress:](v5, v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v20);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_knownAccuracy;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v24 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v24;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *localizedAddress;
  NSMutableArray *spokenNavigationAddress;
  NSMutableArray *spokenStructuredAddress;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[GEOPDAddress readAll:]((uint64_t)self, 1);
  -[GEOPDAddress readAll:]((uint64_t)v4, 1);
  localizedAddress = self->_localizedAddress;
  if ((unint64_t)localizedAddress | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](localizedAddress, "isEqual:"))
      goto LABEL_12;
  }
  spokenNavigationAddress = self->_spokenNavigationAddress;
  if ((unint64_t)spokenNavigationAddress | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](spokenNavigationAddress, "isEqual:"))
      goto LABEL_12;
  }
  spokenStructuredAddress = self->_spokenStructuredAddress;
  if ((unint64_t)spokenStructuredAddress | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](spokenStructuredAddress, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 64) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) != 0 && self->_knownAccuracy == *((_DWORD *)v4 + 15))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPDAddress readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_localizedAddress, "hash");
  v4 = -[NSMutableArray hash](self->_spokenNavigationAddress, "hash");
  v5 = -[NSMutableArray hash](self->_spokenStructuredAddress, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_knownAccuracy;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenStructuredAddress, 0);
  objc_storeStrong((id *)&self->_spokenNavigationAddress, 0);
  objc_storeStrong((id *)&self->_localizedAddress, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
