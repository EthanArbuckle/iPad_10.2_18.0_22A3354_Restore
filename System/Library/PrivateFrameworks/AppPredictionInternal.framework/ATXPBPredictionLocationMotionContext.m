@implementation ATXPBPredictionLocationMotionContext

- (ATXPBPredictionLocationOfInterest)previousLOI
{
  return self->_previousLOI;
}

- (int)motionType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_motionType;
  else
    return 0;
}

- (BOOL)locationEnabled
{
  return self->_locationEnabled;
}

- (unint64_t)largeGeohash
{
  return self->_largeGeohash;
}

- (BOOL)hasGeohash
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasCurrentLocation
{
  return self->_currentLocation != 0;
}

- (unint64_t)geohash
{
  return self->_geohash;
}

- (double)distanceFromWork
{
  return self->_distanceFromWork;
}

- (double)distanceFromSchool
{
  return self->_distanceFromSchool;
}

- (double)distanceFromHome
{
  return self->_distanceFromHome;
}

- (double)distanceFromGym
{
  return self->_distanceFromGym;
}

- (ATXPBPredictionLocationOfInterest)currentLOI
{
  return self->_currentLOI;
}

- (unint64_t)coarseGeohash
{
  return self->_coarseGeohash;
}

- (BOOL)canPredictClipsGivenRecentMotion
{
  return self->_canPredictClipsGivenRecentMotion;
}

- (void)setPreviousLOI:(id)a3
{
  objc_storeStrong((id *)&self->_previousLOI, a3);
}

- (void)setMotionType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_motionType = a3;
}

- (void)setLocationEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_locationEnabled = a3;
}

- (void)setLargeGeohash:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_largeGeohash = a3;
}

- (void)setGeohash:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_geohash = a3;
}

- (void)setDistanceFromWork:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_distanceFromWork = a3;
}

- (void)setDistanceFromSchool:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_distanceFromSchool = a3;
}

- (void)setDistanceFromHome:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_distanceFromHome = a3;
}

- (void)setDistanceFromGym:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_distanceFromGym = a3;
}

- (void)setCurrentLOI:(id)a3
{
  objc_storeStrong((id *)&self->_currentLOI, a3);
}

- (void)setCoarseGeohash:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_coarseGeohash = a3;
}

- (void)setCanPredictClipsGivenRecentMotion:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_canPredictClipsGivenRecentMotion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLOI, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_currentLOI, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_previousLOI)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_currentLOI)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_currentLocation)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_22;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 2) == 0)
      goto LABEL_14;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 1) == 0)
      goto LABEL_17;
LABEL_27:
    PBDataWriterWriteFixed64Field();
    v4 = v6;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_26:
  PBDataWriterWriteFixed64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_27;
LABEL_17:
  if ((has & 0x40) != 0)
  {
LABEL_18:
    PBDataWriterWriteFixed64Field();
    v4 = v6;
  }
LABEL_19:

}

- (BOOL)hasPreviousLOI
{
  return self->_previousLOI != 0;
}

- (BOOL)hasCurrentLOI
{
  return self->_currentLOI != 0;
}

