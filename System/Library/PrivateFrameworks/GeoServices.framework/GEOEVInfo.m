@implementation GEOEVInfo

- (GEOEVInfo)init
{
  GEOEVInfo *v2;
  GEOEVInfo *v3;
  GEOEVInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOEVInfo;
  v2 = -[GEOEVInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOEVInfo)initWithData:(id)a3
{
  GEOEVInfo *v3;
  GEOEVInfo *v4;
  GEOEVInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOEVInfo;
  v3 = -[GEOEVInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)currentBatteryPercentage
{
  return self->_currentBatteryPercentage;
}

- (void)setCurrentBatteryPercentage:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8004u;
  self->_currentBatteryPercentage = a3;
}

- (void)setHasCurrentBatteryPercentage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32764;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasCurrentBatteryPercentage
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)maxRange
{
  return self->_maxRange;
}

- (void)setMaxRange:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8040u;
  self->_maxRange = a3;
}

- (void)setHasMaxRange:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32704;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasMaxRange
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (void)_readConsumptionArguments
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 112) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOEVInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readConsumptionArguments_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasConsumptionArguments
{
  -[GEOEVInfo _readConsumptionArguments]((uint64_t)self);
  return self->_consumptionArguments != 0;
}

- (NSString)consumptionArguments
{
  -[GEOEVInfo _readConsumptionArguments]((uint64_t)self);
  return self->_consumptionArguments;
}

- (void)setConsumptionArguments:(id)a3
{
  *(_WORD *)&self->_flags |= 0x9000u;
  objc_storeStrong((id *)&self->_consumptionArguments, a3);
}

- (void)_readChargingArguments
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 112) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOEVInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChargingArguments_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasChargingArguments
{
  -[GEOEVInfo _readChargingArguments]((uint64_t)self);
  return self->_chargingArguments != 0;
}

- (NSString)chargingArguments
{
  -[GEOEVInfo _readChargingArguments]((uint64_t)self);
  return self->_chargingArguments;
}

- (void)setChargingArguments:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8800u;
  objc_storeStrong((id *)&self->_chargingArguments, a3);
}

- (unsigned)currentBatteryCharge
{
  return self->_currentBatteryCharge;
}

- (void)setCurrentBatteryCharge:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8002u;
  self->_currentBatteryCharge = a3;
}

- (void)setHasCurrentBatteryCharge:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32766;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasCurrentBatteryCharge
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unsigned)maxBatteryCharge
{
  return self->_maxBatteryCharge;
}

- (void)setMaxBatteryCharge:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8020u;
  self->_maxBatteryCharge = a3;
}

- (void)setHasMaxBatteryCharge:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32736;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasMaxBatteryCharge
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (void)setIsCharging:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x8100u;
  self->_isCharging = a3;
}

- (void)setHasIsCharging:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32512;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasIsCharging
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (unsigned)minBatteryCharge
{
  return self->_minBatteryCharge;
}

- (void)setMinBatteryCharge:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8080u;
  self->_minBatteryCharge = a3;
}

- (void)setHasMinBatteryCharge:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32640;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasMinBatteryCharge
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)_readVehicleIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 112) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOEVInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehicleIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasVehicleIdentifier
{
  -[GEOEVInfo _readVehicleIdentifier]((uint64_t)self);
  return self->_vehicleIdentifier != 0;
}

- (NSString)vehicleIdentifier
{
  -[GEOEVInfo _readVehicleIdentifier]((uint64_t)self);
  return self->_vehicleIdentifier;
}

- (void)setVehicleIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC000u;
  objc_storeStrong((id *)&self->_vehicleIdentifier, a3);
}

- (void)_readChargerPlugsInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOEVInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChargerPlugsInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasChargerPlugsInfo
{
  -[GEOEVInfo _readChargerPlugsInfo]((uint64_t)self);
  return self->_chargerPlugsInfo != 0;
}

- (GEOChargerPlugsInfo)chargerPlugsInfo
{
  -[GEOEVInfo _readChargerPlugsInfo]((uint64_t)self);
  return self->_chargerPlugsInfo;
}

- (void)setChargerPlugsInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8400u;
  objc_storeStrong((id *)&self->_chargerPlugsInfo, a3);
}

- (unsigned)lastSocUpdateDate
{
  return self->_lastSocUpdateDate;
}

