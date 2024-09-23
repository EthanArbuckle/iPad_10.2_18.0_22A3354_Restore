@implementation GEOStopStepEVInfo

- (unsigned)chargingTime
{
  return self->_chargingTime;
}

- (void)setChargingTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_chargingTime = a3;
}

- (void)setHasChargingTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasChargingTime
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)gainedBatteryPercentage
{
  return self->_gainedBatteryPercentage;
}

- (void)setGainedBatteryPercentage:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_gainedBatteryPercentage = a3;
}

- (void)setHasGainedBatteryPercentage:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasGainedBatteryPercentage
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)gainedTravelRange
{
  return self->_gainedTravelRange;
}

- (void)setGainedTravelRange:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_gainedTravelRange = a3;
}

- (void)setHasGainedTravelRange:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasGainedTravelRange
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMuid
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)gainedBatteryCharge
{
  return self->_gainedBatteryCharge;
}

- (void)setGainedBatteryCharge:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_gainedBatteryCharge = a3;
}

- (void)setHasGainedBatteryCharge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasGainedBatteryCharge
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x40u;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasZilchPathIndex
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (double)remainingBatteryPercentage
{
  return self->_remainingBatteryPercentage;
}

- (void)setRemainingBatteryPercentage:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_remainingBatteryPercentage = a3;
}

- (void)setHasRemainingBatteryPercentage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRemainingBatteryPercentage
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOStopStepEVInfo;
  -[GEOStopStepEVInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOStopStepEVInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStopStepEVInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("chargingTime");
    else
      v16 = CFSTR("charging_time");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_BYTE *)(a1 + 56);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)(a1 + 56) & 1) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("gainedBatteryPercentage");
  else
    v18 = CFSTR("gained_battery_percentage");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("gainedTravelRange");
  else
    v20 = CFSTR("gained_travel_range");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("muid"));

  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
LABEL_36:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("zilchPathIndex");
    else
      v25 = CFSTR("zilch_path_index");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
      goto LABEL_13;
    goto LABEL_9;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 44));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("gainedBatteryCharge");
  else
    v23 = CFSTR("gained_battery_charge");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 0x40) != 0)
    goto LABEL_36;
LABEL_8:
  if ((v5 & 4) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("remainingBatteryPercentage");
    else
      v7 = CFSTR("remaining_battery_percentage");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_13:
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __47__GEOStopStepEVInfo__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v12 = v11;
      v27 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v26);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStopStepEVInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOStopStepEVInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStopStepEVInfo)initWithDictionary:(id)a3
{
  return (GEOStopStepEVInfo *)-[GEOStopStepEVInfo _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("chargingTime");
      else
        v6 = CFSTR("charging_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setChargingTime:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("gainedBatteryPercentage");
      else
        v8 = CFSTR("gained_battery_percentage");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setGainedBatteryPercentage:");
      }

      if (a3)
        v10 = CFSTR("gainedTravelRange");
      else
        v10 = CFSTR("gained_travel_range");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setGainedTravelRange:", objc_msgSend(v11, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMuid:", objc_msgSend(v12, "unsignedLongLongValue"));

      if (a3)
        v13 = CFSTR("gainedBatteryCharge");
      else
        v13 = CFSTR("gained_battery_charge");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setGainedBatteryCharge:", objc_msgSend(v14, "unsignedIntValue"));

      if (a3)
        v15 = CFSTR("zilchPathIndex");
      else
        v15 = CFSTR("zilch_path_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v16, "unsignedIntValue"));

      if (a3)
        v17 = CFSTR("remainingBatteryPercentage");
      else
        v17 = CFSTR("remaining_battery_percentage");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v18, "doubleValue");
        objc_msgSend(a1, "setRemainingBatteryPercentage:");
      }

    }
  }

  return a1;
}

- (GEOStopStepEVInfo)initWithJSON:(id)a3
{
  return (GEOStopStepEVInfo *)-[GEOStopStepEVInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStopStepEVInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStopStepEVInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 0x40) != 0)
    goto LABEL_15;
LABEL_7:
  if ((flags & 4) != 0)
LABEL_8:
    PBDataWriterWriteDoubleField();
LABEL_9:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOStopStepEVInfo readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[10] = self->_chargingTime;
    *((_BYTE *)v5 + 56) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_gainedBatteryPercentage;
  *((_BYTE *)v5 + 56) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v5[12] = self->_gainedTravelRange;
  *((_BYTE *)v5 + 56) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)v5 + 3) = self->_muid;
  *((_BYTE *)v5 + 56) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0)
      goto LABEL_7;
