@implementation HGAudioFeedbackConfiguration

- (HGAudioFeedbackConfiguration)init
{
  HGAudioFeedbackConfiguration *v2;
  HGAudioFeedbackConfigurationInternal *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HGAudioFeedbackConfiguration;
  v2 = -[HGAudioFeedbackConfiguration init](&v8, sel_init);
  if (v2)
  {
    v3 = -[HGAudioFeedbackConfigurationInternal initWithEnableAudioFeedback:enableWaitingTone:audioSessionID:]([HGAudioFeedbackConfigurationInternal alloc], "initWithEnableAudioFeedback:enableWaitingTone:audioSessionID:", 0, 0, 0);
    -[HGAudioFeedbackConfiguration setInternal:](v2, "setInternal:", v3);

    -[HGAudioFeedbackConfiguration internal](v2, "internal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HGAudioFeedbackConfiguration setAudioSessionID:](v2, "setAudioSessionID:", objc_msgSend(v4, "audioSessionID"));

    -[HGAudioFeedbackConfiguration internal](v2, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HGAudioFeedbackConfiguration setEnableAudioFeedback:](v2, "setEnableAudioFeedback:", objc_msgSend(v5, "enableAudioFeedback"));

    -[HGAudioFeedbackConfiguration internal](v2, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HGAudioFeedbackConfiguration setEnableWaitingTone:](v2, "setEnableWaitingTone:", objc_msgSend(v6, "enableWaitingTone"));

  }
  return v2;
}

- (BOOL)enableWaitingTone
{
  void *v2;
  char v3;

  -[HGAudioFeedbackConfiguration internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableWaitingTone");

  return v3;
}

- (void)setEnableWaitingTone:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HGAudioFeedbackConfiguration internal](self, "internal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnableWaitingTone:", v3);

}

- (BOOL)enableAudioFeedback
{
  void *v2;
  char v3;

  -[HGAudioFeedbackConfiguration internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableAudioFeedback");

  return v3;
}

- (void)setEnableAudioFeedback:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HGAudioFeedbackConfiguration internal](self, "internal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnableAudioFeedback:", v3);

}

- (unsigned)audioSessionID
{
  void *v2;
  unsigned int v3;

  -[HGAudioFeedbackConfiguration internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "audioSessionID");

  return v3;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[HGAudioFeedbackConfiguration internal](self, "internal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioSessionID:", v3);

}

- (void)enableAudioFeedbackForHeadGesture:(unint64_t)a3 toEnable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[HGAudioFeedbackConfiguration internal](self, "internal");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enableAudioFeedbackForGestureWithGesture:enable:", a3, v4);

}

- (void)enableAudioFeedbackForHeadGesturePart:(unint64_t)a3 toEnable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[HGAudioFeedbackConfiguration internal](self, "internal");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enableAudioFeedbackForPartGestureWithPart:enable:", a3, v4);

}

- (BOOL)invertedConfirmationAudioFeedbackMode
{
  void *v2;
  char v3;

  -[HGAudioFeedbackConfiguration internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "invertedConfirmationAudioFeedbackMode");

  return v3;
}

- (void)setInvertedConfirmationAudioFeedbackMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HGAudioFeedbackConfiguration internal](self, "internal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInvertedConfirmationAudioFeedbackMode:", v3);

}

- (HGAudioFeedbackConfigurationInternal)internal
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
}

@end
