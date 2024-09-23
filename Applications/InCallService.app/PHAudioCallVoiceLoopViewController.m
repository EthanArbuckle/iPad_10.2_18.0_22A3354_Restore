@implementation PHAudioCallVoiceLoopViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  PHAudioCallVoiceLoopView *v3;
  PHAudioCallVoiceLoopView *voiceLoopView;

  if (!self->_voiceLoopView)
  {
    v3 = objc_alloc_init(PHAudioCallVoiceLoopView);
    voiceLoopView = self->_voiceLoopView;
    self->_voiceLoopView = v3;

    -[PHAudioCallVoiceLoopView setDelegate:](self->_voiceLoopView, "setDelegate:", self);
    -[PHAudioCallVoiceLoopViewController setView:](self, "setView:", self->_voiceLoopView);
  }
}

- (void)stopVoiceLoopButtonPressed
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint8_t v10[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHAudioCallVoiceLoopViewController,stop voice loop button pressed", v10, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopViewController delegate](self, "delegate"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopViewController delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "audioCallVoiceLoopViewControllerRequestedButtonPresentation");

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopViewController delegate](self, "delegate"));
      objc_msgSend(v9, "audioCallVoiceLoopViewControllerRequestedButtonPresentation");

    }
  }
}

- (PHAudioCallVoiceLoopViewControllerDelegate)delegate
{
  return (PHAudioCallVoiceLoopViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHAudioCallVoiceLoopView)voiceLoopView
{
  return (PHAudioCallVoiceLoopView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVoiceLoopView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceLoopView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
