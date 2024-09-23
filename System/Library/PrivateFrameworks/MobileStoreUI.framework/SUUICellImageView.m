@implementation SUUICellImageView

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  UIColor *v5;
  UIColor *cachedBackgroundColor;
  void *v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUICellImageView;
  if (-[SUUICellImageView isHighlighted](&v9, sel_isHighlighted) != a3)
  {
    if (v3)
    {
      -[SUUICellImageView backgroundColor](self, "backgroundColor");
      v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
      cachedBackgroundColor = self->_cachedBackgroundColor;
      self->_cachedBackgroundColor = v5;

      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUICellImageView setBackgroundColor:](self, "setBackgroundColor:", v7);
    }
    else
    {
      -[SUUICellImageView setBackgroundColor:](self, "setBackgroundColor:", self->_cachedBackgroundColor);
      v7 = self->_cachedBackgroundColor;
      self->_cachedBackgroundColor = 0;
    }

    v8.receiver = self;
    v8.super_class = (Class)SUUICellImageView;
    -[SUUICellImageView setHighlighted:](&v8, sel_setHighlighted_, v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedBackgroundColor, 0);
}

@end
