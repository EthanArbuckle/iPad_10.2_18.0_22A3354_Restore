@implementation BLTPBSectionInfoSettings

- (void)setAnnounceSetting:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_announceSetting = a3;
}

- (void)setHasAnnounceSetting:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnnounceSetting
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasMuteAssertion
{
  return self->_muteAssertion != 0;
}

- (void)setTimeSensitiveSetting:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timeSensitiveSetting = a3;
}

- (void)setHasTimeSensitiveSetting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimeSensitiveSetting
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_userConfiguredTimeSensitiveSetting = a3;
}

- (void)setHasUserConfiguredTimeSensitiveSetting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUserConfiguredTimeSensitiveSetting
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setScheduledDeliverySetting:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_scheduledDeliverySetting = a3;
}

- (void)setHasScheduledDeliverySetting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScheduledDeliverySetting
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSectionInfoSettings;
  -[BLTPBSectionInfoSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBSectionInfoSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  BLTPBMuteAssertion *muteAssertion;
  void *v6;
  char has;
  void *v8;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_announceSetting);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("announceSetting"));

  }
  muteAssertion = self->_muteAssertion;
  if (muteAssertion)
  {
    -[BLTPBMuteAssertion dictionaryRepresentation](muteAssertion, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("muteAssertion"));

  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_userConfiguredTimeSensitiveSetting);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("userConfiguredTimeSensitiveSetting"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_timeSensitiveSetting);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("timeSensitiveSetting"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_scheduledDeliverySetting);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("scheduledDeliverySetting"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSectionInfoSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_muteAssertion)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 2) != 0)
LABEL_8:
    PBDataWriterWriteInt32Field();
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_announceSetting;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  if (self->_muteAssertion)
  {
    v6 = v4;
    objc_msgSend(v4, "setMuteAssertion:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
LABEL_11:
    *((_BYTE *)v4 + 32) = self->_userConfiguredTimeSensitiveSetting;
    *((_BYTE *)v4 + 36) |= 8u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v4[7] = self->_timeSensitiveSetting;
  *((_BYTE *)v4 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    v4[6] = self->_scheduledDeliverySetting;
    *((_BYTE *)v4 + 36) |= 2u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_announceSetting;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v7 = -[BLTPBMuteAssertion copyWithZone:](self->_muteAssertion, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_5;
LABEL_9:
    *(_BYTE *)(v6 + 32) = self->_userConfiguredTimeSensitiveSetting;
    *(_BYTE *)(v6 + 36) |= 8u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v6;
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 28) = self->_timeSensitiveSetting;
  *(_BYTE *)(v6 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 24) = self->_scheduledDeliverySetting;
    *(_BYTE *)(v6 + 36) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  BLTPBMuteAssertion *muteAssertion;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_announceSetting != *((_DWORD *)v4 + 2))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_27;
  }
  muteAssertion = self->_muteAssertion;
  if ((unint64_t)muteAssertion | *((_QWORD *)v4 + 2))
  {
    if (!-[BLTPBMuteAssertion isEqual:](muteAssertion, "isEqual:"))
      goto LABEL_27;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_timeSensitiveSetting != *((_DWORD *)v4 + 7))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) != 0)
    {
      if (self->_userConfiguredTimeSensitiveSetting)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_27;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_23;
    }
LABEL_27:
    v7 = 0;
    goto LABEL_28;
  }
  if ((*((_BYTE *)v4 + 36) & 8) != 0)
    goto LABEL_27;
LABEL_23:
  v7 = (*((_BYTE *)v4 + 36) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_scheduledDeliverySetting != *((_DWORD *)v4 + 6))
      goto LABEL_27;
    v7 = 1;
  }
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_announceSetting;
  else
    v3 = 0;
  v4 = -[BLTPBMuteAssertion hash](self->_muteAssertion, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_timeSensitiveSetting;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761 * self->_userConfiguredTimeSensitiveSetting;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_7:
  v7 = 2654435761 * self->_scheduledDeliverySetting;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  BLTPBMuteAssertion *muteAssertion;
  uint64_t v7;
  char v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if ((v4[9] & 1) != 0)
  {
    self->_announceSetting = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  muteAssertion = self->_muteAssertion;
  v7 = *((_QWORD *)v5 + 2);
  if (muteAssertion)
  {
    if (!v7)
      goto LABEL_9;
    v9 = v5;
    -[BLTPBMuteAssertion mergeFrom:](muteAssertion, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    v9 = v5;
    -[BLTPBSectionInfoSettings setMuteAssertion:](self, "setMuteAssertion:");
  }
  v5 = v9;
LABEL_9:
  v8 = *((_BYTE *)v5 + 36);
  if ((v8 & 4) == 0)
  {
    if ((*((_BYTE *)v5 + 36) & 8) == 0)
      goto LABEL_11;
LABEL_15:
    self->_userConfiguredTimeSensitiveSetting = *((_BYTE *)v5 + 32);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v5 + 36) & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  self->_timeSensitiveSetting = *((_DWORD *)v5 + 7);
  *(_BYTE *)&self->_has |= 4u;
  v8 = *((_BYTE *)v5 + 36);
  if ((v8 & 8) != 0)
    goto LABEL_15;
LABEL_11:
  if ((v8 & 2) != 0)
  {
LABEL_12:
    self->_scheduledDeliverySetting = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_13:

}

- (int)announceSetting
{
  return self->_announceSetting;
}

- (BLTPBMuteAssertion)muteAssertion
{
  return self->_muteAssertion;
}

- (void)setMuteAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_muteAssertion, a3);
}

- (int)timeSensitiveSetting
{
  return self->_timeSensitiveSetting;
}

- (BOOL)userConfiguredTimeSensitiveSetting
{
  return self->_userConfiguredTimeSensitiveSetting;
}

- (int)scheduledDeliverySetting
{
  return self->_scheduledDeliverySetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteAssertion, 0);
}

@end
