@implementation MPVocalsControlCommand

- (id)_mediaRemoteCommandInfoOptions
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_vocalsControlActive);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D4C8B0]);

  *(float *)&v5 = self->_vocalsLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D4C8C0]);

  *(float *)&v7 = self->_minVocalsLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D4C8D0]);

  *(float *)&v9 = self->_maxVocalsLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D4C8C8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_continuous);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D4C8B8]);

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (void)setVocalsLevel:(float)a3
{
  if (self->_vocalsLevel != a3)
  {
    self->_vocalsLevel = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setVocalsControlActive:(BOOL)a3
{
  if (self->_vocalsControlActive != a3)
  {
    self->_vocalsControlActive = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setMinVocalsLevel:(float)a3
{
  if (self->_minVocalsLevel != a3)
  {
    self->_minVocalsLevel = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setMaxVocalsLevel:(float)a3
{
  if (self->_maxVocalsLevel != a3)
  {
    self->_maxVocalsLevel = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setContinuous:(BOOL)a3
{
  if (self->_continuous != a3)
  {
    self->_continuous = a3;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (BOOL)vocalsControlActive
{
  return self->_vocalsControlActive;
}

- (float)vocalsLevel
{
  return self->_vocalsLevel;
}

- (float)minVocalsLevel
{
  return self->_minVocalsLevel;
}

- (float)maxVocalsLevel
{
  return self->_maxVocalsLevel;
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

@end
