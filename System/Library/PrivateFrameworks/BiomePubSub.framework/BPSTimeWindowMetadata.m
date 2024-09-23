@implementation BPSTimeWindowMetadata

- (BPSTimeWindowMetadata)initWithDateInterval:(id)a3
{
  id v4;
  BPSTimeWindowMetadata *v5;
  uint64_t v6;
  NSDateInterval *dateInterval;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSTimeWindowMetadata;
  v5 = -[BPSTimeWindowMetadata init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

  }
  return v5;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
