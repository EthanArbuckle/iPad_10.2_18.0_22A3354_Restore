@implementation CSPageContentComponent

- (CSPageContentComponent)init
{
  CSPageContentComponent *v2;
  CSPageContentComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSPageContentComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CSComponent setType:](v2, "setType:", 4);
    -[CSPageContentComponent setSuppressHorizontalBounce:](v3, "setSuppressHorizontalBounce:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v3;
}

- (id)suppressHorizontalBounce:(int64_t)a3
{
  -[CSPageContentComponent setSuppressHorizontalBounce:](self, "setSuppressHorizontalBounce:", a3);
  return self;
}

- (void)setSuppressHorizontalBounce:(int64_t)a3
{
  if (-[CSComponent flag](self, "flag") != a3)
    -[CSComponent setFlag:](self, "setFlag:", a3);
}

@end
