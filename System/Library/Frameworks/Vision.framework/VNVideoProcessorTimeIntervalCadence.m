@implementation VNVideoProcessorTimeIntervalCadence

- (VNVideoProcessorTimeIntervalCadence)initWithTimeInterval:(CFTimeInterval)timeInterval
{
  VNVideoProcessorTimeIntervalCadence *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNVideoProcessorTimeIntervalCadence;
  result = -[VNVideoProcessorTimeIntervalCadence init](&v5, sel_init);
  if (result)
    result->_timeInterval = timeInterval;
  return result;
}

- (unint64_t)hash
{
  double v2;

  -[VNVideoProcessorTimeIntervalCadence timeInterval](self, "timeInterval");
  if (v2 == 0.0)
    return 0;
  else
    return *(_QWORD *)&v2;
}

- (BOOL)isEqual:(id)a3
{
  VNVideoProcessorTimeIntervalCadence *v4;
  VNVideoProcessorTimeIntervalCadence *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = (VNVideoProcessorTimeIntervalCadence *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNVideoProcessorTimeIntervalCadence timeInterval](self, "timeInterval");
      v7 = v6;
      -[VNVideoProcessorTimeIntervalCadence timeInterval](v5, "timeInterval");
      v9 = v8;

      v10 = v7 == v9;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)populateVCPVideoProcessorRequestConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNVideoProcessorTimeIntervalCadence;
  v4 = a3;
  -[VNVideoProcessorCadence populateVCPVideoProcessorRequestConfiguration:](&v7, sel_populateVCPVideoProcessorRequestConfiguration_, v4);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[VNVideoProcessorTimeIntervalCadence timeInterval](self, "timeInterval", v7.receiver, v7.super_class);
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("VNVideoProcessingOptionTimeInterval"));

}

- (CFTimeInterval)timeInterval
{
  return self->_timeInterval;
}

@end
