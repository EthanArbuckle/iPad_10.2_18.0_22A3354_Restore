@implementation GEOPDGuidesHomeRepeatableSection

- (GEOPDGuidesHomeRepeatableSection)init
{
  GEOPDGuidesHomeRepeatableSection *v2;
  GEOPDGuidesHomeRepeatableSection *v3;
  GEOPDGuidesHomeRepeatableSection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesHomeRepeatableSection;
  v2 = -[GEOPDGuidesHomeRepeatableSection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesHomeRepeatableSection)initWithData:(id)a3
{
  GEOPDGuidesHomeRepeatableSection *v3;
  GEOPDGuidesHomeRepeatableSection *v4;
  GEOPDGuidesHomeRepeatableSection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesHomeRepeatableSection;
  v3 = -[GEOPDGuidesHomeRepeatableSection initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)sectionType
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

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeRepeatableSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_2452);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)name
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeRepeatableSection _readName]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readCarouselGuideIds
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
        GEOPDGuidesHomeRepeatableSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCarouselGuideIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)carouselGuideIds
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeRepeatableSection _readCarouselGuideIds]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addCarouselGuideId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDGuidesHomeRepeatableSection _readCarouselGuideIds](a1);
    -[GEOPDGuidesHomeRepeatableSection _addNoFlagsCarouselGuideId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 76) |= 0x80u;
  }
}

- (void)_addNoFlagsCarouselGuideId:(uint64_t)a1
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

- (void)_readPublisherIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeRepeatableSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherIds_tags_2453);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)publisherIds
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeRepeatableSection _readPublisherIds]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)addPublisherId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDGuidesHomeRepeatableSection _readPublisherIds](a1);
    -[GEOPDGuidesHomeRepeatableSection _addNoFlagsPublisherId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 76) |= 0x80u;
  }
}

- (void)_addNoFlagsPublisherId:(uint64_t)a1
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

- (void)_readGuidesLocationEntrys
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
        GEOPDGuidesHomeRepeatableSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidesLocationEntrys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)guidesLocationEntrys
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesHomeRepeatableSection _readGuidesLocationEntrys]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addGuidesLocationEntry:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDGuidesHomeRepeatableSection _readGuidesLocationEntrys](a1);
    -[GEOPDGuidesHomeRepeatableSection _addNoFlagsGuidesLocationEntry:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 76) |= 0x80u;
  }
}

- (void)_addNoFlagsGuidesLocationEntry:(uint64_t)a1
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

- (uint64_t)contentType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 68);
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
  v8.super_class = (Class)GEOPDGuidesHomeRepeatableSection;
  -[GEOPDGuidesHomeRepeatableSection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGuidesHomeRepeatableSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesHomeRepeatableSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  __CFString *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDGuidesHomeRepeatableSection readAll:](a1, 1);
  v4 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 76) & 2) != 0)
  {
    v6 = *(int *)(a1 + 72);
    if (v6 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 72));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C04AC0[v6];
    }
    if (a2)
      v8 = CFSTR("sectionType");
    else
      v8 = CFSTR("section_type");
    objc_msgSend(v5, "setObject:forKey:", v7, v8);

  }
  -[GEOPDGuidesHomeRepeatableSection name]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("name"));

  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v11 = *(id *)(a1 + 24);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v58 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      }
      while (v13);
    }

    if (a2)
      v18 = CFSTR("carouselGuideId");
    else
      v18 = CFSTR("carousel_guide_id");
    objc_msgSend(v5, "setObject:forKey:", v10, v18);

    v4 = 0x1E0C99000;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v20 = *(id *)(a1 + 48);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v54 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v25, "jsonRepresentation");
          else
            objc_msgSend(v25, "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v26);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v22);
    }

    if (a2)
      v27 = CFSTR("publisherId");
    else
      v27 = CFSTR("publisher_id");
    objc_msgSend(v5, "setObject:forKey:", v19, v27);

    v4 = 0x1E0C99000uLL;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v29 = *(id *)(a1 + 32);
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v50;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v50 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v34, "jsonRepresentation");
          else
            objc_msgSend(v34, "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v35);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      }
      while (v31);
    }

    if (a2)
      v36 = CFSTR("guidesLocationEntry");
    else
      v36 = CFSTR("guides_location_entry");
    objc_msgSend(v5, "setObject:forKey:", v28, v36);

  }
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    v37 = *(int *)(a1 + 68);
    if (v37 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E1C04AE8[v37];
    }
    if (a2)
      v39 = CFSTR("contentType");
    else
      v39 = CFSTR("content_type");
    objc_msgSend(v5, "setObject:forKey:", v38, v39);

  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (a2)
    {
      objc_msgSend(*(id *)(v4 + 3592), "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __62__GEOPDGuidesHomeRepeatableSection__dictionaryRepresentation___block_invoke;
      v47[3] = &unk_1E1C00600;
      v44 = v43;
      v48 = v44;
      objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v47);
      v45 = v44;

      v42 = v45;
    }
    objc_msgSend(v5, "setObject:forKey:", v42, CFSTR("Unknown Fields"));

  }
  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDGuidesHomeRepeatableSection _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_2458;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2459;
      GEOPDGuidesHomeRepeatableSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDGuidesHomeRepeatableSectionCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __62__GEOPDGuidesHomeRepeatableSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDGuidesHomeRepeatableSectionReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 7u))
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGuidesHomeRepeatableSection readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_name)
      PBDataWriterWriteStringField();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_carouselGuideIds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_publisherIds;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_guidesLocationEntrys;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v15);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  PBUnknownFields *v26;
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
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDGuidesHomeRepeatableSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_31;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGuidesHomeRepeatableSection readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_sectionType;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = self->_carouselGuideIds;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDGuidesHomeRepeatableSection addCarouselGuideId:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v12);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = self->_publisherIds;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDGuidesHomeRepeatableSection addPublisherId:](v5, v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v17);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = self->_guidesLocationEntrys;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v28);
        -[GEOPDGuidesHomeRepeatableSection addGuidesLocationEntry:](v5, v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v22);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_contentType;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v26 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v26;
LABEL_31:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSMutableArray *carouselGuideIds;
  NSMutableArray *publisherIds;
  NSMutableArray *guidesLocationEntrys;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOPDGuidesHomeRepeatableSection readAll:]((uint64_t)self, 1);
  -[GEOPDGuidesHomeRepeatableSection readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_sectionType != *((_DWORD *)v4 + 18))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_19;
  carouselGuideIds = self->_carouselGuideIds;
  if ((unint64_t)carouselGuideIds | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](carouselGuideIds, "isEqual:"))
      goto LABEL_19;
  }
  publisherIds = self->_publisherIds;
  if ((unint64_t)publisherIds | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](publisherIds, "isEqual:"))
      goto LABEL_19;
  }
  guidesLocationEntrys = self->_guidesLocationEntrys;
  if ((unint64_t)guidesLocationEntrys | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](guidesLocationEntrys, "isEqual:"))
      goto LABEL_19;
  }
  v9 = (*((_BYTE *)v4 + 76) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_contentType != *((_DWORD *)v4 + 17))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOPDGuidesHomeRepeatableSection readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_sectionType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash");
  v5 = -[NSMutableArray hash](self->_carouselGuideIds, "hash");
  v6 = -[NSMutableArray hash](self->_publisherIds, "hash");
  v7 = -[NSMutableArray hash](self->_guidesLocationEntrys, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v8 = 2654435761 * self->_contentType;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherIds, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guidesLocationEntrys, 0);
  objc_storeStrong((id *)&self->_carouselGuideIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
