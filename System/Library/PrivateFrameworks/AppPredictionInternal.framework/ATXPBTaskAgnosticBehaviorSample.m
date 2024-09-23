@implementation ATXPBTaskAgnosticBehaviorSample

- (void)setTimeIntervalSinceReferenceDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeIntervalSinceReferenceDate = a3;
}

- (void)setHasTimeIntervalSinceReferenceDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeIntervalSinceReferenceDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (!a3)
    return CFSTR("contactInteraction");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("contactInteraction"));
  return 0;
}

- (void)setEngaged:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_engaged = a3;
}

- (void)setHasEngaged:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEngaged
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasFeatureVector
{
  return self->_featureVector != 0;
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
  v8.super_class = (Class)ATXPBTaskAgnosticBehaviorSample;
  -[ATXPBTaskAgnosticBehaviorSample description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBTaskAgnosticBehaviorSample dictionaryRepresentation](self, "dictionaryRepresentation");
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
  ATXPBTaskAgnosticBehaviorFeatureVector *featureVector;
  void *v7;
  void *v9;
  __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeIntervalSinceReferenceDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timeIntervalSinceReferenceDate"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  if (self->_type)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("contactInteraction");
  }
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("type"));

  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_5;
LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_engaged);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("engaged"));

LABEL_5:
  featureVector = self->_featureVector;
  if (featureVector)
  {
    -[ATXPBTaskAgnosticBehaviorFeatureVector dictionaryRepresentation](featureVector, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("featureVector"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBTaskAgnosticBehaviorSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:
  if (self->_featureVector)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

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
    v4[1] = *(_QWORD *)&self->_timeIntervalSinceReferenceDate;
    *((_BYTE *)v4 + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_type;
  *((_BYTE *)v4 + 32) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 28) = self->_engaged;
    *((_BYTE *)v4 + 32) |= 4u;
  }
LABEL_5:
  if (self->_featureVector)
  {
    v6 = v4;
    objc_msgSend(v4, "setFeatureVector:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 24) = self->_type;
    *(_BYTE *)(v5 + 32) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_timeIntervalSinceReferenceDate;
  *(_BYTE *)(v5 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 28) = self->_engaged;
    *(_BYTE *)(v5 + 32) |= 4u;
  }
LABEL_5:
  v8 = -[ATXPBTaskAgnosticBehaviorFeatureVector copyWithZone:](self->_featureVector, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  ATXPBTaskAgnosticBehaviorFeatureVector *featureVector;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_timeIntervalSinceReferenceDate != *((double *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_type != *((_DWORD *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0)
      goto LABEL_22;
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*((_BYTE *)v4 + 32) & 4) == 0)
    goto LABEL_16;
  if (!self->_engaged)
  {
    if (!*((_BYTE *)v4 + 28))
      goto LABEL_22;
    goto LABEL_16;
  }
  if (!*((_BYTE *)v4 + 28))
    goto LABEL_16;
LABEL_22:
  featureVector = self->_featureVector;
  if ((unint64_t)featureVector | *((_QWORD *)v4 + 2))
    v5 = -[ATXPBTaskAgnosticBehaviorFeatureVector isEqual:](featureVector, "isEqual:");
  else
    v5 = 1;
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double timeIntervalSinceReferenceDate;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    timeIntervalSinceReferenceDate = self->_timeIntervalSinceReferenceDate;
    v6 = -timeIntervalSinceReferenceDate;
    if (timeIntervalSinceReferenceDate >= 0.0)
      v6 = self->_timeIntervalSinceReferenceDate;
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
    v9 = 2654435761 * self->_type;
    if ((has & 4) != 0)
      goto LABEL_11;
LABEL_13:
    v10 = 0;
    return v9 ^ v4 ^ v10 ^ -[ATXPBTaskAgnosticBehaviorFeatureVector hash](self->_featureVector, "hash");
  }
  v9 = 0;
  if ((has & 4) == 0)
    goto LABEL_13;
LABEL_11:
  v10 = 2654435761 * self->_engaged;
  return v9 ^ v4 ^ v10 ^ -[ATXPBTaskAgnosticBehaviorFeatureVector hash](self->_featureVector, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  ATXPBTaskAgnosticBehaviorFeatureVector *featureVector;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 32);
  if ((v6 & 1) != 0)
  {
    self->_timeIntervalSinceReferenceDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 32);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_type = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
LABEL_4:
    self->_engaged = *((_BYTE *)v4 + 28);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  featureVector = self->_featureVector;
  v8 = v5[2];
  if (featureVector)
  {
    if (v8)
    {
      v9 = v5;
      -[ATXPBTaskAgnosticBehaviorFeatureVector mergeFrom:](featureVector, "mergeFrom:");
LABEL_13:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[ATXPBTaskAgnosticBehaviorSample setFeatureVector:](self, "setFeatureVector:");
    goto LABEL_13;
  }

}

- (double)timeIntervalSinceReferenceDate
{
  return self->_timeIntervalSinceReferenceDate;
}

- (BOOL)engaged
{
  return self->_engaged;
}

- (ATXPBTaskAgnosticBehaviorFeatureVector)featureVector
{
  return self->_featureVector;
}

- (void)setFeatureVector:(id)a3
{
  objc_storeStrong((id *)&self->_featureVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureVector, 0);
}

@end
