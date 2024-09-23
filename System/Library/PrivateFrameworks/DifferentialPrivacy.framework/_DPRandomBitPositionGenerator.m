@implementation _DPRandomBitPositionGenerator

- (_DPRandomBitPositionGenerator)init
{

  return 0;
}

- (_DPRandomBitPositionGenerator)initWithDimensionality:(unint64_t)a3
{
  _DPRandomBitPositionGenerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DPRandomBitPositionGenerator;
  result = -[_DPRandomBitPositionGenerator init](&v5, sel_init);
  if (result)
    result->_m = a3;
  return result;
}

+ (_DPRandomBitPositionGenerator)generatorWithDimensionality:(unint64_t)a3
{
  return (_DPRandomBitPositionGenerator *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithDimensionality:", a3);
}

- (unint64_t)sample
{
  return (unint64_t)(uniformRandomProbabilityExcludingOne() * (double)self->_m);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { m=%ld }"), v5, self->_m);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)m
{
  return self->_m;
}

@end
