@implementation AVAudioMixSweepFilterEffectParameters

- (AVAudioMixSweepFilterEffectParameters)init
{
  double v2;
  double v3;

  LODWORD(v2) = 0;
  LODWORD(v3) = 0;
  -[AVAudioMixSweepFilterEffectParameters initWithMinimumCutOffFrequency:maximumCutOffFrequency:bypassThreshold:sweepValue:](self, "initWithMinimumCutOffFrequency:maximumCutOffFrequency:bypassThreshold:sweepValue:", 0, 0, v2, v3);
  return self;
}

- (AVAudioMixSweepFilterEffectParameters)initWithMinimumCutOffFrequency:(unsigned int)a3 maximumCutOffFrequency:(unsigned int)a4 bypassThreshold:(float)a5 sweepValue:(float)a6
{
  AVAudioMixSweepFilterEffectParameters *v12;
  AVAudioMixSweepFilterEffectParametersInternal *v13;
  objc_class *v15;
  const char *v16;
  AVAudioMixSweepFilterEffectParameters *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  AVAudioMixSweepFilterEffectParameters *v26;
  AVAudioMixSweepFilterEffectParameters *v27;
  void *v28;
  objc_super v29;

  if (a3 >= a4)
  {
    v15 = (objc_class *)self;
    v16 = a2;
    v17 = self;
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v25 = "minimumCutOffFrequency < maximumCutOffFrequency";
    goto LABEL_18;
  }
  if (a5 < 0.0 || a5 > 1.0)
  {
    v15 = (objc_class *)self;
    v16 = a2;
    v26 = self;
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v25 = "0. <= bypassThreshold && bypassThreshold <= 1.";
    goto LABEL_18;
  }
  if (a6 < 0.0 || a6 > 1.0)
  {
    v15 = (objc_class *)self;
    v16 = a2;
    v27 = self;
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v25 = "0. <= sweepValue && sweepValue <= 1.";
LABEL_18:
    v28 = (void *)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, AVMethodExceptionReasonWithObjectAndSelector(v15, v16, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v18, v19, v20, v21, v22, (uint64_t)v25), 0);
    objc_exception_throw(v28);
  }
  v29.receiver = self;
  v29.super_class = (Class)AVAudioMixSweepFilterEffectParameters;
  v12 = -[AVAudioMixEffect init](&v29, sel_init);
  if (v12)
  {
    v13 = objc_alloc_init(AVAudioMixSweepFilterEffectParametersInternal);
    v12->_sweepFilterAudioEffect = v13;
    if (v13)
    {
      CFRetain(v13);
      v12->_sweepFilterAudioEffect->minimumCutOffFrequency = a3;
      v12->_sweepFilterAudioEffect->maximumCutOffFrequency = a4;
      v12->_sweepFilterAudioEffect->bypassThreshold = a5;
      v12->_sweepFilterAudioEffect->sweepValue = a6;
    }
    else
    {

      return 0;
    }
  }
  return v12;
}

+ (id)sweepFilterEffectParametersWithMinimumCutOffFrequency:(unsigned int)a3 maximumCutOffFrequency:(unsigned int)a4 bypassThreshold:(float)a5 sweepValue:(float)a6
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;

  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  v10 = objc_alloc((Class)a1);
  *(float *)&v11 = a5;
  *(float *)&v12 = a6;
  return (id)objc_msgSend(v10, "initWithMinimumCutOffFrequency:maximumCutOffFrequency:bypassThreshold:sweepValue:", v9, v8, v11, v12);
}

- (id)sweepFilterEffectWithSweepValue:(float)a3
{
  void *v5;
  unsigned int *sweepFilterAudioEffect;
  double v7;
  double v8;

  v5 = (void *)objc_opt_class();
  sweepFilterAudioEffect = (unsigned int *)self->_sweepFilterAudioEffect;
  LODWORD(v7) = sweepFilterAudioEffect[4];
  *(float *)&v8 = a3;
  return (id)objc_msgSend(v5, "sweepFilterEffectParametersWithMinimumCutOffFrequency:maximumCutOffFrequency:bypassThreshold:sweepValue:", sweepFilterAudioEffect[2], sweepFilterAudioEffect[3], v7, v8);
}

- (void)dealloc
{
  AVAudioMixSweepFilterEffectParametersInternal *sweepFilterAudioEffect;
  objc_super v4;

  sweepFilterAudioEffect = self->_sweepFilterAudioEffect;
  if (sweepFilterAudioEffect)
  {

    CFRelease(self->_sweepFilterAudioEffect);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioMixSweepFilterEffectParameters;
  -[AVAudioMixSweepFilterEffectParameters dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  float v5;
  float v6;
  float v7;
  int v8;
  int v9;
  float v10;
  float v11;
  float v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  -[AVAudioMixSweepFilterEffectParameters sweepValue](self, "sweepValue");
  v6 = v5;
  objc_msgSend(a3, "sweepValue");
  if (v6 != v7)
    return 0;
  v8 = -[AVAudioMixSweepFilterEffectParameters minimumCutOffFrequency](self, "minimumCutOffFrequency");
  if (v8 != objc_msgSend(a3, "minimumCutOffFrequency"))
    return 0;
  v9 = -[AVAudioMixSweepFilterEffectParameters maximumCutOffFrequency](self, "maximumCutOffFrequency");
  if (v9 != objc_msgSend(a3, "maximumCutOffFrequency"))
    return 0;
  -[AVAudioMixSweepFilterEffectParameters bypassThreshold](self, "bypassThreshold");
  v11 = v10;
  objc_msgSend(a3, "bypassThreshold");
  return v11 == v12;
}

- (unint64_t)hash
{
  return (unint64_t)(float)(self->_sweepFilterAudioEffect->bypassThreshold * 1000.0) ^ self->_sweepFilterAudioEffect->maximumCutOffFrequency ^ self->_sweepFilterAudioEffect->minimumCutOffFrequency ^ (unint64_t)(float)(self->_sweepFilterAudioEffect->sweepValue * 1000.0);
}

- (int)minimumCutOffFrequency
{
  return self->_sweepFilterAudioEffect->minimumCutOffFrequency;
}

- (int)maximumCutOffFrequency
{
  return self->_sweepFilterAudioEffect->maximumCutOffFrequency;
}

- (float)bypassThreshold
{
  return self->_sweepFilterAudioEffect->bypassThreshold;
}

- (float)sweepValue
{
  return self->_sweepFilterAudioEffect->sweepValue;
}

@end
