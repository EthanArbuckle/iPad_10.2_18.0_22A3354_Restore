@implementation SUUIIPadSearchSeparatorView

- (SUUIIPadSearchSeparatorView)initWithFrame:(CGRect)a3
{
  SUUIIPadSearchSeparatorView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIIPadSearchSeparatorView;
  v3 = -[SUUIIPadSearchSeparatorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIIPadSearchSeparatorView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

@end
