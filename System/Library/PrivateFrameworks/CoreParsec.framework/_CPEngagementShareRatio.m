@implementation _CPEngagementShareRatio

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _CPEngagementShareRatioReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  float v5;
  id v6;

  v6 = a3;
  -[_CPEngagementShareRatio shareOfEngagements](self, "shareOfEngagements");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPEngagementShareRatio shareOfInternetEngagements](self, "shareOfInternetEngagements");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float shareOfEngagements;
  float v6;
  BOOL v7;
  float shareOfInternetEngagements;
  float v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (shareOfEngagements = self->_shareOfEngagements, objc_msgSend(v4, "shareOfEngagements"), shareOfEngagements == v6))
  {
    shareOfInternetEngagements = self->_shareOfInternetEngagements;
    objc_msgSend(v4, "shareOfInternetEngagements");
    v7 = shareOfInternetEngagements == v9;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  float shareOfEngagements;
  double v4;
  long double v5;
  unint64_t v6;
  float shareOfInternetEngagements;
  double v8;
  long double v9;

  shareOfEngagements = self->_shareOfEngagements;
  v4 = shareOfEngagements;
  if (shareOfEngagements < 0.0)
    v4 = -shareOfEngagements;
  v5 = round(v4);
  v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  shareOfInternetEngagements = self->_shareOfInternetEngagements;
  v8 = shareOfInternetEngagements;
  if (shareOfInternetEngagements < 0.0)
    v8 = -shareOfInternetEngagements;
  v9 = round(v8);
  return ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
}

- (float)shareOfEngagements
{
  return self->_shareOfEngagements;
}

- (void)setShareOfEngagements:(float)a3
{
  self->_shareOfEngagements = a3;
}

- (float)shareOfInternetEngagements
{
  return self->_shareOfInternetEngagements;
}

- (void)setShareOfInternetEngagements:(float)a3
{
  self->_shareOfInternetEngagements = a3;
}

@end
