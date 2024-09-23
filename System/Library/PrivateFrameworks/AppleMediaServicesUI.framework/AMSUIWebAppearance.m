@implementation AMSUIWebAppearance

- (id)copyWithZone:(_NSZone *)a3
{
  AMSUIWebAppearance *v4;

  v4 = -[AMSUIWebAppearance init](+[AMSUIWebAppearance allocWithZone:](AMSUIWebAppearance, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_backgroundColor, self->_backgroundColor);
  return v4;
}

+ (AMSUIWebAppearance)defaultAppearance
{
  AMSUIWebAppearance *v2;
  void *v3;

  v2 = objc_alloc_init(AMSUIWebAppearance);
  objc_msgSend((id)objc_opt_class(), "defaultPlatformBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebAppearance setBackgroundColor:](v2, "setBackgroundColor:", v3);

  return v2;
}

+ (AMSUIWebAppearance)tableViewAppearance
{
  AMSUIWebAppearance *v2;
  void *v3;

  v2 = objc_alloc_init(AMSUIWebAppearance);
  objc_msgSend((id)objc_opt_class(), "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebAppearance setBackgroundColor:](v2, "setBackgroundColor:", v3);

  return v2;
}

- (void)updateBackgroundColorWithJSString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];
  _QWORD v15[8];

  v15[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v14[0] = CFSTR("-apple-system-background");
    objc_msgSend((id)objc_opt_class(), "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    v14[1] = CFSTR("-apple-system-clear");
    objc_msgSend((id)objc_opt_class(), "systemClearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v6;
    v14[2] = CFSTR("-apple-system-secondary-background");
    objc_msgSend((id)objc_opt_class(), "secondarySystemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v7;
    v14[3] = CFSTR("-apple-system-tertiary-background");
    objc_msgSend((id)objc_opt_class(), "tertiarySystemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v8;
    v14[4] = CFSTR("-apple-system-grouped-background");
    objc_msgSend((id)objc_opt_class(), "systemGroupedBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v9;
    v14[5] = CFSTR("-apple-system-secondary-grouped-background");
    objc_msgSend((id)objc_opt_class(), "secondarySystemGroupedBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[5] = v10;
    v14[6] = CFSTR("-apple-system-tertiary-grouped-background");
    objc_msgSend((id)objc_opt_class(), "tertiarySystemGroupedBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[6] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13
      || (objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromHexString:", v4),
          (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSUIWebAppearance setBackgroundColor:](self, "setBackgroundColor:", v13);

    }
  }

}

+ (UIColor)defaultPlatformBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "ams_defaultPlatformBackgroundColor");
}

+ (UIColor)systemBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "ams_primaryBackground");
}

+ (UIColor)systemClearColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "ams_clear");
}

+ (UIColor)secondarySystemBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "ams_secondaryBackground");
}

+ (UIColor)tertiarySystemBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemBackgroundColor");
}

+ (UIColor)systemGroupedBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "ams_primaryGroupedBackground");
}

+ (UIColor)secondarySystemGroupedBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "ams_secondaryGroupedBackground");
}

+ (id)ams_tertiarySystemFillColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
}

+ (UIColor)tertiarySystemGroupedBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemGroupedBackgroundColor");
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
