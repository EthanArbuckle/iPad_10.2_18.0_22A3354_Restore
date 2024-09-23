@implementation MKTransitDepartureContainerHeaderCell

- (MKTransitDepartureContainerHeaderCell)initWithReuseIdentifier:(id)a3
{
  MKTransitDepartureContainerHeaderCell *v3;
  MKTransitDepartureContainerHeaderCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKTransitDepartureContainerHeaderCell;
  v3 = -[MKCustomSeparatorCell initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, 0, a3);
  v4 = v3;
  if (v3)
    -[MKTransitDepartureContainerHeaderCell _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  MKTransitDepartureContainerHeaderView *v5;
  MKTransitDepartureContainerHeaderView *v6;
  MKTransitDepartureContainerHeaderView *headerView;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDepartureContainerHeaderCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = [MKTransitDepartureContainerHeaderView alloc];
  v6 = -[MKTransitDepartureContainerHeaderView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerView = self->_headerView;
  self->_headerView = v6;

  -[MKTransitDepartureContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKTransitDepartureContainerHeaderCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_headerView);

  v19 = (void *)MEMORY[0x1E0CB3718];
  -[MKTransitDepartureContainerHeaderView leadingAnchor](self->_headerView, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDepartureContainerHeaderCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  -[MKTransitDepartureContainerHeaderView trailingAnchor](self->_headerView, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDepartureContainerHeaderCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v9;
  -[MKTransitDepartureContainerHeaderView topAnchor](self->_headerView, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDepartureContainerHeaderCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v13;
  -[MKTransitDepartureContainerHeaderView bottomAnchor](self->_headerView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitDepartureContainerHeaderCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v18);

}

- (void)setViewModel:(id)a3
{
  -[MKTransitDepartureContainerHeaderView setViewModel:](self->_headerView, "setViewModel:", a3);
}

- (MKTransitDepartureContainerHeaderViewModel)viewModel
{
  return -[MKTransitDepartureContainerHeaderView viewModel](self->_headerView, "viewModel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
