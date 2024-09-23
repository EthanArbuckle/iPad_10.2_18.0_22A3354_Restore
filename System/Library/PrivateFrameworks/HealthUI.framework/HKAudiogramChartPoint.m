@implementation HKAudiogramChartPoint

- (HKAudiogramChartPoint)initWithChartData:(id)a3
{
  id v5;
  HKAudiogramChartPoint *v6;
  void *v7;
  uint64_t v8;
  NSNumber *xValue;
  void *v10;
  double v11;
  uint64_t v12;
  NSNumber *yValue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKAudiogramChartPoint;
  v6 = -[HKAudiogramChartPoint init](&v15, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "frequencyHertz");
    +[HKAudiogramChartPoint axisValueFromFrequency:](HKAudiogramChartPoint, "axisValueFromFrequency:");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();
    xValue = v6->_xValue;
    v6->_xValue = (NSNumber *)v8;

    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "sensitivityDBHL");
    objc_msgSend(v10, "numberWithDouble:", -v11);
    v12 = objc_claimAutoreleasedReturnValue();
    yValue = v6->_yValue;
    v6->_yValue = (NSNumber *)v12;

    objc_storeStrong((id *)&v6->_chartData, a3);
  }

  return v6;
}

+ (double)axisValueFromFrequency:(double)a3
{
  return (log(a3) + -4.82831374) / 0.693147181;
}

+ (double)frequencyFromAxisValue:(double)a3
{
  return exp2(a3) * 125.0;
}

+ (id)chartPointsFromSensitivityPoints:(id)a3 isLeftEar:(BOOL)a4
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__HKAudiogramChartPoint_chartPointsFromSensitivityPoints_isLeftEar___block_invoke;
  v5[3] = &__block_descriptor_41_e37__16__0__HKAudiogramSensitivityPoint_8l;
  v5[4] = a1;
  v6 = a4;
  objc_msgSend(a3, "hk_map:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __68__HKAudiogramChartPoint_chartPointsFromSensitivityPoints_isLeftEar___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_chartPointFromSensitivityPoint:isLeftEar:", a2, *(unsigned __int8 *)(a1 + 40));
}

- (id)allYValues
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[HKAudiogramChartPoint yValue](self, "yValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_chartPointFromSensitivityPoint:(id)a3 isLeftEar:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  HKAudiogramChartData *v15;
  HKAudiogramChartPoint *v16;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "leftEarSensitivity");
  else
    objc_msgSend(v5, "rightEarSensitivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "frequency");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "hertzUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValueForUnit:", v9);
    v11 = v10;

    objc_msgSend(MEMORY[0x1E0CB6CD0], "decibelHearingLevelUnit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v12);
    v14 = v13;

    v15 = -[HKAudiogramChartData initWithFrequency:sensitivity:isLeftEar:]([HKAudiogramChartData alloc], "initWithFrequency:sensitivity:isLeftEar:", v4, v11, v14);
    v16 = -[HKAudiogramChartPoint initWithChartData:]([HKAudiogramChartPoint alloc], "initWithChartData:", v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSNumber)xValue
{
  return self->_xValue;
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (HKAudiogramChartData)chartData
{
  return self->_chartData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartData, 0);
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end
