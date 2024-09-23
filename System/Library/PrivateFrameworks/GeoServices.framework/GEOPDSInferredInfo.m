@implementation GEOPDSInferredInfo

- (GEOPDSInferredInfo)init
{
  GEOPDSInferredInfo *v2;
  GEOPDSInferredInfo *v3;
  GEOPDSInferredInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSInferredInfo;
  v2 = -[GEOPDSInferredInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSInferredInfo)initWithData:(id)a3
{
  GEOPDSInferredInfo *v3;
  GEOPDSInferredInfo *v4;
  GEOPDSInferredInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSInferredInfo;
  v3 = -[GEOPDSInferredInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setInferredValue:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 60) |= 8u;
  *(_BYTE *)(a1 + 60) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)addOperand:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSInferredInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOperands_tags_0);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDSInferredInfo _addNoFlagsOperand:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsOperand:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSInferredInfo;
  -[GEOPDSInferredInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSInferredInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSInferredInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSInferredInfo readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    v5 = *(int *)(a1 + 52);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C05970[v5];
    }
    if (a2)
      v7 = CFSTR("inferredType");
    else
      v7 = CFSTR("inferred_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_BYTE *)(a1 + 60) & 8) == 0)
  {
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(v9);
      GEOPDSInferredInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInferredValue_tags);
      objc_sync_exit(v9);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  v10 = *(id *)(a1 + 24);
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("inferredValue");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("inferred_value");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  if ((*(_BYTE *)(a1 + 60) & 2) != 0)
  {
    v14 = *(int *)(a1 + 56);
    if (v14 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 56));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E1C05990[v14];
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("operator"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v17 = *(id *)(a1 + 32);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v21, "jsonRepresentation");
          else
            objc_msgSend(v21, "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("operand"));
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
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __48__GEOPDSInferredInfo__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v27 = v26;
      v31 = v27;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);
      v28 = v27;

    }
    else
    {
      v28 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSInferredInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_181_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_182_0;
      GEOPDSInferredInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSInferredInfoCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __48__GEOPDSInferredInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;
  int v10;
  const __CFString *v11;
  void *v12;
  GEOPDSInferredValue *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  id v17;
  int v18;
  const __CFString *v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  GEOPDSRawAttribute *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  unsigned int v28;
  const __CFString *v29;
  void *v30;
  unsigned int v31;
  const __CFString *v32;
  void *v33;
  char v34;
  void *v35;
  id v36;
  int v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  GEOPDSInferredInfo *v45;
  void *v46;
  uint64_t v47;
  void *v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_113;
  if ((_DWORD)a3)
    v7 = CFSTR("inferredType");
  else
    v7 = CFSTR("inferred_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("INFERRED_TYPE_UNKNOWN")) & 1) != 0)
    {
      v10 = 0;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("INFERRED_TYPE_PRICE_RANGE")) & 1) != 0)
    {
      v10 = 1;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("INFERRED_TYPE_TRADING_HOURS")) & 1) != 0)
    {
      v10 = 2;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("INFERRED_TYPE_ATTRIBUTE")))
    {
      v10 = 3;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
    v10 = objc_msgSend(v8, "intValue");
  }
  *(_BYTE *)(v6 + 60) |= 0x20u;
  *(_BYTE *)(v6 + 60) |= 1u;
  *(_DWORD *)(v6 + 52) = v10;
LABEL_19:

  if ((_DWORD)a3)
    v11 = CFSTR("inferredValue");
  else
    v11 = CFSTR("inferred_value");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEOPDSInferredValue alloc];
    if (!v13)
    {
LABEL_84:
      -[GEOPDSInferredInfo setInferredValue:](v6, v13);

      goto LABEL_85;
    }
    v14 = v12;
    v13 = -[GEOPDSInferredValue init](v13, "init");
    if (!v13)
    {
LABEL_83:

      goto LABEL_84;
    }
    if ((_DWORD)a3)
      v15 = CFSTR("priceRange");
    else
      v15 = CFSTR("price_range");
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PRICE_RANGE_UNKNOWN")) & 1) != 0)
      {
        v18 = 0;
      }
      else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PRICE_RANGE_INEXPENSIVE")) & 1) != 0)
      {
        v18 = 1;
      }
      else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PRICE_RANGE_MODERATE")) & 1) != 0)
      {
        v18 = 2;
      }
      else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PRICE_RANGE_EXPENSIVE")) & 1) != 0)
      {
        v18 = 3;
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("PRICE_RANGE_VERY_EXPENSIVE")))
      {
        v18 = 4;
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_44;
      v18 = objc_msgSend(v16, "intValue");
    }
    *(_BYTE *)&v13->_flags |= 1u;
    v13->_priceRange = v18;
