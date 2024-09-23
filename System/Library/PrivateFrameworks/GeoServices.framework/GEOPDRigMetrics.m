@implementation GEOPDRigMetrics

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDRigMetrics;
  -[GEOPDRigMetrics dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)GEOPDRigMetrics;
  -[GEOPDRigMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRigMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDRigMetrics _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 16))
    {
      PBRepeatedUInt32NSArray();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("occlusionScore");
      else
        v6 = CFSTR("occlusion_score");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDRigMetrics _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDRigMetricsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_occlusionScores;
  unint64_t v4;

  p_occlusionScores = &self->_occlusionScores;
  if (self->_occlusionScores.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < p_occlusionScores->count);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char IsEqual;

  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
    IsEqual = PBRepeatedUInt32IsEqual();
  else
    IsEqual = 0;

  return IsEqual;
}

- (unint64_t)hash
{
  return PBRepeatedUInt32Hash();
}

@end
