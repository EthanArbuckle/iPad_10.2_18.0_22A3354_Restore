@implementation CRUActionCell

- (void)handleTapOnLabel
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=BATTERY_USAGE&path=BATTERY_HEALTH"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

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
  v13.super_class = (Class)CRUActionCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v13, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("CRImageAlertKey"), v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSTableCell valueLabel](self, "valueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v5);

  -[PSTableCell valueLabel](self, "valueLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);

  -[PSTableCell valueLabel](self, "valueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleTapOnLabel);
  objc_msgSend(v8, "addGestureRecognizer:", v9);

  -[PSTableCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", 1);

  -[PSTableCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleTapOnLabel);
  objc_msgSend(v11, "addGestureRecognizer:", v12);

}

@end
