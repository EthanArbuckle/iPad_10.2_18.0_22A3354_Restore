@implementation CLPIndoorWifiScan

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
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

- (void)setHidden:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hidden = a3;
}

- (void)setAge:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_age = a3;
}

- (void)setHasHidden:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHidden
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAge
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
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
  v8.super_class = (Class)CLPIndoorWifiScan;
  -[CLPIndoorWifiScan description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPIndoorWifiScan dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v8;
  void *v9;
  NSString *bundleId;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  mac = self->_mac;
  if (mac)
    objc_msgSend(v3, "setObject:forKey:", mac, CFSTR("mac"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_channel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("channel"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_hidden);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("hidden"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rssi);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("rssi"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_age);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("age"));

  }
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIndoorWifiScanReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteDoubleField();
  if (!self->_mac)
    -[CLPIndoorWifiScan writeTo:].cold.1();
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v4 = v5;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  _QWORD *v5;

  v5 = a3;
  v5[2] = *(_QWORD *)&self->_timestamp;
  objc_msgSend(v5, "setMac:", self->_mac);
  v4 = v5;
  *((_DWORD *)v5 + 8) = self->_channel;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 9) = self->_hidden;
    *((_BYTE *)v5 + 52) |= 2u;
  }
  *((_DWORD *)v5 + 12) = self->_rssi;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_age;
    *((_BYTE *)v5 + 52) |= 1u;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v5, "setBundleId:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 16) = self->_timestamp;
  v6 = -[NSString copyWithZone:](self->_mac, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  *(_DWORD *)(v5 + 32) = self->_channel;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_hidden;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
  *(_DWORD *)(v5 + 48) = self->_rssi;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_age;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *mac;
  NSString *bundleId;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if (self->_timestamp != *((double *)v4 + 2))
    goto LABEL_19;
  mac = self->_mac;
  if ((unint64_t)mac | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](mac, "isEqual:"))
      goto LABEL_19;
  }
  if (self->_channel != *((_DWORD *)v4 + 8))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_hidden != *((_DWORD *)v4 + 9))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_19;
  }
  if (self->_rssi != *((_DWORD *)v4 + 12))
  {
LABEL_19:
    v7 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_age != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_19;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 3))
    v7 = -[NSString isEqual:](bundleId, "isEqual:");
  else
    v7 = 1;
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  double timestamp;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t channel;
  uint64_t rssi;
  unint64_t v16;
  double age;
  double v18;
  long double v19;
  double v20;

  timestamp = self->_timestamp;
  v4 = -timestamp;
  if (timestamp >= 0.0)
    v4 = self->_timestamp;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  v12 = -[NSString hash](self->_mac, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v13 = 2654435761 * self->_hidden;
  else
    v13 = 0;
  channel = self->_channel;
  rssi = self->_rssi;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    age = self->_age;
    v18 = -age;
    if (age >= 0.0)
      v18 = self->_age;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  return v12 ^ v11 ^ (2654435761 * channel) ^ v13 ^ (2654435761 * rssi) ^ v16 ^ -[NSString hash](self->_bundleId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_timestamp = *((double *)v4 + 2);
  v5 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[CLPIndoorWifiScan setMac:](self, "setMac:");
    v4 = v5;
  }
  self->_channel = *((_DWORD *)v4 + 8);
  if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    self->_hidden = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 2u;
  }
  self->_rssi = *((_DWORD *)v4 + 12);
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_age = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[CLPIndoorWifiScan setBundleId:](self, "setBundleId:");
    v4 = v5;
  }

}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)mac
{
  return self->_mac;
}

- (int)channel
{
  return self->_channel;
}

- (int)hidden
{
  return self->_hidden;
}

- (int)rssi
{
  return self->_rssi;
}

- (double)age
{
  return self->_age;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mac, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPIndoorWifiScan writeTo:]", "CLPCollectionRequest.gen.m", 11226, "nil != self->_mac");
}

@end
