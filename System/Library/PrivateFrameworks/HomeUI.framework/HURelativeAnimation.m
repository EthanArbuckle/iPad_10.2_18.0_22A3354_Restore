@implementation HURelativeAnimation

- (HURelativeAnimation)initWithAnimationApplier:(id)a3 relativeStart:(double)a4 relativeDuration:(double)a5
{
  id v9;
  HURelativeAnimation *v10;
  HURelativeAnimation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HURelativeAnimation;
  v10 = -[HURelativeAnimation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_applier, a3);
    v11->_relativeStart = a4;
    v11->_relativeDuration = a5;
  }

  return v11;
}

- (HUAnimationApplier)applier
{
  return self->_applier;
}

- (double)relativeStart
{
  return self->_relativeStart;
}

- (double)relativeDuration
{
  return self->_relativeDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applier, 0);
}

@end
