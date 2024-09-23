@implementation GEOPDResultRefinementMultiSelect

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 80) |= 8u;
    *(_WORD *)(a1 + 80) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementMultiSelect readAll:](a1, 0);
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = *(id *)(a1 + 48);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            -[GEOPDResultRefinementMultiSelectElement clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (GEOPDResultRefinementMultiSelect)init
{
  GEOPDResultRefinementMultiSelect *v2;
  GEOPDResultRefinementMultiSelect *v3;
  GEOPDResultRefinementMultiSelect *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementMultiSelect;
  v2 = -[GEOPDResultRefinementMultiSelect init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementMultiSelect)initWithData:(id)a3
{
  GEOPDResultRefinementMultiSelect *v3;
  GEOPDResultRefinementMultiSelect *v4;
  GEOPDResultRefinementMultiSelect *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementMultiSelect;
  v3 = -[GEOPDResultRefinementMultiSelect initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMultiSelectReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_624);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)displayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementMultiSelect _readDisplayName]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setDisplayName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 80) |= 0x20u;
    *(_WORD *)(a1 + 80) |= 0x100u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)_readMultiSelects
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMultiSelectReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMultiSelects_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)multiSelects
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementMultiSelect _readMultiSelects]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)addMultiSelect:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDResultRefinementMultiSelect _readMultiSelects](a1);
    -[GEOPDResultRefinementMultiSelect _addNoFlagsMultiSelect:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 80) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_WORD *)(a1 + 80) |= 0x100u;
  }
}

- (void)_addNoFlagsMultiSelect:(uint64_t)a1
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

- (uint64_t)clauseType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 80);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 68);
    else
      return 0;
  }
  return result;
}

- (void)_readDisplayNameForMultiSelected
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMultiSelectReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayNameForMultiSelected_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)displayNameForMultiSelected
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementMultiSelect _readDisplayNameForMultiSelected]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setDisplayNameForMultiSelected:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 80) |= 0x10u;
    *(_WORD *)(a1 + 80) |= 0x100u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)_readMultiSelectIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMultiSelectReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMultiSelectIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)multiSelectIdentifier
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementMultiSelect _readMultiSelectIdentifier]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setMultiSelectIdentifier:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 80) |= 0x40u;
    *(_WORD *)(a1 + 80) |= 0x100u;
    objc_storeStrong((id *)(a1 + 40), a2);
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
  v8.super_class = (Class)GEOPDResultRefinementMultiSelect;
  -[GEOPDResultRefinementMultiSelect description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementMultiSelect dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementMultiSelect _dictionaryRepresentation:]((uint64_t)self, 0);
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
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v30;
  const __CFString *v31;
  int v32;
  __CFString *v33;
  const __CFString *v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDResultRefinementMultiSelect readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementMultiSelect displayName]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("displayName");
    else
      v6 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = *(id *)(a1 + 48);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("multiSelect");
    else
      v15 = CFSTR("multi_select");
    objc_msgSend(v4, "setObject:forKey:", v7, v15);

  }
  v16 = *(_WORD *)(a1 + 80);
  if ((v16 & 2) == 0)
  {
    if ((v16 & 1) == 0)
      goto LABEL_24;
LABEL_48:
    v32 = *(_DWORD *)(a1 + 68);
    if (v32)
    {
      if (v32 == 1)
      {
        v33 = CFSTR("RESULT_REFINEMENT_MULTI_SELECT_CLAUSE_TYPE_ALL");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 68));
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v33 = CFSTR("RESULT_REFINEMENT_MULTI_SELECT_CLAUSE_TYPE_ANY");
    }
    if (a2)
      v34 = CFSTR("clauseType");
    else
      v34 = CFSTR("clause_type");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

    if ((*(_WORD *)(a1 + 80) & 4) == 0)
      goto LABEL_29;
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v31 = CFSTR("maxNumSelectElements");
  else
    v31 = CFSTR("max_num_select_elements");
  objc_msgSend(v4, "setObject:forKey:", v30, v31);

  v16 = *(_WORD *)(a1 + 80);
  if ((v16 & 1) != 0)
    goto LABEL_48;
LABEL_24:
  if ((v16 & 4) != 0)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 76));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("showEqualWidthButtonsOnFilterView");
    else
      v18 = CFSTR("show_equal_width_buttons_on_filter_view");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
