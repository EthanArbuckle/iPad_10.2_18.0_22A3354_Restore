@implementation ACHCodableAchievementProgressUpdate

- (ACHCodableAchievementProgressUpdate)initWithSerializedData:(id)a3 error:(id *)a4
{
  id v5;
  ACHCodableAchievementProgressUpdate *v6;

  v5 = a3;
  v6 = -[ACHCodableAchievementProgressUpdate initWithData:]([ACHCodableAchievementProgressUpdate alloc], "initWithData:", v5);

  return v6;
}

- (BOOL)hasTemplateUniqueName
{
  return self->_templateUniqueName != 0;
}

- (void)setProgressQuantityValue:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_progressQuantityValue = a3;
}

- (void)setHasProgressQuantityValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProgressQuantityValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasProgressQuantityUnit
{
  return self->_progressQuantityUnit != 0;
}

- (void)setGoalQuantityValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_goalQuantityValue = a3;
}

- (void)setHasGoalQuantityValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGoalQuantityValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasGoalQuantityUnit
{
  return self->_goalQuantityUnit != 0;
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
  v8.super_class = (Class)ACHCodableAchievementProgressUpdate;
  -[ACHCodableAchievementProgressUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievementProgressUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *templateUniqueName;
  void *v6;
  NSString *progressQuantityUnit;
  void *v8;
  NSString *goalQuantityUnit;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  templateUniqueName = self->_templateUniqueName;
  if (templateUniqueName)
    objc_msgSend(v3, "setObject:forKey:", templateUniqueName, CFSTR("templateUniqueName"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_progressQuantityValue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("progressQuantityValue"));

  }
  progressQuantityUnit = self->_progressQuantityUnit;
  if (progressQuantityUnit)
    objc_msgSend(v4, "setObject:forKey:", progressQuantityUnit, CFSTR("progressQuantityUnit"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_goalQuantityValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("goalQuantityValue"));

  }
  goalQuantityUnit = self->_goalQuantityUnit;
  if (goalQuantityUnit)
    objc_msgSend(v4, "setObject:forKey:", goalQuantityUnit, CFSTR("goalQuantityUnit"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableAchievementProgressUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_templateUniqueName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_progressQuantityUnit)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_goalQuantityUnit)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_templateUniqueName)
  {
    objc_msgSend(v4, "setTemplateUniqueName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_progressQuantityValue;
    *((_BYTE *)v4 + 48) |= 2u;
  }
  if (self->_progressQuantityUnit)
  {
    objc_msgSend(v5, "setProgressQuantityUnit:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_goalQuantityValue;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_goalQuantityUnit)
  {
    objc_msgSend(v5, "setGoalQuantityUnit:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_templateUniqueName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_progressQuantityValue;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_progressQuantityUnit, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_goalQuantityValue;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_goalQuantityUnit, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *templateUniqueName;
  char has;
  NSString *progressQuantityUnit;
  NSString *goalQuantityUnit;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  templateUniqueName = self->_templateUniqueName;
  if ((unint64_t)templateUniqueName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](templateUniqueName, "isEqual:"))
      goto LABEL_19;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_progressQuantityValue != *((double *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_19;
  }
  progressQuantityUnit = self->_progressQuantityUnit;
  if ((unint64_t)progressQuantityUnit | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](progressQuantityUnit, "isEqual:"))
    {
LABEL_19:
      v9 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_goalQuantityValue != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_19;
  }
  goalQuantityUnit = self->_goalQuantityUnit;
  if ((unint64_t)goalQuantityUnit | *((_QWORD *)v4 + 3))
    v9 = -[NSString isEqual:](goalQuantityUnit, "isEqual:");
  else
    v9 = 1;
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double progressQuantityValue;
  double v6;
  long double v7;
  double v8;
  NSUInteger v9;
  unint64_t v10;
  double goalQuantityValue;
  double v12;
  long double v13;
  double v14;

  v3 = -[NSString hash](self->_templateUniqueName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    progressQuantityValue = self->_progressQuantityValue;
    v6 = -progressQuantityValue;
    if (progressQuantityValue >= 0.0)
      v6 = self->_progressQuantityValue;
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
  v9 = -[NSString hash](self->_progressQuantityUnit, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    goalQuantityValue = self->_goalQuantityValue;
    v12 = -goalQuantityValue;
    if (goalQuantityValue >= 0.0)
      v12 = self->_goalQuantityValue;
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
  return v4 ^ v3 ^ v9 ^ v10 ^ -[NSString hash](self->_goalQuantityUnit, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[ACHCodableAchievementProgressUpdate setTemplateUniqueName:](self, "setTemplateUniqueName:");
    v4 = v5;
  }
  if (((_BYTE)v4[6] & 2) != 0)
  {
    self->_progressQuantityValue = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ACHCodableAchievementProgressUpdate setProgressQuantityUnit:](self, "setProgressQuantityUnit:");
    v4 = v5;
  }
  if (((_BYTE)v4[6] & 1) != 0)
  {
    self->_goalQuantityValue = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ACHCodableAchievementProgressUpdate setGoalQuantityUnit:](self, "setGoalQuantityUnit:");
    v4 = v5;
  }

}

- (NSString)templateUniqueName
{
  return self->_templateUniqueName;
}

- (void)setTemplateUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_templateUniqueName, a3);
}

- (double)progressQuantityValue
{
  return self->_progressQuantityValue;
}

- (NSString)progressQuantityUnit
{
  return self->_progressQuantityUnit;
}

- (void)setProgressQuantityUnit:(id)a3
{
  objc_storeStrong((id *)&self->_progressQuantityUnit, a3);
}

- (double)goalQuantityValue
{
  return self->_goalQuantityValue;
}

- (NSString)goalQuantityUnit
{
  return self->_goalQuantityUnit;
}

- (void)setGoalQuantityUnit:(id)a3
{
  objc_storeStrong((id *)&self->_goalQuantityUnit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_progressQuantityUnit, 0);
  objc_storeStrong((id *)&self->_goalQuantityUnit, 0);
}

@end
