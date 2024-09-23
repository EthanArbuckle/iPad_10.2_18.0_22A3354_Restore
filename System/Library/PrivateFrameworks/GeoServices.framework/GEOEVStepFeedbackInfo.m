@implementation GEOEVStepFeedbackInfo

- (unsigned)remainingBatteryPercentage
{
  return self->_remainingBatteryPercentage;
}

- (void)setRemainingBatteryPercentage:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_remainingBatteryPercentage = a3;
}

- (void)setHasRemainingBatteryPercentage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRemainingBatteryPercentage
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)remainingTravelRange
{
  return self->_remainingTravelRange;
}

- (void)setRemainingTravelRange:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_remainingTravelRange = a3;
}

- (void)setHasRemainingTravelRange:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRemainingTravelRange
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)remainingBatteryCharge
{
  return self->_remainingBatteryCharge;
}

- (void)setRemainingBatteryCharge:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_remainingBatteryCharge = a3;
}

- (void)setHasRemainingBatteryCharge:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasRemainingBatteryCharge
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)stateOfChargeDiff
{
  return self->_stateOfChargeDiff;
}

- (void)setStateOfChargeDiff:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_stateOfChargeDiff = a3;
}

- (void)setHasStateOfChargeDiff:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasStateOfChargeDiff
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOEVStepFeedbackInfo;
  -[GEOEVStepFeedbackInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOEVStepFeedbackInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOEVStepFeedbackInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 12));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("remainingBatteryPercentage");
    else
      v7 = CFSTR("remaining_battery_percentage");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 24);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("remainingTravelRange");
    else
      v9 = CFSTR("remaining_travel_range");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 1) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0)
        return v4;
      goto LABEL_19;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 8));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("remainingBatteryCharge");
  else
    v11 = CFSTR("remaining_battery_charge");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  if ((*(_BYTE *)(a1 + 24) & 8) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("stateOfChargeDiff");
    else
      v13 = CFSTR("state_of_charge_diff");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOEVStepFeedbackInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOEVStepFeedbackInfo)initWithDictionary:(id)a3
{
  return (GEOEVStepFeedbackInfo *)-[GEOEVStepFeedbackInfo _initWithDictionary:isJSON:](self, a3, 0);
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

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("remainingBatteryPercentage");
      else
        v6 = CFSTR("remaining_battery_percentage");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRemainingBatteryPercentage:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("remainingTravelRange");
      else
        v8 = CFSTR("remaining_travel_range");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRemainingTravelRange:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("remainingBatteryCharge");
      else
        v10 = CFSTR("remaining_battery_charge");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRemainingBatteryCharge:", objc_msgSend(v11, "unsignedIntValue"));

      if (a3)
        v12 = CFSTR("stateOfChargeDiff");
      else
        v12 = CFSTR("state_of_charge_diff");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStateOfChargeDiff:", objc_msgSend(v13, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOEVStepFeedbackInfo)initWithJSON:(id)a3
{
  return (GEOEVStepFeedbackInfo *)-[GEOEVStepFeedbackInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOEVStepFeedbackInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOEVStepFeedbackInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 8) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOEVStepFeedbackInfo readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_remainingBatteryPercentage;
    *((_BYTE *)v5 + 24) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
LABEL_9:
      v5[2] = self->_remainingBatteryCharge;
      *((_BYTE *)v5 + 24) |= 1u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = self->_remainingTravelRange;
  *((_BYTE *)v5 + 24) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 8) != 0)
  {
LABEL_5:
    v5[5] = self->_stateOfChargeDiff;
    *((_BYTE *)v5 + 24) |= 8u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_remainingBatteryPercentage;
    *((_BYTE *)result + 24) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_remainingTravelRange;
  *((_BYTE *)result + 24) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 2) = self->_remainingBatteryCharge;
  *((_BYTE *)result + 24) |= 1u;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 5) = self->_stateOfChargeDiff;
  *((_BYTE *)result + 24) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOEVStepFeedbackInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_remainingBatteryPercentage != *((_DWORD *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_remainingTravelRange != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_remainingBatteryCharge != *((_DWORD *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 24) & 8) == 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) == 0 || self->_stateOfChargeDiff != *((_DWORD *)v4 + 5))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOEVStepFeedbackInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_remainingBatteryPercentage;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_remainingTravelRange;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_remainingBatteryCharge;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_stateOfChargeDiff;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  unsigned int *v5;

  v5 = (unsigned int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 2) != 0)
  {
    self->_remainingBatteryPercentage = v5[3];
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 24);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_4;
LABEL_9:
      self->_remainingBatteryCharge = v5[2];
      *(_BYTE *)&self->_flags |= 1u;
      if ((v5[6] & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((v5[6] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_remainingTravelRange = v5[4];
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 8) != 0)
  {
LABEL_5:
    self->_stateOfChargeDiff = v5[5];
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_6:

}

@end
