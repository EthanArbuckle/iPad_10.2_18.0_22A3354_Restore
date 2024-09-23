@implementation HDCodableVisionSample

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setPrescriptionType:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_prescriptionType = a3;
}

- (void)setHasPrescriptionType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPrescriptionType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setLeftSphere:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_leftSphere = a3;
}

- (void)setHasLeftSphere:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLeftSphere
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRightSphere:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_rightSphere = a3;
}

- (void)setHasRightSphere:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasRightSphere
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setLeftCylinder:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_leftCylinder = a3;
}

- (void)setHasLeftCylinder:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasLeftCylinder
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRightCylinder:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_rightCylinder = a3;
}

- (void)setHasRightCylinder:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRightCylinder
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setLeftAxis:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_leftAxis = a3;
}

- (void)setHasLeftAxis:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasLeftAxis
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRightAxis:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rightAxis = a3;
}

- (void)setHasRightAxis:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRightAxis
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setLeftAddPower:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_leftAddPower = a3;
}

- (void)setHasLeftAddPower:(BOOL)a3
{
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasLeftAddPower
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRightAddPower:(double)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_rightAddPower = a3;
}

- (void)setHasRightAddPower:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRightAddPower
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setLeftVertexDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_leftVertexDistance = a3;
}

- (void)setHasLeftVertexDistance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLeftVertexDistance
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRightVertexDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_rightVertexDistance = a3;
}

- (void)setHasRightVertexDistance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasRightVertexDistance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setLeftPrismAmount:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_leftPrismAmount = a3;
}

- (void)setHasLeftPrismAmount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLeftPrismAmount
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setRightPrismAmount:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_rightPrismAmount = a3;
}

- (void)setHasRightPrismAmount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRightPrismAmount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setLeftPrismAngle:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_leftPrismAngle = a3;
}

- (void)setHasLeftPrismAngle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLeftPrismAngle
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setRightPrismAngle:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_rightPrismAngle = a3;
}

- (void)setHasRightPrismAngle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRightPrismAngle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setLeftFarPupillaryDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_leftFarPupillaryDistance = a3;
}

- (void)setHasLeftFarPupillaryDistance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasLeftFarPupillaryDistance
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setRightFarPupillaryDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_rightFarPupillaryDistance = a3;
}

- (void)setHasRightFarPupillaryDistance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRightFarPupillaryDistance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setLeftNearPupillaryDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_leftNearPupillaryDistance = a3;
}

- (void)setHasLeftNearPupillaryDistance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasLeftNearPupillaryDistance
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRightNearPupillaryDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_rightNearPupillaryDistance = a3;
}

- (void)setHasRightNearPupillaryDistance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasRightNearPupillaryDistance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasGlassesDescription
{
  return self->_glassesDescription != 0;
}

- (void)setLeftBaseCurve:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_leftBaseCurve = a3;
}

- (void)setHasLeftBaseCurve:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasLeftBaseCurve
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRightBaseCurve:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rightBaseCurve = a3;
}

- (void)setHasRightBaseCurve:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRightBaseCurve
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setLeftContactDiameter:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_leftContactDiameter = a3;
}

- (void)setHasLeftContactDiameter:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasLeftContactDiameter
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRightContactDiameter:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_rightContactDiameter = a3;
}

- (void)setHasRightContactDiameter:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasRightContactDiameter
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasBrand
{
  return self->_brand != 0;
}

- (BOOL)hasVerifiableData
{
  return self->_verifiableData != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableVisionSample;
  -[HDCodableVisionSample description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableVisionSample dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableSample *sample;
  void *v5;
  $F833AA3FAF368E1CC47BE03942224269 has;
  void *v7;
  NSString *glassesDescription;
  $F833AA3FAF368E1CC47BE03942224269 v9;
  void *v10;
  NSString *brand;
  HDCodableVerifiableData *verifiableData;
  void *v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_prescriptionType);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("prescriptionType"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_6;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftSphere);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("leftSphere"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightSphere);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("rightSphere"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftCylinder);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("leftCylinder"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightCylinder);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("rightCylinder"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftAxis);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("leftAxis"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightAxis);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("rightAxis"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftAddPower);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("leftAddPower"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightAddPower);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("rightAddPower"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftVertexDistance);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("leftVertexDistance"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightVertexDistance);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("rightVertexDistance"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftPrismAmount);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("leftPrismAmount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightPrismAmount);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("rightPrismAmount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftPrismAngle);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("leftPrismAngle"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightPrismAngle);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("rightPrismAngle"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftFarPupillaryDistance);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("leftFarPupillaryDistance"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightFarPupillaryDistance);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("rightFarPupillaryDistance"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftNearPupillaryDistance);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("leftNearPupillaryDistance"));

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightNearPupillaryDistance);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rightNearPupillaryDistance"));

  }
LABEL_23:
  glassesDescription = self->_glassesDescription;
  if (glassesDescription)
    objc_msgSend(v3, "setObject:forKey:", glassesDescription, CFSTR("glassesDescription"));
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftBaseCurve);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("leftBaseCurve"));

    v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x4000) == 0)
    {
LABEL_27:
      if ((*(_BYTE *)&v9 & 8) == 0)
        goto LABEL_28;
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightBaseCurve);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("rightBaseCurve"));

  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 8) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v9 & 0x8000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftContactDiameter);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("leftContactDiameter"));

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightContactDiameter);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("rightContactDiameter"));

  }
