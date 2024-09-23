@implementation AWDProactiveAppPredictionLaunchesAtLocation

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setLatitude:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLatitude
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLongitude:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLongitude
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTimeBucket:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_timeBucket = a3;
}

- (void)setHasTimeBucket:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTimeBucket
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setIsTourist:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isTourist = a3;
}

- (void)setHasIsTourist:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsTourist
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsClip:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isClip = a3;
}

- (void)setHasIsClip:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsClip
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasUrlHash
{
  return self->_urlHash != 0;
}

- (void)setLocationAccuracy:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_locationAccuracy = a3;
}

- (void)setHasLocationAccuracy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLocationAccuracy
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)launchReason
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_launchReason;
  else
    return 0;
}

- (void)setLaunchReason:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_launchReason = a3;
}

- (void)setHasLaunchReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasLaunchReason
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)launchReasonAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E82EB770[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLaunchReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLaunchReasonNFC")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLaunchReasonQR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLaunchReasonLocationBasedSpotlight")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLaunchReasonLocationBasedHomescreen")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLaunchReasonSpringBoard")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLaunchReasonMaps")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLaunchReasonSafari")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLaunchReasonMessages")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLaunchReasonMail")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLaunchReasonOther")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsNegativeSession:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isNegativeSession = a3;
}

- (void)setHasIsNegativeSession:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsNegativeSession
{
  return (*(_WORD *)&self->_has >> 7) & 1;
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
  v8.super_class = (Class)AWDProactiveAppPredictionLaunchesAtLocation;
  -[AWDProactiveAppPredictionLaunchesAtLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveAppPredictionLaunchesAtLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  __int16 has;
  void *v6;
  NSString *bundleId;
  __int16 v8;
  void *v9;
  void *v10;
  NSString *urlHash;
  __int16 v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t launchReason;
  __CFString *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&v4 = self->_latitude;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("latitude"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_21:
  *(float *)&v4 = self->_longitude;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("longitude"));

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_timeBucket);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timeBucket"));

  }
LABEL_6:
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  v8 = (__int16)self->_has;
  if ((v8 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTourist);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("isTourist"));

    v8 = (__int16)self->_has;
  }
  if ((v8 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isClip);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isClip"));

  }
  urlHash = self->_urlHash;
  if (urlHash)
    objc_msgSend(v3, "setObject:forKey:", urlHash, CFSTR("urlHash"));
  v12 = (__int16)self->_has;
  if ((v12 & 8) == 0)
  {
    if ((v12 & 4) == 0)
      goto LABEL_16;
LABEL_24:
    launchReason = self->_launchReason;
    if (launchReason >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_launchReason);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E82EB770[launchReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("launchReason"));

    if ((*(_WORD *)&self->_has & 0x80) != 0)
      goto LABEL_17;
    return v3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_locationAccuracy);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("locationAccuracy"));

  v12 = (__int16)self->_has;
  if ((v12 & 4) != 0)
    goto LABEL_24;
LABEL_16:
  if ((v12 & 0x80) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isNegativeSession);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("isNegativeSession"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveAppPredictionLaunchesAtLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  __int16 v6;
  id v7;

  v7 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_21:
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_bundleId)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (__int16)self->_has;
  }
  if ((v5 & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_urlHash)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_16;
LABEL_24:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
    goto LABEL_24;
LABEL_16:
  if ((v6 & 0x80) != 0)
LABEL_17:
    PBDataWriterWriteBOOLField();
LABEL_18:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  _QWORD *v8;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = LODWORD(self->_latitude);
  *((_WORD *)v4 + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_21:
  *((_DWORD *)v4 + 9) = LODWORD(self->_longitude);
  *((_WORD *)v4 + 30) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 10) = self->_timeBucket;
    *((_WORD *)v4 + 30) |= 0x20u;
  }
