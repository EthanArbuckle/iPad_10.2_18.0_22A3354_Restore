@implementation FAChecklistButtonCell

+ (int64_t)cellStyle
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FAChecklistButtonCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v13, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor", v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChecklistButtonCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v5);

  -[FAChecklistButtonCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE1D0], *MEMORY[0x24BEBB610]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  -[FAChecklistButtonCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setText:", v10);
  -[FAChecklistButtonCell textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineBreakMode:", 0);

  -[FAChecklistButtonCell textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  -[FAChecklistButtonCell setIndentationWidth:](self, "setIndentationWidth:", 51.75);
  -[FAChecklistButtonCell setIndentationLevel:](self, "setIndentationLevel:", 1);
  -[FAChecklistButtonCell setNeedsLayout](self, "setNeedsLayout");
}

@end
