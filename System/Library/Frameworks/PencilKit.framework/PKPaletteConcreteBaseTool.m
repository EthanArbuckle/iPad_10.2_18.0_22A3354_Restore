@implementation PKPaletteConcreteBaseTool

- (NSString)toolIdentifier
{
  return (NSString *)CFSTR("com.apple.ink.pen");
}

- (PKToolConfiguration)configuration
{
  PKToolConfiguration *cachedConfiguration;
  void *v4;
  PKToolConfiguration *v5;
  PKToolConfiguration *v6;

  cachedConfiguration = self->_cachedConfiguration;
  if (!cachedConfiguration)
  {
    -[PKPaletteConcreteBaseTool toolIdentifier](self, "toolIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:](PKToolConfiguration, "defaultConfigurationForToolWithIdentifier:", v4);
    v5 = (PKToolConfiguration *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cachedConfiguration;
    self->_cachedConfiguration = v5;

    cachedConfiguration = self->_cachedConfiguration;
  }
  return cachedConfiguration;
}

- (BOOL)isInkingTool
{
  return -[PKPaletteConcreteBaseTool conformsToProtocol:](self, "conformsToProtocol:", &unk_1EF59C2D8);
}

- (PKPaletteInkingTool)inkingTool
{
  PKPaletteConcreteBaseTool *v3;

  if (-[PKPaletteConcreteBaseTool isInkingTool](self, "isInkingTool"))
    v3 = self;
  else
    v3 = 0;
  return (PKPaletteInkingTool *)v3;
}

- (BOOL)isRulerTool
{
  void *v2;
  char v3;

  -[PKPaletteConcreteBaseTool toolIdentifier](self, "toolIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.tool.ruler"));

  return v3;
}

- (BOOL)isErasingTool
{
  return -[PKPaletteConcreteBaseTool conformsToProtocol:](self, "conformsToProtocol:", &unk_1EF5B0630);
}

- (PKPaletteErasingTool)erasingTool
{
  PKPaletteConcreteBaseTool *v3;

  if (-[PKPaletteConcreteBaseTool isErasingTool](self, "isErasingTool"))
    v3 = self;
  else
    v3 = 0;
  return (PKPaletteErasingTool *)v3;
}

- (BOOL)isLassoTool
{
  return -[PKPaletteConcreteBaseTool conformsToProtocol:](self, "conformsToProtocol:", &unk_1EF5C4170);
}

- (BOOL)isGenerationTool
{
  void *v2;
  char v3;

  -[PKPaletteConcreteBaseTool toolIdentifier](self, "toolIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.generationtool"));

  return v3;
}

- (BOOL)isHandwritingTool
{
  return 0;
}

- (PKPaletteHandwritingTool)handwritingTool
{
  PKPaletteConcreteBaseTool *v3;

  if (-[PKPaletteConcreteBaseTool isHandwritingTool](self, "isHandwritingTool"))
    v3 = self;
  else
    v3 = 0;
  return (PKPaletteHandwritingTool *)v3;
}

- (BOOL)isCustomTool
{
  void *v2;
  char v3;

  -[PKPaletteConcreteBaseTool toolIdentifier](self, "toolIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ink.custom"));

  return v3;
}

- (NSString)toolVariant
{
  return self->_toolVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolVariant, 0);
  objc_storeStrong((id *)&self->_cachedConfiguration, 0);
}

@end