- (void)setLastSocUpdateDate:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8008u;
  self->_lastSocUpdateDate = a3;
}

- (void)setHasLastSocUpdateDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32760;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLastSocUpdateDate
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)lowBatteryCharge
{
  return self->_lowBatteryCharge;
}

- (void)setLowBatteryCharge:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8010u;
  self->_lowBatteryCharge = a3;
}

- (void)setHasLowBatteryCharge:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32752;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasLowBatteryCharge
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)criticalBatteryCharge
{
  return self->_criticalBatteryCharge;
}

- (void)setCriticalBatteryCharge:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x8001u;
  self->_criticalBatteryCharge = a3;
}

- (void)setHasCriticalBatteryCharge:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0x7FFE | a3 | 0x8000;
}

- (BOOL)hasCriticalBatteryCharge
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readVehicleArguments
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 112) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOEVInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehicleArguments_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasVehicleArguments
{
  -[GEOEVInfo _readVehicleArguments]((uint64_t)self);
  return self->_vehicleArguments != 0;
}

- (NSString)vehicleArguments
{
  -[GEOEVInfo _readVehicleArguments]((uint64_t)self);
  return self->_vehicleArguments;
}

- (void)setVehicleArguments:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA000u;
  objc_storeStrong((id *)&self->_vehicleArguments, a3);
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
  v8.super_class = (Class)GEOEVInfo;
  -[GEOEVInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOEVInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOEVInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  _QWORD v45[4];
  id v46;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 112);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("currentBatteryPercentage");
    else
      v7 = CFSTR("current_battery_percentage");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_WORD *)(a1 + 112);
  }
  if ((v5 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 100));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("maxRange");
    else
      v9 = CFSTR("max_range");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  objc_msgSend((id)a1, "consumptionArguments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("consumptionArguments");
    else
      v11 = CFSTR("consumption_arguments");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  objc_msgSend((id)a1, "chargingArguments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("chargingArguments");
    else
      v13 = CFSTR("charging_arguments");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  v14 = *(_WORD *)(a1 + 112);
  if ((v14 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("currentBatteryCharge");
    else
      v24 = CFSTR("current_battery_charge");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    v14 = *(_WORD *)(a1 + 112);
    if ((v14 & 0x20) == 0)
    {
LABEL_24:
      if ((v14 & 0x100) == 0)
        goto LABEL_25;
      goto LABEL_46;
    }
  }
  else if ((v14 & 0x20) == 0)
  {
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 96));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v26 = CFSTR("maxBatteryCharge");
  else
    v26 = CFSTR("max_battery_charge");
  objc_msgSend(v4, "setObject:forKey:", v25, v26);

  v14 = *(_WORD *)(a1 + 112);
  if ((v14 & 0x100) == 0)
  {
LABEL_25:
    if ((v14 & 0x80) == 0)
      goto LABEL_30;
    goto LABEL_26;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 108));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v28 = CFSTR("isCharging");
  else
    v28 = CFSTR("is_charging");
  objc_msgSend(v4, "setObject:forKey:", v27, v28);

  if ((*(_WORD *)(a1 + 112) & 0x80) != 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 104));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("minBatteryCharge");
    else
      v16 = CFSTR("min_battery_charge");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
