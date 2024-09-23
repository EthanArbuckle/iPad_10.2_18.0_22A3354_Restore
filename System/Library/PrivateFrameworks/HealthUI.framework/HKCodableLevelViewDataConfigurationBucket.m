@implementation HKCodableLevelViewDataConfigurationBucket

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HKCodableLevelViewDataConfigurationBucket;
  -[HKCodableLevelViewDataConfigurationBucket description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableLevelViewDataConfigurationBucket dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableClosedRange *range;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  range = self->_range;
  if (range)
  {
    -[HKCodableClosedRange dictionaryRepresentation](range, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("range"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_highlighted);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("highlighted"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableLevelViewDataConfigurationBucketReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_range)
    -[HKCodableLevelViewDataConfigurationBucket writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  HKCodableClosedRange *range;
  _BYTE *v5;

  range = self->_range;
  v5 = a3;
  objc_msgSend(v5, "setRange:", range);
  v5[16] = self->_highlighted;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableClosedRange copyWithZone:](self->_range, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_BYTE *)(v5 + 16) = self->_highlighted;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  HKCodableClosedRange *range;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((range = self->_range, !((unint64_t)range | *((_QWORD *)v4 + 1)))
     || -[HKCodableClosedRange isEqual:](range, "isEqual:")))
  {
    if (self->_highlighted)
      v6 = v4[16] != 0;
    else
      v6 = v4[16] == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_highlighted) ^ -[HKCodableClosedRange hash](self->_range, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HKCodableClosedRange *range;
  uint64_t v6;
  id v7;

  v4 = a3;
  range = self->_range;
  v6 = *((_QWORD *)v4 + 1);
  if (range)
  {
    if (v6)
    {
      v7 = v4;
      -[HKCodableClosedRange mergeFrom:](range, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[HKCodableLevelViewDataConfigurationBucket setRange:](self, "setRange:");
    goto LABEL_6;
  }
  self->_highlighted = *((_BYTE *)v4 + 16);

}

- (HKCodableClosedRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
  objc_storeStrong((id *)&self->_range, a3);
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[HKCodableLevelViewDataConfigurationBucket writeTo:]", "HKCodableLevelViewDataConfigurationBucket.m", 93, "self->_range != nil");
}

@end
