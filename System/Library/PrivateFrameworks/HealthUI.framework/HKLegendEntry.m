@implementation HKLegendEntry

+ (id)legendEntryWithTitle:(id)a3 dotColor:(id)a4 innerDotColor:(id)a5
{
  id v7;
  id v8;
  id v9;
  HKLegendEntry *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HKLegendEntry initWithTitle:dotColor:innerDotColor:labelColor:icon:iconTint:]([HKLegendEntry alloc], "initWithTitle:dotColor:innerDotColor:labelColor:icon:iconTint:", v9, v8, v7, 0, 0, 0);

  return v10;
}

+ (id)legendEntryWithTitle:(id)a3 labelColor:(id)a4
{
  id v5;
  id v6;
  HKLegendEntry *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HKLegendEntry initWithTitle:dotColor:innerDotColor:labelColor:icon:iconTint:]([HKLegendEntry alloc], "initWithTitle:dotColor:innerDotColor:labelColor:icon:iconTint:", v6, 0, 0, v5, 0, 0);

  return v7;
}

+ (id)legendEntryWithTitle:(id)a3 icon:(id)a4 iconTint:(id)a5
{
  id v7;
  id v8;
  id v9;
  HKLegendEntry *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HKLegendEntry initWithTitle:dotColor:innerDotColor:labelColor:icon:iconTint:]([HKLegendEntry alloc], "initWithTitle:dotColor:innerDotColor:labelColor:icon:iconTint:", v9, 0, 0, 0, v8, v7);

  return v10;
}

- (HKLegendEntry)initWithTitle:(id)a3 dotColor:(id)a4 innerDotColor:(id)a5 labelColor:(id)a6 icon:(id)a7 iconTint:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HKLegendEntry *v20;
  HKLegendEntry *v21;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HKLegendEntry;
  v20 = -[HKLegendEntry init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    -[HKLegendEntry setTitle:](v20, "setTitle:", v14);
    -[HKLegendEntry setDotColor:](v21, "setDotColor:", v15);
    -[HKLegendEntry setInnerDotColor:](v21, "setInnerDotColor:", v16);
    -[HKLegendEntry setLabelColor:](v21, "setLabelColor:", v17);
    -[HKLegendEntry setIcon:](v21, "setIcon:", v18);
    -[HKLegendEntry setIconTint:](v21, "setIconTint:", v19);
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  BOOL v24;

  v4 = a3;
  -[HKLegendEntry title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v10 = 0;
  }
  else
  {
    -[HKLegendEntry title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    v10 = v9 ^ 1;
  }

  -[HKLegendEntry dotColor](self, "dotColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dotColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == v12)
  {
    v16 = 0;
  }
  else
  {
    -[HKLegendEntry dotColor](self, "dotColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dotColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    v16 = v15 ^ 1;
  }

  -[HKLegendEntry labelColor](self, "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == v18)
  {
    v21 = 1;
  }
  else
  {
    -[HKLegendEntry labelColor](self, "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "labelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

  }
  -[HKLegendEntry icon](self, "icon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (((v10 | v16) & 1) != 0)
  {
    v24 = 0;
  }
  else if (v22 == v23)
  {
    v24 = v21;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIColor)dotColor
{
  return self->_dotColor;
}

- (void)setDotColor:(id)a3
{
  objc_storeStrong((id *)&self->_dotColor, a3);
}

- (UIColor)innerDotColor
{
  return self->_innerDotColor;
}

- (void)setInnerDotColor:(id)a3
{
  objc_storeStrong((id *)&self->_innerDotColor, a3);
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (void)setLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_labelColor, a3);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (UIColor)iconTint
{
  return self->_iconTint;
}

- (void)setIconTint:(id)a3
{
  objc_storeStrong((id *)&self->_iconTint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconTint, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_innerDotColor, 0);
  objc_storeStrong((id *)&self->_dotColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
