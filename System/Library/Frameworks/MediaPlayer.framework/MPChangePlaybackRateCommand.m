@implementation MPChangePlaybackRateCommand

- (id)_mediaRemoteCommandInfoOptions
{
  void *v3;
  void *v4;

  if (self->_supportedPlaybackRates)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_supportedPlaybackRates, *MEMORY[0x1E0D4C870]);
    if (fabsf(self->_preferredRate) > 0.00000011921)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D4C7F8]);

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setPreferredRate:(float)a3
{
  if (vabds_f32(self->_preferredRate, a3) > 0.00000011921)
  {
    self->_preferredRate = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setSupportedPlaybackRates:(NSArray *)supportedPlaybackRates
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;

  v6 = supportedPlaybackRates;
  if (!-[NSArray isEqualToArray:](self->_supportedPlaybackRates, "isEqualToArray:"))
  {
    v4 = (NSArray *)-[NSArray copy](v6, "copy");
    v5 = self->_supportedPlaybackRates;
    self->_supportedPlaybackRates = v4;

    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }

}

- (float)preferredRate
{
  return self->_preferredRate;
}

- (id)newCommandEventWithPlaybackRate:(float)a3
{
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = -[MPRemoteCommand mediaRemoteCommandType](self, "mediaRemoteCommandType");
  v11 = *MEMORY[0x1E0D4CC48];
  *(float *)&v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPRemoteCommand newCommandEventWithCommandType:options:](self, "newCommandEventWithCommandType:options:", v5, v8);

  return v9;
}

- (NSArray)supportedPlaybackRates
{
  return self->_supportedPlaybackRates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPlaybackRates, 0);
}

@end
