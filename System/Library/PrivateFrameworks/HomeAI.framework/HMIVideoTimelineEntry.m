@implementation HMIVideoTimelineEntry

- (HMIVideoTimelineEntry)initWithTime:(id *)a3 date:(id)a4
{
  id v7;
  HMIVideoTimelineEntry *v8;
  HMIVideoTimelineEntry *v9;
  int64_t var3;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMIVideoTimelineEntry;
  v8 = -[HMIVideoTimelineEntry init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    var3 = a3->var3;
    *(_OWORD *)&v8->_time.value = *(_OWORD *)&a3->var0;
    v8->_time.epoch = var3;
    objc_storeStrong((id *)&v8->_date, a4);
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  $95D729B680665BEAEFA1D6FCA8238556 time;

  v3 = (void *)MEMORY[0x24BDD17C8];
  time = self->_time;
  HMICMTimeDescription((CMTime *)&time);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Time: %@, Date: %@"), v4, self->_date);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
