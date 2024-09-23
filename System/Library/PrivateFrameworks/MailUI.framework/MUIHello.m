@implementation MUIHello

- (NSString)world
{
  MUIHelloSwift *v2;
  void *v3;

  v2 = objc_alloc_init(MUIHelloSwift);
  -[MUIHelloSwift world](v2, "world");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