LABEL_44:

    if ((_DWORD)a3)
      v19 = CFSTR("tradingHours");
    else
      v19 = CFSTR("trading_hours");
    objc_msgSend(v14, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v20;
      if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRADING_HOURS_UNKNOWN")) & 1) != 0)
      {
        v22 = 0;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRADING_HOURS_OPEN_24_HOURS")) & 1) != 0)
      {
        v22 = 1;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRADING_HOURS_OPEN_LATE")) & 1) != 0)
      {
        v22 = 2;
      }
      else if (objc_msgSend(v21, "isEqualToString:", CFSTR("TRADING_HOURS_OPEN_NOW")))
      {
        v22 = 3;
      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_61:

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("attribute"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v50 = v14;
          v24 = [GEOPDSRawAttribute alloc];
          if (v24)
          {
            v25 = v23;
            v24 = -[GEOPDSRawAttribute init](v24, "init");
            if (v24)
            {
              if ((_DWORD)a3)
                v26 = CFSTR("beginIndex");
              else
                v26 = CFSTR("begin_index");
              objc_msgSend(v25, "objectForKeyedSubscript:", v26, v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = objc_msgSend(v27, "unsignedIntValue");
                *(_BYTE *)&v24->_flags |= 1u;
                v24->_beginIndex = v28;
              }

              if ((_DWORD)a3)
                v29 = CFSTR("endIndex");
              else
                v29 = CFSTR("end_index");
              objc_msgSend(v49, "objectForKeyedSubscript:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v31 = objc_msgSend(v30, "unsignedIntValue");
                *(_BYTE *)&v24->_flags |= 2u;
                v24->_endIndex = v31;
              }

              v25 = v49;
            }

          }
          -[GEOPDSInferredValue setAttribute:]((uint64_t)v13, v24);

          v14 = v50;
        }

        if ((_DWORD)a3)
          v32 = CFSTR("negateInferredValue");
        else
          v32 = CFSTR("negate_inferred_value");
        objc_msgSend(v14, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v34 = objc_msgSend(v33, "BOOLValue");
          *(_BYTE *)&v13->_flags |= 4u;
          v13->_negateInferredValue = v34;
        }

        goto LABEL_83;
      }
      v22 = objc_msgSend(v20, "intValue");
    }
    *(_BYTE *)&v13->_flags |= 2u;
    v13->_tradingHours = v22;
    goto LABEL_61;
  }
LABEL_85:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("operator"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = v35;
    if ((objc_msgSend(v36, "isEqualToString:", CFSTR("INFERRED_INFO_OPERATOR_NONE")) & 1) != 0)
    {
      v37 = 0;
    }
    else if ((objc_msgSend(v36, "isEqualToString:", CFSTR("INFERRED_INFO_OPERATOR_AND")) & 1) != 0)
    {
      v37 = 1;
    }
    else if (objc_msgSend(v36, "isEqualToString:", CFSTR("INFERRED_INFO_OPERATOR_OR")))
    {
      v37 = 2;
    }
    else
    {
      v37 = 0;
    }

    goto LABEL_96;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = objc_msgSend(v35, "intValue");
LABEL_96:
    *(_BYTE *)(v6 + 60) |= 0x20u;
    *(_BYTE *)(v6 + 60) |= 2u;
    *(_DWORD *)(v6 + 56) = v37;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("operand"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = v5;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v39 = v38;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v53;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v53 != v42)
            objc_enumerationMutation(v39);
          v44 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v43);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v45 = [GEOPDSInferredInfo alloc];
            if (v45)
              v46 = (void *)-[GEOPDSInferredInfo _initWithDictionary:isJSON:](v45, v44, a3);
            else
              v46 = 0;
            -[GEOPDSInferredInfo addOperand:](v6, v46);

          }
          ++v43;
        }
        while (v41 != v43);
        v47 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        v41 = v47;
      }
      while (v47);
    }

    v5 = v51;
  }

