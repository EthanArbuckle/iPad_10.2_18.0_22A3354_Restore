@implementation CPSMapButton

+ (id)buttonWithCPMapButton:(id)a3
{
  double v3;
  char v4;
  char v5;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  id v11;
  id location[2];
  id v13;

  v13 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10.receiver = v13;
  v10.super_class = (Class)&OBJC_METACLASS___CPSMapButton;
  v11 = objc_msgSendSuper2(&v10, sel_buttonWithType_, 0);
  objc_msgSend(v11, "setMapButton:", location[0]);
  LODWORD(v3) = 1.0;
  objc_msgSend(v11, "setCharge:", v3);
  if (v11)
  {
    v8 = v11;
    v9 = (id)objc_msgSend(location[0], "identifier");
    objc_msgSend(v8, "setIdentifier:");

    v4 = objc_msgSend(location[0], "isEnabled");
    objc_msgSend(v11, "setEnabled:", v4 & 1);
    v5 = objc_msgSend(location[0], "isHidden");
    objc_msgSend(v11, "setHidden:", v5 & 1);
    objc_msgSend(v11, "_updateButtonImages");
  }
  v7 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (float)charge
{
  return 1.0;
}

- (void)setCharge:(float)a3
{
  double v3;
  objc_super v4;
  float v5;
  SEL v6;
  CPSMapButton *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)CPSMapButton;
  LODWORD(v3) = 1.0;
  -[CPSMapButton setCharge:](&v4, sel_setCharge_, v3);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSMapButton *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSMapButton;
  -[CPUIButton traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSMapButton _updateButtonImages](v5, "_updateButtonImages");
  objc_storeStrong(location, 0);
}

- (void)_updateButtonImages
{
  UIImage *v2;
  UIImage *v3;
  CPSMapButton *v4;
  id v5;
  id v6;
  CPMapButton *v7;
  CPMapButton *v8;
  UIImage *v9;
  UIImage *v10;
  id v11[2];
  CPSMapButton *v12;

  v12 = self;
  v11[1] = (id)a2;
  v7 = -[CPSMapButton mapButton](self, "mapButton");
  v11[0] = -[CPMapButton image](v7, "image");

  v8 = -[CPSMapButton mapButton](v12, "mapButton");
  v9 = -[CPMapButton focusedImage](v8, "focusedImage");
  if (v9)
    v2 = v9;
  else
    v2 = (UIImage *)v11[0];
  v10 = v2;

  -[CPSMapButton setImage:forState:](v12, "setImage:forState:", v11[0], 0);
  v4 = v12;
  v3 = v10;
  v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
  v5 = (id)-[UIImage _flatImageWithColor:](v3, "_flatImageWithColor:");
  -[CPSMapButton setImage:forState:](v4, "setImage:forState:");

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v11, 0);
}

- (CPMapButton)mapButton
{
  return self->_mapButton;
}

- (void)setMapButton:(id)a3
{
  objc_storeStrong((id *)&self->_mapButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapButton, 0);
}

@end
