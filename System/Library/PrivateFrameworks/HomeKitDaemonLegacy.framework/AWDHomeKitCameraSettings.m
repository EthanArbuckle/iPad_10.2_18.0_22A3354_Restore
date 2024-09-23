@implementation AWDHomeKitCameraSettings

- (void)setIsRecordingEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isRecordingEnabled = a3;
}

- (void)setHasIsRecordingEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsRecordingEnabled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsRecordingAudioEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isRecordingAudioEnabled = a3;
}

- (void)setHasIsRecordingAudioEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsRecordingAudioEnabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRecordingEventTriggers:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_recordingEventTriggers = a3;
}

- (void)setHasRecordingEventTriggers:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRecordingEventTriggers
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsSmartBulletinBoardNotificationEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isSmartBulletinBoardNotificationEnabled = a3;
}

- (void)setHasIsSmartBulletinBoardNotificationEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsSmartBulletinBoardNotificationEnabled
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsInclusionZone:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isInclusionZone = a3;
}

- (void)setHasIsInclusionZone:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsInclusionZone
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsReachabilityNotificationEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isReachabilityNotificationEnabled = a3;
}

- (void)setHasIsReachabilityNotificationEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsReachabilityNotificationEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsRecordingCapable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isRecordingCapable = a3;
}

- (void)setHasIsRecordingCapable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsRecordingCapable
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasNumActivityZonesBinString
{
  return self->_numActivityZonesBinString != 0;
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
  v8.super_class = (Class)AWDHomeKitCameraSettings;
  -[AWDHomeKitCameraSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitCameraSettings dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *numActivityZonesBinString;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRecordingEnabled);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("isRecordingEnabled"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRecordingAudioEnabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("isRecordingAudioEnabled"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_recordingEventTriggers);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("recordingEventTriggers"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSmartBulletinBoardNotificationEnabled);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("isSmartBulletinBoardNotificationEnabled"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInclusionZone);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("isInclusionZone"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isReachabilityNotificationEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("isReachabilityNotificationEnabled"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRecordingCapable);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isRecordingCapable"));

  }
LABEL_9:
  numActivityZonesBinString = self->_numActivityZonesBinString;
  if (numActivityZonesBinString)
    objc_msgSend(v3, "setObject:forKey:", numActivityZonesBinString, CFSTR("numActivityZonesBinString"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitCameraSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_9:
  if (self->_numActivityZonesBinString)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[24] = self->_isRecordingEnabled;
    v4[28] |= 0x20u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[22] = self->_isRecordingAudioEnabled;
  v4[28] |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 4) = self->_recordingEventTriggers;
  v4[28] |= 1u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v4[25] = self->_isSmartBulletinBoardNotificationEnabled;
  v4[28] |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v4[20] = self->_isInclusionZone;
  v4[28] |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  v4[21] = self->_isReachabilityNotificationEnabled;
  v4[28] |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    v4[23] = self->_isRecordingCapable;
    v4[28] |= 0x10u;
  }
LABEL_9:
  if (self->_numActivityZonesBinString)
  {
    v6 = v4;
    objc_msgSend(v4, "setNumActivityZonesBinString:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_isRecordingEnabled;
    *(_BYTE *)(v5 + 28) |= 0x20u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 22) = self->_isRecordingAudioEnabled;
  *(_BYTE *)(v5 + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v5 + 16) = self->_recordingEventTriggers;
  *(_BYTE *)(v5 + 28) |= 1u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *(_BYTE *)(v5 + 25) = self->_isSmartBulletinBoardNotificationEnabled;
  *(_BYTE *)(v5 + 28) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_15:
    *(_BYTE *)(v5 + 21) = self->_isReachabilityNotificationEnabled;
    *(_BYTE *)(v5 + 28) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  *(_BYTE *)(v5 + 20) = self->_isInclusionZone;
  *(_BYTE *)(v5 + 28) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x10) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 23) = self->_isRecordingCapable;
    *(_BYTE *)(v5 + 28) |= 0x10u;
  }
