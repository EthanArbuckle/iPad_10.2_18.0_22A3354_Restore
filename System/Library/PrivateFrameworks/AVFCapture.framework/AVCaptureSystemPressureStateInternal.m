@implementation AVCaptureSystemPressureStateInternal

- (int)figLevel
{
  return self->_figLevel;
}

- (AVFrameRateRange)recommendedFrameRateRangeForPortrait
{
  return self->_recommendedFrameRateRangeForPortrait;
}

- (unint64_t)factors
{
  return self->_factors;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSystemPressureStateInternal;
  -[AVCaptureSystemPressureStateInternal dealloc](&v3, sel_dealloc);
}

- (AVCaptureSystemPressureStateInternal)initWithFigLevel:(int)a3 factors:(unint64_t)a4 recommendedFrameRateRangeForPortrait:(id)a5
{
  AVCaptureSystemPressureStateInternal *v8;
  AVCaptureSystemPressureStateInternal *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVCaptureSystemPressureStateInternal;
  v8 = -[AVCaptureSystemPressureStateInternal init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_figLevel = a3;
    v8->_factors = a4;
    v8->_recommendedFrameRateRangeForPortrait = (AVFrameRateRange *)a5;
  }
  return v9;
}

@end
