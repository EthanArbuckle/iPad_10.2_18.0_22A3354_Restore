@implementation CKDetailsSearchResultsTitleHeaderCell

+ (id)supplementaryViewType
{
  return CFSTR("SearchDetailsHeaderSupplementryType");
}

+ (id)reuseIdentifier
{
  return CFSTR("SearchDetailsResultsTitle");
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (CKDetailsSearchResultsTitleHeaderCell)initWithFrame:(CGRect)a3
{
  CKDetailsSearchResultsTitleHeaderCell *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKDetailsSearchResultsTitleHeaderCell;
  v3 = -[CKSearchResultsTitleHeaderCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAccessibilityPreferredContentSizeCategory");

    if ((v5 & 1) == 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchResultsTitleHeaderDetailsTopPadding");
      -[CKSearchResultsTitleHeaderCell setTitleTopPadding:](v3, "setTitleTopPadding:");

      -[CKSearchResultsTitleHeaderCell setTitleBottomPadding:](v3, "setTitleBottomPadding:", 0.0);
    }
    -[CKSearchResultsTitleHeaderCell sectionTitle](v3, "sectionTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchDetailsHeaderFontIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v9);

  }
  return v3;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  int v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKDetailsSearchResultsTitleHeaderCell;
  -[CKSearchResultsTitleHeaderCell layoutSubviews](&v23, sel_layoutSubviews);
  -[CKSearchResultsTitleHeaderCell topHairline](self, "topHairline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKDetailsSearchResultsTitleHeaderCell bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKSearchResultsTitleHeaderCell marginInsets](self, "marginInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = -[CKDetailsSearchResultsTitleHeaderCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") ^ 1;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isAccessibilityPreferredContentSizeCategory");

  if (v22)
    -[CKSearchResultsTitleHeaderCell layoutSubviewsAXFontSizeWithBounds:layoutMargins:isLTR:](self, "layoutSubviewsAXFontSizeWithBounds:layoutMargins:isLTR:", v20, v5, v7, v9, v11, v13, v15, v17, v19);
  else
    -[CKDetailsSearchResultsTitleHeaderCell layoutSubviewsWithBounds:layoutMargins:isLTR:](self, "layoutSubviewsWithBounds:layoutMargins:isLTR:", v20, v5, v7, v9, v11, v13, v15, v17, v19);
}

- (void)layoutSubviewsWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MaxY;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double right;
  double left;
  CGRect rect;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  right = a4.right;
  left = a4.left;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)&rect.size.width = self;
  *(_QWORD *)&rect.size.height = CKDetailsSearchResultsTitleHeaderCell;
  -[CGSize layoutSubviewsWithBounds:layoutMargins:isLTR:]((objc_super *)&rect.size, sel_layoutSubviewsWithBounds_layoutMargins_isLTR_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom);
  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  rect.origin.x = v12;
  v49 = v13;
  v50 = v14;

  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v48 = x;
  v55.origin.x = x;
  v47 = height;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  v24 = CGRectGetWidth(v55) - left;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "searchResultsTitleHeaderInterItemSpacing");
  v27 = v24 - v26;
  v56.origin.x = v17;
  v51 = v21;
  v56.origin.y = v19;
  v56.size.width = v21;
  rect.origin.y = v23;
  v56.size.height = v23;
  v28 = v27 - CGRectGetWidth(v56) - right;

  if (CKIsRunningInMacCatalyst())
  {
    v30 = v50;
    v29 = v19;
    v31 = v51;
    v32 = v49;
    v33 = rect.origin.x;
  }
  else
  {
    v33 = left;
    v57.origin.x = x;
    v57.size.width = width;
    v57.origin.y = y;
    v57.size.height = v47;
    MaxY = CGRectGetMaxY(v57);
    v58.origin.x = rect.origin.x;
    v58.origin.y = v49;
    v30 = v50;
    v58.size.width = v28;
    v58.size.height = v50;
    v35 = MaxY - CGRectGetHeight(v58);
    -[CKSearchResultsTitleHeaderCell titleBottomPadding](self, "titleBottomPadding");
    v32 = v35 - v36;
    if (!a5)
    {
      v59.origin.x = v48;
      v59.size.width = width;
      v59.origin.y = y;
      v59.size.height = v47;
      v37 = v32;
      v38 = CGRectGetWidth(v59);
      v60.origin.x = rect.origin.x;
      v60.origin.y = v37;
      v60.size.width = v28;
      v60.size.height = v50;
      v39 = v38 - CGRectGetWidth(v60);
      v32 = v37;
      v33 = v39 - right;
    }
    v61.origin.x = v48;
    v61.size.width = width;
    v61.origin.y = y;
    v61.size.height = v47;
    v40 = CGRectGetMaxY(v61);
    v62.origin.x = v17;
    v62.origin.y = v19;
    v31 = v51;
    v62.size.width = v51;
    v62.size.height = rect.origin.y;
    v29 = v40 - CGRectGetHeight(v62);
  }
  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFrame:", v33, v32, v28, v30);

  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "titleLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "_baselineOffsetFromBottom");
  v45 = v44;

  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setFrame:", v17, v29 + v45, v31, rect.origin.y);

}

- (void)layoutSubviewsForWolfWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat right;
  double left;
  CGFloat y;
  CGFloat x;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MaxX;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  double v35;
  CGFloat v36;
  void *v37;
  double v38;
  CGFloat v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  double v55;
  CGFloat width;
  CGFloat height;
  objc_super v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v5 = a5;
  right = a4.right;
  left = a4.left;
  y = a3.origin.y;
  x = a3.origin.x;
  v58.receiver = self;
  v58.super_class = (Class)CKDetailsSearchResultsTitleHeaderCell;
  width = a3.size.width;
  height = a3.size.height;
  -[CKSearchResultsTitleHeaderCell layoutSubviewsForWolfWithBounds:layoutMargins:isLTR:](&v58, sel_layoutSubviewsForWolfWithBounds_layoutMargins_isLTR_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom);
  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v52 = v12;
  v53 = v13;
  v54 = v14;

  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v55 = left;
  if (v5)
  {
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    v24 = right;
    MaxX = CGRectGetMaxX(v59);
    v60.origin.x = v17;
    v60.origin.y = v19;
    v60.size.width = v21;
    v60.size.height = v23;
    v26 = MaxX - CGRectGetWidth(v60) - v24;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "searchDetailsSeeAllButtonTrailingMargin");
    v29 = v26 - v28;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "searchDetailsSeeAllButtonTrailingMargin");
    v29 = left + v30;
    v24 = right;
  }

  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v29, v19, v21, v23);

  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  v32 = CGRectGetWidth(v61) - v55;
  v62.origin.x = v29;
  v62.origin.y = v19;
  v62.size.width = v21;
  v62.size.height = v23;
  v33 = v32 - CGRectGetWidth(v62) - v24;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "searchResultsDetailsTitleHeaderTextLeadingMargin");
  v36 = v33 - v35;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "searchDetailsSeeAllButtonTrailingMargin");
  v39 = v36 - v38;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "searchResultsTitleHeaderInterItemSpacing");
  v42 = v39 - v41;

  if (v5)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "searchResultsDetailsTitleHeaderTextLeadingMargin");
    v44 = v54;
    v46 = v55 + v45;
    v47 = v53;
  }
  else
  {
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    v48 = CGRectGetWidth(v63);
    v64.origin.x = v52;
    v47 = v53;
    v64.origin.y = v53;
    v64.size.width = v42;
    v44 = v54;
    v64.size.height = v54;
    v49 = v48 - CGRectGetWidth(v64) - v24;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "searchResultsDetailsTitleHeaderTextLeadingMargin");
    v46 = v49 - v50;
  }

  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setFrame:", v46, v47, v42, v44);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchDetailsHeaderFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "capHeight");
  v16 = v15;

  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeThatFits:", v10, v12);
  v19 = v18;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v20, "isAccessibilityPreferredContentSizeCategory");

  -[CKSearchResultsTitleHeaderCell titleTopPadding](self, "titleTopPadding");
  if ((_DWORD)v14)
  {
    v22 = v19 + v16 + v21;
    -[CKSearchResultsTitleHeaderCell titleBottomPadding](self, "titleBottomPadding");
    v24 = v23 + v22;
  }
  else
  {
    v25 = v16 + v21;
    -[CKSearchResultsTitleHeaderCell titleTopPadding](self, "titleTopPadding");
    v24 = v25 + v26;
  }
  objc_msgSend(v4, "setFrame:", v6, v8, v10, v24);
  return v4;
}

- (void)_showAllButtonTapped:(id)a3
{
  id v4;

  if (CKIsRunningInMacCatalyst())
  {
    -[CKSearchResultsTitleHeaderCell delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchResultsTitleCellShowAllButtonTapped:", self);
  }
  else
  {
    -[CKDetailsSearchResultsTitleHeaderCell detailsViewDelegate](self, "detailsViewDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchDetailsShowAllButtonTapped:", self);
  }

}

- (CKDetailsSearchResultsTitleHeaderCellDelegate)detailsViewDelegate
{
  return (CKDetailsSearchResultsTitleHeaderCellDelegate *)objc_loadWeakRetained((id *)&self->_detailsViewDelegate);
}

- (void)setDetailsViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_detailsViewDelegate, a3);
}

- (CALayer)bottomHairline
{
  return self->_bottomHairline;
}

- (void)setBottomHairline:(id)a3
{
  objc_storeStrong((id *)&self->_bottomHairline, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_destroyWeak((id *)&self->_detailsViewDelegate);
}

@end
