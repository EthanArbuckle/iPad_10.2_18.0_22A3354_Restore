@implementation CSStatusBarComponent

- (CSStatusBarComponent)init
{
  CSStatusBarComponent *v2;
  CSStatusBarComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSStatusBarComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSComponent setType:](v2, "setType:", 2);
    -[CSStatusBarComponent setFakeStatusBar:](v3, "setFakeStatusBar:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v3;
}

- (id)fakeStatusBar:(int64_t)a3
{
  -[CSStatusBarComponent setFakeStatusBar:](self, "setFakeStatusBar:", a3);
  return self;
}

- (id)fakeStatusBarLevel:(id)a3
{
  -[CSStatusBarComponent setFakeStatusBarLevel:](self, "setFakeStatusBarLevel:", a3);
  return self;
}

- (void)setFakeStatusBar:(int64_t)a3
{
  if (-[CSComponent flag](self, "flag") != a3)
    -[CSComponent setFlag:](self, "setFlag:", a3);
}

- (void)setFakeStatusBarLevel:(id)a3
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

@end
