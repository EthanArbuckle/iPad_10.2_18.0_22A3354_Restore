@implementation GEOPDAddressResultSubTypeFilter

- (GEOPDAddressResultSubTypeFilter)init
{
  GEOPDAddressResultSubTypeFilter *v2;
  GEOPDAddressResultSubTypeFilter *v3;
  GEOPDAddressResultSubTypeFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAddressResultSubTypeFilter;
  v2 = -[GEOPDAddressResultSubTypeFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAddressResultSubTypeFilter)initWithData:(id)a3
{
  GEOPDAddressResultSubTypeFilter *v3;
  GEOPDAddressResultSubTypeFilter *v4;
  GEOPDAddressResultSubTypeFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAddressResultSubTypeFilter;
  v3 = -[GEOPDAddressResultSubTypeFilter initWithData:](&v7, sel_initWithData_, a3);
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
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDAddressResultSubTypeFilter;
  -[GEOPDAddressResultSubTypeFilter dealloc](&v3, sel_dealloc);
}

- (void)_readIncludeAddressSubTypeFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAddressResultSubTypeFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncludeAddressSubTypeFilters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)addIncludeAddressSubTypeFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDAddressResultSubTypeFilter _readIncludeAddressSubTypeFilters](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 84) |= 8u;
  }
}

- (uint64_t)includeAddressSubTypeFilterAtIndex:(uint64_t)result
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
    -[GEOPDAddressResultSubTypeFilter _readIncludeAddressSubTypeFilters](result);
    v4 = *(_QWORD *)(v3 + 56);
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
    return *(unsigned int *)(*(_QWORD *)(v3 + 48) + 4 * a2);
  }
  return result;
}

- (void)_readExcludeAddressSubTypeFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAddressResultSubTypeFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExcludeAddressSubTypeFilters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)addExcludeAddressSubTypeFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDAddressResultSubTypeFilter _readExcludeAddressSubTypeFilters](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 84) |= 8u;
  }
}

