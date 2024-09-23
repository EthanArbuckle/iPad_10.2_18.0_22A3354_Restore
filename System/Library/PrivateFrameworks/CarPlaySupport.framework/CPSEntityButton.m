@implementation CPSEntityButton

+ (id)buttonWithEntityButton:(id)a3
{
  id v4;
  objc_super v5;
  id v6[2];
  id location[2];
  id v8;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6[1] = 0;
  v5.receiver = v8;
  v5.super_class = (Class)&OBJC_METACLASS___CPSEntityButton;
  v6[0] = objc_msgSendSuper2(&v5, sel_buttonWithType_, 0);
  objc_msgSend(v6[0], "setEntityButton:", location[0]);
  v4 = v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (void)setEntityButton:(id)a3
{
  char v3;
  id v4;
  id v5;
  CPButton *v6;
  id v7;
  id v8;
  NSString *v9;
  CPSEntityButton *v10;
  id v11;
  CPButton *v12;
  NSString *v13;
  id location[2];
  CPSEntityButton *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v15->_entityButton != location[0])
  {
    objc_storeStrong((id *)&v15->_entityButton, location[0]);
    v10 = v15;
    v12 = -[CPSEntityButton entityButton](v15, "entityButton");
    v11 = -[CPSEntityButton CPSButtonTitleForButton:](v10, "CPSButtonTitleForButton:");
    -[CPSActionButton setButtonText:](v15, "setButtonText:");

    v13 = -[CPSActionButton buttonText](v15, "buttonText");
    if (v13)
    {
      v9 = -[CPSActionButton buttonText](v15, "buttonText");
      v16[0] = v9;
      v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      -[CPSEntityButton setAccessibilityUserInputLabels:](v15, "setAccessibilityUserInputLabels:");

    }
    v6 = -[CPSEntityButton entityButton](v15, "entityButton", v15);
    v5 = (id)objc_msgSend(v4, "CPSButtonImageForButton:");
    -[CPSActionButton setButtonImage:](v15, "setButtonImage:");

    v3 = objc_msgSend(location[0], "isEnabled");
    -[CPSActionButton setEnabled:](v15, "setEnabled:", v3 & 1);
    v7 = (id)objc_msgSend(location[0], "identifier");
    -[CPSButton setIdentifier:](v15, "setIdentifier:");

    -[CPSEntityButton setNeedsLayout](v15, "setNeedsLayout");
  }
  objc_storeStrong(location, 0);
}

- (id)CPSButtonImageForButton:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id location[2];
  CPSEntityButton *v9;
  id v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)objc_msgSend(location[0], "image");

  if (v7)
  {
    v10 = (id)objc_msgSend(location[0], "image");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (id)-[CPSEntityButton traitCollection](v9, "traitCollection");
      v10 = (id)_CPUIGlyphFactoryWithTraitCollection();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (id)-[CPSEntityButton traitCollection](v9, "traitCollection");
        v10 = (id)_CPUIGlyphFactoryWithTraitCollection();

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = (id)-[CPSEntityButton traitCollection](v9, "traitCollection");
          v10 = (id)_CPUIGlyphFactoryWithTraitCollection();

        }
        else
        {
          v10 = 0;
        }
      }
    }
  }
  objc_storeStrong(location, 0);
  return v10;
}

- (id)CPSButtonTitleForButton:(id)a3
{
  id v4;
  id location[3];
  id v6;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)objc_msgSend(location[0], "title");

  if (v4)
  {
    v6 = (id)objc_msgSend(location[0], "title");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = CPSLocalizedStringForKey(CFSTR("MESSAGE"));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = CPSLocalizedStringForKey(CFSTR("CALL"));
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 = CPSLocalizedStringForKey(CFSTR("DIRECTIONS"));
        else
          v6 = 0;
      }
    }
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (CPButton)entityButton
{
  return self->_entityButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityButton, 0);
}

@end
