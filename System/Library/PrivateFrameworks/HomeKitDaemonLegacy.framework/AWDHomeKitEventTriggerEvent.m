@implementation AWDHomeKitEventTriggerEvent

- (void)setEndEvent:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endEvent = a3;
}

- (void)setHasEndEvent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndEvent
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCharEvent
{
  return self->_charEvent != 0;
}

- (BOOL)hasLocationEvent
{
  return self->_locationEvent != 0;
}

- (BOOL)hasCharThresholdEvent
{
  return self->_charThresholdEvent != 0;
}

- (BOOL)hasCalendarEvent
{
  return self->_calendarEvent != 0;
}

- (BOOL)hasSignificantTimeEvent
{
  return self->_significantTimeEvent != 0;
}

- (BOOL)hasThresholdEvent
{
  return self->_thresholdEvent != 0;
}

- (BOOL)hasPresenceEvent
{
  return self->_presenceEvent != 0;
}

- (BOOL)hasDurationEvent
{
  return self->_durationEvent != 0;
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
  v8.super_class = (Class)AWDHomeKitEventTriggerEvent;
  -[AWDHomeKitEventTriggerEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitEventTriggerEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  AWDHomeKitCharacteristicEvent *charEvent;
  void *v6;
  AWDHomeKitLocationEvent *locationEvent;
  void *v8;
  AWDHomeKitCharacteristicThresholdEvent *charThresholdEvent;
  void *v10;
  AWDHomeKitCalendarEvent *calendarEvent;
  void *v12;
  AWDHomeKitSignificantTimeEvent *significantTimeEvent;
  void *v14;
  AWDHomeKitCharacteristicThresholdEvent *thresholdEvent;
  void *v16;
  AWDHomeKitPresenceEvent *presenceEvent;
  void *v18;
  AWDHomeKitDurationEvent *durationEvent;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_endEvent);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("endEvent"));

  }
  charEvent = self->_charEvent;
  if (charEvent)
  {
    -[AWDHomeKitCharacteristicEvent dictionaryRepresentation](charEvent, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("charEvent"));

  }
  locationEvent = self->_locationEvent;
  if (locationEvent)
  {
    -[AWDHomeKitLocationEvent dictionaryRepresentation](locationEvent, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("locationEvent"));

  }
  charThresholdEvent = self->_charThresholdEvent;
  if (charThresholdEvent)
  {
    -[AWDHomeKitCharacteristicThresholdEvent dictionaryRepresentation](charThresholdEvent, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("charThresholdEvent"));

  }
  calendarEvent = self->_calendarEvent;
  if (calendarEvent)
  {
    -[AWDHomeKitCalendarEvent dictionaryRepresentation](calendarEvent, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("calendarEvent"));

  }
  significantTimeEvent = self->_significantTimeEvent;
  if (significantTimeEvent)
  {
    -[AWDHomeKitSignificantTimeEvent dictionaryRepresentation](significantTimeEvent, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("significantTimeEvent"));

  }
  thresholdEvent = self->_thresholdEvent;
  if (thresholdEvent)
  {
    -[AWDHomeKitCharacteristicThresholdEvent dictionaryRepresentation](thresholdEvent, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("thresholdEvent"));

  }
  presenceEvent = self->_presenceEvent;
  if (presenceEvent)
  {
    -[AWDHomeKitPresenceEvent dictionaryRepresentation](presenceEvent, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("presenceEvent"));

  }
  durationEvent = self->_durationEvent;
  if (durationEvent)
  {
    -[AWDHomeKitDurationEvent dictionaryRepresentation](durationEvent, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("durationEvent"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitEventTriggerEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_charEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_locationEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_charThresholdEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_calendarEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_significantTimeEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_thresholdEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_presenceEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_durationEvent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[72] = self->_endEvent;
    v4[76] |= 1u;
  }
  v5 = v4;
  if (self->_charEvent)
  {
    objc_msgSend(v4, "setCharEvent:");
    v4 = v5;
  }
  if (self->_locationEvent)
  {
    objc_msgSend(v5, "setLocationEvent:");
    v4 = v5;
  }
  if (self->_charThresholdEvent)
  {
    objc_msgSend(v5, "setCharThresholdEvent:");
    v4 = v5;
  }
  if (self->_calendarEvent)
  {
    objc_msgSend(v5, "setCalendarEvent:");
    v4 = v5;
  }
  if (self->_significantTimeEvent)
  {
    objc_msgSend(v5, "setSignificantTimeEvent:");
    v4 = v5;
  }
  if (self->_thresholdEvent)
  {
    objc_msgSend(v5, "setThresholdEvent:");
    v4 = v5;
  }
  if (self->_presenceEvent)
  {
    objc_msgSend(v5, "setPresenceEvent:");
    v4 = v5;
  }
  if (self->_durationEvent)
  {
    objc_msgSend(v5, "setDurationEvent:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_endEvent;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v7 = -[AWDHomeKitCharacteristicEvent copyWithZone:](self->_charEvent, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[AWDHomeKitLocationEvent copyWithZone:](self->_locationEvent, "copyWithZone:", a3);
  v10 = (void *)v6[5];
  v6[5] = v9;

  v11 = -[AWDHomeKitCharacteristicThresholdEvent copyWithZone:](self->_charThresholdEvent, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  v13 = -[AWDHomeKitCalendarEvent copyWithZone:](self->_calendarEvent, "copyWithZone:", a3);
  v14 = (void *)v6[1];
  v6[1] = v13;

  v15 = -[AWDHomeKitSignificantTimeEvent copyWithZone:](self->_significantTimeEvent, "copyWithZone:", a3);
  v16 = (void *)v6[7];
  v6[7] = v15;

  v17 = -[AWDHomeKitCharacteristicThresholdEvent copyWithZone:](self->_thresholdEvent, "copyWithZone:", a3);
  v18 = (void *)v6[8];
  v6[8] = v17;

  v19 = -[AWDHomeKitPresenceEvent copyWithZone:](self->_presenceEvent, "copyWithZone:", a3);
  v20 = (void *)v6[6];
  v6[6] = v19;

  v21 = -[AWDHomeKitDurationEvent copyWithZone:](self->_durationEvent, "copyWithZone:", a3);
  v22 = (void *)v6[4];
  v6[4] = v21;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  AWDHomeKitCharacteristicEvent *charEvent;
  AWDHomeKitLocationEvent *locationEvent;
  AWDHomeKitCharacteristicThresholdEvent *charThresholdEvent;
  AWDHomeKitCalendarEvent *calendarEvent;
  AWDHomeKitSignificantTimeEvent *significantTimeEvent;
  AWDHomeKitCharacteristicThresholdEvent *thresholdEvent;
  AWDHomeKitPresenceEvent *presenceEvent;
  AWDHomeKitDurationEvent *durationEvent;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) != 0)
    {
      if (self->_endEvent)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_26;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_10;
    }
LABEL_26:
    v13 = 0;
    goto LABEL_27;
  }
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
    goto LABEL_26;
LABEL_10:
  charEvent = self->_charEvent;
  if ((unint64_t)charEvent | *((_QWORD *)v4 + 2)
    && !-[AWDHomeKitCharacteristicEvent isEqual:](charEvent, "isEqual:"))
  {
    goto LABEL_26;
  }
  locationEvent = self->_locationEvent;
  if ((unint64_t)locationEvent | *((_QWORD *)v4 + 5))
  {
    if (!-[AWDHomeKitLocationEvent isEqual:](locationEvent, "isEqual:"))
      goto LABEL_26;
  }
  charThresholdEvent = self->_charThresholdEvent;
  if ((unint64_t)charThresholdEvent | *((_QWORD *)v4 + 3))
  {
    if (!-[AWDHomeKitCharacteristicThresholdEvent isEqual:](charThresholdEvent, "isEqual:"))
      goto LABEL_26;
  }
  calendarEvent = self->_calendarEvent;
  if ((unint64_t)calendarEvent | *((_QWORD *)v4 + 1))
  {
    if (!-[AWDHomeKitCalendarEvent isEqual:](calendarEvent, "isEqual:"))
      goto LABEL_26;
  }
  significantTimeEvent = self->_significantTimeEvent;
  if ((unint64_t)significantTimeEvent | *((_QWORD *)v4 + 7))
  {
    if (!-[AWDHomeKitSignificantTimeEvent isEqual:](significantTimeEvent, "isEqual:"))
      goto LABEL_26;
  }
  thresholdEvent = self->_thresholdEvent;
  if ((unint64_t)thresholdEvent | *((_QWORD *)v4 + 8))
  {
    if (!-[AWDHomeKitCharacteristicThresholdEvent isEqual:](thresholdEvent, "isEqual:"))
      goto LABEL_26;
  }
  presenceEvent = self->_presenceEvent;
  if ((unint64_t)presenceEvent | *((_QWORD *)v4 + 6))
  {
    if (!-[AWDHomeKitPresenceEvent isEqual:](presenceEvent, "isEqual:"))
      goto LABEL_26;
  }
  durationEvent = self->_durationEvent;
  if ((unint64_t)durationEvent | *((_QWORD *)v4 + 4))
    v13 = -[AWDHomeKitDurationEvent isEqual:](durationEvent, "isEqual:");
  else
    v13 = 1;
LABEL_27:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_endEvent;
  else
    v3 = 0;
  v4 = -[AWDHomeKitCharacteristicEvent hash](self->_charEvent, "hash") ^ v3;
  v5 = -[AWDHomeKitLocationEvent hash](self->_locationEvent, "hash");
  v6 = v4 ^ v5 ^ -[AWDHomeKitCharacteristicThresholdEvent hash](self->_charThresholdEvent, "hash");
  v7 = -[AWDHomeKitCalendarEvent hash](self->_calendarEvent, "hash");
  v8 = v7 ^ -[AWDHomeKitSignificantTimeEvent hash](self->_significantTimeEvent, "hash");
  v9 = v6 ^ v8 ^ -[AWDHomeKitCharacteristicThresholdEvent hash](self->_thresholdEvent, "hash");
  v10 = -[AWDHomeKitPresenceEvent hash](self->_presenceEvent, "hash");
  return v9 ^ v10 ^ -[AWDHomeKitDurationEvent hash](self->_durationEvent, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  AWDHomeKitCharacteristicEvent *charEvent;
  uint64_t v7;
  AWDHomeKitLocationEvent *locationEvent;
  uint64_t v9;
  AWDHomeKitCharacteristicThresholdEvent *charThresholdEvent;
  uint64_t v11;
  AWDHomeKitCalendarEvent *calendarEvent;
  uint64_t v13;
  AWDHomeKitSignificantTimeEvent *significantTimeEvent;
  uint64_t v15;
  AWDHomeKitCharacteristicThresholdEvent *thresholdEvent;
  uint64_t v17;
  AWDHomeKitPresenceEvent *presenceEvent;
  uint64_t v19;
  AWDHomeKitDurationEvent *durationEvent;
  uint64_t v21;
  _QWORD *v22;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    self->_endEvent = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 1u;
  }
  charEvent = self->_charEvent;
  v7 = v5[2];
  v22 = v5;
  if (charEvent)
  {
    if (!v7)
      goto LABEL_9;
    -[AWDHomeKitCharacteristicEvent mergeFrom:](charEvent, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[AWDHomeKitEventTriggerEvent setCharEvent:](self, "setCharEvent:");
  }
  v5 = v22;
LABEL_9:
  locationEvent = self->_locationEvent;
  v9 = v5[5];
  if (locationEvent)
  {
    if (!v9)
      goto LABEL_15;
    -[AWDHomeKitLocationEvent mergeFrom:](locationEvent, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[AWDHomeKitEventTriggerEvent setLocationEvent:](self, "setLocationEvent:");
  }
  v5 = v22;
LABEL_15:
  charThresholdEvent = self->_charThresholdEvent;
  v11 = v5[3];
  if (charThresholdEvent)
  {
    if (!v11)
      goto LABEL_21;
    -[AWDHomeKitCharacteristicThresholdEvent mergeFrom:](charThresholdEvent, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[AWDHomeKitEventTriggerEvent setCharThresholdEvent:](self, "setCharThresholdEvent:");
  }
  v5 = v22;
LABEL_21:
  calendarEvent = self->_calendarEvent;
  v13 = v5[1];
  if (calendarEvent)
  {
    if (!v13)
      goto LABEL_27;
    -[AWDHomeKitCalendarEvent mergeFrom:](calendarEvent, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    -[AWDHomeKitEventTriggerEvent setCalendarEvent:](self, "setCalendarEvent:");
  }
  v5 = v22;
LABEL_27:
  significantTimeEvent = self->_significantTimeEvent;
  v15 = v5[7];
  if (significantTimeEvent)
  {
    if (!v15)
      goto LABEL_33;
    -[AWDHomeKitSignificantTimeEvent mergeFrom:](significantTimeEvent, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_33;
    -[AWDHomeKitEventTriggerEvent setSignificantTimeEvent:](self, "setSignificantTimeEvent:");
  }
  v5 = v22;
LABEL_33:
  thresholdEvent = self->_thresholdEvent;
  v17 = v5[8];
  if (thresholdEvent)
  {
    if (!v17)
      goto LABEL_39;
    -[AWDHomeKitCharacteristicThresholdEvent mergeFrom:](thresholdEvent, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_39;
    -[AWDHomeKitEventTriggerEvent setThresholdEvent:](self, "setThresholdEvent:");
  }
  v5 = v22;
LABEL_39:
  presenceEvent = self->_presenceEvent;
  v19 = v5[6];
  if (presenceEvent)
  {
    if (!v19)
      goto LABEL_45;
    -[AWDHomeKitPresenceEvent mergeFrom:](presenceEvent, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_45;
    -[AWDHomeKitEventTriggerEvent setPresenceEvent:](self, "setPresenceEvent:");
  }
  v5 = v22;
LABEL_45:
  durationEvent = self->_durationEvent;
  v21 = v5[4];
  if (durationEvent)
  {
    if (v21)
    {
      -[AWDHomeKitDurationEvent mergeFrom:](durationEvent, "mergeFrom:");
LABEL_50:
      v5 = v22;
    }
  }
  else if (v21)
  {
    -[AWDHomeKitEventTriggerEvent setDurationEvent:](self, "setDurationEvent:");
    goto LABEL_50;
  }

}

- (BOOL)endEvent
{
  return self->_endEvent;
}

- (AWDHomeKitCharacteristicEvent)charEvent
{
  return self->_charEvent;
}

- (void)setCharEvent:(id)a3
{
  objc_storeStrong((id *)&self->_charEvent, a3);
}

- (AWDHomeKitLocationEvent)locationEvent
{
  return self->_locationEvent;
}

- (void)setLocationEvent:(id)a3
{
  objc_storeStrong((id *)&self->_locationEvent, a3);
}

- (AWDHomeKitCharacteristicThresholdEvent)charThresholdEvent
{
  return self->_charThresholdEvent;
}

- (void)setCharThresholdEvent:(id)a3
{
  objc_storeStrong((id *)&self->_charThresholdEvent, a3);
}

- (AWDHomeKitCalendarEvent)calendarEvent
{
  return self->_calendarEvent;
}

- (void)setCalendarEvent:(id)a3
{
  objc_storeStrong((id *)&self->_calendarEvent, a3);
}

- (AWDHomeKitSignificantTimeEvent)significantTimeEvent
{
  return self->_significantTimeEvent;
}

- (void)setSignificantTimeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_significantTimeEvent, a3);
}

- (AWDHomeKitCharacteristicThresholdEvent)thresholdEvent
{
  return self->_thresholdEvent;
}

- (void)setThresholdEvent:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdEvent, a3);
}

- (AWDHomeKitPresenceEvent)presenceEvent
{
  return self->_presenceEvent;
}

- (void)setPresenceEvent:(id)a3
{
  objc_storeStrong((id *)&self->_presenceEvent, a3);
}

- (AWDHomeKitDurationEvent)durationEvent
{
  return self->_durationEvent;
}

- (void)setDurationEvent:(id)a3
{
  objc_storeStrong((id *)&self->_durationEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdEvent, 0);
  objc_storeStrong((id *)&self->_significantTimeEvent, 0);
  objc_storeStrong((id *)&self->_presenceEvent, 0);
  objc_storeStrong((id *)&self->_locationEvent, 0);
  objc_storeStrong((id *)&self->_durationEvent, 0);
  objc_storeStrong((id *)&self->_charThresholdEvent, 0);
  objc_storeStrong((id *)&self->_charEvent, 0);
  objc_storeStrong((id *)&self->_calendarEvent, 0);
}

@end
