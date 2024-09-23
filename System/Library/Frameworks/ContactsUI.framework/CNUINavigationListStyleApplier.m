@implementation CNUINavigationListStyleApplier

- (CNUINavigationListStyleApplier)initWithNavigationListStyle:(id)a3
{
  id v5;
  CNUINavigationListStyleApplier *v6;
  CNUINavigationListStyleApplier *v7;
  objc_super v9;

  v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)CNUINavigationListStyleApplier,
        v6 = -[CNUINavigationListStyleApplier init](&v9, sel_init),
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_navigationListStyle, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)applyNavigationListStyleToCell:(id)a3
{
  void *v4;
  void *v5;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a3;
  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellTitleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellTitleTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cellTitleTextHighlightedColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHighlightedTextColor:", v11);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cellSubtitleFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cellSubtitleTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "subtitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cellSubtitleTextHighlightedColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "subtitleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHighlightedTextColor:", v20);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "actionIconFillColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "titleImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTintColor:", v23);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "cellBackgroundColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setBackgroundColor:", v27);

    v28 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v39, "setBackgroundView:", v28);

    -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "cellBackgroundColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "backgroundView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBackgroundColor:", v30);

  }
  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "cellBackgroundHighlightedColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v39, "setSelectedBackgroundView:", v34);

    -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "cellBackgroundHighlightedColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "selectedBackgroundView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setBackgroundColor:", v36);

  }
  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setShowSeparator:", objc_msgSend(v38, "showCellSeparator"));

}

- (void)applyNavigationListStyleToDetailCell:(id)a3
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
  id v23;

  v4 = a3;
  -[CNUINavigationListStyleApplier applyNavigationListStyleToCell:](self, "applyNavigationListStyleToCell:", v4);
  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailCellTitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "detailCellTitleTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "detailCellTitleTextHighlightedColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHighlightedTextColor:", v12);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "detailCellSubtitleFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v15);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "detailCellSubtitleTextColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTextColor:", v18);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "detailCellSubtitleTextHighlightedColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHighlightedTextColor:", v21);

  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowSeparator:", objc_msgSend(v23, "showCellSeparator"));

}

- (void)applyExpandedBackgroundNavigationListStyleToCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellBackgroundExpandedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setBackgroundColor:", v5);
}

- (void)applyCollapsedBackgroundNavigationListStyleToCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNUINavigationListStyleApplier navigationListStyle](self, "navigationListStyle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setBackgroundColor:", v5);
}

- (CNUINavigationListStyle)navigationListStyle
{
  return self->_navigationListStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationListStyle, 0);
}

@end
