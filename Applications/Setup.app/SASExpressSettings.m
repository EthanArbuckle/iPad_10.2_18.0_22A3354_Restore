@implementation SASExpressSettings

- (int64_t)buddy_userInterfaceStyleModeValue
{
  unsigned int v2;
  int64_t v5;

  if ((-[SASExpressSettings hasAppearanceMode](self, "hasAppearanceMode") & 1) == 0)
    return 0;
  v2 = -[SASExpressSettings appearanceMode](self, "appearanceMode");
  switch(v2)
  {
    case 1u:
      return 1;
    case 2u:
      return 2;
    case 3u:
      return 100;
  }
  return v5;
}

@end
