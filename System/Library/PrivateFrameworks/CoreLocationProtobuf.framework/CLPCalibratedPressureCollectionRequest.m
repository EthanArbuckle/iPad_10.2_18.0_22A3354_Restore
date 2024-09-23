@implementation CLPCalibratedPressureCollectionRequest

- (void)setDevicePressurePa:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_devicePressurePa = a3;
}

- (void)setHasDevicePressurePa:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasDevicePressurePa
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setDevicePressureUncPa:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_devicePressureUncPa = a3;
}

- (void)setHasDevicePressureUncPa:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasDevicePressureUncPa
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCalibratedPressurePa:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_calibratedPressurePa = a3;
}

- (void)setHasCalibratedPressurePa:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCalibratedPressurePa
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCalibratedPressureUncPa:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_calibratedPressureUncPa = a3;
}

- (void)setHasCalibratedPressureUncPa:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCalibratedPressureUncPa
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTimestampOfCalibrationS:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_timestampOfCalibrationS = a3;
}

- (void)setHasTimestampOfCalibrationS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTimestampOfCalibrationS
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setLatitudeDeg:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_latitudeDeg = a3;
}

- (void)setHasLatitudeDeg:(BOOL)a3
{
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasLatitudeDeg
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setLongitudeDeg:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_longitudeDeg = a3;
}

- (void)setHasLongitudeDeg:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasLongitudeDeg
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHorizontalUncM:(float)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_horizontalUncM = a3;
}

- (void)setHasHorizontalUncM:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHorizontalUncM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAltitudeHAEM:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_altitudeHAEM = a3;
}

- (void)setHasAltitudeHAEM:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAltitudeHAEM
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAltitudeHAEUncM:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_altitudeHAEUncM = a3;
}

- (void)setHasAltitudeHAEUncM:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAltitudeHAEUncM
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSpeedMps:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_speedMps = a3;
}

- (void)setHasSpeedMps:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSpeedMps
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setSpeedUncMps:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_speedUncMps = a3;
}

- (void)setHasSpeedUncMps:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSpeedUncMps
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setReferenceAltM:(float)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_referenceAltM = a3;
}

- (void)setHasReferenceAltM:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasReferenceAltM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setReferenceAltUncM:(float)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_referenceAltUncM = a3;
}

- (void)setHasReferenceAltUncM:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasReferenceAltUncM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTimeSinceLastSignificantLocationVisitExitS:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_timeSinceLastSignificantLocationVisitExitS = a3;
}

- (void)setHasTimeSinceLastSignificantLocationVisitExitS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasTimeSinceLastSignificantLocationVisitExitS
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasActivity
{
  return self->_activity != 0;
}

- (int)reliability
{
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    return self->_reliability;
  else
    return 0;
}

- (void)setReliability:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_reliability = a3;
}

- (void)setHasReliability:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasReliability
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)reliabilityAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_1E9595A00 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReliability:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReliabilityProtobufDefault")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReliablityLow")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReliablityMedium")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ReliabilityHigh")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCalibration
{
  return self->_calibration != 0;
}

- (void)setQuantizedDistChangeSinceLastCalibrationM:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_quantizedDistChangeSinceLastCalibrationM = a3;
}

- (void)setHasQuantizedDistChangeSinceLastCalibrationM:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasQuantizedDistChangeSinceLastCalibrationM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setQuantizedTimeChangeSinceLastCalibrationS:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_quantizedTimeChangeSinceLastCalibrationS = a3;
}

