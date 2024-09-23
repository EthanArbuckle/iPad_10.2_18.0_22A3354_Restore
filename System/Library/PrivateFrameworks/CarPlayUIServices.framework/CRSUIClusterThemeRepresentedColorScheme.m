@implementation CRSUIClusterThemeRepresentedColorScheme

- (CRSUIClusterThemeRepresentedColorScheme)initWithColor:(id)a3
{
  return -[CRSUIClusterThemeRepresentedColorScheme initWithColorScheme:color:linearGradient:](self, "initWithColorScheme:color:linearGradient:", 1, a3, 0);
}

- (CRSUIClusterThemeRepresentedColorScheme)initWithLinearGradient:(id)a3
{
  return -[CRSUIClusterThemeRepresentedColorScheme initWithColorScheme:color:linearGradient:](self, "initWithColorScheme:color:linearGradient:", 2, 0, a3);
}

- (id)initAsMulticolor
{
  return -[CRSUIClusterThemeRepresentedColorScheme initWithColorScheme:color:linearGradient:](self, "initWithColorScheme:color:linearGradient:", 3, 0, 0);
}

- (CRSUIClusterThemeRepresentedColorScheme)initWithColorScheme:(unint64_t)a3 color:(id)a4 linearGradient:(id)a5
{
  id v9;
  id v10;
  CRSUIClusterThemeRepresentedColorScheme *v11;
  CRSUIClusterThemeRepresentedColorScheme *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CRSUIClusterThemeRepresentedColorScheme;
  v11 = -[CRSUIClusterThemeRepresentedColorScheme init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_colorScheme = a3;
    objc_storeStrong((id *)&v11->_themeColor, a4);
    objc_storeStrong((id *)&v12->_linearGradient, a5);
  }

  return v12;
}

- (UIColor)color
{
  return -[CRSUIClusterThemeColor color](self->_themeColor, "color");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (CRSUIClusterThemeRepresentedColorScheme)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CRSUIClusterThemeRepresentedColorScheme *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("colorScheme"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linearGradient"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(v5 - 4) >= 0xFFFFFFFFFFFFFFFDLL && (v5 != 1 || v6) && (v5 != 2 || v7))
  {
    self = -[CRSUIClusterThemeRepresentedColorScheme initWithColorScheme:color:linearGradient:](self, "initWithColorScheme:color:linearGradient:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  unint64_t colorScheme;
  id v5;

  colorScheme = self->_colorScheme;
  v5 = a3;
  objc_msgSend(v5, "encodeUInt64:forKey:", colorScheme, CFSTR("colorScheme"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_themeColor, CFSTR("color"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_linearGradient, CFSTR("linearGradient"));

}

- (unint64_t)colorScheme
{
  return self->_colorScheme;
}

- (CRSUIClusterThemeLinearGradient)linearGradient
{
  return self->_linearGradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linearGradient, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
}

@end
