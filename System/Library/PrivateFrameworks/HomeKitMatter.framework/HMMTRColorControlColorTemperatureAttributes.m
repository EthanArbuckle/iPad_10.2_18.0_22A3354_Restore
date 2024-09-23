@implementation HMMTRColorControlColorTemperatureAttributes

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMMTRColorControlColorTemperatureAttributes colorMode](self, "colorMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRColorControlColorTemperatureAttributes remainingTime](self, "remainingTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRColorControlColorTemperatureAttributes colorTemperatureMireds](self, "colorTemperatureMireds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("colorMode: %@ remainingTime: %@ colorTemperatureMireds: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)colorTemperatureMireds
{
  return self->_colorTemperatureMireds;
}

- (void)setColorTemperatureMireds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)colorMode
{
  return self->_colorMode;
}

- (void)setColorMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorMode, 0);
  objc_storeStrong((id *)&self->_remainingTime, 0);
  objc_storeStrong((id *)&self->_colorTemperatureMireds, 0);
}

@end
