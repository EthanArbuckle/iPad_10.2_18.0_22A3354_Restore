@implementation _BlastDoorASCodableAchievement

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setCompletedDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_completedDate = a3;
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

- (void)setIntValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_intValue = a3;
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

- (BOOL)hasIntValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setWorkoutActivityType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_workoutActivityType = a3;
}

- (void)setHasWorkoutActivityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWorkoutActivityType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasDefinitionIdentifier
{
  return self->_definitionIdentifier != 0;
}

- (BOOL)hasTemplateUniqueName
{
  return self->_templateUniqueName != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorASCodableAchievement;
  -[_BlastDoorASCodableAchievement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BlastDoorASCodableAchievement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _BlastDoorASCodableSample *sample;
  void *v5;
  char has;
  void *v7;
  NSString *definitionIdentifier;
  NSString *templateUniqueName;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[_BlastDoorASCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_completedDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("completedDate"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_doubleValue);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("doubleValue"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_intValue);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("intValue"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_workoutActivityType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("workoutActivityType"));

  }
LABEL_8:
  definitionIdentifier = self->_definitionIdentifier;
  if (definitionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", definitionIdentifier, CFSTR("definitionIdentifier"));
  templateUniqueName = self->_templateUniqueName;
  if (templateUniqueName)
    objc_msgSend(v3, "setObject:forKey:", templateUniqueName, CFSTR("templateUniqueName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _BlastDoorASCodableAchievementReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_8:
  if (self->_definitionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_templateUniqueName)
  {
    PBDataWriterWriteStringField();
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
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_completedDate;
    *((_BYTE *)v4 + 64) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_doubleValue;
  *((_BYTE *)v4 + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  *((_QWORD *)v4 + 3) = self->_intValue;
  *((_BYTE *)v4 + 64) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_QWORD *)v4 + 4) = self->_workoutActivityType;
    *((_BYTE *)v4 + 64) |= 8u;
  }
LABEL_8:
  if (self->_definitionIdentifier)
  {
    objc_msgSend(v6, "setDefinitionIdentifier:");
    v4 = v6;
  }
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
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_BlastDoorASCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_completedDate;
    *(_BYTE *)(v5 + 64) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 24) = self->_intValue;
      *(_BYTE *)(v5 + 64) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_doubleValue;
  *(_BYTE *)(v5 + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_QWORD *)(v5 + 32) = self->_workoutActivityType;
    *(_BYTE *)(v5 + 64) |= 8u;
  }
LABEL_6:
  v9 = -[NSString copyWithZone:](self->_definitionIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_templateUniqueName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BlastDoorASCodableSample *sample;
  NSString *definitionIdentifier;
  NSString *templateUniqueName;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 6))
  {
    if (!-[_BlastDoorASCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_completedDate != *((double *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_28:
    v8 = 0;
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_doubleValue != *((double *)v4 + 2))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_intValue != *((_QWORD *)v4 + 3))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_workoutActivityType != *((_QWORD *)v4 + 4))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_28;
  }
  definitionIdentifier = self->_definitionIdentifier;
  if ((unint64_t)definitionIdentifier | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](definitionIdentifier, "isEqual:"))
  {
    goto LABEL_28;
  }
  templateUniqueName = self->_templateUniqueName;
  if ((unint64_t)templateUniqueName | *((_QWORD *)v4 + 7))
    v8 = -[NSString isEqual:](templateUniqueName, "isEqual:");
  else
    v8 = 1;
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  unint64_t v5;
  double completedDate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double doubleValue;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;

  v3 = -[_BlastDoorASCodableSample hash](self->_sample, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    completedDate = self->_completedDate;
    v7 = -completedDate;
    if (completedDate >= 0.0)
      v7 = self->_completedDate;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 2) != 0)
  {
    doubleValue = self->_doubleValue;
    v12 = -doubleValue;
    if (doubleValue >= 0.0)
      v12 = self->_doubleValue;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 4) != 0)
  {
    v15 = 2654435761 * self->_intValue;
    if ((has & 8) != 0)
      goto LABEL_19;
LABEL_21:
    v16 = 0;
    goto LABEL_22;
  }
  v15 = 0;
  if ((has & 8) == 0)
    goto LABEL_21;
LABEL_19:
  v16 = 2654435761 * self->_workoutActivityType;
LABEL_22:
  v17 = v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ -[NSString hash](self->_definitionIdentifier, "hash");
  return v17 ^ -[NSString hash](self->_templateUniqueName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _BlastDoorASCodableSample *sample;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 6);
  v8 = v4;
  if (sample)
  {
    if (!v6)
      goto LABEL_7;
    -[_BlastDoorASCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[_BlastDoorASCodableAchievement setSample:](self, "setSample:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 64);
  if ((v7 & 1) != 0)
  {
    self->_completedDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 64);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_doubleValue = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v7 = *((_BYTE *)v4 + 64);
  if ((v7 & 4) == 0)
  {
LABEL_10:
    if ((v7 & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_19:
  self->_intValue = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
LABEL_11:
    self->_workoutActivityType = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 5))
  {
    -[_BlastDoorASCodableAchievement setDefinitionIdentifier:](self, "setDefinitionIdentifier:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[_BlastDoorASCodableAchievement setTemplateUniqueName:](self, "setTemplateUniqueName:");
    v4 = v8;
  }

}

- (_BlastDoorASCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (double)completedDate
{
  return self->_completedDate;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (int64_t)intValue
{
  return self->_intValue;
}

- (int64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (NSString)definitionIdentifier
{
  return self->_definitionIdentifier;
}

- (void)setDefinitionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_definitionIdentifier, a3);
}

- (NSString)templateUniqueName
{
  return self->_templateUniqueName;
}

- (void)setTemplateUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_templateUniqueName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_definitionIdentifier, 0);
}

@end
