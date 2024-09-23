@implementation GEOPDPublisher

- (id)publisherDescription
{
  void *v2;
  void *v3;

  -[GEOPDPublisher publisherDescriptions]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    -[GEOPDPublisher _readCollectionIds](result);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = *(id *)(v3 + 24);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "hasGreenTeaWithValue:", a2, (_QWORD)v9) & 1) != 0)
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          continue;
        break;
      }
    }

    -[GEOPDPublisher _readPublisherId](v3);
    return objc_msgSend(*(id *)(v3 + 56), "hasGreenTeaWithValue:", a2);
  }
  return result;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 4u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDPublisher readAll:](a1, 0);
    objc_msgSend(*(id *)(a1 + 56), "clearUnknownFields:", 1);
    -[GEOPDCaptionedPhoto clearUnknownFields:](*(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "clearUnknownFields:", 1);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = *(id *)(a1 + 24);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "clearUnknownFields:", 1);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v5);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = *(id *)(a1 + 48);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "clearUnknownFields:", 1, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }

  }
}

- (GEOPDPublisher)init
{
  GEOPDPublisher *v2;
  GEOPDPublisher *v3;
  GEOPDPublisher *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPublisher;
  v2 = -[GEOPDPublisher init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPublisher)initWithData:(id)a3
{
  GEOPDPublisher *v3;
  GEOPDPublisher *v4;
  GEOPDPublisher *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPublisher;
  v3 = -[GEOPDPublisher initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPublisherId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPublisherReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherId_tags_5942);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)publisherId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPublisher _readPublisherId]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)setPublisherId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 84) |= 0x80u;
  *(_WORD *)(a1 + 84) |= 0x100u;
  objc_storeStrong((id *)(a1 + 56), a2);

}

- (void)setPhoto:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 84) |= 0x20u;
  *(_WORD *)(a1 + 84) |= 0x100u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)setName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 84) |= 0x10u;
  *(_WORD *)(a1 + 84) |= 0x100u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)_readCollectionIds
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDPublisherReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionIds_tags_0);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)addCollectionId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPublisher _readCollectionIds](a1);
    -[GEOPDPublisher _addNoFlagsCollectionId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_WORD *)(a1 + 84) |= 0x100u;
  }
}

- (void)_addNoFlagsCollectionId:(uint64_t)a1
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

- (void)_readPublisherDescriptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPublisherReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherDescriptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)publisherDescriptions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPublisher _readPublisherDescriptions]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)addPublisherDescription:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPublisher _readPublisherDescriptions](a1);
    -[GEOPDPublisher _addNoFlagsPublisherDescription:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_WORD *)(a1 + 84) |= 0x100u;
  }
}

- (void)_addNoFlagsPublisherDescription:(uint64_t)a1
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

