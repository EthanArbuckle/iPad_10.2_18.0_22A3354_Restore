@implementation HDCodableMedicationDoseEvent

- (BOOL)applyToObject:(id)a3
{
  BOOL v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v3 = -[HDCodableMedicationDoseEvent applyToObject:error:](self, "applyToObject:error:", a3, &v7);
  v4 = v7;
  if (!v3)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Failed to decode object of type HKMedicationDoseEvent with error %@", buf, 0xCu);
    }
  }

  return v3;
}

- (BOOL)applyToObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hk_assignError:code:format:", a4, 3, CFSTR("Unexpected class %@"), v23);

LABEL_16:
    v14 = 0;
    goto LABEL_21;
  }
  -[HDCodableMedicationDoseEvent sample](self, "sample");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "applyToObject:", v6);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Failed to decode superclass message"));
    goto LABEL_16;
  }
  objc_msgSend(v6, "_setLogOrigin:", -[HDCodableMedicationDoseEvent logOrigin](self, "logOrigin"));
  if (-[HDCodableMedicationDoseEvent hasScheduleItemIdentifier](self, "hasScheduleItemIdentifier"))
  {
    -[HDCodableMedicationDoseEvent scheduleItemIdentifier](self, "scheduleItemIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setScheduleItemIdentifier:", v9);

  }
  v10 = (void *)MEMORY[0x1E0CB3A28];
  -[HDCodableMedicationDoseEvent medicationUuid](self, "medicationUuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_UUIDWithData:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "_setMedicationUUID:", v12);
    -[HDCodableMedicationDoseEvent medicationIdentifier](self, "medicationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;
    if (v13)
    {
      objc_msgSend(v6, "_setMedicationIdentifier:", v13);
      if (-[HDCodableMedicationDoseEvent hasScheduledDoseQuantity](self, "hasScheduledDoseQuantity"))
      {
        v15 = (void *)MEMORY[0x1E0CB37E8];
        -[HDCodableMedicationDoseEvent scheduledDoseQuantity](self, "scheduledDoseQuantity");
        objc_msgSend(v15, "numberWithDouble:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_setScheduledDoseQuantity:", v16);

      }
      if (-[HDCodableMedicationDoseEvent hasDoseQuantity](self, "hasDoseQuantity"))
      {
        v17 = (void *)MEMORY[0x1E0CB37E8];
        -[HDCodableMedicationDoseEvent doseQuantity](self, "doseQuantity");
        objc_msgSend(v17, "numberWithDouble:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_setDoseQuantity:", v18);

      }
      if (-[HDCodableMedicationDoseEvent hasScheduledDate](self, "hasScheduledDate"))
      {
        v19 = (void *)MEMORY[0x1E0C99D68];
        -[HDCodableMedicationDoseEvent scheduledDate](self, "scheduledDate");
        objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_setScheduledDate:", v20);

      }
      objc_msgSend(v6, "_setStatus:", -[HDCodableMedicationDoseEvent status](self, "status"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Received nil for non-nil field 'medicationIdentifier'"));
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Received nil for non-nil field 'medicationUUID'"));
    v14 = 0;
  }

LABEL_21:
  return v14;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setLogOrigin:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_logOrigin = a3;
}

- (void)setHasLogOrigin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLogOrigin
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasScheduleItemIdentifier
{
  return self->_scheduleItemIdentifier != 0;
}

- (BOOL)hasMedicationIdentifier
{
  return self->_medicationIdentifier != 0;
}

- (void)setScheduledDoseQuantity:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_scheduledDoseQuantity = a3;
}

- (void)setHasScheduledDoseQuantity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasScheduledDoseQuantity
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDoseQuantity:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_doseQuantity = a3;
}

- (void)setHasDoseQuantity:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoseQuantity
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setScheduledDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_scheduledDate = a3;
}

- (void)setHasScheduledDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScheduledDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setStatus:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasMedicationUuid
{
  return self->_medicationUuid != 0;
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
  v8.super_class = (Class)HDCodableMedicationDoseEvent;
  -[HDCodableMedicationDoseEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationDoseEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSString *scheduleItemIdentifier;
  NSString *medicationIdentifier;
  char has;
  void *v10;
  NSData *medicationUuid;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_logOrigin);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("logOrigin"));

  }
  scheduleItemIdentifier = self->_scheduleItemIdentifier;
  if (scheduleItemIdentifier)
    objc_msgSend(v3, "setObject:forKey:", scheduleItemIdentifier, CFSTR("scheduleItemIdentifier"));
  medicationIdentifier = self->_medicationIdentifier;
  if (medicationIdentifier)
    objc_msgSend(v3, "setObject:forKey:", medicationIdentifier, CFSTR("medicationIdentifier"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_scheduledDoseQuantity);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("scheduledDoseQuantity"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doseQuantity);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("doseQuantity"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_scheduledDate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("scheduledDate"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_status);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("status"));

  }
