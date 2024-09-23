@implementation NTPBNetworkSession

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (BOOL)wifiReachable
{
  return self->_wifiReachable;
}

- (int)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

- (void)setSessionID:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sessionID = a3;
}

- (void)setWifiReachable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_wifiReachable = a3;
}

- (void)setCellularRadioAccessTechnology:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cellularRadioAccessTechnology = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionID
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasWifiReachable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWifiReachable
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasCellularRadioAccessTechnology:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCellularRadioAccessTechnology
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkSession;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBNetworkSession description](&v3, sel_description), -[NTPBNetworkSession dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wifiReachable), CFSTR("wifi_reachable"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sessionID), CFSTR("session_ID"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cellularRadioAccessTechnology), CFSTR("cellular_radio_access_technology"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNetworkSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        return;
LABEL_7:
      PBDataWriterWriteInt32Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_sessionID;
    *((_BYTE *)result + 24) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 20) = self->_wifiReachable;
  *((_BYTE *)result + 24) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 4) = self->_cellularRadioAccessTechnology;
  *((_BYTE *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_sessionID != *((_QWORD *)a3 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    if ((*((_BYTE *)a3 + 24) & 4) != 0)
      goto LABEL_19;
    goto LABEL_15;
  }
  if ((*((_BYTE *)a3 + 24) & 4) == 0)
    goto LABEL_19;
  if (self->_wifiReachable)
  {
    if (!*((_BYTE *)a3 + 20))
      goto LABEL_19;
    goto LABEL_15;
  }
  if (*((_BYTE *)a3 + 20))
  {
LABEL_19:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_15:
  LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_cellularRadioAccessTechnology != *((_DWORD *)a3 + 4))
      goto LABEL_19;
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761u * self->_sessionID;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_wifiReachable;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_cellularRadioAccessTechnology;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 24);
  if ((v3 & 1) != 0)
  {
    self->_sessionID = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 24);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0)
        return;
LABEL_7:
      self->_cellularRadioAccessTechnology = *((_DWORD *)a3 + 4);
      *(_BYTE *)&self->_has |= 2u;
      return;
    }
  }
  else if ((*((_BYTE *)a3 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_wifiReachable = *((_BYTE *)a3 + 20);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 24) & 2) != 0)
    goto LABEL_7;
}

@end
