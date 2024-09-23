@implementation CRSUIClusterThemeColor

- (CRSUIClusterThemeColor)initWithColor:(id)a3
{
  return (CRSUIClusterThemeColor *)-[CRSUIClusterThemeColor _initWithLightModeColor:darkModeColor:](self, "_initWithLightModeColor:darkModeColor:", a3, 0);
}

- (id)_initWithLightModeColor:(id)a3 darkModeColor:(id)a4
{
  id v7;
  id v8;
  CRSUIClusterThemeColor *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRSUIClusterThemeColor;
  v9 = -[CRSUIClusterThemeColor init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lightModeColor, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (UIColor)color
{
  UIColor *darkModeColor;
  UIColor *v4;
  UIColor *v5;
  void *v6;
  UIColor *v7;
  UIColor *v8;
  _QWORD v10[4];
  UIColor *v11;
  UIColor *v12;

  darkModeColor = self->_darkModeColor;
  v4 = self->_lightModeColor;
  if (darkModeColor)
  {
    v5 = self->_darkModeColor;
    v6 = (void *)MEMORY[0x24BDF6950];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __31__CRSUIClusterThemeColor_color__block_invoke;
    v10[3] = &unk_24C769DD0;
    v11 = v5;
    v12 = v4;
    v7 = v4;
    v8 = v5;
    objc_msgSend(v6, "colorWithDynamicProvider:", v10);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __31__CRSUIClusterThemeColor_color__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  v4 = 40;
  if (v3 == 2)
    v4 = 32;
  return *(id *)(a1 + v4);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  UIColor *lightModeColor;
  id v5;

  lightModeColor = self->_lightModeColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lightModeColor, CFSTR("lightModeColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_darkModeColor, CFSTR("darkModeColor"));

}

- (CRSUIClusterThemeColor)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRSUIClusterThemeColor *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lightModeColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("darkModeColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[CRSUIClusterThemeColor initWithLightModeColor:darkModeColor:](self, "initWithLightModeColor:darkModeColor:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeColor, 0);
  objc_storeStrong((id *)&self->_lightModeColor, 0);
}

@end
