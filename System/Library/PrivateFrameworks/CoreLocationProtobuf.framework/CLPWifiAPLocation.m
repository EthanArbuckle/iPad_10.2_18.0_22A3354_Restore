@implementation CLPWifiAPLocation

- (void)setHidden:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hidden = a3;
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

- (void)setScanTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_scanTimestamp = a3;
}

- (void)setHasScanTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScanTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)setServerHash:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasServerHash
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)scanType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_scanType;
  else
    return 0;
}

- (void)setScanType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_scanType = a3;
}

- (void)setHasScanType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScanType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)scanTypeAsString:(int)a3
{
  if (a3 < 0xF)
    return *(&off_1E9595CD0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsScanType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Invalid")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TwoGhzSet1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TwoGhzSet2")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FiveGhzSet1")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FiveGhzSet2")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FiveGhzSet3")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cached")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Channel")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fast")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Stage1")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Stage2")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Normal")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CustomScan")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FiveGhzStage1")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Max")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)CLPWifiAPLocation;
  -[CLPWifiAPLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPWifiAPLocation dictionaryRepresentation](self, "dictionaryRepresentation");
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
  CLPLocation *location;
  void *v11;
  NSString *appBundleId;
  char has;
  void *v14;
  uint64_t scanType;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  mac = self->_mac;
  if (mac)
    objc_msgSend(v3, "setObject:forKey:", mac, CFSTR("mac"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_channel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("channel"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_hidden);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("hidden"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rssi);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("rssi"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_scanTimestamp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("scanTimestamp"));

  }
  location = self->_location;
  if (location)
  {
    -[CLPLocation dictionaryRepresentation](location, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("location"));

  }
  appBundleId = self->_appBundleId;
  if (appBundleId)
    objc_msgSend(v4, "setObject:forKey:", appBundleId, CFSTR("appBundleId"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_serverHash);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("serverHash"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    scanType = self->_scanType;
    if (scanType >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_scanType);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = *(&off_1E9595CD0 + scanType);
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("scanType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPWifiAPLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->_mac)
    -[CLPWifiAPLocation writeTo:].cold.1();
  v7 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (!self->_location)
    -[CLPWifiAPLocation writeTo:].cold.2();
  PBDataWriterWriteSubmessage();
  if (self->_appBundleId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) == 0)
  {
    if ((has & 1) == 0)
      goto LABEL_9;
LABEL_13:
    PBDataWriterWriteDoubleField();
    v6 = v7;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteInt32Field();
  v6 = v7;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 4) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }
LABEL_11:

}

- (void)copyTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setMac:", self->_mac);
  *((_DWORD *)v5 + 6) = self->_channel;
  *((_DWORD *)v5 + 12) = self->_rssi;
  objc_msgSend(v5, "setLocation:", self->_location);
  if (self->_appBundleId)
    objc_msgSend(v5, "setAppBundleId:");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_serverHash;
    *((_BYTE *)v5 + 60) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_scanTimestamp;
      *((_BYTE *)v5 + 60) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 7) = self->_hidden;
  *((_BYTE *)v5 + 60) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 13) = self->_scanType;
    *((_BYTE *)v5 + 60) |= 4u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_mac, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  *(_DWORD *)(v5 + 24) = self->_channel;
  *(_DWORD *)(v5 + 48) = self->_rssi;
  v8 = -[CLPLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_serverHash;
    *(_BYTE *)(v5 + 60) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(double *)(v5 + 8) = self->_scanTimestamp;
      *(_BYTE *)(v5 + 60) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_hidden;
  *(_BYTE *)(v5 + 60) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 52) = self->_scanType;
    *(_BYTE *)(v5 + 60) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *mac;
  CLPLocation *location;
  NSString *appBundleId;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  mac = self->_mac;
  if ((unint64_t)mac | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](mac, "isEqual:"))
      goto LABEL_29;
  }
  if (self->_channel != *((_DWORD *)v4 + 6))
    goto LABEL_29;
  if (self->_rssi != *((_DWORD *)v4 + 12))
    goto LABEL_29;
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 4))
  {
    if (!-[CLPLocation isEqual:](location, "isEqual:"))
      goto LABEL_29;
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:"))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_serverHash != *((_DWORD *)v4 + 14))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
LABEL_29:
    v8 = 0;
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_hidden != *((_DWORD *)v4 + 7))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_scanTimestamp != *((double *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_29;
  }
  v8 = (*((_BYTE *)v4 + 60) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_scanType != *((_DWORD *)v4 + 13))
      goto LABEL_29;
    v8 = 1;
  }
