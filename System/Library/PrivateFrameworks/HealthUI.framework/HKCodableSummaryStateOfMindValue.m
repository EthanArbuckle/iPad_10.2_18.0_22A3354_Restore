@implementation HKCodableSummaryStateOfMindValue

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)HKCodableSummaryStateOfMindValue;
  -[HKCodableSummaryStateOfMindValue dealloc](&v3, sel_dealloc);
}

- (void)setDateData:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dateData = a3;
}

- (void)setHasDateData:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateData
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setReflectiveInterval:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_reflectiveInterval = a3;
}

- (void)setHasReflectiveInterval:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReflectiveInterval
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setValence:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_valence = a3;
}

- (void)setHasValence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasValence
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unint64_t)labelsCount
{
  return self->_labels.count;
}

- (int64_t)labels
{
  return self->_labels.list;
}

- (void)clearLabels
{
  PBRepeatedInt64Clear();
}

- (void)addLabels:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)labelsAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_labels;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_labels = &self->_labels;
  count = self->_labels.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_labels->list[a3];
}

- (void)setLabels:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)domainsCount
{
  return self->_domains.count;
}

- (int64_t)domains
{
  return self->_domains.list;
}

- (void)clearDomains
{
  PBRepeatedInt64Clear();
}

- (void)addDomains:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)domainsAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_domains;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_domains = &self->_domains;
  count = self->_domains.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_domains->list[a3];
}

- (void)setDomains:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
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
  v8.super_class = (Class)HKCodableSummaryStateOfMindValue;
  -[HKCodableSummaryStateOfMindValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryStateOfMindValue dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_reflectiveInterval);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("reflectiveInterval"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateData);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("dateData"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_valence);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("valence"));

  }
LABEL_5:
  PBRepeatedInt64NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("labels"));

  PBRepeatedInt64NSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("domains"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryStateOfMindValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  $A58966F474337DCABE012981F76706F5 *p_domains;
  unint64_t v8;
  id v9;

  v4 = a3;
  has = (char)self->_has;
  v9 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v9;
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
  PBDataWriterWriteInt64Field();
  v4 = v9;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v9;
  }
LABEL_5:
  if (self->_labels.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v9;
      ++v6;
    }
    while (v6 < self->_labels.count);
  }
  p_domains = &self->_domains;
  if (p_domains->count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v9;
      ++v8;
    }
    while (v8 < p_domains->count);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  id v12;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_15:
    v4[8] = self->_reflectiveInterval;
    *((_BYTE *)v4 + 80) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[7] = *(_QWORD *)&self->_dateData;
  *((_BYTE *)v4 + 80) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v4[9] = *(_QWORD *)&self->_valence;
    *((_BYTE *)v4 + 80) |= 4u;
  }
LABEL_5:
  v12 = v4;
  if (-[HKCodableSummaryStateOfMindValue labelsCount](self, "labelsCount"))
  {
    objc_msgSend(v12, "clearLabels");
    v6 = -[HKCodableSummaryStateOfMindValue labelsCount](self, "labelsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v12, "addLabels:", -[HKCodableSummaryStateOfMindValue labelsAtIndex:](self, "labelsAtIndex:", i));
    }
  }
  if (-[HKCodableSummaryStateOfMindValue domainsCount](self, "domainsCount"))
  {
    objc_msgSend(v12, "clearDomains");
    v9 = -[HKCodableSummaryStateOfMindValue domainsCount](self, "domainsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v12, "addDomains:", -[HKCodableSummaryStateOfMindValue domainsAtIndex:](self, "domainsAtIndex:", j));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v4 + 64) = self->_reflectiveInterval;
    *(_BYTE *)(v4 + 80) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(double *)(v4 + 56) = self->_dateData;
  *(_BYTE *)(v4 + 80) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(double *)(v4 + 72) = self->_valence;
    *(_BYTE *)(v4 + 80) |= 4u;
  }
LABEL_5:
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_dateData != *((double *)v4 + 7))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_reflectiveInterval != *((_QWORD *)v4 + 8))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_valence != *((double *)v4 + 9))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_19;
  }
  if (!PBRepeatedInt64IsEqual())
  {
LABEL_19:
    IsEqual = 0;
    goto LABEL_20;
  }
  IsEqual = PBRepeatedInt64IsEqual();
LABEL_20:

  return IsEqual;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double dateData;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  double valence;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    dateData = self->_dateData;
    v6 = -dateData;
    if (dateData >= 0.0)
      v6 = self->_dateData;
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
    v9 = 2654435761 * self->_reflectiveInterval;
    if ((has & 4) != 0)
      goto LABEL_11;
LABEL_16:
    v14 = 0;
    goto LABEL_19;
  }
  v9 = 0;
  if ((has & 4) == 0)
    goto LABEL_16;
LABEL_11:
  valence = self->_valence;
  v11 = -valence;
  if (valence >= 0.0)
    v11 = self->_valence;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  v15 = v9 ^ v4 ^ v14 ^ PBRepeatedInt64Hash();
  return v15 ^ PBRepeatedInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  id v12;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 1) != 0)
  {
    self->_dateData = *((double *)v4 + 7);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 80);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_reflectiveInterval = *((_QWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
LABEL_4:
    self->_valence = *((double *)v4 + 9);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  v12 = v4;
  v6 = objc_msgSend(v4, "labelsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[HKCodableSummaryStateOfMindValue addLabels:](self, "addLabels:", objc_msgSend(v12, "labelsAtIndex:", i));
  }
  v9 = objc_msgSend(v12, "domainsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[HKCodableSummaryStateOfMindValue addDomains:](self, "addDomains:", objc_msgSend(v12, "domainsAtIndex:", j));
  }

}

- (double)dateData
{
  return self->_dateData;
}

- (int64_t)reflectiveInterval
{
  return self->_reflectiveInterval;
}

- (double)valence
{
  return self->_valence;
}

@end
