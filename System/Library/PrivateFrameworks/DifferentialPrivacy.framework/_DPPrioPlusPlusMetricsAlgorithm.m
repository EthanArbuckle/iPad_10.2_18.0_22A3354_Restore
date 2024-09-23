@implementation _DPPrioPlusPlusMetricsAlgorithm

+ (id)initializeWithSecretSharingSigma:(double)a3 dimensionality:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSecretSharingSigma:dimensionality:", a4, a3);
}

- (_DPPrioPlusPlusMetricsAlgorithm)initWithSecretSharingSigma:(double)a3 dimensionality:(unint64_t)a4
{
  _DPPrioPlusPlusMetricsAlgorithm *v7;
  _DPPrioPlusPlusMetricsAlgorithm *v8;
  objc_super v10;

  if (+[_DPPrioPlusPlusNoiseGenerator isValidSigma:](_DPPrioPlusPlusNoiseGenerator, "isValidSigma:")
    && +[_DPPrioPlusPlusNoiseGenerator isValidDimension:](_DPPrioPlusPlusNoiseGenerator, "isValidDimension:", a4))
  {
    v10.receiver = self;
    v10.super_class = (Class)_DPPrioPlusPlusMetricsAlgorithm;
    v7 = -[_DPPrioPlusPlusMetricsAlgorithm init](&v10, sel_init);
    if (v7)
    {
      v7->_secretSharingSigma = a3;
      v7->_dimension = a4;
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)randomize:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_DPPrioPlusPlusMetricsAlgorithm dimension](self, "dimension");
  -[_DPPrioPlusPlusMetricsAlgorithm secretSharingSigma](self, "secretSharingSigma");
  +[_DPPrioPlusPlusNoiseGenerator randomize:dimension:stddev:](_DPPrioPlusPlusNoiseGenerator, "randomize:dimension:stddev:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("share1");
  v10[1] = CFSTR("share2");
  v11[0] = v4;
  v11[1] = v6;
  v10[2] = CFSTR("dimensionality");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[_DPPrioPlusPlusMetricsAlgorithm dimension](self, "dimension"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)secretSharingSigma
{
  return self->_secretSharingSigma;
}

- (unint64_t)dimension
{
  return self->_dimension;
}

@end
