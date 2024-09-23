@implementation CVNLPInformationStream

- (CVNLPInformationStream)initWithDecodingWeight:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  CVNLPInformationStream *v10;

  v4 = a3;
  objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (CVNLPInformationStream *)objc_msgSend_initWithDecodingWeight_lowerBoundLogProbability_(self, v9, (uint64_t)v4, (uint64_t)v8);

  return v10;
}

- (CVNLPInformationStream)initWithDecodingWeight:(id)a3 lowerBoundLogProbability:(id)a4
{
  id v7;
  id v8;
  CVNLPInformationStream *v9;
  CVNLPInformationStream *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CVNLPInformationStream;
  v9 = -[CVNLPInformationStream init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_decodingWeight, a3);
    objc_storeStrong((id *)&v10->_lowerBoundLogProbability, a4);
    objc_msgSend_doubleValue(v7, v11, v12, v13);
    v10->_decodingWeightValue = v14;
    objc_msgSend_doubleValue(v8, v15, v16, v17);
    v10->_lowerBoundLogProbabilityValue = v18;
  }

  return v10;
}

- (double)decodingWeightValue
{
  return self->_decodingWeightValue;
}

- (double)lowerBoundLogProbabilityValue
{
  return self->_lowerBoundLogProbabilityValue;
}

+ (id)defaultDecodingWeight
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, 1.0);
}

+ (id)defaultLowerBoundLogProbability
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, -1.79769313e308);
}

- (NSNumber)decodingWeight
{
  return self->_decodingWeight;
}

- (NSNumber)lowerBoundLogProbability
{
  return self->_lowerBoundLogProbability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerBoundLogProbability, 0);
  objc_storeStrong((id *)&self->_decodingWeight, 0);
}

@end
