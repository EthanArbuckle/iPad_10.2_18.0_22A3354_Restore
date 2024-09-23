@implementation _DPPrioPlusPlusAlgorithm

+ (id)initializeWithSigma:(double)a3 secretSharingSigma:(double)a4 dimensionality:(unint64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSigma:secretSharingSigma:dimensionality:", a5, a3, a4);
}

- (_DPPrioPlusPlusAlgorithm)initWithSigma:(double)a3 secretSharingSigma:(double)a4 dimensionality:(unint64_t)a5
{
  _DPPrioPlusPlusAlgorithm *v9;
  _DPPrioPlusPlusAlgorithm *v10;
  objc_super v12;

  if (+[_DPPrioPlusPlusNoiseGenerator isValidSigma:](_DPPrioPlusPlusNoiseGenerator, "isValidSigma:")
    && +[_DPPrioPlusPlusNoiseGenerator isValidSigma:](_DPPrioPlusPlusNoiseGenerator, "isValidSigma:", a4)
    && +[_DPPrioPlusPlusNoiseGenerator isValidDimension:](_DPPrioPlusPlusNoiseGenerator, "isValidDimension:", a5))
  {
    v12.receiver = self;
    v12.super_class = (Class)_DPPrioPlusPlusAlgorithm;
    v9 = -[_DPPrioPlusPlusAlgorithm init](&v12, sel_init);
    if (v9)
    {
      v9->_sigma = a3;
      v9->_secretSharingSigma = a4;
      v9->_dimension = a5;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)randomize:(id)a3
{
  id v4;
  double v5;
  unint64_t v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithData:", a3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(float *)&v5 = _DPClipNorm((float *)objc_msgSend(v4, "mutableBytes"), (unint64_t)objc_msgSend(v4, "length") >> 2, 1.0);
  v6 = -[_DPPrioPlusPlusAlgorithm dimension](self, "dimension", v5);
  -[_DPPrioPlusPlusAlgorithm sigma](self, "sigma");
  v7 = +[_DPPrioPlusPlusNoiseGenerator randomize:dimension:stddev:](_DPPrioPlusPlusNoiseGenerator, "randomize:dimension:stddev:", v4, v6);
  v8 = -[_DPPrioPlusPlusAlgorithm dimension](self, "dimension");
  -[_DPPrioPlusPlusAlgorithm secretSharingSigma](self, "secretSharingSigma");
  +[_DPPrioPlusPlusNoiseGenerator randomize:dimension:stddev:](_DPPrioPlusPlusNoiseGenerator, "randomize:dimension:stddev:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("share1");
  v13[1] = CFSTR("share2");
  v14[0] = v4;
  v14[1] = v9;
  v13[2] = CFSTR("dimensionality");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[_DPPrioPlusPlusAlgorithm dimension](self, "dimension"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)sigma
{
  return self->_sigma;
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
