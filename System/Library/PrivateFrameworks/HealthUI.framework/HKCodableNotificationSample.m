@implementation HKCodableNotificationSample

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasMetadataDictionary
{
  return self->_metadataDictionary != 0;
}

- (void)setCategoryValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_categoryValue = a3;
}

- (void)setHasCategoryValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCategoryValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDataType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dataType = a3;
}

- (void)setHasDataType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDataType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLatestSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_minimumSupportedVersion = a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasSampleUUID
{
  return self->_sampleUUID != 0;
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
  v8.super_class = (Class)HKCodableNotificationSample;
  -[HKCodableNotificationSample description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableNotificationSample dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  HKCodableMetadataDictionary *metadataDictionary;
  void *v8;
  char v9;
  void *v10;
  NSString *sampleUUID;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("startDate"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("endDate"));

  }
  metadataDictionary = self->_metadataDictionary;
  if (metadataDictionary)
  {
    -[HKCodableMetadataDictionary dictionaryRepresentation](metadataDictionary, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("metadataDictionary"));

  }
  v9 = (char)self->_has;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_categoryValue);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("categoryValue"));

    v9 = (char)self->_has;
    if ((v9 & 2) == 0)
    {
LABEL_9:
      if ((v9 & 8) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_dataType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("dataType"));

  v9 = (char)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_10:
    if ((v9 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_latestSupportedVersion);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("latestSupportedVersion"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minimumSupportedVersion);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("minimumSupportedVersion"));

  }
LABEL_12:
  sampleUUID = self->_sampleUUID;
  if (sampleUUID)
    objc_msgSend(v3, "setObject:forKey:", sampleUUID, CFSTR("sampleUUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableNotificationSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
  if (self->_metadataDictionary)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  v4 = v7;
  v6 = (char)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
LABEL_12:
  if (self->_sampleUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[6] = *(_QWORD *)&self->_startDate;
    *((_BYTE *)v4 + 72) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[3] = *(_QWORD *)&self->_endDate;
    *((_BYTE *)v4 + 72) |= 4u;
  }
  v7 = v4;
  if (self->_metadataDictionary)
  {
    objc_msgSend(v4, "setMetadataDictionary:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    v4[1] = self->_categoryValue;
    *((_BYTE *)v4 + 72) |= 1u;
    v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v4[2] = self->_dataType;
  *((_BYTE *)v4 + 72) |= 2u;
  v6 = (char)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  v4[4] = self->_latestSupportedVersion;
  *((_BYTE *)v4 + 72) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    v4[5] = self->_minimumSupportedVersion;
    *((_BYTE *)v4 + 72) |= 0x10u;
  }
LABEL_12:
  if (self->_sampleUUID)
  {
    objc_msgSend(v7, "setSampleUUID:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_startDate;
    *(_BYTE *)(v5 + 72) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_endDate;
    *(_BYTE *)(v5 + 72) |= 4u;
  }
  v8 = -[HKCodableMetadataDictionary copyWithZone:](self->_metadataDictionary, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v8;

  v10 = (char)self->_has;
  if ((v10 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_categoryValue;
    *(_BYTE *)(v6 + 72) |= 1u;
    v10 = (char)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_7:
      if ((v10 & 8) == 0)
        goto LABEL_8;
LABEL_13:
      *(_QWORD *)(v6 + 32) = self->_latestSupportedVersion;
      *(_BYTE *)(v6 + 72) |= 8u;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_QWORD *)(v6 + 16) = self->_dataType;
  *(_BYTE *)(v6 + 72) |= 2u;
  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
    goto LABEL_13;
LABEL_8:
  if ((v10 & 0x10) != 0)
  {
LABEL_9:
    *(_QWORD *)(v6 + 40) = self->_minimumSupportedVersion;
    *(_BYTE *)(v6 + 72) |= 0x10u;
  }
LABEL_10:
  v11 = -[NSString copyWithZone:](self->_sampleUUID, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  HKCodableMetadataDictionary *metadataDictionary;
  NSString *sampleUUID;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x20) == 0 || self->_startDate != *((double *)v4 + 6))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x20) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_endDate != *((double *)v4 + 3))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_37;
  }
  metadataDictionary = self->_metadataDictionary;
  if ((unint64_t)metadataDictionary | *((_QWORD *)v4 + 7))
  {
    if (!-[HKCodableMetadataDictionary isEqual:](metadataDictionary, "isEqual:"))
    {
LABEL_37:
      v8 = 0;
      goto LABEL_38;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_categoryValue != *((_QWORD *)v4 + 1))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_dataType != *((_QWORD *)v4 + 2))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_latestSupportedVersion != *((_QWORD *)v4 + 4))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x10) == 0 || self->_minimumSupportedVersion != *((_QWORD *)v4 + 5))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_37;
  }
  sampleUUID = self->_sampleUUID;
  if ((unint64_t)sampleUUID | *((_QWORD *)v4 + 8))
    v8 = -[NSString isEqual:](sampleUUID, "isEqual:");
  else
    v8 = 1;
