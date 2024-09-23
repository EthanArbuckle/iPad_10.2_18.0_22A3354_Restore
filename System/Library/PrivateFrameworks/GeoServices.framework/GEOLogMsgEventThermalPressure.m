@implementation GEOLogMsgEventThermalPressure

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLogMsgEventThermalPressure;
  -[GEOLogMsgEventThermalPressure dealloc](&v3, sel_dealloc);
}

- (unsigned)thermalPressure
{
  return self->_thermalPressure;
}

- (void)setThermalPressure:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_thermalPressure = a3;
}

- (void)setHasThermalPressure:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasThermalPressure
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unint64_t)disableMapFeaturesCount
{
  return self->_disableMapFeatures.count;
}

- (int)disableMapFeatures
{
  return self->_disableMapFeatures.list;
}

- (void)clearDisableMapFeatures
{
  PBRepeatedInt32Clear();
}

- (void)addDisableMapFeatures:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)disableMapFeaturesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_disableMapFeatures;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_disableMapFeatures = &self->_disableMapFeatures;
  count = self->_disableMapFeatures.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_disableMapFeatures->list[a3];
}

- (void)setDisableMapFeatures:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)disableMapFeaturesAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C228B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDisableMapFeatures:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_FEATURE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_FEATURE_TREES")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_FEATURE_SHADOWS")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)navMapType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_navMapType;
  else
    return 0;
}

- (void)setNavMapType:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_navMapType = a3;
}

- (void)setHasNavMapType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNavMapType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)navMapTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C228C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNavMapType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_MAP_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_MAP_TYPE_MODERN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_MAP_TYPE_ADVANCED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_MAP_TYPE_MERCATOR")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)collectionTrigger
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_collectionTrigger;
  else
    return 0;
}

- (void)setCollectionTrigger:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_collectionTrigger = a3;
}

- (void)setHasCollectionTrigger:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCollectionTrigger
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)collectionTriggerAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C228E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCollectionTrigger:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION_TRIGGER_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION_TRIGGER_START_NAV")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION_TRIGGER_END_NAV")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION_TRIGGER_THERMAL_PRESSURE_DELTA")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CHARGING_STATE_CHANGE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)chargingState
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_chargingState;
  else
    return 0;
}

- (void)setChargingState:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_chargingState = a3;
}

- (void)setHasChargingState:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasChargingState
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)chargingStateAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C22910[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsChargingState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHARGING_STATE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHARGING_STATE_NOT_CHARGING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHARGING_STATE_WIRED_CHARGING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CHARGING_STATE_WIRELESS_CHARGING")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOLogMsgEventThermalPressure;
  -[GEOLogMsgEventThermalPressure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventThermalPressure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventThermalPressure _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  char v13;
  uint64_t v14;
  __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  const __CFString *v22;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 48) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 44));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("thermalPressure");
    else
      v6 = CFSTR("thermal_pressure");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 16))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_QWORD *)(a1 + 8);
    if (*(_QWORD *)(a1 + 16))
    {
      v9 = 0;
      do
      {
        v10 = *(int *)(*v8 + 4 * v9);
        if (v10 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = off_1E1C228B0[v10];
        }
        objc_msgSend(v7, "addObject:", v11);

        ++v9;
        v8 = (_QWORD *)(a1 + 8);
      }
      while (v9 < *(_QWORD *)(a1 + 16));
    }
    if (a2)
      v12 = CFSTR("disableMapFeatures");
    else
      v12 = CFSTR("disable_map_features");
    objc_msgSend(v4, "setObject:forKey:", v7, v12);

  }
  v13 = *(_BYTE *)(a1 + 48);
  if ((v13 & 4) != 0)
  {
    v14 = *(int *)(a1 + 40);
    if (v14 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 40));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E1C228C8[v14];
    }
    if (a2)
      v16 = CFSTR("navMapType");
    else
      v16 = CFSTR("nav_map_type");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v13 = *(_BYTE *)(a1 + 48);
    if ((v13 & 2) == 0)
    {
LABEL_20:
      if ((v13 & 1) == 0)
        return v4;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)(a1 + 48) & 2) == 0)
  {
    goto LABEL_20;
  }
  v17 = *(int *)(a1 + 36);
  if (v17 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 36));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_1E1C228E8[v17];
  }
  if (a2)
    v19 = CFSTR("collectionTrigger");
  else
    v19 = CFSTR("collection_trigger");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
