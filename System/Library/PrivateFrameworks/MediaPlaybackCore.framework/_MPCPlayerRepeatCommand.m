@implementation _MPCPlayerRepeatCommand

- (id)setRepeatType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  MPCPlayerCommandRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  MPCPlayerCommandRequest *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (!-[_MPCPlayerRepeatCommand supportsChangeRepeat](self, "supportsChangeRepeat"))
    return 0;
  v16 = *MEMORY[0x24BE65998];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", MPRepeatTypeToMediaRemoteRepeatMode());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
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
  v11 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v7, "initWithMediaRemoteCommand:options:controller:label:", 25, v5, v8, v10);

  v14 = *MEMORY[0x24BE65660];
  v15 = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlayerCommandRequest setUserInitiatedOptions:](v11, "setUserInitiatedOptions:", v12);

  return v11;
}

- (id)advance
{
  void *v3;
  MPCPlayerCommandRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  MPCPlayerCommandRequest *v8;
  void *v9;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (-[_MPCPlayerRepeatCommand supportsAdvanceRepeat](self, "supportsAdvanceRepeat"))
  {
    -[_MPCPlayerCommand response](self, "response");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [MPCPlayerCommandRequest alloc];
    objc_msgSend(v3, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v4, "initWithMediaRemoteCommand:options:controller:label:", 7, 0, v5, v7);

    v19 = *MEMORY[0x24BE65660];
    v20[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayerCommandRequest setUserInitiatedOptions:](v8, "setUserInitiatedOptions:", v9);

    return v8;
  }
  else if (-[_MPCPlayerRepeatCommand supportsChangeRepeat](self, "supportsChangeRepeat"))
  {
    -[_MPCPlayerRepeatCommand supportedRepeatTypes](self, "supportedRepeatTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[_MPCPlayerRepeatCommand currentRepeatType](self, "currentRepeatType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "indexOfObject:", v12);

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
    }
    else
    {
      -[_MPCPlayerRepeatCommand supportedRepeatTypes](self, "supportedRepeatTypes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (v13 + 1) % (unint64_t)objc_msgSend(v15, "count");

    }
    -[_MPCPlayerRepeatCommand supportedRepeatTypes](self, "supportedRepeatTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[_MPCPlayerRepeatCommand setRepeatType:](self, "setRepeatType:", objc_msgSend(v17, "integerValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    return v18;
  }
  else
  {
    return 0;
  }
}

- (int64_t)currentRepeatType
{
  return self->_currentRepeatType;
}

- (void)setCurrentRepeatType:(int64_t)a3
{
  self->_currentRepeatType = a3;
}

- (NSArray)supportedRepeatTypes
{
  return self->_supportedRepeatTypes;
}

- (void)setSupportedRepeatTypes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedRepeatTypes, a3);
}

- (BOOL)supportsChangeRepeat
{
  return self->_supportsChangeRepeat;
}

- (void)setSupportsChangeRepeat:(BOOL)a3
{
  self->_supportsChangeRepeat = a3;
}

- (BOOL)supportsAdvanceRepeat
{
  return self->_supportsAdvanceRepeat;
}

- (void)setSupportsAdvanceRepeat:(BOOL)a3
{
  self->_supportsAdvanceRepeat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedRepeatTypes, 0);
}

@end