LABEL_30:
  objc_msgSend((id)a1, "vehicleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (a2)
      v18 = CFSTR("vehicleIdentifier");
    else
      v18 = CFSTR("vehicle_identifier");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  objc_msgSend((id)a1, "chargerPlugsInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("chargerPlugsInfo");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("charger_plugs_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  v29 = *(_WORD *)(a1 + 112);
  if ((v29 & 8) == 0)
  {
    if ((v29 & 0x10) == 0)
      goto LABEL_55;
LABEL_75:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v44 = CFSTR("lowBatteryCharge");
    else
      v44 = CFSTR("low_battery_charge");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

    if ((*(_WORD *)(a1 + 112) & 1) == 0)
      goto LABEL_60;
    goto LABEL_56;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v42 = CFSTR("lastSocUpdateDate");
  else
    v42 = CFSTR("last_soc_update_date");
  objc_msgSend(v4, "setObject:forKey:", v41, v42);

  v29 = *(_WORD *)(a1 + 112);
  if ((v29 & 0x10) != 0)
    goto LABEL_75;
LABEL_55:
  if ((v29 & 1) != 0)
  {
LABEL_56:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v31 = CFSTR("criticalBatteryCharge");
    else
      v31 = CFSTR("critical_battery_charge");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
LABEL_60:
  objc_msgSend((id)a1, "vehicleArguments");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    if (a2)
      v33 = CFSTR("vehicleArguments");
    else
      v33 = CFSTR("vehicle_arguments");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);
  }

  v34 = *(void **)(a1 + 16);
  if (v34)
  {
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v35, "count"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __39__GEOEVInfo__dictionaryRepresentation___block_invoke;
      v45[3] = &unk_1E1C00600;
      v38 = v37;
      v46 = v38;
      objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v45);
      v39 = v38;

      v36 = v39;
    }
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOEVInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __39__GEOEVInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOEVInfo)initWithDictionary:(id)a3
{
  return (GEOEVInfo *)-[GEOEVInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  GEOChargerPlugsInfo *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("currentBatteryPercentage");
      else
        v6 = CFSTR("current_battery_percentage");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCurrentBatteryPercentage:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("maxRange");
      else
        v8 = CFSTR("max_range");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMaxRange:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("consumptionArguments");
      else
        v10 = CFSTR("consumption_arguments");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(a1, "setConsumptionArguments:", v12);

      }
      if (a3)
        v13 = CFSTR("chargingArguments");
      else
        v13 = CFSTR("charging_arguments");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(a1, "setChargingArguments:", v15);

      }
      if (a3)
        v16 = CFSTR("currentBatteryCharge");
      else
        v16 = CFSTR("current_battery_charge");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCurrentBatteryCharge:", objc_msgSend(v17, "unsignedIntValue"));

      if (a3)
        v18 = CFSTR("maxBatteryCharge");
      else
        v18 = CFSTR("max_battery_charge");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMaxBatteryCharge:", objc_msgSend(v19, "unsignedIntValue"));

      if (a3)
        v20 = CFSTR("isCharging");
      else
        v20 = CFSTR("is_charging");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsCharging:", objc_msgSend(v21, "BOOLValue"));

      if (a3)
        v22 = CFSTR("minBatteryCharge");
      else
        v22 = CFSTR("min_battery_charge");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMinBatteryCharge:", objc_msgSend(v23, "unsignedIntValue"));

      if (a3)
        v24 = CFSTR("vehicleIdentifier");
      else
        v24 = CFSTR("vehicle_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = (void *)objc_msgSend(v25, "copy");
        objc_msgSend(a1, "setVehicleIdentifier:", v26);

      }
      if (a3)
        v27 = CFSTR("chargerPlugsInfo");
      else
        v27 = CFSTR("charger_plugs_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = [GEOChargerPlugsInfo alloc];
        if ((a3 & 1) != 0)
          v30 = -[GEOChargerPlugsInfo initWithJSON:](v29, "initWithJSON:", v28);
        else
          v30 = -[GEOChargerPlugsInfo initWithDictionary:](v29, "initWithDictionary:", v28);
        v31 = (void *)v30;
        objc_msgSend(a1, "setChargerPlugsInfo:", v30);

      }
      if (a3)
        v32 = CFSTR("lastSocUpdateDate");
      else
        v32 = CFSTR("last_soc_update_date");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLastSocUpdateDate:", objc_msgSend(v33, "unsignedIntValue"));

      if (a3)
        v34 = CFSTR("lowBatteryCharge");
      else
        v34 = CFSTR("low_battery_charge");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLowBatteryCharge:", objc_msgSend(v35, "unsignedIntValue"));

      if (a3)
        v36 = CFSTR("criticalBatteryCharge");
      else
        v36 = CFSTR("critical_battery_charge");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCriticalBatteryCharge:", objc_msgSend(v37, "unsignedIntValue"));

      if (a3)
        v38 = CFSTR("vehicleArguments");
      else
        v38 = CFSTR("vehicle_arguments");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = (void *)objc_msgSend(v39, "copy");
        objc_msgSend(a1, "setVehicleArguments:", v40);

      }
    }
  }

  return a1;
}

