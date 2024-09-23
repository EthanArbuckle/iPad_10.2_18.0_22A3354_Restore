@implementation ATXPBHeroAppPrediction

- (void)setLatitude:(double)a3
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

- (void)setLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLongitude
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setIsTouristApp:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isTouristApp = a3;
}

- (void)setHasIsTouristApp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsTouristApp
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasScore
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasUrlHash
{
  return self->_urlHash != 0;
}

- (BOOL)hasClipMetadata
{
  return self->_clipMetadata != 0;
}

- (void)setAdamId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_adamId = a3;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAdamId
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRank:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRank
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRadius:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRadius
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setLatitudeAtPredictionTime:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_latitudeAtPredictionTime = a3;
}

- (void)setHasLatitudeAtPredictionTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasLatitudeAtPredictionTime
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setLongitudeAtPredictionTime:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_longitudeAtPredictionTime = a3;
}

- (void)setHasLongitudeAtPredictionTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLongitudeAtPredictionTime
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasPoiCategory
{
  return self->_poiCategory != 0;
}

- (void)setPoiMuid:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_poiMuid = a3;
}

- (void)setHasPoiMuid:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPoiMuid
{
  return (*(_WORD *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)ATXPBHeroAppPrediction;
  -[ATXPBHeroAppPrediction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHeroAppPrediction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  NSString *bundleId;
  __int16 v8;
  void *v9;
  void *v10;
  NSString *urlHash;
  NSData *clipMetadata;
  __int16 v13;
  void *v14;
  NSString *poiCategory;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_latitude);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("latitude"));

    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_longitude);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("longitude"));

  }
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  v8 = (__int16)self->_has;
  if ((v8 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isTouristApp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("isTouristApp"));

    v8 = (__int16)self->_has;
  }
  if ((v8 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_score);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("score"));

  }
  urlHash = self->_urlHash;
  if (urlHash)
    objc_msgSend(v3, "setObject:forKey:", urlHash, CFSTR("urlHash"));
  clipMetadata = self->_clipMetadata;
  if (clipMetadata)
    objc_msgSend(v3, "setObject:forKey:", clipMetadata, CFSTR("clipMetadata"));
  v13 = (__int16)self->_has;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_adamId);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("adamId"));

    v13 = (__int16)self->_has;
    if ((v13 & 0x80) == 0)
    {
LABEL_17:
      if ((v13 & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_28;
    }
  }
  else if ((v13 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_rank);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("rank"));

  v13 = (__int16)self->_has;
  if ((v13 & 0x40) == 0)
  {
LABEL_18:
    if ((v13 & 4) == 0)
      goto LABEL_19;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_radius);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("radius"));

  v13 = (__int16)self->_has;
  if ((v13 & 4) == 0)
  {
LABEL_19:
    if ((v13 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_latitudeAtPredictionTime);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("latitudeAtPredictionTime"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_longitudeAtPredictionTime);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("longitudeAtPredictionTime"));

  }
