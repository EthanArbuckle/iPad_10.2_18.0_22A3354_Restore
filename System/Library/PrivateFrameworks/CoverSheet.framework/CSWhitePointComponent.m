@implementation CSWhitePointComponent

- (CSWhitePointComponent)init
{
  CSWhitePointComponent *v2;
  CSWhitePointComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSWhitePointComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSComponent setType:](v2, "setType:", 18);
    -[CSWhitePointComponent setLighterReduction:](v3, "setLighterReduction:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v3;
}

- (id)lighterReduction:(int64_t)a3
{
  -[CSWhitePointComponent setLighterReduction:](self, "setLighterReduction:", a3);
  return self;
}

- (void)setLighterReduction:(int64_t)a3
{
  if (-[CSComponent flag](self, "flag") != a3)
    -[CSComponent setFlag:](self, "setFlag:", a3);
}

@end
