@implementation GEOLPRLicensePlateValidationRule

- (GEOLPRLicensePlateValidationRule)init
{
  GEOLPRLicensePlateValidationRule *v2;
  GEOLPRLicensePlateValidationRule *v3;
  GEOLPRLicensePlateValidationRule *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLicensePlateValidationRule;
  v2 = -[GEOLPRLicensePlateValidationRule init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLicensePlateValidationRule)initWithData:(id)a3
{
  GEOLPRLicensePlateValidationRule *v3;
  GEOLPRLicensePlateValidationRule *v4;
  GEOLPRLicensePlateValidationRule *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLicensePlateValidationRule;
  v3 = -[GEOLPRLicensePlateValidationRule initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRegularExpression
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
        GEOLPRLicensePlateValidationRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegularExpression_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRegularExpression
{
  -[GEOLPRLicensePlateValidationRule _readRegularExpression]((uint64_t)self);
  return self->_regularExpression != 0;
}

- (NSString)regularExpression
{
  -[GEOLPRLicensePlateValidationRule _readRegularExpression]((uint64_t)self);
  return self->_regularExpression;
}

- (void)setRegularExpression:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_regularExpression, a3);
}

- (unsigned)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_minLength = a3;
}

- (void)setHasMinLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMinLength
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_maxLength = a3;
}

- (void)setHasMaxLength:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasMaxLength
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readValidCharacters
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
        GEOLPRLicensePlateValidationRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readValidCharacters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasValidCharacters
{
  -[GEOLPRLicensePlateValidationRule _readValidCharacters]((uint64_t)self);
  return self->_validCharacters != 0;
}

- (NSString)validCharacters
{
  -[GEOLPRLicensePlateValidationRule _readValidCharacters]((uint64_t)self);
  return self->_validCharacters;
}

- (void)setValidCharacters:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_validCharacters, a3);
}

- (void)_readValidationRanges
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
        GEOLPRLicensePlateValidationRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readValidationRanges_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)validationRanges
{
  -[GEOLPRLicensePlateValidationRule _readValidationRanges]((uint64_t)self);
  return self->_validationRanges;
}

- (void)setValidationRanges:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *validationRanges;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  validationRanges = self->_validationRanges;
  self->_validationRanges = v4;

}

- (void)clearValidationRanges
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_validationRanges, "removeAllObjects");
}

- (void)addValidationRanges:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLicensePlateValidationRule _readValidationRanges]((uint64_t)self);
  -[GEOLPRLicensePlateValidationRule _addNoFlagsValidationRanges:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsValidationRanges:(uint64_t)a1
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

- (unint64_t)validationRangesCount
{
  -[GEOLPRLicensePlateValidationRule _readValidationRanges]((uint64_t)self);
  return -[NSMutableArray count](self->_validationRanges, "count");
}

- (id)validationRangesAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateValidationRule _readValidationRanges]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_validationRanges, "objectAtIndex:", a3);
}

+ (Class)validationRangesType
{
  return (Class)objc_opt_class();
}

- (void)_readImpliedPowerTypeKeys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLicensePlateValidationRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImpliedPowerTypeKeys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)impliedPowerTypeKeys
{
  -[GEOLPRLicensePlateValidationRule _readImpliedPowerTypeKeys]((uint64_t)self);
  return self->_impliedPowerTypeKeys;
}

- (void)setImpliedPowerTypeKeys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *impliedPowerTypeKeys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  impliedPowerTypeKeys = self->_impliedPowerTypeKeys;
  self->_impliedPowerTypeKeys = v4;

}

- (void)clearImpliedPowerTypeKeys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_impliedPowerTypeKeys, "removeAllObjects");
}

- (void)addImpliedPowerTypeKey:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLicensePlateValidationRule _readImpliedPowerTypeKeys]((uint64_t)self);
  -[GEOLPRLicensePlateValidationRule _addNoFlagsImpliedPowerTypeKey:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsImpliedPowerTypeKey:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)impliedPowerTypeKeysCount
{
  -[GEOLPRLicensePlateValidationRule _readImpliedPowerTypeKeys]((uint64_t)self);
  return -[NSMutableArray count](self->_impliedPowerTypeKeys, "count");
}

- (id)impliedPowerTypeKeyAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateValidationRule _readImpliedPowerTypeKeys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_impliedPowerTypeKeys, "objectAtIndex:", a3);
}

+ (Class)impliedPowerTypeKeyType
{
  return (Class)objc_opt_class();
}

- (void)_readImpliedVehicleTypeKeys
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
        GEOLPRLicensePlateValidationRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImpliedVehicleTypeKeys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)impliedVehicleTypeKeys
{
  -[GEOLPRLicensePlateValidationRule _readImpliedVehicleTypeKeys]((uint64_t)self);
  return self->_impliedVehicleTypeKeys;
}

- (void)setImpliedVehicleTypeKeys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *impliedVehicleTypeKeys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  impliedVehicleTypeKeys = self->_impliedVehicleTypeKeys;
  self->_impliedVehicleTypeKeys = v4;

}

- (void)clearImpliedVehicleTypeKeys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_impliedVehicleTypeKeys, "removeAllObjects");
}

- (void)addImpliedVehicleTypeKey:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLicensePlateValidationRule _readImpliedVehicleTypeKeys]((uint64_t)self);
  -[GEOLPRLicensePlateValidationRule _addNoFlagsImpliedVehicleTypeKey:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsImpliedVehicleTypeKey:(uint64_t)a1
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

- (unint64_t)impliedVehicleTypeKeysCount
{
  -[GEOLPRLicensePlateValidationRule _readImpliedVehicleTypeKeys]((uint64_t)self);
  return -[NSMutableArray count](self->_impliedVehicleTypeKeys, "count");
}

- (id)impliedVehicleTypeKeyAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateValidationRule _readImpliedVehicleTypeKeys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_impliedVehicleTypeKeys, "objectAtIndex:", a3);
}

+ (Class)impliedVehicleTypeKeyType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOLPRLicensePlateValidationRule;
  -[GEOLPRLicensePlateValidationRule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRLicensePlateValidationRule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLicensePlateValidationRule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "regularExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("regularExpression");
    else
      v6 = CFSTR("regular_expression");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_BYTE *)(a1 + 76);
  if ((v7 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("minLength");
    else
      v9 = CFSTR("min_length");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v7 = *(_BYTE *)(a1 + 76);
  }
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("maxLength");
    else
      v11 = CFSTR("max_length");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "validCharacters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("validCharacters");
    else
      v13 = CFSTR("valid_characters");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = *(id *)(a1 + 48);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation", (_QWORD)v28);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21, (_QWORD)v28);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("validationRanges");
    else
      v22 = CFSTR("validation_ranges");
    objc_msgSend(v4, "setObject:forKey:", v14, v22, (_QWORD)v28);

  }
  if (*(_QWORD *)(a1 + 16))
  {
    objc_msgSend((id)a1, "impliedPowerTypeKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("impliedPowerTypeKey");
    else
      v24 = CFSTR("implied_power_type_key");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend((id)a1, "impliedVehicleTypeKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("impliedVehicleTypeKey");
    else
      v26 = CFSTR("implied_vehicle_type_key");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRLicensePlateValidationRule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRLicensePlateValidationRule)initWithDictionary:(id)a3
{
  return (GEOLPRLicensePlateValidationRule *)-[GEOLPRLicensePlateValidationRule _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  GEOLPRValidationRange *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v46;
  id v47;
  __int128 v48;
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
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("regularExpression");
      else
        v6 = CFSTR("regular_expression");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setRegularExpression:", v8);

      }
      if (a3)
        v9 = CFSTR("minLength");
      else
        v9 = CFSTR("min_length");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMinLength:", objc_msgSend(v10, "unsignedIntValue"));

      if (a3)
        v11 = CFSTR("maxLength");
      else
        v11 = CFSTR("max_length");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMaxLength:", objc_msgSend(v12, "unsignedIntValue"));

      if (a3)
        v13 = CFSTR("validCharacters");
      else
        v13 = CFSTR("valid_characters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(a1, "setValidCharacters:", v15);

      }
      if (a3)
        v16 = CFSTR("validationRanges");
      else
        v16 = CFSTR("validation_ranges");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = v17;
        v47 = v5;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v57 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v24 = [GEOLPRValidationRange alloc];
                if ((a3 & 1) != 0)
                  v25 = -[GEOLPRValidationRange initWithJSON:](v24, "initWithJSON:", v23);
                else
                  v25 = -[GEOLPRValidationRange initWithDictionary:](v24, "initWithDictionary:", v23);
                v26 = (void *)v25;
                objc_msgSend(a1, "addValidationRanges:", v25, v46, v47);

              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
          }
          while (v20);
        }

        v17 = v46;
        v5 = v47;
      }

      if (a3)
        v27 = CFSTR("impliedPowerTypeKey");
      else
        v27 = CFSTR("implied_power_type_key");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27, v46, v47);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v53 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v35 = (void *)objc_msgSend(v34, "copy");
                objc_msgSend(a1, "addImpliedPowerTypeKey:", v35);

              }
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
          }
          while (v31);
        }

      }
      if (a3)
        v36 = CFSTR("impliedVehicleTypeKey");
      else
        v36 = CFSTR("implied_vehicle_type_key");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v38 = v37;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v49;
          do
          {
            for (k = 0; k != v40; ++k)
            {
              if (*(_QWORD *)v49 != v41)
                objc_enumerationMutation(v38);
              v43 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v44 = (void *)objc_msgSend(v43, "copy");
                objc_msgSend(a1, "addImpliedVehicleTypeKey:", v44);

              }
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
          }
          while (v40);
        }

      }
    }
  }

  return a1;
}

