@implementation HDCodablePauseRingsSchedule

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  BOOL v8;
  void *v9;
  objc_class *v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v4 = a3;
  if (self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HDCodablePauseRingsSchedule sample](self, "sample");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "applyToObject:", v4);

      if ((v6 & 1) != 0)
      {
        if (-[HDCodablePauseRingsSchedule hasStartDateIndex](self, "hasStartDateIndex"))
          objc_msgSend(v4, "setStartDateIndex:", -[HDCodablePauseRingsSchedule startDateIndex](self, "startDateIndex"));
        if (-[HDCodablePauseRingsSchedule hasEndDateIndex](self, "hasEndDateIndex"))
          objc_msgSend(v4, "setEndDateIndex:", -[HDCodablePauseRingsSchedule endDateIndex](self, "endDateIndex"));

        v7 = 0;
        v8 = 1;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v14, 3, CFSTR("Failed to decode superclass message"));
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hk_assignError:code:format:", &v14, 3, CFSTR("Unexpected class %@"), v11);

    }
  }

  v7 = v14;
  _HKInitializeLogging();
  v12 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Failed to decode object of type HKPauseRingsSchedule with error %@", buf, 0xCu);
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setStartDateIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startDateIndex = a3;
}

- (void)setHasStartDateIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartDateIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEndDateIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endDateIndex = a3;
}

- (void)setHasEndDateIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndDateIndex
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)HDCodablePauseRingsSchedule;
  -[HDCodablePauseRingsSchedule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodablePauseRingsSchedule dictionaryRepresentation](self, "dictionaryRepresentation");
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_startDateIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("startDateIndex"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_endDateIndex);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("endDateIndex"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodablePauseRingsScheduleReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_sample)
  {
    v6 = v4;
    objc_msgSend(v4, "setSample:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_startDateIndex;
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_endDateIndex;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_startDateIndex;
    *(_BYTE *)(v5 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_endDateIndex;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 3))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_startDateIndex != *((_QWORD *)v4 + 2))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_endDateIndex != *((_QWORD *)v4 + 1))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[HDCodableSample hash](self->_sample, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_startDateIndex;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_endDateIndex;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableSample *sample;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = a3;
  sample = self->_sample;
  v6 = v4[3];
  if (sample)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HDCodablePauseRingsSchedule setSample:](self, "setSample:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 32);
  if ((v7 & 2) != 0)
  {
    self->_startDateIndex = v4[2];
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 32);
  }
  if ((v7 & 1) != 0)
  {
    self->_endDateIndex = v4[1];
    *(_BYTE *)&self->_has |= 1u;
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

- (int64_t)startDateIndex
{
  return self->_startDateIndex;
}

- (int64_t)endDateIndex
{
  return self->_endDateIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
