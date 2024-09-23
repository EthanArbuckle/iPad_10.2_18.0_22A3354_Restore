@implementation ATXAnchorModelPBAnchorMetadata

- (int)anchorType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_anchorType;
  else
    return 0;
}

- (void)setAnchorType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_anchorType = a3;
}

- (void)setHasAnchorType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAnchorType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)anchorTypeAsString:(int)a3
{
  if (a3 < 0x12)
    return off_1E82E6398[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAnchorType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_BLUETOOTH_CONNECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_BLUETOOTH_DISCONNECTED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_IDLE_TIME_BEGIN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_IDLE_TIME_END")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_CARPLAY_CONNECTED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_CARPLAY_DISCONNECTED")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_LOI_ENTRANCE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_LOI_EXIT")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_WORKOUT_START")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_WORKOUT_END")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_HEADING_HOME")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_HEADING_TO_WORK")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_FIRST_CALENDAR_EVENT_OF_DAY")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_LAST_CALENDAR_EVENT_OF_DAY")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_UPCOMING_SEMANTIC_EVENT")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_WIRED_AUDIO_DEVICE_CONNECTED")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_TYPE_WIRED_AUDIO_DEVICE_DISCONNECTED")))
  {
    v4 = 17;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAnchorEventIdentifier
{
  return self->_anchorEventIdentifier != 0;
}

- (int)anchorEventType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_anchorEventType;
  else
    return 0;
}

- (void)setAnchorEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_anchorEventType = a3;
}

- (void)setHasAnchorEventType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnchorEventType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)anchorEventTypeAsString:(int)a3
{
  if (a3 < 0x21)
    return off_1E82E6428[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAnchorEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_BLUETOOTH_DEVICE_OTHER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_BLUETOOTH_DEVICE_IMAGING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_BLUETOOTH_DEVICE_AUDIO")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_BLUETOOTH_DEVICE_VEHICLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_LOI_UNKNOWN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_LOI_HOME")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_LOI_WORK")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_LOI_GYM")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_CALENDAR_EVENT_IS_ORGANIZER")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_CALENDAR_EVENT_IS_NOT_ORGANIZER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_FLIGHT")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_BUS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_TRAIN")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_HOTEL")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_CAR")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_TICKET")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_MOVIE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_FOOD")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_SOCIAL")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_UPCOMING_SEMANTIC_EVENT_OTHER")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_WORKOUT_WALKING")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_WORKOUT_RUNNING")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_WORKOUT_CYCLING")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_WORKOUT_ELLIPTICAL")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_WORKOUT_STEPPER")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_WORKOUT_ROWING")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_WORKOUT_WHEELCHAIR_WALK_PACE")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_WORKOUT_WHEELCHAIR_RUN_PACE")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_WORKOUT_HIIT")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_WORKOUT_HIKING")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_WORKOUT_YOGA")) & 1) != 0)
  {
    v4 = 31;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_EVENT_TYPE_WORKOUT_OTHER")))
  {
    v4 = 32;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMonth:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_month = a3;
}

- (void)setHasMonth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasMonth
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setDayOfMonth:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dayOfMonth = a3;
}

- (void)setHasDayOfMonth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDayOfMonth
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHourOfDay:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_hourOfDay = a3;
}

- (void)setHasHourOfDay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHourOfDay
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)dayOfWeek
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_dayOfWeek;
  else
    return 0;
}

- (void)setDayOfWeek:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_dayOfWeek = a3;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDayOfWeek
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)dayOfWeekAsString:(int)a3
{
  if (a3 < 8)
    return off_1E82E6530[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDayOfWeek:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_DAY_OF_WEEK_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_DAY_OF_WEEK_SUNDAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_DAY_OF_WEEK_MONDAY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_DAY_OF_WEEK_TUESDAY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_DAY_OF_WEEK_WEDNESDAY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_DAY_OF_WEEK_THURSDAY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_DAY_OF_WEEK_FRIDAY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_DAY_OF_WEEK_SATURDAY")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasLocationIdentifier
{
  return self->_locationIdentifier != 0;
}

- (int)locationType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_locationType;
  else
    return 0;
}

- (void)setLocationType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLocationType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)locationTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E82E6570[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLocationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_LOCATION_TYPE_OTHER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_LOCATION_TYPE_HOME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_LOCATION_TYPE_WORK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ANCHOR_LOCATION_TYPE_GYM")))
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
  v8.super_class = (Class)ATXAnchorModelPBAnchorMetadata;
  -[ATXAnchorModelPBAnchorMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPBAnchorMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t anchorType;
  __CFString *v5;
  NSString *anchorEventIdentifier;
  char has;
  uint64_t anchorEventType;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t dayOfWeek;
  __CFString *v14;
  NSString *locationIdentifier;
  uint64_t locationType;
  __CFString *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    anchorType = self->_anchorType;
    if (anchorType >= 0x12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_anchorType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E82E6398[anchorType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("anchorType"));

  }
  anchorEventIdentifier = self->_anchorEventIdentifier;
  if (anchorEventIdentifier)
    objc_msgSend(v3, "setObject:forKey:", anchorEventIdentifier, CFSTR("anchorEventIdentifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    anchorEventType = self->_anchorEventType;
    if (anchorEventType >= 0x21)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_anchorEventType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E82E6428[anchorEventType];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("anchorEventType"));

    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_month);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("month"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 0x10) == 0)
        goto LABEL_16;
      goto LABEL_20;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_dayOfMonth);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("dayOfMonth"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 8) == 0)
      goto LABEL_25;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_hourOfDay);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("hourOfDay"));

  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_25;
