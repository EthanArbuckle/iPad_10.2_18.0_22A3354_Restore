@implementation ADSingleton

+ (id)sharedInstance
{
  void *v2;
  objc_class *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", CFSTR("Call to unimplemented sharedInstance"), CFSTR("%@ does not implement sharedInstance. Add the CREATE_SHARED_INSTANCE macro to the @implementation"), v4);

  return 0;
}

@end
