@implementation _EXHostViewControllerSessionConfiguration

- (_EXHostViewControllerSessionConfiguration)initWithSceneIdentifier:(id)a3
{
  id v5;
  _EXHostViewControllerSessionConfiguration *v6;
  _EXHostViewControllerSessionConfiguration *v7;
  _EXSceneInitializationParameters *initializationParameters;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EXHostViewControllerSessionConfiguration;
  v6 = -[_EXHostViewControllerSessionConfiguration init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sceneIdentifier, a3);
    initializationParameters = v7->_initializationParameters;
    v7->_initializationParameters = 0;

    objc_msgSend(MEMORY[0x24BDC79B8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_beginHostingImmediately = objc_msgSend(v9, "startUIHostingSessionImmediately");

    v7->_sizeBridgingOptions = -1;
    v7->__shouldHostRemoteTextEffectsWindow = 1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  v5 = (void *)-[NSString copy](self->_sceneIdentifier, "copy");
  objc_msgSend(v4, "setSceneIdentifier:", v5);

  objc_msgSend(v4, "setInitializationParameters:", self->_initializationParameters);
  objc_msgSend(v4, "setBeginHostingImmediately:", self->_beginHostingImmediately);
  objc_msgSend(v4, "setSizeBridgingOptions:", self->_sizeBridgingOptions);
  objc_msgSend(v4, "setInitialFrame:", self->_initialFrame.origin.x, self->_initialFrame.origin.y, self->_initialFrame.size.width, self->_initialFrame.size.height);
  objc_msgSend(v4, "setInvalidationHandler:", self->_invalidationHandler);
  objc_msgSend(v4, "set_shouldHostRemoteTextEffectsWindow:", self->__shouldHostRemoteTextEffectsWindow);
  return v4;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_EXSceneInitializationParameters)initializationParameters
{
  return self->_initializationParameters;
}

- (void)setInitializationParameters:(id)a3
{
  objc_storeStrong((id *)&self->_initializationParameters, a3);
}

- (CGRect)initialFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialFrame.origin.x;
  y = self->_initialFrame.origin.y;
  width = self->_initialFrame.size.width;
  height = self->_initialFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)_shouldHostRemoteTextEffectsWindow
{
  return self->__shouldHostRemoteTextEffectsWindow;
}

- (void)set_shouldHostRemoteTextEffectsWindow:(BOOL)a3
{
  self->__shouldHostRemoteTextEffectsWindow = a3;
}

- (BOOL)beginHostingImmediately
{
  return self->_beginHostingImmediately;
}

- (void)setBeginHostingImmediately:(BOOL)a3
{
  self->_beginHostingImmediately = a3;
}

- (int64_t)sizeBridgingOptions
{
  return self->_sizeBridgingOptions;
}

- (void)setSizeBridgingOptions:(int64_t)a3
{
  self->_sizeBridgingOptions = a3;
}

- (BOOL)retryOnHostingFailure
{
  return self->_retryOnHostingFailure;
}

- (void)setRetryOnHostingFailure:(BOOL)a3
{
  self->_retryOnHostingFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_initializationParameters, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end
