@implementation GEOPDGuidesHomeResult

- (GEOPDGuidesHomeResult)init
{
  GEOPDGuidesHomeResult *v2;
  GEOPDGuidesHomeResult *v3;
  GEOPDGuidesHomeResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesHomeResult;
  v2 = -[GEOPDGuidesHomeResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesHomeResult)initWithData:(id)a3
{
  GEOPDGuidesHomeResult *v3;
  GEOPDGuidesHomeResult *v4;
  GEOPDGuidesHomeResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesHomeResult;
  v3 = -[GEOPDGuidesHomeResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readFeaturedGuides
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeaturedGuides_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)featuredGuides
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeResult _readFeaturedGuides]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setFeaturedGuides:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 2u;
  *(_BYTE *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFilters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)filters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeResult _readFilters]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setFilters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 8u;
  *(_BYTE *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)_readFilteredGuides
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFilteredGuides_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)filteredGuides
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeResult _readFilteredGuides]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setFilteredGuides:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 4u;
  *(_BYTE *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)_readRepeatableSections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRepeatableSections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)repeatableSections
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeResult _readRepeatableSections]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)addRepeatableSection:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDGuidesHomeResult _readRepeatableSections](a1);
    -[GEOPDGuidesHomeResult _addNoFlagsRepeatableSection:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsRepeatableSection:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
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
  v8.super_class = (Class)GEOPDGuidesHomeResult;
  -[GEOPDGuidesHomeResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGuidesHomeResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesHomeResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDGuidesHomeResult readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGuidesHomeResult featuredGuides]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("featuredGuides");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("featured_guides");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  -[GEOPDGuidesHomeResult filters]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("filters"));

  }
  -[GEOPDGuidesHomeResult filteredGuides]((id *)a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("filteredGuides");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("filtered_guides");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v17 = *(id *)(a1 + 48);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v19);
    }

    if (a2)
      v24 = CFSTR("repeatableSection");
    else
      v24 = CFSTR("repeatable_section");
    objc_msgSend(v4, "setObject:forKey:", v16, v24);

  }
  v25 = *(void **)(a1 + 16);
  if (v25)
  {
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __51__GEOPDGuidesHomeResult__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E1C00600;
      v29 = v28;
      v33 = v29;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v32);
      v30 = v29;

      v27 = v30;
    }
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDGuidesHomeResult _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_2485;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2486;
      GEOPDGuidesHomeResultReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDGuidesHomeResultCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __51__GEOPDGuidesHomeResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDGuidesHomeResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDGuidesHomeResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGuidesHomeResult readAll:]((uint64_t)self, 0);
    if (self->_featuredGuides)
      PBDataWriterWriteSubmessage();
    if (self->_filters)
      PBDataWriterWriteSubmessage();
    if (self->_filteredGuides)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_repeatableSections;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
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
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDGuidesHomeResult _readFeaturedGuides](a1);
  if ((-[GEOPDGuidesHomeFixedSection hasGreenTeaWithValue:](*(_QWORD *)(a1 + 24), a2) & 1) != 0)
    return 1;
  -[GEOPDGuidesHomeResult _readFilteredGuides](a1);
  if ((-[GEOPDGuidesHomeFixedSection hasGreenTeaWithValue:](*(_QWORD *)(a1 + 32), a2) & 1) != 0)
    return 1;
  -[GEOPDGuidesHomeResult _readFilters](a1);
  if ((-[GEOPDGuidesHomeFixedSection hasGreenTeaWithValue:](*(_QWORD *)(a1 + 40), a2) & 1) != 0)
    return 1;
  -[GEOPDGuidesHomeResult _readRepeatableSections](a1);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = *(id *)(a1 + 48);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (!v7)
  {
    v4 = 0;
    goto LABEL_43;
  }
  v8 = v7;
  v9 = *(_QWORD *)v27;
  v10 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(v6);
      v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
      if (v12)
      {
        -[GEOPDGuidesHomeRepeatableSection _readCarouselGuideIds](*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v13 = *(id *)(v12 + v10[322]);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v45, 16, (_QWORD)v26);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v39;
LABEL_15:
          v17 = 0;
          while (1)
          {
            if (*(_QWORD *)v39 != v16)
              objc_enumerationMutation(v13);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v17), "hasGreenTeaWithValue:", a2) & 1) != 0)
              goto LABEL_41;
            if (v15 == ++v17)
            {
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
              if (v15)
                goto LABEL_15;
              break;
            }
          }
        }

        -[GEOPDGuidesHomeRepeatableSection _readGuidesLocationEntrys](v12);
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v13 = *(id *)(v12 + 32);
        v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v35;
