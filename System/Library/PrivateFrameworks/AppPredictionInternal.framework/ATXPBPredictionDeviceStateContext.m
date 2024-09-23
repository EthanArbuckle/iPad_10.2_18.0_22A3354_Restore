@implementation ATXPBPredictionDeviceStateContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiSSID, 0);
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (BOOL)onWifi
{
  return self->_onWifi;
}

- (BOOL)inAirplaneMode
{
  return self->_inAirplaneMode;
}

- (void)setWifiSSID:(id)a3
{
  objc_storeStrong((id *)&self->_wifiSSID, a3);
}

- (void)setOnWifi:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_onWifi = a3;
}

- (void)setInAirplaneMode:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_inAirplaneMode = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_wifiSSID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)setHasOnWifi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOnWifi
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasWifiSSID
{
  return self->_wifiSSID != 0;
}

- (void)setHasInAirplaneMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInAirplaneMode
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBPredictionDeviceStateContext;
  -[ATXPBPredictionDeviceStateContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBPredictionDeviceStateContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *wifiSSID;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onWifi);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("onWifi"));

  }
  wifiSSID = self->_wifiSSID;
  if (wifiSSID)
    objc_msgSend(v3, "setObject:forKey:", wifiSSID, CFSTR("wifiSSID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inAirplaneMode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("inAirplaneMode"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPredictionDeviceStateContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[17] = self->_onWifi;
    v4[20] |= 2u;
  }
  if (self->_wifiSSID)
  {
    v5 = v4;
    objc_msgSend(v4, "setWifiSSID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_inAirplaneMode;
    v4[20] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 17) = self->_onWifi;
    *(_BYTE *)(v5 + 20) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_wifiSSID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v6 + 16) = self->_inAirplaneMode;
    *(_BYTE *)(v6 + 20) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *wifiSSID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
      goto LABEL_15;
    if (self->_onWifi)
    {
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_15;
    }
    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_15;
  }
  wifiSSID = self->_wifiSSID;
  if ((unint64_t)wifiSSID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](wifiSSID, "isEqual:"))
      goto LABEL_15;
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0)
    {
      if (self->_inAirplaneMode)
      {
        if (!*((_BYTE *)v4 + 16))
          goto LABEL_15;
      }
      else if (*((_BYTE *)v4 + 16))
      {
        goto LABEL_15;
      }
      v7 = 1;
      goto LABEL_16;
    }
LABEL_15:
    v7 = 0;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_onWifi;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_wifiSSID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_inAirplaneMode;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((v4[20] & 2) != 0)
  {
    self->_onWifi = v4[17];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[ATXPBPredictionDeviceStateContext setWifiSSID:](self, "setWifiSSID:");
    v4 = v5;
  }
  if ((v4[20] & 1) != 0)
  {
    self->_inAirplaneMode = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }

}

@end
