@implementation BLSHFlipbookSpecification

- (BLSHFlipbookSpecification)initWithSoftMemoryLimit:(unint64_t)a3 frameCapacity:(int64_t)a4 framesPerSecond:(double)a5 minimumGapDuration:(double)a6 coaelscingEpsilon:(double)a7 minimumPrepareInterval:(double)a8 maximumRenderInterval:(double)a9
{
  BLSHFlipbookSpecification *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BLSHFlipbookSpecification;
  result = -[BLSHFlipbookSpecification init](&v17, sel_init);
  if (result)
  {
    result->_softMemoryLimit = a3;
    result->_frameCapacity = a4;
    result->_framesPerSecond = a5;
    result->_minimumGapDuration = a6;
    result->_coaelscingEpsilon = a7;
    result->_minimumPrepareInterval = a8;
    result->_maximumRenderInterval = a9;
  }
  return result;
}

- (BLSHFlipbookSpecification)initWithFrameCapacity:(unint64_t)a3 framesPerSecond:(double)a4 minimumGapDuration:(double)a5 coaelscingEpsilon:(double)a6 minimumPrepareInterval:(double)a7 maximumRenderInterval:(double)a8
{
  return -[BLSHFlipbookSpecification initWithSoftMemoryLimit:frameCapacity:framesPerSecond:minimumGapDuration:coaelscingEpsilon:minimumPrepareInterval:maximumRenderInterval:](self, "initWithSoftMemoryLimit:frameCapacity:framesPerSecond:minimumGapDuration:coaelscingEpsilon:minimumPrepareInterval:maximumRenderInterval:", -1, a3, a4, a5, a6, a7, a8);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromByteCount:", self->_softMemoryLimit);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("softMemoryLimit"));

  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_frameCapacity, CFSTR("frameCapacity"));
  v8 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("fps"), 1, self->_framesPerSecond);
  v9 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("minGap"), 1, self->_minimumGapDuration);
  v10 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("coaelscingEpsilon"), 1, self->_coaelscingEpsilon);
  v11 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("minimumPrepareInterval"), 1, self->_minimumPrepareInterval);
  v12 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("maximumRenderInterval"), 1, self->_maximumRenderInterval);
  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)softMemoryLimit
{
  return self->_softMemoryLimit;
}

- (int64_t)frameCapacity
{
  return self->_frameCapacity;
}

- (double)framesPerSecond
{
  return self->_framesPerSecond;
}

- (double)minimumGapDuration
{
  return self->_minimumGapDuration;
}

- (double)coaelscingEpsilon
{
  return self->_coaelscingEpsilon;
}

- (double)minimumPrepareInterval
{
  return self->_minimumPrepareInterval;
}

- (double)maximumRenderInterval
{
  return self->_maximumRenderInterval;
}

@end