- (uint64_t)excludeAddressSubTypeFilterAtIndex:(uint64_t)result
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
    -[GEOPDAddressResultSubTypeFilter _readExcludeAddressSubTypeFilters](result);
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
  v8.super_class = (Class)GEOPDAddressResultSubTypeFilter;
  -[GEOPDAddressResultSubTypeFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAddressResultSubTypeFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAddressResultSubTypeFilter _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[7])
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1 + 6;
    if (a1[7])
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
          v9 = off_1E1C0DC28[v8];
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = a1 + 6;
      }
      while (v7 < a1[7]);
    }
    if (a2)
      v10 = CFSTR("includeAddressSubTypeFilter");
    else
      v10 = CFSTR("include_address_sub_type_filter");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  if (a1[4])
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1 + 3;
    if (a1[4])
    {
      v13 = 0;
      do
      {
        v14 = *(int *)(*v12 + 4 * v13);
        if (v14 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = off_1E1C0DC28[v14];
        }
        objc_msgSend(v11, "addObject:", v15);

        ++v13;
        v12 = a1 + 3;
      }
      while (v13 < a1[4]);
    }
    if (a2)
      v16 = CFSTR("excludeAddressSubTypeFilter");
    else
      v16 = CFSTR("exclude_address_sub_type_filter");
    objc_msgSend(v4, "setObject:forKey:", v11, v16);

  }
  v17 = (void *)a1[2];
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __61__GEOPDAddressResultSubTypeFilter__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAddressResultSubTypeFilter _dictionaryRepresentation:](self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_43;
      else
        v6 = (int *)&readAll__nonRecursiveTag_43;
      GEOPDAddressResultSubTypeFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __61__GEOPDAddressResultSubTypeFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("includeAddressSubTypeFilter");
      else
        v7 = CFSTR("include_address_sub_type_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v28 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v26 = v8;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (!v10)
          goto LABEL_27;
        v11 = v10;
        v12 = *(_QWORD *)v34;
        while (1)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v34 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_UNKNOWN")) & 1) == 0
                && (objc_msgSend(v15, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_COUNTRY")) & 1) == 0
                && (objc_msgSend(v15, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_ADMINISTRATIVE_AREA")) & 1) == 0
                && (objc_msgSend(v15, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_SUB_ADMINISTRATIVE_AREA")) & 1) == 0
                && (objc_msgSend(v15, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_LOCALITY")) & 1) == 0
                && (objc_msgSend(v15, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_SUB_LOCALITY")) & 1) == 0)
              {
                objc_msgSend(v15, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_POSTAL_CODE"));
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              objc_msgSend(v14, "intValue");
            }
            -[GEOPDAddressResultSubTypeFilter addIncludeAddressSubTypeFilter:](v6);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          if (!v11)
          {
LABEL_27:

            v5 = v28;
            v8 = v26;
            break;
          }
        }
      }

      if (a3)
        v16 = CFSTR("excludeAddressSubTypeFilter");
      else
        v16 = CFSTR("exclude_address_sub_type_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v27 = v17;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (!v19)
          goto LABEL_52;
        v20 = v19;
        v21 = *(_QWORD *)v30;
        while (1)
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = v23;
              if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_UNKNOWN")) & 1) == 0
                && (objc_msgSend(v24, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_COUNTRY")) & 1) == 0
                && (objc_msgSend(v24, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_ADMINISTRATIVE_AREA")) & 1) == 0
                && (objc_msgSend(v24, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_SUB_ADMINISTRATIVE_AREA")) & 1) == 0
                && (objc_msgSend(v24, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_LOCALITY")) & 1) == 0
                && (objc_msgSend(v24, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_SUB_LOCALITY")) & 1) == 0)
              {
                objc_msgSend(v24, "isEqualToString:", CFSTR("ADDRESS_SUBTYPE_POSTAL_CODE"));
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              objc_msgSend(v23, "intValue");
            }
            -[GEOPDAddressResultSubTypeFilter addExcludeAddressSubTypeFilter:](v6);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (!v20)
          {
LABEL_52:

            v17 = v27;
            v5 = v28;
            break;
          }
        }
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
  return GEOPDAddressResultSubTypeFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)self, 0);
    v5 = v10;
    if (self->_includeAddressSubTypeFilters.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v10;
        ++v6;
      }
      while (v6 < self->_includeAddressSubTypeFilters.count);
    }
    if (self->_excludeAddressSubTypeFilters.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v10;
        ++v7;
      }
      while (v7 < self->_excludeAddressSubTypeFilters.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  PBDataReader *reader;
  PBDataReader *v6;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v6 = reader;
  objc_sync_enter(v6);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)self, 0);
    PBRepeatedInt32Copy();
    PBRepeatedInt32Copy();
    objc_storeStrong(v4 + 2, self->_unknownFields);
    return v4;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDAddressResultSubTypeFilterReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)self, 1),
        -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)v4, 1),
        PBRepeatedInt32IsEqual()))
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;

  -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)self, 1);
  v2 = PBRepeatedInt32Hash();
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  unint64_t j;
  id v8;

  v3 = a2;
  if (a1)
  {
    v8 = v3;
    -[GEOPDAddressResultSubTypeFilter readAll:]((uint64_t)v3, 0);
    v3 = v8;
    if (v8)
    {
      -[GEOPDAddressResultSubTypeFilter _readIncludeAddressSubTypeFilters]((uint64_t)v8);
      v4 = *((_QWORD *)v8 + 7);
      if (v4)
      {
        for (i = 0; i != v4; ++i)
        {
          -[GEOPDAddressResultSubTypeFilter includeAddressSubTypeFilterAtIndex:]((uint64_t)v8, i);
          -[GEOPDAddressResultSubTypeFilter addIncludeAddressSubTypeFilter:](a1);
        }
      }
      -[GEOPDAddressResultSubTypeFilter _readExcludeAddressSubTypeFilters]((uint64_t)v8);
      v3 = v8;
      v6 = *((_QWORD *)v8 + 4);
      if (v6)
      {
        for (j = 0; j != v6; ++j)
        {
          -[GEOPDAddressResultSubTypeFilter excludeAddressSubTypeFilterAtIndex:]((uint64_t)v8, j);
          -[GEOPDAddressResultSubTypeFilter addExcludeAddressSubTypeFilter:](a1);
          v3 = v8;
        }
      }
    }
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 1u;
    *(_BYTE *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
      -[GEOPDAddressResultSubTypeFilter readAll:](a1, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