LABEL_6:
  v8 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
  {
    *((_BYTE *)v4 + 58) = self->_isTourist;
    *((_WORD *)v4 + 30) |= 0x100u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    *((_BYTE *)v4 + 56) = self->_isClip;
    *((_WORD *)v4 + 30) |= 0x40u;
  }
  if (self->_urlHash)
  {
    objc_msgSend(v8, "setUrlHash:");
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 8) == 0)
  {
    if ((v7 & 4) == 0)
      goto LABEL_16;
LABEL_24:
    *((_DWORD *)v4 + 7) = self->_launchReason;
    *((_WORD *)v4 + 30) |= 4u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 8) = self->_locationAccuracy;
  *((_WORD *)v4 + 30) |= 8u;
  v7 = (__int16)self->_has;
  if ((v7 & 4) != 0)
    goto LABEL_24;
LABEL_16:
  if ((v7 & 0x80) != 0)
  {
LABEL_17:
    *((_BYTE *)v4 + 57) = self->_isNegativeSession;
    *((_WORD *)v4 + 30) |= 0x80u;
  }
LABEL_18:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  uint64_t v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  void *v12;
  __int16 v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 60) |= 1u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 24) = self->_latitude;
  *(_WORD *)(v5 + 60) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_17:
  *(float *)(v5 + 36) = self->_longitude;
  *(_WORD *)(v5 + 60) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 40) = self->_timeBucket;
    *(_WORD *)(v5 + 60) |= 0x20u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0)
  {
    *(_BYTE *)(v6 + 58) = self->_isTourist;
    *(_WORD *)(v6 + 60) |= 0x100u;
    v10 = (__int16)self->_has;
  }
  if ((v10 & 0x40) != 0)
  {
    *(_BYTE *)(v6 + 56) = self->_isClip;
    *(_WORD *)(v6 + 60) |= 0x40u;
  }
  v11 = -[NSString copyWithZone:](self->_urlHash, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v11;

  v13 = (__int16)self->_has;
  if ((v13 & 8) == 0)
  {
    if ((v13 & 4) == 0)
      goto LABEL_12;
LABEL_20:
    *(_DWORD *)(v6 + 28) = self->_launchReason;
    *(_WORD *)(v6 + 60) |= 4u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      return (id)v6;
    goto LABEL_13;
  }
  *(_DWORD *)(v6 + 32) = self->_locationAccuracy;
  *(_WORD *)(v6 + 60) |= 8u;
  v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
    goto LABEL_20;
LABEL_12:
  if ((v13 & 0x80) != 0)
  {
LABEL_13:
    *(_BYTE *)(v6 + 57) = self->_isNegativeSession;
    *(_WORD *)(v6 + 60) |= 0x80u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSString *bundleId;
  __int16 v8;
  NSString *urlHash;
  __int16 v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_57;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 30);
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_57;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_latitude != *((float *)v4 + 6))
      goto LABEL_57;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_longitude != *((float *)v4 + 9))
      goto LABEL_57;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_timeBucket != *((_DWORD *)v4 + 10))
      goto LABEL_57;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_57;
    has = (__int16)self->_has;
  }
  v8 = *((_WORD *)v4 + 30);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0)
      goto LABEL_57;
    if (self->_isTourist)
    {
      if (!*((_BYTE *)v4 + 58))
        goto LABEL_57;
    }
    else if (*((_BYTE *)v4 + 58))
    {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0)
      goto LABEL_57;
    if (self->_isClip)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_57;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_57;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  urlHash = self->_urlHash;
  if ((unint64_t)urlHash | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](urlHash, "isEqual:"))
      goto LABEL_57;
    has = (__int16)self->_has;
  }
  v10 = *((_WORD *)v4 + 30);
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_locationAccuracy != *((_DWORD *)v4 + 8))
      goto LABEL_57;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_launchReason != *((_DWORD *)v4 + 7))
      goto LABEL_57;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) != 0)
    {
      if (self->_isNegativeSession)
      {
        if (!*((_BYTE *)v4 + 57))
          goto LABEL_57;
      }
      else if (*((_BYTE *)v4 + 57))
      {
        goto LABEL_57;
      }
      v11 = 1;
      goto LABEL_58;
    }
LABEL_57:
    v11 = 0;
    goto LABEL_58;
  }
  v11 = (v10 & 0x80) == 0;
LABEL_58:

  return v11;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  float latitude;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  float longitude;
  float v12;
  float v13;
  float v14;
  uint64_t v15;
  NSUInteger v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  latitude = self->_latitude;
  v6 = -latitude;
  if (latitude >= 0.0)
    v6 = self->_latitude;
  v7 = floorf(v6 + 0.5);
  v8 = (float)(v6 - v7) * 1.8447e19;
  v9 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabsf(v8);
  }