LABEL_29:
  -[GEOPDResultRefinementMultiSelect displayNameForMultiSelected]((id *)a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (a2)
      v20 = CFSTR("displayNameForMultiSelected");
    else
      v20 = CFSTR("display_name_for_multi_selected");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);
  }

  -[GEOPDResultRefinementMultiSelect multiSelectIdentifier]((id *)a1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (a2)
      v22 = CFSTR("multiSelectIdentifier");
    else
      v22 = CFSTR("multi_select_identifier");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);
  }

  v23 = *(void **)(a1 + 16);
  if (v23)
  {
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __62__GEOPDResultRefinementMultiSelect__dictionaryRepresentation___block_invoke;
      v35[3] = &unk_1E1C00600;
      v27 = v26;
      v36 = v27;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v35);
      v28 = v27;

      v25 = v28;
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementMultiSelect _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_646;
      else
        v6 = (int *)&readAll__nonRecursiveTag_647;
      GEOPDResultRefinementMultiSelectReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDResultRefinementMultiSelectCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __62__GEOPDResultRefinementMultiSelect__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDResultRefinementMultiSelectReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 flags;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F0) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementMultiSelect readAll:]((uint64_t)self, 0);
    if (self->_displayName)
      PBDataWriterWriteStringField();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_multiSelects;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_displayNameForMultiSelected)
      PBDataWriterWriteStringField();
    if (self->_multiSelectIdentifier)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
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
  __int16 flags;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  PBUnknownFields *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementMultiSelect readAll:]((uint64_t)self, 0);
    v9 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v9;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = self->_multiSelects;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v11);
          v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v23);
          -[GEOPDResultRefinementMultiSelect addMultiSelect:](v5, v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 72) = self->_maxNumSelectElements;
      *(_WORD *)(v5 + 80) |= 2u;
      flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_14:
        if ((flags & 4) == 0)
        {
LABEL_16:
          v17 = -[NSString copyWithZone:](self->_displayNameForMultiSelected, "copyWithZone:", a3, (_QWORD)v23);
          v18 = *(void **)(v5 + 24);
          *(_QWORD *)(v5 + 24) = v17;

          v19 = -[NSString copyWithZone:](self->_multiSelectIdentifier, "copyWithZone:", a3);
          v20 = *(void **)(v5 + 40);
          *(_QWORD *)(v5 + 40) = v19;

          v21 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v21;
          goto LABEL_17;
        }
LABEL_15:
        *(_BYTE *)(v5 + 76) = self->_showEqualWidthButtonsOnFilterView;
        *(_WORD *)(v5 + 80) |= 4u;
        goto LABEL_16;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_14;
    }
    *(_DWORD *)(v5 + 68) = self->_clauseType;
    *(_WORD *)(v5 + 80) |= 1u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDResultRefinementMultiSelectReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_17:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *displayName;
  NSMutableArray *multiSelects;
  __int16 flags;
  __int16 v8;
  NSString *displayNameForMultiSelected;
  NSString *multiSelectIdentifier;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[GEOPDResultRefinementMultiSelect readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementMultiSelect readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_28;
  }
  multiSelects = self->_multiSelects;
  if ((unint64_t)multiSelects | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](multiSelects, "isEqual:"))
      goto LABEL_28;
  }
  flags = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 40);
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_maxNumSelectElements != *((_DWORD *)v4 + 18))
      goto LABEL_28;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_clauseType != *((_DWORD *)v4 + 17))
      goto LABEL_28;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_28;
  }
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) != 0)
    {
      if (self->_showEqualWidthButtonsOnFilterView)
      {
        if (!*((_BYTE *)v4 + 76))
          goto LABEL_28;
        goto LABEL_24;
      }
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_24;
    }
LABEL_28:
    v11 = 0;
    goto LABEL_29;
  }
  if ((v8 & 4) != 0)
    goto LABEL_28;
LABEL_24:
  displayNameForMultiSelected = self->_displayNameForMultiSelected;
  if ((unint64_t)displayNameForMultiSelected | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](displayNameForMultiSelected, "isEqual:"))
  {
    goto LABEL_28;
  }
  multiSelectIdentifier = self->_multiSelectIdentifier;
  if ((unint64_t)multiSelectIdentifier | *((_QWORD *)v4 + 5))
    v11 = -[NSString isEqual:](multiSelectIdentifier, "isEqual:");
  else
    v11 = 1;
LABEL_29:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  __int16 flags;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;

  -[GEOPDResultRefinementMultiSelect readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_displayName, "hash");
  v4 = -[NSMutableArray hash](self->_multiSelects, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    v6 = 0;
    if ((flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v7 = 0;
    if ((flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v6 = 2654435761 * self->_maxNumSelectElements;
  if ((flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v7 = 2654435761 * self->_clauseType;
  if ((flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v8 = 2654435761 * self->_showEqualWidthButtonsOnFilterView;
LABEL_8:
  v9 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_displayNameForMultiSelected, "hash");
  return v9 ^ -[NSString hash](self->_multiSelectIdentifier, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSelects, 0);
  objc_storeStrong((id *)&self->_multiSelectIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_displayNameForMultiSelected, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
