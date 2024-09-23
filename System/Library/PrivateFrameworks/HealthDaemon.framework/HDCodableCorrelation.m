@implementation HDCodableCorrelation

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HDCodableCorrelation sample](self, "sample");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "applyToObject:", v4);

  return v6;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
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
  v8.super_class = (Class)HDCodableCorrelation;
  -[HDCodableCorrelation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableCorrelation dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableCorrelationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_sample)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  HDCodableSample *sample;

  sample = self->_sample;
  if (sample)
    objc_msgSend(a3, "setSample:", sample);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HDCodableSample *sample;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    sample = self->_sample;
    if ((unint64_t)sample | v4[1])
      v6 = -[HDCodableSample isEqual:](sample, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[HDCodableSample hash](self->_sample, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableSample *sample;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  sample = self->_sample;
  v6 = v4[1];
  if (sample)
  {
    if (v6)
    {
      v7 = v4;
      -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[HDCodableCorrelation setSample:](self, "setSample:");
    goto LABEL_6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
