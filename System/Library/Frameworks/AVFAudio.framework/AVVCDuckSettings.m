@implementation AVVCDuckSettings

- (AVVCDuckSettings)init
{
  AVVCDuckSettings *v2;
  AVVCDuckSettings *v3;
  AVVCDuckOverride *duckOverride;
  AVVCDuckLevel *duckLevel;
  AVVCDuckFadeDuration *fadeDuration;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVVCDuckSettings;
  v2 = -[AVVCDuckSettings init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    duckOverride = v2->_duckOverride;
    v2->_duckOverride = 0;

    duckLevel = v3->_duckLevel;
    v3->_duckLevel = 0;

    fadeDuration = v3->_fadeDuration;
    v3->_fadeDuration = 0;

  }
  return v3;
}

- (id)description
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<duckOverride(%@), duckLevel(%@), fadeDuration(%@)>"), self->_duckOverride, self->_duckLevel, self->_fadeDuration);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (AVVCDuckOverride)duckOverride
{
  return self->_duckOverride;
}

- (void)setDuckOverride:(id)a3
{
  objc_storeStrong((id *)&self->_duckOverride, a3);
}

- (AVVCDuckLevel)duckLevel
{
  return self->_duckLevel;
}

- (void)setDuckLevel:(id)a3
{
  objc_storeStrong((id *)&self->_duckLevel, a3);
}

- (AVVCDuckFadeDuration)fadeDuration
{
  return self->_fadeDuration;
}

- (void)setFadeDuration:(id)a3
{
  objc_storeStrong((id *)&self->_fadeDuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeDuration, 0);
  objc_storeStrong((id *)&self->_duckLevel, 0);
  objc_storeStrong((id *)&self->_duckOverride, 0);
}

@end
