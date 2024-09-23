@implementation NSMeasurement(CAF)

- (id)stepWithDoubleValue:()CAF
{
  double v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = fabs(a2);
  v5 = objc_alloc(MEMORY[0x24BDD1660]);
  objc_msgSend(a1, "unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDoubleValue:unit:", v6, v4);

  if (a2 <= 0.0)
    objc_msgSend(a1, "measurementBySubtractingMeasurement:", v7);
  else
    objc_msgSend(a1, "measurementByAddingMeasurement:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