LABEL_36:
    v20 = *(int *)(a1 + 32);
    if (v20 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E1C22910[v20];
    }
    if (a2)
      v22 = CFSTR("chargingState");
    else
      v22 = CFSTR("charging_state");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventThermalPressure _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventThermalPressure)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventThermalPressure *)-[GEOLogMsgEventThermalPressure _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("thermalPressure");
      else
        v6 = CFSTR("thermal_pressure");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setThermalPressure:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("disableMapFeatures");
      else
        v8 = CFSTR("disable_map_features");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = v5;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v31 = v9;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (!v11)
          goto LABEL_31;
        v12 = v11;
        v13 = *(_QWORD *)v34;
        while (1)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v34 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = v15;
              if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MAP_FEATURE_UNKNOWN")) & 1) != 0)
              {
                v17 = 0;
              }
              else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MAP_FEATURE_TREES")) & 1) != 0)
              {
                v17 = 1;
              }
              else if (objc_msgSend(v16, "isEqualToString:", CFSTR("MAP_FEATURE_SHADOWS")))
              {
                v17 = 2;
              }
              else
              {
                v17 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v17 = objc_msgSend(v15, "intValue");
            }
            objc_msgSend(a1, "addDisableMapFeatures:", v17);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (!v12)
          {
LABEL_31:

            v5 = v32;
            v9 = v31;
            break;
          }
        }
      }

      if (a3)
        v18 = CFSTR("navMapType");
      else
        v18 = CFSTR("nav_map_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v19;
        if ((objc_msgSend(v20, "isEqualToString:", CFSTR("NAV_MAP_TYPE_UNKNOWN")) & 1) != 0)
        {
          v21 = 0;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("NAV_MAP_TYPE_MODERN")) & 1) != 0)
        {
          v21 = 1;
        }
        else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("NAV_MAP_TYPE_ADVANCED")) & 1) != 0)
        {
          v21 = 2;
        }
        else if (objc_msgSend(v20, "isEqualToString:", CFSTR("NAV_MAP_TYPE_MERCATOR")))
        {
          v21 = 3;
        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_49;
        v21 = objc_msgSend(v19, "intValue");
      }
      objc_msgSend(a1, "setNavMapType:", v21);
LABEL_49:

      if (a3)
        v22 = CFSTR("collectionTrigger");
      else
        v22 = CFSTR("collection_trigger");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v23;
        if ((objc_msgSend(v24, "isEqualToString:", CFSTR("COLLECTION_TRIGGER_UNKNOWN")) & 1) != 0)
        {
          v25 = 0;
        }
        else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("COLLECTION_TRIGGER_START_NAV")) & 1) != 0)
        {
          v25 = 1;
        }
        else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("COLLECTION_TRIGGER_END_NAV")) & 1) != 0)
        {
          v25 = 2;
        }
        else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("COLLECTION_TRIGGER_THERMAL_PRESSURE_DELTA")) & 1) != 0)
        {
          v25 = 3;
        }
        else if (objc_msgSend(v24, "isEqualToString:", CFSTR("CHARGING_STATE_CHANGE")))
        {
          v25 = 4;
        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_68;
        v25 = objc_msgSend(v23, "intValue");
      }
      objc_msgSend(a1, "setCollectionTrigger:", v25);
LABEL_68:

      if (a3)
        v26 = CFSTR("chargingState");
      else
        v26 = CFSTR("charging_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = v27;
        if ((objc_msgSend(v28, "isEqualToString:", CFSTR("CHARGING_STATE_UNKNOWN")) & 1) != 0)
        {
          v29 = 0;
        }
        else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("CHARGING_STATE_NOT_CHARGING")) & 1) != 0)
        {
          v29 = 1;
        }
        else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("CHARGING_STATE_WIRED_CHARGING")) & 1) != 0)
        {
          v29 = 2;
        }
        else if (objc_msgSend(v28, "isEqualToString:", CFSTR("CHARGING_STATE_WIRELESS_CHARGING")))
        {
          v29 = 3;
        }
        else
        {
          v29 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_85:

          goto LABEL_86;
        }
        v29 = objc_msgSend(v27, "intValue");
      }
      objc_msgSend(a1, "setChargingState:", v29);
      goto LABEL_85;
    }
  }
