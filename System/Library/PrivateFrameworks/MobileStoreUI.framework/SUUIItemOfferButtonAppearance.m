@implementation SUUIItemOfferButtonAppearance

- (SUUIItemOfferButtonAppearance)initWithColorScheme:(id)a3
{
  id v4;
  SUUIItemOfferButtonAppearance *v5;
  uint64_t v6;
  UIColor *buttonColor;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  UIColor *confirmationColor;
  objc_super v15;

  v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)SUUIItemOfferButtonAppearance;
    v5 = -[SUUIItemOfferButtonAppearance init](&v15, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "secondaryTextColor");
      v6 = objc_claimAutoreleasedReturnValue();
      buttonColor = v5->_buttonColor;
      v5->_buttonColor = (UIColor *)v6;

      switch(objc_msgSend(v4, "schemeStyle"))
      {
        case 0:
        case 2:
          v8 = (void *)MEMORY[0x24BEBD4B8];
          v9 = 0.0980392157;
          v10 = 0.670588235;
          v11 = 0.125490196;
          goto LABEL_7;
        case 1:
        case 3:
          v8 = (void *)MEMORY[0x24BEBD4B8];
          v9 = 0.2;
          v10 = 0.792156863;
          v11 = 0.231372549;
LABEL_7:
          objc_msgSend(v8, "colorWithRed:green:blue:alpha:", v9, v10, v11, 1.0);
          v12 = objc_claimAutoreleasedReturnValue();
          confirmationColor = v5->_confirmationColor;
          v5->_confirmationColor = (UIColor *)v12;

          break;
        default:
          break;
      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (UIColor)buttonColor
{
  return self->_buttonColor;
}

- (UIColor)confirmationColor
{
  return self->_confirmationColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationColor, 0);
  objc_storeStrong((id *)&self->_buttonColor, 0);
}

@end
