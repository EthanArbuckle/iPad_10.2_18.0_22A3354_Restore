@implementation GEOPDResultRefinementToggle

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 68) |= 0x40u;
    *(_WORD *)(a1 + 68) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementToggle readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 32), "clearUnknownFields:", 1);
    }
  }
}

- (GEOPDResultRefinementToggle)init
{
  GEOPDResultRefinementToggle *v2;
  GEOPDResultRefinementToggle *v3;
  GEOPDResultRefinementToggle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementToggle;
  v2 = -[GEOPDResultRefinementToggle init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementToggle)initWithData:(id)a3
{
  GEOPDResultRefinementToggle *v3;
  GEOPDResultRefinementToggle *v4;
  GEOPDResultRefinementToggle *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementToggle;
  v3 = -[GEOPDResultRefinementToggle initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 68) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementToggleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_956);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)displayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementToggle _readDisplayName]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setDisplayName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 68) |= 0x80u;
    *(_WORD *)(a1 + 68) |= 0x200u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)_readMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 68) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementToggleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetadata_tags_957);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)metadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementToggle _readMetadata]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 68) |= 0x100u;
    *(_WORD *)(a1 + 68) |= 0x200u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (uint64_t)toggleType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 68);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if ((v2 & 4) != 0)
      return *(unsigned int *)(v1 + 60);
    else
      return 0;
  }
  return result;
}

- (uint64_t)evChargingConnectorType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 68);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 52);
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
  v8.super_class = (Class)GEOPDResultRefinementToggle;
  -[GEOPDResultRefinementToggle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementToggle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementToggle _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v22;
  __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  _QWORD v32[4];
  id v33;

  if (!a1)
    return 0;
  -[GEOPDResultRefinementToggle readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementToggle displayName]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("displayName");
    else
      v6 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if ((*(_WORD *)(a1 + 68) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("isSelected");
    else
      v8 = CFSTR("is_selected");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  -[GEOPDResultRefinementToggle metadata]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("metadata"));

  }
  v12 = *(_WORD *)(a1 + 68);
  if ((v12 & 4) != 0)
  {
    v22 = *(int *)(a1 + 60);
    if (v22 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E1C0DDF8[v22];
    }
    if (a2)
      v24 = CFSTR("toggleType");
    else
      v24 = CFSTR("toggle_type");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    v12 = *(_WORD *)(a1 + 68);
    if ((v12 & 1) == 0)
    {
LABEL_19:
      if ((v12 & 2) == 0)
        goto LABEL_20;
      goto LABEL_45;
    }
  }
  else if ((v12 & 1) == 0)
  {
    goto LABEL_19;
  }
  v25 = *(int *)(a1 + 52);
  if (v25 >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = off_1E1C0DE10[v25];
  }
  if (a2)
    v27 = CFSTR("evChargingConnectorType");
  else
    v27 = CFSTR("ev_charging_connector_type");
  objc_msgSend(v4, "setObject:forKey:", v26, v27);

  v12 = *(_WORD *)(a1 + 68);
  if ((v12 & 2) == 0)
  {
LABEL_20:
    if ((v12 & 0x10) == 0)
      goto LABEL_21;
LABEL_49:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 65));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v31 = CFSTR("selectionFromView");
    else
      v31 = CFSTR("selection_from_view");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

    if ((*(_WORD *)(a1 + 68) & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_22;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v29 = CFSTR("selectionSequenceNumber");
  else
    v29 = CFSTR("selection_sequence_number");
  objc_msgSend(v4, "setObject:forKey:", v28, v29);

  v12 = *(_WORD *)(a1 + 68);
  if ((v12 & 0x10) != 0)
    goto LABEL_49;
LABEL_21:
  if ((v12 & 0x20) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 66));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("showAsSelected");
    else
      v14 = CFSTR("show_as_selected");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
LABEL_26:
  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __57__GEOPDResultRefinementToggle__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E1C00600;
      v19 = v18;
      v33 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v32);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementToggle _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_970;
      else
        v6 = (int *)&readAll__nonRecursiveTag_971;
      GEOPDResultRefinementToggleReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 32), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __57__GEOPDResultRefinementToggle__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v9;
  const __CFString *v10;
  void *v11;
  char v12;
  void *v13;
  GEOPDResultRefinementMetadata *v14;
  GEOPDResultRefinementMetadata *v15;
  GEOPDResultRefinementMetadata *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  int v20;
  const __CFString *v21;
  void *v22;
  id v23;
  int v24;
  const __CFString *v25;
  void *v26;
  int v27;
  const __CFString *v28;
  void *v29;
  char v30;
  const __CFString *v31;
  void *v32;
  char v33;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_79;
  if (a3)
    v7 = CFSTR("displayName");
  else
    v7 = CFSTR("display_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v8, "copy");
    -[GEOPDResultRefinementToggle setDisplayName:](v6, v9);

  }
  if (a3)
    v10 = CFSTR("isSelected");
  else
    v10 = CFSTR("is_selected");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v11, "BOOLValue");
    *(_WORD *)(v6 + 68) |= 0x200u;
    *(_WORD *)(v6 + 68) |= 8u;
    *(_BYTE *)(v6 + 64) = v12;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadata"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOPDResultRefinementMetadata alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEOPDResultRefinementMetadata initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEOPDResultRefinementMetadata initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = v15;
    -[GEOPDResultRefinementToggle setMetadata:](v6, v15);

  }
  if (a3)
    v17 = CFSTR("toggleType");
  else
    v17 = CFSTR("toggle_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v18;
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TOGGLE_TYPE_DEFAULT")) & 1) != 0)
    {
      v20 = 0;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TOGGLE_TYPE_EV_CHARGING")) & 1) != 0)
    {
      v20 = 1;
    }
    else if (objc_msgSend(v19, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TOGGLE_TYPE_OPEN_NOW")))
    {
      v20 = 2;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_32;
    v20 = objc_msgSend(v18, "intValue");
  }
  *(_WORD *)(v6 + 68) |= 0x200u;
  *(_WORD *)(v6 + 68) |= 4u;
  *(_DWORD *)(v6 + 60) = v20;
LABEL_32:

  if (a3)
    v21 = CFSTR("evChargingConnectorType");
  else
    v21 = CFSTR("ev_charging_connector_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v22;
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("CONNECTOR_TYPE_UNKNOWN")) & 1) != 0)
    {
      v24 = 0;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("CONNECTOR_TYPE_CHADEMO")) & 1) != 0)
    {
      v24 = 1;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("CONNECTOR_TYPE_J1772")) & 1) != 0)
    {
      v24 = 2;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("CONNECTOR_TYPE_TESLA")) & 1) != 0)
    {
      v24 = 3;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("CONNECTOR_TYPE_CCS1")) & 1) != 0)
    {
      v24 = 4;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("CONNECTOR_TYPE_CCS2")) & 1) != 0)
    {
      v24 = 5;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("CONNECTOR_TYPE_GBT1")) & 1) != 0)
    {
      v24 = 6;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("CONNECTOR_TYPE_GBT2")) & 1) != 0)
    {
      v24 = 7;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("CONNECTOR_TYPE_MENNEKES")) & 1) != 0)
    {
      v24 = 8;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("CONNECTOR_TYPE_NACS_AC")) & 1) != 0)
    {
      v24 = 9;
    }
    else if (objc_msgSend(v23, "isEqualToString:", CFSTR("CONNECTOR_TYPE_NACS_DC")))
    {
      v24 = 10;
    }
    else
    {
      v24 = 0;
    }

    goto LABEL_62;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = objc_msgSend(v22, "intValue");
