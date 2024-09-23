@implementation _MPCPlayerRateCommand

- (id)changeValue:(float)a3
{
  float v5;
  float v6;
  MPCPlayerCommandRequest *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  MPCPlayerCommandRequest *v15;
  void *v16;
  void *v17;
  void *v18;

  -[_MPCPlayerRateCommand minimumValue](self, "minimumValue");
  if (v5 <= a3 && (-[_MPCPlayerRateCommand maximumValue](self, "maximumValue"), v6 >= a3))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v9 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE65980]);

    -[_MPCPlayerItemCommand contentItemID](self, "contentItemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      -[_MPCPlayerItemCommand contentItemID](self, "contentItemID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE658D0]);

    }
    -[_MPCPlayerCommand response](self, "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [MPCPlayerCommandRequest alloc];
    objc_msgSend(v14, "controller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v15, "initWithMediaRemoteCommand:options:controller:label:", 20, v8, v16, v18);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (float)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(float)a3
{
  self->_minimumValue = a3;
}

- (float)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(float)a3
{
  self->_maximumValue = a3;
}

@end
