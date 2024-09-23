@implementation CSStatusBarBackgroundComponent

- (CSStatusBarBackgroundComponent)init
{
  CSStatusBarBackgroundComponent *v2;
  CSStatusBarBackgroundComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSStatusBarBackgroundComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSComponent setType:](v2, "setType:", 8);
    -[CSStatusBarBackgroundComponent setShowBackgroundWhileTransitioning:](v3, "setShowBackgroundWhileTransitioning:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v3;
}

- (id)showBackgroundWhileTransitioning:(int64_t)a3
{
  -[CSStatusBarBackgroundComponent setShowBackgroundWhileTransitioning:](self, "setShowBackgroundWhileTransitioning:", a3);
  return self;
}

- (void)setShowBackgroundWhileTransitioning:(int64_t)a3
{
  if (-[CSComponent flag](self, "flag") != a3)
    -[CSComponent setFlag:](self, "setFlag:", a3);
}

@end