LABEL_21:
  dayOfWeek = self->_dayOfWeek;
  if (dayOfWeek >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_dayOfWeek);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_1E82E6530[dayOfWeek];
  }
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("dayOfWeek"));

LABEL_25:
  locationIdentifier = self->_locationIdentifier;
  if (locationIdentifier)
    objc_msgSend(v3, "setObject:forKey:", locationIdentifier, CFSTR("locationIdentifier"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    locationType = self->_locationType;
    if (locationType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_locationType);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E82E6570[locationType];
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("locationType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBAnchorMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_anchorEventIdentifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_10:
    PBDataWriterWriteInt32Field();
LABEL_11:
  if (self->_locationIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[5] = self->_anchorType;
    *((_BYTE *)v4 + 56) |= 2u;
  }
  v6 = v4;
  if (self->_anchorEventIdentifier)
  {
    objc_msgSend(v4, "setAnchorEventIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_anchorEventType;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  v4[13] = self->_month;
  *((_BYTE *)v4 + 56) |= 0x40u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v4[6] = self->_dayOfMonth;
  *((_BYTE *)v4 + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_19:
  v4[8] = self->_hourOfDay;
  *((_BYTE *)v4 + 56) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_10:
    v4[7] = self->_dayOfWeek;
    *((_BYTE *)v4 + 56) |= 8u;
  }
LABEL_11:
  if (self->_locationIdentifier)
  {
    objc_msgSend(v6, "setLocationIdentifier:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v4[12] = self->_locationType;
    *((_BYTE *)v4 + 56) |= 0x20u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_anchorType;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_anchorEventIdentifier, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_anchorEventType;
    *(_BYTE *)(v6 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 52) = self->_month;
  *(_BYTE *)(v6 + 56) |= 0x40u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v6 + 24) = self->_dayOfMonth;
  *(_BYTE *)(v6 + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_15:
  *(_DWORD *)(v6 + 32) = self->_hourOfDay;
  *(_BYTE *)(v6 + 56) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 28) = self->_dayOfWeek;
    *(_BYTE *)(v6 + 56) |= 8u;
  }
LABEL_9:
  v10 = -[NSString copyWithZone:](self->_locationIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v10;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_locationType;
    *(_BYTE *)(v6 + 56) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *anchorEventIdentifier;
  NSString *locationIdentifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_anchorType != *((_DWORD *)v4 + 5))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_42;
  }
  anchorEventIdentifier = self->_anchorEventIdentifier;
  if ((unint64_t)anchorEventIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](anchorEventIdentifier, "isEqual:"))
      goto LABEL_42;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_anchorEventType != *((_DWORD *)v4 + 4))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x40) == 0 || self->_month != *((_DWORD *)v4 + 13))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_dayOfMonth != *((_DWORD *)v4 + 6))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_hourOfDay != *((_DWORD *)v4 + 8))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 7))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_42;
  }
  locationIdentifier = self->_locationIdentifier;
  if ((unint64_t)locationIdentifier | *((_QWORD *)v4 + 5))
  {
    if (-[NSString isEqual:](locationIdentifier, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_38;
    }
LABEL_42:
    v8 = 0;
    goto LABEL_43;
  }
LABEL_38:
  v8 = (*((_BYTE *)v4 + 56) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x20) == 0 || self->_locationType != *((_DWORD *)v4 + 12))
      goto LABEL_42;
    v8 = 1;
  }
LABEL_43:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_anchorType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_anchorEventIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_anchorEventType;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_month;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_dayOfMonth;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_8;
LABEL_13:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
    goto LABEL_14;
  }
LABEL_12:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_13;
LABEL_8:
  v8 = 2654435761 * self->_hourOfDay;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_9:
    v9 = 2654435761 * self->_dayOfWeek;
    goto LABEL_15;
  }
LABEL_14:
  v9 = 0;
LABEL_15:
  v10 = -[NSString hash](self->_locationIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v11 = 2654435761 * self->_locationType;
  else
    v11 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  char v5;
  _DWORD *v6;

  v4 = a3;
  if ((v4[14] & 2) != 0)
  {
    self->_anchorType = v4[5];
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXAnchorModelPBAnchorMetadata setAnchorEventIdentifier:](self, "setAnchorEventIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 1) != 0)
  {
    self->_anchorEventType = v4[4];
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 56);
    if ((v5 & 0x40) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0)
        goto LABEL_8;
      goto LABEL_18;
    }
  }
  else if ((v4[14] & 0x40) == 0)
  {
    goto LABEL_7;
  }
  self->_month = v4[13];
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  self->_dayOfMonth = v4[6];
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_19:
  self->_hourOfDay = v4[8];
  *(_BYTE *)&self->_has |= 0x10u;
  if ((v4[14] & 8) != 0)
  {
LABEL_10:
    self->_dayOfWeek = v4[7];
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXAnchorModelPBAnchorMetadata setLocationIdentifier:](self, "setLocationIdentifier:");
    v4 = v6;
  }
  if ((v4[14] & 0x20) != 0)
  {
    self->_locationType = v4[12];
    *(_BYTE *)&self->_has |= 0x20u;
  }

}

- (NSString)anchorEventIdentifier
{
  return self->_anchorEventIdentifier;
}

- (void)setAnchorEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_anchorEventIdentifier, a3);
}

- (unsigned)month
{
  return self->_month;
}

- (unsigned)dayOfMonth
{
  return self->_dayOfMonth;
}

- (unsigned)hourOfDay
{
  return self->_hourOfDay;
}

- (NSString)locationIdentifier
{
  return self->_locationIdentifier;
}

- (void)setLocationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_locationIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationIdentifier, 0);
  objc_storeStrong((id *)&self->_anchorEventIdentifier, 0);
}

@end
