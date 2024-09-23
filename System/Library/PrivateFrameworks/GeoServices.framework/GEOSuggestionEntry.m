@implementation GEOSuggestionEntry

- (GEOSuggestionEntry)init
{
  GEOSuggestionEntry *v2;
  GEOSuggestionEntry *v3;
  GEOSuggestionEntry *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSuggestionEntry;
  v2 = -[GEOSuggestionEntry init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSuggestionEntry)initWithData:(id)a3
{
  GEOSuggestionEntry *v3;
  GEOSuggestionEntry *v4;
  GEOSuggestionEntry *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSuggestionEntry;
  v3 = -[GEOSuggestionEntry initWithData:](&v7, sel_initWithData_, a3);
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

  if (self)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)&self->_flags |= 2u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(_WORD *)&self->_flags |= 0x200u;
    self->_textHighlightsSpace = 0;
    self->_textHighlightsCount = 0;
    free(self->_textHighlights);
    self->_textHighlights = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOSuggestionEntry;
  -[GEOSuggestionEntry dealloc](&v3, sel_dealloc);
}

- (void)_readDisplayLines
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_WORD *)(a1 + 116) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOSuggestionEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayLines_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
}

- (void)addDisplayLine:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOSuggestionEntry _readDisplayLines](a1);
    -[GEOSuggestionEntry _addNoFlagsDisplayLine:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x200u;
  }
}

- (void)_addNoFlagsDisplayLine:(uint64_t)a1
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

- (uint64_t)_reserveTextHighlights:(uint64_t)result
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (result)
  {
    v2 = (_QWORD *)result;
    v3 = *(_QWORD *)(result + 32);
    v4 = v3 + a2;
    if (v3 + a2 <= v3)
      return 0;
    v5 = *(_QWORD *)(result + 40);
    if (v5 >= v4)
      return 1;
    v6 = v5 + a2;
    if (v5 + a2)
    {
      v7 = 1;
      while (1)
      {
        v8 = v7;
        if (v7 >= v6)
          break;
        v7 *= 2;
        if ((v8 & 0x8000000000000000) != 0)
        {
          v8 = -1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    if (v8 < a2)
      return 0;
LABEL_11:
    if (16 * v8 < v8)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 24), 16 * v8, 0x810F3F03uLL);
    if (result)
    {
      v2[5] = v8;
      v2[3] = result;
      bzero((void *)(result + 16 * v2[4]), 16 * (v8 - v2[4]));
      return 1;
    }
  }
  return result;
}

- (void)_readLatlng
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOSuggestionEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLatlng_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
}

- (void)addNamedFeature:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOSuggestionEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNamedFeatures_tags_2813);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    -[GEOSuggestionEntry _addNoFlagsNamedFeature:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x200u;
  }
}

