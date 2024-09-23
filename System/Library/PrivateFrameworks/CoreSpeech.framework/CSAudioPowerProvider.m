@implementation CSAudioPowerProvider

- (CSAudioPowerProvider)init
{
  CSAudioPowerProvider *v2;
  id v3;
  uint64_t v4;
  CSAudioPowerMeter *powerMeter;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSAudioPowerProvider;
  v2 = -[CSAudioPowerProvider init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D18FF8]);
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v4 = objc_msgSend(v3, "initWithSampleRate:");
    powerMeter = v2->_powerMeter;
    v2->_powerMeter = (CSAudioPowerMeter *)v4;

    -[CSAudioPowerMeter getAveragePowerDB](v2->_powerMeter, "getAveragePowerDB");
    *(float *)&v6 = v6;
    v2->_cachedAvgPower = *(float *)&v6;
    -[CSAudioPowerMeter getPeakPowerDB](v2->_powerMeter, "getPeakPowerDB");
    *(float *)&v7 = v7;
    v2->_cachedPeakPower = *(float *)&v7;
  }
  return v2;
}

- (void)processAudioChunk:(id)a3
{
  void *v4;
  id v5;
  int v6;
  CSAudioPowerMeter *powerMeter;
  id v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;

  v4 = (void *)MEMORY[0x1E0D19090];
  v5 = a3;
  v6 = objc_msgSend(v4, "inputRecordingIsFloat");
  powerMeter = self->_powerMeter;
  objc_msgSend(v5, "data");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v5, "numSamples");

  if (v6)
    -[CSAudioPowerMeter processFloatBuffer:stride:inFrameToProcess:](powerMeter, "processFloatBuffer:stride:inFrameToProcess:", v9, 1, v10);
  else
    -[CSAudioPowerMeter processShortBuffer:stride:inFrameToProcess:](powerMeter, "processShortBuffer:stride:inFrameToProcess:", v9, 1, v10);

  -[CSAudioPowerMeter getAveragePowerDB](self->_powerMeter, "getAveragePowerDB");
  *(float *)&v11 = v11;
  self->_cachedAvgPower = *(float *)&v11;
  -[CSAudioPowerMeter getPeakPowerDB](self->_powerMeter, "getPeakPowerDB");
  *(float *)&v12 = v12;
  self->_cachedPeakPower = *(float *)&v12;
}

- (void)processAudioChunkForTV:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;

  v4 = a3;
  objc_msgSend(v4, "avgPower");
  self->_cachedAvgPower = v5;
  objc_msgSend(v4, "peakPower");
  v7 = v6;

  self->_cachedPeakPower = v7;
}

- (void)getAudioPowerUpdateWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD, float, float))a3 + 2))(a3, 0, self->_cachedAvgPower, self->_cachedPeakPower);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerMeter, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_14231 != -1)
    dispatch_once(&sharedInstance_onceToken_14231, &__block_literal_global_14232);
  return (id)sharedInstance_sharedProvider;
}

void __38__CSAudioPowerProvider_sharedInstance__block_invoke()
{
  CSAudioPowerProvider *v0;
  void *v1;

  v0 = objc_alloc_init(CSAudioPowerProvider);
  v1 = (void *)sharedInstance_sharedProvider;
  sharedInstance_sharedProvider = (uint64_t)v0;

}

@end
