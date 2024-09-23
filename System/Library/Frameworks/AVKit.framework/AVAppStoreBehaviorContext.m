@implementation AVAppStoreBehaviorContext

- (void)setBehavior:(id)a3
{
  objc_storeWeak((id *)&self->_behavior, a3);
}

- (AVAppStoreBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4;
  AVAppStoreBehaviorContext *v5;
  AVAppStoreBehaviorContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVAppStoreBehaviorContext;
  v5 = -[AVAppStoreBehaviorContext init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_playerViewController, v4);

  return v6;
}

- (AVPlayerViewController)playerViewController
{
  return (AVPlayerViewController *)objc_loadWeakRetained((id *)&self->_playerViewController);
}

- (void)_toggleControlsGenerationIfPossible
{
  id WeakRetained;
  int v4;
  AVPlayerViewController **p_playerViewController;
  id v6;
  _BOOL8 v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_behavior);
  v4 = objc_msgSend(WeakRetained, "prefersFirstGenerationControlsWhenEmbeddedInline");

  if (v4)
  {
    p_playerViewController = &self->_playerViewController;
    v6 = objc_loadWeakRetained((id *)p_playerViewController);
    v7 = objc_msgSend(v6, "controlsGeneration") == 0;

    v8 = objc_loadWeakRetained((id *)p_playerViewController);
    objc_msgSend(v8, "setControlsGeneration:", v7);

  }
}

- (AVAppStoreBehavior)behavior
{
  return (AVAppStoreBehavior *)objc_loadWeakRetained((id *)&self->_behavior);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_behavior);
  objc_destroyWeak((id *)&self->_playerViewController);
}

@end