- (void)_addNoFlagsNamedFeature:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
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
  v8.super_class = (Class)GEOSuggestionEntry;
  -[GEOSuggestionEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSuggestionEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSuggestionEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  id v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, void *, void *);
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOSuggestionEntry readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 56))
  {
    -[GEOSuggestionEntry _readDisplayLines](a1);
    v4 = *(id *)(a1 + 56);
    objc_msgSend(v46, "setObject:forKey:", v4, CFSTR("displayLine"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v8 = *(_QWORD *)(a1 + 24);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v46);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8 + v6;
        v11 = *(_BYTE *)(v8 + v6 + 12);
        if ((v11 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v8 + v6));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("length"));

          v11 = *(_BYTE *)(v10 + 12);
        }
        if ((v11 & 2) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v8 + v6 + 4));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("lineNumber"));

          v11 = *(_BYTE *)(v10 + 12);
        }
        if ((v11 & 4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v8 + v6 + 8));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("startIndex"));

        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 += 16;
      }
      while (v7 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v46, "setObject:forKey:", v5, CFSTR("textHighlights"), v46);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_WORD *)(a1 + 116) & 0x10) == 0)
  {
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = v15;
      objc_sync_enter(v16);
      GEOSuggestionEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIconID_tags);
      objc_sync_exit(v16);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  v17 = *(id *)(a1 + 64);
  if (v17)
    objc_msgSend(v46, "setObject:forKey:", v17, CFSTR("iconID"));

  -[GEOSuggestionEntry _readLatlng](a1);
  v18 = *(id *)(a1 + 72);
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v18, "jsonRepresentation");
    else
      objc_msgSend(v18, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKey:", v20, CFSTR("latlng"), v46);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
  {
    v21 = *(void **)(a1 + 8);
    if (v21)
    {
      v22 = v21;
      objc_sync_enter(v22);
      GEOSuggestionEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_2);
      objc_sync_exit(v22);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  v23 = *(id *)(a1 + 96);
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "base64EncodedStringWithOptions:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setObject:forKey:", v25, CFSTR("suggestionEntryMetadata"));

    }
    else
    {
      objc_msgSend(v46, "setObject:forKey:", v23, CFSTR("suggestionEntryMetadata"));
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
  {
    v26 = *(void **)(a1 + 8);
    if (v26)
    {
      v27 = v26;
      objc_sync_enter(v27);
      GEOSuggestionEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchQueryDisplayString_tags);
      objc_sync_exit(v27);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  v28 = *(id *)(a1 + 88);
  if (v28)
    objc_msgSend(v46, "setObject:forKey:", v28, CFSTR("searchQueryDisplayString"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_WORD *)(a1 + 116) & 4) == 0)
  {
    v29 = *(void **)(a1 + 8);
    if (v29)
    {
      v30 = v29;
      objc_sync_enter(v30);
      GEOSuggestionEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCalloutTitle_tags);
      objc_sync_exit(v30);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  v31 = *(id *)(a1 + 48);
  if (v31)
    objc_msgSend(v46, "setObject:forKey:", v31, CFSTR("calloutTitle"));

  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v33 = *(id *)(a1 + 80);
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v53 != v35)
            objc_enumerationMutation(v33);
          v37 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v37, "jsonRepresentation");
          else
            objc_msgSend(v37, "dictionaryRepresentation");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v38, v46);

        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v34);
    }

    objc_msgSend(v46, "setObject:forKey:", v32, CFSTR("namedFeature"));
  }
  v39 = *(void **)(a1 + 16);
  if (v39)
  {
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v40, "count"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = MEMORY[0x1E0C809B0];
      v48 = 3221225472;
      v49 = __48__GEOSuggestionEntry__dictionaryRepresentation___block_invoke;
      v50 = &unk_1E1C00600;
      v43 = v42;
      v51 = v43;
      objc_msgSend(v41, "enumerateKeysAndObjectsUsingBlock:", &v47);
      v44 = v43;

    }
    else
    {
      v44 = v40;
    }
    objc_msgSend(v46, "setObject:forKey:", v44, CFSTR("Unknown Fields"), v46, v47, v48, v49, v50);

  }
  return v46;
}

