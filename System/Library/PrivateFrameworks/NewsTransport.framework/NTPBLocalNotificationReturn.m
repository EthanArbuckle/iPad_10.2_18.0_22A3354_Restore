@implementation NTPBLocalNotificationReturn

- (void)setLocalNotificationDirectOpen:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_localNotificationDirectOpen = a3;
}

- (void)setHasLocalNotificationDirectOpen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLocalNotificationDirectOpen
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setLocalNoticationNumberReceived:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_localNoticationNumberReceived = a3;
}

- (void)setHasLocalNoticationNumberReceived:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocalNoticationNumberReceived
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)localNotificationType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_localNotificationType;
  else
    return 0;
}

- (void)setLocalNotificationType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_localNotificationType = a3;
}

- (void)setHasLocalNotificationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLocalNotificationType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setLocalNotificationSentTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_localNotificationSentTimestamp = a3;
}

- (void)setHasLocalNotificationSentTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocalNotificationSentTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLocalNotificationDirectOpenNumber:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_localNotificationDirectOpenNumber = a3;
}

- (void)setHasLocalNotificationDirectOpenNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLocalNotificationDirectOpenNumber
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)NTPBLocalNotificationReturn;
  -[NTPBLocalNotificationReturn description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBLocalNotificationReturn dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_localNotificationDirectOpen);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("local_notification_direct_open"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_localNoticationNumberReceived);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("local_notication_number_received"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_localNotificationSentTimestamp);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("local_notification_sent_timestamp"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_localNotificationType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("local_notification_type"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_localNotificationDirectOpenNumber);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("local_notification_direct_open_number"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBLocalNotificationReturnReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteInt64Field();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 4) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_BYTE *)result + 28) = self->_localNotificationDirectOpen;
    *((_BYTE *)result + 32) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_localNoticationNumberReceived;
  *((_BYTE *)result + 32) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 6) = self->_localNotificationType;
  *((_BYTE *)result + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_QWORD *)result + 1) = self->_localNotificationSentTimestamp;
  *((_BYTE *)result + 32) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 5) = self->_localNotificationDirectOpenNumber;
  *((_BYTE *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
    {
      if (self->_localNotificationDirectOpen)
      {
        if (!*((_BYTE *)v4 + 28))
          goto LABEL_29;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_10;
    }
LABEL_29:
    v5 = 0;
    goto LABEL_30;
  }
  if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
    goto LABEL_29;
LABEL_10:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_localNoticationNumberReceived != *((_DWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_localNotificationType != *((_DWORD *)v4 + 6))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_localNotificationSentTimestamp != *((_QWORD *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_29;
  }
  v5 = (*((_BYTE *)v4 + 32) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_localNotificationDirectOpenNumber != *((_DWORD *)v4 + 5))
      goto LABEL_29;
    v5 = 1;
  }
LABEL_30:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v2 = 2654435761 * self->_localNotificationDirectOpen;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_localNoticationNumberReceived;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_localNotificationType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_localNotificationSentTimestamp;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_localNotificationDirectOpenNumber;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 0x10) != 0)
  {
    self->_localNotificationDirectOpen = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_localNoticationNumberReceived = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
LABEL_11:
    self->_localNotificationSentTimestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 32) & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_localNotificationType = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 4) != 0)
  {
LABEL_6:
    self->_localNotificationDirectOpenNumber = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_7:

}

- (BOOL)localNotificationDirectOpen
{
  return self->_localNotificationDirectOpen;
}

- (int)localNoticationNumberReceived
{
  return self->_localNoticationNumberReceived;
}

- (int64_t)localNotificationSentTimestamp
{
  return self->_localNotificationSentTimestamp;
}

- (int)localNotificationDirectOpenNumber
{
  return self->_localNotificationDirectOpenNumber;
}

@end
