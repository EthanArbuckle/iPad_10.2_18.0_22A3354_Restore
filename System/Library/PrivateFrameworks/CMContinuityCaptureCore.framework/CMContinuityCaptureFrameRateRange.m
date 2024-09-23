@implementation CMContinuityCaptureFrameRateRange

+ (id)frameRateRangeWithMinRate:(unsigned int)a3 maxFrameRate:(unsigned int)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMinFrameRate:maxFrameRate:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (CMContinuityCaptureFrameRateRange)initWithMinFrameRate:(unsigned int)a3 maxFrameRate:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  CMContinuityCaptureFrameRateRange *v6;
  uint64_t v7;
  NSNumber *minFrameRate;
  uint64_t v9;
  NSNumber *maxFrameRate;
  objc_super v12;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)CMContinuityCaptureFrameRateRange;
  v6 = -[CMContinuityCaptureFrameRateRange init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    minFrameRate = v6->_minFrameRate;
    v6->_minFrameRate = (NSNumber *)v7;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    maxFrameRate = v6->_maxFrameRate;
    v6->_maxFrameRate = (NSNumber *)v9;

  }
  return v6;
}

- (NSNumber)minFrameRate
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)maxFrameRate
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxFrameRate, 0);
  objc_storeStrong((id *)&self->_minFrameRate, 0);
}

@end
