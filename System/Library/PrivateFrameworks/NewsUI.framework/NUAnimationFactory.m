@implementation NUAnimationFactory

- (NUAnimationFactory)initWithMediaTimingFunction:(id)a3
{
  id v5;
  NUAnimationFactory *v6;
  NUAnimationFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUAnimationFactory;
  v6 = -[NUAnimationFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaTimingFunction, a3);

  return v7;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", a4);
}

- (CAMediaTimingFunction)mediaTimingFunction
{
  return self->_mediaTimingFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaTimingFunction, 0);
}

@end
