@implementation GEOLPRRegionInfo

- (GEOLPRRegionInfo)init
{
  GEOLPRRegionInfo *v2;
  GEOLPRRegionInfo *v3;
  GEOLPRRegionInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRRegionInfo;
  v2 = -[GEOLPRRegionInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRRegionInfo)initWithData:(id)a3
{
  GEOLPRRegionInfo *v3;
  GEOLPRRegionInfo *v4;
  GEOLPRRegionInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRRegionInfo;
  v3 = -[GEOLPRRegionInfo initWithData:](&v7, sel_initWithData_, a3);
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
  v3.receiver = self;
  v3.super_class = (Class)GEOLPRRegionInfo;
  -[GEOLPRRegionInfo dealloc](&v3, sel_dealloc);
}

- (void)_readRoutingRequiredFields
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutingRequiredFields_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (unint64_t)routingRequiredFieldsCount
{
  -[GEOLPRRegionInfo _readRoutingRequiredFields]((uint64_t)self);
  return self->_routingRequiredFields.count;
}

- (int)routingRequiredFields
{
  -[GEOLPRRegionInfo _readRoutingRequiredFields]((uint64_t)self);
  return self->_routingRequiredFields.list;
}

- (void)clearRoutingRequiredFields
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedInt32Clear();
}

- (void)addRoutingRequiredFields:(int)a3
{
  -[GEOLPRRegionInfo _readRoutingRequiredFields]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (int)routingRequiredFieldsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_routingRequiredFields;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOLPRRegionInfo _readRoutingRequiredFields]((uint64_t)self);
  p_routingRequiredFields = &self->_routingRequiredFields;
  count = self->_routingRequiredFields.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_routingRequiredFields->list[a3];
}

- (void)setRoutingRequiredFields:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedInt32Set();
}

- (id)routingRequiredFieldsAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E1C11B00[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRoutingRequiredFields:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LICENSE_PLATE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POWER_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VEHICLE_TYPE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_readValidPowerTypeKeys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readValidPowerTypeKeys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)validPowerTypeKeys
{
  -[GEOLPRRegionInfo _readValidPowerTypeKeys]((uint64_t)self);
  return self->_validPowerTypeKeys;
}

- (void)setValidPowerTypeKeys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *validPowerTypeKeys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  validPowerTypeKeys = self->_validPowerTypeKeys;
  self->_validPowerTypeKeys = v4;

}

- (void)clearValidPowerTypeKeys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_validPowerTypeKeys, "removeAllObjects");
}

- (void)addValidPowerTypeKeys:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRRegionInfo _readValidPowerTypeKeys]((uint64_t)self);
  -[GEOLPRRegionInfo _addNoFlagsValidPowerTypeKeys:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsValidPowerTypeKeys:(uint64_t)a1
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

- (unint64_t)validPowerTypeKeysCount
{
  -[GEOLPRRegionInfo _readValidPowerTypeKeys]((uint64_t)self);
  return -[NSMutableArray count](self->_validPowerTypeKeys, "count");
}

- (id)validPowerTypeKeysAtIndex:(unint64_t)a3
{
  -[GEOLPRRegionInfo _readValidPowerTypeKeys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_validPowerTypeKeys, "objectAtIndex:", a3);
}

+ (Class)validPowerTypeKeysType
{
  return (Class)objc_opt_class();
}

- (void)_readValidVehicleTypeKeys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRRegionInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readValidVehicleTypeKeys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)validVehicleTypeKeys
{
  -[GEOLPRRegionInfo _readValidVehicleTypeKeys]((uint64_t)self);
  return self->_validVehicleTypeKeys;
}

- (void)setValidVehicleTypeKeys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *validVehicleTypeKeys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  validVehicleTypeKeys = self->_validVehicleTypeKeys;
  self->_validVehicleTypeKeys = v4;

}

- (void)clearValidVehicleTypeKeys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_validVehicleTypeKeys, "removeAllObjects");
}

- (void)addValidVehicleTypeKeys:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRRegionInfo _readValidVehicleTypeKeys]((uint64_t)self);
  -[GEOLPRRegionInfo _addNoFlagsValidVehicleTypeKeys:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsValidVehicleTypeKeys:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)validVehicleTypeKeysCount
{
  -[GEOLPRRegionInfo _readValidVehicleTypeKeys]((uint64_t)self);
  return -[NSMutableArray count](self->_validVehicleTypeKeys, "count");
}

