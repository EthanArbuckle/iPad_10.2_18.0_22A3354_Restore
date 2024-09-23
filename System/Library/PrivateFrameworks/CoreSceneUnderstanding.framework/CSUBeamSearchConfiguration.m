@implementation CSUBeamSearchConfiguration

- (CSUBeamSearchConfiguration)init
{
  CSUBeamSearchConfiguration *v2;
  CSUBeamSearchConfiguration *v3;
  NSNumber *beamWidth;
  NSNumber *maxSteps;
  NSNumber *topK;
  NSNumber *lengthNormalizationAlpha;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSUBeamSearchConfiguration;
  v2 = -[CSUBeamSearchConfiguration init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    beamWidth = v2->_beamWidth;
    v2->_beamWidth = 0;

    maxSteps = v3->_maxSteps;
    v3->_maxSteps = 0;

    topK = v3->_topK;
    v3->_topK = 0;

    lengthNormalizationAlpha = v3->_lengthNormalizationAlpha;
    v3->_lengthNormalizationAlpha = 0;

  }
  return v3;
}

- (NSNumber)beamWidth
{
  return self->_beamWidth;
}

- (void)setBeamWidth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)maxSteps
{
  return self->_maxSteps;
}

- (void)setMaxSteps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)topK
{
  return self->_topK;
}

- (void)setTopK:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)lengthNormalizationAlpha
{
  return self->_lengthNormalizationAlpha;
}

- (void)setLengthNormalizationAlpha:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lengthNormalizationAlpha, 0);
  objc_storeStrong((id *)&self->_topK, 0);
  objc_storeStrong((id *)&self->_maxSteps, 0);
  objc_storeStrong((id *)&self->_beamWidth, 0);
}

@end
