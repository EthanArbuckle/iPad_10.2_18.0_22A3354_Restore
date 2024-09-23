@implementation HMITimeIntervalAverage

- (HMITimeIntervalAverage)initWithMaxCapacity:(int64_t)a3
{
  HMITimeIntervalAverage *v4;
  MovingAverage *v5;
  MovingAverage *average;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMITimeIntervalAverage;
  v4 = -[HMITimeIntervalAverage init](&v8, sel_init);
  if (v4)
  {
    v5 = -[MovingAverage initWithWindowSize:]([MovingAverage alloc], "initWithWindowSize:", a3);
    average = v4->_average;
    v4->_average = v5;

  }
  return v4;
}

- (void)addValue:(double)a3
{
  MovingAverage *average;
  id v4;

  average = self->_average;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MovingAverage addNumber:](average, "addNumber:", v4);

}

- (double)value
{
  double result;

  -[MovingAverage movingAverage](self->_average, "movingAverage");
  return result;
}

- (double)valueForInterval:(double)a3 defaultValue:(double)a4
{
  double result;

  -[MovingAverage movingAverageForInterval:defaultValue:](self->_average, "movingAverageForInterval:defaultValue:", a3, a4);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_average, 0);
}

@end
