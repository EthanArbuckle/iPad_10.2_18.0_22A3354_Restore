@implementation CSTintingComponent

- (CSTintingComponent)init
{
  CSTintingComponent *v2;
  CSTintingComponent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSTintingComponent;
  v2 = -[CSComponent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CSComponent setType:](v2, "setType:", 7);
  return v3;
}

@end
