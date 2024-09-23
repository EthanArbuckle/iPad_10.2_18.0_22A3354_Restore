@implementation CPSStyledTextButton

+ (id)buttonWithTextButton:(id)a3
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
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = (id)objc_msgSend((id)objc_opt_class(), "buttonWithType:", 1);
  if (v17)
  {
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (id)objc_msgSend(location[0], "title");
    objc_msgSend(v17, "setTitle:forState:");

    v8 = (id)objc_msgSend(location[0], "identifier");
    objc_msgSend(v17, "setIdentifier:");

    v9 = (id)objc_msgSend(v17, "layer");
    objc_msgSend(v9, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

    v10 = (id)objc_msgSend(v17, "layer");
    objc_msgSend(v10, "setCornerRadius:", 8.0);

    v11 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    objc_msgSend(v17, "setTitleColor:forState:");

    v12 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    objc_msgSend(v17, "setTintColor:");

    v13 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
    objc_msgSend(v17, "setTitleColor:forState:");

    objc_msgSend(v17, "setEnabled:", objc_msgSend(location[0], "isEnabled") & 1);
    objc_msgSend(v17, "setClipsToBounds:", 1);
    v15 = (id)objc_msgSend(v17, "titleLabel");
    v14 = (id)objc_msgSend(v17, "_buttonFont");
    objc_msgSend(v15, "setFont:");

    v16 = objc_msgSend(location[0], "textStyle");
    if (v16)
    {
      if (v16 == 1)
      {
        v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
        objc_msgSend(v17, "setTitleColor:forState:");

      }
      else if (v16 == 2)
      {
        v5 = (id)objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
        objc_msgSend(v17, "setTitleColor:forState:");

      }
    }
  }
  v4 = v17;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v4;
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
  UIFont *v11;
  id v12;
  id v13[2];
  CPSStyledTextButton *v14;
  UIFont *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v14 = self;
  v13[1] = (id)a2;
  v11 = -[CPSStyledTextButton fontOverride](self, "fontOverride");

  if (v11)
  {
    v15 = -[CPSStyledTextButton fontOverride](v14, "fontOverride");
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDF6A78];
    v5 = *MEMORY[0x24BDF77B8];
    v7 = (id)-[CPSStyledTextButton traitCollection](v14, "traitCollection");
    v13[0] = (id)objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5);

    v18 = *MEMORY[0x24BDF78A0];
    v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7868]);
    v19[0] = v8;
    v12 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18);

    v9 = v13[0];
    v16 = *MEMORY[0x24BDF7770];
    v17 = v12;
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v2 = (id)objc_msgSend(v9, "fontDescriptorByAddingAttributes:");
    v3 = v13[0];
    v13[0] = v2;

    v15 = (UIFont *)(id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v13[0], 0.0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(v13, 0);
  }
  return v15;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  CPSStyledTextButton *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)CPSStyledTextButton;
  -[CPUIButton traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, location[0]);
  v4 = (id)-[CPSStyledTextButton titleLabel](v7, "titleLabel");
  v3 = -[CPSStyledTextButton _buttonFont](v7, "_buttonFont");
  objc_msgSend(v4, "setFont:");

  objc_storeStrong(location, 0);
}

- (id)_externalUnfocusedBorderColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemQuaternaryColor", a2, self);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (UIFont)fontOverride
{
  return self->_fontOverride;
}

- (void)setFontOverride:(id)a3
{
  objc_storeStrong((id *)&self->_fontOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontOverride, 0);
}

@end