- (id)validVehicleTypeKeysAtIndex:(unint64_t)a3
{
  -[GEOLPRRegionInfo _readValidVehicleTypeKeys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_validVehicleTypeKeys, "objectAtIndex:", a3);
}

+ (Class)validVehicleTypeKeysType
{
  return (Class)objc_opt_class();
}

- (void)_readLicensePlateTemplate
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
        GEOLPRRegionInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLicensePlateTemplate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasLicensePlateTemplate
{
  -[GEOLPRRegionInfo _readLicensePlateTemplate]((uint64_t)self);
  return self->_licensePlateTemplate != 0;
}

- (NSString)licensePlateTemplate
{
  -[GEOLPRRegionInfo _readLicensePlateTemplate]((uint64_t)self);
  return self->_licensePlateTemplate;
}

- (void)setLicensePlateTemplate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_licensePlateTemplate, a3);
}

- (void)_readLicensePlateValidationRules
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
        GEOLPRRegionInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLicensePlateValidationRules_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)licensePlateValidationRules
{
  -[GEOLPRRegionInfo _readLicensePlateValidationRules]((uint64_t)self);
  return self->_licensePlateValidationRules;
}

- (void)setLicensePlateValidationRules:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *licensePlateValidationRules;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  licensePlateValidationRules = self->_licensePlateValidationRules;
  self->_licensePlateValidationRules = v4;

}

- (void)clearLicensePlateValidationRules
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_licensePlateValidationRules, "removeAllObjects");
}

- (void)addLicensePlateValidationRules:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRRegionInfo _readLicensePlateValidationRules]((uint64_t)self);
  -[GEOLPRRegionInfo _addNoFlagsLicensePlateValidationRules:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsLicensePlateValidationRules:(uint64_t)a1
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

- (unint64_t)licensePlateValidationRulesCount
{
  -[GEOLPRRegionInfo _readLicensePlateValidationRules]((uint64_t)self);
  return -[NSMutableArray count](self->_licensePlateValidationRules, "count");
}

- (id)licensePlateValidationRulesAtIndex:(unint64_t)a3
{
  -[GEOLPRRegionInfo _readLicensePlateValidationRules]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_licensePlateValidationRules, "objectAtIndex:", a3);
}

