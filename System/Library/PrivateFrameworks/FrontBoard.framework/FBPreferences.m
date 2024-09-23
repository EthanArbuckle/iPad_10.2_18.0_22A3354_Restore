@implementation FBPreferences

+ (id)sharedInstance
{
  if (sharedInstance___once_1 != -1)
    dispatch_once(&sharedInstance___once_1, &__block_literal_global_28);
  return (id)sharedInstance___prefs;
}

void __31__FBPreferences_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[FBPreferences _init]([FBPreferences alloc], "_init");
  v1 = (void *)sharedInstance___prefs;
  sharedInstance___prefs = (uint64_t)v0;

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBPreferences;
  return -[BSAbstractDefaultDomain _initWithDomain:](&v3, sel__initWithDomain_, CFSTR("com.apple.frontboard"));
}

- (void)_bindAndRegisterDefaults
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableXPCServicesEndpointHack");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("disableXPCServicesEndpointHack"), MEMORY[0x1E0C9AAA0], 1);

}

@end
