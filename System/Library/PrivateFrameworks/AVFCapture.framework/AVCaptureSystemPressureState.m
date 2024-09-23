@implementation AVCaptureSystemPressureState

- (BOOL)isEqual:(id)a3
{
  int v5;
  uint64_t v6;
  void *v7;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
    if (v5)
    {
      v5 = objc_msgSend((id)objc_msgSend(a3, "level"), "isEqual:", -[AVCaptureSystemPressureState level](self, "level"));
      if (v5)
      {
        v6 = objc_msgSend(a3, "factors");
        if (v6 == -[AVCaptureSystemPressureState factors](self, "factors"))
        {
          v7 = (void *)objc_msgSend(a3, "recommendedFrameRateRangeForPortrait");
          if (v7 == -[AVCaptureSystemPressureState recommendedFrameRateRangeForPortrait](self, "recommendedFrameRateRangeForPortrait")|| (v5 = objc_msgSend((id)objc_msgSend(a3, "recommendedFrameRateRangeForPortrait"), "isEqual:", -[AVCaptureSystemPressureState recommendedFrameRateRangeForPortrait](self, "recommendedFrameRateRangeForPortrait"))) != 0)
          {
            LOBYTE(v5) = 1;
          }
        }
        else
        {
          LOBYTE(v5) = 0;
        }
      }
    }
  }
  return v5;
}

- (AVCaptureSystemPressureLevel)level
{
  unsigned int v2;

  v2 = -[AVCaptureSystemPressureStateInternal figLevel](self->_internal, "figLevel") - 1;
  if (v2 > 3)
    return (AVCaptureSystemPressureLevel)CFSTR("AVCaptureSystemPressureLevelNominal");
  else
    return &off_1E42166C0[v2]->isa;
}

- (id)recommendedFrameRateRangeForPortrait
{
  return -[AVCaptureSystemPressureStateInternal recommendedFrameRateRangeForPortrait](self->_internal, "recommendedFrameRateRangeForPortrait");
}

- (AVCaptureSystemPressureFactors)factors
{
  return -[AVCaptureSystemPressureStateInternal factors](self->_internal, "factors");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSystemPressureState;
  -[AVCaptureSystemPressureState dealloc](&v3, sel_dealloc);
}

- (int)figLevel
{
  return -[AVCaptureSystemPressureStateInternal figLevel](self->_internal, "figLevel");
}

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureSystemPressureState)initWithFigLevel:(int)a3 factors:(unint64_t)a4 recommendedFrameRateRangeForPortrait:(id)a5
{
  uint64_t v7;
  AVCaptureSystemPressureState *v8;
  AVCaptureSystemPressureStateInternal *v9;
  objc_super v11;

  v7 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)AVCaptureSystemPressureState;
  v8 = -[AVCaptureSystemPressureState init](&v11, sel_init);
  if (v8)
  {
    v9 = -[AVCaptureSystemPressureStateInternal initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:]([AVCaptureSystemPressureStateInternal alloc], "initWithFigLevel:factors:recommendedFrameRateRangeForPortrait:", v7, a4, a5);
    v8->_internal = v9;
    if (!v9)
    {

      return 0;
    }
  }
  return v8;
}

- (AVCaptureSystemPressureState)init
{
  AVCaptureSystemPressureState *v2;
  AVCaptureSystemPressureState *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureSystemPressureState;
  v2 = -[AVCaptureSystemPressureState init](&v5, sel_init);
  if (v2)
  {
    v3 = v2;
    NSLog(CFSTR("-[AVCaptureSystemPressureState init] - Cannot directly instantiate an AVCaptureSystemPressureState object."));

  }
  return 0;
}

- (id)debugDescription
{
  const __CFString *v3;
  void *v4;
  const __CFString *v5;

  if ((-[NSString isEqual:](-[AVCaptureSystemPressureState level](self, "level"), "isEqual:", CFSTR("AVCaptureSystemPressureLevelNominal")) & 1) != 0)
  {
    v3 = CFSTR("Nominal");
  }
  else if ((-[NSString isEqual:](-[AVCaptureSystemPressureState level](self, "level"), "isEqual:", CFSTR("AVCaptureSystemPressureLevelFair")) & 1) != 0)
  {
    v3 = CFSTR("Fair");
  }
  else if ((-[NSString isEqual:](-[AVCaptureSystemPressureState level](self, "level"), "isEqual:", CFSTR("AVCaptureSystemPressureLevelSerious")) & 1) != 0)
  {
    v3 = CFSTR("Serious");
  }
  else if ((-[NSString isEqual:](-[AVCaptureSystemPressureState level](self, "level"), "isEqual:", CFSTR("AVCaptureSystemPressureLevelCritical")) & 1) != 0)
  {
    v3 = CFSTR("Critical");
  }
  else if (-[NSString isEqual:](-[AVCaptureSystemPressureState level](self, "level"), "isEqual:", CFSTR("AVCaptureSystemPressureLevelShutdown")))
  {
    v3 = CFSTR("Shutdown");
  }
  else
  {
    v3 = 0;
  }
  if (-[AVCaptureSystemPressureState factors](self, "factors"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    if ((-[AVCaptureSystemPressureState factors](self, "factors") & 1) != 0)
      objc_msgSend(v4, "appendString:", CFSTR("System Temp, "));
    if ((-[AVCaptureSystemPressureState factors](self, "factors") & 4) != 0)
      objc_msgSend(v4, "appendString:", CFSTR("Depth Module Temp, "));
    if ((-[AVCaptureSystemPressureState factors](self, "factors") & 2) != 0)
      objc_msgSend(v4, "appendString:", CFSTR("Peak Power, "));
    if ((-[AVCaptureSystemPressureState factors](self, "factors") & 8) != 0)
      objc_msgSend(v4, "appendString:", CFSTR("Camera Temp, "));
    v5 = (const __CFString *)objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 2);
  }
  else
  {
    v5 = CFSTR("None");
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Level:%@ Factors:%@"), v3, v5);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCaptureSystemPressureState debugDescription](self, "debugDescription"));
}

- (id)spiDebugDescription
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[AVCaptureSystemPressureState debugDescription](self, "debugDescription");
  objc_msgSend(-[AVCaptureSystemPressureState recommendedFrameRateRangeForPortrait](self, "recommendedFrameRateRangeForPortrait"), "minFrameRate");
  v6 = v5;
  objc_msgSend(-[AVCaptureSystemPressureState recommendedFrameRateRangeForPortrait](self, "recommendedFrameRateRangeForPortrait"), "maxFrameRate");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Recommended:%.0f-%.0f"), v4, v6, v7);
}

@end