- (uint64_t)errorState
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 84);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 76);
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
  v8.super_class = (Class)GEOPDPublisher;
  -[GEOPDPublisher description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPublisher dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPublisher _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
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
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDPublisher readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPublisher publisherId]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("publisherId");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("publisher_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPDPublisherReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoto_tags_5943);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v11 = *(id *)(a1 + 40);
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("photo"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
  {
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = v14;
      objc_sync_enter(v15);
      GEOPDPublisherReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_5944);
      objc_sync_exit(v15);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v16 = *(id *)(a1 + 32);
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v16, "jsonRepresentation");
    else
      objc_msgSend(v16, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("name"));

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v20 = *(id *)(a1 + 24);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v54 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v24, "jsonRepresentation");
          else
            objc_msgSend(v24, "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v21);
    }

    if (a2)
      v26 = CFSTR("collectionId");
    else
      v26 = CFSTR("collection_id");
    objc_msgSend(v4, "setObject:forKey:", v19, v26);

  }
  if ((*(_WORD *)(a1 + 84) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("numCollections");
    else
      v28 = CFSTR("num_collections");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v30 = *(id *)(a1 + 48);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v50 != v32)
            objc_enumerationMutation(v30);
          v34 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v34, "jsonRepresentation");
          else
            objc_msgSend(v34, "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v31);
    }

    if (a2)
      v36 = CFSTR("publisherDescription");
    else
      v36 = CFSTR("publisher_description");
    objc_msgSend(v4, "setObject:forKey:", v29, v36);

  }
  if ((*(_WORD *)(a1 + 84) & 1) != 0)
  {
    v37 = *(int *)(a1 + 76);
    if (v37 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E1C0C018[v37];
    }
    if (a2)
      v39 = CFSTR("errorState");
    else
      v39 = CFSTR("error_state");
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
      v47[2] = __44__GEOPDPublisher__dictionaryRepresentation___block_invoke;
      v47[3] = &unk_1E1C00600;
      v44 = v43;
      v48 = v44;
      objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v47);
      v45 = v44;

    }
    else
    {
      v45 = v41;
    }
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPublisher _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_5953;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5954;
      GEOPDPublisherReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDPublisherCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __44__GEOPDPublisher__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  GEOPDMapsIdentifier *v9;
  GEOPDMapsIdentifier *v10;
  GEOPDMapsIdentifier *v11;
  void *v12;
  GEOPDCaptionedPhoto *v13;
  void *v14;
  void *v15;
  GEOLocalizedString *v16;
  GEOLocalizedString *v17;
  GEOLocalizedString *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  GEOPDMapsIdentifier *v27;
  GEOPDMapsIdentifier *v28;
  GEOPDMapsIdentifier *v29;
  const __CFString *v30;
  void *v31;
  int v32;
  const __CFString *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  GEOLocalizedString *v41;
  GEOLocalizedString *v42;
  GEOLocalizedString *v43;
  const __CFString *v44;
  void *v45;
  id v46;
  int v47;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("publisherId");
    else
      v7 = CFSTR("publisher_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = [GEOPDMapsIdentifier alloc];
      if ((a3 & 1) != 0)
        v10 = -[GEOPDMapsIdentifier initWithJSON:](v9, "initWithJSON:", v8);
      else
        v10 = -[GEOPDMapsIdentifier initWithDictionary:](v9, "initWithDictionary:", v8);
      v11 = v10;
      -[GEOPDPublisher setPublisherId:](v6, v10);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = [GEOPDCaptionedPhoto alloc];
      if (v13)
        v14 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v13, v12, a3);
      else
        v14 = 0;
      -[GEOPDPublisher setPhoto:](v6, v14);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = [GEOLocalizedString alloc];
      if ((a3 & 1) != 0)
        v17 = -[GEOLocalizedString initWithJSON:](v16, "initWithJSON:", v15);
      else
        v17 = -[GEOLocalizedString initWithDictionary:](v16, "initWithDictionary:", v15);
      v18 = v17;
      -[GEOPDPublisher setName:](v6, v17);

    }
    if (a3)
      v19 = CFSTR("collectionId");
    else
      v19 = CFSTR("collection_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v49 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v21 = v20;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v55 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = [GEOPDMapsIdentifier alloc];
              if ((a3 & 1) != 0)
                v28 = -[GEOPDMapsIdentifier initWithJSON:](v27, "initWithJSON:", v26);
              else
                v28 = -[GEOPDMapsIdentifier initWithDictionary:](v27, "initWithDictionary:", v26);
              v29 = v28;
              -[GEOPDPublisher addCollectionId:](v6, v28);

            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        }
        while (v23);
      }

      v5 = v49;
    }

    if (a3)
      v30 = CFSTR("numCollections");
    else
      v30 = CFSTR("num_collections");
    objc_msgSend(v5, "objectForKeyedSubscript:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = objc_msgSend(v31, "unsignedIntValue");
      *(_WORD *)(v6 + 84) |= 0x100u;
      *(_WORD *)(v6 + 84) |= 2u;
      *(_DWORD *)(v6 + 80) = v32;
    }

    if (a3)
      v33 = CFSTR("publisherDescription");
    else
      v33 = CFSTR("publisher_description");
    objc_msgSend(v5, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v35 = v34;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v51 != v38)
              objc_enumerationMutation(v35);
            v40 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v41 = [GEOLocalizedString alloc];
              if ((a3 & 1) != 0)
                v42 = -[GEOLocalizedString initWithJSON:](v41, "initWithJSON:", v40);
              else
                v42 = -[GEOLocalizedString initWithDictionary:](v41, "initWithDictionary:", v40);
              v43 = v42;
              -[GEOPDPublisher addPublisherDescription:](v6, v42);

            }
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        }
        while (v37);
      }

      v5 = v49;
    }

    if (a3)
      v44 = CFSTR("errorState");
    else
      v44 = CFSTR("error_state");
    objc_msgSend(v5, "objectForKeyedSubscript:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = v45;
      if ((objc_msgSend(v46, "isEqualToString:", CFSTR("BROOKLYN_ERROR_STATE_UNKNOWN")) & 1) != 0)
      {
        v47 = 0;
      }
      else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("BROOKLYN_ERROR_STATE_SUPPRESSED")) & 1) != 0)
      {
        v47 = 1;
      }
      else if (objc_msgSend(v46, "isEqualToString:", CFSTR("BROOKLYN_ERROR_STATE_BLOCKED")))
      {
        v47 = 2;
      }
      else
      {
        v47 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_73:

        goto LABEL_74;
      }
      v47 = objc_msgSend(v45, "intValue");
    }
    *(_WORD *)(v6 + 84) |= 0x100u;
    *(_WORD *)(v6 + 84) |= 1u;
    *(_DWORD *)(v6 + 76) = v47;
    goto LABEL_73;
  }
