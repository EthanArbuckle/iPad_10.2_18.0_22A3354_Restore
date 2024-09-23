@implementation VCPVideoMetaLensSwitchAnalyzer

- (VCPVideoMetaLensSwitchAnalyzer)init
{
  char *v2;
  VCPVideoMetaLensSwitchAnalyzer *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPVideoMetaLensSwitchAnalyzer;
  v2 = -[VCPVideoMetaLensSwitchAnalyzer init](&v6, sel_init);
  v3 = (VCPVideoMetaLensSwitchAnalyzer *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 4) = 0;
    *(_OWORD *)(v2 + 12) = xmmword_1B6FBF550;
    v4 = v2;
  }

  return v3;
}

- (id)results
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hadZoom, CFSTR("quality"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("ZoomChangeScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_settlingHadZoom);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hadZoom
{
  return self->_hadZoom;
}

- (void)setHadZoom:(BOOL)a3
{
  self->_hadZoom = a3;
}

- (float)minZoom
{
  return self->_minZoom;
}

- (void)setMinZoom:(float)a3
{
  self->_minZoom = a3;
}

- (float)maxZoom
{
  return self->_maxZoom;
}

- (void)setMaxZoom:(float)a3
{
  self->_maxZoom = a3;
}

- (BOOL)settlingHadZoom
{
  return self->_settlingHadZoom;
}

- (void)setSettlingHadZoom:(BOOL)a3
{
  self->_settlingHadZoom = a3;
}

- (float)settlingMinZoom
{
  return self->_settlingMinZoom;
}

- (void)setSettlingMinZoom:(float)a3
{
  self->_settlingMinZoom = a3;
}

- (float)settlingMaxZoom
{
  return self->_settlingMaxZoom;
}

- (void)setSettlingMaxZoom:(float)a3
{
  self->_settlingMaxZoom = a3;
}

@end
