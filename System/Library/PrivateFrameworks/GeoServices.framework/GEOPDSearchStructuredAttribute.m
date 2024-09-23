@implementation GEOPDSearchStructuredAttribute

- (GEOPDSearchStructuredAttribute)init
{
  GEOPDSearchStructuredAttribute *v2;
  GEOPDSearchStructuredAttribute *v3;
  GEOPDSearchStructuredAttribute *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchStructuredAttribute;
  v2 = -[GEOPDSearchStructuredAttribute init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchStructuredAttribute)initWithData:(id)a3
{
  GEOPDSearchStructuredAttribute *v3;
  GEOPDSearchStructuredAttribute *v4;
  GEOPDSearchStructuredAttribute *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchStructuredAttribute;
  v3 = -[GEOPDSearchStructuredAttribute initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addNestedAttribute:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchStructuredAttributeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNestedAttributes_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    -[GEOPDSearchStructuredAttribute _addNoFlagsNestedAttribute:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 48) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    *(_BYTE *)(a1 + 48) |= 8u;
  }
}

- (void)_addNoFlagsNestedAttribute:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchStructuredAttribute;
  -[GEOPDSearchStructuredAttribute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchStructuredAttribute dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchStructuredAttribute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const __CFString *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchStructuredAttribute readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  if ((*(_BYTE *)(a1 + 48) & 2) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchStructuredAttributeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttribute_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  v7 = *(id *)(a1 + 16);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("attribute"));

  }
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v10 = *(int *)(a1 + 44);
    if (v10 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E1C0AAC0[v10];
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("operator"));

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = *(id *)(a1 + 24);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("nestedAttribute");
    else
      v19 = CFSTR("nested_attribute");
    objc_msgSend(v4, "setObject:forKey:", v12, v19);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchStructuredAttribute _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1751;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1752;
      GEOPDSearchStructuredAttributeReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchStructuredAttributeCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5;
  uint64_t v6;
  void *v7;
  GEOPDSearchAttribute *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  const __CFString *v17;
  void *v18;
  GEOPDSearchTokenSet *v19;
  void *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  char v28;
  const __CFString *v29;
  void *v30;
  char v31;
  const __CFString *v32;
  void *v33;
  id v34;
  int v35;
  const __CFString *v36;
  void *v37;
  char v38;
  GEOPDSearchAttribute *v39;
  void *v40;
  id v41;
  int v42;
  const __CFString *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  GEOPDSearchStructuredAttribute *v51;
  void *v52;
  uint64_t v53;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_98;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attribute"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOPDSearchAttribute alloc];
    if (!v8)
    {
LABEL_66:
      v39 = v8;
      *(_BYTE *)(v6 + 48) |= 2u;
      *(_BYTE *)(v6 + 48) |= 8u;
      objc_storeStrong((id *)(v6 + 16), v8);

      goto LABEL_67;
    }
    v9 = v7;
    v8 = -[GEOPDSearchAttribute init](v8, "init");
    if (!v8)
    {
LABEL_65:

      goto LABEL_66;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      v12 = v11;
      *(_WORD *)&v8->_flags |= 0x40u;
      *(_WORD *)&v8->_flags |= 0x100u;
      objc_storeStrong((id *)&v8->_name, v11);

    }
    if ((_DWORD)a3)
      v13 = CFSTR("attributeId");
    else
      v13 = CFSTR("attribute_id");
    objc_msgSend(v9, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      v16 = v15;
      *(_WORD *)&v8->_flags |= 0x10u;
      *(_WORD *)&v8->_flags |= 0x100u;
      objc_storeStrong((id *)&v8->_attributeId, v15);

    }
    if ((_DWORD)a3)
      v17 = CFSTR("tokenSet");
    else
      v17 = CFSTR("token_set");
    objc_msgSend(v9, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = [GEOPDSearchTokenSet alloc];
      if (v19)
        v20 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v19, v18, a3);
      else
        v20 = 0;
      v21 = v20;
      *(_WORD *)&v8->_flags |= 0x80u;
      *(_WORD *)&v8->_flags |= 0x100u;
      objc_storeStrong((id *)&v8->_tokenSet, v20);

    }
    if ((_DWORD)a3)
      v22 = CFSTR("attributeValue");
    else
      v22 = CFSTR("attribute_value");
    objc_msgSend(v9, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)objc_msgSend(v23, "copy");
      v25 = v24;
      *(_WORD *)&v8->_flags |= 0x20u;
      *(_WORD *)&v8->_flags |= 0x100u;
      objc_storeStrong((id *)&v8->_attributeValue, v24);

    }
    if ((_DWORD)a3)
      v26 = CFSTR("isOptionalAttribute");
    else
      v26 = CFSTR("is_optional_attribute");
    objc_msgSend(v9, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = objc_msgSend(v27, "BOOLValue");
      *(_WORD *)&v8->_flags |= 0x100u;
      *(_WORD *)&v8->_flags |= 2u;
      v8->_isOptionalAttribute = v28;
    }

    if ((_DWORD)a3)
      v29 = CFSTR("negateAttribute");
    else
      v29 = CFSTR("negate_attribute");
    objc_msgSend(v9, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = objc_msgSend(v30, "BOOLValue");
      *(_WORD *)&v8->_flags |= 0x100u;
      *(_WORD *)&v8->_flags |= 8u;
      v8->_negateAttribute = v31;
    }

    if ((_DWORD)a3)
      v32 = CFSTR("rankingOrder");
    else
      v32 = CFSTR("ranking_order");
    objc_msgSend(v9, "objectForKeyedSubscript:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v33;
      if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RELEVANCE")) & 1) != 0)
      {
        v35 = 0;
      }
      else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RATING")) & 1) != 0)
      {
        v35 = 1;
      }
      else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
      {
        v35 = 2;
      }
      else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("RANKER_DISABLED")) & 1) != 0)
      {
        v35 = 3;
      }
      else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("PRICE_RANGE_ASCENDING")) & 1) != 0)
      {
        v35 = 4;
      }
      else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("PRICE_RANGE_DESCENDING")) & 1) != 0)
      {
        v35 = 5;
      }
      else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("DISTANCE_TO_DEVICE_LOCATION")) & 1) != 0)
      {
        v35 = 6;
      }
      else if (objc_msgSend(v34, "isEqualToString:", CFSTR("VENDOR_RATING")))
      {
        v35 = 7;
      }
      else
      {
        v35 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_59:

        if ((_DWORD)a3)
          v36 = CFSTR("isOptionalKeyword");
        else
          v36 = CFSTR("is_optional_keyword");
        objc_msgSend(v9, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v38 = objc_msgSend(v37, "BOOLValue");
          *(_WORD *)&v8->_flags |= 0x100u;
          *(_WORD *)&v8->_flags |= 4u;
          v8->_isOptionalKeyword = v38;
        }

        goto LABEL_65;
      }
      v35 = objc_msgSend(v33, "intValue");
    }
    *(_WORD *)&v8->_flags |= 0x100u;
    *(_WORD *)&v8->_flags |= 1u;
    v8->_rankingOrder = v35;
    goto LABEL_59;
  }