- (GEOEVInfo)initWithJSON:(id)a3
{
  return (GEOEVInfo *)-[GEOEVInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1523;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1524;
    GEOEVInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOChargerPlugsInfo readAll:](self->_chargerPlugsInfo, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOEVInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOEVInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  id v6;
  __int16 v7;
  __int16 v8;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOEVInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "writeData:", v10);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    goto LABEL_35;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOEVInfo readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (__int16)self->_flags;
  }
  v6 = v11;
  if ((flags & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v11;
  }
  if (self->_consumptionArguments)
  {
    PBDataWriterWriteStringField();
    v6 = v11;
  }
  if (self->_chargingArguments)
  {
    PBDataWriterWriteStringField();
    v6 = v11;
  }
  v7 = (__int16)self->_flags;
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v11;
    v7 = (__int16)self->_flags;
    if ((v7 & 0x20) == 0)
    {
LABEL_13:
      if ((v7 & 0x100) == 0)
        goto LABEL_14;
      goto LABEL_29;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  v6 = v11;
  v7 = (__int16)self->_flags;
  if ((v7 & 0x100) == 0)
  {
LABEL_14:
    if ((v7 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  v6 = v11;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_15:
    PBDataWriterWriteUint32Field();
    v6 = v11;
  }
LABEL_16:
  if (self->_vehicleIdentifier)
  {
    PBDataWriterWriteStringField();
    v6 = v11;
  }
  if (self->_chargerPlugsInfo)
  {
    PBDataWriterWriteSubmessage();
    v6 = v11;
  }
  v8 = (__int16)self->_flags;
  if ((v8 & 8) == 0)
  {
    if ((v8 & 0x10) == 0)
      goto LABEL_22;
LABEL_32:
    PBDataWriterWriteUint32Field();
    v6 = v11;
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
  PBDataWriterWriteUint32Field();
  v6 = v11;
  v8 = (__int16)self->_flags;
  if ((v8 & 0x10) != 0)
    goto LABEL_32;
LABEL_22:
  if ((v8 & 1) != 0)
  {
LABEL_23:
    PBDataWriterWriteUint32Field();
    v6 = v11;
  }
LABEL_24:
  if (self->_vehicleArguments)
  {
    PBDataWriterWriteStringField();
    v6 = v11;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_35:

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  __int16 v6;
  __int16 v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOEVInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v8;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v8 + 21) = self->_currentBatteryPercentage;
    *((_WORD *)v8 + 56) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 0x40) != 0)
  {
    *((_DWORD *)v8 + 25) = self->_maxRange;
    *((_WORD *)v8 + 56) |= 0x40u;
  }
  if (self->_consumptionArguments)
  {
    objc_msgSend(v8, "setConsumptionArguments:");
    v4 = v8;
  }
  if (self->_chargingArguments)
  {
    objc_msgSend(v8, "setChargingArguments:");
    v4 = v8;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_currentBatteryCharge;
    *((_WORD *)v4 + 56) |= 2u;
    v6 = (__int16)self->_flags;
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 0x100) == 0)
        goto LABEL_12;
      goto LABEL_27;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v4 + 24) = self->_maxBatteryCharge;
  *((_WORD *)v4 + 56) |= 0x20u;
  v6 = (__int16)self->_flags;
  if ((v6 & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_27:
  *((_BYTE *)v4 + 108) = self->_isCharging;
  *((_WORD *)v4 + 56) |= 0x100u;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 26) = self->_minBatteryCharge;
    *((_WORD *)v4 + 56) |= 0x80u;
  }
LABEL_14:
  if (self->_vehicleIdentifier)
  {
    objc_msgSend(v8, "setVehicleIdentifier:");
    v4 = v8;
  }
  if (self->_chargerPlugsInfo)
  {
    objc_msgSend(v8, "setChargerPlugsInfo:");
    v4 = v8;
  }
  v7 = (__int16)self->_flags;
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_lastSocUpdateDate;
    *((_WORD *)v4 + 56) |= 8u;
    v7 = (__int16)self->_flags;
    if ((v7 & 0x10) == 0)
    {
LABEL_20:
      if ((v7 & 1) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_20;
  }
  *((_DWORD *)v4 + 23) = self->_lowBatteryCharge;
  *((_WORD *)v4 + 56) |= 0x10u;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
LABEL_21:
    *((_DWORD *)v4 + 19) = self->_criticalBatteryCharge;
    *((_WORD *)v4 + 56) |= 1u;
  }
LABEL_22:
  if (self->_vehicleArguments)
  {
    objc_msgSend(v8, "setVehicleArguments:");
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  void *v21;
  PBUnknownFields *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOEVInfo readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 84) = self->_currentBatteryPercentage;
      *(_WORD *)(v5 + 112) |= 4u;
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x40) != 0)
    {
      *(_DWORD *)(v5 + 100) = self->_maxRange;
      *(_WORD *)(v5 + 112) |= 0x40u;
    }
    v10 = -[NSString copyWithZone:](self->_consumptionArguments, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    v12 = -[NSString copyWithZone:](self->_chargingArguments, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    v14 = (__int16)self->_flags;
    if ((v14 & 2) != 0)
    {
      *(_DWORD *)(v5 + 80) = self->_currentBatteryCharge;
      *(_WORD *)(v5 + 112) |= 2u;
      v14 = (__int16)self->_flags;
      if ((v14 & 0x20) == 0)
      {
LABEL_11:
        if ((v14 & 0x100) == 0)
          goto LABEL_12;
        goto LABEL_22;
      }
    }
    else if ((v14 & 0x20) == 0)
    {
      goto LABEL_11;
    }
    *(_DWORD *)(v5 + 96) = self->_maxBatteryCharge;
    *(_WORD *)(v5 + 112) |= 0x20u;
    v14 = (__int16)self->_flags;
    if ((v14 & 0x100) == 0)
    {
LABEL_12:
      if ((v14 & 0x80) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
LABEL_22:
    *(_BYTE *)(v5 + 108) = self->_isCharging;
    *(_WORD *)(v5 + 112) |= 0x100u;
    if ((*(_WORD *)&self->_flags & 0x80) == 0)
    {
LABEL_14:
      v15 = -[NSString copyWithZone:](self->_vehicleIdentifier, "copyWithZone:", a3);
      v16 = *(void **)(v5 + 56);
      *(_QWORD *)(v5 + 56) = v15;

      v17 = -[GEOChargerPlugsInfo copyWithZone:](self->_chargerPlugsInfo, "copyWithZone:", a3);
      v18 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v17;

      v19 = (__int16)self->_flags;
      if ((v19 & 8) != 0)
      {
        *(_DWORD *)(v5 + 88) = self->_lastSocUpdateDate;
        *(_WORD *)(v5 + 112) |= 8u;
        v19 = (__int16)self->_flags;
        if ((v19 & 0x10) == 0)
        {
LABEL_16:
          if ((v19 & 1) == 0)
          {
LABEL_18:
            v20 = -[NSString copyWithZone:](self->_vehicleArguments, "copyWithZone:", a3);
            v21 = *(void **)(v5 + 48);
            *(_QWORD *)(v5 + 48) = v20;

            v22 = self->_unknownFields;
            v8 = *(id *)(v5 + 16);
            *(_QWORD *)(v5 + 16) = v22;
            goto LABEL_19;
          }
LABEL_17:
          *(_DWORD *)(v5 + 76) = self->_criticalBatteryCharge;
          *(_WORD *)(v5 + 112) |= 1u;
          goto LABEL_18;
        }
      }
      else if ((v19 & 0x10) == 0)
      {
        goto LABEL_16;
      }
      *(_DWORD *)(v5 + 92) = self->_lowBatteryCharge;
      *(_WORD *)(v5 + 112) |= 0x10u;
      if ((*(_WORD *)&self->_flags & 1) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
LABEL_13:
    *(_DWORD *)(v5 + 104) = self->_minBatteryCharge;
    *(_WORD *)(v5 + 112) |= 0x80u;
    goto LABEL_14;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOEVInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_19:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSString *consumptionArguments;
  NSString *chargingArguments;
  __int16 v9;
  __int16 v10;
  NSString *vehicleIdentifier;
  GEOChargerPlugsInfo *chargerPlugsInfo;
  __int16 v13;
  __int16 v14;
  NSString *vehicleArguments;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_60;
  -[GEOEVInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 56);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_currentBatteryPercentage != *((_DWORD *)v4 + 21))
      goto LABEL_60;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_maxRange != *((_DWORD *)v4 + 25))
      goto LABEL_60;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_60;
  }
  consumptionArguments = self->_consumptionArguments;
  if ((unint64_t)consumptionArguments | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](consumptionArguments, "isEqual:"))
  {
    goto LABEL_60;
  }
  chargingArguments = self->_chargingArguments;
  if ((unint64_t)chargingArguments | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](chargingArguments, "isEqual:"))
      goto LABEL_60;
  }
  v9 = (__int16)self->_flags;
  v10 = *((_WORD *)v4 + 56);
  if ((v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_currentBatteryCharge != *((_DWORD *)v4 + 20))
      goto LABEL_60;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((v9 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_maxBatteryCharge != *((_DWORD *)v4 + 24))
      goto LABEL_60;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x100) != 0)
    {
      if (self->_isCharging)
      {
        if (!*((_BYTE *)v4 + 108))
          goto LABEL_60;
        goto LABEL_34;
      }
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_34;
    }
