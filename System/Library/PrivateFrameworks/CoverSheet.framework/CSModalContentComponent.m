@implementation CSModalContentComponent

- (CSModalContentComponent)init
{
  CSModalContentComponent *v2;
  CSModalContentComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSModalContentComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CSComponent setType:](v2, "setType:", 22);
  return v3;
}

@end
