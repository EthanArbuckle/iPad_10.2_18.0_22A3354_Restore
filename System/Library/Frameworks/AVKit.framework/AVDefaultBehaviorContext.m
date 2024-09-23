@implementation AVDefaultBehaviorContext

- (AVDefaultBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4;
  AVDefaultBehaviorContext *v5;
  AVDefaultBehaviorContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVDefaultBehaviorContext;
  v5 = -[AVDefaultBehaviorContext init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_playerViewController, v4);

  return v6;
}

- (AVPlayerViewController)playerViewController
{
  return (AVPlayerViewController *)objc_loadWeakRetained((id *)&self->_playerViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_playerViewController);
}

@end
