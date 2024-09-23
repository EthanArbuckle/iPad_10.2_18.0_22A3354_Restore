@implementation GKShowMoreView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (GKShowMoreView)initWithFrame:(CGRect)a3
{
  GKShowMoreView *v3;
  GKShowMoreView *v4;
  void *v5;
  void *v6;
  GKLabel *v7;
  GKLabel *label;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  NSLayoutConstraint *verticalContraint;
  uint64_t v18;
  UIActivityIndicatorView *spinner;
  void *v20;
  void *v21;
  void *v22;
  GKLabel *v23;
  void *v24;
  void *v25;
  objc_super v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)GKShowMoreView;
  v3 = -[GKShowMoreView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[GKShowMoreView baseTextStyle](v3, "baseTextStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buttonTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(GKLabel);
    label = v4->_label;
    v4->_label = v7;

    GKGameCenterUIFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_gkAttributedStringByApplyingStyle:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLabel setAttributedText:](v4->_label, "setAttributedText:", v11);

    -[GKLabel setBackgroundColor:](v4->_label, "setBackgroundColor:", 0);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (v13 == 1)
    {
      if (*MEMORY[0x1E0D253F8])
        v14 = *MEMORY[0x1E0D25B68] == 0;
      else
        v14 = 0;
      v15 = v14;
    }
    else
    {
      v15 = 1;
    }
    -[GKLabel setShouldInhibitReplay:](v4->_label, "setShouldInhibitReplay:", v15);
    -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKLabel setOpaque:](v4->_label, "setOpaque:", 0);
    v4->_textAlignmentOffset = 2.22507386e-308;
    -[GKShowMoreView addSubview:](v4, "addSubview:", v4->_label);
    objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredYInView:", v4->_label, v4);
    v16 = objc_claimAutoreleasedReturnValue();
    verticalContraint = v4->_verticalContraint;
    v4->_verticalContraint = (NSLayoutConstraint *)v16;

    -[GKShowMoreView addConstraint:](v4, "addConstraint:", v4->_verticalContraint);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 2);
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v18;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v4->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activityIndicatorColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](v4->_spinner, "setColor:", v21);

    -[GKShowMoreView addSubview:](v4, "addSubview:", v4->_spinner);
    v22 = (void *)MEMORY[0x1E0CB3718];
    v28[0] = CFSTR("label");
    v23 = v4->_label;
    v28[1] = CFSTR("spinner");
    v29[0] = v23;
    v29[1] = v4->_spinner;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[spinner]-gap-[label]"), 1024, &unk_1E5A5ECD8, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKShowMoreView addConstraints:](v4, "addConstraints:", v25);

  }
  return v4;
}

- (id)baseTextStyle
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 1 || (*MEMORY[0x1E0D253F8] ? (v5 = *MEMORY[0x1E0D25B68] == 0) : (v5 = 0), v5))
  {
    objc_msgSend(v2, "header3");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "header4");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)updateConstraints
{
  double textAlignmentOffset;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKShowMoreView;
  -[GKShowMoreView updateConstraints](&v6, sel_updateConstraints);
  -[GKShowMoreView removeConstraint:](self, "removeConstraint:", self->_horizontalContraint);
  -[GKShowMoreView addConstraint:](self, "addConstraint:", self->_verticalContraint);
  textAlignmentOffset = self->_textAlignmentOffset;
  if (self->_loading)
  {
    -[UIActivityIndicatorView frame](self->_spinner, "frame");
    textAlignmentOffset = textAlignmentOffset + v4 + 6.0;
  }
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_label, 5, 0, self, 5, 1.0, textAlignmentOffset);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKShowMoreView setHorizontalContraint:](self, "setHorizontalContraint:", v5);

  -[GKShowMoreView addConstraint:](self, "addConstraint:", self->_horizontalContraint);
}

