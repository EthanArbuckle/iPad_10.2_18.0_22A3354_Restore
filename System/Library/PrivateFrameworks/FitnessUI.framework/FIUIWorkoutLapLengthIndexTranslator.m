@implementation FIUIWorkoutLapLengthIndexTranslator

- (FIUIWorkoutLapLengthIndexTranslator)initWithDistanceUnit:(id)a3
{
  id v5;
  FIUIWorkoutLapLengthIndexTranslator *v6;
  FIUIWorkoutLapLengthIndexTranslator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIUIWorkoutLapLengthIndexTranslator;
  v6 = -[FIUIWorkoutLapLengthIndexTranslator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_distanceUnit, a3);

  return v7;
}

- (double)valueTranslatedIntoDistanceUnit:(double)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;

  -[FIUIWorkoutLapLengthIndexTranslator distanceUnit](self, "distanceUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    -[FIUIWorkoutLapLengthIndexTranslator distanceUnit](self, "distanceUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "yardUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
    {
      return a3 * 0.9144;
    }
    else
    {
      v11 = (void *)MEMORY[0x24BDD3E50];
      -[FIUIWorkoutLapLengthIndexTranslator distanceUnit](self, "distanceUnit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "quantityWithUnit:doubleValue:", v12, a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValueForUnit:", v14);
      a3 = v15;

    }
  }
  return a3;
}

- (double)valueTranslatedFromDistanceUnit:(double)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;

  -[FIUIWorkoutLapLengthIndexTranslator distanceUnit](self, "distanceUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    -[FIUIWorkoutLapLengthIndexTranslator distanceUnit](self, "distanceUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "yardUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
    {
      return a3 / 0.9144;
    }
    else
    {
      v11 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "quantityWithUnit:doubleValue:", v12, a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[FIUIWorkoutLapLengthIndexTranslator distanceUnit](self, "distanceUnit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValueForUnit:", v14);
      a3 = v15;

    }
  }
  return a3;
}

- (double)valueForIndex:(int64_t)a3
{
  double v3;
  double result;

  v3 = (double)a3;
  if (a3 > 34)
    v3 = (double)a3 + -1.0;
  if (a3 == 34)
    v3 = 33.3333333;
  -[FIUIWorkoutLapLengthIndexTranslator valueTranslatedIntoDistanceUnit:](self, "valueTranslatedIntoDistanceUnit:", v3);
  return result;
}

- (int64_t)indexForValue:(double)a3
{
  double v3;
  double v5;

  -[FIUIWorkoutLapLengthIndexTranslator valueTranslatedFromDistanceUnit:](self, "valueTranslatedFromDistanceUnit:", a3);
  if (fabs(v3 + -33.3333333) < 0.01)
    return 34;
  v5 = round(v3);
  if (v3 >= 33.3333333)
    return (uint64_t)(v5 + 1.0);
  else
    return (uint64_t)v5;
}

- (HKUnit)distanceUnit
{
  return self->_distanceUnit;
}

- (void)setDistanceUnit:(id)a3
{
  objc_storeStrong((id *)&self->_distanceUnit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceUnit, 0);
}

@end