LABEL_62:
    *(_WORD *)(v6 + 68) |= 0x200u;
    *(_WORD *)(v6 + 68) |= 1u;
    *(_DWORD *)(v6 + 52) = v24;
  }

  if (a3)
    v25 = CFSTR("selectionSequenceNumber");
  else
    v25 = CFSTR("selection_sequence_number");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = objc_msgSend(v26, "unsignedIntValue");
    *(_WORD *)(v6 + 68) |= 0x200u;
    *(_WORD *)(v6 + 68) |= 2u;
    *(_DWORD *)(v6 + 56) = v27;
  }

  if (a3)
    v28 = CFSTR("selectionFromView");
  else
    v28 = CFSTR("selection_from_view");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = objc_msgSend(v29, "BOOLValue");
    *(_WORD *)(v6 + 68) |= 0x200u;
    *(_WORD *)(v6 + 68) |= 0x10u;
    *(_BYTE *)(v6 + 65) = v30;
  }

  if (a3)
    v31 = CFSTR("showAsSelected");
  else
    v31 = CFSTR("show_as_selected");
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = objc_msgSend(v32, "BOOLValue");
    *(_WORD *)(v6 + 68) |= 0x200u;
    *(_WORD *)(v6 + 68) |= 0x20u;
    *(_BYTE *)(v6 + 66) = v33;
  }

LABEL_79:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementToggleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  __int16 flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDResultRefinementToggleIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_22;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinementToggle readAll:]((uint64_t)self, 0);
  if (self->_displayName)
    PBDataWriterWriteStringField();
  v5 = v9;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v9;
  }
  if (self->_metadata)
  {
    PBDataWriterWriteSubmessage();
    v5 = v9;
  }
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v9;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_11:
      if ((flags & 2) == 0)
        goto LABEL_12;
      goto LABEL_18;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  v5 = v9;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_12:
    if ((flags & 0x10) == 0)
      goto LABEL_13;
