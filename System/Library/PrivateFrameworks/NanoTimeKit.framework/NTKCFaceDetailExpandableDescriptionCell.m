@implementation NTKCFaceDetailExpandableDescriptionCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailExpandableDescriptionCell)init
{
  NTKCFaceDetailExpandableDescriptionCell *v2;
  NTKCFaceDetailExpandableDescriptionCell *v3;
  uint64_t v4;
  UIButton *moreButton;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NTKCFaceDetailExpandableDescriptionCell;
  v2 = -[NTKCFaceDetailDescriptionCell init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NTKCFaceDetailExpandableDescriptionCell setClipsToBounds:](v2, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    moreButton = v3->_moreButton;
    v3->_moreButton = (UIButton *)v4;

    BPSBridgeTintColor();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v3->_moreButton, "setTintColor:", v6);

    -[NTKCFaceDetailDescriptionCell textView](v3, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v3->_moreButton, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    v10 = v3->_moreButton;
    NTKCCustomizationLocalizedString(CFSTR("ACTION_MORE"), (uint64_t)CFSTR("more"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v10, "setTitle:forState:", v12, 0);

    -[UIButton addTarget:action:forControlEvents:](v3->_moreButton, "addTarget:action:forControlEvents:", v3, sel__moreTapped, 64);
    -[NTKCFaceDetailExpandableDescriptionCell contentView](v3, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v3->_moreButton);

    v3->_shouldLayoutText = 1;
    v3->_laidOutWidth = 0.0;
  }
  return v3;
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    self->_shouldLayoutText = 1;
    -[NTKCFaceDetailExpandableDescriptionCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCFaceDetailExpandableDescriptionCell;
  -[NTKCFaceDetailDescriptionCell setText:](&v4, sel_setText_, a3);
  self->_shouldLayoutText = 1;
}

- (void)setAttributedText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKCFaceDetailExpandableDescriptionCell;
  -[NTKCFaceDetailDescriptionCell setAttributedText:](&v4, sel_setAttributedText_, a3);
  self->_shouldLayoutText = 1;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailExpandableDescriptionCell;
  -[NTKCFaceDetailExpandableDescriptionCell prepareForReuse](&v3, sel_prepareForReuse);
  self->_shouldLayoutText = 1;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double Width;
  double v13;
  double v14;
  int IsRTL;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double Height;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double MinX;
  double v59;
  double v60;
  double v61;
  double MaxX;
  double v63;
  void *v64;
  _BOOL4 expanded;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  CGFloat rect;
  double rect_8;
  double rect_16;
  double rect_24;
  objc_super v99;
  _QWORD v100[2];
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;

  v100[1] = *MEMORY[0x1E0C80C00];
  v99.receiver = self;
  v99.super_class = (Class)NTKCFaceDetailExpandableDescriptionCell;
  -[NTKCFaceDetailDescriptionCell layoutSubviews](&v99, sel_layoutSubviews);
  -[NTKCFaceDetailExpandableDescriptionCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v101.origin.x = v5;
  v101.origin.y = v7;
  v101.size.width = v9;
  v101.size.height = v11;
  Width = CGRectGetWidth(v101);
  -[NTKCFaceDetailExpandableDescriptionCell separatorInset](self, "separatorInset");
  v14 = Width + v13 * -2.0;
  IsRTL = CLKLayoutIsRTL();
  if (self->_shouldLayoutText || self->_laidOutWidth != v14)
  {
    -[NTKCFaceDetailDescriptionCell textView](self, "textView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setExclusionPaths:", MEMORY[0x1E0C9AA60]);

    -[NTKCFaceDetailDescriptionCell textView](self, "textView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMaximumNumberOfLines:", 3);

    -[NTKCFaceDetailDescriptionCell textView](self, "textView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeThatFits:", v14, 1.79769313e308);
    rect_16 = v21;

    -[NTKCFaceDetailDescriptionCell textView](self, "textView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "textContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMaximumNumberOfLines:", 0);

    -[NTKCFaceDetailDescriptionCell textView](self, "textView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sizeThatFits:", v14, 1.79769313e308);
    rect_8 = v25;

    if (self->_expanded)
      v26 = 0;
    else
      v26 = 3;
    -[NTKCFaceDetailDescriptionCell textView](self, "textView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "textContainer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMaximumNumberOfLines:", v26);

    -[NTKCFaceDetailDescriptionCell textView](self, "textView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "frame");

    -[NTKCFaceDetailDescriptionCell textView](self, "textView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sizeThatFits:", v14, 1.79769313e308);
    v32 = v31;

    -[NTKCFaceDetailExpandableDescriptionCell separatorInset](self, "separatorInset");
    v34 = v33;
    -[NTKCFaceDetailDescriptionCell textView](self, "textView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "font");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_scaledValueForValue:", 13.5);
    v38 = v37;

    -[NTKCFaceDetailDescriptionCell textView](self, "textView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFrame:", v34, v38, v14, v32);

    -[NTKCFaceDetailExpandableDescriptionCell moreButton](self, "moreButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sizeToFit");

    -[NTKCFaceDetailExpandableDescriptionCell moreButton](self, "moreButton");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutIfNeeded");

    -[NTKCFaceDetailExpandableDescriptionCell moreButton](self, "moreButton");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "frame");
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v50 = v49;

    rect = v44;
    v102.origin.x = v44;
    v102.origin.y = v46;
    v102.size.width = v48;
    v102.size.height = v50;
    Height = CGRectGetHeight(v102);
    -[NTKCFaceDetailExpandableDescriptionCell moreButton](self, "moreButton");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "titleLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "frame");
    rect_24 = Height - CGRectGetMaxY(v103);

    v54 = v34;
    v55 = v38;
    v56 = v14;
    v57 = v32;
    if (IsRTL)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v54);
    }
    else
    {
      v94 = v14;
      v59 = v38;
      v60 = v34;
      v61 = v32;
      MaxX = CGRectGetMaxX(*(CGRect *)&v54);
      v104.origin.x = rect;
      v104.origin.y = v46;
      v104.size.width = v48;
      v104.size.height = v50;
      MinX = MaxX - CGRectGetWidth(v104);
      v32 = v61;
      v34 = v60;
      v38 = v59;
      v14 = v94;
    }
    v105.origin.x = v34;
    v105.origin.y = v38;
    v105.size.width = v14;
    v105.size.height = v32;
    v63 = rect_24 + CGRectGetMaxY(v105) - Height;
    -[NTKCFaceDetailExpandableDescriptionCell moreButton](self, "moreButton");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setFrame:", MinX, v63, v48, v50);

    expanded = self->_expanded;
    -[NTKCFaceDetailExpandableDescriptionCell moreButton](self, "moreButton");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v66;
    if (expanded || (v68 = rect_8, v67 = rect_16, rect_8 <= rect_16))
    {
      objc_msgSend(v66, "setHidden:", 1, v67, v68);
    }
    else
    {
      objc_msgSend(v66, "setHidden:", 0, rect_16, rect_8);

      -[NTKCFaceDetailDescriptionCell textView](self, "textView");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailExpandableDescriptionCell moreButton](self, "moreButton");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "titleLabel");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "frame");
      v74 = v73;
      v76 = v75;
      v77 = v14;
      v79 = v78;
      v81 = v80;
      -[NTKCFaceDetailExpandableDescriptionCell moreButton](self, "moreButton");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "convertRect:fromView:", v82, v74, v76, v79, v81);
      v84 = v83;
      v86 = v85;
      v88 = v87;
      v90 = v89;

      v106.origin.x = v84;
      v106.origin.y = v86;
      v106.size.width = v88;
      v14 = v77;
      v106.size.height = v90;
      v107 = CGRectInset(v106, 0.0, 1.0);
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", v107.origin.x, v107.origin.y, v107.size.width, v107.size.height);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = v69;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 1);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKCFaceDetailDescriptionCell textView](self, "textView");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "textContainer");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setExclusionPaths:", v91);

    }
    self->_shouldLayoutText = 0;
    self->_laidOutWidth = v14;
  }
}

- (void)_moreTapped
{
  id v3;

  -[NTKCFaceDetailExpandableDescriptionCell setExpanded:](self, "setExpanded:", 1);
  -[NTKCFaceDetailExpandableDescriptionCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionCellDidExpand:", self);

}

- (void)_fontSizeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKCFaceDetailExpandableDescriptionCell;
  -[NTKCFaceDetailDescriptionCell _fontSizeDidChange](&v6, sel__fontSizeDidChange);
  -[NTKCFaceDetailDescriptionCell textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_moreButton, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  self->_shouldLayoutText = 1;
  -[NTKCFaceDetailExpandableDescriptionCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (NTKCFaceDetailExpandableDescriptionCellDelegate)delegate
{
  return (NTKCFaceDetailExpandableDescriptionCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (double)laidOutWidth
{
  return self->_laidOutWidth;
}

- (void)setLaidOutWidth:(double)a3
{
  self->_laidOutWidth = a3;
}

- (BOOL)shouldLayoutText
{
  return self->_shouldLayoutText;
}

- (void)setShouldLayoutText:(BOOL)a3
{
  self->_shouldLayoutText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