LABEL_30:
  brand = self->_brand;
  if (brand)
    objc_msgSend(v3, "setObject:forKey:", brand, CFSTR("brand"));
  verifiableData = self->_verifiableData;
  if (verifiableData)
  {
    -[HDCodableVerifiableData dictionaryRepresentation](verifiableData, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("verifiableData"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableVisionSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $F833AA3FAF368E1CC47BE03942224269 has;
  $F833AA3FAF368E1CC47BE03942224269 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_6;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_52:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_22:
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
LABEL_23:
  if (self->_glassesDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x4000) == 0)
    {
LABEL_27:
      if ((*(_BYTE *)&v6 & 8) == 0)
        goto LABEL_28;
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteDoubleField();
  v4 = v7;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_56:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_29:
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
LABEL_30:
  if (self->_brand)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_verifiableData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  $F833AA3FAF368E1CC47BE03942224269 has;
  $F833AA3FAF368E1CC47BE03942224269 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v7;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *((_QWORD *)v4 + 12) = self->_prescriptionType;
    *((_DWORD *)v4 + 56) |= 0x800u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_6;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_leftSphere;
  *((_DWORD *)v4 + 56) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)v4 + 22) = *(_QWORD *)&self->_rightSphere;
  *((_DWORD *)v4 + 56) |= 0x200000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_8;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_leftCylinder;
  *((_DWORD *)v4 + 56) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_9;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)v4 + 17) = *(_QWORD *)&self->_rightCylinder;
  *((_DWORD *)v4 + 56) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_41;
  }
LABEL_40:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_leftAxis;
  *((_DWORD *)v4 + 56) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  *((_QWORD *)v4 + 14) = *(_QWORD *)&self->_rightAxis;
  *((_DWORD *)v4 + 56) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_leftAddPower;
  *((_DWORD *)v4 + 56) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  *((_QWORD *)v4 + 13) = *(_QWORD *)&self->_rightAddPower;
  *((_DWORD *)v4 + 56) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)v4 + 11) = *(_QWORD *)&self->_leftVertexDistance;
  *((_DWORD *)v4 + 56) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)v4 + 23) = *(_QWORD *)&self->_rightVertexDistance;
  *((_DWORD *)v4 + 56) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_leftPrismAmount;
  *((_DWORD *)v4 + 56) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  *((_QWORD *)v4 + 20) = *(_QWORD *)&self->_rightPrismAmount;
  *((_DWORD *)v4 + 56) |= 0x80000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_leftPrismAngle;
  *((_DWORD *)v4 + 56) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)v4 + 21) = *(_QWORD *)&self->_rightPrismAngle;
  *((_DWORD *)v4 + 56) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_leftFarPupillaryDistance;
  *((_DWORD *)v4 + 56) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  *((_QWORD *)v4 + 18) = *(_QWORD *)&self->_rightFarPupillaryDistance;
  *((_DWORD *)v4 + 56) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_52:
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_leftNearPupillaryDistance;
  *((_DWORD *)v4 + 56) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_22:
    *((_QWORD *)v4 + 19) = *(_QWORD *)&self->_rightNearPupillaryDistance;
    *((_DWORD *)v4 + 56) |= 0x40000u;
  }
LABEL_23:
  if (self->_glassesDescription)
  {
    objc_msgSend(v7, "setGlassesDescription:");
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_leftBaseCurve;
    *((_DWORD *)v4 + 56) |= 4u;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x4000) == 0)
    {
LABEL_27:
      if ((*(_BYTE *)&v6 & 8) == 0)
        goto LABEL_28;
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
    goto LABEL_27;
  }
  *((_QWORD *)v4 + 15) = *(_QWORD *)&self->_rightBaseCurve;
  *((_DWORD *)v4 + 56) |= 0x4000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_56:
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_leftContactDiameter;
  *((_DWORD *)v4 + 56) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_29:
    *((_QWORD *)v4 + 16) = *(_QWORD *)&self->_rightContactDiameter;
    *((_DWORD *)v4 + 56) |= 0x8000u;
  }
LABEL_30:
  if (self->_brand)
  {
    objc_msgSend(v7, "setBrand:");
    v4 = v7;
  }
  if (self->_verifiableData)
  {
    objc_msgSend(v7, "setVerifiableData:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  $F833AA3FAF368E1CC47BE03942224269 has;
  uint64_t v9;
  void *v10;
  $F833AA3FAF368E1CC47BE03942224269 v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v6;

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *(_QWORD *)(v5 + 96) = self->_prescriptionType;
    *(_DWORD *)(v5 + 224) |= 0x800u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 80) = self->_leftSphere;
  *(_DWORD *)(v5 + 224) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  *(double *)(v5 + 176) = self->_rightSphere;
  *(_DWORD *)(v5 + 224) |= 0x200000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  *(double *)(v5 + 40) = self->_leftCylinder;
  *(_DWORD *)(v5 + 224) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  *(double *)(v5 + 136) = self->_rightCylinder;
  *(_DWORD *)(v5 + 224) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  *(double *)(v5 + 16) = self->_leftAxis;
  *(_DWORD *)(v5 + 224) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  *(double *)(v5 + 112) = self->_rightAxis;
  *(_DWORD *)(v5 + 224) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  *(double *)(v5 + 8) = self->_leftAddPower;
  *(_DWORD *)(v5 + 224) |= 1u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  *(double *)(v5 + 104) = self->_rightAddPower;
  *(_DWORD *)(v5 + 224) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  *(double *)(v5 + 88) = self->_leftVertexDistance;
  *(_DWORD *)(v5 + 224) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  *(double *)(v5 + 184) = self->_rightVertexDistance;
  *(_DWORD *)(v5 + 224) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  *(double *)(v5 + 64) = self->_leftPrismAmount;
  *(_DWORD *)(v5 + 224) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  *(double *)(v5 + 160) = self->_rightPrismAmount;
  *(_DWORD *)(v5 + 224) |= 0x80000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  *(double *)(v5 + 72) = self->_leftPrismAngle;
  *(_DWORD *)(v5 + 224) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  *(double *)(v5 + 168) = self->_rightPrismAngle;
  *(_DWORD *)(v5 + 224) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  *(double *)(v5 + 48) = self->_leftFarPupillaryDistance;
  *(_DWORD *)(v5 + 224) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  *(double *)(v5 + 144) = self->_rightFarPupillaryDistance;
  *(_DWORD *)(v5 + 224) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_44:
  *(double *)(v5 + 56) = self->_leftNearPupillaryDistance;
  *(_DWORD *)(v5 + 224) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_20:
    *(double *)(v5 + 152) = self->_rightNearPupillaryDistance;
    *(_DWORD *)(v5 + 224) |= 0x40000u;
  }
