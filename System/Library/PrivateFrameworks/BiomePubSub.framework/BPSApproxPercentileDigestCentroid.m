@implementation BPSApproxPercentileDigestCentroid

- (BPSApproxPercentileDigestCentroid)initWithMeanAndWeight:(float)a3 weight:(unsigned int)a4
{
  BPSApproxPercentileDigestCentroid *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BPSApproxPercentileDigestCentroid;
  result = -[BPSApproxPercentileDigestCentroid init](&v7, sel_init);
  if (result)
  {
    result->_mean = a3;
    result->_weight = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  unsigned int v10;
  int v11;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BPSApproxPercentileDigestCentroid mean](self, "mean");
    v7 = v6;
    objc_msgSend(v5, "mean");
    v9 = v8;
    v10 = -[BPSApproxPercentileDigestCentroid weight](self, "weight");
    v11 = objc_msgSend(v5, "weight");

    v13 = v7 == v9 && v10 == v11;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_weight ^ LODWORD(self->_mean);
}

- (float)mean
{
  return self->_mean;
}

- (void)setMean:(float)a3
{
  self->_mean = a3;
}

- (unsigned)weight
{
  return self->_weight;
}

- (void)setWeight:(unsigned int)a3
{
  self->_weight = a3;
}

@end
