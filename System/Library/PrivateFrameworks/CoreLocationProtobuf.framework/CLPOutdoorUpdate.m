@implementation CLPOutdoorUpdate

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_confidence = a3;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_type = a3;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setMctTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mctTimestamp = a3;
}

- (void)setEstimatedStateProbabilityOutdoor:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_estimatedStateProbabilityOutdoor = a3;
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 1) != 0)
LABEL_6:
    PBDataWriterWriteDoubleField();
LABEL_7:

}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMctTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMctTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_1E9595BE8 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IndoorOutdoorTypeUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IndoorOutdoorTypeIndoor")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IndoorOutdoorTypeOutdoor")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IndoorOutdoorTypeMax")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)confidence
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_confidence;
  else
    return 0;
}

- (void)setHasConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasConfidence
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)confidenceAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_1E9595C08 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConfidence:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IndoorOutdoorConfidenceUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IndoorOutdoorConfidenceLow")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IndoorOutdoorConfidenceMedium")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IndoorOutdoorConfidenceHigh")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasEstimatedStateProbabilityOutdoor:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEstimatedStateProbabilityOutdoor
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
  v8.super_class = (Class)CLPOutdoorUpdate;
  -[CLPOutdoorUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPOutdoorUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;
  uint64_t type;
  void *v10;
  uint64_t confidence;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mctTimestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("mctTimestamp"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_14:
    confidence = self->_confidence;
    if (confidence >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_confidence);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = *(&off_1E9595C08 + confidence);
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("confidence"));

    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
    return v3;
  }
LABEL_10:
  type = self->_type;
  if (type >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = *(&off_1E9595BE8 + type);
  }
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("type"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_14;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_estimatedStateProbabilityOutdoor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("estimatedStateProbabilityOutdoor"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPOutdoorUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = *(_QWORD *)&self->_mctTimestamp;
  *((_BYTE *)v4 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    *((_DWORD *)v4 + 8) = self->_confidence;
    *((_BYTE *)v4 + 40) |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *((_DWORD *)v4 + 9) = self->_type;
  *((_BYTE *)v4 + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    v4[1] = *(_QWORD *)&self->_estimatedStateProbabilityOutdoor;
    *((_BYTE *)v4 + 40) |= 1u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)result + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_mctTimestamp;
  *((_BYTE *)result + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 9) = self->_type;
  *((_BYTE *)result + 40) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 8) = self->_confidence;
  *((_BYTE *)result + 40) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_6:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_estimatedStateProbabilityOutdoor;
  *((_BYTE *)result + 40) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_timestamp != *((double *)v4 + 3))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_26:
    v5 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_mctTimestamp != *((double *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 9))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_confidence != *((_DWORD *)v4 + 8))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_26;
  }
  v5 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_estimatedStateProbabilityOutdoor != *((double *)v4 + 1))
      goto LABEL_26;
    v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double timestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double mctTimestamp;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double estimatedStateProbabilityOutdoor;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    timestamp = self->_timestamp;
    v6 = -timestamp;
    if (timestamp >= 0.0)
      v6 = self->_timestamp;
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
    mctTimestamp = self->_mctTimestamp;
    v11 = -mctTimestamp;
    if (mctTimestamp >= 0.0)
      v11 = self->_mctTimestamp;
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
  if ((has & 0x10) == 0)
  {
    v14 = 0;
    if ((has & 8) != 0)
      goto LABEL_19;
LABEL_25:
    v15 = 0;
    if ((has & 1) != 0)
      goto LABEL_20;
LABEL_26:
    v20 = 0;
    return v9 ^ v4 ^ v14 ^ v15 ^ v20;
  }
  v14 = 2654435761 * self->_type;
  if ((has & 8) == 0)
    goto LABEL_25;
LABEL_19:
  v15 = 2654435761 * self->_confidence;
  if ((has & 1) == 0)
    goto LABEL_26;
LABEL_20:
  estimatedStateProbabilityOutdoor = self->_estimatedStateProbabilityOutdoor;
  v17 = -estimatedStateProbabilityOutdoor;
  if (estimatedStateProbabilityOutdoor >= 0.0)
    v17 = self->_estimatedStateProbabilityOutdoor;
  v18 = floor(v17 + 0.5);
  v19 = (v17 - v18) * 1.84467441e19;
  v20 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
  if (v19 >= 0.0)
  {
    if (v19 > 0.0)
      v20 += (unint64_t)v19;
  }
  else
  {
    v20 -= (unint64_t)fabs(v19);
  }
  return v9 ^ v4 ^ v14 ^ v15 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_mctTimestamp = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    self->_confidence = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 40) & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_type = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 1) != 0)
  {
LABEL_6:
    self->_estimatedStateProbabilityOutdoor = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_7:

}

- (double)mctTimestamp
{
  return self->_mctTimestamp;
}

- (double)estimatedStateProbabilityOutdoor
{
  return self->_estimatedStateProbabilityOutdoor;
}

@end
