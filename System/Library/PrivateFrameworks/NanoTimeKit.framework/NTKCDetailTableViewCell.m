@implementation NTKCDetailTableViewCell

+ (id)reuseIdentifier
{
  return 0;
}

- (double)rowHeight
{
  return 0.0;
}

+ (id)titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 19.0, *MEMORY[0x1E0DC1438]);
}

- (NTKCDetailTableViewCell)init
{
  return -[NTKCDetailTableViewCell initWithStyle:](self, "initWithStyle:", 0);
}

- (NTKCDetailTableViewCell)initWithStyle:(int64_t)a3
{
  return -[NTKCDetailTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", a3, 0);
}

- (NTKCDetailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  NTKCDetailTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKCDetailTableViewCell;
  v4 = -[NTKCDetailTableViewCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    BPSBackgroundColor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCDetailTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCDetailTableViewCell setSelectionTintColor:](v4, "setSelectionTintColor:", v6);

    -[NTKCDetailTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    objc_msgSend((id)objc_opt_class(), "defaultTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCDetailTableViewCell textLabel](v4, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    if (CLKLayoutIsRTL())
      v9 = 0;
    else
      v9 = 2;
    -[NTKCDetailTableViewCell detailTextLabel](v4, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextAlignment:", v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel__fontSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

    -[NTKCDetailTableViewCell _fontSizeDidChange](v4, "_fontSizeDidChange");
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)NTKCDetailTableViewCell;
  -[NTKCDetailTableViewCell dealloc](&v4, sel_dealloc);
}

- (void)setShowsSeparator:(BOOL)a3
{
  UIView *separatorView;
  void *v5;
  uint64_t v6;

  if (self->_showsSeparator != a3)
  {
    self->_showsSeparator = a3;
    separatorView = self->_separatorView;
    if (a3)
    {
      if (!separatorView)
      {
        v5 = (void *)objc_opt_new();
        -[NTKCDetailTableViewCell setSeparatorView:](self, "setSeparatorView:", v5);

        -[NTKCDetailTableViewCell addSubview:](self, "addSubview:", self->_separatorView);
        separatorView = self->_separatorView;
      }
      v6 = 0;
    }
    else
    {
      v6 = 1;
    }
    -[UIView setHidden:](separatorView, "setHidden:", v6);
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  int IsRTL;
  void *v18;
  void *v19;
  _BOOL4 ignoresRTLCorrection;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double Width;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  CGFloat v39;
  double v40;
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  double v71;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double Height;
  CGFloat v82;
  CGFloat v83;
  CGFloat rect;
  objc_super v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  v85.receiver = self;
  v85.super_class = (Class)NTKCDetailTableViewCell;
  -[NTKCDetailTableViewCell layoutSubviews](&v85, sel_layoutSubviews);
  -[NTKCDetailTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = NTKCScreenEdgeMargin();
  -[NTKCDetailTableViewCell textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_scaledValueForValue:", 28.0);
  v16 = v15;

  IsRTL = CLKLayoutIsRTL();
  -[NTKCDetailTableViewCell textLabel](self, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "length"))
  {

LABEL_17:
    goto LABEL_18;
  }
  v83 = v11;
  rect = v9;
  ignoresRTLCorrection = self->_ignoresRTLCorrection;

  if (!ignoresRTLCorrection)
  {
    v82 = v5;
    -[NTKCDetailTableViewCell textLabel](self, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v30 = v12;
    if (IsRTL)
    {
      v86.origin.x = v82;
      v86.size.height = v83;
      v86.origin.y = v7;
      v86.size.width = rect;
      Width = CGRectGetWidth(v86);
      v87.origin.x = v23;
      v87.origin.y = v25;
      v87.size.width = v27;
      v87.size.height = v29;
      v30 = Width - CGRectGetWidth(v87) - v12;
    }
    -[NTKCDetailTableViewCell textLabel](self, "textLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_lastLineBaseline");
    v34 = v16 - v33;

    v88.origin.x = v30;
    v88.origin.y = v34;
    v88.size.width = v27;
    v88.size.height = v29;
    if (CGRectGetMinY(v88) < 0.0)
      v34 = 0.0;
    -[NTKCDetailTableViewCell textLabel](self, "textLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", v30, v34, v27, v29);

    -[NTKCDetailTableViewCell detailTextLabel](self, "detailTextLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "text");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "length");

    if (v38)
    {
      v89.origin.x = v82;
      v89.origin.y = v7;
      v89.size.height = v83;
      v89.size.width = rect;
      v39 = CGRectGetWidth(v89) + v12 * -2.0;
      v90.origin.x = v30;
      v90.origin.y = v34;
      v90.size.width = v27;
      v90.size.height = v29;
      v40 = v39 - CGRectGetWidth(v90) + -16.0;
      -[NTKCDetailTableViewCell detailTextLabel](self, "detailTextLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "frame");
      v43 = v42;
      v45 = v44;
      v47 = v46;

      -[NTKCDetailTableViewCell detailTextLabel](self, "detailTextLabel");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "_lastLineBaseline");
      v50 = v16 - v49;

      v91.origin.x = v43;
      v91.origin.y = v50;
      v91.size.width = v45;
      v91.size.height = v47;
      v51 = CGRectGetWidth(v91);
      v52 = 0.0;
      if (v40 >= 0.0)
        v52 = v40;
      if (v51 <= v40)
        v53 = v45;
      else
        v53 = v52;
      if ((IsRTL & 1) == 0)
      {
        v92.origin.x = v82;
        v92.size.height = v83;
        v92.origin.y = v7;
        v92.size.width = rect;
        v54 = CGRectGetWidth(v92) - v12;
        v93.origin.x = v43;
        v93.origin.y = v50;
        v93.size.width = v53;
        v93.size.height = v47;
        v12 = v54 - CGRectGetWidth(v93);
      }
      -[NTKCDetailTableViewCell detailTextLabel](self, "detailTextLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", v12, v50, v53, v47);
      goto LABEL_17;
    }
  }
LABEL_18:
  -[NTKCDetailTableViewCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_separatorView);
  -[UIView frame](self->_separatorView, "frame");
  v56 = v55;
  v58 = v57;
  v60 = v59;
  -[NTKCDetailTableViewCell bounds](self, "bounds");
  v62 = v61;
  v64 = v63;
  v66 = v65;
  v68 = v67;
  -[NTKCDetailTableViewCell separatorInset](self, "separatorInset");
  v70 = v64 + v69;
  v73 = v66 - (v71 + v72);
  v94.size.height = v68 - (v69 + v74);
  v94.origin.x = v62 + v71;
  v94.origin.y = v70;
  v94.size.width = v73;
  v75 = CGRectGetWidth(v94);
  if (IsRTL)
  {
    -[NTKCDetailTableViewCell bounds](self, "bounds");
    v76 = CGRectGetWidth(v95);
    v96.origin.x = v56;
    v96.origin.y = v58;
    v96.size.width = v75;
    v96.size.height = v60;
    v77 = v76 - CGRectGetWidth(v96);
    -[NTKCDetailTableViewCell separatorInset](self, "separatorInset");
    v79 = v77 - v78;
  }
  else
  {
    -[NTKCDetailTableViewCell separatorInset](self, "separatorInset");
    v79 = v80;
  }
  -[NTKCDetailTableViewCell bounds](self, "bounds");
  Height = CGRectGetHeight(v97);
  v98.origin.x = v79;
  v98.origin.y = v58;
  v98.size.width = v75;
  v98.size.height = v60;
  -[UIView setFrame:](self->_separatorView, "setFrame:", v79, Height - CGRectGetHeight(v98), v75, v60);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NTKCDetailTableViewCell;
  -[NTKCDetailTableViewCell setHighlighted:animated:](&v16, sel_setHighlighted_animated_, a3, a4);
  if (-[NTKCDetailTableViewCell selectionStyle](self, "selectionStyle"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NTKCDetailTableViewCell subviews](self, "subviews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v10;
            objc_msgSend(v11, "setSelected:", -[NTKCDetailTableViewCell isHighlighted](self, "isHighlighted"));

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)NTKCDetailTableViewCell;
  -[NTKCDetailTableViewCell hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && -[NTKCDetailTableViewCell _visibleAtPoint:](self, "_visibleAtPoint:", x, y))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (BOOL)_visibleAtPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
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
  double v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  BOOL v34;
  CGPoint v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  -[NTKCDetailTableViewCell _tableView](self, "_tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "contentInset");
  v15 = v7 + v14;
  v17 = v9 + v16;
  v19 = v11 - (v14 + v18);
  v21 = v13 - (v16 + v20);
  objc_msgSend(v4, "headerViewForSection:", objc_msgSend(v5, "section"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v42.origin.x = v23;
  v42.origin.y = v24;
  v42.size.width = v25;
  v42.size.height = v26;
  v38.origin.x = v15;
  v38.origin.y = v17;
  v38.size.width = v19;
  v38.size.height = v21;
  v39 = CGRectIntersection(v38, v42);
  x = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  if (!CGRectIsNull(v39))
  {
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v31 = CGRectGetHeight(v40);
    v17 = v17 + v31;
    v21 = v21 - v31;
  }
  -[NTKCDetailTableViewCell convertPoint:toView:](self, "convertPoint:toView:", v4, a3.x, a3.y);
  v37.x = v32;
  v37.y = v33;
  v41.origin.x = v15;
  v41.origin.y = v17;
  v41.size.width = v19;
  v41.size.height = v21;
  v34 = CGRectContainsPoint(v41, v37);

  return v34;
}

- (id)_fontForTextLabel
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (void)_fontSizeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NTKCDetailTableViewCell _fontForTextLabel](self, "_fontForTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCDetailTableViewCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  -[NTKCDetailTableViewCell _fontForDetailTextLabel](self, "_fontForDetailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCDetailTableViewCell detailTextLabel](self, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[NTKCDetailTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)showsSeparator
{
  return self->_showsSeparator;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (BOOL)ignoresRTLCorrection
{
  return self->_ignoresRTLCorrection;
}

- (void)setIgnoresRTLCorrection:(BOOL)a3
{
  self->_ignoresRTLCorrection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