LABEL_21:
  v9 = -[NSString copyWithZone:](self->_glassesDescription, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v9;

  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_leftBaseCurve;
    *(_DWORD *)(v5 + 224) |= 4u;
    v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x4000) == 0)
    {
LABEL_23:
      if ((*(_BYTE *)&v11 & 8) == 0)
        goto LABEL_24;
LABEL_48:
      *(double *)(v5 + 32) = self->_leftContactDiameter;
      *(_DWORD *)(v5 + 224) |= 8u;
      if ((*(_DWORD *)&self->_has & 0x8000) == 0)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
    goto LABEL_23;
  }
  *(double *)(v5 + 120) = self->_rightBaseCurve;
  *(_DWORD *)(v5 + 224) |= 0x4000u;
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 8) != 0)
    goto LABEL_48;
LABEL_24:
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
LABEL_25:
    *(double *)(v5 + 128) = self->_rightContactDiameter;
    *(_DWORD *)(v5 + 224) |= 0x8000u;
  }
LABEL_26:
  v12 = -[NSString copyWithZone:](self->_brand, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v12;

  v14 = -[HDCodableVerifiableData copyWithZone:](self->_verifiableData, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  $F833AA3FAF368E1CC47BE03942224269 has;
  int v7;
  NSString *glassesDescription;
  NSString *brand;
  HDCodableVerifiableData *verifiableData;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_126;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 26))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_126;
  }
  has = self->_has;
  v7 = *((_DWORD *)v4 + 56);
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_prescriptionType != *((_QWORD *)v4 + 12))
      goto LABEL_126;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_leftSphere != *((double *)v4 + 10))
      goto LABEL_126;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_rightSphere != *((double *)v4 + 22))
      goto LABEL_126;
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_leftCylinder != *((double *)v4 + 5))
      goto LABEL_126;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_rightCylinder != *((double *)v4 + 17))
      goto LABEL_126;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_leftAxis != *((double *)v4 + 2))
      goto LABEL_126;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_rightAxis != *((double *)v4 + 14))
      goto LABEL_126;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_leftAddPower != *((double *)v4 + 1))
      goto LABEL_126;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_rightAddPower != *((double *)v4 + 13))
      goto LABEL_126;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_leftVertexDistance != *((double *)v4 + 11))
      goto LABEL_126;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_rightVertexDistance != *((double *)v4 + 23))
      goto LABEL_126;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_leftPrismAmount != *((double *)v4 + 8))
      goto LABEL_126;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_rightPrismAmount != *((double *)v4 + 20))
      goto LABEL_126;
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_leftPrismAngle != *((double *)v4 + 9))
      goto LABEL_126;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_rightPrismAngle != *((double *)v4 + 21))
      goto LABEL_126;
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_leftFarPupillaryDistance != *((double *)v4 + 6))
      goto LABEL_126;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_rightFarPupillaryDistance != *((double *)v4 + 18))
      goto LABEL_126;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_leftNearPupillaryDistance != *((double *)v4 + 7))
      goto LABEL_126;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_rightNearPupillaryDistance != *((double *)v4 + 19))
      goto LABEL_126;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_126;
  }
  glassesDescription = self->_glassesDescription;
  if ((unint64_t)glassesDescription | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](glassesDescription, "isEqual:"))
    {
LABEL_126:
      v11 = 0;
      goto LABEL_127;
    }
    has = self->_has;
    v7 = *((_DWORD *)v4 + 56);
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_leftBaseCurve != *((double *)v4 + 3))
      goto LABEL_126;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_rightBaseCurve != *((double *)v4 + 15))
      goto LABEL_126;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_leftContactDiameter != *((double *)v4 + 4))
      goto LABEL_126;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_rightContactDiameter != *((double *)v4 + 16))
      goto LABEL_126;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_126;
  }
  brand = self->_brand;
  if ((unint64_t)brand | *((_QWORD *)v4 + 24) && !-[NSString isEqual:](brand, "isEqual:"))
    goto LABEL_126;
  verifiableData = self->_verifiableData;
  if ((unint64_t)verifiableData | *((_QWORD *)v4 + 27))
    v11 = -[HDCodableVerifiableData isEqual:](verifiableData, "isEqual:");
  else
    v11 = 1;
LABEL_127:

  return v11;
}

