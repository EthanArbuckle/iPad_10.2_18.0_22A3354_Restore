@implementation HDCodableFitnessFriendAchievement

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (void)setFriendUUID:(id)a3
{
  objc_storeStrong((id *)&self->_friendUUID, a3);
}

- (void)setCompletedDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_completedDate = a3;
}

- (void)setIntValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_intValue = a3;
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
  if (self->_friendUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_9:
  if (self->_templateUniqueName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_friendUUID, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HDCodableFitnessFriendAchievement sample](self, "sample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "applyToObject:", v4);
    if (v6)
    {
      if (-[HDCodableFitnessFriendAchievement hasFriendUUID](self, "hasFriendUUID"))
      {
        v7 = (void *)MEMORY[0x1E0CB3A28];
        -[HDCodableFitnessFriendAchievement friendUUID](self, "friendUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hk_UUIDWithData:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "setFriendUUID:", v9);
      }
      -[HDCodableFitnessFriendAchievement templateUniqueName](self, "templateUniqueName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTemplateUniqueName:", v10);

      v11 = objc_alloc(MEMORY[0x1E0C99D68]);
      -[HDCodableFitnessFriendAchievement completedDate](self, "completedDate");
      v12 = (void *)objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
      objc_msgSend(v4, "setCompletedDate:", v12);

      if (-[HDCodableFitnessFriendAchievement hasIntValue](self, "hasIntValue"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCodableFitnessFriendAchievement intValue](self, "intValue"));
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v15 = (void *)v13;
        objc_msgSend(v4, "setValue:", v13);

        goto LABEL_11;
      }
      if (-[HDCodableFitnessFriendAchievement hasDoubleValue](self, "hasDoubleValue"))
      {
        v14 = (void *)MEMORY[0x1E0CB37E8];
        -[HDCodableFitnessFriendAchievement doubleValue](self, "doubleValue");
        objc_msgSend(v14, "numberWithDouble:");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
LABEL_11:

    goto LABEL_12;
  }
  LOBYTE(v6) = 0;
LABEL_12:

  return v6;
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (BOOL)hasFriendUUID
{
  return self->_friendUUID != 0;
}

- (NSData)friendUUID
{
  return self->_friendUUID;
}

- (double)completedDate
{
  return self->_completedDate;
}

- (BOOL)hasIntValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int64_t)intValue
{
  return self->_intValue;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setHasCompletedDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompletedDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDoubleValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIntValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTemplateUniqueName
{
  return self->_templateUniqueName != 0;
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
  v8.super_class = (Class)HDCodableFitnessFriendAchievement;
  -[HDCodableFitnessFriendAchievement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFitnessFriendAchievement dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *friendUUID;
  char has;
  void *v8;
  NSString *templateUniqueName;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  friendUUID = self->_friendUUID;
  if (friendUUID)
    objc_msgSend(v3, "setObject:forKey:", friendUUID, CFSTR("friendUUID"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_completedDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("completedDate"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doubleValue);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("doubleValue"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_intValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("intValue"));

  }
LABEL_9:
  templateUniqueName = self->_templateUniqueName;
  if (templateUniqueName)
    objc_msgSend(v3, "setObject:forKey:", templateUniqueName, CFSTR("templateUniqueName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableFitnessFriendAchievementReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_friendUUID)
  {
    objc_msgSend(v6, "setFriendUUID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_completedDate;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_doubleValue;
  *((_BYTE *)v4 + 56) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_8:
    *((_QWORD *)v4 + 3) = self->_intValue;
    *((_BYTE *)v4 + 56) |= 4u;
  }
LABEL_9:
  if (self->_templateUniqueName)
  {
    objc_msgSend(v6, "setTemplateUniqueName:");
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
  char has;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSData copyWithZone:](self->_friendUUID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(double *)(v5 + 16) = self->_doubleValue;
    *(_BYTE *)(v5 + 56) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_completedDate;
  *(_BYTE *)(v5 + 56) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 24) = self->_intValue;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
LABEL_5:
  v11 = -[NSString copyWithZone:](self->_templateUniqueName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  NSData *friendUUID;
  NSString *templateUniqueName;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 5))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_23;
  }
  friendUUID = self->_friendUUID;
  if ((unint64_t)friendUUID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](friendUUID, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_completedDate != *((double *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_23:
    v8 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_doubleValue != *((double *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_intValue != *((_QWORD *)v4 + 3))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_23;
  }
  templateUniqueName = self->_templateUniqueName;
  if ((unint64_t)templateUniqueName | *((_QWORD *)v4 + 6))
    v8 = -[NSString isEqual:](templateUniqueName, "isEqual:");
  else
    v8 = 1;
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  char has;
  unint64_t v6;
  double completedDate;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double doubleValue;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;

  v3 = -[HDCodableSample hash](self->_sample, "hash");
  v4 = -[NSData hash](self->_friendUUID, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    completedDate = self->_completedDate;
    v8 = -completedDate;
    if (completedDate >= 0.0)
      v8 = self->_completedDate;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 2) != 0)
  {
    doubleValue = self->_doubleValue;
    v13 = -doubleValue;
    if (doubleValue >= 0.0)
      v13 = self->_doubleValue;
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
  if ((has & 4) != 0)
    v16 = 2654435761 * self->_intValue;
  else
    v16 = 0;
  return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ -[NSString hash](self->_templateUniqueName, "hash");
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
  v6 = *((_QWORD *)v4 + 5);
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
    -[HDCodableFitnessFriendAchievement setSample:](self, "setSample:");
  }
  v4 = v8;
LABEL_7:
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableFitnessFriendAchievement setFriendUUID:](self, "setFriendUUID:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 56);
  if ((v7 & 1) != 0)
  {
    self->_completedDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 56);
    if ((v7 & 2) == 0)
    {
LABEL_11:
      if ((v7 & 4) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_doubleValue = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
LABEL_12:
    self->_intValue = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_13:
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCodableFitnessFriendAchievement setTemplateUniqueName:](self, "setTemplateUniqueName:");
    v4 = v8;
  }

}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (NSString)templateUniqueName
{
  return self->_templateUniqueName;
}

- (void)setTemplateUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_templateUniqueName, a3);
}

@end