LABEL_86:

  return a1;
}

- (GEOLogMsgEventThermalPressure)initWithJSON:(id)a3
{
  return (GEOLogMsgEventThermalPressure *)-[GEOLogMsgEventThermalPressure _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventThermalPressureIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventThermalPressureReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  char flags;
  id v7;

  v4 = a3;
  v7 = v4;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
  }
  if (self->_disableMapFeatures.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v7;
      ++v5;
    }
    while (v5 < self->_disableMapFeatures.count);
  }
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_8;
LABEL_12:
    PBDataWriterWriteInt32Field();
    v4 = v7;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v4 = v7;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_12;
LABEL_8:
  if ((flags & 1) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_10:

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  char flags;
  _DWORD *v8;

  v8 = a3;
  -[GEOLogMsgEventThermalPressure readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v8[11] = self->_thermalPressure;
    *((_BYTE *)v8 + 48) |= 8u;
  }
  if (-[GEOLogMsgEventThermalPressure disableMapFeaturesCount](self, "disableMapFeaturesCount"))
  {
    objc_msgSend(v8, "clearDisableMapFeatures");
    v4 = -[GEOLogMsgEventThermalPressure disableMapFeaturesCount](self, "disableMapFeaturesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v8, "addDisableMapFeatures:", -[GEOLogMsgEventThermalPressure disableMapFeaturesAtIndex:](self, "disableMapFeaturesAtIndex:", i));
    }
  }
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_9;
LABEL_13:
    v8[9] = self->_collectionTrigger;
    *((_BYTE *)v8 + 48) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v8[10] = self->_navMapType;
  *((_BYTE *)v8 + 48) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_13;
LABEL_9:
  if ((flags & 1) != 0)
  {
LABEL_10:
    v8[8] = self->_chargingState;
    *((_BYTE *)v8 + 48) |= 1u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v4 + 44) = self->_thermalPressure;
    *(_BYTE *)(v4 + 48) |= 8u;
  }
  PBRepeatedInt32Copy();
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v5 + 36) = self->_collectionTrigger;
    *(_BYTE *)(v5 + 48) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      return (id)v5;
    goto LABEL_6;
  }
  *(_DWORD *)(v5 + 40) = self->_navMapType;
  *(_BYTE *)(v5 + 48) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 32) = self->_chargingState;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOLogMsgEventThermalPressure readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_thermalPressure != *((_DWORD *)v4 + 11))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_22;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_22:
    v5 = 0;
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_navMapType != *((_DWORD *)v4 + 10))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_collectionTrigger != *((_DWORD *)v4 + 9))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_22;
  }
  v5 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_chargingState != *((_DWORD *)v4 + 8))
      goto LABEL_22;
    v5 = 1;
  }
LABEL_23:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOLogMsgEventThermalPressure readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v3 = 2654435761 * self->_thermalPressure;
  else
    v3 = 0;
  v4 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_7;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_navMapType;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761 * self->_collectionTrigger;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_10;
LABEL_7:
  v7 = 2654435761 * self->_chargingState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  char v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  if ((*((_BYTE *)v8 + 48) & 8) != 0)
  {
    self->_thermalPressure = *((_DWORD *)v8 + 11);
    *(_BYTE *)&self->_flags |= 8u;
  }
  v4 = objc_msgSend(v8, "disableMapFeaturesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOLogMsgEventThermalPressure addDisableMapFeatures:](self, "addDisableMapFeatures:", objc_msgSend(v8, "disableMapFeaturesAtIndex:", i));
  }
  v7 = *((_BYTE *)v8 + 48);
  if ((v7 & 4) == 0)
  {
    if ((*((_BYTE *)v8 + 48) & 2) == 0)
      goto LABEL_8;
LABEL_12:
    self->_collectionTrigger = *((_DWORD *)v8 + 9);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v8 + 48) & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  self->_navMapType = *((_DWORD *)v8 + 10);
  *(_BYTE *)&self->_flags |= 4u;
  v7 = *((_BYTE *)v8 + 48);
  if ((v7 & 2) != 0)
    goto LABEL_12;
LABEL_8:
  if ((v7 & 1) != 0)
  {
LABEL_9:
    self->_chargingState = *((_DWORD *)v8 + 8);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_10:

}

@end