- (void)setHasQuantizedTimeChangeSinceLastCalibrationS:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasQuantizedTimeChangeSinceLastCalibrationS
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
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
  v8.super_class = (Class)CLPCalibratedPressureCollectionRequest;
  -[CLPCalibratedPressureCollectionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPCalibratedPressureCollectionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  $516943A72E2914F818D9A7665AC24C48 has;
  void *v6;
  CLPMotionActivity *activity;
  void *v8;
  uint64_t reliability;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CLPBaroCalibrationIndication *calibration;
  void *v26;
  $516943A72E2914F818D9A7665AC24C48 v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *(float *)&v4 = self->_devicePressurePa;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("devicePressure_pa"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&v4 = self->_devicePressureUncPa;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("devicePressureUnc_pa"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *(float *)&v4 = self->_calibratedPressurePa;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("calibratedPressure_pa"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *(float *)&v4 = self->_calibratedPressureUncPa;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("calibratedPressureUnc_pa"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestampOfCalibrationS);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("timestampOfCalibration_s"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latitudeDeg);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("latitude_deg"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitudeDeg);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("longitude_deg"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *(float *)&v4 = self->_horizontalUncM;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("horizontalUnc_m"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  *(float *)&v4 = self->_altitudeHAEM;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("altitudeHAE_m"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  *(float *)&v4 = self->_altitudeHAEUncM;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("altitudeHAEUnc_m"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  *(float *)&v4 = self->_speedMps;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("speed_mps"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  *(float *)&v4 = self->_speedUncMps;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("speedUnc_mps"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  *(float *)&v4 = self->_referenceAltM;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("referenceAlt_m"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_35:
  *(float *)&v4 = self->_referenceAltUncM;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("referenceAltUnc_m"));

  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeSinceLastSignificantLocationVisitExitS);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timeSinceLastSignificantLocationVisitExit_s"));

  }
LABEL_17:
  activity = self->_activity;
  if (activity)
  {
    -[CLPMotionActivity dictionaryRepresentation](activity, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("activity"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    reliability = self->_reliability;
    if (reliability >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_reliability);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = *(&off_1E9595A00 + reliability);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("reliability"));

  }
  calibration = self->_calibration;
  if (calibration)
  {
    -[CLPBaroCalibrationIndication dictionaryRepresentation](calibration, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("Calibration"));

  }
  v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_quantizedDistChangeSinceLastCalibrationM);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("quantizedDistChangeSinceLastCalibration_m"));

    v27 = self->_has;
  }
  if ((*(_WORD *)&v27 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_quantizedTimeChangeSinceLastCalibrationS);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("quantizedTimeChangeSinceLastCalibration_s"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPCalibratedPressureCollectionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $516943A72E2914F818D9A7665AC24C48 has;
  $516943A72E2914F818D9A7665AC24C48 v5;
  id v6;

  v6 = a3;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    PBDataWriterWriteFloatField();
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteFloatField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_41:
  PBDataWriterWriteFloatField();
  if ((*(_DWORD *)&self->_has & 4) != 0)
LABEL_16:
    PBDataWriterWriteDoubleField();
LABEL_17:
  if (self->_activity)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_calibration)
    PBDataWriterWriteSubmessage();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = self->_has;
  }
  if ((*(_WORD *)&v5 & 0x1000) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  $516943A72E2914F818D9A7665AC24C48 has;
  $516943A72E2914F818D9A7665AC24C48 v6;
  _DWORD *v7;

  v4 = a3;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    v4[18] = LODWORD(self->_devicePressurePa);
    v4[28] |= 0x100u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  v4[19] = LODWORD(self->_devicePressureUncPa);
  v4[28] |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  v4[14] = LODWORD(self->_calibratedPressurePa);
  v4[28] |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  v4[15] = LODWORD(self->_calibratedPressureUncPa);
  v4[28] |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_timestampOfCalibrationS;
  v4[28] |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_latitudeDeg;
  v4[28] |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_longitudeDeg;
  v4[28] |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  v4[20] = LODWORD(self->_horizontalUncM);
  v4[28] |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  v4[12] = LODWORD(self->_altitudeHAEM);
  v4[28] |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  v4[13] = LODWORD(self->_altitudeHAEUncM);
  v4[28] |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  v4[26] = LODWORD(self->_speedMps);
  v4[28] |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  v4[27] = LODWORD(self->_speedUncMps);
  v4[28] |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  v4[23] = LODWORD(self->_referenceAltM);
  v4[28] |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_41:
  v4[24] = LODWORD(self->_referenceAltUncM);
  v4[28] |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_timeSinceLastSignificantLocationVisitExitS;
    v4[28] |= 4u;
  }
LABEL_17:
  v7 = v4;
  if (self->_activity)
  {
    objc_msgSend(v4, "setActivity:");
    v4 = v7;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    v4[25] = self->_reliability;
    v4[28] |= 0x8000u;
  }
  if (self->_calibration)
  {
    objc_msgSend(v7, "setCalibration:");
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
    v4[21] = self->_quantizedDistChangeSinceLastCalibrationM;
    v4[28] |= 0x800u;
    v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    v4[22] = self->_quantizedTimeChangeSinceLastCalibrationS;
    v4[28] |= 0x1000u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $516943A72E2914F818D9A7665AC24C48 has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  $516943A72E2914F818D9A7665AC24C48 v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *(float *)(v5 + 72) = self->_devicePressurePa;
    *(_DWORD *)(v5 + 112) |= 0x100u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 76) = self->_devicePressureUncPa;
  *(_DWORD *)(v5 + 112) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  *(float *)(v5 + 56) = self->_calibratedPressurePa;
  *(_DWORD *)(v5 + 112) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  *(float *)(v5 + 60) = self->_calibratedPressureUncPa;
  *(_DWORD *)(v5 + 112) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  *(double *)(v5 + 32) = self->_timestampOfCalibrationS;
  *(_DWORD *)(v5 + 112) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  *(double *)(v5 + 8) = self->_latitudeDeg;
  *(_DWORD *)(v5 + 112) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  *(double *)(v5 + 16) = self->_longitudeDeg;
  *(_DWORD *)(v5 + 112) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  *(float *)(v5 + 80) = self->_horizontalUncM;
  *(_DWORD *)(v5 + 112) |= 0x400u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *(float *)(v5 + 48) = self->_altitudeHAEM;
  *(_DWORD *)(v5 + 112) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *(float *)(v5 + 52) = self->_altitudeHAEUncM;
  *(_DWORD *)(v5 + 112) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *(float *)(v5 + 104) = self->_speedMps;
  *(_DWORD *)(v5 + 112) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  *(float *)(v5 + 108) = self->_speedUncMps;
  *(_DWORD *)(v5 + 112) |= 0x20000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  *(float *)(v5 + 92) = self->_referenceAltM;
  *(_DWORD *)(v5 + 112) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_37:
  *(float *)(v5 + 96) = self->_referenceAltUncM;
  *(_DWORD *)(v5 + 112) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    *(double *)(v5 + 24) = self->_timeSinceLastSignificantLocationVisitExitS;
    *(_DWORD *)(v5 + 112) |= 4u;
  }
LABEL_17:
  v8 = -[CLPMotionActivity copyWithZone:](self->_activity, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_reliability;
    *(_DWORD *)(v6 + 112) |= 0x8000u;
  }
  v10 = -[CLPBaroCalibrationIndication copyWithZone:](self->_calibration, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v10;

  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 84) = self->_quantizedDistChangeSinceLastCalibrationM;
    *(_DWORD *)(v6 + 112) |= 0x800u;
    v12 = self->_has;
  }
  if ((*(_WORD *)&v12 & 0x1000) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_quantizedTimeChangeSinceLastCalibrationS;
    *(_DWORD *)(v6 + 112) |= 0x1000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $516943A72E2914F818D9A7665AC24C48 has;
  int v6;
  CLPMotionActivity *activity;
  int v8;
  CLPBaroCalibrationIndication *calibration;
  int v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_98;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 28);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_devicePressurePa != *((float *)v4 + 18))
      goto LABEL_98;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_devicePressureUncPa != *((float *)v4 + 19))
      goto LABEL_98;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_calibratedPressurePa != *((float *)v4 + 14))
      goto LABEL_98;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_calibratedPressureUncPa != *((float *)v4 + 15))
      goto LABEL_98;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_timestampOfCalibrationS != *((double *)v4 + 4))
      goto LABEL_98;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_latitudeDeg != *((double *)v4 + 1))
      goto LABEL_98;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_longitudeDeg != *((double *)v4 + 2))
      goto LABEL_98;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_horizontalUncM != *((float *)v4 + 20))
      goto LABEL_98;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_altitudeHAEM != *((float *)v4 + 12))
      goto LABEL_98;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_altitudeHAEUncM != *((float *)v4 + 13))
      goto LABEL_98;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_speedMps != *((float *)v4 + 26))
      goto LABEL_98;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_speedUncMps != *((float *)v4 + 27))
      goto LABEL_98;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_referenceAltM != *((float *)v4 + 23))
      goto LABEL_98;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_referenceAltUncM != *((float *)v4 + 24))
      goto LABEL_98;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_timeSinceLastSignificantLocationVisitExitS != *((double *)v4 + 3))
      goto LABEL_98;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_98;
  }
  activity = self->_activity;
  if ((unint64_t)activity | *((_QWORD *)v4 + 5))
  {
    if (!-[CLPMotionActivity isEqual:](activity, "isEqual:"))
      goto LABEL_98;
    has = self->_has;
  }
  v8 = *((_DWORD *)v4 + 28);
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_reliability != *((_DWORD *)v4 + 25))
      goto LABEL_98;
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_98;
  }
  calibration = self->_calibration;
  if ((unint64_t)calibration | *((_QWORD *)v4 + 8))
  {
    if (-[CLPBaroCalibrationIndication isEqual:](calibration, "isEqual:"))
    {
      has = self->_has;
      goto LABEL_88;
    }
LABEL_98:
    v11 = 0;
    goto LABEL_99;
  }
