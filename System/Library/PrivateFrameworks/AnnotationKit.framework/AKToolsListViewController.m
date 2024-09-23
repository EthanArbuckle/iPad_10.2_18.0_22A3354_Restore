@implementation AKToolsListViewController

+ (id)defaultCellItemTypes
{
  return &unk_24F1CF0D8;
}

- (AKToolsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AKToolsListViewController *v4;
  AKToolsListViewController *v5;
  AKToolsListViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKToolsListViewController;
  v4 = -[AKToolsListViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    -[AKToolsListViewController _updateDeviceLocked](v6, "_updateDeviceLocked");
    -[AKToolsListViewController _reloadCellItemTypes](v6, "_reloadCellItemTypes");

  }
  return v5;
}

- (AKToolsListViewController)initWithCoder:(id)a3
{
  AKToolsListViewController *v3;
  AKToolsListViewController *v4;
  AKToolsListViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKToolsListViewController;
  v3 = -[AKToolsListViewController initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    -[AKToolsListViewController _updateDeviceLocked](v5, "_updateDeviceLocked");
    -[AKToolsListViewController _reloadCellItemTypes](v5, "_reloadCellItemTypes");

  }
  return v4;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)AKToolsListViewController;
  -[AKToolsListViewController viewDidLoad](&v24, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDF6E58]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AKToolsListViewController setTableView:](self, "setTableView:", v4);

  -[AKToolsListViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[AKToolsListViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", self);

  v7 = *MEMORY[0x24BDF7718];
  v8 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v9 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v10 = *(double *)(MEMORY[0x24BDF7718] + 24);
  -[AKToolsListViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSeparatorInset:", v7, v8, v9, v10);

  -[AKToolsListViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSeparatorStyle:", 0);

  -[AKToolsListViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlwaysBounceVertical:", 0);

  -[AKToolsListViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlwaysBounceHorizontal:", 0);

  -[AKToolsListViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKImageDescriptionRowIdentifier"));

  -[AKToolsListViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKTextRowIdentifier"));

  -[AKToolsListViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKLoupeRowIdentifier"));

  -[AKToolsListViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKSignatureRowIdentifier"));

  -[AKToolsListViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKShapesRowIdentifier"));

  -[AKToolsListViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKOpacityRowIdentifier"));

  -[AKToolsListViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("shapes-picker-popover"));

  -[AKToolsListViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolsListViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ak_addSubview:withEdgeInsets:", v23, v7, v8, v9, v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AKToolsListViewController;
  -[AKToolsListViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[AKToolsListViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[AKToolsListViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  v7 = v6;

  -[AKToolsListViewController _buttonViewForShapes](self, "_buttonViewForShapes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  -[AKToolsListViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9 + 24.0, v7);

}

- (void)_updateDeviceLocked
{
  unsigned int (*v3)(_QWORD);
  _Unwind_Exception *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v3 = (unsigned int (*)(_QWORD))off_255A27000;
  v9 = off_255A27000;
  if (!off_255A27000)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_228FFA84C;
    v5[3] = &unk_24F1A7890;
    v5[4] = &v6;
    sub_228FFA84C((uint64_t)v5);
    v3 = (unsigned int (*)(_QWORD))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    v4 = (_Unwind_Exception *)sub_22907F950();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  self->_isDeviceLocked = v3(0) - 1 < 2;
}

- (void)_shapeButtonPressed:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  v4 = objc_msgSend(a3, "currentTag");
  -[AKToolsListViewController delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 != 763000)
  {
    v8 = (void *)v5;
    v7 = objc_opt_respondsToSelector();
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "toolsList:didSelectToolWithTag:", self, v4);
      v6 = v8;
    }
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  AKToolsListViewController *v12;
  uint64_t v13;
  id v14;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[AKToolsListViewController delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[AKToolsListViewController cellItemTypes](self, "cellItemTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  switch(v10)
  {
    case 0:
      v11 = v14;
      v12 = self;
      v13 = 764014;
      goto LABEL_8;
    case 1:
      v13 = 764019;
      goto LABEL_7;
    case 2:
      v13 = 764020;
      goto LABEL_7;
    case 4:
      objc_msgSend(v14, "toolsListDidSelectOpacityItem:", self);
      break;
    case 5:
      v13 = 764066;
LABEL_7:
      v11 = v14;
      v12 = self;
LABEL_8:
      objc_msgSend(v11, "toolsList:didSelectToolWithTag:", v12, v13);
      break;
    default:
      break;
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AKToolsListViewController cellItemTypes](self, "cellItemTypes", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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

  v6 = a3;
  v7 = a4;
  -[AKToolsListViewController cellItemTypes](self, "cellItemTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  switch(v10)
  {
    case 0:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AKTextRowIdentifier"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("text-cell"));
      objc_msgSend(v11, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "viewWithTag:", 1000);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        -[AKToolsListViewController _buttonViewForText](self, "_buttonViewForText");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      break;
    case 1:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("AKSignatureRowIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("signature-cell"));
      objc_msgSend(v11, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "viewWithTag:", 1000);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        -[AKToolsListViewController _buttonViewForSignature](self, "_buttonViewForSignature");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      break;
    case 2:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("AKLoupeRowIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("magnifier-cell"));
      objc_msgSend(v11, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "viewWithTag:", 1000);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        -[AKToolsListViewController _buttonViewForLoupe](self, "_buttonViewForLoupe");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      break;
    case 3:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("AKShapesRowIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("shapes-cell"));
      objc_msgSend(v11, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "viewWithTag:", 1000);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        -[AKToolsListViewController _buttonViewForShapes](self, "_buttonViewForShapes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSeparatorStyle:", 0);
        goto LABEL_16;
      }
      break;
    case 4:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("AKOpacityRowIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("opacity-cell"));
      objc_msgSend(MEMORY[0x24BDF6950], "_labelColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTintColor:", v22);

      objc_msgSend(v11, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "viewWithTag:", 1000);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        -[AKToolsListViewController _buttonViewForOpacity](self, "_buttonViewForOpacity");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      break;
    case 5:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AKImageDescriptionRowIdentifier"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("image-description-cell"));
      objc_msgSend(v11, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "viewWithTag:", 1000);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        -[AKToolsListViewController _buttonViewForImageDescription](self, "_buttonViewForImageDescription");
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v21 = (void *)v14;
LABEL_16:
        objc_msgSend(v11, "contentView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKToolsListViewController addRowView:toCellView:](self, "addRowView:toCellView:", v21, v27);

      }
      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  v7 = a3;
  v8 = objc_msgSend(a5, "row");
  v9 = objc_msgSend(v7, "numberOfRowsInSection:", 0);

  if (v8 < v9 - 1)
    objc_msgSend(v10, "setSeparatorStyle:", 1);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  int64_t v6;
  double result;

  v5 = objc_msgSend(a4, "row", a3);
  v6 = -[AKToolsListViewController _shapesCellIndexRow](self, "_shapesCellIndexRow");
  result = 36.0;
  if (v5 == v6)
    return 44.0;
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a4, "row", a3);
  return v5 != -[AKToolsListViewController _shapesCellIndexRow](self, "_shapesCellIndexRow");
}

- (id)_buttonViewForImageDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  sub_228FF9FAC((uint64_t)CFSTR("quote.bubble"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKController akBundle](AKController, "akBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Description"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolsListViewController _buttonViewWithImage:title:tintColor:](self, "_buttonViewWithImage:title:tintColor:", v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_buttonViewForText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  sub_228FF9FAC((uint64_t)CFSTR("textbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKController akBundle](AKController, "akBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Text"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolsListViewController _buttonViewWithImage:title:tintColor:](self, "_buttonViewWithImage:title:tintColor:", v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_buttonViewForSignature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  sub_228FF9FAC((uint64_t)CFSTR("signature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKController akBundle](AKController, "akBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Signature"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolsListViewController _buttonViewWithImage:title:tintColor:](self, "_buttonViewWithImage:title:tintColor:", v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_buttonViewForLoupe
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  sub_228FF9FAC((uint64_t)CFSTR("a.magnify"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKController akBundle](AKController, "akBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Magnifier"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolsListViewController _buttonViewWithImage:title:tintColor:](self, "_buttonViewWithImage:title:tintColor:", v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_buttonViewForShapes
{
  AKShapesPicker *v3;
  AKShapesPicker *v4;

  v3 = [AKShapesPicker alloc];
  v4 = -[AKShapesPicker initWithFrame:shapeTags:](v3, "initWithFrame:shapeTags:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AKShapesPicker addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel__shapeButtonPressed_, 4096);
  return v4;
}

- (id)_buttonViewForOpacity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  sub_228FF9FAC((uint64_t)CFSTR("square.and.line.vertical.and.square.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[AKController akBundle](AKController, "akBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Opacity"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKToolsListViewController _buttonViewWithImage:title:tintColor:](self, "_buttonViewWithImage:title:tintColor:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addRowView:(id)a3 toCellView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setTag:", 1000);
  objc_msgSend(v5, "ak_addSubview:withEdgeInsets:", v6, 0.0, 12.0, 0.0, -12.0);

}

- (id)_buttonViewWithImage:(id)a3 title:(id)a4 tintColor:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v7 = (objc_class *)MEMORY[0x24BDF6AE8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithImage:", v10);

  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "setContentMode:", 4);
  objc_msgSend(v11, "setTintColor:", v8);

  LODWORD(v12) = 1144750080;
  objc_msgSend(v11, "setContentHuggingPriority:forAxis:", 0, v12);
  v13 = objc_alloc(MEMORY[0x24BDF6B68]);
  v14 = (void *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v14, "setText:", v9);

  LODWORD(v15) = 1132068864;
  objc_msgSend(v14, "setContentHuggingPriority:forAxis:", 0, v15);
  v16 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v22[0] = v11;
  v22[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithArrangedSubviews:", v17);

  objc_msgSend(v18, "setDistribution:", 0);
  objc_msgSend(v18, "setSpacing:", 11.0);
  objc_msgSend(v11, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToConstant:", 36.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  return v18;
}

- (void)_reloadCellItemTypes
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  objc_msgSend((id)objc_opt_class(), "defaultCellItemTypes");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[AKToolsListViewController supportsImageDescriptionEditing](self, "supportsImageDescriptionEditing");
  v4 = -[AKToolsListViewController supportsOpacityEditing](self, "supportsOpacityEditing");
  v5 = -[AKToolsListViewController isDeviceLocked](self, "isDeviceLocked");
  v6 = v5;
  if (v3 || v4 || v5)
  {
    v8 = (void *)objc_msgSend(v12, "mutableCopy");
    v9 = v8;
    if (v3)
    {
      objc_msgSend(v8, "insertObject:atIndex:", &unk_24F1CF9D8, 0);
      if (!v4)
      {
LABEL_7:
        if (!v6)
        {
LABEL_9:
          v10 = objc_msgSend(v9, "copy");

          v7 = (id)v10;
          goto LABEL_10;
        }
LABEL_8:
        objc_msgSend(v9, "removeObject:", &unk_24F1CF990);
        goto LABEL_9;
      }
    }
    else if (!v4)
    {
      goto LABEL_7;
    }
    objc_msgSend(v9, "insertObject:atIndex:", &unk_24F1CF9F0, objc_msgSend(v12, "count") - 1);
    if (!v6)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = v12;
LABEL_10:
  v13 = v7;
  -[AKToolsListViewController setCellItemTypes:](self, "setCellItemTypes:", v7);
  -[AKToolsListViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

}

- (int64_t)_shapesCellIndexRow
{
  void *v2;
  int64_t v3;

  -[AKToolsListViewController cellItemTypes](self, "cellItemTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", &unk_24F1CF9C0);

  return v3;
}

- (void)setSupportsOpacityEditing:(BOOL)a3
{
  if (self->_supportsOpacityEditing != a3)
  {
    self->_supportsOpacityEditing = a3;
    -[AKToolsListViewController _reloadCellItemTypes](self, "_reloadCellItemTypes");
  }
}

- (void)setSupportsImageDescriptionEditing:(BOOL)a3
{
  if (self->_supportsImageDescriptionEditing != a3)
  {
    self->_supportsImageDescriptionEditing = a3;
    -[AKToolsListViewController _reloadCellItemTypes](self, "_reloadCellItemTypes");
  }
}

- (AKToolsListViewControllerDelegate)delegate
{
  return (AKToolsListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)supportsOpacityEditing
{
  return self->_supportsOpacityEditing;
}

- (BOOL)supportsImageDescriptionEditing
{
  return self->_supportsImageDescriptionEditing;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)cellItemTypes
{
  return self->_cellItemTypes;
}

- (void)setCellItemTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  self->_isDeviceLocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellItemTypes, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
