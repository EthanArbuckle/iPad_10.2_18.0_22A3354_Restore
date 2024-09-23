@implementation SRUserAttentionSignalProviderFactory

- (SRUserAttentionSignalProviderFactory)initWithSamplingInterval:(double)a3 attentionLossTimeout:(double)a4 supportedAttentionAwarenessEvents:(unint64_t)a5
{
  SRUserAttentionSignalProviderFactory *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SRUserAttentionSignalProviderFactory;
  result = -[SRUserAttentionSignalProviderFactory init](&v9, "init");
  if (result)
  {
    result->_samplingInterval = a3;
    result->_attentionLossTimeout = a4;
    result->_supportedAttentionAwarenessEvents = a5;
  }
  return result;
}

- (id)faceAttentionAwarenessClient
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = objc_alloc_init((Class)AWAttentionAwarenessClient);
  v5 = objc_msgSend((id)objc_opt_class(self, v4), "_attentionAwarenessConfigurationWithIdentifier:eventMask:samplingInterval:attentionLossTimeout:", CFSTR("com.apple.siri.AttentionAwareness.Face"), -[SRUserAttentionSignalProviderFactory _faceAttentionAwarenessEventMask](self, "_faceAttentionAwarenessEventMask"), self->_samplingInterval, self->_attentionLossTimeout);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setConfiguration:shouldReset:", v6, 1);

  return v3;
}

- (id)touchAttentionAwarenessClient
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = objc_alloc_init((Class)AWAttentionAwarenessClient);
  v5 = objc_msgSend((id)objc_opt_class(self, v4), "_attentionAwarenessConfigurationWithIdentifier:eventMask:samplingInterval:attentionLossTimeout:", CFSTR("com.apple.siri.AttentionAwareness.Touch"), -[SRUserAttentionSignalProviderFactory _touchAttentionAwarenessEventMask](self, "_touchAttentionAwarenessEventMask"), 0.1, 0.1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setConfiguration:shouldReset:", v6, 1);

  return v3;
}

- (id)buttonPressAwarenessClient
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = objc_alloc_init((Class)AWAttentionAwarenessClient);
  v5 = objc_msgSend((id)objc_opt_class(self, v4), "_attentionAwarenessConfigurationWithIdentifier:eventMask:samplingInterval:attentionLossTimeout:", CFSTR("com.apple.siri.AttentionAwareness.ButtonPress"), -[SRUserAttentionSignalProviderFactory _buttonPressAwarenessClientEventMask](self, "_buttonPressAwarenessClientEventMask"), 0.1, 0.1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setConfiguration:shouldReset:", v6, 1);

  return v3;
}

- (id)wakeGestureManager
{
  return +[CMWakeGestureManager sharedManager](CMWakeGestureManager, "sharedManager");
}

- (unint64_t)_faceAttentionAwarenessEventMask
{
  return self->_supportedAttentionAwarenessEvents & 0x81;
}

- (unint64_t)_touchAttentionAwarenessEventMask
{
  return self->_supportedAttentionAwarenessEvents & 0x209;
}

- (unint64_t)_buttonPressAwarenessClientEventMask
{
  return self->_supportedAttentionAwarenessEvents & 3;
}

+ (id)_attentionAwarenessConfigurationWithIdentifier:(id)a3 eventMask:(unint64_t)a4 samplingInterval:(double)a5 attentionLossTimeout:(double)a6
{
  id v9;
  id v10;

  v9 = a3;
  v10 = objc_alloc_init((Class)AWAttentionAwarenessConfiguration);
  objc_msgSend(v10, "setIdentifier:", v9);

  objc_msgSend(v10, "setEventMask:", a4);
  objc_msgSend(v10, "setSamplingInterval:", a5);
  objc_msgSend(v10, "setAttentionLostTimeout:", a6);
  return v10;
}

@end
