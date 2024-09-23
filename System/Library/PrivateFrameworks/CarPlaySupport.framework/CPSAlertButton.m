@implementation CPSAlertButton

+ (id)buttonWithCPAlertAction:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location[2];
  id v14;

  v14 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = (id)objc_msgSend(v14, "buttonWithType:", 0);
  if (v12)
  {
    v5 = (id)objc_msgSend(location[0], "title");
    objc_msgSend(v12, "setTitle:forState:");

    v6 = (id)objc_msgSend(location[0], "identifier");
    objc_msgSend(v12, "setIdentifier:");

    v7 = (id)objc_msgSend(v12, "layer");
    objc_msgSend(v7, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

    v8 = (id)objc_msgSend(v12, "layer");
    objc_msgSend(v8, "setCornerRadius:", 8.0);

    v9 = _CPSAlertBackgroundColorForAction(location[0]);
    objc_msgSend(v12, "setBackgroundColor:");

    v11 = (id)objc_msgSend(v12, "titleLabel");
    v10 = (id)objc_msgSend(v12, "_buttonFont");
    objc_msgSend(v11, "setFont:");

    objc_msgSend(v12, "setAlertAction:", location[0]);
  }
  v4 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)buttonTitleColor
{
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  char v7;
  CPAlertAction *v8;
  id v10;

  if ((-[CPSAlertButton isHighlighted](self, "isHighlighted") & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  if ((-[CPSAlertButton isFocused](self, "isFocused") & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
  v5 = (id)-[CPSAlertButton traitCollection](self, "traitCollection");
  v7 = 0;
  v6 = 0;
  if (objc_msgSend(v5, "userInterfaceStyle") == 1)
  {
    v8 = -[CPSAlertButton alertAction](self, "alertAction");
    v7 = 1;
    v6 = -[CPAlertAction style](v8, "style") == CPAlertActionStyleCancel;
  }
  if ((v7 & 1) != 0)

  if (v6)
    return (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v3 = (void *)MEMORY[0x24BDF6950];
  v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v10 = (id)objc_msgSend(v3, "colorWithCGColor:", objc_msgSend(objc_retainAutorelease(v4), "CGColor"));

  return v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v3;
  id v4;
  CPSAlertButton *v5;
  id v6;
  objc_super v7;
  id location[2];
  CPSAlertButton *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)CPSAlertButton;
  -[CPUIButton traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, location[0]);
  v4 = (id)-[CPSAlertButton titleLabel](v9, "titleLabel");
  v3 = -[CPSAlertButton _buttonFont](v9, "_buttonFont");
  objc_msgSend(v4, "setFont:");

  v5 = v9;
  v6 = -[CPSAlertButton buttonTitleColor](v9, "buttonTitleColor");
  -[CPSAlertButton setTitleColor:forState:](v5, "setTitleColor:forState:");

  objc_storeStrong(location, 0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  CPSAlertButton *v4;
  id v5;
  BOOL v7;
  CPSAlertButton *v8;
  id v9;
  CPSAlertButton *v10;
  char v11;
  id v12;
  char v13;
  CPAlertAction *v14;
  char v15;
  id v16;
  id v17;
  id location[2];
  CPSAlertButton *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v4 = (CPSAlertButton *)(id)objc_msgSend(location[0], "nextFocusedItem");
  v7 = v4 == v19;

  v8 = v19;
  v9 = -[CPSAlertButton buttonTitleColor](v19, "buttonTitleColor");
  -[CPSAlertButton setTitleColor:forState:](v8, "setTitleColor:forState:");

  v10 = v19;
  v15 = 0;
  v13 = 0;
  v11 = 0;
  if (v7)
  {
    v16 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    v15 = 1;
    v5 = v16;
  }
  else
  {
    v14 = -[CPSAlertButton alertAction](v19, "alertAction");
    v13 = 1;
    v12 = _CPSAlertBackgroundColorForAction(v14);
    v11 = 1;
    v5 = v12;
  }
  -[CPSAlertButton setBackgroundColor:](v10, "setBackgroundColor:", v5);
  if ((v11 & 1) != 0)

  if ((v13 & 1) != 0)
  if ((v15 & 1) != 0)

  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  id v3;
  CPSAlertButton *v4;
  id v5;
  CPSAlertButton *v6;
  char v7;
  id v8;
  char v9;
  CPAlertAction *v10;
  char v11;
  id v12;
  objc_super v13;
  BOOL v14;
  SEL v15;
  CPSAlertButton *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPSAlertButton;
  -[CPSAlertButton setHighlighted:](&v13, sel_setHighlighted_, a3);
  v4 = v16;
  v5 = -[CPSAlertButton buttonTitleColor](v16, "buttonTitleColor");
  -[CPSAlertButton setTitleColor:forState:](v4, "setTitleColor:forState:");

  v6 = v16;
  v11 = 0;
  v9 = 0;
  v7 = 0;
  if (v14)
  {
    v12 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusPrimaryColor");
    v11 = 1;
    v3 = v12;
  }
  else
  {
    v10 = -[CPSAlertButton alertAction](v16, "alertAction");
    v9 = 1;
    v8 = _CPSAlertBackgroundColorForAction(v10);
    v7 = 1;
    v3 = v8;
  }
  -[CPSAlertButton setBackgroundColor:](v6, "setBackgroundColor:", v3);
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  if ((v11 & 1) != 0)

}

- (id)_buttonFont
{
  id v2;
  id v3;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13[3];
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v13[2] = self;
  v13[1] = (id)a2;
  v6 = (void *)MEMORY[0x24BDF6A78];
  v5 = *MEMORY[0x24BDF77B8];
  v7 = (id)-[CPSAlertButton traitCollection](self, "traitCollection");
  v13[0] = (id)objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5);

  v16 = *MEMORY[0x24BDF78A0];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7868]);
  v17[0] = v8;
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16);

  v9 = v13[0];
  v14 = *MEMORY[0x24BDF7770];
  v15 = v12;
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (id)objc_msgSend(v9, "fontDescriptorByAddingAttributes:");
  v3 = v13[0];
  v13[0] = v2;

  v11 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v13[0], 0.0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return v11;
}

- (id)_externalUnfocusedBorderColor
{
  CPAlertAction *v3;
  id v4;

  v3 = -[CPSAlertButton alertAction](self, "alertAction");
  v4 = _CPSAlertBackgroundColorForAction(v3);

  return v4;
}

- (CPAlertAction)alertAction
{
  return self->_alertAction;
}

- (void)setAlertAction:(id)a3
{
  objc_storeStrong((id *)&self->_alertAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertAction, 0);
}

@end
