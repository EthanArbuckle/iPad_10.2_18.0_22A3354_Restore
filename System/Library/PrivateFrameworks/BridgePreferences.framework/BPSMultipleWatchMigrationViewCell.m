@implementation BPSMultipleWatchMigrationViewCell

- (BPSMultipleWatchMigrationViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  BPSMultipleWatchMigrationViewCell *v4;
  BPSCheckMarkView *v5;
  BPSCheckMarkView *checkmarkView;
  void *v7;
  BPSRemoveMigrationWatchView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  BPSRemoveMigrationWatchView *watchView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UILabel *deviceDetailLabel;
  UILabel *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)BPSMultipleWatchMigrationViewCell;
  v4 = -[BPSMultipleWatchMigrationViewCell initWithStyle:reuseIdentifier:](&v28, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(BPSCheckMarkView);
    checkmarkView = v4->_checkmarkView;
    v4->_checkmarkView = v5;

    -[BPSCheckMarkView setIsChecked:](v4->_checkmarkView, "setIsChecked:", 0);
    -[BPSMultipleWatchMigrationViewCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_checkmarkView);

    v8 = [BPSRemoveMigrationWatchView alloc];
    v9 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v13 = -[BPSRemoveMigrationWatchView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], v10, v11, v12);
    watchView = v4->_watchView;
    v4->_watchView = (BPSRemoveMigrationWatchView *)v13;

    -[BPSMultipleWatchMigrationViewCell contentView](v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v4->_watchView);

    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[BPSMultipleWatchMigrationViewCell textLabel](v4, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v17);

    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
    deviceDetailLabel = v4->_deviceDetailLabel;
    v4->_deviceDetailLabel = (UILabel *)v19;

    v21 = v4->_deviceDetailLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v21, "setFont:", v22);

    -[UILabel setTextColor:](v4->_deviceDetailLabel, "setTextColor:", v17);
    -[BPSMultipleWatchMigrationViewCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v4->_deviceDetailLabel);

    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cellHighlightColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = objc_alloc_init(MEMORY[0x24BDF6F90]);
      objc_msgSend(v26, "setBackgroundColor:", v25);
      -[BPSMultipleWatchMigrationViewCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v26);

    }
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  float v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  objc_super v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v42.receiver = self;
  v42.super_class = (Class)BPSMultipleWatchMigrationViewCell;
  -[BPSMultipleWatchMigrationViewCell layoutSubviews](&v42, sel_layoutSubviews);
  -[BPSMultipleWatchMigrationViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v36 = *MEMORY[0x24BDBF148];
  -[BPSRemoveMigrationWatchView sizeThatFits:](self->_watchView, "sizeThatFits:");
  v41 = v12;
  v14 = v13;
  v43.origin.x = v4;
  v38 = v6;
  v39 = v4;
  v43.origin.y = v6;
  v43.size.width = v8;
  v43.size.height = v10;
  v15 = (CGRectGetHeight(v43) - v14) * 0.5;
  v40 = floorf(v15);
  -[BPSRemoveMigrationWatchView setFrame:](self->_watchView, "setFrame:");
  -[BPSCheckMarkView sizeThatFits:](self->_checkmarkView, "sizeThatFits:", v36, v11);
  v17 = v16;
  v19 = v18;
  v44.origin.x = v4;
  v44.origin.y = v6;
  v44.size.width = v8;
  v44.size.height = v10;
  v20 = (CGRectGetHeight(v44) - v19) * 0.5;
  -[BPSCheckMarkView setFrame:](self->_checkmarkView, "setFrame:", 20.0, floorf(v20), v17, v19);
  -[BPSMultipleWatchMigrationViewCell textLabel](self, "textLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeThatFits:", v36, v11);
  v23 = v22;
  v25 = v24;

  -[BPSMultipleWatchMigrationViewCell deviceDetailLabel](self, "deviceDetailLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sizeThatFits:", v36, v11);
  v37 = v27;
  v29 = v28;

  v45.origin.x = 65.0;
  v45.origin.y = v40;
  v45.size.height = v14;
  v45.size.width = v41;
  v30 = CGRectGetMaxX(v45) + 16.0;
  v46.origin.y = v38;
  v46.origin.x = v39;
  v46.size.width = v8;
  v46.size.height = v10;
  v31 = (CGRectGetHeight(v46) - (v25 + v29 + 4.0)) * 0.5;
  v32 = floorf(v31);
  v47.origin.x = v30;
  v47.origin.y = v32;
  v47.size.width = v23;
  v47.size.height = v25;
  v33 = CGRectGetMaxY(v47) + 4.0;
  -[BPSMultipleWatchMigrationViewCell textLabel](self, "textLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v30, v32, v23, v25);

  -[BPSMultipleWatchMigrationViewCell deviceDetailLabel](self, "deviceDetailLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v30, v33, v37, v29);

}

- (BPSRemoveMigrationWatchView)watchView
{
  return self->_watchView;
}

- (void)setWatchView:(id)a3
{
  objc_storeStrong((id *)&self->_watchView, a3);
}

- (BPSCheckMarkView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkView, a3);
}

- (UILabel)deviceDetailLabel
{
  return self->_deviceDetailLabel;
}

- (void)setDeviceDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceDetailLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDetailLabel, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
}

@end
