@implementation HDCodableECGSample

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[HDCodableECGSample sample](self, "sample"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "applyToObject:", v4),
        v5,
        v6))
  {
    -[HDCodableECGSample voltagePayload](self, "voltagePayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setPayload:", v7);

    objc_msgSend(v4, "_setPrivateClassification:", -[HDCodableECGSample privateClassification](self, "privateClassification"));
    objc_msgSend(v4, "_setSymptomsStatus:", -[HDCodableECGSample symptomsStatus](self, "symptomsStatus"));
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      v8 = (void *)MEMORY[0x1E0CB6A28];
      -[HDCodableECGSample averageHeartRateInBPM](self, "averageHeartRateInBPM");
      objc_msgSend(v8, "_quantityWithBeatsPerMinute:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setAverageHeartRate:", v9);

    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setPrivateClassification:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_privateClassification = a3;
}

- (void)setHasPrivateClassification:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrivateClassification
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAverageHeartRateInBPM:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_averageHeartRateInBPM = a3;
}

- (void)setHasAverageHeartRateInBPM:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAverageHeartRateInBPM
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasVoltagePayload
{
  return self->_voltagePayload != 0;
}

- (void)setSymptomsStatus:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_symptomsStatus = a3;
}

- (void)setHasSymptomsStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSymptomsStatus
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)HDCodableECGSample;
  -[HDCodableECGSample description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableECGSample dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  void *v7;
  void *v8;
  NSData *voltagePayload;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_privateClassification);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("privateClassification"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_averageHeartRateInBPM);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("averageHeartRateInBPM"));

  }
  voltagePayload = self->_voltagePayload;
  if (voltagePayload)
    objc_msgSend(v3, "setObject:forKey:", voltagePayload, CFSTR("voltagePayload"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_symptomsStatus);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("symptomsStatus"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableECGSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_voltagePayload)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_privateClassification;
    *((_BYTE *)v4 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_averageHeartRateInBPM;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_voltagePayload)
  {
    objc_msgSend(v6, "setVoltagePayload:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_symptomsStatus;
    *((_BYTE *)v4 + 48) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_privateClassification;
    *(_BYTE *)(v5 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_averageHeartRateInBPM;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v9 = -[NSData copyWithZone:](self->_voltagePayload, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_symptomsStatus;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  char has;
  char v7;
  NSData *voltagePayload;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 4))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_21;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 48);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_privateClassification != *((_QWORD *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_averageHeartRateInBPM != *((double *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_21;
  }
  voltagePayload = self->_voltagePayload;
  if ((unint64_t)voltagePayload | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](voltagePayload, "isEqual:"))
    {
LABEL_21:
      v9 = 0;
      goto LABEL_22;
    }
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 48);
  }
  v9 = (v7 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_symptomsStatus != *((_QWORD *)v4 + 3))
      goto LABEL_21;
    v9 = 1;
  }
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  double averageHeartRateInBPM;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[HDCodableSample hash](self->_sample, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_privateClassification;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  averageHeartRateInBPM = self->_averageHeartRateInBPM;
  v6 = -averageHeartRateInBPM;
  if (averageHeartRateInBPM >= 0.0)
    v6 = self->_averageHeartRateInBPM;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  v10 = -[NSData hash](self->_voltagePayload, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761 * self->_symptomsStatus;
  else
    v11 = 0;
  return v4 ^ v3 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSample *sample;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 4);
  v8 = v4;
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
    -[HDCodableECGSample setSample:](self, "setSample:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 2) != 0)
  {
    self->_privateClassification = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 48);
  }
  if ((v7 & 1) != 0)
  {
    self->_averageHeartRateInBPM = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableECGSample setVoltagePayload:](self, "setVoltagePayload:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    self->_symptomsStatus = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
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

- (int64_t)privateClassification
{
  return self->_privateClassification;
}

- (double)averageHeartRateInBPM
{
  return self->_averageHeartRateInBPM;
}

- (NSData)voltagePayload
{
  return self->_voltagePayload;
}

- (void)setVoltagePayload:(id)a3
{
  objc_storeStrong((id *)&self->_voltagePayload, a3);
}

- (int64_t)symptomsStatus
{
  return self->_symptomsStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voltagePayload, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
