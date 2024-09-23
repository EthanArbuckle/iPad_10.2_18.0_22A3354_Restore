@implementation HDCodableMedicationScheduleData

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCompatibilityVersionRange
{
  return self->_compatibilityVersionRange != 0;
}

- (BOOL)hasScheduleData
{
  return self->_scheduleData != 0;
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
  v8.super_class = (Class)HDCodableMedicationScheduleData;
  -[HDCodableMedicationScheduleData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationScheduleData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *uuid;
  void *v6;
  HDCodableMedicationScheduleCompatibilityVersionRange *compatibilityVersionRange;
  void *v8;
  NSData *scheduleData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("creationDate"));

  }
  compatibilityVersionRange = self->_compatibilityVersionRange;
  if (compatibilityVersionRange)
  {
    -[HDCodableMedicationScheduleCompatibilityVersionRange dictionaryRepresentation](compatibilityVersionRange, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("compatibilityVersionRange"));

  }
  scheduleData = self->_scheduleData;
  if (scheduleData)
    objc_msgSend(v4, "setObject:forKey:", scheduleData, CFSTR("scheduleData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationScheduleDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_compatibilityVersionRange)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_scheduleData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_creationDate;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_compatibilityVersionRange)
  {
    objc_msgSend(v5, "setCompatibilityVersionRange:");
    v4 = v5;
  }
  if (self->_scheduleData)
  {
    objc_msgSend(v5, "setScheduleData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[HDCodableMedicationScheduleCompatibilityVersionRange copyWithZone:](self->_compatibilityVersionRange, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSData copyWithZone:](self->_scheduleData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *uuid;
  HDCodableMedicationScheduleCompatibilityVersionRange *compatibilityVersionRange;
  NSData *scheduleData;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_creationDate != *((double *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  compatibilityVersionRange = self->_compatibilityVersionRange;
  if ((unint64_t)compatibilityVersionRange | *((_QWORD *)v4 + 2)
    && !-[HDCodableMedicationScheduleCompatibilityVersionRange isEqual:](compatibilityVersionRange, "isEqual:"))
  {
    goto LABEL_13;
  }
  scheduleData = self->_scheduleData;
  if ((unint64_t)scheduleData | *((_QWORD *)v4 + 3))
    v8 = -[NSData isEqual:](scheduleData, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  double creationDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[NSData hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    creationDate = self->_creationDate;
    v6 = -creationDate;
    if (creationDate >= 0.0)
      v6 = self->_creationDate;
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
  v9 = v4 ^ v3;
  v10 = -[HDCodableMedicationScheduleCompatibilityVersionRange hash](self->_compatibilityVersionRange, "hash");
  return v9 ^ v10 ^ -[NSData hash](self->_scheduleData, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  HDCodableMedicationScheduleCompatibilityVersionRange *compatibilityVersionRange;
  uint64_t v6;
  double *v7;

  v4 = (double *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableMedicationScheduleData setUuid:](self, "setUuid:");
    v4 = v7;
  }
  if (((_BYTE)v4[5] & 1) != 0)
  {
    self->_creationDate = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  compatibilityVersionRange = self->_compatibilityVersionRange;
  v6 = *((_QWORD *)v4 + 2);
  if (compatibilityVersionRange)
  {
    if (!v6)
      goto LABEL_11;
    -[HDCodableMedicationScheduleCompatibilityVersionRange mergeFrom:](compatibilityVersionRange, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[HDCodableMedicationScheduleData setCompatibilityVersionRange:](self, "setCompatibilityVersionRange:");
  }
  v4 = v7;
LABEL_11:
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableMedicationScheduleData setScheduleData:](self, "setScheduleData:");
    v4 = v7;
  }

}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (HDCodableMedicationScheduleCompatibilityVersionRange)compatibilityVersionRange
{
  return self->_compatibilityVersionRange;
}

- (void)setCompatibilityVersionRange:(id)a3
{
  objc_storeStrong((id *)&self->_compatibilityVersionRange, a3);
}

- (NSData)scheduleData
{
  return self->_scheduleData;
}

- (void)setScheduleData:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_scheduleData, 0);
  objc_storeStrong((id *)&self->_compatibilityVersionRange, 0);
}

- (BOOL)isLocallyUnavailable
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[HDCodableMedicationScheduleData compatibilityVersionRange](self, "compatibilityVersionRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "minimum");
  -[HDCodableMedicationScheduleData compatibilityVersionRange](self, "compatibilityVersionRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v4 > objc_msgSend(v5, "origin");

  return v4;
}

- (BOOL)hasFutureCompatibilityVersion
{
  void *v2;
  BOOL v3;

  -[HDCodableMedicationScheduleData compatibilityVersionRange](self, "compatibilityVersionRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minimum") > 1;

  return v3;
}

@end