- (GEOLPRLicensePlateValidationRule)initWithJSON:(id)a3
{
  return (GEOLPRLicensePlateValidationRule *)-[GEOLPRLicensePlateValidationRule _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_58;
    else
      v8 = (int *)&readAll__nonRecursiveTag_58;
    GEOLPRLicensePlateValidationRuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLPRLicensePlateValidationRuleCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLicensePlateValidationRuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLicensePlateValidationRuleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  PBDataReader *v19;
  void *v20;
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
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 3u))
  {
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v20);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLPRLicensePlateValidationRule readAll:](self, "readAll:", 0);
    if (self->_regularExpression)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_validCharacters)
      PBDataWriterWriteStringField();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = self->_validationRanges;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v8);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = self->_impliedPowerTypeKeys;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteStringField();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v12);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = self->_impliedVehicleTypeKeys;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v22;
      do
      {
        for (k = 0; k != v16; ++k)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteStringField();
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v16);
    }

  }
}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  id *v17;

  v17 = (id *)a3;
  -[GEOLPRLicensePlateValidationRule readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 14) = self->_readerMarkPos;
  *((_DWORD *)v17 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_regularExpression)
    objc_msgSend(v17, "setRegularExpression:");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v17 + 18) = self->_minLength;
    *((_BYTE *)v17 + 76) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v17 + 17) = self->_maxLength;
    *((_BYTE *)v17 + 76) |= 1u;
  }
  if (self->_validCharacters)
    objc_msgSend(v17, "setValidCharacters:");
  if (-[GEOLPRLicensePlateValidationRule validationRangesCount](self, "validationRangesCount"))
  {
    objc_msgSend(v17, "clearValidationRanges");
    v5 = -[GEOLPRLicensePlateValidationRule validationRangesCount](self, "validationRangesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOLPRLicensePlateValidationRule validationRangesAtIndex:](self, "validationRangesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addValidationRanges:", v8);

      }
    }
  }
  if (-[GEOLPRLicensePlateValidationRule impliedPowerTypeKeysCount](self, "impliedPowerTypeKeysCount"))
  {
    objc_msgSend(v17, "clearImpliedPowerTypeKeys");
    v9 = -[GEOLPRLicensePlateValidationRule impliedPowerTypeKeysCount](self, "impliedPowerTypeKeysCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOLPRLicensePlateValidationRule impliedPowerTypeKeyAtIndex:](self, "impliedPowerTypeKeyAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addImpliedPowerTypeKey:", v12);

      }
    }
  }
  if (-[GEOLPRLicensePlateValidationRule impliedVehicleTypeKeysCount](self, "impliedVehicleTypeKeysCount"))
  {
    objc_msgSend(v17, "clearImpliedVehicleTypeKeys");
    v13 = -[GEOLPRLicensePlateValidationRule impliedVehicleTypeKeysCount](self, "impliedVehicleTypeKeysCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[GEOLPRLicensePlateValidationRule impliedVehicleTypeKeyAtIndex:](self, "impliedVehicleTypeKeyAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addImpliedVehicleTypeKey:", v16);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *v10;
  char flags;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
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
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
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
      GEOLPRLicensePlateValidationRuleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_30;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRLicensePlateValidationRule readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_regularExpression, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_minLength;
    *(_BYTE *)(v5 + 76) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_maxLength;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_validCharacters, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v14 = self->_validationRanges;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addValidationRanges:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v15);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = self->_impliedPowerTypeKeys;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addImpliedPowerTypeKey:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v20);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = self->_impliedVehicleTypeKeys;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v8);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v29);
        objc_msgSend((id)v5, "addImpliedVehicleTypeKey:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v24);
  }
