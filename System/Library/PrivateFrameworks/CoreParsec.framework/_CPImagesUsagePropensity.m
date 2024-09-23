@implementation _CPImagesUsagePropensity

- (BOOL)readFrom:(id)a3
{
  double v3;

  return _CPImagesUsagePropensityReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_CPImagesUsagePropensity zkw](self, "zkw");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPImagesUsagePropensity recentResult](self, "recentResult");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPImagesUsagePropensity other](self, "other");
  if (v6 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPImagesUsagePropensity querySuggestion](self, "querySuggestion");
  if (v7 != 0.0)
    PBDataWriterWriteFloatField();
  -[_CPImagesUsagePropensity image](self, "image");
  if (v8 != 0.0)
    PBDataWriterWriteFloatField();
  v9 = -[_CPImagesUsagePropensity totalEngagements](self, "totalEngagements");
  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteInt32Field();
    v10 = v11;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float zkw;
  float v6;
  float recentResult;
  float v8;
  float other;
  float v10;
  float querySuggestion;
  float v12;
  float image;
  float v14;
  BOOL v15;
  int totalEngagements;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_7;
  zkw = self->_zkw;
  objc_msgSend(v4, "zkw");
  if (zkw != v6)
    goto LABEL_7;
  recentResult = self->_recentResult;
  objc_msgSend(v4, "recentResult");
  if (recentResult != v8)
    goto LABEL_7;
  other = self->_other;
  objc_msgSend(v4, "other");
  if (other == v10
    && (querySuggestion = self->_querySuggestion, objc_msgSend(v4, "querySuggestion"), querySuggestion == v12)
    && (image = self->_image, objc_msgSend(v4, "image"), image == v14))
  {
    totalEngagements = self->_totalEngagements;
    v15 = totalEngagements == objc_msgSend(v4, "totalEngagements");
  }
  else
  {
LABEL_7:
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  float zkw;
  double v4;
  long double v5;
  unint64_t v6;
  float recentResult;
  double v8;
  long double v9;
  unint64_t v10;
  float other;
  double v12;
  long double v13;
  unint64_t v14;
  float querySuggestion;
  double v16;
  long double v17;
  unint64_t v18;
  float image;
  double v20;
  long double v21;

  zkw = self->_zkw;
  v4 = zkw;
  if (zkw < 0.0)
    v4 = -zkw;
  v5 = round(v4);
  v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  recentResult = self->_recentResult;
  v8 = recentResult;
  if (recentResult < 0.0)
    v8 = -recentResult;
  v9 = round(v8);
  v10 = ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
  other = self->_other;
  v12 = other;
  if (other < 0.0)
    v12 = -other;
  v13 = round(v12);
  v14 = (unint64_t)(fmod(v13, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v12 - v13, 0x40uLL);
  querySuggestion = self->_querySuggestion;
  v16 = querySuggestion;
  if (querySuggestion < 0.0)
    v16 = -querySuggestion;
  v17 = round(v16);
  v18 = (unint64_t)(fmod(v17, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v16 - v17, 0x40uLL);
  image = self->_image;
  v20 = image;
  if (image < 0.0)
    v20 = -image;
  v21 = round(v20);
  return v10 ^ v14 ^ (2654435761 * self->_totalEngagements) ^ v18 ^ ((unint64_t)(fmod(v21, 1.84467441e19)
                                                                                        * 2654435760.0)
                                                                     + vcvtd_n_u64_f64(v20 - v21, 0x40uLL));
}

- (float)zkw
{
  return self->_zkw;
}

- (void)setZkw:(float)a3
{
  self->_zkw = a3;
}

- (float)recentResult
{
  return self->_recentResult;
}

- (void)setRecentResult:(float)a3
{
  self->_recentResult = a3;
}

- (float)other
{
  return self->_other;
}

- (void)setOther:(float)a3
{
  self->_other = a3;
}

- (float)querySuggestion
{
  return self->_querySuggestion;
}

- (void)setQuerySuggestion:(float)a3
{
  self->_querySuggestion = a3;
}

- (float)image
{
  return self->_image;
}

- (void)setImage:(float)a3
{
  self->_image = a3;
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
