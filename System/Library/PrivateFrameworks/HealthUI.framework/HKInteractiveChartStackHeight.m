@implementation HKInteractiveChartStackHeight

- (HKInteractiveChartStackHeight)initWithKind:(unint64_t)a3 heightValue:(double)a4
{
  HKInteractiveChartStackHeight *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKInteractiveChartStackHeight;
  result = -[HKInteractiveChartStackHeight init](&v7, sel_init);
  if (result)
  {
    result->_kind = a3;
    result->_heightValue = a4;
  }
  return result;
}

- (id)debugDescription
{
  unint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;

  v3 = -[HKInteractiveChartStackHeight kind](self, "kind");
  v4 = CFSTR("Unknown");
  if (v3 == 1)
    v4 = CFSTR("Points");
  if (v3)
    v5 = v4;
  else
    v5 = CFSTR("Ratio");
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[HKInteractiveChartStackHeight heightValue](self, "heightValue");
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%lg %@"), v7, v5);
}

+ (id)percentStackHeights:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_10);
}

HKInteractiveChartStackHeight *__53__HKInteractiveChartStackHeight_percentStackHeights___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HKInteractiveChartStackHeight *v3;
  double v4;
  double v5;

  v2 = a2;
  v3 = [HKInteractiveChartStackHeight alloc];
  objc_msgSend(v2, "doubleValue");
  v5 = v4;

  return -[HKInteractiveChartStackHeight initWithKind:heightValue:](v3, "initWithKind:heightValue:", 0, v5);
}

- (unint64_t)kind
{
  return self->_kind;
}

- (double)heightValue
{
  return self->_heightValue;
}

@end
