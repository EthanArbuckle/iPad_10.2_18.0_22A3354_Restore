@implementation PK

void __PK_UIApplicationIsSystemShell_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  -[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v2 = v0;
    LOBYTE(v0) = objc_msgSend(v0, "isFrontBoard");
    v1 = v2;
  }
  PK_UIApplicationIsSystemShell___result = (char)v0;

}

@end
