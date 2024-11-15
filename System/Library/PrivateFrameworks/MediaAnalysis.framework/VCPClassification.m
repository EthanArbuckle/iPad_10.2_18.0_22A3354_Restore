@implementation VCPClassification

- (VCPClassification)initWithSceneId:(id)a3 withDuration:(float)a4 withConfidence:(float)a5 withAdjustConfidence:(float)a6
{
  id v11;
  VCPClassification *v12;
  float *v13;
  float v14;
  VCPClassification *v15;
  objc_super v17;

  v11 = a3;
  if (v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)VCPClassification;
    v12 = -[VCPClassification init](&v17, sel_init);
    v13 = (float *)v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_sceneId, a3);
      v13[2] = a4;
      v13[3] = a5;
      v14 = 0.0;
      if (a6 > 0.0)
        v14 = a4;
      v13[4] = a6;
      v13[5] = v14;
    }
    self = v13;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSString)sceneId
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSceneId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (float)duration
{
  return self->_duration;
}

- (void)setDuration:(float)a3
{
  self->_duration = a3;
}

- (float)sumConfidence
{
  return self->_sumConfidence;
}

- (void)setSumConfidence:(float)a3
{
  self->_sumConfidence = a3;
}

- (float)sumAdjustConfidence
{
  return self->_sumAdjustConfidence;
}

- (void)setSumAdjustConfidence:(float)a3
{
  self->_sumAdjustConfidence = a3;
}

- (float)adjustDuration
{
  return self->_adjustDuration;
}

- (void)setAdjustDuration:(float)a3
{
  self->_adjustDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneId, 0);
}

@end
