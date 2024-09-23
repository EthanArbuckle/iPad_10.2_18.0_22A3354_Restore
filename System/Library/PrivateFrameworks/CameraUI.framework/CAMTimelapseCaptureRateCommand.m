@implementation CAMTimelapseCaptureRateCommand

- (CAMTimelapseCaptureRateCommand)initWithTimelapseCaptureRate:(float)a3
{
  CAMTimelapseCaptureRateCommand *v4;
  CAMTimelapseCaptureRateCommand *v5;
  CAMTimelapseCaptureRateCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMTimelapseCaptureRateCommand;
  v4 = -[CAMCaptureCommand init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__captureRate = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMTimelapseCaptureRateCommand)initWithDefaultTimelapseCaptureRate
{
  void *v3;
  double v4;
  float v5;
  double v6;

  +[CAMTimelapseSettings sharedInstance](CAMTimelapseSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initialCaptureTimeInterval");
  v5 = 1.0 / v4;

  *(float *)&v6 = v5;
  return -[CAMTimelapseCaptureRateCommand initWithTimelapseCaptureRate:](self, "initWithTimelapseCaptureRate:", v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMTimelapseCaptureRateCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[CAMTimelapseCaptureRateCommand _captureRate](self, "_captureRate");
  v4[6] = v5;
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  int v5;
  int v6;
  double v7;
  id v8;

  v4 = a3;
  -[CAMTimelapseCaptureRateCommand _captureRate](self, "_captureRate");
  v6 = v5;
  objc_msgSend(v4, "currentStillImageOutput");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = v6;
  objc_msgSend(v8, "setTimeLapseCaptureRate:", v7);

}

- (float)_captureRate
{
  return self->__captureRate;
}

@end