LABEL_30:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t channel;
  uint64_t rssi;
  unint64_t v6;
  NSUInteger v7;
  char has;
  uint64_t v9;
  uint64_t v10;
  double scanTimestamp;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;

  v3 = -[NSString hash](self->_mac, "hash");
  channel = self->_channel;
  rssi = self->_rssi;
  v6 = -[CLPLocation hash](self->_location, "hash");
  v7 = -[NSString hash](self->_appBundleId, "hash");
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v15 = 0;
    goto LABEL_13;
  }
  v9 = 2654435761 * self->_serverHash;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v10 = 2654435761 * self->_hidden;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  scanTimestamp = self->_scanTimestamp;
  v12 = -scanTimestamp;
  if (scanTimestamp >= 0.0)
    v12 = self->_scanTimestamp;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_13:
  if ((has & 4) != 0)
    v16 = 2654435761 * self->_scanType;
  else
    v16 = 0;
  return (2654435761 * channel) ^ v3 ^ (2654435761 * rssi) ^ v6 ^ v7 ^ v9 ^ v10 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CLPLocation *location;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[CLPWifiAPLocation setMac:](self, "setMac:");
    v4 = v8;
  }
  self->_channel = *((_DWORD *)v4 + 6);
  self->_rssi = *((_DWORD *)v4 + 12);
  location = self->_location;
  v6 = *((_QWORD *)v4 + 4);
  if (location)
  {
    if (!v6)
      goto LABEL_9;
    -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[CLPWifiAPLocation setLocation:](self, "setLocation:");
  }
  v4 = v8;
LABEL_9:
  if (*((_QWORD *)v4 + 2))
  {
    -[CLPWifiAPLocation setAppBundleId:](self, "setAppBundleId:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 60);
  if ((v7 & 8) != 0)
  {
    self->_serverHash = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 8u;
    v7 = *((_BYTE *)v4 + 60);
    if ((v7 & 2) == 0)
    {
LABEL_13:
      if ((v7 & 1) == 0)
        goto LABEL_14;
LABEL_19:
      self->_scanTimestamp = *((double *)v4 + 1);
      *(_BYTE *)&self->_has |= 1u;
      if ((*((_BYTE *)v4 + 60) & 4) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_hidden = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 2u;
  v7 = *((_BYTE *)v4 + 60);
  if ((v7 & 1) != 0)
    goto LABEL_19;
LABEL_14:
  if ((v7 & 4) != 0)
  {
LABEL_15:
    self->_scanType = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_16:

}

- (NSString)mac
{
  return self->_mac;
}

- (void)setMac:(id)a3
{
  objc_storeStrong((id *)&self->_mac, a3);
}

- (int)channel
{
  return self->_channel;
}

- (void)setChannel:(int)a3
{
  self->_channel = a3;
}

- (int)hidden
{
  return self->_hidden;
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  self->_rssi = a3;
}

- (double)scanTimestamp
{
  return self->_scanTimestamp;
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

- (int)serverHash
{
  return self->_serverHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mac, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPWifiAPLocation writeTo:]", "CLPCollectionRequest.gen.m", 35229, "nil != self->_mac");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CLPWifiAPLocation writeTo:]", "CLPCollectionRequest.gen.m", 35242, "self->_location != nil");
}

@end
