@implementation MPCAudioSpectrumObserver

- (void)dealloc
{
  _MPCAudioFrequencyBandInternal *bands;
  objc_super v4;

  bands = self->_bands;
  if (bands)
    free(bands);
  v4.receiver = self;
  v4.super_class = (Class)MPCAudioSpectrumObserver;
  -[MPCAudioSpectrumObserver dealloc](&v4, sel_dealloc);
}

- (int64_t)numberOfBands
{
  return self->_numberOfBands;
}

- (int64_t)addAnalysisBand:(MPCAudioSpectrumAnalyzerBand)a3
{
  _BOOL4 v3;
  float v4;
  BOOL v5;

  v3 = a3.var0 > 600.0;
  a3.var1 = 300.0;
  v4 = 5000.0;
  if (a3.var0 <= 600.0)
    v4 = 300.0;
  v5 = a3.var0 > 300.0;
  a3.var0 = 20.0;
  if (v5)
  {
    a3.var0 = v4;
    LODWORD(a3.var1) = dword_210ED8AA8[v3];
  }
  return -[MPCAudioSpectrumObserver addFrequencyBand:](self, "addFrequencyBand:", *(double *)&a3, *(double *)&a3.var1);
}

- (int64_t)addFrequencyBand:(MPCAudioFrequencyBand)a3
{
  float var1;
  float var0;
  _MPCAudioFrequencyBandInternal *v6;
  int64_t result;

  var1 = a3.var1;
  var0 = a3.var0;
  -[MPCAudioSpectrumObserver _resizeBandStorage](self, "_resizeBandStorage");
  v6 = &self->_bands[self->_numberOfBands];
  v6->var0.var0 = var0;
  v6->var0.var1 = var1;
  v6->var1 = var0;
  v6->var2 = var1;
  *(_QWORD *)&v6->var3 = 0;
  v6->var4 = 0;
  result = self->_numberOfBands;
  self->_numberOfBands = result + 1;
  return result;
}

- (float)averagePowerOfBandAtIndex:(int64_t)a3 band:(MPCAudioSpectrumAnalyzerBand *)a4
{
  return self->_bands[a3].var3;
}

- (float)averagePowerOfFrequencyBandAtIndex:(int64_t)a3 frequencyBand:(MPCAudioFrequencyBand *)a4
{
  MPCAudioFrequencyBand *p_var0;
  float result;

  p_var0 = &self->_bands[a3].var0;
  result = p_var0[2].var0;
  if (a4)
    *a4 = p_var0[1];
  return result;
}

- (void)_resizeBandStorage
{
  unint64_t bandsStorageSize;
  double v4;
  unint64_t v5;

  bandsStorageSize = self->_bandsStorageSize;
  if (bandsStorageSize < self->_numberOfBands + 1)
  {
    v4 = (double)bandsStorageSize * 1.5;
    if (v4 < 3.0)
      v4 = 3.0;
    v5 = (unint64_t)v4;
    self->_bands = (_MPCAudioFrequencyBandInternal *)reallocf(self->_bands, 32 * (unint64_t)v4);
    self->_bandsStorageSize = v5;
  }
}

- (void)beginReport
{
  double v2;
  unint64_t v3;
  unint64_t *p_var4;

  if (self->_numberOfBands)
  {
    v3 = 0;
    p_var4 = &self->_bands->var4;
    do
    {
      *p_var4 = 0;
      *((_DWORD *)p_var4 - 2) = 0;
      ++v3;
      p_var4 += 4;
    }
    while (v3 < self->_numberOfBands);
  }
  LODWORD(v2) = 0;
  -[MPCAudioSpectrumObserver setPowerLevel:](self, "setPowerLevel:", v2);
}

- (void)finishReport
{
  void *v3;
  void (**v4)(id, MPCAudioSpectrumObserver *);

  -[MPCAudioSpectrumObserver onUpdate](self, "onUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MPCAudioSpectrumObserver onUpdate](self, "onUpdate");
    v4 = (void (**)(id, MPCAudioSpectrumObserver *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self);

  }
}

- (float)powerLevel
{
  return self->_powerLevel;
}

- (void)setPowerLevel:(float)a3
{
  self->_powerLevel = a3;
}

- (id)onUpdate
{
  return self->_onUpdate;
}

- (void)setOnUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onUpdate, 0);
}

+ (id)defaultObserver
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v2 = objc_alloc_init((Class)a1);
  LODWORD(v3) = 20.0;
  LODWORD(v4) = 1133903872;
  objc_msgSend(v2, "addFrequencyBand:", v3, v4);
  LODWORD(v5) = 1133903872;
  LODWORD(v6) = 1167867904;
  objc_msgSend(v2, "addFrequencyBand:", v5, v6);
  LODWORD(v7) = 1186693120;
  LODWORD(v8) = 1167867904;
  objc_msgSend(v2, "addFrequencyBand:", v8, v7);
  return v2;
}

@end
