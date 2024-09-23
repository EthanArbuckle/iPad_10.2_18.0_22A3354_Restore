@implementation HMIVideoTimeline

- (HMIVideoTimeline)initWithMaxCapacity:(int64_t)a3
{
  HMIVideoTimeline *v4;
  HMIVideoEventBuffer *v5;
  HMIVideoEventBuffer *buffer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMIVideoTimeline;
  v4 = -[HMIVideoTimeline init](&v8, sel_init);
  if (v4)
  {
    v5 = -[HMIVideoEventBuffer initWithMaxCapacity:]([HMIVideoEventBuffer alloc], "initWithMaxCapacity:", a3);
    buffer = v4->_buffer;
    v4->_buffer = v5;

  }
  return v4;
}

- (void)addDate:(id)a3 atTime:(id *)a4
{
  HMIVideoEventBuffer *buffer;
  id v6;
  HMIVideoTimelineEntry *v7;
  HMIVideoTimelineEntry *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  buffer = self->_buffer;
  v6 = a3;
  v7 = [HMIVideoTimelineEntry alloc];
  v9 = *a4;
  v8 = -[HMIVideoTimelineEntry initWithTime:date:](v7, "initWithTime:date:", &v9, v6);

  -[HMIVideoEventBuffer addObject:](buffer, "addObject:", v8);
}

- (id)dateAtTime:(id *)a3
{
  HMIVideoTimelineEntry *v5;
  void *v6;
  HMIVideoTimelineEntry *v7;
  void *v8;
  void *v9;
  void *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v5 = [HMIVideoTimelineEntry alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *a3;
  v7 = -[HMIVideoTimelineEntry initWithTime:date:](v5, "initWithTime:date:", &v12, v6);

  -[HMIVideoEventBuffer neighborsOfObject:](self->_buffer, "neighborsOfObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (double)timeIntervalSinceDateAtTime:(id *)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a3;
  -[HMIVideoTimeline dateAtTime:](self, "dateAtTime:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v3);
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