- (id)jsonRepresentation
{
  return -[GEOSuggestionEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2828_1;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2829_1;
      GEOSuggestionEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOSuggestionEntryCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

void __48__GEOSuggestionEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOSuggestionEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  unint64_t v11;
  GEOHighlight *v12;
  char var3;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3FE) == 0))
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
    -[GEOSuggestionEntry readAll:]((uint64_t)self, 0);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = self->_displayLines;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v7);
    }

    if (self->_textHighlightsCount)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v24 = 0;
        PBDataWriterPlaceMark();
        v12 = &self->_textHighlights[v10];
        var3 = (char)v12->var3;
        if ((var3 & 2) != 0)
        {
          PBDataWriterWriteUint32Field();
          var3 = (char)v12->var3;
        }
        if ((var3 & 4) != 0)
        {
          PBDataWriterWriteUint32Field();
          var3 = (char)v12->var3;
        }
        if ((var3 & 1) != 0)
          PBDataWriterWriteUint32Field();
        PBDataWriterRecallMark();
        ++v11;
        ++v10;
      }
      while (v11 < self->_textHighlightsCount);
    }
    if (self->_iconID)
      PBDataWriterWriteStringField();
    if (self->_latlng)
      PBDataWriterWriteSubmessage();
    if (self->_suggestionEntryMetadata)
      PBDataWriterWriteDataField();
    if (self->_searchQueryDisplayString)
      PBDataWriterWriteStringField();
    if (self->_calloutTitle)
      PBDataWriterWriteStringField();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_namedFeatures;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
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
  unint64_t textHighlightsCount;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
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
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
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
      GEOSuggestionEntryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSuggestionEntry readAll:]((uint64_t)self, 0);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = self->_displayLines;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOSuggestionEntry addDisplayLine:](v5, v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v9);
  }

  textHighlightsCount = self->_textHighlightsCount;
  if (textHighlightsCount)
  {
    -[GEOSuggestionEntry _reserveTextHighlights:](v5, textHighlightsCount);
    memcpy(*(void **)(v5 + 24), self->_textHighlights, 16 * self->_textHighlightsCount);
    *(_QWORD *)(v5 + 32) = self->_textHighlightsCount;
  }
  v14 = -[NSString copyWithZone:](self->_iconID, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[GEOLatLng copyWithZone:](self->_latlng, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  v18 = -[NSData copyWithZone:](self->_suggestionEntryMetadata, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v18;

  v20 = -[NSString copyWithZone:](self->_searchQueryDisplayString, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v20;

  v22 = -[NSString copyWithZone:](self->_calloutTitle, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v22;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v24 = self->_namedFeatures;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v24);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v30);
        -[GEOSuggestionEntry addNamedFeature:](v5, v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v25);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  NSMutableArray *displayLines;
  unint64_t textHighlightsCount;
  char v7;
  NSString *iconID;
  GEOLatLng *latlng;
  NSData *suggestionEntryMetadata;
  NSString *searchQueryDisplayString;
  NSString *calloutTitle;
  NSMutableArray *namedFeatures;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  -[GEOSuggestionEntry readAll:]((uint64_t)self, 1);
  -[GEOSuggestionEntry readAll:]((uint64_t)v4, 1);
  displayLines = self->_displayLines;
  if ((unint64_t)displayLines | (unint64_t)v4[7])
  {
    if (!-[NSMutableArray isEqual:](displayLines, "isEqual:"))
      goto LABEL_6;
  }
  if ((textHighlightsCount = self->_textHighlightsCount, (const void *)textHighlightsCount == v4[4])
    && !memcmp(self->_textHighlights, v4[3], 16 * textHighlightsCount)
    && ((iconID = self->_iconID, !((unint64_t)iconID | (unint64_t)v4[8]))
     || -[NSString isEqual:](iconID, "isEqual:"))
    && ((latlng = self->_latlng, !((unint64_t)latlng | (unint64_t)v4[9]))
     || -[GEOLatLng isEqual:](latlng, "isEqual:"))
    && ((suggestionEntryMetadata = self->_suggestionEntryMetadata,
         !((unint64_t)suggestionEntryMetadata | (unint64_t)v4[12]))
     || -[NSData isEqual:](suggestionEntryMetadata, "isEqual:"))
    && ((searchQueryDisplayString = self->_searchQueryDisplayString,
         !((unint64_t)searchQueryDisplayString | (unint64_t)v4[11]))
     || -[NSString isEqual:](searchQueryDisplayString, "isEqual:"))
    && ((calloutTitle = self->_calloutTitle, !((unint64_t)calloutTitle | (unint64_t)v4[6]))
     || -[NSString isEqual:](calloutTitle, "isEqual:")))
  {
    namedFeatures = self->_namedFeatures;
    if ((unint64_t)namedFeatures | (unint64_t)v4[10])
      v7 = -[NSMutableArray isEqual:](namedFeatures, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;

  -[GEOSuggestionEntry readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_displayLines, "hash");
  v4 = PBHashBytes();
  v5 = v4 ^ v3 ^ -[NSString hash](self->_iconID, "hash");
  v6 = -[GEOLatLng hash](self->_latlng, "hash");
  v7 = v6 ^ -[NSData hash](self->_suggestionEntryMetadata, "hash");
  v8 = v5 ^ v7 ^ -[NSString hash](self->_searchQueryDisplayString, "hash");
  v9 = -[NSString hash](self->_calloutTitle, "hash");
  return v8 ^ v9 ^ -[NSMutableArray hash](self->_namedFeatures, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_searchQueryDisplayString, 0);
  objc_storeStrong((id *)&self->_namedFeatures, 0);
  objc_storeStrong((id *)&self->_latlng, 0);
  objc_storeStrong((id *)&self->_iconID, 0);
  objc_storeStrong((id *)&self->_displayLines, 0);
  objc_storeStrong((id *)&self->_calloutTitle, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
