@implementation HDAudioAnalyticsBucketedExposureResult

- (HDAudioAnalyticsBucketedExposureResult)initWithLEQ:(id)a3 duration:(id)a4 dose:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDAudioAnalyticsBucketedExposureResult *v11;
  HDAudioAnalyticsBucketedExposureResult *v12;
  HDAudioAnalyticsBucketedExposureResult *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDAudioAnalyticsBucketedExposureResult;
  v11 = -[HDAudioAnalyticsBucketedExposureResult init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[HDAudioAnalyticsBucketedExposureResult setAudioExposureLEQ:](v11, "setAudioExposureLEQ:", v8);
    -[HDAudioAnalyticsBucketedExposureResult setAudioExposureDuration:](v12, "setAudioExposureDuration:", v9);
    -[HDAudioAnalyticsBucketedExposureResult setAudioExposureDose:](v12, "setAudioExposureDose:", v10);
    v13 = v12;
  }

  return v12;
}

- (NSNumber)audioExposureLEQ
{
  return self->_audioExposureLEQ;
}

- (void)setAudioExposureLEQ:(id)a3
{
  objc_storeStrong((id *)&self->_audioExposureLEQ, a3);
}

- (NSNumber)audioExposureDuration
{
  return self->_audioExposureDuration;
}

- (void)setAudioExposureDuration:(id)a3
{
  objc_storeStrong((id *)&self->_audioExposureDuration, a3);
}

- (NSNumber)audioExposureDose
{
  return self->_audioExposureDose;
}

- (void)setAudioExposureDose:(id)a3
{
  objc_storeStrong((id *)&self->_audioExposureDose, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioExposureDose, 0);
  objc_storeStrong((id *)&self->_audioExposureDuration, 0);
  objc_storeStrong((id *)&self->_audioExposureLEQ, 0);
}

@end
