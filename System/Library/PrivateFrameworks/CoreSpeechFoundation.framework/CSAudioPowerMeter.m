@implementation CSAudioPowerMeter

- (CSAudioPowerMeter)initWithSampleRate:(float)a3
{
  CSAudioPowerMeter *v4;
  CSAudioPowerMeter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSAudioPowerMeter;
  v4 = -[CSAudioPowerMeter init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[CSAudioPowerMeter _reset](v4, "_reset");
    v5->_sampleRate = a3;
  }
  return v5;
}

- (void)_reset
{
  *(_OWORD *)&self->_decay1 = xmmword_1B50D76D0;
  self->_averagePowerI = 0;
  self->_averagePowerF = 0.0;
  self->_peakHoldCount = 0;
  self->_previousBlockSize = 0;
  self->_averagePowerPeak = 0.0;
  self->_peak = 0.0;
  self->_maxPeak = 0.0;
  self->_instantaneousMode = 1;
}

- (void)_scaleDecayConstants:(int)a3
{
  long double v5;

  if (self->_previousBlockSize != a3)
  {
    v5 = (double)a3;
    self->_peakDecay = 1.0 - pow(self->_peakDecay1, (double)a3);
    self->_decay = 1.0 - pow(self->_decay1, v5);
    self->_previousBlockSize = a3;
  }
}

- (void)processShortBuffer:(const signed __int16 *)a3 stride:(int)a4 inFrameToProcess:(int)a5
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int v12;

  if (a5 >= 1)
  {
    v5 = *(_QWORD *)&a5;
    -[CSAudioPowerMeter _scaleDecayConstants:](self, "_scaleDecayConstants:", *(_QWORD *)&a5);
    LODWORD(v9) = 0;
    LODWORD(v10) = self->_averagePowerI;
    v11 = v5 + 1;
    do
    {
      v12 = *a3;
      if (v12 < 0)
        v12 = -v12;
      if ((int)v9 <= v12)
        v9 = v12;
      else
        v9 = v9;
      v10 = (v10 + ((v12 * v12 - (int)v10) >> 5));
      --v11;
      a3 += a4;
    }
    while (v11 > 1);
    -[CSAudioPowerMeter _savePeaks:averagePower:maxSample:](self, "_savePeaks:averagePower:maxSample:", v5, v10, v9);
  }
}

- (void)processFloatBuffer:(const float *)a3 stride:(int)a4 inFrameToProcess:(int)a5
{
  double averagePowerF;
  unsigned int v10;
  float v11;
  float v12;
  double v13;
  int v14;
  _BOOL4 instantaneousMode;
  double v16;
  double peak;
  double maxPeak;
  int v19;
  double v20;
  double v21;
  double averagePowerPeak;

  if (a5 < 1)
    return;
  -[CSAudioPowerMeter _scaleDecayConstants:](self, "_scaleDecayConstants:", *(_QWORD *)&a5);
  averagePowerF = self->_averagePowerF;
  v10 = a5 + 1;
  v11 = 0.0;
  do
  {
    v12 = *a3;
    if (*a3 < 0.0)
      v12 = -*a3;
    if (v12 > v11)
      v11 = v12;
    averagePowerF = averagePowerF + ((float)(v12 * v12) - averagePowerF) * 0.03;
    a3 += a4;
    --v10;
  }
  while (v10 > 1);
  -[CSAudioUnitMeterClipping peakValueSinceLastCall](self->_clipping, "peakValueSinceLastCall", 0.03);
  if (v11 > *(float *)&v13)
  {
    *(float *)&v13 = v11;
    -[CSAudioUnitMeterClipping setPeakValueSinceLastCall:](self->_clipping, "setPeakValueSinceLastCall:", v13);
  }
  v14 = __fpclassifyd(averagePowerF);
  if (v14 == 2)
  {
    -[CSAudioUnitMeterClipping setSawInfinity:](self->_clipping, "setSawInfinity:", 1);
    goto LABEL_15;
  }
  if (v14 == 1)
  {
    -[CSAudioUnitMeterClipping setSawNotANumber:](self->_clipping, "setSawNotANumber:", 1);
LABEL_15:
    v11 = 1.0;
    averagePowerF = 0.0;
  }
  self->_averagePowerF = averagePowerF;
  instantaneousMode = self->_instantaneousMode;
  if (self->_instantaneousMode)
  {
    v16 = v11;
  }
  else
  {
    peak = self->_peak;
    v16 = v11;
    if (peak > v11)
      v16 = peak + (v16 - peak) * self->_decay;
  }
  self->_peak = v16;
  maxPeak = self->_maxPeak;
  v19 = self->_peakHoldCount + a5;
  self->_peakHoldCount = v19;
  if (v19 >= (int)(self->_sampleRate * 0.907029478))
  {
    maxPeak = maxPeak - maxPeak * self->_peakDecay;
    self->_maxPeak = maxPeak;
  }
  v20 = sqrt(averagePowerF);
  if (maxPeak < v16)
  {
    self->_maxPeak = v16;
    self->_peakHoldCount = 0;
    maxPeak = v16;
  }
  v21 = v20 * 1.41421356;
  if (!instantaneousMode)
  {
    averagePowerPeak = self->_averagePowerPeak;
    if (averagePowerPeak > v21)
      v21 = averagePowerPeak + (v21 - averagePowerPeak) * self->_decay;
  }
  self->_averagePowerPeak = v21;
  if (v21 > maxPeak)
    self->_averagePowerPeak = maxPeak;
  -[CSAudioPowerMeter _zapgremlins:](self, "_zapgremlins:", &self->_averagePowerF);
  -[CSAudioPowerMeter _zapgremlins:](self, "_zapgremlins:", &self->_averagePowerPeak);
  -[CSAudioPowerMeter _zapgremlins:](self, "_zapgremlins:", &self->_peak);
  -[CSAudioPowerMeter _zapgremlins:](self, "_zapgremlins:", &self->_maxPeak);
}

