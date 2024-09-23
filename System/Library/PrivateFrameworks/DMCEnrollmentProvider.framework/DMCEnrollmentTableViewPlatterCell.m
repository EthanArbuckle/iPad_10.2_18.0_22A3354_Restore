@implementation DMCEnrollmentTableViewPlatterCell

- (DMCEnrollmentTableViewPlatterCell)initWithCellData:(id)a3 parentTableView:(id)a4 useShadow:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  objc_class *v11;
  void *v12;
  DMCEnrollmentTableViewPlatterCell *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIView *shadowView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  id v25;
  uint64_t v26;
  void *v27;
  DMCEnrollmentTemplateTableViewController *v28;
  DMCEnrollmentTemplateTableViewController *tableViewController;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v42[4];
  id v43;
  id location;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v5 = a5;
  v52 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49.receiver = self;
  v49.super_class = (Class)DMCEnrollmentTableViewPlatterCell;
  v13 = -[DMCEnrollmentTableViewPlatterCell initWithStyle:reuseIdentifier:](&v49, sel_initWithStyle_reuseIdentifier_, 0, v12);

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTableViewPlatterCell setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[DMCEnrollmentTableViewPlatterCell setSelectionStyle:](v13, "setSelectionStyle:", 0);
    -[DMCEnrollmentTableViewPlatterCell contentView](v13, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMasksToBounds:", 0);

    objc_storeStrong((id *)&v13->_cellData, a3);
    objc_storeWeak((id *)&v13->_parentTableView, v10);
    if (v5)
    {
      v17 = objc_opt_new();
      shadowView = v13->_shadowView;
      v13->_shadowView = (UIView *)v17;

      objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v13->_shadowView, "setBackgroundColor:", v19);

      -[UIView layer](v13->_shadowView, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setMasksToBounds:", 0);

      -[UIView layer](v13->_shadowView, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setShadowOffset:", 0.0, 3.0);

      -[UIView layer](v13->_shadowView, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setShadowRadius:", 5.0);

      -[UIView layer](v13->_shadowView, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = 1053609165;
      objc_msgSend(v23, "setShadowOpacity:", v24);

      objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = objc_msgSend(v25, "CGColor");
      -[UIView layer](v13->_shadowView, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setShadowColor:", v26);

    }
    v28 = -[DMCEnrollmentTemplateTableViewController initWithIconNames:iconImages:title:subTitle:layoutStyle:]([DMCEnrollmentTemplateTableViewController alloc], "initWithIconNames:iconImages:title:subTitle:layoutStyle:", 0, 0, 0, 0, 1);
    tableViewController = v13->_tableViewController;
    v13->_tableViewController = v28;

    -[DMCEnrollmentTemplateTableViewController tableView](v13->_tableViewController, "tableView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setScrollEnabled:", 0);

    -[DMCEnrollmentTemplateTableViewController tableView](v13->_tableViewController, "tableView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAutoresizingMask:", 18);

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v32 = v9;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v46;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v46 != v34)
            objc_enumerationMutation(v32);
          -[DMCEnrollmentTemplateTableViewController addSectionWithCellData:animated:](v13->_tableViewController, "addSectionWithCellData:animated:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v35++), 0);
        }
        while (v33 != v35);
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v33);
    }

    -[DMCEnrollmentTemplateTableViewController willMoveToParentViewController:](v13->_tableViewController, "willMoveToParentViewController:", 0);
    -[DMCEnrollmentTableViewPlatterCell contentView](v13, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v13->_shadowView);

    -[DMCEnrollmentTableViewPlatterCell contentView](v13, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTemplateTableViewController tableView](v13->_tableViewController, "tableView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v38);

    -[DMCEnrollmentTemplateTableViewController didMoveToParentViewController:](v13->_tableViewController, "didMoveToParentViewController:", 0);
    objc_initWeak(&location, v13);
    v50 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __80__DMCEnrollmentTableViewPlatterCell_initWithCellData_parentTableView_useShadow___block_invoke;
    v42[3] = &unk_24D52E2D0;
    objc_copyWeak(&v43, &location);
    v40 = (id)-[DMCEnrollmentTableViewPlatterCell registerForTraitChanges:withHandler:](v13, "registerForTraitChanges:withHandler:", v39, v42);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __80__DMCEnrollmentTableViewPlatterCell_initWithCellData_parentTableView_useShadow___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__DMCEnrollmentTableViewPlatterCell_initWithCellData_parentTableView_useShadow___block_invoke_2;
  block[3] = &unk_24D52E500;
  v4 = WeakRetained;
  v2 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __80__DMCEnrollmentTableViewPlatterCell_initWithCellData_parentTableView_useShadow___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "parentTableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  float v21;
  void *v22;
  float v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  _QWORD block[5];
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)DMCEnrollmentTableViewPlatterCell;
  -[DMCEnrollmentTableViewPlatterCell layoutSubviews](&v57, sel_layoutSubviews);
  -[DMCEnrollmentTableViewPlatterCell layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 0);

  -[DMCEnrollmentTableViewPlatterCell bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8 + 6.0;
  v11 = v10 + -12.0;
  -[DMCEnrollmentTableViewPlatterCell shadowView](self, "shadowView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v9, v5, v11, v7);

  -[DMCEnrollmentTableViewPlatterCell customHorizontalMargin](self, "customHorizontalMargin");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[DMCEnrollmentTableViewPlatterCell bounds](self, "bounds");
    v15 = v14;
    v5 = v16;
    v18 = v17;
    v7 = v19;
    -[DMCEnrollmentTableViewPlatterCell customHorizontalMargin](self, "customHorizontalMargin");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v9 = v15 + v21;

    -[DMCEnrollmentTableViewPlatterCell customHorizontalMargin](self, "customHorizontalMargin");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    v11 = v18 - (float)(v23 + v23);

  }
  -[DMCEnrollmentTableViewPlatterCell tableViewController](self, "tableViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v9, v5, v11, v7);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentTemplateTableViewController tableView](self->_tableViewController, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBackgroundColor:", v26);

  -[DMCEnrollmentTableViewPlatterCell layer](self, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "cornerRadius");
  v30 = v29;
  -[DMCEnrollmentTableViewPlatterCell shadowView](self, "shadowView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCornerRadius:", v30);

  v33 = (void *)MEMORY[0x24BDF6870];
  -[DMCEnrollmentTableViewPlatterCell shadowView](self, "shadowView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[DMCEnrollmentTableViewPlatterCell layer](self, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "cornerRadius");
  objc_msgSend(v33, "bezierPathWithRoundedRect:cornerRadius:", v36, v38, v40, v42, v44);
  v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v46 = objc_msgSend(v45, "CGPath");
  -[DMCEnrollmentTableViewPlatterCell shadowView](self, "shadowView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setShadowPath:", v46);

  -[DMCEnrollmentTableViewPlatterCell previousWidth](self, "previousWidth");
  v50 = v49;
  -[DMCEnrollmentTableViewPlatterCell contentView](self, "contentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bounds");
  v53 = v52;

  if (v50 != v53)
  {
    -[DMCEnrollmentTableViewPlatterCell contentView](self, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bounds");
    -[DMCEnrollmentTableViewPlatterCell setPreviousWidth:](self, "setPreviousWidth:", v55);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__DMCEnrollmentTableViewPlatterCell_layoutSubviews__block_invoke;
    block[3] = &unk_24D52E500;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __51__DMCEnrollmentTableViewPlatterCell_layoutSubviews__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "parentTableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !a3;
  -[DMCEnrollmentTableViewPlatterCell tableViewController](self, "tableViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInProgress:", v3);

}

- (double)cellHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[DMCEnrollmentTableViewPlatterCell tableViewController](self, "tableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;

  return v5;
}

- (double)estimatedCellHeight
{
  return 200.0;
}

- (DMCEnrollmentTemplateTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewController, a3);
}

- (NSNumber)customHorizontalMargin
{
  return self->_customHorizontalMargin;
}

- (void)setCustomHorizontalMargin:(id)a3
{
  objc_storeStrong((id *)&self->_customHorizontalMargin, a3);
}

- (UITableView)parentTableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_parentTableView);
}

- (void)setParentTableView:(id)a3
{
  objc_storeWeak((id *)&self->_parentTableView, a3);
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_previousWidth = a3;
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (NSArray)cellData
{
  return self->_cellData;
}

- (void)setCellData:(id)a3
{
  objc_storeStrong((id *)&self->_cellData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellData, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_destroyWeak((id *)&self->_parentTableView);
  objc_storeStrong((id *)&self->_customHorizontalMargin, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
}

@end