+ (Class)licensePlateValidationRulesType
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
  v8.super_class = (Class)GEOLPRRegionInfo;
  -[GEOLPRRegionInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRRegionInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRRegionInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const __CFString *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v7 = 0;
      do
      {
        v8 = *(unsigned int *)(*v6 + 4 * v7);
        if ((v8 - 1) >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E1C11B00[(int)v8 - 1];
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = (_QWORD *)(a1 + 16);
      }
      while (v7 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v10 = CFSTR("routingRequiredFields");
    else
      v10 = CFSTR("routing_required_fields");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend((id)a1, "validPowerTypeKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("validPowerTypeKeys");
    else
      v12 = CFSTR("valid_power_type_keys");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend((id)a1, "validVehicleTypeKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("validVehicleTypeKeys");
    else
      v14 = CFSTR("valid_vehicle_type_keys");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend((id)a1, "licensePlateTemplate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (a2)
      v16 = CFSTR("licensePlateTemplate");
    else
      v16 = CFSTR("license_plate_template");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);
  }

  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = *(id *)(a1 + 48);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("licensePlateValidationRules");
    else
      v25 = CFSTR("license_plate_validation_rules");
    objc_msgSend(v4, "setObject:forKey:", v17, v25);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRRegionInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRRegionInfo)initWithDictionary:(id)a3
{
  return (GEOLPRRegionInfo *)-[GEOLPRRegionInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  uint64_t v44;
  GEOLPRLicensePlateValidationRule *v45;
  uint64_t v46;
  void *v47;
  void *v49;
  id v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v5 = (void *)objc_msgSend(a1, "init");
    if (v5)
    {
      if (a3)
        v6 = CFSTR("routingRequiredFields");
      else
        v6 = CFSTR("routing_required_fields");
      objc_msgSend(v4, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v50 = v4;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v49 = v7;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
        if (!v9)
          goto LABEL_26;
        v10 = v9;
        v11 = *(_QWORD *)v65;
        while (1)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v65 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = v13;
              if ((objc_msgSend(v14, "isEqualToString:", CFSTR("LICENSE_PLATE")) & 1) != 0)
              {
                v15 = 1;
              }
              else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("POWER_TYPE")) & 1) != 0)
              {
                v15 = 2;
              }
              else if (objc_msgSend(v14, "isEqualToString:", CFSTR("VEHICLE_TYPE")))
              {
                v15 = 3;
              }
              else
              {
                v15 = 1;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v15 = objc_msgSend(v13, "intValue");
            }
            objc_msgSend(v5, "addRoutingRequiredFields:", v15);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
          if (!v10)
          {
LABEL_26:

            v7 = v49;
            v4 = v50;
            break;
          }
        }
      }

      if (a3)
        v16 = CFSTR("validPowerTypeKeys");
      else
        v16 = CFSTR("valid_power_type_keys");
      objc_msgSend(v4, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v61;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v61 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v24 = (void *)objc_msgSend(v23, "copy");
                objc_msgSend(v5, "addValidPowerTypeKeys:", v24);

              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
          }
          while (v20);
        }

      }
      if (a3)
        v25 = CFSTR("validVehicleTypeKeys");
      else
        v25 = CFSTR("valid_vehicle_type_keys");
      objc_msgSend(v4, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v57;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v57 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = (void *)objc_msgSend(v32, "copy");
                objc_msgSend(v5, "addValidVehicleTypeKeys:", v33);

              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
          }
          while (v29);
        }

      }
      if (a3)
        v34 = CFSTR("licensePlateTemplate");
      else
        v34 = CFSTR("license_plate_template");
      objc_msgSend(v4, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = (void *)objc_msgSend(v35, "copy");
        objc_msgSend(v5, "setLicensePlateTemplate:", v36);

      }
      if (a3)
        v37 = CFSTR("licensePlateValidationRules");
      else
        v37 = CFSTR("license_plate_validation_rules");
      objc_msgSend(v4, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v39 = v38;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v53;
          do
          {
            for (m = 0; m != v41; ++m)
            {
              if (*(_QWORD *)v53 != v42)
                objc_enumerationMutation(v39);
              v44 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v45 = [GEOLPRLicensePlateValidationRule alloc];
                if ((a3 & 1) != 0)
                  v46 = -[GEOLPRLicensePlateValidationRule initWithJSON:](v45, "initWithJSON:", v44);
                else
                  v46 = -[GEOLPRLicensePlateValidationRule initWithDictionary:](v45, "initWithDictionary:", v44);
                v47 = (void *)v46;
                objc_msgSend(v5, "addLicensePlateValidationRules:", v46);

              }
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
          }
          while (v41);
        }

        v4 = v50;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEOLPRRegionInfo)initWithJSON:(id)a3
{
  return (GEOLPRRegionInfo *)-[GEOLPRRegionInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_332;
    else
      v8 = (int *)&readAll__nonRecursiveTag_333;
    GEOLPRRegionInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLPRRegionInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRRegionInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRRegionInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
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
  if (self->_reader && (_GEOLPRRegionInfoIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOLPRRegionInfo readAll:](self, "readAll:", 0);
    if (self->_routingRequiredFields.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_routingRequiredFields.count);
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = self->_validPowerTypeKeys;
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
          PBDataWriterWriteStringField();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v8);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = self->_validVehicleTypeKeys;
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

    if (self->_licensePlateTemplate)
      PBDataWriterWriteStringField();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = self->_licensePlateValidationRules;
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
          PBDataWriterWriteSubmessage();
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v16);
    }

  }
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  void *v18;
  id *v19;

  v19 = (id *)a3;
  -[GEOLPRRegionInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v19 + 1, self->_reader);
  *((_DWORD *)v19 + 18) = self->_readerMarkPos;
  *((_DWORD *)v19 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLPRRegionInfo routingRequiredFieldsCount](self, "routingRequiredFieldsCount"))
  {
    objc_msgSend(v19, "clearRoutingRequiredFields");
    v4 = -[GEOLPRRegionInfo routingRequiredFieldsCount](self, "routingRequiredFieldsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v19, "addRoutingRequiredFields:", -[GEOLPRRegionInfo routingRequiredFieldsAtIndex:](self, "routingRequiredFieldsAtIndex:", i));
    }
  }
  if (-[GEOLPRRegionInfo validPowerTypeKeysCount](self, "validPowerTypeKeysCount"))
  {
    objc_msgSend(v19, "clearValidPowerTypeKeys");
    v7 = -[GEOLPRRegionInfo validPowerTypeKeysCount](self, "validPowerTypeKeysCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[GEOLPRRegionInfo validPowerTypeKeysAtIndex:](self, "validPowerTypeKeysAtIndex:", j);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addValidPowerTypeKeys:", v10);

      }
    }
  }
  if (-[GEOLPRRegionInfo validVehicleTypeKeysCount](self, "validVehicleTypeKeysCount"))
  {
    objc_msgSend(v19, "clearValidVehicleTypeKeys");
    v11 = -[GEOLPRRegionInfo validVehicleTypeKeysCount](self, "validVehicleTypeKeysCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
      {
        -[GEOLPRRegionInfo validVehicleTypeKeysAtIndex:](self, "validVehicleTypeKeysAtIndex:", k);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addValidVehicleTypeKeys:", v14);

      }
    }
  }
  if (self->_licensePlateTemplate)
    objc_msgSend(v19, "setLicensePlateTemplate:");
  if (-[GEOLPRRegionInfo licensePlateValidationRulesCount](self, "licensePlateValidationRulesCount"))
  {
    objc_msgSend(v19, "clearLicensePlateValidationRules");
    v15 = -[GEOLPRRegionInfo licensePlateValidationRulesCount](self, "licensePlateValidationRulesCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
      {
        -[GEOLPRRegionInfo licensePlateValidationRulesAtIndex:](self, "licensePlateValidationRulesAtIndex:", m);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addLicensePlateValidationRules:", v18);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
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
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOLPRRegionInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRRegionInfo readAll:](self, "readAll:", 0);
  PBRepeatedInt32Copy();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = self->_validPowerTypeKeys;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
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
        objc_msgSend(v5, "addValidPowerTypeKeys:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v9);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = self->_validVehicleTypeKeys;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v5, "addValidVehicleTypeKeys:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_licensePlateTemplate, "copyWithZone:", a3);
  v19 = (void *)v5[5];
  v5[5] = v18;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = self->_licensePlateValidationRules;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend(v5, "addLicensePlateValidationRules:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v21);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *validPowerTypeKeys;
  NSMutableArray *validVehicleTypeKeys;
  NSString *licensePlateTemplate;
  NSMutableArray *licensePlateValidationRules;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOLPRRegionInfo readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedInt32IsEqual())
    && ((validPowerTypeKeys = self->_validPowerTypeKeys, !((unint64_t)validPowerTypeKeys | v4[7]))
     || -[NSMutableArray isEqual:](validPowerTypeKeys, "isEqual:"))
    && ((validVehicleTypeKeys = self->_validVehicleTypeKeys, !((unint64_t)validVehicleTypeKeys | v4[8]))
     || -[NSMutableArray isEqual:](validVehicleTypeKeys, "isEqual:"))
    && ((licensePlateTemplate = self->_licensePlateTemplate, !((unint64_t)licensePlateTemplate | v4[5]))
     || -[NSString isEqual:](licensePlateTemplate, "isEqual:")))
  {
    licensePlateValidationRules = self->_licensePlateValidationRules;
    if ((unint64_t)licensePlateValidationRules | v4[6])
      v9 = -[NSMutableArray isEqual:](licensePlateValidationRules, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  -[GEOLPRRegionInfo readAll:](self, "readAll:", 1);
  v3 = PBRepeatedInt32Hash();
  v4 = -[NSMutableArray hash](self->_validPowerTypeKeys, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_validVehicleTypeKeys, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_licensePlateTemplate, "hash");
  return v6 ^ -[NSMutableArray hash](self->_licensePlateValidationRules, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
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
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = objc_msgSend(v4, "routingRequiredFieldsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[GEOLPRRegionInfo addRoutingRequiredFields:](self, "addRoutingRequiredFields:", objc_msgSend(v4, "routingRequiredFieldsAtIndex:", i));
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v4[7];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        -[GEOLPRRegionInfo addValidPowerTypeKeys:](self, "addValidPowerTypeKeys:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v10);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v4[8];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        -[GEOLPRRegionInfo addValidVehicleTypeKeys:](self, "addValidVehicleTypeKeys:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v15);
  }

  if (v4[5])
    -[GEOLPRRegionInfo setLicensePlateTemplate:](self, "setLicensePlateTemplate:");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v4[6];
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (m = 0; m != v20; ++m)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        -[GEOLPRRegionInfo addLicensePlateValidationRules:](self, "addLicensePlateValidationRules:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * m), (_QWORD)v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v20);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validVehicleTypeKeys, 0);
  objc_storeStrong((id *)&self->_validPowerTypeKeys, 0);
  objc_storeStrong((id *)&self->_licensePlateValidationRules, 0);
  objc_storeStrong((id *)&self->_licensePlateTemplate, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
