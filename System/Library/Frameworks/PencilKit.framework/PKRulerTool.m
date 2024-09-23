@implementation PKRulerTool

- (PKRulerTool)init
{
  void *v3;
  void *v4;
  void *v5;
  PKRulerTool *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", CFSTR("com.apple.ink.custom"), v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:](PKToolConfiguration, "defaultConfigurationForToolWithIdentifier:", CFSTR("com.apple.tool.ruler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKRulerTool;
  v6 = -[PKTool _initWithInk:configuration:](&v8, sel__initWithInk_configuration_, v4, v5);

  return v6;
}

- (BOOL)_isRulerTool
{
  return 1;
}

- (id)_defaultItemIdentifier
{
  return CFSTR("com.apple.tool.ruler");
}

- (Class)_toolPickerItemClass
{
  return (Class)objc_opt_class();
}

@end