LABEL_60:
    v16 = 0;
    goto LABEL_61;
  }
  if ((*((_WORD *)v4 + 56) & 0x100) != 0)
    goto LABEL_60;
LABEL_34:
  if ((v9 & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_minBatteryCharge != *((_DWORD *)v4 + 26))
      goto LABEL_60;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_60;
  }
  vehicleIdentifier = self->_vehicleIdentifier;
  if ((unint64_t)vehicleIdentifier | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](vehicleIdentifier, "isEqual:"))
  {
    goto LABEL_60;
  }
  chargerPlugsInfo = self->_chargerPlugsInfo;
  if ((unint64_t)chargerPlugsInfo | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOChargerPlugsInfo isEqual:](chargerPlugsInfo, "isEqual:"))
      goto LABEL_60;
  }
  v13 = (__int16)self->_flags;
  v14 = *((_WORD *)v4 + 56);
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_lastSocUpdateDate != *((_DWORD *)v4 + 22))
      goto LABEL_60;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((v13 & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_lowBatteryCharge != *((_DWORD *)v4 + 23))
      goto LABEL_60;
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_60;
  }
  if ((v13 & 1) != 0)
  {
    if ((v14 & 1) == 0 || self->_criticalBatteryCharge != *((_DWORD *)v4 + 19))
      goto LABEL_60;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_60;
  }
  vehicleArguments = self->_vehicleArguments;
  if ((unint64_t)vehicleArguments | *((_QWORD *)v4 + 6))
    v16 = -[NSString isEqual:](vehicleArguments, "isEqual:");
  else
    v16 = 1;
