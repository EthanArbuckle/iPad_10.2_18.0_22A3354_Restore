@implementation HDDemoDataStatisticsSampleGenerator

- (HDDemoDataStatisticsSampleGenerator)init
{
  char *v2;
  HDDemoDataStatisticsSampleGenerator *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataStatisticsSampleGenerator;
  v2 = -[HDDemoDataBaseSampleGenerator init](&v6, sel_init);
  v3 = (HDDemoDataStatisticsSampleGenerator *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 40) = xmmword_1B7F3B3C0;
    v2[64] = 0;
    v4 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = 0;

  }
  return v3;
}

- (HDDemoDataStatisticsSampleGenerator)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  HDDemoDataStatisticsSampleGenerator *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *pseudoRandomDoubles;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDDemoDataStatisticsSampleGenerator;
  v5 = -[HDDemoDataBaseSampleGenerator initWithCoder:](&v13, sel_initWithCoder_, v4);
  v6 = (HDDemoDataStatisticsSampleGenerator *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 40) = xmmword_1B7F3B3C0;
    v5[64] = 0;
    v7 = (void *)MEMORY[0x1E0C99E60];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("HDDemoDataStatisticsSampleGeneratorPseudoRandomDoublesKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    pseudoRandomDoubles = v6->_pseudoRandomDoubles;
    v6->_pseudoRandomDoubles = (NSArray *)v10;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataStatisticsSampleGenerator;
  -[HDDemoDataBaseSampleGenerator encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_pseudoRandomDoubles, CFSTR("HDDemoDataStatisticsSampleGeneratorPseudoRandomDoublesKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint32_t v9;
  NSArray *pseudoRandomDoubles;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDDemoDataStatisticsSampleGenerator;
  -[HDDemoDataBaseSampleGenerator setupWithDemoDataGenerator:](&v11, sel_setupWithDemoDataGenerator_, v4);
  if (!-[HDDemoDataBaseSampleGenerator createdFromNSKeyedUnarchiver](self, "createdFromNSKeyedUnarchiver"))
  {
    if (self)
    {
      v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      for (i = 1; i != 101; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)i / 100.0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v5, "addObject:", v7);

      }
      v8 = 0;
      v9 = 100;
      do
      {
        -[NSArray exchangeObjectAtIndex:withObjectAtIndex:](v5, "exchangeObjectAtIndex:withObjectAtIndex:", v8, v8 + arc4random_uniform(v9));
        ++v8;
        --v9;
      }
      while (v8 != 100);
    }
    else
    {
      v5 = 0;
    }
    pseudoRandomDoubles = self->_pseudoRandomDoubles;
    self->_pseudoRandomDoubles = v5;

  }
}

- (double)randomDoubleFromGenerator
{
  return std::normal_distribution<double>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)&self->_distribution, &self->_generator.__x_, &self->_distribution.__p_.__mean_);
}

- (double)pseudoRandomDoubleFromTime:(double)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSArray objectAtIndexedSubscript:](self->_pseudoRandomDoubles, "objectAtIndexedSubscript:", (uint64_t)(a3 * 15485863.0) % -[NSArray count](self->_pseudoRandomDoubles, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)computeNoiseFromTime:(double)a3 stdDev:(double)a4
{
  double result;
  double v7;

  result = 0.0;
  if (self)
  {
    if (a4 != 0.0)
    {
      -[HDDemoDataStatisticsSampleGenerator pseudoRandomDoubleFromTime:](self, "pseudoRandomDoubleFromTime:", a3);
      return 0.0 - (a4 - (a4 + a4) * v7);
    }
  }
  return result;
}

- (double)computeStatisticalTimeFromCurrentTime:(double)a3 mean:(double)a4 stdDev:(double)a5
{
  double v6;

  -[HDDemoDataStatisticsSampleGenerator computeNoiseFromTime:stdDev:](self, "computeNoiseFromTime:stdDev:", a3, a5);
  return fabs(v6) + a4;
}

- (double)randomSampleFromNormalDistributionWithMean:(double)a3 stdDev:(double)a4
{
  double v5[3];
  char v6;

  v5[0] = a3;
  v5[1] = a4;
  v6 = 0;
  return std::normal_distribution<double>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)v5, &self->_generator.__x_, v5);
}

- (id)_pseudoRandomDoubles
{
  return self->_pseudoRandomDoubles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pseudoRandomDoubles, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 8) = 1;
  *(_OWORD *)((char *)self + 40) = xmmword_1B7F3B3D0;
  *((_BYTE *)self + 64) = 0;
  return self;
}

@end
