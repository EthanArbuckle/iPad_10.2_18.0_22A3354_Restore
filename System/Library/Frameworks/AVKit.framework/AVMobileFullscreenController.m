@implementation AVMobileFullscreenController

- (void)updatePresentationStateTo:(unint64_t)a3
{
  NSObject *v5;
  unint64_t presentationState;
  void *v7;
  char v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_presentationState != a3)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      presentationState = self->_presentationState;
      v10 = 136315650;
      v11 = "-[AVMobileFullscreenController updatePresentationStateTo:]";
      v12 = 2048;
      v13 = presentationState;
      v14 = 2048;
      v15 = a3;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s current presentation state: %ld -> new presentation state: %ld", (uint8_t *)&v10, 0x20u);
    }

    self->_presentationState = a3;
    -[AVMobileFullscreenController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[AVMobileFullscreenController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fullscreenControllerDidChangePresentationState:", self);

    }
  }
}

- (AVMobileFullscreenControllerDelegate)delegate
{
  return (AVMobileFullscreenControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (AVMobileFullscreenController)initWithPlayerViewController:(id)a3
{
  if (self)
    objc_storeWeak((id *)&self->_playerViewController, a3);
  return self;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)exitFullscreen:(id)a3
{
  AVPlayerViewController **p_playerViewController;
  id v4;
  id WeakRetained;

  p_playerViewController = &self->_playerViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_playerViewController);
  objc_msgSend(WeakRetained, "exitFullscreen:", v4);

}

- (void)enterFullscreen:(id)a3
{
  AVPlayerViewController **p_playerViewController;
  id v4;
  id WeakRetained;

  p_playerViewController = &self->_playerViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_playerViewController);
  objc_msgSend(WeakRetained, "enterFullScreen:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_playerViewController);
}

@end
