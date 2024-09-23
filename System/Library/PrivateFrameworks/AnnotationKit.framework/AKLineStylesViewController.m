@implementation AKLineStylesViewController

- (AKLineStylesViewController)initWithController:(id)a3
{
  id v4;
  AKLineStylesViewController *v5;
  AKLineStylesViewController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKLineStylesViewController;
  v5 = -[AKLineStylesViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[AKLineStylesViewController setController:](v5, "setController:", v4);
    -[AKLineStylesViewController setLineWidthTags:](v6, "setLineWidthTags:", &unk_24F1CF1B0);
    -[AKLineStylesViewController lineWidthTags](v6, "lineWidthTags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKLineStylesViewController setPreferredContentSize:](v6, "setPreferredContentSize:", 60.0, (double)(unint64_t)(48 * objc_msgSend(v7, "count")));

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AKLineStylesViewController;
  -[AKLineStylesViewController viewDidLoad](&v23, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKLineStylesViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc(MEMORY[0x24BDF6E58]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AKLineStylesViewController setTableView:](self, "setTableView:", v6);

  -[AKLineStylesViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKLineStylesViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  -[AKLineStylesViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlwaysBounceVertical:", 0);

  -[AKLineStylesViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSeparatorStyle:", 0);

  -[AKLineStylesViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRowHeight:", 48.0);

  -[AKLineStylesViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  -[AKLineStylesViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDataSource:", self);

  -[AKLineStylesViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKLineStylesRowIdentifier"));

  -[AKLineStylesViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKLineStylesViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  _NSDictionaryOfVariableBindings(CFSTR("_tableView"), self->_tableView, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_tableView]|"), 0, 0, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v20);

  v21 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_tableView]|"), 0, 0, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v22);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKLineStylesViewController;
  -[AKLineStylesViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AKLineStylesViewController selectRowForTag:](self, "selectRowForTag:", -[AKLineStylesViewController currentLineWidthTag](self, "currentLineWidthTag"));
}

- (id)indexPathForLineWidthTag:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[AKLineStylesViewController lineWidthTags](self, "lineWidthTags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)selectRowForTag:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[AKLineStylesViewController indexPathForLineWidthTag:](self, "indexPathForLineWidthTag:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AKLineStylesViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadRowsAtIndexPaths:withRowAnimation:", v6, 0);

  }
}

- (int64_t)currentLineWidthTag
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  char v13;
  void *v14;
  double v15;

  -[AKLineStylesViewController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPageController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageModelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "strokeWidth");
  v8 = round(v7);
  objc_msgSend(v6, "selectedAnnotations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelBaseScaleFactor");
  v11 = v10;
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(v9, "anyObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "strokeWidth");
      v8 = round(v15 / v11);

    }
  }

  return (uint64_t)v8 + 765000;
}

- (void)selectedLineWidthChanged:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  id v8;

  -[AKLineStylesViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedCell");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((unint64_t)(a3 - 765001) < 0xF)
      v6 = a3 - 765000;
    else
      v6 = a3;
    objc_msgSend(v8, "setLineWidth:", (float)v6);
    objc_msgSend(v8, "setTag:", a3);
    -[AKLineStylesViewController controller](self, "controller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performActionForSender:", v8);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AKLineStylesViewController lineWidthTags](self, "lineWidthTags", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AKLineStylesRowIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKLineStylesViewController lineWidthTags](self, "lineWidthTags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend((id)objc_opt_class(), "generateLineImageForTag:selected:", v11, v11 == -[AKLineStylesViewController currentLineWidthTag](self, "currentLineWidthTag"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v12);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[AKLineStylesViewController lineWidthTags](self, "lineWidthTags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[AKLineStylesViewController selectedLineWidthChanged:](self, "selectedLineWidthChanged:", objc_msgSend(v10, "integerValue"));
  objc_msgSend(v7, "reloadData");

}

+ (id)generateLineImageForTag:(int64_t)a3 selected:(BOOL)a4
{
  _BOOL4 v4;
  CGContext *CurrentContext;
  CGContext *v7;
  const CGPath *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGSize v19;
  CGRect v20;

  v4 = a4;
  v19.width = 38.0;
  v19.height = 38.0;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v7 = CurrentContext;
  if (v4)
  {
    CGContextSaveGState(CurrentContext);
    v20.size.width = 36.0;
    v20.origin.x = 1.0;
    v20.origin.y = 1.0;
    v20.size.height = 36.0;
    v8 = CGPathCreateWithEllipseInRect(v20, 0);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v7, (CGColorRef)objc_msgSend(v9, "CGColor"));

    CGContextSetLineWidth(v7, 2.0);
    CGContextAddPath(v7, v8);
    CGContextStrokePath(v7);
    CGPathRelease(v8);
    CGContextRestoreGState(v7);
  }
  CGContextSaveGState(v7);
  objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "set");

  v11 = (double)(a3 - 765000);
  v12 = v11 * 1.5;
  if (a3 < 765007)
    v11 = v11 * 1.25;
  if (a3 >= 765003)
    v13 = v11;
  else
    v13 = v12;
  v14 = (38.0 - v13) * 0.5;
  v15 = v14;
  v16 = v13;
  CGContextFillEllipseInRect(v7, *(CGRect *)(&v13 - 2));
  CGContextRestoreGState(v7);
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v17;
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)lineWidthTags
{
  return self->_lineWidthTags;
}

- (void)setLineWidthTags:(id)a3
{
  objc_storeStrong((id *)&self->_lineWidthTags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineWidthTags, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end
