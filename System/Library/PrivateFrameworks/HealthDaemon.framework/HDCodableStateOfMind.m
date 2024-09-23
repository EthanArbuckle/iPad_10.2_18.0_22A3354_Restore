@implementation HDCodableStateOfMind

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)HDCodableStateOfMind;
  -[HDCodableStateOfMind dealloc](&v3, sel_dealloc);
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setReflectiveInterval:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reflectiveInterval = a3;
}

- (void)setHasReflectiveInterval:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReflectiveInterval
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setValence:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_valence = a3;
}

- (void)setHasValence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValence
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableStateOfMind;
  -[HDCodableStateOfMind description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableStateOfMind dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableSample *sample;
  void *v5;
  char has;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *context;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_reflectiveInterval);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("reflectiveInterval"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_valence);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("valence"));

  }
  PBRepeatedInt64NSArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("labels"));

  PBRepeatedInt64NSArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("domains"));

  context = self->_context;
  if (context)
    objc_msgSend(v3, "setObject:forKey:", context, CFSTR("context"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableStateOfMindReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v8;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v8;
  }
  if (self->_labels.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v8;
      ++v6;
    }
    while (v6 < self->_labels.count);
  }
  if (self->_domains.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v8;
      ++v7;
    }
    while (v7 < self->_domains.count);
  }
  if (self->_context)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  id v12;

  v4 = a3;
  v12 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v12;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 7) = self->_reflectiveInterval;
    *((_BYTE *)v4 + 88) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_valence;
    *((_BYTE *)v4 + 88) |= 2u;
  }
  if (-[HDCodableStateOfMind labelsCount](self, "labelsCount"))
  {
    objc_msgSend(v12, "clearLabels");
    v6 = -[HDCodableStateOfMind labelsCount](self, "labelsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v12, "addLabels:", -[HDCodableStateOfMind labelsAtIndex:](self, "labelsAtIndex:", i));
    }
  }
  if (-[HDCodableStateOfMind domainsCount](self, "domainsCount"))
  {
    objc_msgSend(v12, "clearDomains");
    v9 = -[HDCodableStateOfMind domainsCount](self, "domainsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v12, "addDomains:", -[HDCodableStateOfMind domainsAtIndex:](self, "domainsAtIndex:", j));
    }
  }
  if (self->_context)
    objc_msgSend(v12, "setContext:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_reflectiveInterval;
    *(_BYTE *)(v5 + 88) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 64) = self->_valence;
    *(_BYTE *)(v5 + 88) |= 2u;
  }
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  v9 = -[NSString copyWithZone:](self->_context, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  NSString *context;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 10))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_reflectiveInterval != *((_QWORD *)v4 + 7))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_18:
    v7 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_valence != *((double *)v4 + 8))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    goto LABEL_18;
  }
  if (!PBRepeatedInt64IsEqual() || !PBRepeatedInt64IsEqual())
    goto LABEL_18;
  context = self->_context;
  if ((unint64_t)context | *((_QWORD *)v4 + 9))
    v7 = -[NSString isEqual:](context, "isEqual:");
  else
    v7 = 1;
LABEL_19:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  double valence;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[HDCodableSample hash](self->_sample, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_reflectiveInterval;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  valence = self->_valence;
  v6 = -valence;
  if (valence >= 0.0)
    v6 = self->_valence;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  v10 = v4 ^ v3;
  v11 = v9 ^ PBRepeatedInt64Hash();
  v12 = v11 ^ PBRepeatedInt64Hash();
  return v10 ^ v12 ^ -[NSString hash](self->_context, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSample *sample;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  _QWORD *v15;

  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 10);
  v15 = v4;
  if (sample)
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableStateOfMind setSample:](self, "setSample:");
  }
  v4 = v15;
LABEL_7:
  v7 = *((_BYTE *)v4 + 88);
  if ((v7 & 1) != 0)
  {
    self->_reflectiveInterval = *((_QWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 88);
  }
  if ((v7 & 2) != 0)
  {
    self->_valence = *((double *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
  v8 = objc_msgSend(v4, "labelsCount");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
      -[HDCodableStateOfMind addLabels:](self, "addLabels:", objc_msgSend(v15, "labelsAtIndex:", i));
  }
  v11 = objc_msgSend(v15, "domainsCount");
  if (v11)
  {
    v12 = v11;
    for (j = 0; j != v12; ++j)
      -[HDCodableStateOfMind addDomains:](self, "addDomains:", objc_msgSend(v15, "domainsAtIndex:", j));
  }
  v14 = v15;
  if (v15[9])
  {
    -[HDCodableStateOfMind setContext:](self, "setContext:");
    v14 = v15;
  }

}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (int64_t)reflectiveInterval
{
  return self->_reflectiveInterval;
}

- (double)valence
{
  return self->_valence;
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[HDCodableStateOfMind sample](self, "sample"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "applyToObject:", v4),
        v5,
        v6))
  {
    -[HDCodableStateOfMind reflectiveInterval](self, "reflectiveInterval");
    objc_msgSend(v4, "_setKind:", HKStateOfMindKindFromReflectiveInterval());
    -[HDCodableStateOfMind valence](self, "valence");
    objc_msgSend(v4, "_setValence:");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HDCodableStateOfMind labelsCount](self, "labelsCount"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCodableStateOfMind labels](self, "labels")[8 * v8]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v9);

        ++v8;
      }
      while (v8 < -[HDCodableStateOfMind labelsCount](self, "labelsCount"));
    }
    v10 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "_setLabels:", v10);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HDCodableStateOfMind domainsCount](self, "domainsCount"))
    {
      v12 = 0;
      do
      {
        v13 = (void *)MEMORY[0x1E0CB37E8];
        -[HDCodableStateOfMind domains](self, "domains");
        objc_msgSend(v13, "numberWithInteger:", HKStateOfMindAssociationFromDomain());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v14);

        ++v12;
      }
      while (v12 < -[HDCodableStateOfMind domainsCount](self, "domainsCount"));
    }
    v15 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v4, "_setAssociations:", v15);

    -[HDCodableStateOfMind context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setContext:", v16);

    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
