@implementation HKCodableClosedRange

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HKCodableClosedRange;
  -[HKCodableClosedRange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableClosedRange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lowerBound);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("lowerBound"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_upperBound);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("upperBound"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableClosedRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_lowerBound;
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_upperBound;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_lowerBound;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_upperBound;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_lowerBound == v4[1]
    && self->_upperBound == v4[2];

  return v5;
}

- (unint64_t)hash
{
  double lowerBound;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double upperBound;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  unint64_t v19;

  lowerBound = self->_lowerBound;
  v4 = -lowerBound;
  if (lowerBound >= 0.0)
    v4 = self->_lowerBound;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  upperBound = self->_upperBound;
  v13 = -upperBound;
  if (upperBound >= 0.0)
    v13 = self->_upperBound;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  v17 = v16 + (unint64_t)v15;
  v18 = fabs(v15);
  if (v15 <= 0.0)
    v17 = v16;
  v19 = v16 - (unint64_t)v18;
  if (v15 >= 0.0)
    v19 = v17;
  return v19 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_lowerBound = *((double *)a3 + 1);
  self->_upperBound = *((double *)a3 + 2);
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (void)setLowerBound:(double)a3
{
  self->_lowerBound = a3;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (void)setUpperBound:(double)a3
{
  self->_upperBound = a3;
}

@end
