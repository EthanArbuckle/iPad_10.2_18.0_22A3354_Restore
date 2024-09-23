@implementation GKRandomDistribution

- (GKRandomDistribution)init
{
  void *v3;
  GKRandomDistribution *v4;

  +[GKRandomSource sharedRandom](GKRandomSource, "sharedRandom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKRandomDistribution initWithRandomSource:lowestValue:highestValue:](self, "initWithRandomSource:lowestValue:highestValue:", v3, 0, 0);

  return v4;
}

- (GKRandomDistribution)initWithRandomSource:(id)source lowestValue:(NSInteger)lowestInclusive highestValue:(NSInteger)highestInclusive
{
  id v9;
  GKRandomDistribution *v10;
  GKRandomDistribution *v11;
  objc_super v13;

  v9 = source;
  v13.receiver = self;
  v13.super_class = (Class)GKRandomDistribution;
  v10 = -[GKRandomDistribution init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_source, source);
    v11->_lowest = lowestInclusive;
    v11->_highest = highestInclusive;
  }

  return v11;
}

- (NSUInteger)numberOfPossibleOutcomes
{
  return self->_highest - self->_lowest + 1;
}

- (NSInteger)nextInt
{
  int64_t lowest;

  lowest = self->_lowest;
  return -[GKRandom nextIntWithUpperBound:](self->_source, "nextIntWithUpperBound:", self->_highest - lowest + 1)
       + lowest;
}

- (NSUInteger)nextIntWithUpperBound:(NSUInteger)upperBound
{
  int64_t lowest;
  NSUInteger v4;
  unint64_t v5;
  void *v7;
  uint64_t v8;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  lowest = self->_lowest;
  v4 = lowest & ~(lowest >> 63);
  if (v4 > upperBound)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB8];
    v16[0] = CFSTR("lowestInclusive");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", lowest);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v16[1] = CFSTR("highestInclusive");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_highest);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    v16[2] = CFSTR("upper");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", upperBound);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, CFSTR("upper bound provided is less than lowestInclusive"), v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  v5 = self->_highest & ~(self->_highest >> 63);
  if (v5 >= upperBound - 1)
    v5 = upperBound - 1;
  return -[GKRandom nextIntWithUpperBound:](self->_source, "nextIntWithUpperBound:", v5 - lowest + 1) + v4;
}

- (float)nextUniform
{
  return (float)-[GKRandomDistribution nextInt](self, "nextInt") / (float)self->_highest;
}

- (BOOL)nextBool
{
  return -[GKRandom nextBool](self->_source, "nextBool");
}

+ (GKRandomDistribution)distributionWithLowestValue:(NSInteger)lowestInclusive highestValue:(NSInteger)highestInclusive
{
  void *v7;
  void *v8;

  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRandomSource:lowestValue:highestValue:", v7, lowestInclusive, highestInclusive);

  return (GKRandomDistribution *)v8;
}

+ (GKRandomDistribution)distributionForDieWithSideCount:(NSInteger)sideCount
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRandomSource:lowestValue:highestValue:", v5, 1, sideCount);

  return (GKRandomDistribution *)v6;
}

+ (GKRandomDistribution)d6
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRandomSource:lowestValue:highestValue:", v3, 1, 6);

  return (GKRandomDistribution *)v4;
}

+ (GKRandomDistribution)d20
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRandomSource:lowestValue:highestValue:", v3, 1, 20);

  return (GKRandomDistribution *)v4;
}

- (NSInteger)lowestValue
{
  return self->_lowest;
}

- (NSInteger)highestValue
{
  return self->_highest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

@end
