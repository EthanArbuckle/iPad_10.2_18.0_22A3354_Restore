@implementation SubtitleCellWithAdditionalIcon

- (UIImageView)icon
{
  UIImageView *icon;
  UIImageView *v4;
  UIImageView *v5;
  void *v6;

  icon = self->_icon;
  if (!icon)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v5 = self->_icon;
    self->_icon = v4;

    -[SubtitleCellWithAdditionalIcon contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_icon);

    icon = self->_icon;
  }
  return icon;
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
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  BOOL v29;
  UIImageView *icon;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  int IsLeftToRight;
  double v38;
  double v39;
  double v40;
  double v41;
  int v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  int v48;
  double v49;
  double v50;
  void *v51;
  int v52;
  double v53;
  double v54;
  double v55;
  double v56;
  int v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  int v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  objc_super v85;
  CGRect v86;
  CGRect v87;

  v85.receiver = self;
  v85.super_class = (Class)SubtitleCellWithAdditionalIcon;
  -[EKUITableViewCell layoutSubviews](&v85, sel_layoutSubviews);
  -[SubtitleCellWithAdditionalIcon contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (self->_icon)
  {
    -[SubtitleCellWithAdditionalIcon textLabel](self, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeToFit");

    -[SubtitleCellWithAdditionalIcon detailTextLabel](self, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeToFit");

    -[UIImageView sizeToFit](self->_icon, "sizeToFit");
    -[SubtitleCellWithAdditionalIcon textLabel](self, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v78 = v15;
    v80 = v16;
    v76 = v17;
    v19 = v18;

    -[SubtitleCellWithAdditionalIcon detailTextLabel](self, "detailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    v24 = v23;
    v82 = v25;
    v27 = v26;

    -[SubtitleCellWithAdditionalIcon traitCollection](self, "traitCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = EKUIUsesLargeTextLayout(v28);

    icon = self->_icon;
    if (v29)
    {
      -[UIImageView removeFromSuperview](icon, "removeFromSuperview");
    }
    else
    {
      v72 = v19;
      v74 = v24;
      -[UIImageView frame](icon, "frame");
      v32 = v31;
      v75 = v33;
      v34 = 6.0;
      if (CalInterfaceIsLeftToRight())
      {
        v86.origin.x = v5;
        v86.origin.y = v7;
        v86.size.width = v9;
        v86.size.height = v11;
        v34 = CGRectGetMaxX(v86) + -6.0 - v32;
      }
      v87.origin.x = v5;
      v87.origin.y = v7;
      v87.size.width = v9;
      v87.size.height = v11;
      v35 = round((CGRectGetMaxY(v87) - v75) * 0.5);
      -[UIImageView setFrame:](self->_icon, "setFrame:", v34, v35, v32, v75);
      -[SubtitleCellWithAdditionalIcon contentView](self, "contentView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addSubview:", self->_icon);

      IsLeftToRight = CalInterfaceIsLeftToRight();
      if (IsLeftToRight)
        v38 = v78;
      else
        v38 = v34;
      if (IsLeftToRight)
        v39 = v80;
      else
        v39 = v35;
      v69 = v39;
      v70 = v38;
      if (IsLeftToRight)
        v40 = v76;
      else
        v40 = v32;
      if (IsLeftToRight)
        v41 = v72;
      else
        v41 = v75;
      v67 = v41;
      v68 = v40;
      v42 = CalInterfaceIsLeftToRight();
      if (v42)
        v43 = v35;
      else
        v43 = v80;
      if (v42)
        v44 = v34;
      else
        v44 = v78;
      v71 = v32;
      if (v42)
        v45 = v32;
      else
        v45 = v76;
      if (v42)
        v46 = v75;
      else
        v46 = v72;
      v84 = 0.0;
      if (-[SubtitleCellWithAdditionalIcon leftFrame:overlapsRightFrame:difference:](self, "leftFrame:overlapsRightFrame:difference:", &v84, v70, v69, v68, v67, v44, v43, v45, v46, *(_QWORD *)&v67, *(_QWORD *)&v68))
      {
        v47 = v76 - v84;
        v48 = CalInterfaceIsLeftToRight();
        v49 = v84;
        if (v48)
          v49 = -0.0;
        v50 = v78 + v49;
        -[SubtitleCellWithAdditionalIcon textLabel](self, "textLabel");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setFrame:", v50, v80, v47, v72);

      }
      v52 = CalInterfaceIsLeftToRight();
      if (v52)
        v53 = v22;
      else
        v53 = v34;
      if (v52)
        v54 = v74;
      else
        v54 = v35;
      v79 = v54;
      v81 = v53;
      if (v52)
        v55 = v82;
      else
        v55 = v71;
      v77 = v55;
      if (v52)
        v56 = v27;
      else
        v56 = v75;
      v73 = v56;
      v57 = CalInterfaceIsLeftToRight();
      if (v57)
        v58 = v34;
      else
        v58 = v22;
      if (v57)
        v59 = v35;
      else
        v59 = v74;
      if (v57)
        v60 = v71;
      else
        v60 = v82;
      if (v57)
        v61 = v75;
      else
        v61 = v27;
      v83 = 0.0;
      if (-[SubtitleCellWithAdditionalIcon leftFrame:overlapsRightFrame:difference:](self, "leftFrame:overlapsRightFrame:difference:", &v83, v81, v79, v77, v73, v58, v59, v60, v61))
      {
        v62 = v82 - v83;
        v63 = CalInterfaceIsLeftToRight();
        v64 = v83;
        if (v63)
          v64 = -0.0;
        v65 = v22 + v64;
        -[SubtitleCellWithAdditionalIcon detailTextLabel](self, "detailTextLabel");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setFrame:", v65, v74, v62, v27);

      }
    }
  }
}

- (BOOL)leftFrame:(CGRect)a3 overlapsRightFrame:(CGRect)a4 difference:(double *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MaxX;
  double v11;
  CGRect v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MaxX = CGRectGetMaxX(a3);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v11 = MaxX - (CGRectGetMinX(v13) + -5.0);
  *a5 = v11;
  return v11 > 0.0;
}

- (id)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
