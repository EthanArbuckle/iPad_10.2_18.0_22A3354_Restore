@implementation HGConfiguration

- (HGConfiguration)init
{
  HGConfiguration *v2;
  HGAudioFeedbackConfiguration *v3;
  HGMLConfiguration *v4;
  HGConfigurationInternal *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HGConfigurationInternal *internal;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HGConfiguration;
  v2 = -[HGConfiguration init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HGAudioFeedbackConfiguration);
    -[HGConfiguration setAudioFeedbackConfig:](v2, "setAudioFeedbackConfig:", v3);

    v4 = objc_alloc_init(HGMLConfiguration);
    -[HGConfiguration setMlConfig:](v2, "setMlConfig:", v4);

    v5 = [HGConfigurationInternal alloc];
    -[HGConfiguration mlConfig](v2, "mlConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HGConfiguration audioFeedbackConfig](v2, "audioFeedbackConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HGConfigurationInternal initWithML:audioFeedbackConfig:](v5, "initWithML:audioFeedbackConfig:", v7, v9);
    internal = v2->_internal;
    v2->_internal = (HGConfigurationInternal *)v10;

  }
  return v2;
}

- (BOOL)singleDelivery
{
  return -[HGConfigurationInternal singleDelivery](self->_internal, "singleDelivery");
}

- (void)setSingleDelivery:(BOOL)a3
{
  -[HGConfigurationInternal setSingleDelivery:](self->_internal, "setSingleDelivery:", a3);
}

- (BOOL)enableRawDataLogging
{
  return -[HGConfigurationInternal enableRawDataLogging](self->_internal, "enableRawDataLogging");
}

- (BOOL)requestPartGestures
{
  return -[HGConfigurationInternal requestPartGestures](self->_internal, "requestPartGestures");
}

- (void)setRequestPartGestures:(BOOL)a3
{
  -[HGConfigurationInternal setRequestPartGestures:](self->_internal, "setRequestPartGestures:", a3);
}

- (void)setEnableRawDataLogging:(BOOL)a3
{
  -[HGConfigurationInternal setEnableRawDataLogging:](self->_internal, "setEnableRawDataLogging:", a3);
}

- (void)setAudioFeedbackConfig:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_audioFeedbackConfig, a3);
  v5 = a3;
  objc_msgSend(v5, "internal");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HGConfigurationInternal setAudioFeedbackConfig:](self->_internal, "setAudioFeedbackConfig:", v6);

}

- (void)setMlConfig:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_mlConfig, a3);
  v5 = a3;
  objc_msgSend(v5, "internal");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HGConfigurationInternal setMlConfig:](self->_internal, "setMlConfig:", v6);

}

- (HGMLConfiguration)mlConfig
{
  return self->_mlConfig;
}

- (HGAudioFeedbackConfiguration)audioFeedbackConfig
{
  return self->_audioFeedbackConfig;
}

- (HGConfigurationInternal)internal
{
  return self->_internal;
}

- (void)setInternal:(id)a3
{
  objc_storeStrong((id *)&self->_internal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_audioFeedbackConfig, 0);
  objc_storeStrong((id *)&self->_mlConfig, 0);
}

@end