- (void)setHasMotionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMotionType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)motionTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E82E27B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMotionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Walking")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Running")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cycling")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Driving")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasLocationEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasLocationEnabled
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasDistanceFromHome:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDistanceFromHome
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasDistanceFromWork:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDistanceFromWork
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasDistanceFromSchool:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDistanceFromSchool
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasDistanceFromGym:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDistanceFromGym
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasCanPredictClipsGivenRecentMotion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasCanPredictClipsGivenRecentMotion
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasGeohash:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setHasCoarseGeohash:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCoarseGeohash
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasLargeGeohash:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLargeGeohash
{
  return (*(_WORD *)&self->_has >> 6) & 1;
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
  v8.super_class = (Class)ATXPBPredictionLocationMotionContext;
  -[ATXPBPredictionLocationMotionContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBPredictionLocationMotionContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ATXPBPredictionLocationOfInterest *previousLOI;
  void *v5;
  ATXPBPredictionLocationOfInterest *currentLOI;
  void *v7;
  uint64_t motionType;
  __CFString *v9;
  NSData *currentLocation;
  __int16 has;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  previousLOI = self->_previousLOI;
  if (previousLOI)
  {
    -[ATXPBPredictionLocationOfInterest dictionaryRepresentation](previousLOI, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("previousLOI"));

  }
  currentLOI = self->_currentLOI;
  if (currentLOI)
  {
    -[ATXPBPredictionLocationOfInterest dictionaryRepresentation](currentLOI, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("currentLOI"));

  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    motionType = self->_motionType;
    if (motionType >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_motionType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E82E27B0[motionType];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("motionType"));

  }
  currentLocation = self->_currentLocation;
  if (currentLocation)
    objc_msgSend(v3, "setObject:forKey:", currentLocation, CFSTR("currentLocation"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_locationEnabled);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("locationEnabled"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_14:
      if ((has & 0x10) == 0)
        goto LABEL_15;
      goto LABEL_25;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_distanceFromHome);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("distanceFromHome"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 8) == 0)
      goto LABEL_16;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_distanceFromWork);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("distanceFromWork"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_16:
    if ((has & 2) == 0)
      goto LABEL_17;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_distanceFromSchool);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("distanceFromSchool"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_17:
    if ((has & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_distanceFromGym);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("distanceFromGym"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_18:
    if ((has & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canPredictClipsGivenRecentMotion);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("canPredictClipsGivenRecentMotion"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_19:
    if ((has & 1) == 0)
      goto LABEL_20;
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_coarseGeohash);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("coarseGeohash"));

    if ((*(_WORD *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_21;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_geohash);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("geohash"));

  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_30;
LABEL_20:
  if ((has & 0x40) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_largeGeohash);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("largeGeohash"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPredictionLocationMotionContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_previousLOI)
  {
    objc_msgSend(v4, "setPreviousLOI:");
    v4 = v6;
  }
  if (self->_currentLOI)
  {
    objc_msgSend(v6, "setCurrentLOI:");
    v4 = v6;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_motionType;
    *((_WORD *)v4 + 50) |= 0x80u;
  }
  if (self->_currentLocation)
  {
    objc_msgSend(v6, "setCurrentLocation:");
    v4 = v6;
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_BYTE *)v4 + 97) = self->_locationEnabled;
    *((_WORD *)v4 + 50) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_22;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_distanceFromHome;
  *((_WORD *)v4 + 50) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_distanceFromWork;
  *((_WORD *)v4 + 50) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 2) == 0)
      goto LABEL_14;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_distanceFromSchool;
  *((_WORD *)v4 + 50) |= 8u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_distanceFromGym;
  *((_WORD *)v4 + 50) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_26;
  }
LABEL_25:
  *((_BYTE *)v4 + 96) = self->_canPredictClipsGivenRecentMotion;
  *((_WORD *)v4 + 50) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 1) == 0)
      goto LABEL_17;
LABEL_27:
    *((_QWORD *)v4 + 1) = self->_coarseGeohash;
    *((_WORD *)v4 + 50) |= 1u;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_26:
  *((_QWORD *)v4 + 6) = self->_geohash;
  *((_WORD *)v4 + 50) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_27;
LABEL_17:
  if ((has & 0x40) != 0)
  {
LABEL_18:
    *((_QWORD *)v4 + 7) = self->_largeGeohash;
    *((_WORD *)v4 + 50) |= 0x40u;
  }
LABEL_19:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ATXPBPredictionLocationOfInterest copyWithZone:](self->_previousLOI, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v6;

  v8 = -[ATXPBPredictionLocationOfInterest copyWithZone:](self->_currentLOI, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_motionType;
    *(_WORD *)(v5 + 100) |= 0x80u;
  }
  v10 = -[NSData copyWithZone:](self->_currentLocation, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 97) = self->_locationEnabled;
    *(_WORD *)(v5 + 100) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 24) = self->_distanceFromHome;
  *(_WORD *)(v5 + 100) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *(double *)(v5 + 40) = self->_distanceFromWork;
  *(_WORD *)(v5 + 100) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *(double *)(v5 + 32) = self->_distanceFromSchool;
  *(_WORD *)(v5 + 100) |= 8u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *(double *)(v5 + 16) = self->_distanceFromGym;
  *(_WORD *)(v5 + 100) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  *(_BYTE *)(v5 + 96) = self->_canPredictClipsGivenRecentMotion;
  *(_WORD *)(v5 + 100) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
LABEL_21:
    *(_QWORD *)(v5 + 8) = self->_coarseGeohash;
    *(_WORD *)(v5 + 100) |= 1u;
    if ((*(_WORD *)&self->_has & 0x40) == 0)
      return (id)v5;
    goto LABEL_12;
  }
LABEL_20:
  *(_QWORD *)(v5 + 48) = self->_geohash;
  *(_WORD *)(v5 + 100) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
    goto LABEL_21;
