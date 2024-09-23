@implementation CSBackgroundComponent

- (CSBackgroundComponent)init
{
  CSBackgroundComponent *v2;
  CSBackgroundComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSBackgroundComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CSComponent setType:](v2, "setType:", 19);
  return v3;
}

- (id)style:(id)a3
{
  -[CSBackgroundComponent setStyle:](self, "setStyle:", a3);
  return self;
}

- (void)setStyle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CSComponent value](self, "value");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[CSComponent setValue:](self, "setValue:", v6);
    v5 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSBackgroundComponent;
  v4 = -[CSComponent copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[CSBackgroundComponent transitionProgress](self, "transitionProgress");
  objc_msgSend(v4, "setTransitionProgress:");
  return v4;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (void)setTransitionProgress:(double)a3
{
  self->_transitionProgress = a3;
}

@end
