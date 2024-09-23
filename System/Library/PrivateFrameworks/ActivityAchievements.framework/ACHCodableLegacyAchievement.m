@implementation ACHCodableLegacyAchievement

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setAchievementType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_achievementType = a3;
}

- (void)setHasAchievementType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAchievementType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCompletedDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_completedDate = a3;
}

- (void)setHasCompletedDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCompletedDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDoubleValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIntValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_intValue = a3;
}

- (void)setHasIntValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIntValue
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAlerted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_alerted = a3;
}

- (void)setHasAlerted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAlerted
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasDefinitionIdentifier
{
  return self->_definitionIdentifier != 0;
}

- (void)setWorkoutActivityType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_workoutActivityType = a3;
}

- (void)setHasWorkoutActivityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWorkoutActivityType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ACHCodableLegacyAchievement;
  -[ACHCodableLegacyAchievement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableLegacyAchievement dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  void *v7;
  NSString *definitionIdentifier;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_achievementType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("achievementType"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_completedDate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("completedDate"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_doubleValue);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("doubleValue"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_intValue);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("intValue"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_alerted);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("alerted"));

  }
LABEL_9:
  definitionIdentifier = self->_definitionIdentifier;
  if (definitionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", definitionIdentifier, CFSTR("definitionIdentifier"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_workoutActivityType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("workoutActivityType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableLegacyAchievementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_16;
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
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_9:
  if (self->_definitionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
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
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_achievementType;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_completedDate;
  *((_BYTE *)v4 + 68) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_doubleValue;
  *((_BYTE *)v4 + 68) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  *((_QWORD *)v4 + 4) = self->_intValue;
  *((_BYTE *)v4 + 68) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *((_BYTE *)v4 + 64) = self->_alerted;
    *((_BYTE *)v4 + 68) |= 0x20u;
  }
LABEL_9:
  if (self->_definitionIdentifier)
  {
    objc_msgSend(v6, "setDefinitionIdentifier:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_QWORD *)v4 + 5) = self->_workoutActivityType;
    *((_BYTE *)v4 + 68) |= 0x10u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_achievementType;
    *(_BYTE *)(v5 + 68) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_completedDate;
  *(_BYTE *)(v5 + 68) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(double *)(v5 + 24) = self->_doubleValue;
  *(_BYTE *)(v5 + 68) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  *(_QWORD *)(v5 + 32) = self->_intValue;
  *(_BYTE *)(v5 + 68) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *(_BYTE *)(v5 + 64) = self->_alerted;
    *(_BYTE *)(v5 + 68) |= 0x20u;
  }
LABEL_7:
  v9 = -[NSString copyWithZone:](self->_definitionIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_workoutActivityType;
    *(_BYTE *)(v5 + 68) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *uuid;
  char has;
  NSString *definitionIdentifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_39;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_achievementType != *((_QWORD *)v4 + 1))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_completedDate != *((double *)v4 + 2))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_doubleValue != *((double *)v4 + 3))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0 || self->_intValue != *((_QWORD *)v4 + 4))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x20) == 0)
      goto LABEL_39;
    if (self->_alerted)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_39;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_39;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 0x20) != 0)
  {
    goto LABEL_39;
  }
  definitionIdentifier = self->_definitionIdentifier;
  if (!((unint64_t)definitionIdentifier | *((_QWORD *)v4 + 6)))
    goto LABEL_35;
  if (!-[NSString isEqual:](definitionIdentifier, "isEqual:"))
  {
LABEL_39:
    v8 = 0;
    goto LABEL_40;
  }
  has = (char)self->_has;
LABEL_35:
  v8 = (*((_BYTE *)v4 + 68) & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x10) == 0 || self->_workoutActivityType != *((_QWORD *)v4 + 5))
      goto LABEL_39;
    v8 = 1;
  }
LABEL_40:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  char has;
  uint64_t v5;
  double completedDate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double doubleValue;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  uint64_t v19;

  v3 = -[NSData hash](self->_uuid, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = 2654435761 * self->_achievementType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  completedDate = self->_completedDate;
  v7 = -completedDate;
  if (completedDate >= 0.0)
    v7 = self->_completedDate;
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
  if ((has & 4) != 0)
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
  if ((has & 8) != 0)
  {
    v16 = 2654435761 * self->_intValue;
    if ((has & 0x20) != 0)
      goto LABEL_21;
  }
  else
  {
    v16 = 0;
    if ((has & 0x20) != 0)
    {
LABEL_21:
      v17 = 2654435761 * self->_alerted;
      goto LABEL_24;
    }
  }
  v17 = 0;
LABEL_24:
  v18 = -[NSString hash](self->_definitionIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v19 = 2654435761 * self->_workoutActivityType;
  else
    v19 = 0;
  return v5 ^ v3 ^ v10 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[ACHCodableLegacyAchievement setUuid:](self, "setUuid:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 1) != 0)
  {
    self->_achievementType = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 68);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_completedDate = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_doubleValue = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  self->_intValue = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 68) & 0x20) != 0)
  {
LABEL_8:
    self->_alerted = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 6))
  {
    -[ACHCodableLegacyAchievement setDefinitionIdentifier:](self, "setDefinitionIdentifier:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 68) & 0x10) != 0)
  {
    self->_workoutActivityType = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
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

- (int64_t)achievementType
{
  return self->_achievementType;
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

- (BOOL)alerted
{
  return self->_alerted;
}

- (NSString)definitionIdentifier
{
  return self->_definitionIdentifier;
}

- (void)setDefinitionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_definitionIdentifier, a3);
}

- (int64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_definitionIdentifier, 0);
}

@end