LABEL_21:
  poiCategory = self->_poiCategory;
  if (poiCategory)
    objc_msgSend(v3, "setObject:forKey:", poiCategory, CFSTR("poiCategory"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_poiMuid);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("poiMuid"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBHeroAppPredictionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  __int16 v6;
  id v7;

  v7 = a3;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_bundleId)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (__int16)self->_has;
  }
  if ((v5 & 0x100) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_urlHash)
    PBDataWriterWriteStringField();
  if (self->_clipMetadata)
    PBDataWriterWriteDataField();
  v6 = (__int16)self->_has;
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v6 = (__int16)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_17:
      if ((v6 & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_28;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt64Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_18:
    if ((v6 & 4) == 0)
      goto LABEL_19;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt64Field();
  v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_19:
    if ((v6 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_20:
    PBDataWriterWriteDoubleField();
LABEL_21:
  if (self->_poiCategory)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteUint64Field();

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
  if ((has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_latitude;
    *((_WORD *)v4 + 58) |= 2u;
    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[4] = *(_QWORD *)&self->_longitude;
    *((_WORD *)v4 + 58) |= 8u;
  }
  v8 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    *((_BYTE *)v4 + 112) = self->_isTouristApp;
    *((_WORD *)v4 + 58) |= 0x200u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    v4[9] = *(_QWORD *)&self->_score;
    *((_WORD *)v4 + 58) |= 0x100u;
  }
  if (self->_urlHash)
  {
    objc_msgSend(v8, "setUrlHash:");
    v4 = v8;
  }
  if (self->_clipMetadata)
  {
    objc_msgSend(v8, "setClipMetadata:");
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 1) != 0)
  {
    v4[1] = self->_adamId;
    *((_WORD *)v4 + 58) |= 1u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x80) == 0)
    {
LABEL_17:
      if ((v7 & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_28;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  v4[8] = self->_rank;
  *((_WORD *)v4 + 58) |= 0x80u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x40) == 0)
  {
LABEL_18:
    if ((v7 & 4) == 0)
      goto LABEL_19;
    goto LABEL_29;
  }
LABEL_28:
  v4[7] = self->_radius;
  *((_WORD *)v4 + 58) |= 0x40u;
  v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_19:
    if ((v7 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_29:
  v4[3] = *(_QWORD *)&self->_latitudeAtPredictionTime;
  *((_WORD *)v4 + 58) |= 4u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_20:
    v4[5] = *(_QWORD *)&self->_longitudeAtPredictionTime;
    *((_WORD *)v4 + 58) |= 0x10u;
  }
LABEL_21:
  if (self->_poiCategory)
  {
    objc_msgSend(v8, "setPoiCategory:");
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v4[6] = self->_poiMuid;
    *((_WORD *)v4 + 58) |= 0x20u;
  }

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
  uint64_t v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_latitude;
    *(_WORD *)(v5 + 116) |= 2u;
    has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_longitude;
    *(_WORD *)(v5 + 116) |= 8u;
  }
  v8 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
  {
    *(_BYTE *)(v6 + 112) = self->_isTouristApp;
    *(_WORD *)(v6 + 116) |= 0x200u;
    v10 = (__int16)self->_has;
  }
  if ((v10 & 0x100) != 0)
  {
    *(double *)(v6 + 72) = self->_score;
    *(_WORD *)(v6 + 116) |= 0x100u;
  }
  v11 = -[NSString copyWithZone:](self->_urlHash, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v11;

  v13 = -[NSData copyWithZone:](self->_clipMetadata, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v13;

  v15 = (__int16)self->_has;
  if ((v15 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_adamId;
    *(_WORD *)(v6 + 116) |= 1u;
    v15 = (__int16)self->_has;
    if ((v15 & 0x80) == 0)
    {
LABEL_11:
      if ((v15 & 0x40) == 0)
        goto LABEL_12;
      goto LABEL_20;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_11;
  }
  *(_QWORD *)(v6 + 64) = self->_rank;
  *(_WORD *)(v6 + 116) |= 0x80u;
  v15 = (__int16)self->_has;
  if ((v15 & 0x40) == 0)
  {
LABEL_12:
    if ((v15 & 4) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  *(_QWORD *)(v6 + 56) = self->_radius;
  *(_WORD *)(v6 + 116) |= 0x40u;
  v15 = (__int16)self->_has;
  if ((v15 & 4) == 0)
  {
LABEL_13:
    if ((v15 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_21:
  *(double *)(v6 + 24) = self->_latitudeAtPredictionTime;
  *(_WORD *)(v6 + 116) |= 4u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    *(double *)(v6 + 40) = self->_longitudeAtPredictionTime;
    *(_WORD *)(v6 + 116) |= 0x10u;
  }
LABEL_15:
  v16 = -[NSString copyWithZone:](self->_poiCategory, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v16;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_QWORD *)(v6 + 48) = self->_poiMuid;
    *(_WORD *)(v6 + 116) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSString *bundleId;
  NSString *urlHash;
  NSData *clipMetadata;
  __int16 v10;
  __int16 v11;
  NSString *poiCategory;
  __int16 v13;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_65;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 58);
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_latitude != *((double *)v4 + 2))
      goto LABEL_65;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_longitude != *((double *)v4 + 4))
      goto LABEL_65;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_65;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
      goto LABEL_65;
    has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x200) == 0)
      goto LABEL_65;
    if (self->_isTouristApp)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_65;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0 || self->_score != *((double *)v4 + 9))
      goto LABEL_65;
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_65;
  }
  urlHash = self->_urlHash;
  if ((unint64_t)urlHash | *((_QWORD *)v4 + 13) && !-[NSString isEqual:](urlHash, "isEqual:"))
    goto LABEL_65;
  clipMetadata = self->_clipMetadata;
  if ((unint64_t)clipMetadata | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](clipMetadata, "isEqual:"))
      goto LABEL_65;
  }
  v10 = (__int16)self->_has;
  v11 = *((_WORD *)v4 + 58);
  if ((v10 & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_adamId != *((_QWORD *)v4 + 1))
      goto LABEL_65;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_rank != *((_QWORD *)v4 + 8))
      goto LABEL_65;
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_radius != *((_QWORD *)v4 + 7))
      goto LABEL_65;
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_latitudeAtPredictionTime != *((double *)v4 + 3))
      goto LABEL_65;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_longitudeAtPredictionTime != *((double *)v4 + 5))
      goto LABEL_65;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  poiCategory = self->_poiCategory;
  if ((unint64_t)poiCategory | *((_QWORD *)v4 + 12))
  {
    if (-[NSString isEqual:](poiCategory, "isEqual:"))
    {
      v10 = (__int16)self->_has;
      goto LABEL_60;
    }
LABEL_65:
    v14 = 0;
    goto LABEL_66;
  }
