@implementation HUStatusDetailsTitleDescriptionCell

- (HUStatusDetailsTitleDescriptionCell)initWithFrame:(CGRect)a3
{
  HUStatusDetailsTitleDescriptionCell *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)HUStatusDetailsTitleDescriptionCell;
  v3 = -[HUStatusDetailsTitleDescriptionCell initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[HUStatusDetailsTitleDescriptionCell setTitleLabel:](v3, "setTitleLabel:", v4);

    -[HUStatusDetailsTitleDescriptionCell titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfLines:", 0);

    -[HUStatusDetailsTitleDescriptionCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUStatusDetailsTitleDescriptionCell titleLabel](v3, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    v8 = objc_alloc(MEMORY[0x1E0CEAB18]);
    v9 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HUStatusDetailsTitleDescriptionCell setDescriptionTextView:](v3, "setDescriptionTextView:", v9);

    -[HUStatusDetailsTitleDescriptionCell descriptionTextView](v3, "descriptionTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v3);

    -[HUStatusDetailsTitleDescriptionCell descriptionTextView](v3, "descriptionTextView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEditable:", 0);

    -[HUStatusDetailsTitleDescriptionCell descriptionTextView](v3, "descriptionTextView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setInteractiveTextSelectionDisabled:", 1);

    -[HUStatusDetailsTitleDescriptionCell descriptionTextView](v3, "descriptionTextView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setScrollEnabled:", 0);

    -[HUStatusDetailsTitleDescriptionCell descriptionTextView](v3, "descriptionTextView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", 0);

    v15 = *MEMORY[0x1E0CEB4B0];
    v16 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v17 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v18 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    -[HUStatusDetailsTitleDescriptionCell descriptionTextView](v3, "descriptionTextView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextContainerInset:", v15, v16, v17, v18);

    -[HUStatusDetailsTitleDescriptionCell descriptionTextView](v3, "descriptionTextView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "textContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLineFragmentPadding:", 0.0);

    -[HUStatusDetailsTitleDescriptionCell contentView](v3, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUStatusDetailsTitleDescriptionCell descriptionTextView](v3, "descriptionTextView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v23);

  }
  return v3;
}

- (HFStringGenerator)titleText
{
  void *v2;
  void *v3;

  -[HUStatusDetailsTitleDescriptionCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFStringGenerator *)v3;
}

- (void)setTitleText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "stringWithAttributes:", MEMORY[0x1E0C9AA70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedUppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  v12 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithString:attributes:", v6, v9);
  -[HUStatusDetailsTitleDescriptionCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedText:", v10);

}

- (HFStringGenerator)descriptionText
{
  void *v2;
  void *v3;

  -[HUStatusDetailsTitleDescriptionCell descriptionTextView](self, "descriptionTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFStringGenerator *)v3;
}

- (void)setDescriptionText:(id)a3
{
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
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CEA718];
  v5 = a3;
  objc_msgSend(v4, "prominentInsetGroupedHeaderConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = *MEMORY[0x1E0CEA098];
  objc_msgSend(v6, "secondaryTextProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v14[1] = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(v6, "secondaryTextProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithAttributes:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUStatusDetailsTitleDescriptionCell descriptionTextView](self, "descriptionTextView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttributedText:", v12);

}

- (void)setLayoutOptions:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "isEqual:", self->_layoutOptions) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[HUStatusDetailsTitleDescriptionCell layoutOptions](self, "layoutOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sectionHeaderFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUStatusDetailsTitleDescriptionCell titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    -[HUStatusDetailsTitleDescriptionCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[HUStatusDetailsTitleDescriptionCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  __int128 v5;
  CGSize result;

  v5 = *MEMORY[0x1E0C9D820];
  -[HUStatusDetailsTitleDescriptionCell _layoutContentApplyingFrames:forTargetSize:desiredSize:](self, "_layoutContentApplyingFrames:forTargetSize:desiredSize:", 0, &v5, a3.width, a3.height);
  v4 = *((double *)&v5 + 1);
  v3 = *(double *)&v5;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_layoutContentApplyingFrames:(BOOL)a3 forTargetSize:(CGSize)a4 desiredSize:(CGSize *)a5
{
  double height;
  double width;
  _BOOL4 v8;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  CGFloat x;
  CGFloat y;
  CGFloat v36;
  double MaxY;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat MaxX;
  CGFloat v43;
  id v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v10 = *MEMORY[0x1E0C9D538];
  -[HUStatusDetailsTitleDescriptionCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", width, height);
  v13 = v12;

  -[HUStatusDetailsTitleDescriptionCell layoutOptions](self, "layoutOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionTitleMargin");
  v16 = v15;

  if (v8)
  {
    -[HUStatusDetailsTitleDescriptionCell titleLabel](self, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v10, v16, width, v13);

  }
  -[HUStatusDetailsTitleDescriptionCell descriptionTextView](self, "descriptionTextView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_scaledValueForValue:", 20.0);
  v21 = HURoundToScreenScale(v20);

  -[HUStatusDetailsTitleDescriptionCell titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "font");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "descender");
  v25 = v13 + v16 + v24;

  -[HUStatusDetailsTitleDescriptionCell descriptionTextView](self, "descriptionTextView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "font");
  v44 = (id)objc_claimAutoreleasedReturnValue();

  -[HUStatusDetailsTitleDescriptionCell descriptionTextView](self, "descriptionTextView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sizeThatFits:", width, height);
  v29 = v28;

  objc_msgSend(v44, "ascender");
  v31 = v21 + v25 - v30;
  if (v8)
  {
    -[HUStatusDetailsTitleDescriptionCell descriptionTextView](self, "descriptionTextView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", v10, v31, width, v29);

  }
  v33 = v44;
  if (a5)
  {
    v45.origin.x = v10;
    v45.origin.y = v16;
    v45.size.width = width;
    v45.size.height = v13;
    v49.origin.x = v10;
    v49.origin.y = v31;
    v49.size.width = width;
    v49.size.height = v29;
    v46 = CGRectUnion(v45, v49);
    x = v46.origin.x;
    y = v46.origin.y;
    v36 = v46.size.width;
    v46.origin.x = v10;
    v46.origin.y = v31;
    v46.size.width = width;
    v46.size.height = v29;
    MaxY = CGRectGetMaxY(v46);
    objc_msgSend(v44, "lineHeight");
    v39 = v38;
    objc_msgSend(v44, "ascender");
    v41 = MaxY - (v39 - v40) + 14.0;
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = v36;
    v47.size.height = v41;
    MaxX = CGRectGetMaxX(v47);
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = v36;
    v48.size.height = v41;
    v43 = CGRectGetMaxY(v48);
    v33 = v44;
    a5->width = MaxX;
    a5->height = v43;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUStatusDetailsTitleDescriptionCell;
  -[HUStatusDetailsTitleDescriptionCell layoutSubviews](&v5, sel_layoutSubviews);
  -[HUStatusDetailsTitleDescriptionCell bounds](self, "bounds");
  -[HUStatusDetailsTitleDescriptionCell _layoutContentApplyingFrames:forTargetSize:desiredSize:](self, "_layoutContentApplyingFrames:forTargetSize:desiredSize:", 1, 0, v3, v4);
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (UITextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionTextView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (NSArray)labelConstraints
{
  return self->_labelConstraints;
}

- (void)setLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_labelConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
