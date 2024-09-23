@implementation HGManager

- (HGManager)initWithDelegate:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  HGManager *v8;
  HGManager *v9;
  HGConfiguration *v10;
  HGManagerInternal *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HGManagerInternal *internal;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HGManager;
  v8 = -[HGManager init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      -[HGManager setConfiguration:](v8, "setConfiguration:", v7);
    }
    else
    {
      v10 = objc_alloc_init(HGConfiguration);
      -[HGManager setConfiguration:](v9, "setConfiguration:", v10);

    }
    v11 = [HGManagerInternal alloc];
    -[HGManager configuration](v9, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HGManagerInternal initWithDelegate:config:](v11, "initWithDelegate:config:", v6, v13);
    internal = v9->_internal;
    v9->_internal = (HGManagerInternal *)v14;

  }
  return v9;
}

- (void)start
{
  -[HGManagerInternal start](self->_internal, "start");
}

- (void)stop
{
  -[HGManagerInternal stopWith:](self->_internal, "stopWith:", 0);
}

- (void)stopWithCompletionHandler:(id)a3
{
  -[HGManagerInternal stopWith:](self->_internal, "stopWith:", a3);
}

- (void)setMuteAudioFeedback:(BOOL)a3
{
  -[HGManagerInternal muteAudioFeedbackWithSetting:](self->_internal, "muteAudioFeedbackWithSetting:", a3);
}

- (void)setRequestPartGestures:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HGManagerInternal configuration](self->_internal, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestPartGestures:", v3);

}

- (BOOL)muteAudioFeedback
{
  return self->_muteAudioFeedback;
}

- (BOOL)requestPartGestures
{
  return self->_requestPartGestures;
}

- (HGConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (HGManagerInternal)internal
{
  return (HGManagerInternal *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