LABEL_23:
          v21 = 0;
          while (1)
          {
            if (*(_QWORD *)v35 != v20)
              objc_enumerationMutation(v13);
            if ((-[GEOPDGuidesLocationEntry hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v21), a2) & 1) != 0)
              goto LABEL_41;
            if (v19 == ++v21)
            {
              v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
              if (v19)
                goto LABEL_23;
              break;
            }
          }
        }

        -[GEOPDGuidesHomeRepeatableSection _readPublisherIds](v12);
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v13 = *(id *)(v12 + 48);
        v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v31;
LABEL_31:
          v25 = 0;
          while (1)
          {
            if (*(_QWORD *)v31 != v24)
              objc_enumerationMutation(v13);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v25), "hasGreenTeaWithValue:", a2) & 1) != 0)
              break;
            if (v23 == ++v25)
            {
              v23 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
              if (v23)
                goto LABEL_31;
              goto LABEL_37;
            }
          }
LABEL_41:

          v4 = 1;
          goto LABEL_43;
        }
LABEL_37:

      }
      v10 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    v4 = 0;
    if (v8)
      continue;
    break;
  }
LABEL_43:

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
      GEOPDGuidesHomeResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGuidesHomeResult readAll:]((uint64_t)self, 0);
  v8 = -[GEOPDGuidesHomeFixedSection copyWithZone:](self->_featuredGuides, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[GEOPDGuidesHomeFixedSection copyWithZone:](self->_filters, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[GEOPDGuidesHomeFixedSection copyWithZone:](self->_filteredGuides, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_repeatableSections;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (_QWORD)v20);
        -[GEOPDGuidesHomeResult addRepeatableSection:](v5, v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDGuidesHomeFixedSection *featuredGuides;
  GEOPDGuidesHomeFixedSection *filters;
  GEOPDGuidesHomeFixedSection *filteredGuides;
  NSMutableArray *repeatableSections;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDGuidesHomeResult readAll:]((uint64_t)self, 1),
         -[GEOPDGuidesHomeResult readAll:]((uint64_t)v4, 1),
         featuredGuides = self->_featuredGuides,
         !((unint64_t)featuredGuides | v4[3]))
     || -[GEOPDGuidesHomeFixedSection isEqual:](featuredGuides, "isEqual:"))
    && ((filters = self->_filters, !((unint64_t)filters | v4[5]))
     || -[GEOPDGuidesHomeFixedSection isEqual:](filters, "isEqual:"))
    && ((filteredGuides = self->_filteredGuides, !((unint64_t)filteredGuides | v4[4]))
     || -[GEOPDGuidesHomeFixedSection isEqual:](filteredGuides, "isEqual:")))
  {
    repeatableSections = self->_repeatableSections;
    if ((unint64_t)repeatableSections | v4[6])
      v9 = -[NSMutableArray isEqual:](repeatableSections, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[GEOPDGuidesHomeResult readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDGuidesHomeFixedSection hash](self->_featuredGuides, "hash");
  v4 = -[GEOPDGuidesHomeFixedSection hash](self->_filters, "hash") ^ v3;
  v5 = -[GEOPDGuidesHomeFixedSection hash](self->_filteredGuides, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_repeatableSections, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatableSections, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_filteredGuides, 0);
  objc_storeStrong((id *)&self->_featuredGuides, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
