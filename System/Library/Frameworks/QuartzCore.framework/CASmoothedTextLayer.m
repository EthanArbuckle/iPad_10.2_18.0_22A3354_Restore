@implementation CASmoothedTextLayer

- (unsigned)fontSmoothingStyle
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super.super._attr.layer, 0xE4u, (const CGAffineTransform *)0xC, (id *)&v3);
  return v3;
}

- (void)setFontSmoothingStyle:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super.super._attr.layer, (const void *)0xE4, (const CGAffineTransform *)0xC, (double *)&v3);
}

@end
