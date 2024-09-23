@implementation AXMOutputComponent

+ (BOOL)isSupported
{
  return 1;
}

- (AXMOutputComponent)init
{
  AXMOutputComponent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMOutputComponent;
  result = -[AXMOutputComponent init](&v3, sel_init);
  if (result)
    result->_componentState = 0;
  return result;
}

- (id)description
{
  unint64_t componentState;
  const __CFString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  componentState = self->_componentState;
  if (componentState > 2)
    v4 = &stru_1E6260C18;
  else
    v4 = off_1E625D460[componentState];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@<%p>: state:'%@'"), v7, self, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)transitionToState:(int64_t)a3 completion:(id)a4
{
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  -[AXMOutputComponent setComponentState:](self, "setComponentState:", a3);
  v6[2]();

}

- (BOOL)canHandleRequest:(id)a3
{
  return 0;
}

- (int64_t)componentState
{
  return self->_componentState;
}

- (void)setComponentState:(int64_t)a3
{
  self->_componentState = a3;
}

@end