- (unint64_t)hash
{
  $F833AA3FAF368E1CC47BE03942224269 has;
  double leftSphere;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double rightSphere;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double leftCylinder;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double rightCylinder;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double leftAxis;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double rightAxis;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double leftAddPower;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  double rightAddPower;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  double leftVertexDistance;
  double v46;
  long double v47;
  double v48;
  unint64_t v49;
  double rightVertexDistance;
  double v51;
  long double v52;
  double v53;
  unint64_t v54;
  double leftPrismAmount;
  double v56;
  long double v57;
  double v58;
  unint64_t v59;
  double rightPrismAmount;
  double v61;
  long double v62;
  double v63;
  unint64_t v64;
  double leftPrismAngle;
  double v66;
  long double v67;
  double v68;
  unint64_t v69;
  double rightPrismAngle;
  double v71;
  long double v72;
  double v73;
  unint64_t v74;
  double leftFarPupillaryDistance;
  double v76;
  long double v77;
  double v78;
  unint64_t v79;
  double rightFarPupillaryDistance;
  double v81;
  long double v82;
  double v83;
  unint64_t v84;
  double leftNearPupillaryDistance;
  double v86;
  long double v87;
  double v88;
  unint64_t v89;
  unint64_t v90;
  double rightNearPupillaryDistance;
  double v92;
  long double v93;
  double v94;
  $F833AA3FAF368E1CC47BE03942224269 v95;
  unint64_t v96;
  double leftBaseCurve;
  double v98;
  long double v99;
  double v100;
  unint64_t v101;
  double rightBaseCurve;
  double v103;
  long double v104;
  double v105;
  unint64_t v106;
  unint64_t v107;
  double leftContactDiameter;
  double v109;
  long double v110;
  double v111;
  unint64_t v112;
  double rightContactDiameter;
  double v114;
  long double v115;
  double v116;
  unint64_t v117;
  NSUInteger v118;
  NSUInteger v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  uint64_t v135;
  unint64_t v136;

  v136 = -[HDCodableSample hash](self->_sample, "hash");
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v135 = 2654435761 * self->_prescriptionType;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v135 = 0;
  if ((*(_WORD *)&has & 0x200) == 0)
    goto LABEL_8;
LABEL_3:
  leftSphere = self->_leftSphere;
  v5 = -leftSphere;
  if (leftSphere >= 0.0)
    v5 = self->_leftSphere;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    rightSphere = self->_rightSphere;
    v11 = -rightSphere;
    if (rightSphere >= 0.0)
      v11 = self->_rightSphere;
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
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    leftCylinder = self->_leftCylinder;
    v16 = -leftCylinder;
    if (leftCylinder >= 0.0)
      v16 = self->_leftCylinder;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    rightCylinder = self->_rightCylinder;
    v21 = -rightCylinder;
    if (rightCylinder >= 0.0)
      v21 = self->_rightCylinder;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    leftAxis = self->_leftAxis;
    v26 = -leftAxis;
    if (leftAxis >= 0.0)
      v26 = self->_leftAxis;
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
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    rightAxis = self->_rightAxis;
    v31 = -rightAxis;
    if (rightAxis >= 0.0)
      v31 = self->_rightAxis;
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
  if ((*(_BYTE *)&has & 1) != 0)
  {
    leftAddPower = self->_leftAddPower;
    v36 = -leftAddPower;
    if (leftAddPower >= 0.0)
      v36 = self->_leftAddPower;
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
  v131 = v34;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    rightAddPower = self->_rightAddPower;
    v41 = -rightAddPower;
    if (rightAddPower >= 0.0)
      v41 = self->_rightAddPower;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  v130 = v39;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    leftVertexDistance = self->_leftVertexDistance;
    v46 = -leftVertexDistance;
    if (leftVertexDistance >= 0.0)
      v46 = self->_leftVertexDistance;
    v47 = floor(v46 + 0.5);
    v48 = (v46 - v47) * 1.84467441e19;
    v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  v129 = v44;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    rightVertexDistance = self->_rightVertexDistance;
    v51 = -rightVertexDistance;
    if (rightVertexDistance >= 0.0)
      v51 = self->_rightVertexDistance;
    v52 = floor(v51 + 0.5);
    v53 = (v51 - v52) * 1.84467441e19;
    v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0)
        v49 += (unint64_t)v53;
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    v49 = 0;
  }
  v128 = v49;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    leftPrismAmount = self->_leftPrismAmount;
    v56 = -leftPrismAmount;
    if (leftPrismAmount >= 0.0)
      v56 = self->_leftPrismAmount;
    v57 = floor(v56 + 0.5);
    v58 = (v56 - v57) * 1.84467441e19;
    v54 = 2654435761u * (unint64_t)fmod(v57, 1.84467441e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0)
        v54 += (unint64_t)v58;
    }
    else
    {
      v54 -= (unint64_t)fabs(v58);
    }
  }
  else
  {
    v54 = 0;
  }
  v127 = v54;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    rightPrismAmount = self->_rightPrismAmount;
    v61 = -rightPrismAmount;
    if (rightPrismAmount >= 0.0)
      v61 = self->_rightPrismAmount;
    v62 = floor(v61 + 0.5);
    v63 = (v61 - v62) * 1.84467441e19;
    v59 = 2654435761u * (unint64_t)fmod(v62, 1.84467441e19);
    if (v63 >= 0.0)
    {
      if (v63 > 0.0)
        v59 += (unint64_t)v63;
    }
    else
    {
      v59 -= (unint64_t)fabs(v63);
    }
  }
  else
  {
    v59 = 0;
  }
  v126 = v59;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    leftPrismAngle = self->_leftPrismAngle;
    v66 = -leftPrismAngle;
    if (leftPrismAngle >= 0.0)
      v66 = self->_leftPrismAngle;
    v67 = floor(v66 + 0.5);
    v68 = (v66 - v67) * 1.84467441e19;
    v64 = 2654435761u * (unint64_t)fmod(v67, 1.84467441e19);
    if (v68 >= 0.0)
    {
      if (v68 > 0.0)
        v64 += (unint64_t)v68;
    }
    else
    {
      v64 -= (unint64_t)fabs(v68);
    }
  }
  else
  {
    v64 = 0;
  }
  v125 = v64;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    rightPrismAngle = self->_rightPrismAngle;
    v71 = -rightPrismAngle;
    if (rightPrismAngle >= 0.0)
      v71 = self->_rightPrismAngle;
    v72 = floor(v71 + 0.5);
    v73 = (v71 - v72) * 1.84467441e19;
    v69 = 2654435761u * (unint64_t)fmod(v72, 1.84467441e19);
    if (v73 >= 0.0)
    {
      if (v73 > 0.0)
        v69 += (unint64_t)v73;
    }
    else
    {
      v69 -= (unint64_t)fabs(v73);
    }
  }
  else
  {
    v69 = 0;
  }
  v124 = v69;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    leftFarPupillaryDistance = self->_leftFarPupillaryDistance;
    v76 = -leftFarPupillaryDistance;
    if (leftFarPupillaryDistance >= 0.0)
      v76 = self->_leftFarPupillaryDistance;
    v77 = floor(v76 + 0.5);
    v78 = (v76 - v77) * 1.84467441e19;
    v74 = 2654435761u * (unint64_t)fmod(v77, 1.84467441e19);
    if (v78 >= 0.0)
    {
      if (v78 > 0.0)
        v74 += (unint64_t)v78;
    }
    else
    {
      v74 -= (unint64_t)fabs(v78);
    }
  }
  else
  {
    v74 = 0;
  }
  v123 = v74;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    rightFarPupillaryDistance = self->_rightFarPupillaryDistance;
    v81 = -rightFarPupillaryDistance;
    if (rightFarPupillaryDistance >= 0.0)
      v81 = self->_rightFarPupillaryDistance;
    v82 = floor(v81 + 0.5);
    v83 = (v81 - v82) * 1.84467441e19;
    v79 = 2654435761u * (unint64_t)fmod(v82, 1.84467441e19);
    if (v83 >= 0.0)
    {
      if (v83 > 0.0)
        v79 += (unint64_t)v83;
    }
    else
    {
      v79 -= (unint64_t)fabs(v83);
    }
  }
  else
  {
    v79 = 0;
  }
  v122 = v79;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    leftNearPupillaryDistance = self->_leftNearPupillaryDistance;
    v86 = -leftNearPupillaryDistance;
    if (leftNearPupillaryDistance >= 0.0)
      v86 = self->_leftNearPupillaryDistance;
    v87 = floor(v86 + 0.5);
    v88 = (v86 - v87) * 1.84467441e19;
    v84 = 2654435761u * (unint64_t)fmod(v87, 1.84467441e19);
    if (v88 >= 0.0)
    {
      if (v88 > 0.0)
        v84 += (unint64_t)v88;
    }
    else
    {
      v84 -= (unint64_t)fabs(v88);
    }
  }
  else
  {
    v84 = 0;
  }
  v121 = v84;
  v133 = v24;
  v134 = v8;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    rightNearPupillaryDistance = self->_rightNearPupillaryDistance;
    v92 = -rightNearPupillaryDistance;
    if (rightNearPupillaryDistance >= 0.0)
      v92 = self->_rightNearPupillaryDistance;
    v93 = floor(v92 + 0.5);
    v94 = (v92 - v93) * 1.84467441e19;
    v90 = 2654435761u * (unint64_t)fmod(v93, 1.84467441e19);
    v89 = v9;
    if (v94 >= 0.0)
    {
      if (v94 > 0.0)
        v90 += (unint64_t)v94;
    }
    else
    {
      v90 -= (unint64_t)fabs(v94);
    }
  }
  else
  {
    v89 = v9;
    v90 = 0;
  }
  v132 = v29;
  v120 = -[NSString hash](self->_glassesDescription, "hash");
  v95 = self->_has;
  if ((*(_BYTE *)&v95 & 4) != 0)
  {
    leftBaseCurve = self->_leftBaseCurve;
    v98 = -leftBaseCurve;
    if (leftBaseCurve >= 0.0)
      v98 = self->_leftBaseCurve;
    v99 = floor(v98 + 0.5);
    v100 = (v98 - v99) * 1.84467441e19;
    v96 = 2654435761u * (unint64_t)fmod(v99, 1.84467441e19);
    if (v100 >= 0.0)
    {
      if (v100 > 0.0)
        v96 += (unint64_t)v100;
    }
    else
    {
      v96 -= (unint64_t)fabs(v100);
    }
  }
  else
  {
    v96 = 0;
  }
  if ((*(_WORD *)&v95 & 0x4000) != 0)
  {
    rightBaseCurve = self->_rightBaseCurve;
    v103 = -rightBaseCurve;
    if (rightBaseCurve >= 0.0)
      v103 = self->_rightBaseCurve;
    v104 = floor(v103 + 0.5);
    v105 = (v103 - v104) * 1.84467441e19;
    v101 = 2654435761u * (unint64_t)fmod(v104, 1.84467441e19);
    if (v105 >= 0.0)
    {
      if (v105 > 0.0)
        v101 += (unint64_t)v105;
    }
    else
    {
      v101 -= (unint64_t)fabs(v105);
    }
  }
  else
  {
    v101 = 0;
  }
  v106 = v14;
  if ((*(_BYTE *)&v95 & 8) != 0)
  {
    leftContactDiameter = self->_leftContactDiameter;
    v109 = -leftContactDiameter;
    if (leftContactDiameter >= 0.0)
      v109 = self->_leftContactDiameter;
    v110 = floor(v109 + 0.5);
    v111 = (v109 - v110) * 1.84467441e19;
    v107 = 2654435761u * (unint64_t)fmod(v110, 1.84467441e19);
    if (v111 >= 0.0)
    {
      if (v111 > 0.0)
        v107 += (unint64_t)v111;
    }
    else
    {
      v107 -= (unint64_t)fabs(v111);
    }
  }
  else
  {
    v107 = 0;
  }
  if ((*(_WORD *)&v95 & 0x8000) != 0)
  {
    rightContactDiameter = self->_rightContactDiameter;
    v114 = -rightContactDiameter;
    if (rightContactDiameter >= 0.0)
      v114 = self->_rightContactDiameter;
    v115 = floor(v114 + 0.5);
    v116 = (v114 - v115) * 1.84467441e19;
    v112 = 2654435761u * (unint64_t)fmod(v115, 1.84467441e19);
    if (v116 >= 0.0)
    {
      if (v116 > 0.0)
        v112 += (unint64_t)v116;
    }
    else
    {
      v112 -= (unint64_t)fabs(v116);
    }
  }
  else
  {
    v112 = 0;
  }
  v117 = v135 ^ v136 ^ v134 ^ v89 ^ v106 ^ v19 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v90 ^ v120 ^ v96;
  v118 = v101 ^ v107 ^ v112 ^ -[NSString hash](self->_brand, "hash", v120);
  return v117 ^ v118 ^ -[HDCodableVerifiableData hash](self->_verifiableData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSample *sample;
  uint64_t v6;
  int v7;
  int v8;
  HDCodableVerifiableData *verifiableData;
  uint64_t v10;
  id v11;

  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 26);
  v11 = v4;
  if (sample)
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableVisionSample setSample:](self, "setSample:");
  }
  v4 = v11;
