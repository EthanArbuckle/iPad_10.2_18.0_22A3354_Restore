@implementation _MPCSleepTimerCommand

- (id)startWithTime:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MPCPlayerCommandRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  MPCPlayerCommandRequest *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v14[0] = *MEMORY[0x24BE659D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = *MEMORY[0x24BE659C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", MPSleepTimerStopModeToMediaRemoteSleepTimerStopMode());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlayerCommand response](self, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [MPCPlayerCommandRequest alloc];
  objc_msgSend(v7, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v8, "initWithMediaRemoteCommand:options:controller:label:", 124, v6, v9, v11);

  return v12;
}

- (id)startForItemEnd
{
  void *v3;
  void *v4;
  void *v5;
  MPCPlayerCommandRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  MPCPlayerCommandRequest *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = *MEMORY[0x24BE659C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", MPSleepTimerStopModeToMediaRemoteSleepTimerStopMode());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlayerCommand response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [MPCPlayerCommandRequest alloc];
  objc_msgSend(v5, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v6, "initWithMediaRemoteCommand:options:controller:label:", 124, v4, v7, v9);

  return v10;
}

- (id)startForChapterEnd
{
  void *v3;
  void *v4;
  void *v5;
  MPCPlayerCommandRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  MPCPlayerCommandRequest *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = *MEMORY[0x24BE659C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", MPSleepTimerStopModeToMediaRemoteSleepTimerStopMode());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlayerCommand response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [MPCPlayerCommandRequest alloc];
  objc_msgSend(v5, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v6, "initWithMediaRemoteCommand:options:controller:label:", 124, v4, v7, v9);

  return v10;
}

- (id)reset
{
  void *v3;
  void *v4;
  void *v5;
  MPCPlayerCommandRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  MPCPlayerCommandRequest *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = *MEMORY[0x24BE659C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", MPSleepTimerStopModeToMediaRemoteSleepTimerStopMode());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MPCPlayerCommand response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [MPCPlayerCommandRequest alloc];
  objc_msgSend(v5, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v6, "initWithMediaRemoteCommand:options:controller:label:", 124, v4, v7, v9);

  return v10;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (double)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(double)a3
{
  self->_fireDate = a3;
}

- (int64_t)stopMode
{
  return self->_stopMode;
}

- (void)setStopMode:(int64_t)a3
{
  self->_stopMode = a3;
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
