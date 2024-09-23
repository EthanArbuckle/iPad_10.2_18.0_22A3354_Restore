@implementation CKDetailsWalletItemSearchController

+ (id)sectionIdentifier
{
  return CFSTR("DetailsWalletItemSearchSection");
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  unint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double Height;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v28;
  double v29;
  CGRect v30;

  v4 = -[CKSearchController layoutWidth](self, "layoutWidth", a3);
  -[CKSearchController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerWidthForController:", self);
  v7 = v6;

  v28 = 0;
  v29 = 0.0;
  -[CKMessageTypeSearchController fractionalWidth:count:forLayoutWidth:](self, "fractionalWidth:count:forLayoutWidth:", &v29, &v28, v4);
  -[CKSearchController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentMarginInsetsForSearchController:", self);
  v10 = v9;
  v12 = v11;

  v13 = (v7 - (v10 + v12) + (float)((float)(v28 - 1) * -10.0)) / (double)v28;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v13, 1.79769313e308);
  -[CKDetailsWalletItemSearchController sizingCell](self, "sizingCell");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredLayoutAttributesFittingAttributes:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "frame");
  Height = CGRectGetHeight(v30);
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", Height);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sizeWithWidthDimension:heightDimension:", v23, v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1D0], "horizontalGroupWithLayoutSize:subitem:count:", v24, v21, v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F8], "fixedSpacing:", 10.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setInterItemSpacing:", v26);

  return v25;
}

- (CKWalletItemSearchResultsCell)sizingCell
{
  CKWalletItemSearchResultsCell *sizingCell;
  CKWalletItemSearchResultsCell *v4;
  CKWalletItemSearchResultsCell *v5;
  CKWalletItemSearchResultsCell *v6;
  void *v7;
  void *v8;

  sizingCell = self->_sizingCell;
  if (!sizingCell)
  {
    v4 = [CKWalletItemSearchResultsCell alloc];
    v5 = -[CKAttachmentSearchResultCell initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_sizingCell;
    self->_sizingCell = v5;

    -[CKAttachmentSearchResultCell dateLabel](self->_sizingCell, "dateLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDate:", v8);

    sizingCell = self->_sizingCell;
  }
  return sizingCell;
}

- (void)setSizingCell:(id)a3
{
  objc_storeStrong((id *)&self->_sizingCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizingCell, 0);
}

@end
