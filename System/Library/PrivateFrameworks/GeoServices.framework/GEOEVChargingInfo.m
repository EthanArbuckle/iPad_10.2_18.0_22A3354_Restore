@implementation GEOEVChargingInfo

- (unsigned)chargingTime
{
  return self->_chargingTime;
}

- (void)setChargingTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_chargingTime = a3;
}

- (void)setHasChargingTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasChargingTime
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)batteryPercentageAfterCharging
{
  return self->_batteryPercentageAfterCharging;
}

- (void)setBatteryPercentageAfterCharging:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_batteryPercentageAfterCharging = a3;
}

- (void)setHasBatteryPercentageAfterCharging:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasBatteryPercentageAfterCharging
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)batteryChargeAfterCharging
{
  return self->_batteryChargeAfterCharging;
}

- (void)setBatteryChargeAfterCharging:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_batteryChargeAfterCharging = a3;
}

- (void)setHasBatteryChargeAfterCharging:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBatteryChargeAfterCharging
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasChargerPlugsInfo
{
  return self->_chargerPlugsInfo != 0;
}

- (GEOChargerPlugsInfo)chargerPlugsInfo
{
  return self->_chargerPlugsInfo;
}

- (void)setChargerPlugsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_chargerPlugsInfo, a3);
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
  v8.super_class = (Class)GEOEVChargingInfo;
  -[GEOEVChargingInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOEVChargingInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOEVChargingInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 4) == 0)
  {
    if ((*(_BYTE *)(a1 + 36) & 2) == 0)
      goto LABEL_4;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("batteryPercentageAfterCharging");
    else
      v15 = CFSTR("battery_percentage_after_charging");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

    if ((*(_BYTE *)(a1 + 36) & 1) == 0)
      goto LABEL_9;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("chargingTime");
  else
    v13 = CFSTR("charging_time");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  v5 = *(_BYTE *)(a1 + 36);
  if ((v5 & 2) != 0)
    goto LABEL_16;
LABEL_4:
  if ((v5 & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("batteryChargeAfterCharging");
    else
      v7 = CFSTR("battery_charge_after_charging");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_9:
  objc_msgSend((id)a1, "chargerPlugsInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("chargerPlugsInfo");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("charger_plugs_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v16 = *(void **)(a1 + 8);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __47__GEOEVChargingInfo__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOEVChargingInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOEVChargingInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOEVChargingInfo)initWithDictionary:(id)a3
{
  return (GEOEVChargingInfo *)-[GEOEVChargingInfo _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v12;
  void *v13;
  GEOChargerPlugsInfo *v14;
  uint64_t v15;
  void *v16;

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
        v8 = CFSTR("batteryPercentageAfterCharging");
      else
        v8 = CFSTR("battery_percentage_after_charging");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBatteryPercentageAfterCharging:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("batteryChargeAfterCharging");
      else
        v10 = CFSTR("battery_charge_after_charging");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBatteryChargeAfterCharging:", objc_msgSend(v11, "unsignedIntValue"));

      if (a3)
        v12 = CFSTR("chargerPlugsInfo");
      else
        v12 = CFSTR("charger_plugs_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = [GEOChargerPlugsInfo alloc];
        if ((a3 & 1) != 0)
          v15 = -[GEOChargerPlugsInfo initWithJSON:](v14, "initWithJSON:", v13);
        else
          v15 = -[GEOChargerPlugsInfo initWithDictionary:](v14, "initWithDictionary:", v13);
        v16 = (void *)v15;
        objc_msgSend(a1, "setChargerPlugsInfo:", v15);

      }
    }
  }

  return a1;
}

- (GEOEVChargingInfo)initWithJSON:(id)a3
{
  return (GEOEVChargingInfo *)-[GEOEVChargingInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOEVChargingInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOEVChargingInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_chargerPlugsInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOEVChargingInfo readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_chargingTime;
    *((_BYTE *)v6 + 36) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 7) = self->_batteryPercentageAfterCharging;
  *((_BYTE *)v6 + 36) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    *((_DWORD *)v6 + 6) = self->_batteryChargeAfterCharging;
    *((_BYTE *)v6 + 36) |= 1u;
  }
LABEL_5:
  if (self->_chargerPlugsInfo)
  {
    objc_msgSend(v6, "setChargerPlugsInfo:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 28) = self->_batteryPercentageAfterCharging;
    *(_BYTE *)(v5 + 36) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 32) = self->_chargingTime;
  *(_BYTE *)(v5 + 36) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_batteryChargeAfterCharging;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
LABEL_5:
  v8 = -[GEOChargerPlugsInfo copyWithZone:](self->_chargerPlugsInfo, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOChargerPlugsInfo *chargerPlugsInfo;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOEVChargingInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_chargingTime != *((_DWORD *)v4 + 8))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_batteryPercentageAfterCharging != *((_DWORD *)v4 + 7))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_batteryChargeAfterCharging != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_19;
  }
  chargerPlugsInfo = self->_chargerPlugsInfo;
  if ((unint64_t)chargerPlugsInfo | *((_QWORD *)v4 + 2))
    v6 = -[GEOChargerPlugsInfo isEqual:](chargerPlugsInfo, "isEqual:");
  else
    v6 = 1;
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOEVChargingInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[GEOChargerPlugsInfo hash](self->_chargerPlugsInfo, "hash");
  }
  v3 = 2654435761 * self->_chargingTime;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_batteryPercentageAfterCharging;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_batteryChargeAfterCharging;
  return v4 ^ v3 ^ v5 ^ -[GEOChargerPlugsInfo hash](self->_chargerPlugsInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  char v5;
  GEOChargerPlugsInfo *chargerPlugsInfo;
  uint64_t v7;
  unsigned int *v8;

  v8 = (unsigned int *)a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_BYTE *)v8 + 36);
  if ((v5 & 4) != 0)
  {
    self->_chargingTime = v8[8];
    *(_BYTE *)&self->_flags |= 4u;
    v5 = *((_BYTE *)v8 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v8[9] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_batteryPercentageAfterCharging = v8[7];
  *(_BYTE *)&self->_flags |= 2u;
  if ((v8[9] & 1) != 0)
  {
LABEL_4:
    self->_batteryChargeAfterCharging = v8[6];
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_5:
  chargerPlugsInfo = self->_chargerPlugsInfo;
  v7 = *((_QWORD *)v8 + 2);
  if (chargerPlugsInfo)
  {
    if (v7)
    {
      -[GEOChargerPlugsInfo mergeFrom:](chargerPlugsInfo, "mergeFrom:");
LABEL_13:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[GEOEVChargingInfo setChargerPlugsInfo:](self, "setChargerPlugsInfo:");
    goto LABEL_13;
  }

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
  {
    -[GEOEVChargingInfo readAll:](self, "readAll:", 0);
    -[GEOChargerPlugsInfo clearUnknownFields:](self->_chargerPlugsInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargerPlugsInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