LABEL_19:
    PBDataWriterWriteBOOLField();
    v5 = v9;
    if ((*(_WORD *)&self->_flags & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  v5 = v9;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_19;
LABEL_13:
  if ((flags & 0x20) != 0)
  {
LABEL_14:
    PBDataWriterWriteBOOLField();
    v5 = v9;
  }
LABEL_15:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
LABEL_22:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int16 flags;
  PBUnknownFields *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementToggle readAll:]((uint64_t)self, 0);
    v9 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v9;

    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      *(_BYTE *)(v5 + 64) = self->_isSelected;
      *(_WORD *)(v5 + 68) |= 8u;
    }
    v11 = -[GEOPDResultRefinementMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v11;

    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 60) = self->_toggleType;
      *(_WORD *)(v5 + 68) |= 4u;
      flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_9:
        if ((flags & 2) == 0)
          goto LABEL_10;
        goto LABEL_17;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_9;
    }
    *(_DWORD *)(v5 + 52) = self->_evChargingConnectorType;
    *(_WORD *)(v5 + 68) |= 1u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_10:
      if ((flags & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_18;
    }
LABEL_17:
    *(_DWORD *)(v5 + 56) = self->_selectionSequenceNumber;
    *(_WORD *)(v5 + 68) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_11:
      if ((flags & 0x20) == 0)
      {
LABEL_13:
        v14 = self->_unknownFields;
        v8 = *(id *)(v5 + 16);
        *(_QWORD *)(v5 + 16) = v14;
        goto LABEL_14;
      }
LABEL_12:
      *(_BYTE *)(v5 + 66) = self->_showAsSelected;
      *(_WORD *)(v5 + 68) |= 0x20u;
      goto LABEL_13;
    }
LABEL_18:
    *(_BYTE *)(v5 + 65) = self->_selectionFromView;
    *(_WORD *)(v5 + 68) |= 0x10u;
    if ((*(_WORD *)&self->_flags & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDResultRefinementToggleReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_14:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *displayName;
  __int16 flags;
  __int16 v7;
  GEOPDResultRefinementMetadata *metadata;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  -[GEOPDResultRefinementToggle readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementToggle readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_40;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 34);
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0)
      goto LABEL_40;
    if (self->_isSelected)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_40;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_40;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_40;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDResultRefinementMetadata isEqual:](metadata, "isEqual:"))
      goto LABEL_40;
    flags = (__int16)self->_flags;
    v7 = *((_WORD *)v4 + 34);
  }
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_toggleType != *((_DWORD *)v4 + 15))
      goto LABEL_40;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_evChargingConnectorType != *((_DWORD *)v4 + 13))
      goto LABEL_40;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_40;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_selectionSequenceNumber != *((_DWORD *)v4 + 14))
      goto LABEL_40;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0)
      goto LABEL_40;
    if (self->_selectionFromView)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_40;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_40;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_40;
  }
  v9 = (v7 & 0x20) == 0;
  if ((flags & 0x20) != 0)
  {
    if ((v7 & 0x20) != 0)
    {
      if (self->_showAsSelected)
      {
        if (!*((_BYTE *)v4 + 66))
          goto LABEL_40;
      }
      else if (*((_BYTE *)v4 + 66))
      {
        goto LABEL_40;
      }
      v9 = 1;
      goto LABEL_41;
    }
LABEL_40:
    v9 = 0;
  }
LABEL_41:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  __int16 flags;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[GEOPDResultRefinementToggle readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_displayName, "hash");
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v4 = 2654435761 * self->_isSelected;
  else
    v4 = 0;
  v5 = -[GEOPDResultRefinementMetadata hash](self->_metadata, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v7 = 2654435761 * self->_toggleType;
    if ((flags & 1) != 0)
    {
LABEL_6:
      v8 = 2654435761 * self->_evChargingConnectorType;
      if ((flags & 2) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v7 = 0;
    if ((flags & 1) != 0)
      goto LABEL_6;
  }
  v8 = 0;
  if ((flags & 2) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_selectionSequenceNumber;
    if ((flags & 0x10) != 0)
      goto LABEL_8;
LABEL_13:
    v10 = 0;
    if ((flags & 0x20) != 0)
      goto LABEL_9;
LABEL_14:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_12:
  v9 = 0;
  if ((flags & 0x10) == 0)
    goto LABEL_13;
LABEL_8:
  v10 = 2654435761 * self->_selectionFromView;
  if ((flags & 0x20) == 0)
    goto LABEL_14;
LABEL_9:
  v11 = 2654435761 * self->_showAsSelected;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
