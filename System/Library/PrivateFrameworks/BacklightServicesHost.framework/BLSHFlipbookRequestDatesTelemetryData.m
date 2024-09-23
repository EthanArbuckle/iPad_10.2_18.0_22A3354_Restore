@implementation BLSHFlipbookRequestDatesTelemetryData

- (BLSHFlipbookRequestDatesTelemetryData)initWithTimestamp:(double)a3 environmentIdentifiers:(id)a4 shortestInterval:(double)a5 averageInterval:(double)a6 longestInterval:(double)a7 completionDuration:(double)a8 didReset:(BOOL)a9 timedOutCount:(unsigned int)a10
{
  id v19;
  BLSHFlipbookRequestDatesTelemetryData *v20;
  BLSHFlipbookRequestDatesTelemetryData *v21;
  objc_super v23;

  v19 = a4;
  v23.receiver = self;
  v23.super_class = (Class)BLSHFlipbookRequestDatesTelemetryData;
  v20 = -[BLSHFlipbookRequestDatesTelemetryData init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_timestamp = a3;
    objc_storeStrong((id *)&v20->_environmentIdentifiers, a4);
    v21->_shortestInterval = a5;
    v21->_averageInterval = a6;
    v21->_longestInterval = a7;
    v21->_completionDuration = a8;
    v21->_didReset = a9;
    v21->_timedOutCount = a10;
  }

  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BLSShortLoggingStringForContinuousMachTime();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("timestamp"));

  v6 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("shortestInterval"), 1, self->_shortestInterval);
  v7 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("averageInterval"), 1, self->_averageInterval);
  v8 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("longestInterval"), 1, self->_longestInterval);
  v9 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("completionDuration"), 1, self->_completionDuration);
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", self->_didReset, CFSTR("didReset"));
  v11 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_timedOutCount, CFSTR("timedOutCount"));
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", self->_environmentIdentifiers, CFSTR("environments"), 1);
  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)firstEnvironmentIdentifier
{
  return (NSString *)-[NSArray firstObject](self->_environmentIdentifiers, "firstObject");
}

- (unsigned)environmentCount
{
  return -[NSArray count](self->_environmentIdentifiers, "count");
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSArray)environmentIdentifiers
{
  return self->_environmentIdentifiers;
}

- (double)shortestInterval
{
  return self->_shortestInterval;
}

- (double)averageInterval
{
  return self->_averageInterval;
}

- (double)longestInterval
{
  return self->_longestInterval;
}

- (double)completionDuration
{
  return self->_completionDuration;
}

- (BOOL)didReset
{
  return self->_didReset;
}

- (unint64_t)timedOutCount
{
  return self->_timedOutCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentIdentifiers, 0);
}

@end
