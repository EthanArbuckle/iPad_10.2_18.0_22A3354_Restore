@implementation CSSmartSiriVolumeUserIntent

- (double)applyLowerAndUpperBoundsToVolume:(float)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0D19260], "horsemanDeviceType");
  v6 = 36;
  if (v5 == 1)
    v6 = 44;
  v7 = 40;
  if (v5 == 1)
    v7 = 48;
  v8 = fminf(fmaxf(a3, *(float *)((char *)&self->super.isa + v6)), *(float *)((char *)&self->super.isa + v7));
  v9 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[CSSmartSiriVolumeUserIntent applyLowerAndUpperBoundsToVolume:]";
    v13 = 2048;
    v14 = v8;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolumeContextAware TTS volume post lower and upper bounds is: %f", (uint8_t *)&v11, 0x16u);
  }
  return v8;
}

- (CSSmartSiriVolumeUserIntent)initWithStoredInformationAndAsset:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  void *v15;

  v4 = a3;
  self->kSSVCAUserIntentValidForSeconds = objc_msgSend(v4, "SSVCAUserIntentValidForSeconds");
  objc_msgSend(v4, "SSVCAUserIntentVolumeIncreaseFactor");
  self->kSSVCAUserIntentVolumeIncreaseFactor = v5;
  objc_msgSend(v4, "SSVCAUserIntentVolumeDecreaseFactor");
  self->kSSVCAUserIntentVolumeDecreaseFactor = v6;
  objc_msgSend(v4, "SSVCAUserIntentPermanentOffsetFactorDelta");
  self->kSSVCAUserIntentPermanentOffsetFactorDelta = v7;
  objc_msgSend(v4, "SSVCAUserIntentPermanentOffsetFactorLowerBound");
  self->kSSVCAUserIntentPermanentOffsetFactorLowerBound = v8;
  objc_msgSend(v4, "SSVCAUserIntentPermanentOffsetFactorUpperBound");
  self->kSSVCAUserIntentPermanentOffsetFactorUpperBound = v9;
  objc_msgSend(v4, "SSVCADeviceSimpleMinTTSVolume");
  self->kSSVCA_DEVICE_SIMPLE_MIN_TTS_VOLUME = v10;
  objc_msgSend(v4, "SSVCADeviceSimpleMaxTTSVolume");
  self->kSSVCA_DEVICE_SIMPLE_MAX_TTS_VOLUME = v11;
  objc_msgSend(v4, "SSVCADeviceDefaultMinTTSVolume");
  self->kSSVCA_DEVICE_DEFAULT_MIN_TTS_VOLUME = v12;
  objc_msgSend(v4, "SSVCADeviceDefaultMaxTTSVolume");
  v14 = v13;

  self->kSSVCA_DEVICE_DEFAULT_MAX_TTS_VOLUME = v14;
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getASVUserIntent:", self);

  return (CSSmartSiriVolumeUserIntent *)-[CSSmartSiriVolumeUserIntent setUserIntentValidForSeconds:](self, "setUserIntentValidForSeconds:", self->kSSVCAUserIntentValidForSeconds);
}

- (float)increaseSiriVolumeBasedOnUserIntent
{
  double v2;
  double v3;

  *(float *)&v2 = self->_latestVolume * self->kSSVCAUserIntentVolumeIncreaseFactor;
  -[CSSmartSiriVolumeUserIntent applyLowerAndUpperBoundsToVolume:](self, "applyLowerAndUpperBoundsToVolume:", v2);
  return v3;
}

- (float)decreaseSiriVolumeBasedOnUserIntent
{
  double v2;
  double v3;

  *(float *)&v2 = self->_latestVolume * self->kSSVCAUserIntentVolumeDecreaseFactor;
  -[CSSmartSiriVolumeUserIntent applyLowerAndUpperBoundsToVolume:](self, "applyLowerAndUpperBoundsToVolume:", v2);
  return v3;
}

- (void)storeASVStateInformation
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setASVUserIntent:", self);

}

- (double)applyLowerAndUpperBoundsToVolumeOffset:(float)a3
{
  double v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = fminf(fmaxf(a3, self->kSSVCAUserIntentPermanentOffsetFactorLowerBound), self->kSSVCAUserIntentPermanentOffsetFactorUpperBound);
  v4 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSSmartSiriVolumeUserIntent applyLowerAndUpperBoundsToVolumeOffset:]";
    v8 = 2050;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s TTS volume offset post lower and upper bounds is: %{public}f", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (unint64_t)userIntentType
{
  return self->_userIntentType;
}

- (void)setUserIntentType:(unint64_t)a3
{
  self->_userIntentType = a3;
}

- (unint64_t)userIntentValidForSeconds
{
  return self->_userIntentValidForSeconds;
}

- (void)setUserIntentValidForSeconds:(unint64_t)a3
{
  self->_userIntentValidForSeconds = a3;
}

- (int64_t)userIntentTime
{
  return self->_userIntentTime;
}

- (void)setUserIntentTime:(int64_t)a3
{
  self->_userIntentTime = a3;
}

- (int64_t)latestVolumeTime
{
  return self->_latestVolumeTime;
}

- (void)setLatestVolumeTime:(int64_t)a3
{
  self->_latestVolumeTime = a3;
}

- (float)userIntentVolume
{
  return self->_userIntentVolume;
}

- (void)setUserIntentVolume:(float)a3
{
  self->_userIntentVolume = a3;
}

- (float)latestVolume
{
  return self->_latestVolume;
}

- (void)setLatestVolume:(float)a3
{
  self->_latestVolume = a3;
}

- (float)permanentOffsetFactor
{
  return self->_permanentOffsetFactor;
}

- (void)setPermanentOffsetFactor:(float)a3
{
  self->_permanentOffsetFactor = a3;
}

- (BOOL)permanentOffsetIsEnabled
{
  return self->_permanentOffsetIsEnabled;
}

- (void)setPermanentOffsetIsEnabled:(BOOL)a3
{
  self->_permanentOffsetIsEnabled = a3;
}

@end
