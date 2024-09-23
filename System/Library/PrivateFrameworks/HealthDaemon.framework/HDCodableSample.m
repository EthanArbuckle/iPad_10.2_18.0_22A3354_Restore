@implementation HDCodableSample

- (void)setObject:(id)a3
{
  objc_storeStrong((id *)&self->_object, a3);
}

- (void)setDataType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dataType = a3;
}

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_startDate = a3;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endDate = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_object)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  int64_t dataType;
  void *v10;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  -[HDCodableSample object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "applyToObject:", v4);

  if (!v6)
    goto LABEL_14;
  v7 = (*(_BYTE *)&self->_has & 4) != 0 ? self->_startDate : 2.22507386e-308;
  objc_msgSend(v4, "_setStartTimestamp:", v7);
  v8 = (*(_BYTE *)&self->_has & 2) != 0 ? self->_endDate : 2.22507386e-308;
  objc_msgSend(v4, "_setEndTimestamp:", v8);
  if ((*(_BYTE *)&self->_has & 1) != 0 && (dataType = self->_dataType, _HKValidDataTypeCode()))
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", dataType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v4, "_setSampleType:", v10);

  }
  else
  {
LABEL_14:
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (HDCodableHealthObject)object
{
  return self->_object;
}

- (BOOL)hasObject
{
  return self->_object != 0;
}

- (void)setHasDataType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasEndDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)HDCodableSample;
  -[HDCodableSample description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSample dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableHealthObject *object;
  void *v5;
  char has;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  object = self->_object;
  if (object)
  {
    -[HDCodableHealthObject dictionaryRepresentation](object, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("object"));

  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("startDate"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_dataType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("dataType"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("endDate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_object)
  {
    v6 = v4;
    objc_msgSend(v4, "setObject:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_startDate;
    *((_BYTE *)v4 + 40) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_QWORD *)v4 + 1) = self->_dataType;
  *((_BYTE *)v4 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_endDate;
    *((_BYTE *)v4 + 40) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableHealthObject copyWithZone:](self->_object, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(double *)(v5 + 24) = self->_startDate;
    *(_BYTE *)(v5 + 40) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 8) = self->_dataType;
  *(_BYTE *)(v5 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_endDate;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableHealthObject *object;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  object = self->_object;
  if ((unint64_t)object | *((_QWORD *)v4 + 4))
  {
    if (!-[HDCodableHealthObject isEqual:](object, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_dataType != *((_QWORD *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_startDate != *((double *)v4 + 3))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_endDate != *((double *)v4 + 2))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  uint64_t v5;
  double startDate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double endDate;
  double v13;
  long double v14;
  double v15;

  v3 = -[HDCodableHealthObject hash](self->_object, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = 2654435761 * self->_dataType;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_3:
  startDate = self->_startDate;
  v7 = -startDate;
  if (startDate >= 0.0)
    v7 = self->_startDate;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 2) != 0)
  {
    endDate = self->_endDate;
    v13 = -endDate;
    if (endDate >= 0.0)
      v13 = self->_endDate;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableHealthObject *object;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  object = self->_object;
  v6 = *((_QWORD *)v4 + 4);
  if (object)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HDCodableHealthObject mergeFrom:](object, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HDCodableSample setObject:](self, "setObject:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0)
      goto LABEL_9;
LABEL_13:
    self->_startDate = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 40) & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  self->_dataType = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 4) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v7 & 2) != 0)
  {
LABEL_10:
    self->_endDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_11:

}

- (int64_t)dataType
{
  return self->_dataType;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

@end