LABEL_88:
  v10 = *((_DWORD *)v4 + 28);
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_quantizedDistChangeSinceLastCalibrationM != *((_DWORD *)v4 + 21))
      goto LABEL_98;
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_quantizedTimeChangeSinceLastCalibrationS != *((_DWORD *)v4 + 22))
      goto LABEL_98;
    v11 = 1;
  }
  else
  {
    v11 = (*((_DWORD *)v4 + 28) & 0x1000) == 0;
  }
LABEL_99:

  return v11;
}

- (unint64_t)hash
{
  $516943A72E2914F818D9A7665AC24C48 has;
  unint64_t v4;
  float devicePressurePa;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  float devicePressureUncPa;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float calibratedPressurePa;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  float calibratedPressureUncPa;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  double timestampOfCalibrationS;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double latitudeDeg;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double longitudeDeg;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  float horizontalUncM;
  float v41;
  float v42;
  float v43;
  unint64_t v44;
  float altitudeHAEM;
  float v46;
  float v47;
  float v48;
  unint64_t v49;
  float altitudeHAEUncM;
  float v51;
  float v52;
  float v53;
  unint64_t v54;
  float speedMps;
  float v56;
  float v57;
  float v58;
  unint64_t v59;
  float speedUncMps;
  float v61;
  float v62;
  float v63;
  unint64_t v64;
  float referenceAltM;
  float v66;
  float v67;
  float v68;
  unint64_t v69;
  float referenceAltUncM;
  float v71;
  float v72;
  float v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  double timeSinceLastSignificantLocationVisitExitS;
  double v79;
  long double v80;
  double v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  $516943A72E2914F818D9A7665AC24C48 v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    devicePressurePa = self->_devicePressurePa;
    v6 = -devicePressurePa;
    if (devicePressurePa >= 0.0)
      v6 = self->_devicePressurePa;
    v7 = floorf(v6 + 0.5);
    v8 = (float)(v6 - v7) * 1.8447e19;
    v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    devicePressureUncPa = self->_devicePressureUncPa;
    v11 = -devicePressureUncPa;
    if (devicePressureUncPa >= 0.0)
      v11 = self->_devicePressureUncPa;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    calibratedPressurePa = self->_calibratedPressurePa;
    v16 = -calibratedPressurePa;
    if (calibratedPressurePa >= 0.0)
      v16 = self->_calibratedPressurePa;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    calibratedPressureUncPa = self->_calibratedPressureUncPa;
    v21 = -calibratedPressureUncPa;
    if (calibratedPressureUncPa >= 0.0)
      v21 = self->_calibratedPressureUncPa;
    v22 = floorf(v21 + 0.5);
    v23 = (float)(v21 - v22) * 1.8447e19;
    v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    timestampOfCalibrationS = self->_timestampOfCalibrationS;
    v26 = -timestampOfCalibrationS;
    if (timestampOfCalibrationS >= 0.0)
      v26 = self->_timestampOfCalibrationS;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    latitudeDeg = self->_latitudeDeg;
    v31 = -latitudeDeg;
    if (latitudeDeg >= 0.0)
      v31 = self->_latitudeDeg;
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
  if ((*(_BYTE *)&has & 2) != 0)
  {
    longitudeDeg = self->_longitudeDeg;
    v36 = -longitudeDeg;
    if (longitudeDeg >= 0.0)
      v36 = self->_longitudeDeg;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  v96 = v34;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    horizontalUncM = self->_horizontalUncM;
    v41 = -horizontalUncM;
    if (horizontalUncM >= 0.0)
      v41 = self->_horizontalUncM;
    v42 = floorf(v41 + 0.5);
    v43 = (float)(v41 - v42) * 1.8447e19;
    v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  v95 = v39;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    altitudeHAEM = self->_altitudeHAEM;
    v46 = -altitudeHAEM;
    if (altitudeHAEM >= 0.0)
      v46 = self->_altitudeHAEM;
    v47 = floorf(v46 + 0.5);
    v48 = (float)(v46 - v47) * 1.8447e19;
    v44 = 2654435761u * (unint64_t)fmodf(v47, 1.8447e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabsf(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  v94 = v44;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    altitudeHAEUncM = self->_altitudeHAEUncM;
    v51 = -altitudeHAEUncM;
    if (altitudeHAEUncM >= 0.0)
      v51 = self->_altitudeHAEUncM;
    v52 = floorf(v51 + 0.5);
    v53 = (float)(v51 - v52) * 1.8447e19;
    v49 = 2654435761u * (unint64_t)fmodf(v52, 1.8447e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0)
        v49 += (unint64_t)v53;
    }
    else
    {
      v49 -= (unint64_t)fabsf(v53);
    }
  }
  else
  {
    v49 = 0;
  }
  v93 = v49;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    speedMps = self->_speedMps;
    v56 = -speedMps;
    if (speedMps >= 0.0)
      v56 = self->_speedMps;
    v57 = floorf(v56 + 0.5);
    v58 = (float)(v56 - v57) * 1.8447e19;
    v54 = 2654435761u * (unint64_t)fmodf(v57, 1.8447e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0)
        v54 += (unint64_t)v58;
    }
    else
    {
      v54 -= (unint64_t)fabsf(v58);
    }
  }
  else
  {
    v54 = 0;
  }
  v92 = v54;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    speedUncMps = self->_speedUncMps;
    v61 = -speedUncMps;
    if (speedUncMps >= 0.0)
      v61 = self->_speedUncMps;
    v62 = floorf(v61 + 0.5);
    v63 = (float)(v61 - v62) * 1.8447e19;
    v59 = 2654435761u * (unint64_t)fmodf(v62, 1.8447e19);
    if (v63 >= 0.0)
    {
      if (v63 > 0.0)
        v59 += (unint64_t)v63;
    }
    else
    {
      v59 -= (unint64_t)fabsf(v63);
    }
  }
  else
  {
    v59 = 0;
  }
  v91 = v59;
  v99 = v9;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    referenceAltM = self->_referenceAltM;
    v66 = -referenceAltM;
    if (referenceAltM >= 0.0)
      v66 = self->_referenceAltM;
    v67 = floorf(v66 + 0.5);
    v68 = (float)(v66 - v67) * 1.8447e19;
    v64 = 2654435761u * (unint64_t)fmodf(v67, 1.8447e19);
    if (v68 >= 0.0)
    {
      if (v68 > 0.0)
        v64 += (unint64_t)v68;
    }
    else
    {
      v64 -= (unint64_t)fabsf(v68);
    }
  }
  else
  {
    v64 = 0;
  }
  v97 = v29;
  v98 = v4;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    referenceAltUncM = self->_referenceAltUncM;
    v71 = -referenceAltUncM;
    if (referenceAltUncM >= 0.0)
      v71 = self->_referenceAltUncM;
    v72 = floorf(v71 + 0.5);
    v73 = (float)(v71 - v72) * 1.8447e19;
    v69 = 2654435761u * (unint64_t)fmodf(v72, 1.8447e19);
    if (v73 >= 0.0)
    {
      if (v73 > 0.0)
        v69 += (unint64_t)v73;
    }
    else
    {
      v69 -= (unint64_t)fabsf(v73);
    }
  }
  else
  {
    v69 = 0;
  }
  v89 = v64;
  v74 = v14;
  v75 = v24;
  if ((*(_BYTE *)&has & 4) != 0)
  {
    timeSinceLastSignificantLocationVisitExitS = self->_timeSinceLastSignificantLocationVisitExitS;
    v79 = -timeSinceLastSignificantLocationVisitExitS;
    if (timeSinceLastSignificantLocationVisitExitS >= 0.0)
      v79 = self->_timeSinceLastSignificantLocationVisitExitS;
    v80 = floor(v79 + 0.5);
    v81 = (v79 - v80) * 1.84467441e19;
    v77 = 2654435761u * (unint64_t)fmod(v80, 1.84467441e19);
    v76 = v19;
    if (v81 >= 0.0)
    {
      if (v81 > 0.0)
        v77 += (unint64_t)v81;
    }
    else
    {
      v77 -= (unint64_t)fabs(v81);
    }
  }
  else
  {
    v76 = v19;
    v77 = 0;
  }
  v82 = -[CLPMotionActivity hash](self->_activity, "hash", v89);
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    v83 = 2654435761 * self->_reliability;
  else
    v83 = 0;
  v84 = -[CLPBaroCalibrationIndication hash](self->_calibration, "hash");
  v85 = self->_has;
  if ((*(_WORD *)&v85 & 0x800) != 0)
  {
    v86 = 2654435761 * self->_quantizedDistChangeSinceLastCalibrationM;
    if ((*(_WORD *)&v85 & 0x1000) != 0)
      goto LABEL_126;
LABEL_128:
    v87 = 0;
    return v99 ^ v98 ^ v74 ^ v76 ^ v75 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v69 ^ v77 ^ v83 ^ v82 ^ v84 ^ v86 ^ v87;
  }
  v86 = 0;
  if ((*(_WORD *)&v85 & 0x1000) == 0)
    goto LABEL_128;
