@implementation CLPPoiWifiAccessPoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mac, 0);
}

- (void)setRssi:(int)a3
{
  self->_rssi = a3;
}

- (void)setChannel:(int)a3
{
  self->_channel = a3;
}

- (void)setMac:(id)a3
{
  objc_storeStrong((id *)&self->_mac, a3);
}

- (void)setScanTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_scanTimestamp = a3;
}

- (void)setAge:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_age = a3;
}

- (void)setHasAge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAge
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasScanTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScanTimestamp
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CLPPoiWifiAccessPoint;
  -[CLPPoiWifiAccessPoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPPoiWifiAccessPoint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *mac;
  void *v6;
  void *v7;
  char has;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  mac = self->_mac;
  if (mac)
    objc_msgSend(v3, "setObject:forKey:", mac, CFSTR("mac"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rssi);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("rssi"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_channel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("channel"));

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_age);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("age"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_scanTimestamp);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("scanTimestamp"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPoiWifiAccessPointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (!self->_mac)
    -[CLPPoiWifiAccessPoint writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setMac:", self->_mac);
  *((_DWORD *)v5 + 10) = self->_rssi;
  *((_DWORD *)v5 + 6) = self->_channel;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_age;
    *((_BYTE *)v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_scanTimestamp;
    *((_BYTE *)v5 + 44) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_mac, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  *(_DWORD *)(v5 + 40) = self->_rssi;
  *(_DWORD *)(v5 + 24) = self->_channel;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_age;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_scanTimestamp;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *mac;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  mac = self->_mac;
  if ((unint64_t)mac | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](mac, "isEqual:"))
      goto LABEL_15;
  }
  if (self->_rssi != *((_DWORD *)v4 + 10) || self->_channel != *((_DWORD *)v4 + 6))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_age != *((double *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_15:
    v6 = 0;
    goto LABEL_16;
  }
  v6 = (*((_BYTE *)v4 + 44) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_scanTimestamp != *((double *)v4 + 2))
      goto LABEL_15;
    v6 = 1;
  }
LABEL_16:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t rssi;
  uint64_t channel;
  char has;
  unint64_t v7;
  double age;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  double scanTimestamp;
  double v14;
  long double v15;
  double v16;

  v3 = -[NSString hash](self->_mac, "hash");
  rssi = self->_rssi;
  channel = self->_channel;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    age = self->_age;
    v9 = -age;
    if (age >= 0.0)
      v9 = self->_age;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((has & 2) != 0)
  {
    scanTimestamp = self->_scanTimestamp;
    v14 = -scanTimestamp;
    if (scanTimestamp >= 0.0)
      v14 = self->_scanTimestamp;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return (2654435761 * rssi) ^ v3 ^ (2654435761 * channel) ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[CLPPoiWifiAccessPoint setMac:](self, "setMac:");
    v4 = v6;
  }
  self->_rssi = *((_DWORD *)v4 + 10);
  self->_channel = *((_DWORD *)v4 + 6);
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
  {
    self->_age = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_scanTimestamp = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)mac
{
  return self->_mac;
}

- (int)rssi
{
  return self->_rssi;
}

- (int)channel
{
  return self->_channel;
}

- (double)age
{
  return self->_age;
}

- (double)scanTimestamp
{
  return self->_scanTimestamp;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPPoiWifiAccessPoint writeTo:]", "CLPCollectionRequest.gen.m", 31449, "nil != self->_mac");
}

@end
