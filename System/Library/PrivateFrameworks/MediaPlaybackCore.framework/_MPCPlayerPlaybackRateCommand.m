@implementation _MPCPlayerPlaybackRateCommand

- (id)setPlaybackRate:(float)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MPCPlayerCommandRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  MPCPlayerCommandRequest *v18;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlayerCommand response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "disablePlaybackRateValidation"))
  {

  }
  else
  {
    -[_MPCPlayerPlaybackRateCommand supportedPlaybackRates](self, "supportedPlaybackRates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if (!v8)
    {
      v18 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE65950]);
  -[_MPCPlayerItemCommand contentItemID](self, "contentItemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[_MPCPlayerItemCommand contentItemID](self, "contentItemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE65928]);

  }
  -[_MPCPlayerCommand response](self, "response");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [MPCPlayerCommandRequest alloc];
  objc_msgSend(v13, "controller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "label");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v14, "initWithMediaRemoteCommand:options:controller:label:", 19, v9, v15, v17);

LABEL_8:
  return v18;
}

- (NSArray)supportedPlaybackRates
{
  return self->_supportedPlaybackRates;
}

- (void)setSupportedPlaybackRates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (float)preferredPlaybackRate
{
  return self->_preferredPlaybackRate;
}

- (void)setPreferredPlaybackRate:(float)a3
{
  self->_preferredPlaybackRate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPlaybackRates, 0);
}

@end
