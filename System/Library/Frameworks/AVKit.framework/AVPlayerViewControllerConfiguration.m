@implementation AVPlayerViewControllerConfiguration

- (unint64_t)excludedControls
{
  return self->_excludedControls;
}

+ (id)defaultConfiguration
{
  return objc_alloc_init(AVPlayerViewControllerConfiguration);
}

- (AVPlayerViewControllerConfiguration)init
{
  AVPlayerViewControllerConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerViewControllerConfiguration;
  result = -[AVPlayerViewControllerConfiguration init](&v3, sel_init);
  if (result)
    result->_excludedControls = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVPlayerViewControllerConfiguration *v4;

  v4 = -[AVPlayerViewControllerConfiguration init](+[AVPlayerViewControllerConfiguration allocWithZone:](AVPlayerViewControllerConfiguration, "allocWithZone:", a3), "init");
  -[AVPlayerViewControllerConfiguration setExcludedControls:](v4, "setExcludedControls:", -[AVPlayerViewControllerConfiguration excludedControls](self, "excludedControls"));
  -[AVPlayerViewControllerConfiguration setPrefersFullScreenStyleForEmbeddedMode:](v4, "setPrefersFullScreenStyleForEmbeddedMode:", -[AVPlayerViewControllerConfiguration prefersFullScreenStyleForEmbeddedMode](self, "prefersFullScreenStyleForEmbeddedMode"));
  return v4;
}

- (void)setExcludedControls:(unint64_t)a3
{
  if (self->_excludedControls != a3)
    self->_excludedControls = a3;
}

- (BOOL)prefersFullScreenStyleForEmbeddedMode
{
  return self->_prefersFullScreenStyleForEmbeddedMode;
}

- (void)setPrefersFullScreenStyleForEmbeddedMode:(BOOL)a3
{
  self->_prefersFullScreenStyleForEmbeddedMode = a3;
}

@end
