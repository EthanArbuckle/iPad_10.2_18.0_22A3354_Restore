@implementation RfMeasInfo

- (void)setMag:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mag = a3;
}

- (void)setHasMag:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMag
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPhase:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_phase = a3;
}

- (void)setHasPhase:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPhase
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAccessory:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_accessory = a3;
}

- (void)setHasAccessory:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccessory
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTxPwrDb2:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_txPwrDb2 = a3;
}

- (void)setHasTxPwrDb2:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTxPwrDb2
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTxSkuIdx:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_txSkuIdx = a3;
}

- (void)setHasTxSkuIdx:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasTxSkuIdx
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setScenario:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_scenario = a3;
}

- (void)setHasScenario:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasScenario
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setPortPositionSf:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_portPositionSf = a3;
}

- (void)setHasPortPositionSf:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPortPositionSf
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTunerStateCounter:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_tunerStateCounter = a3;
}

- (void)setHasTunerStateCounter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTunerStateCounter
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RfMeasInfo;
  v3 = -[RfMeasInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RfMeasInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

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
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_mag));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("mag"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_phase));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("phase"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_accessory));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("accessory"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_txPwrDb2));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("tx_pwr_db2"));

  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_txSkuIdx));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("tx_sku_idx"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_17:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_portPositionSf));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("port_position_sf"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_9;
  }
LABEL_16:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_scenario));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("scenario"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tunerStateCounter));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tuner_state_counter"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000087EC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint32Field(v5, self->_mag, 1);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field(v5, self->_phase, 2);
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field(v5, self->_accessory, 3);
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteSint32Field(v5, self->_txPwrDb2, 4);
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field(v5, self->_txSkuIdx, 5);
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_17:
    PBDataWriterWriteUint32Field(v5, self->_portPositionSf, 7);
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  PBDataWriterWriteUint32Field(v5, self->_scenario, 6);
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x20) != 0)
LABEL_9:
    PBDataWriterWriteUint32Field(v5, self->_tunerStateCounter, 8);
LABEL_10:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_mag;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_phase;
  *((_BYTE *)v4 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v4[2] = self->_accessory;
  *((_BYTE *)v4 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v4[8] = self->_txPwrDb2;
  *((_BYTE *)v4 + 40) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v4[9] = self->_txSkuIdx;
  *((_BYTE *)v4 + 40) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
LABEL_17:
    v4[5] = self->_portPositionSf;
    *((_BYTE *)v4 + 40) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  v4[6] = self->_scenario;
  *((_BYTE *)v4 + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v4[7] = self->_tunerStateCounter;
    *((_BYTE *)v4 + 40) |= 0x20u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_mag;
    *((_BYTE *)result + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_phase;
  *((_BYTE *)result + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 2) = self->_accessory;
  *((_BYTE *)result + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 8) = self->_txPwrDb2;
  *((_BYTE *)result + 40) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 9) = self->_txSkuIdx;
  *((_BYTE *)result + 40) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 6) = self->_scenario;
  *((_BYTE *)result + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 5) = self->_portPositionSf;
  *((_BYTE *)result + 40) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return result;
LABEL_9:
  *((_DWORD *)result + 7) = self->_tunerStateCounter;
  *((_BYTE *)result + 40) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_41;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_mag != *((_DWORD *)v4 + 3))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_phase != *((_DWORD *)v4 + 4))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_accessory != *((_DWORD *)v4 + 2))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x40) == 0 || self->_txPwrDb2 != *((_DWORD *)v4 + 8))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 0x40) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x80) == 0 || self->_txSkuIdx != *((_DWORD *)v4 + 9))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 0x80) != 0)
  {
LABEL_41:
    v6 = 0;
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x10) == 0 || self->_scenario != *((_DWORD *)v4 + 6))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_portPositionSf != *((_DWORD *)v4 + 5))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_41;
  }
  v6 = (*((_BYTE *)v4 + 40) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x20) == 0 || self->_tunerStateCounter != *((_DWORD *)v4 + 7))
      goto LABEL_41;
    v6 = 1;
  }
LABEL_42:

  return v6;
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
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_mag;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_phase;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_accessory;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_txPwrDb2;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_txSkuIdx;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_scenario;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761 * self->_portPositionSf;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761 * self->_tunerStateCounter;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_mag = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_phase = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_accessory = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_txPwrDb2 = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_txSkuIdx = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 0x80u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
LABEL_17:
    self->_portPositionSf = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 40) & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  self->_scenario = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 8) != 0)
    goto LABEL_17;
LABEL_8:
  if ((v5 & 0x20) != 0)
  {
LABEL_9:
    self->_tunerStateCounter = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_10:

}

- (int)mag
{
  return self->_mag;
}

- (int)phase
{
  return self->_phase;
}

- (unsigned)accessory
{
  return self->_accessory;
}

- (int)txPwrDb2
{
  return self->_txPwrDb2;
}

- (unsigned)txSkuIdx
{
  return self->_txSkuIdx;
}

- (unsigned)scenario
{
  return self->_scenario;
}

- (unsigned)portPositionSf
{
  return self->_portPositionSf;
}

- (unsigned)tunerStateCounter
{
  return self->_tunerStateCounter;
}

@end