LABEL_61:

  return v16;
}

- (unint64_t)hash
{
  __int16 flags;
  NSUInteger v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  unint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;

  -[GEOEVInfo readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v19 = 2654435761 * self->_currentBatteryPercentage;
    if ((flags & 0x40) != 0)
      goto LABEL_3;
  }
  else
  {
    v19 = 0;
    if ((flags & 0x40) != 0)
    {
LABEL_3:
      v18 = 2654435761 * self->_maxRange;
      goto LABEL_6;
    }
  }
  v18 = 0;
LABEL_6:
  v17 = -[NSString hash](self->_consumptionArguments, "hash");
  v4 = -[NSString hash](self->_chargingArguments, "hash");
  v5 = (__int16)self->_flags;
  if ((v5 & 2) != 0)
  {
    v6 = 2654435761 * self->_currentBatteryCharge;
    if ((v5 & 0x20) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_maxBatteryCharge;
      if ((*(_WORD *)&self->_flags & 0x100) != 0)
        goto LABEL_9;
LABEL_13:
      v8 = 0;
      if ((v5 & 0x80) != 0)
        goto LABEL_10;
      goto LABEL_14;
    }
  }
  else
  {
    v6 = 0;
    if ((v5 & 0x20) != 0)
      goto LABEL_8;
  }
  v7 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) == 0)
    goto LABEL_13;
LABEL_9:
  v8 = 2654435761 * self->_isCharging;
  if ((v5 & 0x80) != 0)
  {
LABEL_10:
    v9 = 2654435761 * self->_minBatteryCharge;
    goto LABEL_15;
  }
LABEL_14:
  v9 = 0;
LABEL_15:
  v10 = -[NSString hash](self->_vehicleIdentifier, "hash");
  v11 = -[GEOChargerPlugsInfo hash](self->_chargerPlugsInfo, "hash");
  v12 = (__int16)self->_flags;
  if ((v12 & 8) == 0)
  {
    v13 = 0;
    if ((v12 & 0x10) != 0)
      goto LABEL_17;
LABEL_20:
    v14 = 0;
    if ((v12 & 1) != 0)
      goto LABEL_18;
LABEL_21:
    v15 = 0;
    return v18 ^ v19 ^ v17 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ -[NSString hash](self->_vehicleArguments, "hash");
  }
  v13 = 2654435761 * self->_lastSocUpdateDate;
  if ((v12 & 0x10) == 0)
    goto LABEL_20;
