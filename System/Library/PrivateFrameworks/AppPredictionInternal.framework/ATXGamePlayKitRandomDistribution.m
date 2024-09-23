@implementation ATXGamePlayKitRandomDistribution

- (ATXGamePlayKitRandomDistribution)init
{
  void *v3;
  ATXGamePlayKitRandomDistribution *v4;

  +[ATXGamePlayKitRandomSource sharedRandom](ATXGamePlayKitRandomSource, "sharedRandom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXGamePlayKitRandomDistribution initWithRandomSource:lowestValue:highestValue:](self, "initWithRandomSource:lowestValue:highestValue:", v3, 0, 0);

  return v4;
}

- (ATXGamePlayKitRandomDistribution)initWithRandomSource:(id)a3 lowestValue:(int64_t)a4 highestValue:(int64_t)a5
{
  id v9;
  ATXGamePlayKitRandomDistribution *v10;
  ATXGamePlayKitRandomDistribution *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXGamePlayKitRandomDistribution;
  v10 = -[ATXGamePlayKitRandomDistribution init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_source, a3);
    v11->_lowest = a4;
    v11->_highest = a5;
  }

  return v11;
}

- (unint64_t)numberOfPossibleOutcomes
{
  return self->_highest - self->_lowest + 1;
}

- (int64_t)nextInt
{
  int64_t lowest;

  lowest = self->_lowest;
  return -[ATXGamePlayKitRandom nextIntWithUpperBound:](self->_source, "nextIntWithUpperBound:", self->_highest - lowest + 1)+ lowest;
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  int64_t lowest;
  unint64_t v6;
  unint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  lowest = self->_lowest;
  v6 = lowest & ~(lowest >> 63);
  if (v6 > a3)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v15[0] = CFSTR("lowestInclusive");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v15[1] = CFSTR("highestInclusive");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_highest);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v11;
    v15[2] = CFSTR("upper");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("upper bound provided is less than lowestInclusive"), v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v14);
  }
  v7 = self->_highest & ~(self->_highest >> 63);
  if (v7 >= a3 - 1)
    v7 = a3 - 1;
  return -[ATXGamePlayKitRandom nextIntWithUpperBound:](self->_source, "nextIntWithUpperBound:", v7 - lowest + 1) + v6;
}

- (float)nextUniform
{
  return (float)-[ATXGamePlayKitRandomDistribution nextInt](self, "nextInt") / (float)self->_highest;
}

- (BOOL)nextBool
{
  return -[ATXGamePlayKitRandom nextBool](self->_source, "nextBool");
}

+ (id)distributionWithLowestValue:(int64_t)a3 highestValue:(int64_t)a4
{
  void *v7;
  void *v8;

  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRandomSource:lowestValue:highestValue:", v7, a3, a4);

  return v8;
}

+ (id)distributionForDieWithSideCount:(int64_t)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRandomSource:lowestValue:highestValue:", v5, 1, a3);

  return v6;
}

+ (id)d6
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRandomSource:lowestValue:highestValue:", v3, 1, 6);

  return v4;
}

+ (id)d20
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRandomSource:lowestValue:highestValue:", v3, 1, 20);

  return v4;
}

- (int64_t)lowestValue
{
  return self->_lowest;
}

- (int64_t)highestValue
{
  return self->_highest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

@end
