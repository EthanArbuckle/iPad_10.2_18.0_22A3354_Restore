@implementation NSSAirplaneModeSettingsMsg

- (void)setCellularOn:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cellularOn = a3;
}

- (void)setHasCellularOn:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCellularOn
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NSSAirplaneModeSettingsMsg;
  -[NSSAirplaneModeSettingsMsg description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSAirplaneModeSettingsMsg dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cellularOn);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("cellularOn"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wifiOn);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("wifiOn"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_bluetoothOn);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("bluetoothOn"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSAirplaneModeSettingsMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)a3 + 9) = self->_cellularOn;
    *((_BYTE *)a3 + 12) |= 1u;
  }
  *((_BYTE *)a3 + 10) = self->_wifiOn;
  *((_BYTE *)a3 + 8) = self->_bluetoothOn;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)result + 9) = self->_cellularOn;
    *((_BYTE *)result + 12) |= 1u;
  }
  *((_BYTE *)result + 10) = self->_wifiOn;
  *((_BYTE *)result + 8) = self->_bluetoothOn;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) == 0)
      goto LABEL_16;
    if (self->_cellularOn)
    {
      if (!v4[9])
        goto LABEL_16;
    }
    else if (v4[9])
    {
      goto LABEL_16;
    }
  }
  else if ((v4[12] & 1) != 0)
  {
    goto LABEL_16;
  }
  if (self->_wifiOn)
  {
    if (v4[10])
      goto LABEL_12;
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if (v4[10])
    goto LABEL_16;
LABEL_12:
  if (self->_bluetoothOn)
    v5 = v4[8] != 0;
  else
    v5 = v4[8] == 0;
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_cellularOn;
  else
    v2 = 0;
  return (2654435761 * self->_wifiOn) ^ v2 ^ (2654435761 * self->_bluetoothOn);
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    self->_cellularOn = *((_BYTE *)a3 + 9);
    *(_BYTE *)&self->_has |= 1u;
  }
  self->_wifiOn = *((_BYTE *)a3 + 10);
  self->_bluetoothOn = *((_BYTE *)a3 + 8);
}

- (BOOL)cellularOn
{
  return self->_cellularOn;
}

- (BOOL)wifiOn
{
  return self->_wifiOn;
}

- (void)setWifiOn:(BOOL)a3
{
  self->_wifiOn = a3;
}

- (BOOL)bluetoothOn
{
  return self->_bluetoothOn;
}

- (void)setBluetoothOn:(BOOL)a3
{
  self->_bluetoothOn = a3;
}

@end