LABEL_74:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPublisherReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  if (self->_reader && (_GEOPDPublisherIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDPublisher readAll:]((uint64_t)self, 0);
    if (self->_publisherId)
      PBDataWriterWriteSubmessage();
    if (self->_photo)
      PBDataWriterWriteSubmessage();
    if (self->_name)
      PBDataWriterWriteSubmessage();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_collectionIds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_publisherDescriptions;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
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
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  PBUnknownFields *v25;
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
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPublisherReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPublisher readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDMapsIdentifier copyWithZone:](self->_publisherId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v11 = -[GEOPDCaptionedPhoto copyWithZone:](self->_photo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[GEOLocalizedString copyWithZone:](self->_name, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = self->_collectionIds;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDPublisher addCollectionId:](v5, v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v16);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_numCollections;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self->_publisherDescriptions;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v27);
        -[GEOPDPublisher addPublisherDescription:](v5, v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v21);
  }

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_errorState;
    *(_WORD *)(v5 + 84) |= 1u;
  }
  v25 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v25;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDMapsIdentifier *publisherId;
  GEOPDCaptionedPhoto *photo;
  GEOLocalizedString *name;
  NSMutableArray *collectionIds;
  __int16 flags;
  __int16 v10;
  NSMutableArray *publisherDescriptions;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOPDPublisher readAll:]((uint64_t)self, 1);
  -[GEOPDPublisher readAll:]((uint64_t)v4, 1);
  publisherId = self->_publisherId;
  if ((unint64_t)publisherId | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](publisherId, "isEqual:"))
      goto LABEL_22;
  }
  photo = self->_photo;
  if ((unint64_t)photo | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDCaptionedPhoto isEqual:](photo, "isEqual:"))
      goto LABEL_22;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLocalizedString isEqual:](name, "isEqual:"))
      goto LABEL_22;
  }
  collectionIds = self->_collectionIds;
  if ((unint64_t)collectionIds | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](collectionIds, "isEqual:"))
      goto LABEL_22;
  }
  flags = (__int16)self->_flags;
  v10 = *((_WORD *)v4 + 42);
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_numCollections != *((_DWORD *)v4 + 20))
      goto LABEL_22;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_22;
  }
  publisherDescriptions = self->_publisherDescriptions;
  if ((unint64_t)publisherDescriptions | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](publisherDescriptions, "isEqual:"))
    {
LABEL_22:
      v12 = 0;
      goto LABEL_23;
    }
    flags = (__int16)self->_flags;
    v10 = *((_WORD *)v4 + 42);
  }
  v12 = (v10 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_errorState != *((_DWORD *)v4 + 19))
      goto LABEL_22;
    v12 = 1;
  }
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[GEOPDPublisher readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDMapsIdentifier hash](self->_publisherId, "hash");
  v4 = -[GEOPDCaptionedPhoto hash](self->_photo, "hash");
  v5 = -[GEOLocalizedString hash](self->_name, "hash");
  v6 = -[NSMutableArray hash](self->_collectionIds, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v7 = 2654435761 * self->_numCollections;
  else
    v7 = 0;
  v8 = -[NSMutableArray hash](self->_publisherDescriptions, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v9 = 2654435761 * self->_errorState;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherId, 0);
  objc_storeStrong((id *)&self->_publisherDescriptions, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
