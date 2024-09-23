@implementation _CPNewsUsagePropensity

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _CPNewsUsagePropensityReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  id v5;

  v5 = a3;
  -[_CPNewsUsagePropensity other](self, "other");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  if (-[_CPNewsUsagePropensity totalEngagements](self, "totalEngagements"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float other;
  float v6;
  BOOL v7;
  int totalEngagements;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (other = self->_other, objc_msgSend(v4, "other"), other == v6))
  {
    totalEngagements = self->_totalEngagements;
    v7 = totalEngagements == objc_msgSend(v4, "totalEngagements");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  float other;
  double v3;
  long double v4;

  other = self->_other;
  v3 = other;
  if (other < 0.0)
    v3 = -other;
  v4 = round(v3);
  return ((unint64_t)(fmod(v4, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v3 - v4, 0x40uLL)) ^ (2654435761 * self->_totalEngagements);
}

- (float)other
{
  return self->_other;
}

- (void)setOther:(float)a3
{
  self->_other = a3;
}

- (int)totalEngagements
{
  return self->_totalEngagements;
}

- (void)setTotalEngagements:(int)a3
{
  self->_totalEngagements = a3;
}

@end
