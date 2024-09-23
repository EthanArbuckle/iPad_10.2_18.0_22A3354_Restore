@implementation GEOPDResultSnippet

- (GEOPDResultSnippet)init
{
  GEOPDResultSnippet *v2;
  GEOPDResultSnippet *v3;
  GEOPDResultSnippet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultSnippet;
  v2 = -[GEOPDResultSnippet init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceRange, 0);
  objc_storeStrong((id *)&self->_priceDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_childPlaces, 0);
  objc_storeStrong((id *)&self->_childItems, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t v6;
  __int16 flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  os_unfair_lock_s *v19;
  uint64_t v20;
  os_unfair_lock_s *v21;
  char IsDirty;
  id v23;
  void *v24;
  NSMutableArray *obj;
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
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  v6 = 8;
  if (self->_reader
    && (os_unfair_lock_assert_owner(&self->_readerLock), flags = (__int16)self->_flags, (flags & 0x3FC) == 0))
  {
    if ((flags & 8) != 0)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      obj = self->_childItems;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v35 != v17)
              objc_enumerationMutation(obj);
            v19 = p_readerLock;
            v20 = v6;
            v21 = *(os_unfair_lock_s **)(*((_QWORD *)&v34 + 1) + 8 * i);
            if (v21)
            {
              os_unfair_lock_lock_with_options();
              IsDirty = _GEOPDChildItemIsDirty((uint64_t)v21);
              os_unfair_lock_unlock(v21 + 12);
              if ((IsDirty & 1) != 0)
              {

                p_readerLock = v19;
                goto LABEL_3;
              }
            }
            v6 = v20;
            p_readerLock = v19;
          }
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
          if (v16)
            continue;
          break;
        }
      }

    }
    v23 = *(id *)((char *)&self->super.super.isa + v6);
    objc_sync_enter(v23);
    *(_QWORD *)(*(char **)((char *)&self->super.super.isa + v6) + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v6), "seekToOffset:", self->_readerMarkPos);
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v6), "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v24);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v23);
  }
  else
  {
LABEL_3:
    os_unfair_lock_unlock(p_readerLock);
    -[GEOPDResultSnippet readAll:]((uint64_t)self, 0);
    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_category)
      PBDataWriterWriteStringField();
    if (self->_priceRange)
      PBDataWriterWriteSubmessage();
    if (self->_locationString)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = self->_childPlaces;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v8);
          PBDataWriterWriteSubmessage();
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v9);
    }

    if (self->_priceDescription)
      PBDataWriterWriteSubmessage();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = self->_childItems;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v27;
      do
      {
        for (k = 0; k != v13; ++k)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v12);
          PBDataWriterWriteSubmessage();
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      }
      while (v13);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
  }

}

+ (id)resultSnippetForPlaceData:(id)a3
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
  v6[2] = __65__GEOPDResultSnippet_PlaceDataExtras__resultSnippetForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 30, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__GEOPDResultSnippet_PlaceDataExtras__resultSnippetForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue resultSnippet](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = a1;
  -[GEOPDResultSnippet _readChildItems](a1);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = *(id *)(v3 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    v20 = v3;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v8);
      if (v9)
      {
        -[GEOPDChildItem _readChildAction](*(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v8));
        v10 = *(_QWORD *)(v9 + 24);
        if (v10)
        {
          -[GEOPDChildAction _readChildActionGuides](*(_QWORD *)(v9 + 24));
          v11 = *(_QWORD *)(v10 + 48);
          if (v11)
          {
            if ((-[GEOPDGuidesLocationEntry hasGreenTeaWithValue:](*(_QWORD *)(v11 + 16), a2) & 1) != 0)
              goto LABEL_25;
          }
        }
        -[GEOPDChildItem _readChildPlace](v9);
        v12 = *(_QWORD *)(v9 + 32);
        if (v12)
        {
          -[GEOPDChildPlace _readMapsId](v12);
          if ((objc_msgSend(*(id *)(v12 + 24), "hasGreenTeaWithValue:", a2) & 1) != 0)
            goto LABEL_25;
        }
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        v3 = v20;
        if (v6)
          goto LABEL_4;
        break;
      }
    }
  }

  -[GEOPDResultSnippet _readChildPlaces](v3);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(id *)(v3 + 40);
  v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
LABEL_17:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v15)
        objc_enumerationMutation(v4);
      v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
      if (v17)
      {
        -[GEOPDChildPlace _readMapsId](*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16));
        if ((objc_msgSend(*(id *)(v17 + 24), "hasGreenTeaWithValue:", a2) & 1) != 0)
          break;
      }
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
          goto LABEL_17;
        goto LABEL_24;
      }
    }
LABEL_25:
    v18 = 1;
    goto LABEL_26;
  }
LABEL_24:
  v18 = 0;
LABEL_26:

  return v18;
}

