@implementation MediaControlsLanguageOptionTableViewCell

- (MediaControlsLanguageOptionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MediaControlsLanguageOptionTableViewCell *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MediaControlsLanguageOptionTableViewCell;
  v4 = -[MPAVClippingTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsLanguageOptionTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[MediaControlsLanguageOptionTableViewCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsLanguageOptionTableViewCell selectedBackgroundView](v4, "selectedBackgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MediaControlsLanguageOptionTableViewCell textLabel](v4, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

  }
  return v4;
}

@end
