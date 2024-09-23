@implementation GEOARSessionThermalPressure

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

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)chargingState
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_chargingState;
  else
    return 0;
}

- (void)setChargingState:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_chargingState = a3;
}

- (void)setHasChargingState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasChargingState
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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

- (int)collectionTrigger
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_collectionTrigger;
  else
    return 1;
}

- (void)setCollectionTrigger:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_collectionTrigger = a3;
}

- (void)setHasCollectionTrigger:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasCollectionTrigger
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)collectionTriggerAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_1E1C220E8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCollectionTrigger:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_SESSION_COLLECTION_COLLECTION_TRIGGER_UNKNOWN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_SESSION_COLLECTION_COLLECTION_TRIGGER_START_AR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_SESSION_COLLECTION_COLLECTION_TRIGGER_END_AR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_SESSION_COLLECTION_COLLECTION_TRIGGER_THERMAL_PRESSURE_DELTA")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AR_SESSION_COLLECTION_COLLECTION_TRIGGER_CHARGE_STATE_CHANGE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
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
  v8.super_class = (Class)GEOARSessionThermalPressure;
  -[GEOARSessionThermalPressure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOARSessionThermalPressure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOARSessionThermalPressure _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  unsigned int v12;
  __CFString *v13;
  const __CFString *v14;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("thermalPressure");
    else
      v7 = CFSTR("thermal_pressure");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)(a1 + 28) & 1) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("timestamp"));

  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      return v4;
    goto LABEL_19;
  }
LABEL_12:
  v9 = *(int *)(a1 + 16);
  if (v9 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E1C22910[v9];
  }
  if (a2)
    v11 = CFSTR("chargingState");
  else
    v11 = CFSTR("charging_state");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  if ((*(_BYTE *)(a1 + 28) & 4) != 0)
  {
LABEL_19:
    v12 = *(_DWORD *)(a1 + 20) - 1;
    if (v12 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 20));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E1C220E8[v12];
    }
    if (a2)
      v14 = CFSTR("collectionTrigger");
    else
      v14 = CFSTR("collection_trigger");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOARSessionThermalPressure _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOARSessionThermalPressure)initWithDictionary:(id)a3
{
  return (GEOARSessionThermalPressure *)-[GEOARSessionThermalPressure _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;

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

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "doubleValue");
        objc_msgSend(a1, "setTimestamp:");
      }

      if (a3)
        v9 = CFSTR("chargingState");
      else
        v9 = CFSTR("charging_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CHARGING_STATE_UNKNOWN")) & 1) != 0)
        {
          v12 = 0;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CHARGING_STATE_NOT_CHARGING")) & 1) != 0)
        {
          v12 = 1;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CHARGING_STATE_WIRED_CHARGING")) & 1) != 0)
        {
          v12 = 2;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("CHARGING_STATE_WIRELESS_CHARGING")))
        {
          v12 = 3;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_27;
        v12 = objc_msgSend(v10, "intValue");
      }
      objc_msgSend(a1, "setChargingState:", v12);
LABEL_27:

      if (a3)
        v13 = CFSTR("collectionTrigger");
      else
        v13 = CFSTR("collection_trigger");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AR_SESSION_COLLECTION_COLLECTION_TRIGGER_UNKNOWN")) & 1) != 0)
        {
          v16 = 1;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AR_SESSION_COLLECTION_COLLECTION_TRIGGER_START_AR")) & 1) != 0)
        {
          v16 = 2;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AR_SESSION_COLLECTION_COLLECTION_TRIGGER_END_AR")) & 1) != 0)
        {
          v16 = 3;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AR_SESSION_COLLECTION_COLLECTION_TRIGGER_THERMAL_PRESSURE_DELTA")) & 1) != 0)
        {
          v16 = 4;
        }
        else if (objc_msgSend(v15, "isEqualToString:", CFSTR("AR_SESSION_COLLECTION_COLLECTION_TRIGGER_CHARGE_STATE_CHANGE")))
        {
          v16 = 5;
        }
        else
        {
          v16 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_46:

          goto LABEL_47;
        }
        v16 = objc_msgSend(v14, "intValue");
      }
      objc_msgSend(a1, "setCollectionTrigger:", v16);
      goto LABEL_46;
    }
  }
LABEL_47:

  return a1;
}

- (GEOARSessionThermalPressure)initWithJSON:(id)a3
{
  return (GEOARSessionThermalPressure *)-[GEOARSessionThermalPressure _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOARSessionThermalPressureIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOARSessionThermalPressureReadAllFrom((uint64_t)self, a3);
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
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOARSessionThermalPressure readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[6] = self->_thermalPressure;
    *((_BYTE *)v5 + 28) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      v5[4] = self->_chargingState;
      *((_BYTE *)v5 + 28) |= 2u;
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_timestamp;
  *((_BYTE *)v5 + 28) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    v5[5] = self->_collectionTrigger;
    *((_BYTE *)v5 + 28) |= 4u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)result + 6) = self->_thermalPressure;
    *((_BYTE *)result + 28) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_timestamp;
  *((_BYTE *)result + 28) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 4) = self->_chargingState;
  *((_BYTE *)result + 28) |= 2u;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 5) = self->_collectionTrigger;
  *((_BYTE *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOARSessionThermalPressure readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) == 0 || self->_thermalPressure != *((_DWORD *)v4 + 6))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 28) & 8) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_chargingState != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 28) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_collectionTrigger != *((_DWORD *)v4 + 5))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  uint64_t v4;
  double timestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[GEOARSessionThermalPressure readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v4 = 2654435761 * self->_thermalPressure;
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
  timestamp = self->_timestamp;
  v6 = -timestamp;
  if (timestamp >= 0.0)
    v6 = self->_timestamp;
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
  if ((flags & 2) != 0)
  {
    v10 = 2654435761 * self->_chargingState;
    if ((flags & 4) != 0)
      goto LABEL_13;
LABEL_15:
    v11 = 0;
    return v9 ^ v4 ^ v10 ^ v11;
  }
  v10 = 0;
  if ((flags & 4) == 0)
    goto LABEL_15;
LABEL_13:
  v11 = 2654435761 * self->_collectionTrigger;
  return v9 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 8) != 0)
  {
    self->_thermalPressure = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_flags |= 8u;
    v4 = *((_BYTE *)v5 + 28);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      self->_chargingState = *((_DWORD *)v5 + 4);
      *(_BYTE *)&self->_flags |= 2u;
      if ((*((_BYTE *)v5 + 28) & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v5 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_timestamp = *((double *)v5 + 1);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 4) != 0)
  {
LABEL_5:
    self->_collectionTrigger = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_6:

}

@end
