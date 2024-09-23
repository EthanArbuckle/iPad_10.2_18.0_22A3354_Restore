@implementation VibrantTableViewCell

- (void)setUsesVibrantEffect:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_usesVibrantEffect != a3)
  {
    v3 = a3;
    self->_usesVibrantEffect = a3;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VibrantTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

    -[VibrantTableViewCell sf_setUsesVibrantSelection:](self, "sf_setUsesVibrantSelection:", v3);
  }
}

- (BOOL)usesVibrantEffect
{
  return self->_usesVibrantEffect;
}

@end