LABEL_15:
    v5[13] = self->_zilchPathIndex;
    *((_BYTE *)v5 + 56) |= 0x40u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  v5[11] = self->_gainedBatteryCharge;
  *((_BYTE *)v5 + 56) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 0x40) != 0)
    goto LABEL_15;
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *((_QWORD *)v5 + 4) = *(_QWORD *)&self->_remainingBatteryPercentage;
    *((_BYTE *)v5 + 56) |= 4u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v4 + 40) = self->_chargingTime;
    *(_BYTE *)(v4 + 56) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 16) = self->_gainedBatteryPercentage;
  *(_BYTE *)(v4 + 56) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v4 + 48) = self->_gainedTravelRange;
  *(_BYTE *)(v4 + 56) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *(_QWORD *)(v4 + 24) = self->_muid;
  *(_BYTE *)(v4 + 56) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0)
      goto LABEL_7;
LABEL_15:
    *(_DWORD *)(v4 + 52) = self->_zilchPathIndex;
    *(_BYTE *)(v4 + 56) |= 0x40u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  *(_DWORD *)(v4 + 44) = self->_gainedBatteryCharge;
  *(_BYTE *)(v4 + 56) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 0x40) != 0)
    goto LABEL_15;
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *(double *)(v4 + 32) = self->_remainingBatteryPercentage;
    *(_BYTE *)(v4 + 56) |= 4u;
  }
LABEL_9:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  -[GEOStopStepEVInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_chargingTime != *((_DWORD *)v4 + 10))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
LABEL_36:
    v5 = 0;
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_gainedBatteryPercentage != *((double *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x20) == 0 || self->_gainedTravelRange != *((_DWORD *)v4 + 12))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_muid != *((_QWORD *)v4 + 3))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_gainedBatteryCharge != *((_DWORD *)v4 + 11))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x40) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 13))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x40) != 0)
  {
    goto LABEL_36;
  }
  v5 = (*((_BYTE *)v4 + 56) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_remainingBatteryPercentage != *((double *)v4 + 4))
      goto LABEL_36;
    v5 = 1;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  uint64_t v4;
  double gainedBatteryPercentage;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double remainingBatteryPercentage;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;

  -[GEOStopStepEVInfo readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v4 = 2654435761 * self->_chargingTime;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_3:
  gainedBatteryPercentage = self->_gainedBatteryPercentage;
  v6 = -gainedBatteryPercentage;
  if (gainedBatteryPercentage >= 0.0)
    v6 = self->_gainedBatteryPercentage;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((flags & 0x20) != 0)
  {
    v10 = 2654435761 * self->_gainedTravelRange;
    if ((flags & 2) != 0)
    {
LABEL_13:
      v11 = 2654435761u * self->_muid;
      if ((flags & 0x10) != 0)
        goto LABEL_14;
      goto LABEL_22;
    }
  }
  else
  {
    v10 = 0;
    if ((flags & 2) != 0)
      goto LABEL_13;
  }
  v11 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_14:
    v12 = 2654435761 * self->_gainedBatteryCharge;
    if ((flags & 0x40) != 0)
      goto LABEL_15;
LABEL_23:
    v13 = 0;
    if ((flags & 4) != 0)
      goto LABEL_16;
LABEL_24:
    v18 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v18;
  }
LABEL_22:
  v12 = 0;
  if ((flags & 0x40) == 0)
    goto LABEL_23;
LABEL_15:
  v13 = 2654435761 * self->_zilchPathIndex;
  if ((flags & 4) == 0)
    goto LABEL_24;
LABEL_16:
  remainingBatteryPercentage = self->_remainingBatteryPercentage;
  v15 = -remainingBatteryPercentage;
  if (remainingBatteryPercentage >= 0.0)
    v15 = self->_remainingBatteryPercentage;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
  return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 8) != 0)
  {
    self->_chargingTime = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_flags |= 8u;
    v4 = *((_BYTE *)v5 + 56);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v5 + 56) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_gainedBatteryPercentage = *((double *)v5 + 2);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_gainedTravelRange = *((_DWORD *)v5 + 12);
  *(_BYTE *)&self->_flags |= 0x20u;
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_muid = *((_QWORD *)v5 + 3);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x40) == 0)
      goto LABEL_7;
LABEL_15:
    self->_zilchPathIndex = *((_DWORD *)v5 + 13);
    *(_BYTE *)&self->_flags |= 0x40u;
    if ((*((_BYTE *)v5 + 56) & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  self->_gainedBatteryCharge = *((_DWORD *)v5 + 11);
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 0x40) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v4 & 4) != 0)
  {
LABEL_8:
    self->_remainingBatteryPercentage = *((double *)v5 + 4);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_9:

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOStopStepEVInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
