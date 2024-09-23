@implementation _HKCustomInsetCellLayoutManager

+ (BOOL)requiresLegacyLayout
{
  return 1;
}

- (CGRect)contentRectForCell:(id)a3 forState:(unint64_t)a4
{
  id v6;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect result;

  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HKCustomInsetCellLayoutManager;
  -[UITableViewCellLayoutManager contentRectForCell:forState:](&v29, sel_contentRectForCell_forState_, v6, a4);
  v8 = v7;
  v10 = v9;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v12 = v11;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v14 = v13;
  if (objc_msgSend(v6, "hk_isLeftToRight"))
  {
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v16 = v15;
    objc_msgSend(v6, "frame");
    v18 = v17 - v16;
  }
  else
  {
    objc_msgSend(v6, "frame");
    v20 = v19;
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v18 = v20 - v21;
    objc_msgSend(v6, "frame");
    v23 = v22 - v18;
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v16 = v23 - v24;
  }

  v25 = v16;
  v26 = v12 + v8;
  v27 = v18;
  v28 = v10 - v14;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  uint64_t v5;
  id v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double MaxX;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect result;

  v5 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_HKCustomInsetCellLayoutManager;
  v7 = a3;
  -[UITableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](&v20, sel_textRectForCell_rowWidth_forSizing_, v7, v5, a4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  LODWORD(v5) = objc_msgSend(v7, "hk_isLeftToRight", v20.receiver, v20.super_class);

  if ((_DWORD)v5)
  {
    MaxX = a4 - v9;
  }
  else
  {
    v21.origin.x = v9;
    v21.origin.y = v11;
    v21.size.width = v13;
    v21.size.height = v15;
    MaxX = CGRectGetMaxX(v21);
    v9 = v9 - (MaxX - v13);
  }
  v17 = v9;
  v18 = v11;
  v19 = v15;
  result.size.height = v19;
  result.size.width = MaxX;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)editControlStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
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
  objc_super v18;
  CGRect result;

  v18.receiver = self;
  v18.super_class = (Class)_HKCustomInsetCellLayoutManager;
  -[UITableViewCellLayoutManager editControlStartingRectForCell:forNewEditingState:](&v18, sel_editControlStartingRectForCell_forNewEditingState_, a3, a4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v14 = v13 + v8;
  v15 = v6;
  v16 = v10;
  v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (CGRect)editControlEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
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
  objc_super v18;
  CGRect result;

  v18.receiver = self;
  v18.super_class = (Class)_HKCustomInsetCellLayoutManager;
  -[UITableViewCellLayoutManager editControlEndingRectForCell:forNewEditingState:](&v18, sel_editControlEndingRectForCell_forNewEditingState_, a3, a4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v14 = v13 + v8;
  v15 = v6;
  v16 = v10;
  v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (CGRect)accessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
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
  double v20;
  objc_super v21;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)_HKCustomInsetCellLayoutManager;
  -[UITableViewCellLayoutManager accessoryStartingRectForCell:forNewEditingState:showingDeleteConfirmation:](&v21, sel_accessoryStartingRectForCell_forNewEditingState_showingDeleteConfirmation_, a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v15 = v14 + v9;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v17 = v13 - v16;
  v18 = v7;
  v19 = v15;
  v20 = v11;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
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
  double v20;
  objc_super v21;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)_HKCustomInsetCellLayoutManager;
  -[UITableViewCellLayoutManager accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](&v21, sel_accessoryEndingRectForCell_forNewEditingState_showingDeleteConfirmation_, a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v15 = v14 + v9;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v17 = v13 - v16;
  v18 = v7;
  v19 = v15;
  v20 = v11;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)editingAccessoryStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
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
  double v20;
  objc_super v21;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)_HKCustomInsetCellLayoutManager;
  -[UITableViewCellLayoutManager editingAccessoryStartingRectForCell:forNewEditingState:showingDeleteConfirmation:](&v21, sel_editingAccessoryStartingRectForCell_forNewEditingState_showingDeleteConfirmation_, a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v15 = v14 + v9;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v17 = v13 - v16;
  v18 = v7;
  v19 = v15;
  v20 = v11;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)editingAccessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
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
  double v20;
  objc_super v21;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)_HKCustomInsetCellLayoutManager;
  -[UITableViewCellLayoutManager editingAccessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](&v21, sel_editingAccessoryEndingRectForCell_forNewEditingState_showingDeleteConfirmation_, a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v15 = v14 + v9;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v17 = v13 - v16;
  v18 = v7;
  v19 = v15;
  v20 = v11;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)contentStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect result;

  v4 = a4;
  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HKCustomInsetCellLayoutManager;
  -[UITableViewCellLayoutManager contentStartingRectForCell:forNewEditingState:](&v29, sel_contentStartingRectForCell_forNewEditingState_, v6, v4);
  v8 = v7;
  v10 = v9;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v12 = v11;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v14 = v13;
  if (objc_msgSend(v6, "hk_isLeftToRight"))
  {
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v16 = v15;
    objc_msgSend(v6, "frame");
    v18 = v17 - v16;
  }
  else
  {
    objc_msgSend(v6, "frame");
    v20 = v19;
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v18 = v20 - v21;
    objc_msgSend(v6, "frame");
    v23 = v22 - v18;
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v16 = v23 - v24;
  }

  v25 = v16;
  v26 = v12 + v8;
  v27 = v18;
  v28 = v10 - v14;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)contentEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect result;

  v4 = a4;
  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HKCustomInsetCellLayoutManager;
  -[UITableViewCellLayoutManager contentEndingRectForCell:forNewEditingState:](&v29, sel_contentEndingRectForCell_forNewEditingState_, v6, v4);
  v8 = v7;
  v10 = v9;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v12 = v11;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v14 = v13;
  if (objc_msgSend(v6, "hk_isLeftToRight"))
  {
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v16 = v15;
    objc_msgSend(v6, "frame");
    v18 = v17 - v16;
  }
  else
  {
    objc_msgSend(v6, "frame");
    v20 = v19;
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v18 = v20 - v21;
    objc_msgSend(v6, "frame");
    v23 = v22 - v18;
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v16 = v23 - v24;
  }

  v25 = v16;
  v26 = v12 + v8;
  v27 = v18;
  v28 = v10 - v14;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)contentStartingRectForCell:(id)a3 forDisplayOfDeleteConfirmation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect result;

  v4 = a4;
  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HKCustomInsetCellLayoutManager;
  -[UITableViewCellLayoutManager contentStartingRectForCell:forDisplayOfDeleteConfirmation:](&v29, sel_contentStartingRectForCell_forDisplayOfDeleteConfirmation_, v6, v4);
  v8 = v7;
  v10 = v9;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v12 = v11;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v14 = v13;
  if (objc_msgSend(v6, "hk_isLeftToRight"))
  {
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v16 = v15;
    objc_msgSend(v6, "frame");
    v18 = v17 - v16;
  }
  else
  {
    objc_msgSend(v6, "frame");
    v20 = v19;
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v18 = v20 - v21;
    objc_msgSend(v6, "frame");
    v23 = v22 - v18;
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v16 = v23 - v24;
  }

  v25 = v16;
  v26 = v12 + v8;
  v27 = v18;
  v28 = v10 - v14;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)contentEndingRectForCell:(id)a3 forDisplayOfDeleteConfirmation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect result;

  v4 = a4;
  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_HKCustomInsetCellLayoutManager;
  -[UITableViewCellLayoutManager contentEndingRectForCell:forDisplayOfDeleteConfirmation:](&v29, sel_contentEndingRectForCell_forDisplayOfDeleteConfirmation_, v6, v4);
  v8 = v7;
  v10 = v9;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v12 = v11;
  -[_HKCustomInsetCellLayoutManager topInset](self, "topInset");
  v14 = v13;
  if ((objc_msgSend(v6, "_shouldReverseLayoutDirection") & 1) != 0)
  {
    objc_msgSend(v6, "frame");
    v16 = v15;
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v18 = v16 - v17;
    objc_msgSend(v6, "frame");
    v20 = v19 - v18;
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v22 = v20 - v21;
  }
  else
  {
    -[_HKCustomInsetCellLayoutManager textLabelLeftInset](self, "textLabelLeftInset");
    v22 = v23;
    objc_msgSend(v6, "frame");
    v18 = v24 - v22;
  }

  v25 = v22;
  v26 = v12 + v8;
  v27 = v18;
  v28 = v10 - v14;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (double)textLabelLeftInset
{
  return self->_textLabelLeftInset;
}

- (void)setTextLabelLeftInset:(double)a3
{
  self->_textLabelLeftInset = a3;
}

@end
