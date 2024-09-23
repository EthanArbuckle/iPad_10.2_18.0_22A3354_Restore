@implementation BMPBHealthKitWorkoutEvent

- (void)setIsFirstPartyDonation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isFirstPartyDonation = a3;
}

- (void)setHasIsFirstPartyDonation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsFirstPartyDonation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsIndoor:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isIndoor = a3;
}

- (void)setHasIsIndoor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsIndoor
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasActivityType
{
  return self->_activityType != 0;
}

- (int)eventType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E2648948[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Start")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Stop")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Resume")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Pause")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasActivityUUID
{
  return self->_activityUUID != 0;
}

- (void)setIsUpdate:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isUpdate = a3;
}

- (void)setHasIsUpdate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsUpdate
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)BMPBHealthKitWorkoutEvent;
  -[BMPBHealthKitWorkoutEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBHealthKitWorkoutEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *activityType;
  uint64_t eventType;
  __CFString *v9;
  NSString *activityUUID;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFirstPartyDonation);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isFirstPartyDonation"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isIndoor);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isIndoor"));

  }
  activityType = self->_activityType;
  if (activityType)
    objc_msgSend(v3, "setObject:forKey:", activityType, CFSTR("activityType"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    eventType = self->_eventType;
    if (eventType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E2648948[eventType];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("eventType"));

  }
  activityUUID = self->_activityUUID;
  if (activityUUID)
    objc_msgSend(v3, "setObject:forKey:", activityUUID, CFSTR("activityUUID"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUpdate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("isUpdate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBHealthKitWorkoutEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_activityType)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_activityUUID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[28] = self->_isFirstPartyDonation;
    v4[32] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[29] = self->_isIndoor;
    v4[32] |= 4u;
  }
  v6 = v4;
  if (self->_activityType)
  {
    objc_msgSend(v4, "setActivityType:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_eventType;
    v4[32] |= 1u;
  }
  if (self->_activityUUID)
  {
    objc_msgSend(v6, "setActivityUUID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[30] = self->_isUpdate;
    v4[32] |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _BYTE *v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[28] = self->_isFirstPartyDonation;
    v5[32] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v5[29] = self->_isIndoor;
    v5[32] |= 4u;
  }
  v8 = -[NSString copyWithZone:](self->_activityType, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v6 + 1);
  *((_QWORD *)v6 + 1) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_eventType;
    v6[32] |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_activityUUID, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v10;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v6[30] = self->_isUpdate;
    v6[32] |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *activityType;
  NSString *activityUUID;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0)
      goto LABEL_31;
    if (self->_isFirstPartyDonation)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_31;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_31;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0)
      goto LABEL_31;
    if (self->_isIndoor)
    {
      if (!*((_BYTE *)v4 + 29))
        goto LABEL_31;
    }
    else if (*((_BYTE *)v4 + 29))
    {
      goto LABEL_31;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_31;
  }
  activityType = self->_activityType;
  if ((unint64_t)activityType | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](activityType, "isEqual:"))
      goto LABEL_31;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_eventType != *((_DWORD *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_31;
  }
  activityUUID = self->_activityUUID;
  if ((unint64_t)activityUUID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](activityUUID, "isEqual:"))
      goto LABEL_31;
    has = (char)self->_has;
  }
  v8 = (*((_BYTE *)v4 + 32) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) != 0)
    {
      if (self->_isUpdate)
      {
        if (!*((_BYTE *)v4 + 30))
          goto LABEL_31;
      }
      else if (*((_BYTE *)v4 + 30))
      {
        goto LABEL_31;
      }
      v8 = 1;
      goto LABEL_32;
    }
LABEL_31:
    v8 = 0;
  }
LABEL_32:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_isFirstPartyDonation;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_isIndoor;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_activityType, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_eventType;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_activityUUID, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v8 = 2654435761 * self->_isUpdate;
  else
    v8 = 0;
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_isFirstPartyDonation = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 32);
  }
  if ((v5 & 4) != 0)
  {
    self->_isIndoor = *((_BYTE *)v4 + 29);
    *(_BYTE *)&self->_has |= 4u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[BMPBHealthKitWorkoutEvent setActivityType:](self, "setActivityType:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBHealthKitWorkoutEvent setActivityUUID:](self, "setActivityUUID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    self->_isUpdate = *((_BYTE *)v4 + 30);
    *(_BYTE *)&self->_has |= 8u;
  }

}

- (BOOL)isFirstPartyDonation
{
  return self->_isFirstPartyDonation;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_activityType, a3);
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
  objc_storeStrong((id *)&self->_activityUUID, a3);
}

- (BOOL)isUpdate
{
  return self->_isUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
