@implementation _MPCVocalsControlCommand

- (id)activateVocalsControl:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  MPCPlayerCommandRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  MPCPlayerCommandRequest *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v13 = *MEMORY[0x24BE659F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlayerCommand response](self, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [MPCPlayerCommandRequest alloc];
  objc_msgSend(v6, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v7, "initWithMediaRemoteCommand:options:controller:label:", 142, v5, v8, v10);

  return v11;
}

- (id)setVocalsLevel:(float)a3
{
  float v4;
  double v5;
  MPCPlayerCommandRequest *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  MPCPlayerCommandRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = roundf(a3 / 5.0) * 5.0;
  -[_MPCVocalsControlCommand level](self, "level");
  if (v4 == *(float *)&v5 && -[_MPCVocalsControlCommand isActive](self, "isActive"))
  {
    v6 = 0;
  }
  else
  {
    v7 = *MEMORY[0x24BE659F8];
    v16[0] = *MEMORY[0x24BE659F0];
    v16[1] = v7;
    v17[0] = MEMORY[0x24BDBD1C8];
    *(float *)&v5 = v4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MPCPlayerCommand response](self, "response");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [MPCPlayerCommandRequest alloc];
    objc_msgSend(v10, "controller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v11, "initWithMediaRemoteCommand:options:controller:label:", 142, v9, v12, v14);

  }
  return v6;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (float)level
{
  return self->_level;
}

- (void)setLevel:(float)a3
{
  self->_level = a3;
}

- (float)minLevel
{
  return self->_minLevel;
}

- (void)setMinLevel:(float)a3
{
  self->_minLevel = a3;
}

- (float)maxLevel
{
  return self->_maxLevel;
}

- (void)setMaxLevel:(float)a3
{
  self->_maxLevel = a3;
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (int64_t)disabledReason
{
  return self->_disabledReason;
}

- (void)setDisabledReason:(int64_t)a3
{
  self->_disabledReason = a3;
}

@end
