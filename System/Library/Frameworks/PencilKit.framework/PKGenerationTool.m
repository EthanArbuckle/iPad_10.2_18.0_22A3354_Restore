@implementation PKGenerationTool

- (PKGenerationTool)init
{
  void *v3;
  void *v4;
  PKGenerationTool *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.466666667, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInk inkWithType:color:weight:](PKInk, "inkWithType:color:weight:", CFSTR("com.apple.ink.generationtool"), v3, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PKGenerationTool;
  v5 = -[PKTool _initWithInk:](&v7, sel__initWithInk_, v4);

  return v5;
}

- (id)_initWithInk:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  objc_msgSend(a3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInk inkWithType:color:weight:](PKInk, "inkWithType:color:weight:", CFSTR("com.apple.ink.generationtool"), v4, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKGenerationTool;
  v6 = -[PKTool _initWithInk:](&v8, sel__initWithInk_, v5);

  return v6;
}

- (id)_defaultItemIdentifier
{
  return CFSTR("com.apple.tool.generation");
}

- (Class)_toolPickerItemClass
{
  return (Class)objc_opt_class();
}

@end