LABEL_60:
  v13 = *((_WORD *)v4 + 58);
  if ((v10 & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_poiMuid != *((_QWORD *)v4 + 6))
      goto LABEL_65;
    v14 = 1;
  }
  else
  {
    v14 = (v13 & 0x20) == 0;
  }
LABEL_66:

  return v14;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double latitude;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double longitude;
  double v11;
  long double v12;
  double v13;
  double score;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double latitudeAtPredictionTime;
  double v25;
  long double v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  double longitudeAtPredictionTime;
  double v31;
  long double v32;
  double v33;
  NSUInteger v34;
  unint64_t v35;
  NSUInteger v37;
  uint64_t v38;
  NSUInteger v39;
  unint64_t v40;
  unint64_t v41;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    latitude = self->_latitude;
    v6 = -latitude;
    if (latitude >= 0.0)
      v6 = self->_latitude;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v41 = v4;
  if ((has & 8) != 0)
  {
    longitude = self->_longitude;
    v11 = -longitude;
    if (longitude >= 0.0)
      v11 = self->_longitude;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v40 = v9;
  v39 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v38 = 2654435761 * self->_isTouristApp;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_19;
LABEL_24:
    v18 = 0;
    goto LABEL_27;
  }
  v38 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_24;
LABEL_19:
  score = self->_score;
  v15 = -score;
  if (score >= 0.0)
    v15 = self->_score;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_27:
  v37 = -[NSString hash](self->_urlHash, "hash");
  v19 = -[NSData hash](self->_clipMetadata, "hash");
  v20 = (__int16)self->_has;
  if ((v20 & 1) != 0)
  {
    v21 = 2654435761 * self->_adamId;
    if ((v20 & 0x80) != 0)
    {
LABEL_29:
      v22 = 2654435761 * self->_rank;
      if ((v20 & 0x40) != 0)
        goto LABEL_30;
LABEL_37:
      v23 = 0;
      if ((v20 & 4) != 0)
        goto LABEL_31;
LABEL_38:
      v28 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    v21 = 0;
    if ((v20 & 0x80) != 0)
      goto LABEL_29;
  }
  v22 = 0;
  if ((v20 & 0x40) == 0)
    goto LABEL_37;
LABEL_30:
  v23 = 2654435761 * self->_radius;
  if ((v20 & 4) == 0)
    goto LABEL_38;
LABEL_31:
  latitudeAtPredictionTime = self->_latitudeAtPredictionTime;
  v25 = -latitudeAtPredictionTime;
  if (latitudeAtPredictionTime >= 0.0)
    v25 = self->_latitudeAtPredictionTime;
  v26 = floor(v25 + 0.5);
  v27 = (v25 - v26) * 1.84467441e19;
  v28 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
  if (v27 >= 0.0)
  {
    if (v27 > 0.0)
      v28 += (unint64_t)v27;
  }
  else
  {
    v28 -= (unint64_t)fabs(v27);
  }
LABEL_41:
  if ((v20 & 0x10) != 0)
  {
    longitudeAtPredictionTime = self->_longitudeAtPredictionTime;
    v31 = -longitudeAtPredictionTime;
    if (longitudeAtPredictionTime >= 0.0)
      v31 = self->_longitudeAtPredictionTime;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  v34 = -[NSString hash](self->_poiCategory, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v35 = 2654435761u * self->_poiMuid;
  else
    v35 = 0;
  return v40 ^ v41 ^ v38 ^ v18 ^ v39 ^ v37 ^ v19 ^ v21 ^ v22 ^ v23 ^ v28 ^ v29 ^ v34 ^ v35;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v5 = *((_WORD *)v4 + 58);
  if ((v5 & 2) != 0)
  {
    self->_latitude = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    v5 = *((_WORD *)v4 + 58);
  }
  if ((v5 & 8) != 0)
  {
    self->_longitude = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
  v8 = v4;
  if (*((_QWORD *)v4 + 10))
  {
    -[ATXPBHeroAppPrediction setBundleId:](self, "setBundleId:");
    v4 = v8;
  }
  v6 = *((_WORD *)v4 + 58);
  if ((v6 & 0x200) != 0)
  {
    self->_isTouristApp = *((_BYTE *)v4 + 112);
    *(_WORD *)&self->_has |= 0x200u;
    v6 = *((_WORD *)v4 + 58);
  }
  if ((v6 & 0x100) != 0)
  {
    self->_score = *((double *)v4 + 9);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[ATXPBHeroAppPrediction setUrlHash:](self, "setUrlHash:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[ATXPBHeroAppPrediction setClipMetadata:](self, "setClipMetadata:");
    v4 = v8;
  }
  v7 = *((_WORD *)v4 + 58);
  if ((v7 & 1) != 0)
  {
    self->_adamId = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v7 = *((_WORD *)v4 + 58);
    if ((v7 & 0x80) == 0)
    {
LABEL_17:
      if ((v7 & 0x40) == 0)
        goto LABEL_18;
      goto LABEL_28;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  self->_rank = *((_QWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v7 = *((_WORD *)v4 + 58);
  if ((v7 & 0x40) == 0)
  {
LABEL_18:
    if ((v7 & 4) == 0)
      goto LABEL_19;
    goto LABEL_29;
  }
LABEL_28:
  self->_radius = *((_QWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v7 = *((_WORD *)v4 + 58);
  if ((v7 & 4) == 0)
  {
LABEL_19:
    if ((v7 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_29:
  self->_latitudeAtPredictionTime = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 58) & 0x10) != 0)
  {
LABEL_20:
    self->_longitudeAtPredictionTime = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_21:
  if (*((_QWORD *)v4 + 12))
  {
    -[ATXPBHeroAppPrediction setPoiCategory:](self, "setPoiCategory:");
    v4 = v8;
  }
  if ((*((_WORD *)v4 + 58) & 0x20) != 0)
  {
    self->_poiMuid = *((_QWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }

}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (BOOL)isTouristApp
{
  return self->_isTouristApp;
}

- (double)score
{
  return self->_score;
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (void)setUrlHash:(id)a3
{
  objc_storeStrong((id *)&self->_urlHash, a3);
}

- (NSData)clipMetadata
{
  return self->_clipMetadata;
}

- (void)setClipMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_clipMetadata, a3);
}

- (int64_t)adamId
{
  return self->_adamId;
}

- (int64_t)rank
{
  return self->_rank;
}

- (int64_t)radius
{
  return self->_radius;
}

- (double)latitudeAtPredictionTime
{
  return self->_latitudeAtPredictionTime;
}

- (double)longitudeAtPredictionTime
{
  return self->_longitudeAtPredictionTime;
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
  objc_storeStrong((id *)&self->_poiCategory, a3);
}

- (unint64_t)poiMuid
{
  return self->_poiMuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_clipMetadata, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