LABEL_14:
  medicationUuid = self->_medicationUuid;
  if (medicationUuid)
    objc_msgSend(v3, "setObject:forKey:", medicationUuid, CFSTR("medicationUuid"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationDoseEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_scheduleItemIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_medicationIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_14:
  if (self->_medicationUuid)
  {
    PBDataWriterWriteDataField();
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_logOrigin;
    *((_BYTE *)v4 + 80) |= 2u;
  }
  if (self->_scheduleItemIdentifier)
  {
    objc_msgSend(v6, "setScheduleItemIdentifier:");
    v4 = v6;
  }
  if (self->_medicationIdentifier)
  {
    objc_msgSend(v6, "setMedicationIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_scheduledDoseQuantity;
    *((_BYTE *)v4 + 80) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_doseQuantity;
  *((_BYTE *)v4 + 80) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_19:
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_scheduledDate;
  *((_BYTE *)v4 + 80) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    *((_QWORD *)v4 + 5) = self->_status;
    *((_BYTE *)v4 + 80) |= 0x10u;
  }
LABEL_14:
  if (self->_medicationUuid)
  {
    objc_msgSend(v6, "setMedicationUuid:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char has;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_logOrigin;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_scheduleItemIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v8;

  v10 = -[NSString copyWithZone:](self->_medicationIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_scheduledDoseQuantity;
    *(_BYTE *)(v5 + 80) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
LABEL_11:
      *(double *)(v5 + 24) = self->_scheduledDate;
      *(_BYTE *)(v5 + 80) |= 4u;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 8) = self->_doseQuantity;
  *(_BYTE *)(v5 + 80) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    *(_QWORD *)(v5 + 40) = self->_status;
    *(_BYTE *)(v5 + 80) |= 0x10u;
  }
LABEL_8:
  v13 = -[NSData copyWithZone:](self->_medicationUuid, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  NSString *scheduleItemIdentifier;
  NSString *medicationIdentifier;
  NSData *medicationUuid;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 8))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_logOrigin != *((_QWORD *)v4 + 2))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
LABEL_35:
    v9 = 0;
    goto LABEL_36;
  }
  scheduleItemIdentifier = self->_scheduleItemIdentifier;
  if ((unint64_t)scheduleItemIdentifier | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](scheduleItemIdentifier, "isEqual:"))
  {
    goto LABEL_35;
  }
  medicationIdentifier = self->_medicationIdentifier;
  if ((unint64_t)medicationIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](medicationIdentifier, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 8) == 0 || self->_scheduledDoseQuantity != *((double *)v4 + 4))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 80) & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_doseQuantity != *((double *)v4 + 1))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_scheduledDate != *((double *)v4 + 3))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x10) == 0 || self->_status != *((_QWORD *)v4 + 5))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  medicationUuid = self->_medicationUuid;
  if ((unint64_t)medicationUuid | *((_QWORD *)v4 + 7))
    v9 = -[NSData isEqual:](medicationUuid, "isEqual:");
  else
    v9 = 1;
LABEL_36:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  char has;
  unint64_t v8;
  double scheduledDoseQuantity;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  double doseQuantity;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  double scheduledDate;
  double v20;
  long double v21;
  double v22;
  uint64_t v23;

  v3 = -[HDCodableSample hash](self->_sample, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_logOrigin;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_scheduleItemIdentifier, "hash");
  v6 = -[NSString hash](self->_medicationIdentifier, "hash");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    scheduledDoseQuantity = self->_scheduledDoseQuantity;
    v10 = -scheduledDoseQuantity;
    if (scheduledDoseQuantity >= 0.0)
      v10 = self->_scheduledDoseQuantity;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  if ((has & 1) != 0)
  {
    doseQuantity = self->_doseQuantity;
    v15 = -doseQuantity;
    if (doseQuantity >= 0.0)
      v15 = self->_doseQuantity;
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
  if ((has & 4) != 0)
  {
    scheduledDate = self->_scheduledDate;
    v20 = -scheduledDate;
    if (scheduledDate >= 0.0)
      v20 = self->_scheduledDate;
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
  if ((has & 0x10) != 0)
    v23 = 2654435761 * self->_status;
  else
    v23 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v18 ^ v23 ^ -[NSData hash](self->_medicationUuid, "hash");
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
  v6 = *((_QWORD *)v4 + 8);
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
    -[HDCodableMedicationDoseEvent setSample:](self, "setSample:");
  }
  v4 = v8;
LABEL_7:
  if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    self->_logOrigin = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[HDCodableMedicationDoseEvent setScheduleItemIdentifier:](self, "setScheduleItemIdentifier:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCodableMedicationDoseEvent setMedicationIdentifier:](self, "setMedicationIdentifier:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 80);
  if ((v7 & 8) != 0)
  {
    self->_scheduledDoseQuantity = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v7 = *((_BYTE *)v4 + 80);
    if ((v7 & 1) == 0)
    {
LABEL_15:
      if ((v7 & 4) == 0)
        goto LABEL_16;
      goto LABEL_23;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 1) == 0)
  {
    goto LABEL_15;
  }
  self->_doseQuantity = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v7 = *((_BYTE *)v4 + 80);
  if ((v7 & 4) == 0)
  {
LABEL_16:
    if ((v7 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_23:
  self->_scheduledDate = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 80) & 0x10) != 0)
  {
LABEL_17:
    self->_status = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_18:
  if (*((_QWORD *)v4 + 7))
  {
    -[HDCodableMedicationDoseEvent setMedicationUuid:](self, "setMedicationUuid:");
    v4 = v8;
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

- (int64_t)logOrigin
{
  return self->_logOrigin;
}

- (NSString)scheduleItemIdentifier
{
  return self->_scheduleItemIdentifier;
}

- (void)setScheduleItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleItemIdentifier, a3);
}

- (NSString)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (void)setMedicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_medicationIdentifier, a3);
}

- (double)scheduledDoseQuantity
{
  return self->_scheduledDoseQuantity;
}

- (double)doseQuantity
{
  return self->_doseQuantity;
}

- (double)scheduledDate
{
  return self->_scheduledDate;
}

- (int64_t)status
{
  return self->_status;
}

- (NSData)medicationUuid
{
  return self->_medicationUuid;
}

- (void)setMedicationUuid:(id)a3
{
  objc_storeStrong((id *)&self->_medicationUuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleItemIdentifier, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_medicationUuid, 0);
  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
}

@end