LABEL_38:

  return v8;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double startDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double endDate;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    startDate = self->_startDate;
    v6 = -startDate;
    if (startDate >= 0.0)
      v6 = self->_startDate;
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
  if ((has & 4) != 0)
  {
    endDate = self->_endDate;
    v11 = -endDate;
    if (endDate >= 0.0)
      v11 = self->_endDate;
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
  v14 = -[HKCodableMetadataDictionary hash](self->_metadataDictionary, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v15 = 2654435761 * self->_categoryValue;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_19:
      v16 = 2654435761 * self->_dataType;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_20;
LABEL_24:
      v17 = 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_21;
LABEL_25:
      v18 = 0;
      return v9 ^ v4 ^ v15 ^ v16 ^ v17 ^ v18 ^ v14 ^ -[NSString hash](self->_sampleUUID, "hash");
    }
  }
  else
  {
    v15 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_19;
  }
  v16 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_24;
LABEL_20:
  v17 = 2654435761 * self->_latestSupportedVersion;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_25;
LABEL_21:
  v18 = 2654435761 * self->_minimumSupportedVersion;
  return v9 ^ v4 ^ v15 ^ v16 ^ v17 ^ v18 ^ v14 ^ -[NSString hash](self->_sampleUUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  char v6;
  HKCodableMetadataDictionary *metadataDictionary;
  uint64_t v8;
  char v9;
  double *v10;

  v4 = (double *)a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 0x20) != 0)
  {
    self->_startDate = v4[6];
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)v4 + 72);
  }
  if ((v6 & 4) != 0)
  {
    self->_endDate = v4[3];
    *(_BYTE *)&self->_has |= 4u;
  }
  metadataDictionary = self->_metadataDictionary;
  v8 = *((_QWORD *)v5 + 7);
  v10 = v5;
  if (metadataDictionary)
  {
    if (!v8)
      goto LABEL_11;
    -[HKCodableMetadataDictionary mergeFrom:](metadataDictionary, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    -[HKCodableNotificationSample setMetadataDictionary:](self, "setMetadataDictionary:");
  }
  v5 = v10;
LABEL_11:
  v9 = *((_BYTE *)v5 + 72);
  if ((v9 & 1) != 0)
  {
    self->_categoryValue = (int64_t)v5[1];
    *(_BYTE *)&self->_has |= 1u;
    v9 = *((_BYTE *)v5 + 72);
    if ((v9 & 2) == 0)
    {
LABEL_13:
      if ((v9 & 8) == 0)
        goto LABEL_14;
      goto LABEL_21;
    }
  }
  else if (((_BYTE)v5[9] & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_dataType = (int64_t)v5[2];
  *(_BYTE *)&self->_has |= 2u;
  v9 = *((_BYTE *)v5 + 72);
  if ((v9 & 8) == 0)
  {
LABEL_14:
    if ((v9 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_21:
  self->_latestSupportedVersion = (int64_t)v5[4];
  *(_BYTE *)&self->_has |= 8u;
  if (((_BYTE)v5[9] & 0x10) != 0)
  {
LABEL_15:
    self->_minimumSupportedVersion = (int64_t)v5[5];
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_16:
  if (*((_QWORD *)v5 + 8))
  {
    -[HKCodableNotificationSample setSampleUUID:](self, "setSampleUUID:");
    v5 = v10;
  }

}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HKCodableMetadataDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_metadataDictionary, a3);
}

- (int64_t)categoryValue
{
  return self->_categoryValue;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (NSString)sampleUUID
{
  return self->_sampleUUID;
}

- (void)setSampleUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sampleUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleUUID, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

@end
