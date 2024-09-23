@implementation _FCUIFocusSelectionFooterView

- (id)_attributedTextForText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = (objc_class *)MEMORY[0x24BEBB4B8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationWithHierarchicalColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD660];
  -[_FCUIFocusSelectionHeaderFooterView _labelFont](self, "_labelFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationWithFont:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationByApplyingConfiguration:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v14);

  v15 = objc_alloc(MEMORY[0x24BDD1688]);
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(" "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v15, "initWithString:", v16);
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendAttributedString:", v18);

  return v17;
}

- (void)_layoutLabel:(id)a3 inBounds:(CGRect)a4 measuringOnly:(CGSize *)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  uint64_t v31;
  CGFloat v32;
  id v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v32 = a4.origin.x;
  v33 = a3;
  objc_msgSend(v33, "sizeThatFits:", width, height);
  BSRectWithSize();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  CGRectGetMaxY(v34);
  v35.origin.x = v12;
  v35.origin.y = v14;
  v35.size.width = v16;
  v35.size.height = v18;
  CGRectGetHeight(v35);
  -[_FCUIFocusSelectionFooterView traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "displayScale");
  v31 = v20;
  UIRectCenteredXInRectScale();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  if (a5)
  {
    v36.origin.x = v32;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v29 = CGRectGetWidth(v36);
    v37.origin.x = v22;
    v37.origin.y = v24;
    v37.size.width = v26;
    v37.size.height = v28;
    v30 = CGRectGetHeight(v37);
    a5->width = v29;
    a5->height = v30 + 29.0;
  }
  else
  {
    objc_msgSend(v33, "setFrame:", v22, v24, v26, v28, v31);
  }

}

- (void)_configureLabel:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_FCUIFocusSelectionFooterView;
  v4 = a3;
  -[_FCUIFocusSelectionHeaderFooterView _configureLabel:](&v6, sel__configureLabel_, v4);
  objc_msgSend(v4, "setUserInteractionEnabled:", 1, v6.receiver, v6.super_class);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__handleLabelTap_);
  objc_msgSend(v4, "addGestureRecognizer:", v5);

}

- (void)_openURL:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42___FCUIFocusSelectionFooterView__openURL___block_invoke;
  block[3] = &unk_24D20A9C0;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

- (void)_handleLabelTap:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE37EB8], "activitiesSettingsURL", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_FCUIFocusSelectionFooterView _openURL:](self, "_openURL:", v4);

}

@end
