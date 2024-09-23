@implementation TDThemePart

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02u-%@"), -[TDThemeConstant identifier](self, "identifier"), -[TDThemeConstant displayName](self, "displayName"));
}

@end