- (GEOPDResultSnippet)initWithData:(id)a3
{
  GEOPDResultSnippet *v3;
  GEOPDResultSnippet *v4;
  GEOPDResultSnippet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultSnippet;
  v3 = -[GEOPDResultSnippet initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_6200);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)name
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultSnippet _readName]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_readCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategory_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)category
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultSnippet _readCategory]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readPriceRange
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPriceRange_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)priceRange
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultSnippet _readPriceRange]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)_readLocationString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)locationString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultSnippet _readLocationString]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readChildPlaces
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChildPlaces_tags_6201);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)childPlaces
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultSnippet _readChildPlaces]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)addChildPlace:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDResultSnippet _readChildPlaces](a1);
    -[GEOPDResultSnippet _addNoFlagsChildPlace:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsChildPlace:(uint64_t)a1
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

- (void)_readChildItems
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChildItems_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)childItems
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultSnippet _readChildItems]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addChildItem:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDResultSnippet _readChildItems](a1);
    -[GEOPDResultSnippet _addNoFlagsChildItem:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsChildItem:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultSnippet;
  -[GEOPDResultSnippet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultSnippet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultSnippet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDResultSnippet readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultSnippet name]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("name"));

  -[GEOPDResultSnippet category]((id *)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("category"));

  -[GEOPDResultSnippet priceRange]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("priceRange");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("price_range");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  -[GEOPDResultSnippet locationString]((id *)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("locationString");
    else
      v12 = CFSTR("location_string");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  if ((*(_WORD *)(a1 + 96) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("distanceDisplayThreshold");
    else
      v14 = CFSTR("distance_display_threshold");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v16 = *(id *)(a1 + 40);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("childPlace");
    else
      v22 = CFSTR("child_place");
    objc_msgSend(v4, "setObject:forKey:", v15, v22);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
  {
    v23 = *(void **)(a1 + 8);
    if (v23)
    {
      v24 = v23;
      objc_sync_enter(v24);
      GEOPDResultSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPriceDescription_tags);
      objc_sync_exit(v24);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v25 = *(id *)(a1 + 64);
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("priceDescription");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("price_description");
    }
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v30 = *(id *)(a1 + 32);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v47 != v32)
            objc_enumerationMutation(v30);
          v34 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v34, "jsonRepresentation");
          else
            objc_msgSend(v34, "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v31);
    }

    if (a2)
      v36 = CFSTR("childItem");
    else
      v36 = CFSTR("child_item");
    objc_msgSend(v4, "setObject:forKey:", v29, v36);

  }
  v37 = *(void **)(a1 + 16);
  if (v37)
  {
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __48__GEOPDResultSnippet__dictionaryRepresentation___block_invoke;
      v44[3] = &unk_1E1C00600;
      v41 = v40;
      v45 = v41;
      objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v44);
      v42 = v41;

    }
    else
    {
      v42 = v38;
    }
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultSnippet _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_6217;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6218;
      GEOPDResultSnippetReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDResultSnippetCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __48__GEOPDResultSnippet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDResultSnippetReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  PBUnknownFields *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
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
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDResultSnippetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultSnippet readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v11 = -[NSString copyWithZone:](self->_category, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[GEOPDRating copyWithZone:](self->_priceRange, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v13;

  v15 = -[NSString copyWithZone:](self->_locationString, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_distanceDisplayThreshold;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = self->_childPlaces;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDResultSnippet addChildPlace:](v5, v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v18);
  }

  v22 = -[GEOPDPriceDescription copyWithZone:](self->_priceDescription, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v22;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = self->_childItems;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v24);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v31);
        -[GEOPDResultSnippet addChildItem:](v5, v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v25);
  }

  v29 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v29;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *category;
  GEOPDRating *priceRange;
  NSString *locationString;
  __int16 v9;
  NSMutableArray *childPlaces;
  GEOPDPriceDescription *priceDescription;
  NSMutableArray *childItems;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOPDResultSnippet readAll:]((uint64_t)self, 1);
  -[GEOPDResultSnippet readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_21;
  }
  category = self->_category;
  if ((unint64_t)category | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](category, "isEqual:"))
      goto LABEL_21;
  }
  priceRange = self->_priceRange;
  if ((unint64_t)priceRange | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDRating isEqual:](priceRange, "isEqual:"))
      goto LABEL_21;
  }
  locationString = self->_locationString;
  if ((unint64_t)locationString | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](locationString, "isEqual:"))
      goto LABEL_21;
  }
  v9 = *((_WORD *)v4 + 48);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_distanceDisplayThreshold != *((_DWORD *)v4 + 23))
      goto LABEL_21;
  }
  else if ((v9 & 1) != 0)
  {
LABEL_21:
    v13 = 0;
    goto LABEL_22;
  }
  childPlaces = self->_childPlaces;
  if ((unint64_t)childPlaces | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](childPlaces, "isEqual:"))
  {
    goto LABEL_21;
  }
  priceDescription = self->_priceDescription;
  if ((unint64_t)priceDescription | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDPriceDescription isEqual:](priceDescription, "isEqual:"))
      goto LABEL_21;
  }
  childItems = self->_childItems;
  if ((unint64_t)childItems | *((_QWORD *)v4 + 4))
    v13 = -[NSMutableArray isEqual:](childItems, "isEqual:");
  else
    v13 = 1;
LABEL_22:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;

  -[GEOPDResultSnippet readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_category, "hash");
  v5 = -[GEOPDRating hash](self->_priceRange, "hash");
  v6 = -[NSString hash](self->_locationString, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_distanceDisplayThreshold;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSMutableArray hash](self->_childPlaces, "hash");
  v10 = v8 ^ v9 ^ -[GEOPDPriceDescription hash](self->_priceDescription, "hash");
  return v10 ^ -[NSMutableArray hash](self->_childItems, "hash");
}

@end
