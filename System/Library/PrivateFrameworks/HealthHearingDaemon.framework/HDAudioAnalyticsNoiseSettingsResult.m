@implementation HDAudioAnalyticsNoiseSettingsResult

- (HDAudioAnalyticsNoiseSettingsResult)initWithWatchPairedWithNoiseApp:(BOOL)a3 hasNoiseEnabled:(BOOL)a4 hasNoiseNotificationsEnabled:(BOOL)a5 noiseThreshold:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  HDAudioAnalyticsNoiseSettingsResult *v11;
  HDAudioAnalyticsNoiseSettingsResult *v12;
  NSNumber *v13;
  NSNumber *noiseThreshold;
  HDAudioAnalyticsNoiseSettingsResult *v15;
  objc_super v17;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDAudioAnalyticsNoiseSettingsResult;
  v11 = -[HDAudioAnalyticsNoiseSettingsResult init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    -[HDAudioAnalyticsNoiseSettingsResult setHasWatchPairedWithNoiseApp:](v11, "setHasWatchPairedWithNoiseApp:", v8);
    -[HDAudioAnalyticsNoiseSettingsResult setHasNoiseEnabled:](v12, "setHasNoiseEnabled:", v7);
    -[HDAudioAnalyticsNoiseSettingsResult setHasNoiseNotificationsEnabled:](v12, "setHasNoiseNotificationsEnabled:", v6);
    if (v6)
    {
      v13 = (NSNumber *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    noiseThreshold = v12->_noiseThreshold;
    v12->_noiseThreshold = v13;

    v15 = v12;
  }

  return v12;
}

- (BOOL)hasWatchPairedWithNoiseApp
{
  return self->_hasWatchPairedWithNoiseApp;
}

- (void)setHasWatchPairedWithNoiseApp:(BOOL)a3
{
  self->_hasWatchPairedWithNoiseApp = a3;
}

- (BOOL)hasNoiseEnabled
{
  return self->_hasNoiseEnabled;
}

- (void)setHasNoiseEnabled:(BOOL)a3
{
  self->_hasNoiseEnabled = a3;
}

- (BOOL)hasNoiseNotificationsEnabled
{
  return self->_hasNoiseNotificationsEnabled;
}

- (void)setHasNoiseNotificationsEnabled:(BOOL)a3
{
  self->_hasNoiseNotificationsEnabled = a3;
}

- (NSNumber)noiseThreshold
{
  return self->_noiseThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noiseThreshold, 0);
}

@end