LABEL_67:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("operator"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = v40;
    if ((objc_msgSend(v41, "isEqualToString:", CFSTR("STRUCTURED_ATTRIBUTE_OPERATOR_NONE")) & 1) != 0)
    {
      v42 = 0;
    }
    else if ((objc_msgSend(v41, "isEqualToString:", CFSTR("STRUCTURED_ATTRIBUTE_OPERATOR_AND")) & 1) != 0)
    {
      v42 = 1;
    }
    else if (objc_msgSend(v41, "isEqualToString:", CFSTR("STRUCTURED_ATTRIBUTE_OPERATOR_OR")))
    {
      v42 = 2;
    }
    else
    {
      v42 = 0;
    }

    goto LABEL_78;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = objc_msgSend(v40, "intValue");
LABEL_78:
    *(_BYTE *)(v6 + 48) |= 8u;
    *(_BYTE *)(v6 + 48) |= 1u;
    *(_DWORD *)(v6 + 44) = v42;
  }

  if ((_DWORD)a3)
    v43 = CFSTR("nestedAttribute");
  else
    v43 = CFSTR("nested_attribute");
  objc_msgSend(v5, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v55 = v5;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v45 = v44;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v57;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v57 != v48)
            objc_enumerationMutation(v45);
          v50 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v49);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v51 = [GEOPDSearchStructuredAttribute alloc];
            if (v51)
              v52 = (void *)-[GEOPDSearchStructuredAttribute _initWithDictionary:isJSON:](v51, v50, a3);
            else
              v52 = 0;
            -[GEOPDSearchStructuredAttribute addNestedAttribute:](v6, v52);

          }
          ++v49;
        }
        while (v47 != v49);
        v53 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        v47 = v53;
      }
      while (v53);
    }

    v5 = v55;
  }

LABEL_98:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchStructuredAttributeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  if (self->_reader && (_GEOPDSearchStructuredAttributeIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDSearchStructuredAttribute readAll:]((uint64_t)self, 0);
    if (self->_attribute)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_nestedAttributes;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchStructuredAttributeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchStructuredAttribute readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDSearchAttribute copyWithZone:](self->_attribute, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_operatorValue;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_nestedAttributes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v8);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        -[GEOPDSearchStructuredAttribute addNestedAttribute:](v5, v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDSearchAttribute *attribute;
  NSMutableArray *nestedAttributes;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOPDSearchStructuredAttribute readAll:]((uint64_t)self, 1);
  -[GEOPDSearchStructuredAttribute readAll:]((uint64_t)v4, 1);
  attribute = self->_attribute;
  if ((unint64_t)attribute | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPDSearchAttribute isEqual:](attribute, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_operatorValue != *((_DWORD *)v4 + 11))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  nestedAttributes = self->_nestedAttributes;
  if ((unint64_t)nestedAttributes | *((_QWORD *)v4 + 3))
    v7 = -[NSMutableArray isEqual:](nestedAttributes, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  -[GEOPDSearchStructuredAttribute readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDSearchAttribute hash](self->_attribute, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_operatorValue;
  else
    v4 = 0;
  return v4 ^ -[NSMutableArray hash](self->_nestedAttributes, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nestedAttributes, 0);
  objc_storeStrong((id *)&self->_attribute, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
