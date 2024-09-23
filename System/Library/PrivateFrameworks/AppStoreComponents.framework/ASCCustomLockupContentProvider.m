@implementation ASCCustomLockupContentProvider

- (ASCCustomLockupContentProvider)initWithLockupView:(id)a3
{
  id v4;
  ASCCustomLockupContentProvider *v5;
  ASCCustomLockupContentProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASCCustomLockupContentProvider;
  v5 = -[ASCCustomLockupContentProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_lockupView, v4);

  return v6;
}

- (id)badgeView
{
  return 0;
}

- (ASCLockupView)lockupView
{
  return (ASCLockupView *)objc_loadWeakRetained((id *)&self->_lockupView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lockupView);
}

@end
