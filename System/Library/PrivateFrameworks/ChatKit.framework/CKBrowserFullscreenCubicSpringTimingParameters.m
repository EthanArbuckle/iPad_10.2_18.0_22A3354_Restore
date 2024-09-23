@implementation CKBrowserFullscreenCubicSpringTimingParameters

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKBrowserFullscreenCubicSpringTimingParameters;
  v4 = -[CKBrowserFullscreenCubicSpringTimingParameters copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[CKBrowserFullscreenCubicSpringTimingParameters springCubicTimingParameters](self, "springCubicTimingParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpringCubicTimingParameters:", v5);

  return v4;
}

- (UICubicTimingParameters)springCubicTimingParameters
{
  return self->_springCubicTimingParameters;
}

- (void)setSpringCubicTimingParameters:(id)a3
{
  objc_storeStrong((id *)&self->_springCubicTimingParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springCubicTimingParameters, 0);
}

@end