LABEL_17:
  v14 = 2654435761 * self->_lowBatteryCharge;
  if ((v12 & 1) == 0)
    goto LABEL_21;
LABEL_18:
  v15 = 2654435761 * self->_criticalBatteryCharge;
  return v18 ^ v19 ^ v17 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ -[NSString hash](self->_vehicleArguments, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  __int16 v5;
  __int16 v6;
  GEOChargerPlugsInfo *chargerPlugsInfo;
  uint64_t v8;
  __int16 v9;
  unsigned int *v10;

  v10 = (unsigned int *)a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = v10;
  v5 = *((_WORD *)v10 + 56);
  if ((v5 & 4) != 0)
  {
    self->_currentBatteryPercentage = v10[21];
    *(_WORD *)&self->_flags |= 4u;
    v5 = *((_WORD *)v10 + 56);
  }
  if ((v5 & 0x40) != 0)
  {
    self->_maxRange = v10[25];
    *(_WORD *)&self->_flags |= 0x40u;
  }
  if (*((_QWORD *)v10 + 5))
  {
    -[GEOEVInfo setConsumptionArguments:](self, "setConsumptionArguments:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[GEOEVInfo setChargingArguments:](self, "setChargingArguments:");
    v4 = v10;
  }
  v6 = *((_WORD *)v4 + 56);
  if ((v6 & 2) != 0)
  {
    self->_currentBatteryCharge = v4[20];
    *(_WORD *)&self->_flags |= 2u;
    v6 = *((_WORD *)v4 + 56);
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 0x100) == 0)
        goto LABEL_12;
      goto LABEL_21;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  self->_maxBatteryCharge = v4[24];
  *(_WORD *)&self->_flags |= 0x20u;
  v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_21:
  self->_isCharging = *((_BYTE *)v4 + 108);
  *(_WORD *)&self->_flags |= 0x100u;
  if ((v4[28] & 0x80) != 0)
  {
LABEL_13:
    self->_minBatteryCharge = v4[26];
    *(_WORD *)&self->_flags |= 0x80u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 7))
  {
    -[GEOEVInfo setVehicleIdentifier:](self, "setVehicleIdentifier:");
    v4 = v10;
  }
  chargerPlugsInfo = self->_chargerPlugsInfo;
  v8 = *((_QWORD *)v4 + 3);
  if (chargerPlugsInfo)
  {
    if (!v8)
      goto LABEL_26;
    -[GEOChargerPlugsInfo mergeFrom:](chargerPlugsInfo, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_26;
    -[GEOEVInfo setChargerPlugsInfo:](self, "setChargerPlugsInfo:");
  }
  v4 = v10;
LABEL_26:
  v9 = *((_WORD *)v4 + 56);
  if ((v9 & 8) != 0)
  {
    self->_lastSocUpdateDate = v4[22];
    *(_WORD *)&self->_flags |= 8u;
    v9 = *((_WORD *)v4 + 56);
    if ((v9 & 0x10) == 0)
    {
LABEL_28:
      if ((v9 & 1) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((v9 & 0x10) == 0)
  {
    goto LABEL_28;
  }
  self->_lowBatteryCharge = v4[23];
  *(_WORD *)&self->_flags |= 0x10u;
  if ((v4[28] & 1) != 0)
  {
LABEL_29:
    self->_criticalBatteryCharge = v4[19];
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_30:
  if (*((_QWORD *)v4 + 6))
  {
    -[GEOEVInfo setVehicleArguments:](self, "setVehicleArguments:");
    v4 = v10;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x200) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOEVInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1527);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x8200u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOEVInfo readAll:](self, "readAll:", 0);
    -[GEOChargerPlugsInfo clearUnknownFields:](self->_chargerPlugsInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleIdentifier, 0);
  objc_storeStrong((id *)&self->_vehicleArguments, 0);
  objc_storeStrong((id *)&self->_consumptionArguments, 0);
  objc_storeStrong((id *)&self->_chargingArguments, 0);
  objc_storeStrong((id *)&self->_chargerPlugsInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