LABEL_9:
  v8 = -[NSString copyWithZone:](self->_numActivityZonesBinString, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSString *numActivityZonesBinString;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_51;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x20) == 0)
      goto LABEL_51;
    if (self->_isRecordingEnabled)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_51;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_51;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 0x20) != 0)
  {
    goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) == 0)
      goto LABEL_51;
    if (self->_isRecordingAudioEnabled)
    {
      if (!*((_BYTE *)v4 + 22))
        goto LABEL_51;
    }
    else if (*((_BYTE *)v4 + 22))
    {
      goto LABEL_51;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 8) != 0)
  {
    goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_recordingEventTriggers != *((_DWORD *)v4 + 4))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x40) == 0)
      goto LABEL_51;
    if (self->_isSmartBulletinBoardNotificationEnabled)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_51;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_51;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 0x40) != 0)
  {
    goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_51;
    if (self->_isInclusionZone)
    {
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_51;
    }
    else if (*((_BYTE *)v4 + 20))
    {
      goto LABEL_51;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
      goto LABEL_51;
    if (self->_isReachabilityNotificationEnabled)
    {
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_51;
    }
    else if (*((_BYTE *)v4 + 21))
    {
      goto LABEL_51;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x10) == 0)
      goto LABEL_57;
LABEL_51:
    v5 = 0;
    goto LABEL_52;
  }
  if ((*((_BYTE *)v4 + 28) & 0x10) == 0)
    goto LABEL_51;
  if (!self->_isRecordingCapable)
  {
    if (!*((_BYTE *)v4 + 23))
      goto LABEL_57;
    goto LABEL_51;
  }
  if (!*((_BYTE *)v4 + 23))
    goto LABEL_51;
LABEL_57:
  numActivityZonesBinString = self->_numActivityZonesBinString;
  if ((unint64_t)numActivityZonesBinString | *((_QWORD *)v4 + 1))
    v5 = -[NSString isEqual:](numActivityZonesBinString, "isEqual:");
  else
    v5 = 1;
LABEL_52:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v2 = 2654435761 * self->_isRecordingEnabled;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isRecordingAudioEnabled;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_recordingEventTriggers;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_isSmartBulletinBoardNotificationEnabled;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_isInclusionZone;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_numActivityZonesBinString, "hash");
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_isReachabilityNotificationEnabled;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_isRecordingCapable;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_numActivityZonesBinString, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 0x20) != 0)
  {
    self->_isRecordingEnabled = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)v4 + 28);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_isRecordingAudioEnabled = *((_BYTE *)v4 + 22);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_recordingEventTriggers = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_isSmartBulletinBoardNotificationEnabled = *((_BYTE *)v4 + 25);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_isInclusionZone = *((_BYTE *)v4 + 20);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  self->_isReachabilityNotificationEnabled = *((_BYTE *)v4 + 21);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 28) & 0x10) != 0)
  {
LABEL_8:
    self->_isRecordingCapable = *((_BYTE *)v4 + 23);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[AWDHomeKitCameraSettings setNumActivityZonesBinString:](self, "setNumActivityZonesBinString:");
    v4 = v6;
  }

}

- (BOOL)isRecordingEnabled
{
  return self->_isRecordingEnabled;
}

- (BOOL)isRecordingAudioEnabled
{
  return self->_isRecordingAudioEnabled;
}

- (unsigned)recordingEventTriggers
{
  return self->_recordingEventTriggers;
}

- (BOOL)isSmartBulletinBoardNotificationEnabled
{
  return self->_isSmartBulletinBoardNotificationEnabled;
}

- (BOOL)isInclusionZone
{
  return self->_isInclusionZone;
}

- (BOOL)isReachabilityNotificationEnabled
{
  return self->_isReachabilityNotificationEnabled;
}

- (BOOL)isRecordingCapable
{
  return self->_isRecordingCapable;
}

- (NSString)numActivityZonesBinString
{
  return self->_numActivityZonesBinString;
}

- (void)setNumActivityZonesBinString:(id)a3
{
  objc_storeStrong((id *)&self->_numActivityZonesBinString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numActivityZonesBinString, 0);
}

@end
