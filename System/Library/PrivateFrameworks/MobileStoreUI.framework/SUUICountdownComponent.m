@implementation SUUICountdownComponent

- (SUUICountdownComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SUUICountdownComponent *v5;
  SUUICountdown *v6;
  void *v7;
  uint64_t v8;
  SUUICountdown *countdown;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUICountdownComponent;
  v5 = -[SUUIPageComponent initWithCustomPageContext:](&v11, sel_initWithCustomPageContext_, v4);
  if (v5)
  {
    v6 = [SUUICountdown alloc];
    objc_msgSend(v4, "componentDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SUUICountdown initWithCountdownDictionary:](v6, "initWithCountdownDictionary:", v7);
    countdown = v5->_countdown;
    v5->_countdown = (SUUICountdown *)v8;

  }
  return v5;
}

- (int64_t)componentType
{
  return 2;
}

- (SUUICountdown)countdown
{
  return self->_countdown;
}

- (void)setCountdown:(id)a3
{
  objc_storeStrong((id *)&self->_countdown, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countdown, 0);
}

@end