LABEL_7:
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x800) != 0)
  {
    self->_prescriptionType = *((_QWORD *)v4 + 12);
    *(_DWORD *)&self->_has |= 0x800u;
    v7 = *((_DWORD *)v4 + 56);
    if ((v7 & 0x200) == 0)
    {
LABEL_9:
      if ((v7 & 0x200000) == 0)
        goto LABEL_10;
      goto LABEL_41;
    }
  }
  else if ((v7 & 0x200) == 0)
  {
    goto LABEL_9;
  }
  self->_leftSphere = *((double *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x200000) == 0)
  {
LABEL_10:
    if ((v7 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  self->_rightSphere = *((double *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x200000u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x10) == 0)
  {
LABEL_11:
    if ((v7 & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  self->_leftCylinder = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x10000) == 0)
  {
LABEL_12:
    if ((v7 & 2) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  self->_rightCylinder = *((double *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 2) == 0)
  {
LABEL_13:
    if ((v7 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_45;
  }
LABEL_44:
  self->_leftAxis = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x2000) == 0)
  {
LABEL_14:
    if ((v7 & 1) == 0)
      goto LABEL_15;
    goto LABEL_46;
  }
LABEL_45:
  self->_rightAxis = *((double *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 1) == 0)
  {
LABEL_15:
    if ((v7 & 0x1000) == 0)
      goto LABEL_16;
    goto LABEL_47;
  }
LABEL_46:
  self->_leftAddPower = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x1000) == 0)
  {
LABEL_16:
    if ((v7 & 0x400) == 0)
      goto LABEL_17;
    goto LABEL_48;
  }
LABEL_47:
  self->_rightAddPower = *((double *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x400) == 0)
  {
LABEL_17:
    if ((v7 & 0x400000) == 0)
      goto LABEL_18;
    goto LABEL_49;
  }
LABEL_48:
  self->_leftVertexDistance = *((double *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x400000) == 0)
  {
LABEL_18:
    if ((v7 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_50;
  }
LABEL_49:
  self->_rightVertexDistance = *((double *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x400000u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x80) == 0)
  {
LABEL_19:
    if ((v7 & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_51;
  }
LABEL_50:
  self->_leftPrismAmount = *((double *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x80000) == 0)
  {
LABEL_20:
    if ((v7 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_52;
  }
LABEL_51:
  self->_rightPrismAmount = *((double *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x100) == 0)
  {
LABEL_21:
    if ((v7 & 0x100000) == 0)
      goto LABEL_22;
    goto LABEL_53;
  }
LABEL_52:
  self->_leftPrismAngle = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x100000) == 0)
  {
LABEL_22:
    if ((v7 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  self->_rightPrismAngle = *((double *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x20) == 0)
  {
LABEL_23:
    if ((v7 & 0x20000) == 0)
      goto LABEL_24;
    goto LABEL_55;
  }
LABEL_54:
  self->_leftFarPupillaryDistance = *((double *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x20000) == 0)
  {
LABEL_24:
    if ((v7 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_56;
  }
LABEL_55:
  self->_rightFarPupillaryDistance = *((double *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x40) == 0)
  {
LABEL_25:
    if ((v7 & 0x40000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_56:
  self->_leftNearPupillaryDistance = *((double *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)v4 + 56) & 0x40000) != 0)
  {
LABEL_26:
    self->_rightNearPupillaryDistance = *((double *)v4 + 19);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_27:
  if (*((_QWORD *)v4 + 25))
  {
    -[HDCodableVisionSample setGlassesDescription:](self, "setGlassesDescription:");
    v4 = v11;
  }
  v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 4) != 0)
  {
    self->_leftBaseCurve = *((double *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
    v8 = *((_DWORD *)v4 + 56);
    if ((v8 & 0x4000) == 0)
    {
LABEL_31:
      if ((v8 & 8) == 0)
        goto LABEL_32;
      goto LABEL_60;
    }
  }
  else if ((v8 & 0x4000) == 0)
  {
    goto LABEL_31;
  }
  self->_rightBaseCurve = *((double *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 8) == 0)
  {
LABEL_32:
    if ((v8 & 0x8000) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_60:
  self->_leftContactDiameter = *((double *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)v4 + 56) & 0x8000) != 0)
  {
LABEL_33:
    self->_rightContactDiameter = *((double *)v4 + 16);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_34:
  if (*((_QWORD *)v4 + 24))
  {
    -[HDCodableVisionSample setBrand:](self, "setBrand:");
    v4 = v11;
  }
  verifiableData = self->_verifiableData;
  v10 = *((_QWORD *)v4 + 27);
  if (verifiableData)
  {
    if (v10)
    {
      -[HDCodableVerifiableData mergeFrom:](verifiableData, "mergeFrom:");
LABEL_64:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[HDCodableVisionSample setVerifiableData:](self, "setVerifiableData:");
    goto LABEL_64;
  }

}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (int64_t)prescriptionType
{
  return self->_prescriptionType;
}

- (double)leftSphere
{
  return self->_leftSphere;
}

- (double)rightSphere
{
  return self->_rightSphere;
}

- (double)leftCylinder
{
  return self->_leftCylinder;
}

- (double)rightCylinder
{
  return self->_rightCylinder;
}

- (double)leftAxis
{
  return self->_leftAxis;
}

- (double)rightAxis
{
  return self->_rightAxis;
}

- (double)leftAddPower
{
  return self->_leftAddPower;
}

- (double)rightAddPower
{
  return self->_rightAddPower;
}

- (double)leftVertexDistance
{
  return self->_leftVertexDistance;
}

- (double)rightVertexDistance
{
  return self->_rightVertexDistance;
}

- (double)leftPrismAmount
{
  return self->_leftPrismAmount;
}

- (double)rightPrismAmount
{
  return self->_rightPrismAmount;
}

- (double)leftPrismAngle
{
  return self->_leftPrismAngle;
}

- (double)rightPrismAngle
{
  return self->_rightPrismAngle;
}

- (double)leftFarPupillaryDistance
{
  return self->_leftFarPupillaryDistance;
}

- (double)rightFarPupillaryDistance
{
  return self->_rightFarPupillaryDistance;
}

- (double)leftNearPupillaryDistance
{
  return self->_leftNearPupillaryDistance;
}

- (double)rightNearPupillaryDistance
{
  return self->_rightNearPupillaryDistance;
}

- (NSString)glassesDescription
{
  return self->_glassesDescription;
}

- (void)setGlassesDescription:(id)a3
{
  objc_storeStrong((id *)&self->_glassesDescription, a3);
}

- (double)leftBaseCurve
{
  return self->_leftBaseCurve;
}

- (double)rightBaseCurve
{
  return self->_rightBaseCurve;
}

- (double)leftContactDiameter
{
  return self->_leftContactDiameter;
}

- (double)rightContactDiameter
{
  return self->_rightContactDiameter;
}

- (NSString)brand
{
  return self->_brand;
}

- (void)setBrand:(id)a3
{
  objc_storeStrong((id *)&self->_brand, a3);
}

- (HDCodableVerifiableData)verifiableData
{
  return self->_verifiableData;
}

- (void)setVerifiableData:(id)a3
{
  objc_storeStrong((id *)&self->_verifiableData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiableData, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_glassesDescription, 0);
  objc_storeStrong((id *)&self->_brand, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HDCodableVisionSample sample](self, "sample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "applyToObject:", v4);

    if (v6)
    {
      v7 = -[HDCodableVisionSample prescriptionType](self, "prescriptionType");
      objc_msgSend(v4, "_setPrescriptionType:", v7);
      if (-[HDCodableVisionSample hasLeftSphere](self, "hasLeftSphere"))
      {
        v8 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableVisionSample leftSphere](self, "leftSphere");
        objc_msgSend(v8, "quantityWithUnit:doubleValue:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }
      if (-[HDCodableVisionSample hasRightSphere](self, "hasRightSphere"))
      {
        v12 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableVisionSample rightSphere](self, "rightSphere");
        objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13);
        v14 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
      if (-[HDCodableVisionSample hasLeftCylinder](self, "hasLeftCylinder"))
      {
        v15 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableVisionSample leftCylinder](self, "leftCylinder");
        objc_msgSend(v15, "quantityWithUnit:doubleValue:", v16);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v90 = 0;
      }
      if (-[HDCodableVisionSample hasRightCylinder](self, "hasRightCylinder"))
      {
        v17 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableVisionSample rightCylinder](self, "rightCylinder");
        objc_msgSend(v17, "quantityWithUnit:doubleValue:", v18);
        v89 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v89 = 0;
      }
      if (-[HDCodableVisionSample hasLeftAxis](self, "hasLeftAxis"))
      {
        v19 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableVisionSample leftAxis](self, "leftAxis");
        objc_msgSend(v19, "quantityWithUnit:doubleValue:", v20);
        v88 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v88 = 0;
      }
      if (-[HDCodableVisionSample hasRightAxis](self, "hasRightAxis"))
      {
        v21 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableVisionSample rightAxis](self, "rightAxis");
        objc_msgSend(v21, "quantityWithUnit:doubleValue:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v23 = 0;
      }
      if (-[HDCodableVisionSample hasLeftAddPower](self, "hasLeftAddPower"))
      {
        v24 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableVisionSample leftAddPower](self, "leftAddPower");
        objc_msgSend(v24, "quantityWithUnit:doubleValue:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = 0;
      }
      if (-[HDCodableVisionSample hasRightAddPower](self, "hasRightAddPower"))
      {
        v27 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(MEMORY[0x1E0CB6CD0], "diopterUnit");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableVisionSample rightAddPower](self, "rightAddPower");
        objc_msgSend(v27, "quantityWithUnit:doubleValue:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v29 = 0;
      }
      if (!(v10 | v14))
        goto LABEL_88;
      if (v7 == 2)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = v4;
          if (-[HDCodableVisionSample hasLeftBaseCurve](self, "hasLeftBaseCurve"))
          {
            v34 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample leftBaseCurve](self, "leftBaseCurve");
            objc_msgSend(v34, "quantityWithUnit:doubleValue:", v35);
            v83 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v83 = 0;
          }
          if (-[HDCodableVisionSample hasRightBaseCurve](self, "hasRightBaseCurve"))
          {
            v38 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample rightBaseCurve](self, "rightBaseCurve");
            objc_msgSend(v38, "quantityWithUnit:doubleValue:", v39);
            v87 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v87 = 0;
          }
          if (-[HDCodableVisionSample hasLeftContactDiameter](self, "hasLeftContactDiameter"))
          {
            v42 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample leftContactDiameter](self, "leftContactDiameter");
            objc_msgSend(v42, "quantityWithUnit:doubleValue:", v43);
            v86 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v86 = 0;
          }
          if (-[HDCodableVisionSample hasRightContactDiameter](self, "hasRightContactDiameter"))
          {
            v46 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample rightContactDiameter](self, "rightContactDiameter");
            objc_msgSend(v46, "quantityWithUnit:doubleValue:", v47);
            v85 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v85 = 0;
          }
          if (v10)
          {
            v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64F8]), "initWithSphere:cylinder:axis:addPower:baseCurve:diameter:", v10, v90, v88, v26, v83, v86);
            objc_msgSend(v33, "_setLeftEyeSpecification:", v50);

          }
          if (v14)
          {
            v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64F8]), "initWithSphere:cylinder:axis:addPower:baseCurve:diameter:", v14, v89, v23, v29, v87, v85);
            objc_msgSend(v33, "_setRightEyeSpecification:", v51);

          }
          -[HDCodableVisionSample brand](self, "brand");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "_setBrand:", v52);
          v32 = (void *)v83;
          goto LABEL_87;
        }
      }
      else
      {
        if (v7 != 1)
        {
LABEL_88:
          v11 = 1;
          goto LABEL_89;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v82 = v4;
          if (-[HDCodableVisionSample hasLeftVertexDistance](self, "hasLeftVertexDistance"))
          {
            v30 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample leftVertexDistance](self, "leftVertexDistance");
            objc_msgSend(v30, "quantityWithUnit:doubleValue:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v32 = 0;
          }
          if (-[HDCodableVisionSample hasRightVertexDistance](self, "hasRightVertexDistance"))
          {
            v36 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample rightVertexDistance](self, "rightVertexDistance");
            objc_msgSend(v36, "quantityWithUnit:doubleValue:", v37);
            v87 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v87 = 0;
          }
          if (-[HDCodableVisionSample hasLeftFarPupillaryDistance](self, "hasLeftFarPupillaryDistance"))
          {
            v40 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample leftFarPupillaryDistance](self, "leftFarPupillaryDistance");
            objc_msgSend(v40, "quantityWithUnit:doubleValue:", v41);
            v86 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v86 = 0;
          }
          if (-[HDCodableVisionSample hasRightFarPupillaryDistance](self, "hasRightFarPupillaryDistance"))
          {
            v44 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample rightFarPupillaryDistance](self, "rightFarPupillaryDistance");
            objc_msgSend(v44, "quantityWithUnit:doubleValue:", v45);
            v85 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v85 = 0;
          }
          if (-[HDCodableVisionSample hasLeftNearPupillaryDistance](self, "hasLeftNearPupillaryDistance"))
          {
            v48 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample leftNearPupillaryDistance](self, "leftNearPupillaryDistance");
            objc_msgSend(v48, "quantityWithUnit:doubleValue:", v49);
            v81 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v81 = 0;
          }
          if (-[HDCodableVisionSample hasRightNearPupillaryDistance](self, "hasRightNearPupillaryDistance"))
          {
            v53 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample rightNearPupillaryDistance](self, "rightNearPupillaryDistance");
            objc_msgSend(v53, "quantityWithUnit:doubleValue:", v54);
            v80 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v80 = 0;
          }
          v84 = v32;
          if (-[HDCodableVisionSample hasLeftPrismAmount](self, "hasLeftPrismAmount")
            && -[HDCodableVisionSample hasLeftPrismAngle](self, "hasLeftPrismAngle"))
          {
            v78 = objc_alloc(MEMORY[0x1E0CB6DC0]);
            v55 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "prismDiopterUnit");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample leftPrismAmount](self, "leftPrismAmount");
            objc_msgSend(v55, "quantityWithUnit:doubleValue:", v75);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample leftPrismAngle](self, "leftPrismAngle");
            objc_msgSend(v57, "quantityWithUnit:doubleValue:", v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = (void *)objc_msgSend(v78, "initWithAmount:angle:eye:", v56, v59, 1);

            v32 = v84;
          }
          else
          {
            v79 = 0;
          }
          if (-[HDCodableVisionSample hasRightPrismAmount](self, "hasRightPrismAmount")
            && -[HDCodableVisionSample hasRightPrismAngle](self, "hasRightPrismAngle"))
          {
            v76 = objc_alloc(MEMORY[0x1E0CB6DC0]);
            v60 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "prismDiopterUnit");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample rightPrismAmount](self, "rightPrismAmount");
            objc_msgSend(v60, "quantityWithUnit:doubleValue:", v74);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = (void *)MEMORY[0x1E0CB6A28];
            objc_msgSend(MEMORY[0x1E0CB6CD0], "radianAngleUnit");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableVisionSample rightPrismAngle](self, "rightPrismAngle");
            objc_msgSend(v62, "quantityWithUnit:doubleValue:", v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = (void *)objc_msgSend(v76, "initWithAmount:angle:eye:", v61, v64, 2);

            v32 = v84;
          }
          else
          {
            v77 = 0;
          }
          if (v10)
          {
            v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6748]), "initWithSphere:cylinder:axis:addPower:vertexDistance:prism:farPupillaryDistance:nearPupillaryDistance:", v10, v90, v88, v26, v32, v79, v86, v81);
            objc_msgSend(v82, "_setLeftEyeSpecification:", v65);

          }
          if (v14)
          {
            v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6748]), "initWithSphere:cylinder:axis:addPower:vertexDistance:prism:farPupillaryDistance:nearPupillaryDistance:", v14, v89, v23, v29, v87, v77, v85, v80);
            objc_msgSend(v82, "_setRightEyeSpecification:", v66);

          }
          if (-[HDCodableVisionSample hasGlassesDescription](self, "hasGlassesDescription"))
          {
            objc_msgSend(v82, "metadata");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = (void *)objc_msgSend(v67, "mutableCopy");
            v69 = v68;
            if (v68)
              v70 = v68;
            else
              v70 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v71 = v70;

            -[HDCodableVisionSample glassesDescription](self, "glassesDescription");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setObject:forKeyedSubscript:", v72, *MEMORY[0x1E0CB5510]);

            objc_msgSend(v82, "_setMetadata:", v71);
            v32 = v84;
          }

          v52 = (void *)v81;
LABEL_87:

          goto LABEL_88;
        }
      }
      v11 = 0;
LABEL_89:

      goto LABEL_90;
    }
  }
  v11 = 0;
LABEL_90:

  return v11;
}

@end
