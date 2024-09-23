@implementation CLPLocationConsumptionScoreInfo

- (void)setClientKey:(id)a3
{
  objc_storeStrong((id *)&self->_clientKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientKey, 0);
}

- (void)setStartTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_clientKey)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)setStopTime:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_stopTime = a3;
}

- (void)setScore:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_score = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStopTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStopTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasClientKey
{
  return self->_clientKey != 0;
}

- (void)setHasScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScore
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)CLPLocationConsumptionScoreInfo;
  -[CLPLocationConsumptionScoreInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLocationConsumptionScoreInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *clientKey;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("startTime"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stopTime);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("stopTime"));

  }
  clientKey = self->_clientKey;
  if (clientKey)
    objc_msgSend(v3, "setObject:forKey:", clientKey, CFSTR("clientKey"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_score);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("score"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLocationConsumptionScoreInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_startTime;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_stopTime;
    *((_BYTE *)v4 + 36) |= 2u;
  }
  if (self->_clientKey)
  {
    v6 = v4;
    objc_msgSend(v4, "setClientKey:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_score;
    *((_BYTE *)v4 + 36) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_startTime;
    *(_BYTE *)(v5 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_stopTime;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_clientKey, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_score;
    *(_BYTE *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *clientKey;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_startTime != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_stopTime != *((double *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  clientKey = self->_clientKey;
  if ((unint64_t)clientKey | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientKey, "isEqual:"))
    {
LABEL_19:
      v7 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_score != *((_DWORD *)v4 + 8))
      goto LABEL_19;
    v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double startTime;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double stopTime;
  double v11;
  long double v12;
  double v13;
  NSUInteger v14;
  uint64_t v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    startTime = self->_startTime;
    v6 = -startTime;
    if (startTime >= 0.0)
      v6 = self->_startTime;
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
  if ((has & 2) != 0)
  {
    stopTime = self->_stopTime;
    v11 = -stopTime;
    if (stopTime >= 0.0)
      v11 = self->_stopTime;
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
  v14 = -[NSString hash](self->_clientKey, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v15 = 2654435761 * self->_score;
  else
    v15 = 0;
  return v9 ^ v4 ^ v15 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
  {
    self->_startTime = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_stopTime = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[CLPLocationConsumptionScoreInfo setClientKey:](self, "setClientKey:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    self->_score = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (double)startTime
{
  return self->_startTime;
}

- (double)stopTime
{
  return self->_stopTime;
}

- (NSString)clientKey
{
  return self->_clientKey;
}

- (int)score
{
  return self->_score;
}

@end
