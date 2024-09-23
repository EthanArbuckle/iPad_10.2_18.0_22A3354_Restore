@implementation HKCodableSummaryVisionPrescriptionValue

- (void)setTimestampData:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestampData = a3;
}

- (void)setHasTimestampData:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampData
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPrescriptionType
{
  return self->_prescriptionType != 0;
}

- (void)setHasImage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hasImage = a3;
}

- (void)setHasHasImage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasImage
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasLeftEyeSphere
{
  return self->_leftEyeSphere != 0;
}

- (BOOL)hasRightEyeSphere
{
  return self->_rightEyeSphere != 0;
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
  v8.super_class = (Class)HKCodableSummaryVisionPrescriptionValue;
  -[HKCodableSummaryVisionPrescriptionValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryVisionPrescriptionValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  HKCodablePrescriptionType *prescriptionType;
  void *v6;
  void *v7;
  HKCodableQuantity *leftEyeSphere;
  void *v9;
  HKCodableQuantity *rightEyeSphere;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestampData);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestampData"));

  }
  prescriptionType = self->_prescriptionType;
  if (prescriptionType)
  {
    -[HKCodablePrescriptionType dictionaryRepresentation](prescriptionType, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("prescriptionType"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasImage);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("hasImage"));

  }
  leftEyeSphere = self->_leftEyeSphere;
  if (leftEyeSphere)
  {
    -[HKCodableQuantity dictionaryRepresentation](leftEyeSphere, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("leftEyeSphere"));

  }
  rightEyeSphere = self->_rightEyeSphere;
  if (rightEyeSphere)
  {
    -[HKCodableQuantity dictionaryRepresentation](rightEyeSphere, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("rightEyeSphere"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryVisionPrescriptionValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_prescriptionType)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_leftEyeSphere)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_rightEyeSphere)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_timestampData;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  v5 = v4;
  if (self->_prescriptionType)
  {
    objc_msgSend(v4, "setPrescriptionType:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_hasImage;
    *((_BYTE *)v4 + 44) |= 2u;
  }
  if (self->_leftEyeSphere)
  {
    objc_msgSend(v5, "setLeftEyeSphere:");
    v4 = v5;
  }
  if (self->_rightEyeSphere)
  {
    objc_msgSend(v5, "setRightEyeSphere:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timestampData;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v7 = -[HKCodablePrescriptionType copyWithZone:](self->_prescriptionType, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 40) = self->_hasImage;
    *(_BYTE *)(v6 + 44) |= 2u;
  }
  v9 = -[HKCodableQuantity copyWithZone:](self->_leftEyeSphere, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v9;

  v11 = -[HKCodableQuantity copyWithZone:](self->_rightEyeSphere, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  HKCodablePrescriptionType *prescriptionType;
  HKCodableQuantity *leftEyeSphere;
  HKCodableQuantity *rightEyeSphere;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_timestampData != *((double *)v4 + 1))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_22;
  }
  prescriptionType = self->_prescriptionType;
  if ((unint64_t)prescriptionType | *((_QWORD *)v4 + 3))
  {
    if (!-[HKCodablePrescriptionType isEqual:](prescriptionType, "isEqual:"))
      goto LABEL_22;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_hasImage)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_22;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_18;
    }
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_22;
LABEL_18:
  leftEyeSphere = self->_leftEyeSphere;
  if ((unint64_t)leftEyeSphere | *((_QWORD *)v4 + 2)
    && !-[HKCodableQuantity isEqual:](leftEyeSphere, "isEqual:"))
  {
    goto LABEL_22;
  }
  rightEyeSphere = self->_rightEyeSphere;
  if ((unint64_t)rightEyeSphere | *((_QWORD *)v4 + 4))
    v9 = -[HKCodableQuantity isEqual:](rightEyeSphere, "isEqual:");
  else
    v9 = 1;
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  double timestampData;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timestampData = self->_timestampData;
    v5 = -timestampData;
    if (timestampData >= 0.0)
      v5 = self->_timestampData;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[HKCodablePrescriptionType hash](self->_prescriptionType, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761 * self->_hasImage;
  else
    v9 = 0;
  v10 = v8 ^ v3 ^ v9 ^ -[HKCodableQuantity hash](self->_leftEyeSphere, "hash");
  return v10 ^ -[HKCodableQuantity hash](self->_rightEyeSphere, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  HKCodablePrescriptionType *prescriptionType;
  uint64_t v7;
  HKCodableQuantity *leftEyeSphere;
  uint64_t v9;
  HKCodableQuantity *rightEyeSphere;
  uint64_t v11;
  double *v12;

  v4 = (double *)a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_timestampData = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  prescriptionType = self->_prescriptionType;
  v7 = *((_QWORD *)v5 + 3);
  v12 = v5;
  if (prescriptionType)
  {
    if (!v7)
      goto LABEL_9;
    -[HKCodablePrescriptionType mergeFrom:](prescriptionType, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[HKCodableSummaryVisionPrescriptionValue setPrescriptionType:](self, "setPrescriptionType:");
  }
  v5 = v12;
LABEL_9:
  if ((*((_BYTE *)v5 + 44) & 2) != 0)
  {
    self->_hasImage = *((_BYTE *)v5 + 40);
    *(_BYTE *)&self->_has |= 2u;
  }
  leftEyeSphere = self->_leftEyeSphere;
  v9 = *((_QWORD *)v5 + 2);
  if (leftEyeSphere)
  {
    if (!v9)
      goto LABEL_17;
    -[HKCodableQuantity mergeFrom:](leftEyeSphere, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    -[HKCodableSummaryVisionPrescriptionValue setLeftEyeSphere:](self, "setLeftEyeSphere:");
  }
  v5 = v12;
LABEL_17:
  rightEyeSphere = self->_rightEyeSphere;
  v11 = *((_QWORD *)v5 + 4);
  if (rightEyeSphere)
  {
    if (v11)
    {
      -[HKCodableQuantity mergeFrom:](rightEyeSphere, "mergeFrom:");
LABEL_22:
      v5 = v12;
    }
  }
  else if (v11)
  {
    -[HKCodableSummaryVisionPrescriptionValue setRightEyeSphere:](self, "setRightEyeSphere:");
    goto LABEL_22;
  }

}

- (double)timestampData
{
  return self->_timestampData;
}

- (HKCodablePrescriptionType)prescriptionType
{
  return self->_prescriptionType;
}

- (void)setPrescriptionType:(id)a3
{
  objc_storeStrong((id *)&self->_prescriptionType, a3);
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (HKCodableQuantity)leftEyeSphere
{
  return self->_leftEyeSphere;
}

- (void)setLeftEyeSphere:(id)a3
{
  objc_storeStrong((id *)&self->_leftEyeSphere, a3);
}

- (HKCodableQuantity)rightEyeSphere
{
  return self->_rightEyeSphere;
}

- (void)setRightEyeSphere:(id)a3
{
  objc_storeStrong((id *)&self->_rightEyeSphere, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEyeSphere, 0);
  objc_storeStrong((id *)&self->_prescriptionType, 0);
  objc_storeStrong((id *)&self->_leftEyeSphere, 0);
}

@end