LABEL_126:
  v87 = 2654435761 * self->_quantizedTimeChangeSinceLastCalibrationS;
  return v99 ^ v98 ^ v74 ^ v76 ^ v75 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v69 ^ v77 ^ v83 ^ v82 ^ v84 ^ v86 ^ v87;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  int v6;
  CLPMotionActivity *activity;
  uint64_t v8;
  CLPBaroCalibrationIndication *calibration;
  uint64_t v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x100) != 0)
  {
    self->_devicePressurePa = *((float *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x100u;
    v6 = *((_DWORD *)v4 + 28);
    if ((v6 & 0x200) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((v6 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_devicePressureUncPa = *((float *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x200u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  self->_calibratedPressurePa = *((float *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x40u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x80) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  self->_calibratedPressureUncPa = *((float *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x80u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 1) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  self->_timestampOfCalibrationS = *((double *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 1) == 0)
  {
LABEL_7:
    if ((v6 & 2) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  self->_latitudeDeg = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 2) == 0)
  {
LABEL_8:
    if ((v6 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  self->_longitudeDeg = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x400) == 0)
  {
LABEL_9:
    if ((v6 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  self->_horizontalUncM = *((float *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x400u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  self->_altitudeHAEM = *((float *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x10u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x20) == 0)
  {
LABEL_11:
    if ((v6 & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  self->_altitudeHAEUncM = *((float *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x20u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x10000) == 0)
  {
LABEL_12:
    if ((v6 & 0x20000) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  self->_speedMps = *((float *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x10000u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x20000) == 0)
  {
LABEL_13:
    if ((v6 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  self->_speedUncMps = *((float *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x20000u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x2000) == 0)
  {
LABEL_14:
    if ((v6 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  self->_referenceAltM = *((float *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x2000u;
  v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x4000) == 0)
  {
LABEL_15:
    if ((v6 & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_33:
  self->_referenceAltUncM = *((float *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    self->_timeSinceLastSignificantLocationVisitExitS = *((double *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_17:
  activity = self->_activity;
  v8 = *((_QWORD *)v5 + 5);
  v12 = v5;
  if (activity)
  {
    if (!v8)
      goto LABEL_38;
    -[CLPMotionActivity mergeFrom:](activity, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_38;
    -[CLPCalibratedPressureCollectionRequest setActivity:](self, "setActivity:");
  }
  v5 = v12;
LABEL_38:
  if ((*((_BYTE *)v5 + 113) & 0x80) != 0)
  {
    self->_reliability = *((_DWORD *)v5 + 25);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  calibration = self->_calibration;
  v10 = *((_QWORD *)v5 + 8);
  if (calibration)
  {
    if (!v10)
      goto LABEL_46;
    -[CLPBaroCalibrationIndication mergeFrom:](calibration, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_46;
    -[CLPCalibratedPressureCollectionRequest setCalibration:](self, "setCalibration:");
  }
  v5 = v12;
LABEL_46:
  v11 = *((_DWORD *)v5 + 28);
  if ((v11 & 0x800) != 0)
  {
    self->_quantizedDistChangeSinceLastCalibrationM = *((_DWORD *)v5 + 21);
    *(_DWORD *)&self->_has |= 0x800u;
    v11 = *((_DWORD *)v5 + 28);
  }
  if ((v11 & 0x1000) != 0)
  {
    self->_quantizedTimeChangeSinceLastCalibrationS = *((_DWORD *)v5 + 22);
    *(_DWORD *)&self->_has |= 0x1000u;
  }

}

- (float)devicePressurePa
{
  return self->_devicePressurePa;
}

- (float)devicePressureUncPa
{
  return self->_devicePressureUncPa;
}

- (float)calibratedPressurePa
{
  return self->_calibratedPressurePa;
}

- (float)calibratedPressureUncPa
{
  return self->_calibratedPressureUncPa;
}

- (double)timestampOfCalibrationS
{
  return self->_timestampOfCalibrationS;
}

- (double)latitudeDeg
{
  return self->_latitudeDeg;
}

- (double)longitudeDeg
{
  return self->_longitudeDeg;
}

- (float)horizontalUncM
{
  return self->_horizontalUncM;
}

- (float)altitudeHAEM
{
  return self->_altitudeHAEM;
}

- (float)altitudeHAEUncM
{
  return self->_altitudeHAEUncM;
}

- (float)speedMps
{
  return self->_speedMps;
}

- (float)speedUncMps
{
  return self->_speedUncMps;
}

- (float)referenceAltM
{
  return self->_referenceAltM;
}

- (float)referenceAltUncM
{
  return self->_referenceAltUncM;
}

- (double)timeSinceLastSignificantLocationVisitExitS
{
  return self->_timeSinceLastSignificantLocationVisitExitS;
}

- (CLPMotionActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (CLPBaroCalibrationIndication)calibration
{
  return self->_calibration;
}

- (void)setCalibration:(id)a3
{
  objc_storeStrong((id *)&self->_calibration, a3);
}

- (int)quantizedDistChangeSinceLastCalibrationM
{
  return self->_quantizedDistChangeSinceLastCalibrationM;
}

- (int)quantizedTimeChangeSinceLastCalibrationS
{
  return self->_quantizedTimeChangeSinceLastCalibrationS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibration, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
