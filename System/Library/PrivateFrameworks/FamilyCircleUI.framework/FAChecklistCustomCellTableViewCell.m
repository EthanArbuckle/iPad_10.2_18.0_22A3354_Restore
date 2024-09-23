@implementation FAChecklistCustomCellTableViewCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  objc_super v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)FAChecklistCustomCellTableViewCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v38, sel_refreshCellContentsWithSpecifier_, v4);
  v5 = objc_alloc_init(MEMORY[0x24BDD1688]);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75AA8]);
  v6 = 0x24BDD1000uLL;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v7 = objc_alloc(MEMORY[0x24BDD1458]);
    v8 = *MEMORY[0x24BEBB360];
    v41 = *MEMORY[0x24BEBB360];
    v9 = *MEMORY[0x24BEBE220];
    objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE220], *MEMORY[0x24BEBB610]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v7, "initWithString:attributes:", v37, v11);

    v6 = 0x24BDD1000;
    objc_msgSend(v5, "appendAttributedString:", v12);

  }
  else
  {
    v8 = *MEMORY[0x24BEBB360];
    v9 = *MEMORY[0x24BEBE220];
  }
  v13 = v5;
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D28], v4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(*(Class *)(v6 + 1112));
  v39 = v8;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithString:attributes:", v36, v16);

  objc_msgSend(v13, "appendAttributedString:", v17);
  -[FAChecklistCustomCellTableViewCell imageView](self, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[FAChecklistCustomCellTableViewCell imageView](self, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChecklistCustomCellTableViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[FAChecklistCustomCellTableViewCell imageView](self, "imageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setContentMode:", 9);

  -[FAChecklistCustomCellTableViewCell imageView](self, "imageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setContentMode:", 1);

  -[FAChecklistCustomCellTableViewCell detailTextLabel](self, "detailTextLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAttributedText:", v13);

  -[FAChecklistCustomCellTableViewCell detailTextLabel](self, "detailTextLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLineBreakMode:", 0);

  -[FAChecklistCustomCellTableViewCell detailTextLabel](self, "detailTextLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNumberOfLines:", 0);

  -[FAChecklistCustomCellTableViewCell textLabel](self, "textLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFont:", v30);

  -[FAChecklistCustomCellTableViewCell textLabel](self, "textLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "propertyForKey:", *MEMORY[0x24BE75D50]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v32);

  -[FAChecklistCustomCellTableViewCell textLabel](self, "textLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setLineBreakMode:", 0);

  -[FAChecklistCustomCellTableViewCell textLabel](self, "textLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setNumberOfLines:", 0);

  -[FAChecklistCustomCellTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

@end
