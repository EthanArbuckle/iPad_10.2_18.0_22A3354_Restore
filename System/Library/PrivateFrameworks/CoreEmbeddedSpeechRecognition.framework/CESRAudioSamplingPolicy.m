@implementation CESRAudioSamplingPolicy

- (CESRAudioSamplingPolicy)initWithRuleDimension:(id)a3 samplingRate:(id)a4 numDimension:(int64_t)a5
{
  id v9;
  id v10;
  CESRAudioSamplingPolicy *v11;
  CESRAudioSamplingPolicy *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CESRAudioSamplingPolicy;
  v11 = -[CESRAudioSamplingPolicy init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ruleDimension, a3);
    objc_storeStrong((id *)&v12->_samplingRate, a4);
    v12->_numDimension = a5;
  }

  return v12;
}

- (BOOL)isMatchedSamplingDimension:(id)a3
{
  return -[CESRSamplingDimension matches:](self->_ruleDimension, "matches:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CESRAudioSamplingPolicy ruleDimension](self, "ruleDimension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CESRAudioSamplingPolicy samplingRate](self, "samplingRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("< ruleDimension=%@, samplingRate=%.2f, numDimension=%zd >"), v4, v6, -[CESRAudioSamplingPolicy numDimension](self, "numDimension"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CESRSamplingDimension)ruleDimension
{
  return self->_ruleDimension;
}

- (NSNumber)samplingRate
{
  return self->_samplingRate;
}

- (int64_t)numDimension
{
  return self->_numDimension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplingRate, 0);
  objc_storeStrong((id *)&self->_ruleDimension, 0);
}

@end
