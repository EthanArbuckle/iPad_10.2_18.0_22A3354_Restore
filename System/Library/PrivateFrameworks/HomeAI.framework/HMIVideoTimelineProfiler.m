@implementation HMIVideoTimelineProfiler

- (HMIVideoTimelineProfiler)initWithMaxCapacity:(int64_t)a3
{
  HMIVideoTimelineProfiler *v4;
  HMIVideoTimeline *v5;
  HMIVideoTimeline *timeline;
  HMITimeIntervalAverage *v7;
  HMITimeIntervalAverage *average;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMIVideoTimelineProfiler;
  v4 = -[HMIVideoTimelineProfiler init](&v10, sel_init);
  if (v4)
  {
    v5 = -[HMIVideoTimeline initWithMaxCapacity:]([HMIVideoTimeline alloc], "initWithMaxCapacity:", a3);
    timeline = v4->_timeline;
    v4->_timeline = v5;

    v7 = -[HMITimeIntervalAverage initWithMaxCapacity:]([HMITimeIntervalAverage alloc], "initWithMaxCapacity:", 32);
    average = v4->_average;
    v4->_average = v7;

  }
  return v4;
}

- (void)startedAtTime:(id *)a3
{
  HMIVideoTimeline *timeline;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  timeline = self->_timeline;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  -[HMIVideoTimeline addDate:atTime:](timeline, "addDate:atTime:", v5, &v6);

}

- (void)endedAtTime:(id *)a3
{
  HMIVideoTimeline *timeline;
  void *v5;
  HMITimeIntervalAverage *average;
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  timeline = self->_timeline;
  v8 = *a3;
  -[HMIVideoTimeline dateAtTime:](timeline, "dateAtTime:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  average = self->_average;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v5);
  -[HMITimeIntervalAverage addValue:](average, "addValue:");

}

- (double)averageTime
{
  double result;

  -[HMITimeIntervalAverage value](self->_average, "value");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_average, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
}

@end