LABEL_113:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSInferredInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOPDSInferredInfoIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDSInferredInfo readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_inferredValue)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_operands;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  PBUnknownFields *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
      GEOPDSInferredInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSInferredInfo readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_inferredType;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v9 = -[GEOPDSInferredValue copyWithZone:](self->_inferredValue, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_operatorValue;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_operands;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        -[GEOPDSInferredInfo addOperand:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOPDSInferredValue *inferredValue;
  NSMutableArray *operands;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOPDSInferredInfo readAll:]((uint64_t)self, 1);
  -[GEOPDSInferredInfo readAll:]((uint64_t)v4, 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 60);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_inferredType != *((_DWORD *)v4 + 13))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_17;
  }
  inferredValue = self->_inferredValue;
  if ((unint64_t)inferredValue | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDSInferredValue isEqual:](inferredValue, "isEqual:"))
    {
LABEL_17:
      v9 = 0;
      goto LABEL_18;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 60);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_operatorValue != *((_DWORD *)v4 + 14))
      goto LABEL_17;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_17;
  }
  operands = self->_operands;
  if ((unint64_t)operands | *((_QWORD *)v4 + 4))
    v9 = -[NSMutableArray isEqual:](operands, "isEqual:");
  else
    v9 = 1;
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  -[GEOPDSInferredInfo readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_inferredType;
  else
    v3 = 0;
  v4 = -[GEOPDSInferredValue hash](self->_inferredValue, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v5 = 2654435761 * self->_operatorValue;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_operands, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  _BYTE *v7;
  _BYTE *v8;
  char v9;
  uint64_t v10;
  void *v11;
  _BYTE *v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    -[GEOPDSInferredInfo readAll:]((uint64_t)v3, 0);
    if ((*((_BYTE *)v4 + 60) & 1) != 0)
    {
      *(_DWORD *)(a1 + 52) = *((_DWORD *)v4 + 13);
      *(_BYTE *)(a1 + 60) |= 1u;
    }
    v5 = *(_QWORD *)(a1 + 24);
    v6 = (void *)*((_QWORD *)v4 + 3);
    if (v5)
    {
      if (v6)
      {
        v7 = v6;
        v8 = v7;
        v9 = v7[36];
        if ((v9 & 1) != 0)
        {
          *(_DWORD *)(v5 + 24) = *((_DWORD *)v7 + 6);
          *(_BYTE *)(v5 + 36) |= 1u;
          v9 = v7[36];
        }
        if ((v9 & 2) != 0)
        {
          *(_DWORD *)(v5 + 28) = *((_DWORD *)v7 + 7);
          *(_BYTE *)(v5 + 36) |= 2u;
        }
        v10 = *(_QWORD *)(v5 + 16);
        v11 = (void *)*((_QWORD *)v7 + 2);
        if (v10)
        {
          if (v11)
          {
            v12 = v11;
            v13 = v12[24];
            if ((v13 & 1) != 0)
            {
              *(_DWORD *)(v10 + 16) = *((_DWORD *)v12 + 4);
              *(_BYTE *)(v10 + 24) |= 1u;
              v13 = v12[24];
            }
            if ((v13 & 2) != 0)
            {
              *(_DWORD *)(v10 + 20) = *((_DWORD *)v12 + 5);
              *(_BYTE *)(v10 + 24) |= 2u;
            }

          }
        }
        else if (v11)
        {
          -[GEOPDSInferredValue setAttribute:](v5, v11);
        }
        if ((v8[36] & 4) != 0)
        {
          *(_BYTE *)(v5 + 32) = v8[32];
          *(_BYTE *)(v5 + 36) |= 4u;
        }

      }
    }
    else if (v6)
    {
      -[GEOPDSInferredInfo setInferredValue:](a1, v6);
    }
    if ((*((_BYTE *)v4 + 60) & 2) != 0)
    {
      *(_DWORD *)(a1 + 56) = *((_DWORD *)v4 + 14);
      *(_BYTE *)(a1 + 60) |= 2u;
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = *((id *)v4 + 4);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          -[GEOPDSInferredInfo addOperand:](a1, *(void **)(*((_QWORD *)&v19 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 4u;
    *(_BYTE *)(a1 + 60) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSInferredInfo readAll:](a1, 0);
      v5 = *(_QWORD *)(a1 + 24);
      if (v5)
      {
        v6 = *(void **)(v5 + 8);
        *(_QWORD *)(v5 + 8) = 0;

        v7 = *(_QWORD *)(v5 + 16);
        if (v7)
        {
          v8 = *(void **)(v7 + 8);
          *(_QWORD *)(v7 + 8) = 0;

        }
      }
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v9 = *(id *)(a1 + 32);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v15;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v9);
            -[GEOPDSInferredInfo clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), 1);
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v11);
      }

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operands, 0);
  objc_storeStrong((id *)&self->_inferredValue, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
