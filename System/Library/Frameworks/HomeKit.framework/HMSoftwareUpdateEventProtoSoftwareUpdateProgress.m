@implementation HMSoftwareUpdateEventProtoSoftwareUpdateProgress

- (void)setPercentageComplete:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_percentageComplete = a3;
}

- (void)setHasPercentageComplete:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPercentageComplete
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEstimatedTimeRemaining:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_estimatedTimeRemaining = a3;
}

- (void)setHasEstimatedTimeRemaining:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEstimatedTimeRemaining
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)HMSoftwareUpdateEventProtoSoftwareUpdateProgress;
  -[HMSoftwareUpdateEventProtoSoftwareUpdateProgress description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSoftwareUpdateEventProtoSoftwareUpdateProgress dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&v4 = self->_percentageComplete;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("percentageComplete"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_estimatedTimeRemaining);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("estimatedTimeRemaining"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMSoftwareUpdateEventProtoSoftwareUpdateProgressReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = LODWORD(self->_percentageComplete);
    *((_BYTE *)v4 + 20) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_estimatedTimeRemaining;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = LODWORD(self->_percentageComplete);
    *((_BYTE *)result + 20) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_estimatedTimeRemaining;
    *((_BYTE *)result + 20) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_percentageComplete != *((float *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_estimatedTimeRemaining != *((double *)v4 + 1))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float percentageComplete;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  double estimatedTimeRemaining;
  double v11;
  long double v12;
  double v13;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    percentageComplete = self->_percentageComplete;
    v6 = -percentageComplete;
    if (percentageComplete >= 0.0)
      v6 = self->_percentageComplete;
    v7 = floorf(v6 + 0.5);
    v8 = (float)(v6 - v7) * 1.8447e19;
    v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 1) != 0)
  {
    estimatedTimeRemaining = self->_estimatedTimeRemaining;
    v11 = -estimatedTimeRemaining;
    if (estimatedTimeRemaining >= 0.0)
      v11 = self->_estimatedTimeRemaining;
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
  return v9 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_percentageComplete = *((float *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 20);
  }
  if ((v5 & 1) != 0)
  {
    self->_estimatedTimeRemaining = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (float)percentageComplete
{
  return self->_percentageComplete;
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

@end
