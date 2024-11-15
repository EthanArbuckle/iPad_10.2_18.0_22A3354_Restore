@implementation VKPulseFrequencyGenerator

- (VKPulseFrequencyGenerator)initWithMinPulseFrequency:(double)a3 maxPulseFrequency:(double)a4 minDepth:(int)a5 maxDepth:(int)a6
{
  VKPulseFrequencyGenerator *v10;
  VKPulseFrequencyGenerator *v11;
  double v12;
  VKPulseFrequencyGenerator *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VKPulseFrequencyGenerator;
  v10 = -[VKPulseFrequencyGenerator init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v12 = (a4 - a3) / (double)(a5 - a6);
    v10->slope = v12;
    v10->intercept = a3 - v12 * (double)a6;
    v13 = v10;
  }

  return v11;
}

- (double)frequencyForDepth:(int)a3
{
  if (a3 < 0)
    return 0.0;
  else
    return self->intercept + self->slope * (double)a3;
}

@end
