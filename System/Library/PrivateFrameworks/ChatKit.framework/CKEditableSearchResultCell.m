@implementation CKEditableSearchResultCell

- (void)_ck_setEditing:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->__ck_editing != a3)
  {
    self->__ck_editing = a3;
    if (a3)
    {
      v4 = objc_alloc(MEMORY[0x1E0CEA658]);
      v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKEditableSearchResultCell contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", v5);

      -[CKEditableSearchResultCell setCheckmarkView:](self, "setCheckmarkView:", v5);
      -[CKEditableSearchResultCell setSelected:](self, "setSelected:", 0);

    }
    else
    {
      -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

      -[CKEditableSearchResultCell setCheckmarkView:](self, "setCheckmarkView:", 0);
    }
    -[CKEditableSearchResultCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelected:(BOOL)a3
{
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
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)CKEditableSearchResultCell;
  -[CKEditableSearchResultCell setSelected:](&v16, sel_setSelected_);
  v5 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_configurationWithHierarchicalColors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithSymbolConfiguration:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("circle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithTintColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithRenderingMode:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v12);

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKEditableSearchResultCell;
  -[CKEditableSearchResultCell layoutSubviews](&v4, sel_layoutSubviews);
  -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHighlighted:", -[CKEditableSearchResultCell isSelected](self, "isSelected"));

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKEditableSearchResultCell;
  -[CKEditableSearchResultCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKEditableSearchResultCell _ck_setEditing:](self, "_ck_setEditing:", 0);
}

- (BOOL)_ck_isEditing
{
  return self->__ck_editing;
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIImageView)selectionOverlay
{
  return self->_selectionOverlay;
}

- (void)setSelectionOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_selectionOverlay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionOverlay, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
}

@end