- (void)setLoading:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (self->_loading != a3)
  {
    v3 = a3;
    self->_loading = a3;
    -[GKShowMoreView baseTextStyle](self, "baseTextStyle");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "info");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_gkAttributedStringByApplyingStyle:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLabel setAttributedText:](self->_label, "setAttributedText:", v8);

      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "buttonTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_gkAttributedStringByApplyingStyle:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKLabel setAttributedText:](self->_label, "setAttributedText:", v11);

      -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
    }
    -[GKShowMoreView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  SEL showMoreAction;
  void *v9;
  objc_super v10[4];
  objc_super v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKShowMoreView;
  -[GKShowMoreView touchesEnded:withEvent:](&v11, sel_touchesEnded_withEvent_, v6, a4);
  if (self->_showMoreAction)
  {
    if (!self->_loading)
    {
      memset(v10, 0, sizeof(v10));
      if (objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v10, v12, 16))
      {
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        showMoreAction = self->_showMoreAction;
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", self->_sectionIndex);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_gkSendAction:viaResponder:withObject:", showMoreAction, self, v9);

      }
    }
  }

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  int64_t numberToShow;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GKShowMoreView;
  -[GKShowMoreView applyLayoutAttributes:](&v16, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKShowMoreView setSectionIndex:](self, "setSectionIndex:", objc_msgSend(v5, "section"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    v7 = objc_msgSend(v6, "maxTotalItemCount");
    v8 = v7 - objc_msgSend(v6, "currentVisibleItemCount");
    objc_msgSend(v6, "sectionMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numberToShow = objc_msgSend(v9, "incrementalRevealItemCount");

    numberToShow = self->_numberToShow;
    v12 = v8 < numberToShow || numberToShow == -1;
    self->_showShowAll = v12;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_gkTargetForAction:viaResponder:", sel_applyShowMoreLayoutAttributesForShowMoreView_atIndexPath_, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "indexPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "applyShowMoreLayoutAttributesForShowMoreView:atIndexPath:", self, v15);

  }
}

- (void)setTextAlignmentOffset:(double)a3
{
  if (self->_textAlignmentOffset != a3)
  {
    self->_textAlignmentOffset = a3;
    -[GKShowMoreView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setCollectionView:(id)a3
{
  UICollectionView *v5;
  UICollectionView *collectionView;
  UICollectionView *v7;

  v5 = (UICollectionView *)a3;
  collectionView = self->_collectionView;
  if (collectionView != v5)
  {
    v7 = v5;
    -[UICollectionView removeConstraint:](collectionView, "removeConstraint:", self->_horizontalContraint);
    objc_storeStrong((id *)&self->_collectionView, a3);
    -[GKShowMoreView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v7;
  }

}

- (void)updateLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[GKShowMoreView baseTextStyle](self, "baseTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonTitle");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_showShowAll)
  {
    GKGameCenterUIFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_gkAttributedStringByApplyingStyle:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKShowMoreView label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GKFormattedStringWithGroupingFromInteger();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_gkAttributedStringByApplyingStyle:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKShowMoreView label](self, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributedText:", v9);

  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKShowMoreView;
  -[GKShowMoreView prepareForReuse](&v3, sel_prepareForReuse);
  self->_showMoreAction = 0;
}

- (SEL)showMoreAction
{
  return self->_showMoreAction;
}

- (void)setShowMoreAction:(SEL)a3
{
  self->_showMoreAction = a3;
}

- (BOOL)loading
{
  return self->_loading;
}

- (double)textAlignmentOffset
{
  return self->_textAlignmentOffset;
}

- (GKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (NSLayoutConstraint)horizontalContraint
{
  return self->_horizontalContraint;
}

- (void)setHorizontalContraint:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalContraint, a3);
}

- (NSLayoutConstraint)verticalContraint
{
  return self->_verticalContraint;
}

- (void)setVerticalContraint:(id)a3
{
  objc_storeStrong((id *)&self->_verticalContraint, a3);
}

- (BOOL)showShowAll
{
  return self->_showShowAll;
}

- (void)setShowShowAll:(BOOL)a3
{
  self->_showShowAll = a3;
}

- (int64_t)numberToShow
{
  return self->_numberToShow;
}

- (void)setNumberToShow:(int64_t)a3
{
  self->_numberToShow = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_verticalContraint, 0);
  objc_storeStrong((id *)&self->_horizontalContraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