LABEL_11:
  if ((has & 0x40) != 0)
  {
LABEL_12:
    *(_QWORD *)(v5 + 56) = self->_largeGeohash;
    *(_WORD *)(v5 + 100) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ATXPBPredictionLocationOfInterest *previousLOI;
  ATXPBPredictionLocationOfInterest *currentLOI;
  __int16 has;
  __int16 v8;
  NSData *currentLocation;
  __int16 v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_65;
  previousLOI = self->_previousLOI;
  if ((unint64_t)previousLOI | *((_QWORD *)v4 + 11))
  {
    if (!-[ATXPBPredictionLocationOfInterest isEqual:](previousLOI, "isEqual:"))
      goto LABEL_65;
  }
  currentLOI = self->_currentLOI;
  if ((unint64_t)currentLOI | *((_QWORD *)v4 + 8))
  {
    if (!-[ATXPBPredictionLocationOfInterest isEqual:](currentLOI, "isEqual:"))
      goto LABEL_65;
  }
  has = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 50);
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_motionType != *((_DWORD *)v4 + 20))
      goto LABEL_65;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_65;
  }
  currentLocation = self->_currentLocation;
  if ((unint64_t)currentLocation | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](currentLocation, "isEqual:"))
      goto LABEL_65;
    has = (__int16)self->_has;
  }
  v10 = *((_WORD *)v4 + 50);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x200) == 0)
      goto LABEL_65;
    if (self->_locationEnabled)
    {
      if (!*((_BYTE *)v4 + 97))
        goto LABEL_65;
    }
    else if (*((_BYTE *)v4 + 97))
    {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x200) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_distanceFromHome != *((double *)v4 + 3))
      goto LABEL_65;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_distanceFromWork != *((double *)v4 + 5))
      goto LABEL_65;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_distanceFromSchool != *((double *)v4 + 4))
      goto LABEL_65;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_distanceFromGym != *((double *)v4 + 2))
      goto LABEL_65;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x100) != 0)
    {
      if (self->_canPredictClipsGivenRecentMotion)
      {
        if (!*((_BYTE *)v4 + 96))
          goto LABEL_65;
        goto LABEL_50;
      }
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_50;
    }
LABEL_65:
    v11 = 0;
    goto LABEL_66;
  }
  if ((*((_WORD *)v4 + 50) & 0x100) != 0)
    goto LABEL_65;
LABEL_50:
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_geohash != *((_QWORD *)v4 + 6))
      goto LABEL_65;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_coarseGeohash != *((_QWORD *)v4 + 1))
      goto LABEL_65;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_largeGeohash != *((_QWORD *)v4 + 7))
      goto LABEL_65;
    v11 = 1;
  }
  else
  {
    v11 = (v10 & 0x40) == 0;
  }
LABEL_66:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int16 has;
  uint64_t v7;
  double distanceFromHome;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  double distanceFromWork;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  double distanceFromSchool;
  double v20;
  long double v21;
  double v22;
  unint64_t v23;
  double distanceFromGym;
  double v25;
  long double v26;
  double v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v33;

  v33 = -[ATXPBPredictionLocationOfInterest hash](self->_previousLOI, "hash");
  v3 = -[ATXPBPredictionLocationOfInterest hash](self->_currentLOI, "hash");
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v4 = 2654435761 * self->_motionType;
  else
    v4 = 0;
  v5 = -[NSData hash](self->_currentLocation, "hash");
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v7 = 2654435761 * self->_locationEnabled;
    if ((has & 4) != 0)
      goto LABEL_6;
LABEL_11:
    v12 = 0;
    goto LABEL_14;
  }
  v7 = 0;
  if ((has & 4) == 0)
    goto LABEL_11;
