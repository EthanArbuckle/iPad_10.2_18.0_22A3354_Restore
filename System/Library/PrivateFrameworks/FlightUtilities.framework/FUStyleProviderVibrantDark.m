@implementation FUStyleProviderVibrantDark

- (int64_t)blendMode
{
  return 2;
}

- (id)compositingFilter
{
  return (id)*MEMORY[0x24BDE5B68];
}

@end
