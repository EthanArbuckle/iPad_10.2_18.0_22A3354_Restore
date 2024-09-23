@implementation BWInferenceConfiguration

- (BWInferenceConfiguration)initWithInferenceType:(int)a3
{
  char *v4;
  BWInferenceConfiguration *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWInferenceConfiguration;
  v4 = -[BWInferenceConfiguration init](&v7, sel_init);
  v5 = (BWInferenceConfiguration *)v4;
  if (v4)
  {
    *((_DWORD *)v4 + 2) = a3;
    *(_QWORD *)(v4 + 12) = 0;
    *((_QWORD *)v4 + 3) = objc_alloc_init(MEMORY[0x1E0C99D80]);
  }
  return v5;
}

- (unsigned)priority
{
  return self->_priority;
}

- (int)inferenceType
{
  return self->_inferenceType;
}

- (BOOL)propagatesFrameRatePrevention
{
  return self->_propagatesFrameRatePrevention;
}

- (float)maximumFramesPerSecond
{
  return self->_maximumFramesPerSecond;
}

- (void)setPriority:(unsigned int)a3
{
  self->_priority = a3;
}

- (void)setMaximumFramesPerSecond:(float)a3
{
  self->_maximumFramesPerSecond = a3;
}

- (void)setPropagatesFrameRatePrevention:(BOOL)a3
{
  self->_propagatesFrameRatePrevention = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceConfiguration;
  -[BWInferenceConfiguration dealloc](&v3, sel_dealloc);
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
