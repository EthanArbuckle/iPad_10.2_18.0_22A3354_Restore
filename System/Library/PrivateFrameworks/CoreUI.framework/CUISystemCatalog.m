@implementation CUISystemCatalog

- (BOOL)hasStylePresetWithName:(id)a3 styleConfiguration:(id)a4
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("NSLetterpress"), a4);
}

- (BOOL)hasStylePresetWithName:(id)a3
{
  return -[CUISystemCatalog hasStylePresetWithName:styleConfiguration:](self, "hasStylePresetWithName:styleConfiguration:", a3, 0);
}

@end
