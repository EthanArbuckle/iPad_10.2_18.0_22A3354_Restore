@implementation CPSGridTemplateCollectionCell

+ (id)reuseIdentifier
{
  return NSStringFromClass((Class)a1);
}

- (void)prepareForReuse
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  id obj;
  uint64_t v8;
  _QWORD __b[8];
  id v10;
  objc_super v11;
  SEL v12;
  CPSGridTemplateCollectionCell *v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)CPSGridTemplateCollectionCell;
  -[CPSGridTemplateCollectionCell prepareForReuse](&v11, sel_prepareForReuse);
  memset(__b, 0, sizeof(__b));
  v6 = (id)-[CPSGridTemplateCollectionCell contentView](v13, "contentView");
  obj = (id)objc_msgSend(v6, "subviews");

  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
  if (v8)
  {
    v3 = *(_QWORD *)__b[2];
    v4 = 0;
    v5 = v8;
    while (1)
    {
      v2 = v4;
      if (*(_QWORD *)__b[2] != v3)
        objc_enumerationMutation(obj);
      v10 = *(id *)(__b[1] + 8 * v4);
      objc_msgSend(v10, "removeFromSuperview");
      ++v4;
      if (v2 + 1 >= v5)
      {
        v4 = 0;
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
        if (!v5)
          break;
      }
    }
  }

  -[CPSGridTemplateCollectionCell setButton:](v13, "setButton:", 0);
}

- (void)setButton:(id)a3
{
  id v3;
  void *v4;
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
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location[2];
  CPSGridTemplateCollectionCell *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v23->_button != location[0])
  {
    objc_storeStrong((id *)&v23->_button, location[0]);
    if (location[0])
    {
      v3 = (id)-[CPSGridTemplateCollectionCell contentView](v23, "contentView");
      objc_msgSend(v3, "addSubview:", location[0]);

      v4 = (void *)MEMORY[0x24BDD1628];
      v21 = (id)objc_msgSend(location[0], "topAnchor");
      v20 = (id)-[CPSGridTemplateCollectionCell contentView](v23, "contentView");
      v19 = (id)objc_msgSend(v20, "topAnchor");
      v18 = (id)objc_msgSend(v21, "constraintEqualToAnchor:constant:", 0.0);
      v24[0] = v18;
      v17 = (id)objc_msgSend(location[0], "leftAnchor");
      v16 = (id)-[CPSGridTemplateCollectionCell contentView](v23, "contentView");
      v15 = (id)objc_msgSend(v16, "leftAnchor");
      v14 = (id)objc_msgSend(v17, "constraintEqualToAnchor:constant:", 2.0);
      v24[1] = v14;
      v13 = (id)objc_msgSend(location[0], "rightAnchor");
      v12 = (id)-[CPSGridTemplateCollectionCell contentView](v23, "contentView");
      v11 = (id)objc_msgSend(v12, "rightAnchor");
      v10 = (id)objc_msgSend(v13, "constraintEqualToAnchor:constant:", -2.0);
      v24[2] = v10;
      v9 = (id)objc_msgSend(location[0], "bottomAnchor");
      v8 = (id)-[CPSGridTemplateCollectionCell contentView](v23, "contentView");
      v7 = (id)objc_msgSend(v8, "bottomAnchor");
      v6 = (id)objc_msgSend(v9, "constraintEqualToAnchor:constant:", -1.0);
      v24[3] = v6;
      v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
      objc_msgSend(v4, "activateConstraints:");

    }
  }
  objc_storeStrong(location, 0);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CPSGridButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