LABEL_30:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *regularExpression;
  NSString *validCharacters;
  NSMutableArray *validationRanges;
  NSMutableArray *impliedPowerTypeKeys;
  NSMutableArray *impliedVehicleTypeKeys;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOLPRLicensePlateValidationRule readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  regularExpression = self->_regularExpression;
  if ((unint64_t)regularExpression | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](regularExpression, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_minLength != *((_DWORD *)v4 + 18))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_maxLength != *((_DWORD *)v4 + 17))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_22;
  }
  validCharacters = self->_validCharacters;
  if ((unint64_t)validCharacters | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](validCharacters, "isEqual:"))
  {
    goto LABEL_22;
  }
  validationRanges = self->_validationRanges;
  if ((unint64_t)validationRanges | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](validationRanges, "isEqual:"))
      goto LABEL_22;
  }
  impliedPowerTypeKeys = self->_impliedPowerTypeKeys;
  if ((unint64_t)impliedPowerTypeKeys | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](impliedPowerTypeKeys, "isEqual:"))
      goto LABEL_22;
  }
  impliedVehicleTypeKeys = self->_impliedVehicleTypeKeys;
  if ((unint64_t)impliedVehicleTypeKeys | *((_QWORD *)v4 + 3))
    v10 = -[NSMutableArray isEqual:](impliedVehicleTypeKeys, "isEqual:");
  else
    v10 = 1;
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOLPRLicensePlateValidationRule readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_regularExpression, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_minLength;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_maxLength;
LABEL_6:
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_validCharacters, "hash");
  v7 = -[NSMutableArray hash](self->_validationRanges, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_impliedPowerTypeKeys, "hash");
  return v6 ^ v8 ^ -[NSMutableArray hash](self->_impliedVehicleTypeKeys, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
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
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 4))
    -[GEOLPRLicensePlateValidationRule setRegularExpression:](self, "setRegularExpression:");
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 2) != 0)
  {
    self->_minLength = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v4 + 76);
  }
  if ((v5 & 1) != 0)
  {
    self->_maxLength = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
    -[GEOLPRLicensePlateValidationRule setValidCharacters:](self, "setValidCharacters:");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        -[GEOLPRLicensePlateValidationRule addValidationRanges:](self, "addValidationRanges:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = *((id *)v4 + 2);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        -[GEOLPRLicensePlateValidationRule addImpliedPowerTypeKey:](self, "addImpliedPowerTypeKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *((id *)v4 + 3);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[GEOLPRLicensePlateValidationRule addImpliedVehicleTypeKey:](self, "addImpliedVehicleTypeKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationRanges, 0);
  objc_storeStrong((id *)&self->_validCharacters, 0);
  objc_storeStrong((id *)&self->_regularExpression, 0);
  objc_storeStrong((id *)&self->_impliedVehicleTypeKeys, 0);
  objc_storeStrong((id *)&self->_impliedPowerTypeKeys, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
