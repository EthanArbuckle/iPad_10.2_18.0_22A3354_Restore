@implementation AXVSBaseService

- (id)serviceName
{
  return CFSTR("com.apple.AXUIViewService");
}

- (id)sb_initialClassName
{
  return &stru_24D47F5D0;
}

- (id)sb_alertDefinition
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BEB0AE8]);
  -[AXVSBaseService serviceName](self, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVSBaseService sb_initialClassName](self, "sb_initialClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithServiceName:viewControllerClassName:", v4, v5);

  return v6;
}

+ (id)sharedInstance
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
