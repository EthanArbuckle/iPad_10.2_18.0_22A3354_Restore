@implementation SFUnifiedTabBarItemTitleContainerViewTheme

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)initWithPrimaryTextColor:(id)a3 secondaryTextColor:(id)a4 placeholderTextColor:(id)a5 overrideTintColor:(id)a6 themeColor:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SFUnifiedTabBarItemTitleContainerViewTheme *v17;
  SFUnifiedTabBarItemTitleContainerViewTheme *v18;
  SFUnifiedTabBarItemTitleContainerViewTheme *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SFUnifiedTabBarItemTitleContainerViewTheme;
  v17 = -[SFUnifiedTabBarItemTitleContainerViewTheme init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_primaryTextColor, a3);
    objc_storeStrong((id *)&v18->_secondaryTextColor, a4);
    objc_storeStrong((id *)&v18->_placeholderTextColor, a5);
    objc_storeStrong((id *)&v18->_overrideTintColor, a6);
    objc_storeStrong((id *)&v18->_themeColor, a7);
    v19 = v18;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_overrideTintColor, 0);
  objc_storeStrong((id *)&self->_placeholderTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
}

- (UIColor)placeholderTextColor
{
  return self->_placeholderTextColor;
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)init
{
  void *v3;
  void *v4;
  void *v5;
  SFUnifiedTabBarItemTitleContainerViewTheme *v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFUnifiedTabBarItemTitleContainerViewTheme initWithPrimaryTextColor:secondaryTextColor:placeholderTextColor:](self, "initWithPrimaryTextColor:secondaryTextColor:placeholderTextColor:", v3, v4, v5);

  return v6;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)initWithPrimaryTextColor:(id)a3 secondaryTextColor:(id)a4 placeholderTextColor:(id)a5
{
  return -[SFUnifiedTabBarItemTitleContainerViewTheme initWithPrimaryTextColor:secondaryTextColor:placeholderTextColor:overrideTintColor:themeColor:](self, "initWithPrimaryTextColor:secondaryTextColor:placeholderTextColor:overrideTintColor:themeColor:", a3, a4, a5, 0, 0);
}

- (UIColor)overrideTintColor
{
  return self->_overrideTintColor;
}

@end
