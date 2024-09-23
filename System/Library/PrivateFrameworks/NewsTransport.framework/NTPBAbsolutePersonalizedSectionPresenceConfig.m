@implementation NTPBAbsolutePersonalizedSectionPresenceConfig

- (void)setCTRToShow:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cTRToShow = a3;
}

- (void)setHasCTRToShow:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCTRToShow
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCTRToHide:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cTRToHide = a3;
}

- (void)setHasCTRToHide:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCTRToHide
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMinProbabilityToShow:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_minProbabilityToShow = a3;
}

- (void)setHasMinProbabilityToShow:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinProbabilityToShow
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSectionEdition:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_sectionEdition = a3;
}

- (void)setHasSectionEdition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSectionEdition
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)NTPBAbsolutePersonalizedSectionPresenceConfig;
  -[NTPBAbsolutePersonalizedSectionPresenceConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBAbsolutePersonalizedSectionPresenceConfig dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_cTRToShow);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("CTR_to_show"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_minProbabilityToShow);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("min_probability_to_show"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_cTRToHide);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("CTR_to_hide"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sectionEdition);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("section_edition"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAbsolutePersonalizedSectionPresenceConfigReadFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
LABEL_5:
    PBDataWriterWriteUint64Field();
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_cTRToShow;
    *((_BYTE *)result + 40) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_cTRToHide;
  *((_BYTE *)result + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_minProbabilityToShow;
  *((_BYTE *)result + 40) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return result;
LABEL_5:
  *((_QWORD *)result + 4) = self->_sectionEdition;
  *((_BYTE *)result + 40) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_cTRToShow != *((double *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_cTRToHide != *((double *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_minProbabilityToShow != *((double *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 40) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_sectionEdition != *((_QWORD *)v4 + 4))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double cTRToShow;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double cTRToHide;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double minProbabilityToShow;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    cTRToShow = self->_cTRToShow;
    v6 = -cTRToShow;
    if (cTRToShow >= 0.0)
      v6 = self->_cTRToShow;
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
  if ((has & 1) != 0)
  {
    cTRToHide = self->_cTRToHide;
    v11 = -cTRToHide;
    if (cTRToHide >= 0.0)
      v11 = self->_cTRToHide;
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
    minProbabilityToShow = self->_minProbabilityToShow;
    v16 = -minProbabilityToShow;
    if (minProbabilityToShow >= 0.0)
      v16 = self->_minProbabilityToShow;
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
  if ((has & 8) != 0)
    v19 = 2654435761u * self->_sectionEdition;
  else
    v19 = 0;
  return v9 ^ v4 ^ v14 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_cTRToShow = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      self->_minProbabilityToShow = *((double *)v4 + 3);
      *(_BYTE *)&self->_has |= 4u;
      if ((*((_BYTE *)v4 + 40) & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_cTRToHide = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 8) != 0)
  {
LABEL_5:
    self->_sectionEdition = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:

}

- (double)cTRToShow
{
  return self->_cTRToShow;
}

- (double)cTRToHide
{
  return self->_cTRToHide;
}

- (double)minProbabilityToShow
{
  return self->_minProbabilityToShow;
}

- (unint64_t)sectionEdition
{
  return self->_sectionEdition;
}

@end