LABEL_11:
  if ((has & 0x10) != 0)
  {
    longitude = self->_longitude;
    v12 = -longitude;
    if (longitude >= 0.0)
      v12 = self->_longitude;
    v13 = floorf(v12 + 0.5);
    v14 = (float)(v12 - v13) * 1.8447e19;
    v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 0x20) != 0)
    v15 = 2654435761 * self->_timeBucket;
  else
    v15 = 0;
  v16 = -[NSString hash](self->_bundleId, "hash");
  v17 = (__int16)self->_has;
  if ((v17 & 0x100) != 0)
  {
    v18 = 2654435761 * self->_isTourist;
    if ((v17 & 0x40) != 0)
      goto LABEL_24;
  }
  else
  {
    v18 = 0;
    if ((v17 & 0x40) != 0)
    {
LABEL_24:
      v19 = 2654435761 * self->_isClip;
      goto LABEL_27;
    }
  }
  v19 = 0;
LABEL_27:
  v20 = -[NSString hash](self->_urlHash, "hash");
  v21 = (__int16)self->_has;
  if ((v21 & 8) == 0)
  {
    v22 = 0;
    if ((v21 & 4) != 0)
      goto LABEL_29;
LABEL_32:
    v23 = 0;
    if ((v21 & 0x80) != 0)
      goto LABEL_30;
LABEL_33:
    v24 = 0;
    return v9 ^ v4 ^ v10 ^ v15 ^ v18 ^ v19 ^ v16 ^ v20 ^ v22 ^ v23 ^ v24;
  }
  v22 = 2654435761 * self->_locationAccuracy;
  if ((v21 & 4) == 0)
    goto LABEL_32;
LABEL_29:
  v23 = 2654435761 * self->_launchReason;
  if ((v21 & 0x80) == 0)
    goto LABEL_33;
LABEL_30:
  v24 = 2654435761 * self->_isNegativeSession;
  return v9 ^ v4 ^ v10 ^ v15 ^ v18 ^ v19 ^ v16 ^ v20 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 30);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_latitude = *((float *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_21:
  self->_longitude = *((float *)v4 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 30) & 0x20) != 0)
  {
LABEL_5:
    self->_timeBucket = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_6:
  v8 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[AWDProactiveAppPredictionLaunchesAtLocation setBundleId:](self, "setBundleId:");
    v4 = v8;
  }
  v6 = *((_WORD *)v4 + 30);
  if ((v6 & 0x100) != 0)
  {
    self->_isTourist = *((_BYTE *)v4 + 58);
    *(_WORD *)&self->_has |= 0x100u;
    v6 = *((_WORD *)v4 + 30);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_isClip = *((_BYTE *)v4 + 56);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[AWDProactiveAppPredictionLaunchesAtLocation setUrlHash:](self, "setUrlHash:");
    v4 = v8;
  }
  v7 = *((_WORD *)v4 + 30);
  if ((v7 & 8) == 0)
  {
    if ((v7 & 4) == 0)
      goto LABEL_16;
LABEL_24:
    self->_launchReason = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 4u;
    if ((*((_WORD *)v4 + 30) & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  self->_locationAccuracy = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 8u;
  v7 = *((_WORD *)v4 + 30);
  if ((v7 & 4) != 0)
    goto LABEL_24;
LABEL_16:
  if ((v7 & 0x80) != 0)
  {
LABEL_17:
    self->_isNegativeSession = *((_BYTE *)v4 + 57);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_18:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (float)latitude
{
  return self->_latitude;
}

- (float)longitude
{
  return self->_longitude;
}

- (unsigned)timeBucket
{
  return self->_timeBucket;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (BOOL)isTourist
{
  return self->_isTourist;
}

- (BOOL)isClip
{
  return self->_isClip;
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (void)setUrlHash:(id)a3
{
  objc_storeStrong((id *)&self->_urlHash, a3);
}

- (unsigned)locationAccuracy
{
  return self->_locationAccuracy;
}

- (BOOL)isNegativeSession
{
  return self->_isNegativeSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
