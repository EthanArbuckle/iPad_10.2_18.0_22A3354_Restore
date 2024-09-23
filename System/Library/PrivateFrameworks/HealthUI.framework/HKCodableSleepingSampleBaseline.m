@implementation HKCodableSleepingSampleBaseline

- (BOOL)hasMiddle
{
  return self->_middle != 0;
}

- (BOOL)hasMedialRangeMinimum
{
  return self->_medialRangeMinimum != 0;
}

- (BOOL)hasMedialRangeMaximum
{
  return self->_medialRangeMaximum != 0;
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
  v8.super_class = (Class)HKCodableSleepingSampleBaseline;
  -[HKCodableSleepingSampleBaseline description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSleepingSampleBaseline dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableQuantity *middle;
  void *v5;
  HKCodableQuantity *medialRangeMinimum;
  void *v7;
  HKCodableQuantity *medialRangeMaximum;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  middle = self->_middle;
  if (middle)
  {
    -[HKCodableQuantity dictionaryRepresentation](middle, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("middle"));

  }
  medialRangeMinimum = self->_medialRangeMinimum;
  if (medialRangeMinimum)
  {
    -[HKCodableQuantity dictionaryRepresentation](medialRangeMinimum, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("medialRangeMinimum"));

  }
  medialRangeMaximum = self->_medialRangeMaximum;
  if (medialRangeMaximum)
  {
    -[HKCodableQuantity dictionaryRepresentation](medialRangeMaximum, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("medialRangeMaximum"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSleepingSampleBaselineReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_middle)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_medialRangeMinimum)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_medialRangeMaximum)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_middle)
  {
    objc_msgSend(v4, "setMiddle:");
    v4 = v5;
  }
  if (self->_medialRangeMinimum)
  {
    objc_msgSend(v5, "setMedialRangeMinimum:");
    v4 = v5;
  }
  if (self->_medialRangeMaximum)
  {
    objc_msgSend(v5, "setMedialRangeMaximum:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableQuantity copyWithZone:](self->_middle, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[HKCodableQuantity copyWithZone:](self->_medialRangeMinimum, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[HKCodableQuantity copyWithZone:](self->_medialRangeMaximum, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HKCodableQuantity *middle;
  HKCodableQuantity *medialRangeMinimum;
  HKCodableQuantity *medialRangeMaximum;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((middle = self->_middle, !((unint64_t)middle | v4[3]))
     || -[HKCodableQuantity isEqual:](middle, "isEqual:"))
    && ((medialRangeMinimum = self->_medialRangeMinimum, !((unint64_t)medialRangeMinimum | v4[2]))
     || -[HKCodableQuantity isEqual:](medialRangeMinimum, "isEqual:")))
  {
    medialRangeMaximum = self->_medialRangeMaximum;
    if ((unint64_t)medialRangeMaximum | v4[1])
      v8 = -[HKCodableQuantity isEqual:](medialRangeMaximum, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[HKCodableQuantity hash](self->_middle, "hash");
  v4 = -[HKCodableQuantity hash](self->_medialRangeMinimum, "hash") ^ v3;
  return v4 ^ -[HKCodableQuantity hash](self->_medialRangeMaximum, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableQuantity *middle;
  uint64_t v6;
  HKCodableQuantity *medialRangeMinimum;
  uint64_t v8;
  HKCodableQuantity *medialRangeMaximum;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  middle = self->_middle;
  v6 = v4[3];
  v11 = v4;
  if (middle)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableQuantity mergeFrom:](middle, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableSleepingSampleBaseline setMiddle:](self, "setMiddle:");
  }
  v4 = v11;
LABEL_7:
  medialRangeMinimum = self->_medialRangeMinimum;
  v8 = v4[2];
  if (medialRangeMinimum)
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableQuantity mergeFrom:](medialRangeMinimum, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableSleepingSampleBaseline setMedialRangeMinimum:](self, "setMedialRangeMinimum:");
  }
  v4 = v11;
LABEL_13:
  medialRangeMaximum = self->_medialRangeMaximum;
  v10 = v4[1];
  if (medialRangeMaximum)
  {
    if (v10)
    {
      -[HKCodableQuantity mergeFrom:](medialRangeMaximum, "mergeFrom:");
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[HKCodableSleepingSampleBaseline setMedialRangeMaximum:](self, "setMedialRangeMaximum:");
    goto LABEL_18;
  }

}

- (HKCodableQuantity)middle
{
  return self->_middle;
}

- (void)setMiddle:(id)a3
{
  objc_storeStrong((id *)&self->_middle, a3);
}

- (HKCodableQuantity)medialRangeMinimum
{
  return self->_medialRangeMinimum;
}

- (void)setMedialRangeMinimum:(id)a3
{
  objc_storeStrong((id *)&self->_medialRangeMinimum, a3);
}

- (HKCodableQuantity)medialRangeMaximum
{
  return self->_medialRangeMaximum;
}

- (void)setMedialRangeMaximum:(id)a3
{
  objc_storeStrong((id *)&self->_medialRangeMaximum, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middle, 0);
  objc_storeStrong((id *)&self->_medialRangeMinimum, 0);
  objc_storeStrong((id *)&self->_medialRangeMaximum, 0);
}

@end
