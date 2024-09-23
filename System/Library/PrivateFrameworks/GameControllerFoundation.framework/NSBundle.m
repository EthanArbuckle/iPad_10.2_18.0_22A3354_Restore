@implementation NSBundle

void __46__NSBundle_GC__GameControllerFoundationBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[NSBundle bundleForClass:](NSBundle_0, "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)GameControllerFoundationBundle_Bundle;
  GameControllerFoundationBundle_Bundle = v0;

}

void __45__NSBundle_GC__GameControllerFrameworkBundle__block_invoke()
{
  Class v0;
  uint64_t v1;
  void *v2;

  v0 = NSClassFromString((NSString *)CFSTR("GCController"));
  if (v0)
  {
    +[NSBundle bundleForClass:](NSBundle_0, "bundleForClass:", v0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)GameControllerFrameworkBundle_Bundle;
    GameControllerFrameworkBundle_Bundle = v1;

  }
}

@end