- (void)_savePeaks:(int)a3 averagePower:(int)a4 maxSample:(int)a5
{
  float v5;
  _BOOL4 instantaneousMode;
  double v7;
  double peak;
  int v9;
  double maxPeak;
  double v11;
  double v12;
  double averagePowerPeak;

  v5 = (double)a5 * 0.0000305175781;
  self->_averagePowerI = a4;
  instantaneousMode = self->_instantaneousMode;
  if (self->_instantaneousMode)
  {
    v7 = v5;
  }
  else
  {
    peak = self->_peak;
    v7 = v5;
    if (peak > v7)
      v7 = peak + (v7 - peak) * self->_decay;
  }
  self->_peak = v7;
  v9 = self->_peakHoldCount + a3;
  self->_peakHoldCount = v9;
  maxPeak = self->_maxPeak;
  if (v9 >= (int)(self->_sampleRate * 0.907029478))
  {
    maxPeak = maxPeak - maxPeak * self->_peakDecay;
    self->_maxPeak = maxPeak;
  }
  v11 = sqrt((double)a4 * 9.31322575e-10);
  if (maxPeak < v7)
  {
    self->_maxPeak = v7;
    self->_peakHoldCount = 0;
    maxPeak = v7;
  }
  v12 = v11 * 1.41421356;
  if (!instantaneousMode)
  {
    averagePowerPeak = self->_averagePowerPeak;
    if (averagePowerPeak > v12)
      v12 = averagePowerPeak + (v12 - averagePowerPeak) * self->_decay;
  }
  self->_averagePowerPeak = v12;
  if (v12 > maxPeak)
    self->_averagePowerPeak = maxPeak;
}

- (double)getPeakPowerDB
{
  double result;

  -[CSAudioPowerMeter _linearToDB:](self, "_linearToDB:", self->_maxPeak);
  return result;
}

- (double)getAveragePowerDB
{
  double result;

  -[CSAudioPowerMeter _linearToDB:](self, "_linearToDB:", self->_averagePowerPeak);
  return result;
}

- (double)_ampToDB:(double)a3
{
  return log10(a3) * 20.0;
}

- (double)_linearToDB:(double)a3
{
  double result;

  if (a3 <= 0.000001)
    return -120.0;
  -[CSAudioPowerMeter _ampToDB:](self, "_ampToDB:");
  return result;
}

- (void)_zapgremlins:(double *)a3
{
  double v3;
  double v4;

  v3 = *a3;
  v4 = fabs(*a3);
  if (v4 >= 1.0e15 || v4 <= 1.0e-15)
    v3 = 0.0;
  *a3 = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipping, 0);
}

@end
