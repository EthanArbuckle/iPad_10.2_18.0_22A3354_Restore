@implementation MFComposeStyleSelectorButton

+ (id)buttonWithStyleType:(int64_t)a3 target:(id)a4 action:(SEL)a5
{
  +[MFComposeStyleSelectorButton buttonWithStyleType:target:action:maximumContentSizeCategory:](MFComposeStyleSelectorButton, "buttonWithStyleType:target:action:maximumContentSizeCategory:", a3, a4, a5, *MEMORY[0x1E0DC4938]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)buttonWithStyleType:(int64_t)a3 target:(id)a4 action:(SEL)a5 maximumContentSizeCategory:(id)a6
{
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;

  v9 = a4;
  v10 = a6;
  +[MFComposeStyleSelectorButton buttonWithType:](MFComposeStyleSelectorButton, "buttonWithType:", 0);
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v11[94] = a3;
  v11[95] = v10;
  +[MFComposeTextStyle accessibilityIdenitifierForTextStyleType:](MFComposeTextStyle, "accessibilityIdenitifierForTextStyleType:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", v12);

  objc_msgSend(v11, "_imageForTextStyleType:maximumContentSizeCategory:", a3, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:forState:", v13, 0);

  objc_msgSend(v11, "addTarget:action:forControlEvents:", v9, a5, 64);
  return v11;
}

- (MFComposeStyleSelectorButton)initWithFrame:(CGRect)a3
{
  MFComposeStyleSelectorButton *v3;
  MFComposeStyleSelectorButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFComposeStyleSelectorButton;
  v3 = -[MFComposeStyleSelectorButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MFComposeStyleSelectorButton _commonInit](v3, "_commonInit");
  return v4;
}

- (MFComposeStyleSelectorButton)initWithCoder:(id)a3
{
  id v4;
  MFComposeStyleSelectorButton *v5;
  MFComposeStyleSelectorButton *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFComposeStyleSelectorButton;
  v5 = -[MFComposeStyleSelectorButton initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
    -[MFComposeStyleSelectorButton _commonInit](v5, "_commonInit");

  return v6;
}

- (void)_commonInit
{
  id v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorButton setTintColor:](self, "setTintColor:");

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorButton setTitleColor:forState:](self, "setTitleColor:forState:");

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorButton setBackgroundColor:](self, "setBackgroundColor:");

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFComposeStyleSelectorButton;
  -[MFComposeStyleSelectorButton setSelected:](&v6, sel_setSelected_);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "mailComposeFormatButtonSelectedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeStyleSelectorButton setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (id)_imageForTextStyleType:(int64_t)a3 maximumContentSizeCategory:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  if (a3 != 7
    || (objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamedNumberAware:textStyle:scale:weight:maximumContentSizeCategory:", CFSTR("list.number"), *MEMORY[0x1E0DC4A88], 3, 0, v5), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[MFComposeTextStyle imageNameForTextStyleType:](MFComposeTextStyle, "imageNameForTextStyleType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:textStyle:scale:weight:maximumContentSizeCategory:", v7, *MEMORY[0x1E0DC4A88], 3, 0, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t styleType;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFComposeStyleSelectorButton;
  -[MFComposeStyleSelectorButton traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[MFComposeStyleSelectorButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    styleType = self->_styleType;
    if (styleType)
    {
      -[MFComposeStyleSelectorButton _imageForTextStyleType:maximumContentSizeCategory:](self, "_imageForTextStyleType:maximumContentSizeCategory:", styleType, self->_maximumContentSizeCategory);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeStyleSelectorButton setImage:forState:](self, "setImage:forState:", v9, 0);

    }
  }

}

- (int64_t)styleType
{
  return self->_styleType;
}

- (NSString)maximumContentSizeCategory
{
  return self->_maximumContentSizeCategory;
}

- (void)setMaximumContentSizeCategory:(id)a3
{
  self->_maximumContentSizeCategory = (NSString *)a3;
}

@end
