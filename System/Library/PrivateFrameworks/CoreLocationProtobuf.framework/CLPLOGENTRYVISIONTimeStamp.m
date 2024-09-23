@implementation CLPLOGENTRYVISIONTimeStamp

- (void)setCfAbsoluteTimeS:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cfAbsoluteTimeS = a3;
}

- (void)setHasCfAbsoluteTimeS:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCfAbsoluteTimeS
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMachAbsoluteTimeS:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_machAbsoluteTimeS = a3;
}

- (void)setHasMachAbsoluteTimeS:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMachAbsoluteTimeS
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMachContinuousTimeS:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_machContinuousTimeS = a3;
}

- (void)setHasMachContinuousTimeS:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMachContinuousTimeS
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
  v8.super_class = (Class)CLPLOGENTRYVISIONTimeStamp;
  -[CLPLOGENTRYVISIONTimeStamp description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLOGENTRYVISIONTimeStamp dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_machAbsoluteTimeS);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("mach_absolute_time_s"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cfAbsoluteTimeS);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cf_absolute_time_s"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_machContinuousTimeS);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mach_continuous_time_s"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONTimeStampReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v4[2] = *(_QWORD *)&self->_machAbsoluteTimeS;
    *((_BYTE *)v4 + 32) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[1] = *(_QWORD *)&self->_cfAbsoluteTimeS;
  *((_BYTE *)v4 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v4[3] = *(_QWORD *)&self->_machContinuousTimeS;
    *((_BYTE *)v4 + 32) |= 4u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_cfAbsoluteTimeS;
    *((_BYTE *)result + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_machAbsoluteTimeS;
  *((_BYTE *)result + 32) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_machContinuousTimeS;
  *((_BYTE *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_cfAbsoluteTimeS != *((double *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_machAbsoluteTimeS != *((double *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 32) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_machContinuousTimeS != *((double *)v4 + 3))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double cfAbsoluteTimeS;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double machAbsoluteTimeS;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double machContinuousTimeS;
  double v16;
  long double v17;
  double v18;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    cfAbsoluteTimeS = self->_cfAbsoluteTimeS;
    v6 = -cfAbsoluteTimeS;
    if (cfAbsoluteTimeS >= 0.0)
      v6 = self->_cfAbsoluteTimeS;
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
    machAbsoluteTimeS = self->_machAbsoluteTimeS;
    v11 = -machAbsoluteTimeS;
    if (machAbsoluteTimeS >= 0.0)
      v11 = self->_machAbsoluteTimeS;
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
  if ((has & 4) != 0)
  {
    machContinuousTimeS = self->_machContinuousTimeS;
    v16 = -machContinuousTimeS;
    if (machContinuousTimeS >= 0.0)
      v16 = self->_machContinuousTimeS;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  return v9 ^ v4 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_machAbsoluteTimeS = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 32) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_cfAbsoluteTimeS = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    self->_machContinuousTimeS = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:

}

- (double)cfAbsoluteTimeS
{
  return self->_cfAbsoluteTimeS;
}

- (double)machAbsoluteTimeS
{
  return self->_machAbsoluteTimeS;
}

- (double)machContinuousTimeS
{
  return self->_machContinuousTimeS;
}

@end
