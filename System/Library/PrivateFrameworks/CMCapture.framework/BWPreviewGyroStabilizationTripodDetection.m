@implementation BWPreviewGyroStabilizationTripodDetection

- (BOOL)isStationary
{
  return self->_isStationary;
}

- (BOOL)isPhysicalTripod
{
  return self->_isPhysicalTripod;
}

- (BOOL)isLikelyPhysicalTripod
{
  return self->_isLikelyPhysicalTripod;
}

- (BOOL)empty
{
  return self->_ringCount == 0;
}

- (void)detectTripodStateUsingMaxAngleInstant:(float)a3 maxAngleAccumulate:(float)a4 frameRateNormalizationFactor:(float)a5
{
  double v8;
  double v9;

  -[BWPreviewGyroStabilizationTripodDetection _updateWithMaxAngleInstant:maxAngleAccumulate:](self, "_updateWithMaxAngleInstant:maxAngleAccumulate:");
  -[BWPreviewGyroStabilizationTripodDetection _isCameraStationary](self, "_isCameraStationary");
  *(float *)&v8 = a3;
  *(float *)&v9 = a5;
  -[BWPreviewGyroStabilizationTripodDetection _detectPhysicalTripodUsingMaxAngleInstant:frameRateNormalization:](self, "_detectPhysicalTripodUsingMaxAngleInstant:frameRateNormalization:", v8, v9);
}

- (void)_updateWithMaxAngleInstant:(float)a3 maxAngleAccumulate:(float)a4
{
  BOOL v4;
  int ringCount;
  uint64_t inputIndex;
  unsigned int v7;
  int v8;
  int v9;

  v4 = self->_tripodMaxAngleThresholdAccumulate >= a4 && self->_tripodMaxAngleThresholdInstant >= a3;
  ringCount = self->_ringCount;
  inputIndex = self->_inputIndex;
  self->_stationary[inputIndex] = v4;
  if (ringCount <= 59)
    self->_ringCount = ringCount + 1;
  v7 = 60
     * ((~(_DWORD)inputIndex
       + (((int)inputIndex + 1) >> 31)
       + (((_DWORD)inputIndex + 1) & ~(((int)inputIndex + 1) >> 31)))
      / 0x3C
      + ((inputIndex + 1) >> 31));
  v8 = v7 + inputIndex + 1;
  v9 = inputIndex + v7;
  if (v8 >= 59)
    v8 = 59;
  self->_inputIndex = (v9 - v8 + 60) % 0x3Cu - (60 - v8) + 1;
}

- (BOOL)_isCameraStationary
{
  BOOL v2;
  uint64_t ringCount;
  BOOL *stationary;

  v2 = 1;
  self->_isStationary = 1;
  ringCount = self->_ringCount;
  if ((int)ringCount >= 1)
  {
    stationary = self->_stationary;
    while (*stationary++)
    {
      if (!--ringCount)
        return 1;
    }
    v2 = 0;
    self->_isStationary = 0;
  }
  return v2;
}

- (void)_detectPhysicalTripodUsingMaxAngleInstant:(float)a3 frameRateNormalization:(float)a4
{
  float physicalTripodLikelyMaxAngleThreshold;
  int previousLikelyPhysicalTripodCount;
  int v6;
  BOOL v7;
  int v8;

  physicalTripodLikelyMaxAngleThreshold = self->_physicalTripodLikelyMaxAngleThreshold;
  self->_isLikelyPhysicalTripod = physicalTripodLikelyMaxAngleThreshold > a3;
  if (physicalTripodLikelyMaxAngleThreshold <= a3)
  {
    v8 = 0;
  }
  else
  {
    previousLikelyPhysicalTripodCount = self->_previousLikelyPhysicalTripodCount;
    v6 = llroundf(a4);
    if (v6 <= 1)
      v6 = 1;
    v7 = previousLikelyPhysicalTripodCount >= v6 && self->_physicalTripodGuaranteedMaxAngleThreshold > a3;
    self->_isPhysicalTripod = v7;
    v8 = previousLikelyPhysicalTripodCount + 1;
  }
  self->_previousLikelyPhysicalTripodCount = v8;
}

- (BWPreviewGyroStabilizationTripodDetection)initWithTripodDetectionThresholds:(float)a3 tripodMaxAngleThresholdAccumulate:(float)a4 physicalTripodLikelyMaxAngleThreshold:(float)a5 physicalTripodGuaranteedMaxAngleThreshold:(float)a6
{
  BWPreviewGyroStabilizationTripodDetection *v10;
  BWPreviewGyroStabilizationTripodDetection *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BWPreviewGyroStabilizationTripodDetection;
  v10 = -[BWPreviewGyroStabilizationTripodDetection init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[BWPreviewGyroStabilizationTripodDetection reset](v10, "reset");
    v11->_tripodMaxAngleThresholdInstant = a3;
    v11->_tripodMaxAngleThresholdAccumulate = a4;
    v11->_physicalTripodLikelyMaxAngleThreshold = a5;
    v11->_physicalTripodGuaranteedMaxAngleThreshold = a6;
  }
  return v11;
}

- (void)reset
{
  *(_QWORD *)&self->_ringCount = 0;
  self->_inputIndex = 0;
  *(_WORD *)&self->_isStationary = 0;
  self->_isPhysicalTripod = 0;
}

@end
