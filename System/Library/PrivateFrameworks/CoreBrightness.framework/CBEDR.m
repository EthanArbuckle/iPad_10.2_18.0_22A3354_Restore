@implementation CBEDR

- (float)maxHeadroom
{
  return self->_maxHeadroom;
}

- (void)setBrightnessCap:(float)a3
{
  self->_brightnessCap = a3;
}

- (void)setSdrBrightness:(float)a3
{
  self->_sdrBrightness = a3;
}

- (id)copyStatusInfo
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *context;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[13];
  _QWORD v20[14];

  v20[13] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v16 = objc_alloc(MEMORY[0x1E0C99E08]);
  v19[0] = CFSTR("PanelMax");
  *(float *)&v2 = self->_panelMax;
  v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v19[1] = CFSTR("RampPolicy");
  v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_rampPolicy);
  v19[2] = CFSTR("MaxHeadroom");
  *(float *)&v3 = self->_maxHeadroom;
  v20[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v19[3] = CFSTR("BrightnessCap");
  *(float *)&v4 = self->_brightnessCap;
  v20[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v19[4] = CFSTR("SDR");
  *(float *)&v5 = self->_sdrBrightness;
  v20[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v19[5] = CFSTR("ReferenceHeadroom");
  *(float *)&v6 = self->_referenceHeadroom;
  v20[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v19[6] = CFSTR("Headroom");
  *(float *)&v7 = self->_currentHeadroom;
  v20[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v19[7] = CFSTR("AvailableHeadroom");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[CBEDR availableHeadroom](self, "availableHeadroom");
  v20[7] = objc_msgSend(v15, "numberWithFloat:");
  v19[8] = CFSTR("RequestedHeadroom");
  *(float *)&v8 = self->_requestedHeadroom;
  v20[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v19[9] = CFSTR("HDRMax");
  *(float *)&v9 = self->_currentMaxBrightness;
  v20[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v19[10] = CFSTR("AppliedCompensation");
  *(float *)&v10 = self->_appliedCompensation;
  v20[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v19[11] = CFSTR("SecPerStop");
  *(float *)&v11 = self->_secondsPerStop;
  v20[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v19[12] = CFSTR("SecPerStopExit");
  *(float *)&v12 = self->_secondsPerStopExit;
  v20[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v17 = (void *)objc_msgSend(v16, "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 13));
  if (self->_headroomModulator)
    objc_msgSend(v17, "setObject:forKey:", -[CBEDRModulator description](self->_headroomModulator, "description"), CFSTR("Modulator"));
  objc_autoreleasePoolPop(context);
  return v17;
}

- (float)availableHeadroom
{
  double sdrBrightness;
  float result;
  float v4;

  v4 = 1.0;
  -[CBEDR sanityCheck](self, "sanityCheck");
  sdrBrightness = self->_sdrBrightness;
  if (sdrBrightness > 0.0)
    v4 = (float)(self->_currentMaxBrightness / self->_sdrBrightness) / self->_appliedCompensation;
  *(float *)&sdrBrightness = v4;
  -[CBEDR clampHeadroom:](self, "clampHeadroom:", sdrBrightness);
  return result;
}

- (void)sanityCheck
{
  self->_currentMaxBrightness = fminf(self->_brightnessCap, self->_panelMax);
  self->_sdrBrightness = fminf(self->_panelMax, self->_sdrBrightness);
}

- (float)cappedHeadroomFromUncapped:(float)a3
{
  float v3;
  double v4;
  double v5;
  float result;
  float v7;
  float v8;
  float v9;
  float v10;
  SEL v11;
  CBEDR *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  -[CBEDR clampHeadroom:](self, "clampHeadroom:", *(double *)&a3);
  v9 = v3;
  -[CBEDR sanityCheck](v12, "sanityCheck");
  v12->_currentHeadroom = v10;
  if (v12->_sdrBrightness > 0.0)
  {
    if ((float)((float)(v12->_sdrBrightness * v10) * v12->_appliedCompensation) > v12->_currentMaxBrightness)
      v9 = (float)(v12->_currentMaxBrightness / v12->_sdrBrightness) / v12->_appliedCompensation;
  }
  else
  {
    v9 = v10 / v12->_appliedCompensation;
  }
  v8 = 0.0;
  v7 = 0.0;
  if (-[CBEDRModulator isConfigured](v12->_headroomModulator, "isConfigured")
    && (*(float *)&v4 = v9,
        *(float *)&v5 = v12->_sdrBrightness,
        -[CBEDRModulator modulatedHeadroom:forHeadroom:forSDRNits:](v12->_headroomModulator, "modulatedHeadroom:forHeadroom:forSDRNits:", &v7, v4, v5)))
  {
    v8 = v7;
  }
  else
  {
    v8 = v9;
  }
  *(float *)&v4 = v8;
  -[CBEDR clampHeadroom:](v12, "clampHeadroom:", v4);
  return result;
}

- (float)clampHeadroom:(float)a3
{
  return clamp(a3, self->_minHeadroom, self->_maxHeadroom);
}

- (float)secondsPerStop
{
  return self->_secondsPerStop;
}

+ (float)overallRampDuration:(float)a3 target:(float)a4 durationPerStop:(float)a5
{
  return fabsf(log2f(a4 / a3)) * a5;
}

+ (float)animatedHeadroomForOrigin:(float)a3 target:(float)a4 andProgress:(float)a5
{
  NSObject *v6;
  os_log_type_t v7;
  NSObject *v8;
  NSObject *log;
  os_log_type_t type;
  NSObject *inited;
  uint8_t v12[7];
  char v13;
  NSObject *v14;
  uint8_t v15[15];
  char v16;
  NSObject *v17;
  float v18;
  float v19;
  float v20;
  SEL v21;
  id v22;

  v22 = a1;
  v21 = a2;
  v20 = a3;
  v19 = a4;
  v18 = a5;
  if (a4 == 0.0)
  {
    v17 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v17 = inited;
    v16 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v17;
      type = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_error_impl(&dword_1B5291000, log, type, "error: target == 0.0", v15, 2u);
    }
    return 1.0;
  }
  else if (v18 <= 1.0 && v18 >= 0.0)
  {
    if (v18 == 1.0)
      return v19;
    else
      return v20 * powf(fabsf(v20 / v19), -v18);
  }
  else
  {
    v14 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v8 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v8 = init_default_corebrightness_log();
    v14 = v8;
    v13 = 16;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v6 = v14;
      v7 = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_error_impl(&dword_1B5291000, v6, v7, "error: progress out of range", v12, 2u);
    }
    return 1.0;
  }
}

+ (float)headroomToStops:(float)a3
{
  return log2f(a3);
}

+ (float)stopsToHeadroom:(float)a3
{
  return powf(2.0, a3);
}

+ (float)headroomToScalingFactor:(float)a3
{
  return 1.0 / a3;
}

+ (float)scalingFactorToHeadroom:(float)a3
{
  return 1.0 / a3;
}

- (CBEDR)initWithRampPolicy:(unint64_t)a3 potentialHeadroom:(float)a4 andReferenceHeadroom:(float)a5
{
  objc_super v6;
  float v7;
  float v8;
  unint64_t v9;
  SEL v10;
  CBEDR *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8 = a4;
  v7 = a5;
  v6.receiver = self;
  v6.super_class = (Class)CBEDR;
  v11 = -[CBEDR init](&v6, sel_init);
  if (v11)
  {
    v11->_rampPolicy = v9;
    v11->_minHeadroom = 1.0;
    v11->_maxHeadroom = v8;
    v11->_referenceHeadroom = v7;
    v11->_currentHeadroom = 1.0;
    v11->_requestedHeadroom = 1.0;
    v11->_appliedCompensation = 1.0;
    v11->_secondsPerStop = 1.0;
    v11->_secondsPerStopExit = 1.0;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBEDR *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBEDR;
  -[CBEDR dealloc](&v2, sel_dealloc);
}

- (id)description
{
  SEL v3;
  CBEDR *v4;

  v4 = self;
  v3 = a2;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: r.policy: %lu | h.max: %f | h.ref=%f | h.req: %f | SDR: %f | cap: %f | p.max: %f | a.comp: %f | sec.per.stop: %f | sec.per.stop.exit: %f"), "CBEDR", self->_rampPolicy, self->_maxHeadroom, self->_referenceHeadroom, self->_requestedHeadroom, self->_sdrBrightness, self->_brightnessCap, self->_panelMax, self->_appliedCompensation, self->_secondsPerStop, self->_secondsPerStopExit);
}

- (BOOL)shouldUpdateEDRForRequestedHeadroom:(float)a3 targetHeadroom:(float *)a4 rampTime:(double *)a5
{
  double v5;

  LODWORD(v5) = -1.0;
  return -[CBEDR shouldUpdateEDRForRequestedHeadroom:targetHeadroom:rampTime:durationPerStop:](self, "shouldUpdateEDRForRequestedHeadroom:targetHeadroom:rampTime:durationPerStop:", a4, a5, *(double *)&a3, v5);
}

- (BOOL)shouldUpdateEDRForRequestedHeadroom:(float)a3 targetHeadroom:(float *)a4 rampTime:(double *)a5 durationPerStop:(float)a6
{
  float v6;
  double v7;
  double v8;
  double sdrBrightness;
  float v10;
  float secondsPerStop;
  BOOL v13;
  float v17;

  if (!a4)
    __assert_rtn("-[CBEDR shouldUpdateEDRForRequestedHeadroom:targetHeadroom:rampTime:durationPerStop:]", "CBEDR.m", 273, "target");
  if (!a5)
    __assert_rtn("-[CBEDR shouldUpdateEDRForRequestedHeadroom:targetHeadroom:rampTime:durationPerStop:]", "CBEDR.m", 274, "time");
  v13 = 0;
  -[CBEDR clampHeadroom:](self, "clampHeadroom:", *(double *)&a3);
  v17 = v6;
  -[CBEDR sanityCheck](self, "sanityCheck");
  sdrBrightness = self->_sdrBrightness;
  if (sdrBrightness > 0.0 && v17 != self->_requestedHeadroom)
  {
    self->_requestedHeadroom = v17;
    if (v17 == self->_currentHeadroom)
    {
      v13 = 1;
      *a4 = v17;
      *a5 = 0.0;
    }
    else
    {
      v13 = 1;
      *a4 = v17;
      if (self->_rampPolicy == 1)
      {
        *a5 = 0.0;
      }
      else
      {
        if (a6 < 0.0)
          secondsPerStop = self->_secondsPerStop;
        else
          secondsPerStop = a6;
        *(float *)&sdrBrightness = self->_currentHeadroom;
        *(float *)&v7 = v17;
        *(float *)&v8 = secondsPerStop;
        +[CBEDR overallRampDuration:target:durationPerStop:](CBEDR, "overallRampDuration:target:durationPerStop:", sdrBrightness, v7, v8);
        *a5 = v10;
      }
    }
  }
  return v13;
}

- (void)resetRequestedHeadroom
{
  self->_requestedHeadroom = 1.0;
}

- (float)panelMax
{
  return self->_panelMax;
}

- (void)setPanelMax:(float)a3
{
  self->_panelMax = a3;
}

- (float)brightnessCap
{
  return self->_brightnessCap;
}

- (float)sdrBrightness
{
  return self->_sdrBrightness;
}

- (float)referenceHeadroom
{
  return self->_referenceHeadroom;
}

- (void)setReferenceHeadroom:(float)a3
{
  self->_referenceHeadroom = a3;
}

- (float)minHeadroom
{
  return self->_minHeadroom;
}

- (void)setMinHeadroom:(float)a3
{
  self->_minHeadroom = a3;
}

- (void)setMaxHeadroom:(float)a3
{
  self->_maxHeadroom = a3;
}

- (float)appliedCompensation
{
  return self->_appliedCompensation;
}

- (void)setAppliedCompensation:(float)a3
{
  self->_appliedCompensation = a3;
}

- (void)setSecondsPerStop:(float)a3
{
  self->_secondsPerStop = a3;
}

- (float)secondsPerStopExit
{
  return self->_secondsPerStopExit;
}

- (void)setSecondsPerStopExit:(float)a3
{
  self->_secondsPerStopExit = a3;
}

- (CBEDRModulator)headroomModulator
{
  return (CBEDRModulator *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHeadroomModulator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

@end
