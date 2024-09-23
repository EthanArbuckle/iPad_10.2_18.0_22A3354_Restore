@implementation SGBannerDividerParameter

- (SGBannerDividerParameter)initWithPosition:(int)a3 color:(id)a4
{
  id v6;
  SGBannerDividerParameter *v7;
  SGBannerDividerParameter *v8;
  UIColor *v9;
  UIColor *color;

  v6 = a4;
  v7 = -[SGBannerDividerParameter init](self, "init");
  v8 = v7;
  if (v7)
  {
    v7->_position = a3;
    if (v6)
    {
      v9 = (UIColor *)v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    color = v8->_color;
    v8->_color = v9;

  }
  return v8;
}

- (int)position
{
  return self->_position;
}

- (id)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
