@implementation _CPEngagementTriggerRatio

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _CPEngagementTriggerRatioReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  float v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_CPEngagementTriggerRatio go](self, "go");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPEngagementTriggerRatio tap](self, "tap");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();
  v6 = -[_CPEngagementTriggerRatio totalEngagements](self, "totalEngagements");
  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteInt32Field();
    v7 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float go;
  float v6;
  float tap;
  float v8;
  BOOL v9;
  int totalEngagements;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (go = self->_go, objc_msgSend(v4, "go"), go == v6)
    && (tap = self->_tap, objc_msgSend(v4, "tap"), tap == v8))
  {
    totalEngagements = self->_totalEngagements;
    v9 = totalEngagements == objc_msgSend(v4, "totalEngagements");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  float go;
  double v4;
  long double v5;
  unint64_t v6;
  float tap;
  double v8;
  long double v9;

  go = self->_go;
  v4 = go;
  if (go < 0.0)
    v4 = -go;
  v5 = round(v4);
  v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  tap = self->_tap;
  v8 = tap;
  if (tap < 0.0)
    v8 = -tap;
  v9 = round(v8);
  return v6 ^ (2654435761 * self->_totalEngagements) ^ ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0)
                                                        + vcvtd_n_u64_f64(v8 - v9, 0x40uLL));
}

- (float)go
{
  return self->_go;
}

- (void)setGo:(float)a3
{
  self->_go = a3;
}

- (float)tap
{
  return self->_tap;
}

- (void)setTap:(float)a3
{
  self->_tap = a3;
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
