@implementation AAUISpecifierSpinnerController

- (AAUISpecifierSpinnerController)initWithSpecifier:(id)a3
{
  id v5;
  AAUISpecifierSpinnerController *v6;
  AAUISpecifierSpinnerController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUISpecifierSpinnerController;
  v6 = -[AAUISpecifierSpinnerController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_specifier, a3);

  return v7;
}

- (void)startSpinning
{
  +[AAUIPSSpecifier _startSpinnerWithSpecifier:](AAUIPSSpecifier, "_startSpinnerWithSpecifier:", self->_specifier);
}

- (void)stopSpinning
{
  +[AAUIPSSpecifier _stopSpinnerWithSpecifier:](AAUIPSSpecifier, "_stopSpinnerWithSpecifier:", self->_specifier);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end
