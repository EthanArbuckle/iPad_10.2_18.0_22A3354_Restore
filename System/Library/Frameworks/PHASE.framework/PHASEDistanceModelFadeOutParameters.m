@implementation PHASEDistanceModelFadeOutParameters

- (double)maximumDistance
{
  return self->_cullDistance;
}

- (void)setMaximumDistance:(double)a3
{
  objc_class *v6;
  void *v7;
  id v8;

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cullDistance = PHASEGetPropertyBounded<double>(v8, v7, a3, 1.0, 1.79769313e308);

}

- (PHASEDistanceModelFadeOutParameters)init
{
  -[PHASEDistanceModelFadeOutParameters doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEDistanceModelFadeOutParameters)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEDistanceModelFadeOutParameters)initWithCullDistance:(double)cullDistance
{
  PHASEDistanceModelFadeOutParameters *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHASEDistanceModelFadeOutParameters;
  v5 = -[PHASEDistanceModelFadeOutParameters init](&v10, sel_init);
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cullDistance = PHASEGetPropertyBounded<double>(v7, v8, cullDistance, 1.0, 1.79769313e308);

  }
  return v5;
}

- (double)cullDistance
{
  return self->_cullDistance;
}

@end
