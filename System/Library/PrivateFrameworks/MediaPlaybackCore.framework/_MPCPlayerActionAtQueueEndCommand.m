@implementation _MPCPlayerActionAtQueueEndCommand

- (id)setQueueEndAction:(int64_t)a3
{
  NSArray *supportedActions;
  void *v6;
  void *v7;
  MPCPlayerCommandRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MPCPlayerCommandRequest *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  supportedActions = self->_supportedActions;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(supportedActions) = -[NSArray containsObject:](supportedActions, "containsObject:", v6);

  if (!(_DWORD)supportedActions)
    return 0;
  -[_MPCPlayerCommand response](self, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [MPCPlayerCommandRequest alloc];
  v19 = *MEMORY[0x24BE65978];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "request");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v8, "initWithMediaRemoteCommand:options:controller:label:", 135, v10, v11, v13);

  v17 = *MEMORY[0x24BE65658];
  v18 = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerCommandRequest setUserInitiatedOptions:](v14, "setUserInitiatedOptions:", v15);

  return v14;
}

- (int64_t)actionAtQueueEnd
{
  return self->_actionAtQueueEnd;
}

- (void)setActionAtQueueEnd:(int64_t)a3
{
  self->_actionAtQueueEnd = a3;
}

- (NSArray)supportedActions
{
  return self->_supportedActions;
}

- (void)setSupportedActions:(id)a3
{
  objc_storeStrong((id *)&self->_supportedActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedActions, 0);
}

@end
