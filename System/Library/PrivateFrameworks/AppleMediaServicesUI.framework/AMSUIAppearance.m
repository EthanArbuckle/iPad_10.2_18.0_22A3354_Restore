@implementation AMSUIAppearance

- (AMSUIAppearance)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIAppearance;
  return -[AMSUIAppearance init](&v3, sel_init);
}

- (AMSUIAppearance)initWithDictionary:(id)a3
{
  id v4;
  AMSUIAppearance *v5;
  void *v6;
  NSDictionary *v7;
  AMSUIAppearance *v8;
  NSDictionary *messageFontDictionary;
  void *v10;
  NSDictionary *v11;
  NSDictionary *titleFontDictionary;

  v4 = a3;
  v5 = -[AMSUIAppearance init](self, "init");
  if (!v5)
  {
LABEL_11:
    v8 = v5;
    goto LABEL_12;
  }
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitleFont"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    messageFontDictionary = v5->__messageFontDictionary;
    v5->__messageFontDictionary = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("titleFont"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    titleFontDictionary = v5->__titleFontDictionary;
    v5->__titleFontDictionary = v11;

    goto LABEL_11;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(AMSUIAppearance);
}

+ (id)_accessoryButtonColorWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessoryButtonColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessoryButtonColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_accessoryButtonBackgroundColorWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessoryButtonBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessoryButtonBackgroundColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_accessorySecondaryButtonBackgroundColorWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessorySecondaryButtonBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessorySecondaryButtonBackgroundColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_accessorySecondaryButtonColorWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessorySecondaryButtonColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessorySecondaryButtonColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_accessoryButtonFontWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessoryButtonFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    +[AMSUIFontParser fontWithDictionary:](AMSUIFontParser, "fontWithDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessoryButtonColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_accessorySecondaryButtonFontWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessorySecondaryButtonFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    +[AMSUIFontParser fontWithDictionary:](AMSUIFontParser, "fontWithDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessorySecondaryButtonColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_backgroundColorWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("background"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    +[AMSUIAppearance _backgroundColorWithMetadataDictionary:](AMSUIAppearance, "_backgroundColorWithMetadataDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_backgroundColorWithMetadataDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("backgroundType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("solid")))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("color"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_backgroundImageWithDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("background"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
  {
    +[AMSUIAppearance _backgroundImageWithMetadataDictionary:](AMSUIAppearance, "_backgroundImageWithMetadataDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_backgroundImageWithMetadataDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("backgroundType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("gradient")))
  {
    objc_msgSend(a1, "_gradientImageWithDictionary:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_footerButtonColorWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("footerButtonColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("footerButtonColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_footerButtonFontWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("footerButtonFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    +[AMSUIFontParser fontWithDictionary:](AMSUIFontParser, "fontWithDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("footerButtonFont"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (int64_t)_iconAnimationPlayCount:(id)a3
{
  void *v3;
  id v4;
  int64_t v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("iconAnimationPlayCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
    v5 = objc_msgSend(v4, "integerValue");
  else
    v5 = -90;

  return v5;
}

+ (id)_imageSymbolConfigurationWithDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("iconSymbolConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD660], "ams_imageSymbolConfigurationWithDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_imageTintColorWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("imageTintColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("imageTintColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_impressionAnimationIdentifierWithDictionary:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("impressionAnimationIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

+ (id)_messageFontWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtitleFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    +[AMSUIFontParser fontWithDictionary:](AMSUIFontParser, "fontWithDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtitleFont"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_messageTextColorWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtitleColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtitleColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_separatorColorWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("separatorColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("separatorColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_titleFontWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("titleFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    +[AMSUIFontParser fontWithDictionary:](AMSUIFontParser, "fontWithDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("titleFont"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (id)_titleTextColorWithDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("titleColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("titleColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;

  }
  return v6;
}

+ (int64_t)_primaryImageRenderingModeWithDictionary:(id)a3
{
  void *v3;
  id v4;
  int64_t v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("primaryImageRenderingMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4)
    v5 = objc_msgSend(v4, "integerValue");
  else
    v5 = 0;

  return v5;
}

+ (id)_gradientLayerTypeForRawValue:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDE5C48];
  v10[0] = CFSTR("axial");
  v10[1] = CFSTR("conic");
  v4 = *MEMORY[0x24BDE5C50];
  v11[0] = v3;
  v11[1] = v4;
  v10[2] = CFSTR("radial");
  v11[2] = *MEMORY[0x24BDE5C58];
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_gradientImageWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  void *v31;
  CGSize v33;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDE56B8], "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gradientType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 400.0, 400.0);
  if (v7)
  {
    objc_msgSend(a1, "_gradientLayerTypeForRawValue:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v5, "setType:", v8);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("colors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  if (v10 && objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColors:", v11);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  if (v13)
    objc_msgSend(v5, "setLocations:", v13);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startPoint"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;

  if (v15 && objc_msgSend(v15, "count") == 2)
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;
    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    objc_msgSend(v5, "setStartPoint:", v18, v20);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endPoint"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;

  if (v22 && objc_msgSend(v22, "count") == 2)
  {
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;
    objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    objc_msgSend(v5, "setEndPoint:", v25, v27);

  }
  objc_msgSend(v5, "frame");
  v33.width = v28;
  v33.height = v29;
  UIGraphicsBeginImageContext(v33);
  objc_msgSend(v5, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v30, "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

id __48__AMSUIAppearance__gradientImageWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_colorFromDictionary:", a2);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "CGColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_defaultButtonBackgroundColorForStyle:(unint64_t)a3 withTraitCollection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor", a3, a4);
}

+ (id)_defaultBackgroundColorForStyle:(unint64_t)a3 withTraitCollection:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  switch(a3)
  {
    case 0uLL:
      v7 = (void *)MEMORY[0x24BEBD4B8];
      objc_msgSend(MEMORY[0x24BEBD4B8], "ams_secondaryBackground");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemBackgroundColor");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "quaternarySystemFillColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2uLL:
      v7 = (void *)MEMORY[0x24BEBD4B8];
      objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "quaternarySystemFillColor");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v10 = (void *)v9;
      objc_msgSend(v7, "ams_dynamicColorWithLightColor:darkColor:", v8, v9);
      a3 = objc_claimAutoreleasedReturnValue();

      break;
    case 3uLL:
    case 6uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "ams_secondaryBackground");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemBackgroundColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "ams_primaryBackground");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      a3 = v6;
      break;
    default:
      break;
  }

  return (id)a3;
}

+ (id)_defaultButtonContentColorForStyle:(unint64_t)a3 isFooter:(BOOL)a4
{
  void *v4;
  void *v5;

  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "ams_appTint");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
    case 3uLL:
    case 6uLL:
      v4 = (void *)MEMORY[0x24BEBD4B8];
      if (!a4)
        goto LABEL_7;
      objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = (void *)MEMORY[0x24BEBD4B8];
LABEL_7:
      objc_msgSend(v4, "quaternaryLabelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v5;
}

+ (id)_defaultButtonTextColorForStyle:(unint64_t)a3 isFooter:(BOOL)a4
{
  if (a3 == 1)
    objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor", 1, a4);
  else
    +[AMSUIAppearance _defaultButtonContentColorForStyle:isFooter:](AMSUIAppearance, "_defaultButtonContentColorForStyle:isFooter:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultButtonIconColorForStyle:(unint64_t)a3 isFooter:(BOOL)a4
{
  void *v4;
  void *v5;

  if (a3 || a4)
  {
    if (a3 != 5)
    {
      +[AMSUIAppearance _defaultButtonContentColorForStyle:isFooter:](AMSUIAppearance, "_defaultButtonContentColorForStyle:isFooter:", a3, a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    v4 = (void *)MEMORY[0x24BEBD4B8];
    if (!a4)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x24BEBD4B8];
  }
  objc_msgSend(v4, "tertiaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

+ (id)_defaultButtonTextFontForStyle:(unint64_t)a3 withTraitCollection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = (id)*MEMORY[0x24BEBE1D0];
  if (a3 - 2 >= 2 && a3 != 6)
  {
    if (!a3)
    {
      v7 = objc_msgSend(v5, "userInterfaceIdiom");
      v8 = (id *)MEMORY[0x24BEBE220];
      if (v7 == 1)
        v8 = (id *)MEMORY[0x24BEBE1F0];
      goto LABEL_11;
    }
LABEL_12:
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v6, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", 0x8000);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v12, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  if (objc_msgSend(v5, "userInterfaceIdiom") == 5)
    goto LABEL_12;
  if (objc_msgSend(v5, "userInterfaceIdiom") != 6)
  {
    v8 = (id *)MEMORY[0x24BEBE220];
LABEL_11:
    v10 = *v8;

    v6 = v10;
    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

+ (id)_defaultImageViewColorForStyle:(unint64_t)a3
{
  void *v3;

  v3 = 0;
  if (a3 <= 6)
  {
    if (((1 << a3) & 0x4C) != 0)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (((1 << a3) & 3) != 0)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

+ (id)_defaultMessageColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
}

+ (id)_defaultMessageFontForStyle:(unint64_t)a3 withTraitCollection:(id)a4
{
  id v5;
  NSString *v6;
  BOOL IsAccessibilityCategory;
  id *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a4;
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  v8 = (id *)MEMORY[0x24BEBE220];
  if (!IsAccessibilityCategory)
  {
    if (a3 == 1)
    {
      v8 = (id *)MEMORY[0x24BEBE1E0];
    }
    else if (!a3 && objc_msgSend(v5, "userInterfaceIdiom") == 1)
    {
      v8 = (id *)MEMORY[0x24BEBE1F0];
    }
  }
  v9 = *v8;
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_defaultSeparatorColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
}

+ (id)_defaultTitleColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

+ (id)_defaultTitleFontForStyle:(unint64_t)a3 withTraitCollection:(id)a4
{
  id v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v5 = a4;
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BEBE200], v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v8, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (id)*MEMORY[0x24BEBE1D0];
    if (a3 < 2 || a3 == 6 && objc_msgSend(v5, "userInterfaceIdiom") != 5)
    {
      v10 = (id)*MEMORY[0x24BEBE220];

      v8 = v10;
    }
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v8, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v12, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (NSDictionary)_messageFontDictionary
{
  return self->__messageFontDictionary;
}

- (void)set_messageFontDictionary:(id)a3
{
  objc_storeStrong((id *)&self->__messageFontDictionary, a3);
}

- (NSDictionary)_titleFontDictionary
{
  return self->__titleFontDictionary;
}

- (void)set_titleFontDictionary:(id)a3
{
  objc_storeStrong((id *)&self->__titleFontDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titleFontDictionary, 0);
  objc_storeStrong((id *)&self->__messageFontDictionary, 0);
}

@end