LABEL_6:
  distanceFromHome = self->_distanceFromHome;
  v9 = -distanceFromHome;
  if (distanceFromHome >= 0.0)
    v9 = self->_distanceFromHome;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_14:
  if ((has & 0x10) != 0)
  {
    distanceFromWork = self->_distanceFromWork;
    v15 = -distanceFromWork;
    if (distanceFromWork >= 0.0)
      v15 = self->_distanceFromWork;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((has & 8) != 0)
  {
    distanceFromSchool = self->_distanceFromSchool;
    v20 = -distanceFromSchool;
    if (distanceFromSchool >= 0.0)
      v20 = self->_distanceFromSchool;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  if ((has & 2) != 0)
  {
    distanceFromGym = self->_distanceFromGym;
    v25 = -distanceFromGym;
    if (distanceFromGym >= 0.0)
      v25 = self->_distanceFromGym;
    v26 = floor(v25 + 0.5);
    v27 = (v25 - v26) * 1.84467441e19;
    v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0)
        v23 += (unint64_t)v27;
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    v23 = 0;
  }
  if ((has & 0x100) != 0)
  {
    v28 = 2654435761 * self->_canPredictClipsGivenRecentMotion;
    if ((has & 0x20) != 0)
    {
LABEL_40:
      v29 = 2654435761u * self->_geohash;
      if ((has & 1) != 0)
        goto LABEL_41;
LABEL_45:
      v30 = 0;
      if ((has & 0x40) != 0)
        goto LABEL_42;
LABEL_46:
      v31 = 0;
      return v3 ^ v33 ^ v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ v18 ^ v23 ^ v28 ^ v29 ^ v30 ^ v31;
    }
  }
  else
  {
    v28 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_40;
  }
  v29 = 0;
  if ((has & 1) == 0)
    goto LABEL_45;
LABEL_41:
  v30 = 2654435761u * self->_coarseGeohash;
  if ((has & 0x40) == 0)
    goto LABEL_46;
LABEL_42:
  v31 = 2654435761u * self->_largeGeohash;
  return v3 ^ v33 ^ v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ v18 ^ v23 ^ v28 ^ v29 ^ v30 ^ v31;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ATXPBPredictionLocationOfInterest *previousLOI;
  uint64_t v6;
  ATXPBPredictionLocationOfInterest *currentLOI;
  uint64_t v8;
  __int16 v9;
  id v10;

  v4 = a3;
  previousLOI = self->_previousLOI;
  v6 = *((_QWORD *)v4 + 11);
  v10 = v4;
  if (previousLOI)
  {
    if (!v6)
      goto LABEL_7;
    -[ATXPBPredictionLocationOfInterest mergeFrom:](previousLOI, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[ATXPBPredictionLocationMotionContext setPreviousLOI:](self, "setPreviousLOI:");
  }
  v4 = v10;
LABEL_7:
  currentLOI = self->_currentLOI;
  v8 = *((_QWORD *)v4 + 8);
  if (currentLOI)
  {
    if (!v8)
      goto LABEL_13;
    -[ATXPBPredictionLocationOfInterest mergeFrom:](currentLOI, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[ATXPBPredictionLocationMotionContext setCurrentLOI:](self, "setCurrentLOI:");
  }
  v4 = v10;
LABEL_13:
  if ((*((_WORD *)v4 + 50) & 0x80) != 0)
  {
    self->_motionType = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[ATXPBPredictionLocationMotionContext setCurrentLocation:](self, "setCurrentLocation:");
    v4 = v10;
  }
  v9 = *((_WORD *)v4 + 50);
  if ((v9 & 0x200) != 0)
  {
    self->_locationEnabled = *((_BYTE *)v4 + 97);
    *(_WORD *)&self->_has |= 0x200u;
    v9 = *((_WORD *)v4 + 50);
    if ((v9 & 4) == 0)
    {
LABEL_19:
      if ((v9 & 0x10) == 0)
        goto LABEL_20;
      goto LABEL_30;
    }
  }
  else if ((v9 & 4) == 0)
  {
    goto LABEL_19;
  }
  self->_distanceFromHome = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v9 = *((_WORD *)v4 + 50);
  if ((v9 & 0x10) == 0)
  {
LABEL_20:
    if ((v9 & 8) == 0)
      goto LABEL_21;
    goto LABEL_31;
  }
LABEL_30:
  self->_distanceFromWork = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v9 = *((_WORD *)v4 + 50);
  if ((v9 & 8) == 0)
  {
LABEL_21:
    if ((v9 & 2) == 0)
      goto LABEL_22;
    goto LABEL_32;
  }
LABEL_31:
  self->_distanceFromSchool = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  v9 = *((_WORD *)v4 + 50);
  if ((v9 & 2) == 0)
  {
LABEL_22:
    if ((v9 & 0x100) == 0)
      goto LABEL_23;
    goto LABEL_33;
  }
LABEL_32:
  self->_distanceFromGym = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v9 = *((_WORD *)v4 + 50);
  if ((v9 & 0x100) == 0)
  {
LABEL_23:
    if ((v9 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_34;
  }
LABEL_33:
  self->_canPredictClipsGivenRecentMotion = *((_BYTE *)v4 + 96);
  *(_WORD *)&self->_has |= 0x100u;
  v9 = *((_WORD *)v4 + 50);
  if ((v9 & 0x20) == 0)
  {
LABEL_24:
    if ((v9 & 1) == 0)
      goto LABEL_25;
LABEL_35:
    self->_coarseGeohash = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    if ((*((_WORD *)v4 + 50) & 0x40) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_34:
  self->_geohash = *((_QWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v9 = *((_WORD *)v4 + 50);
  if ((v9 & 1) != 0)
    goto LABEL_35;
LABEL_25:
  if ((v9 & 0x40) != 0)
  {
LABEL_26:
    self->_largeGeohash = *((_QWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_27:

}

- (NSData)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

@end
