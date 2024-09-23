@implementation CNFRegTableLabel

- (CNFRegTableLabel)initWithSpecifier:(id)a3
{
  id v5;
  CNFRegTableLabel *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  UILabel *label;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNFRegTableLabel;
  v6 = -[CNFRegTableLabel init](&v16, sel_init);
  if (v6)
  {
    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegTableLabel setContentMode:](v6, "setContentMode:", 3);
    -[CNFRegTableLabel setOpaque:](v6, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegTableLabel setBackgroundColor:](v6, "setBackgroundColor:", v8);

    objc_storeStrong((id *)&v6->_specifier, a3);
    v9 = objc_alloc(MEMORY[0x24BEBD708]);
    -[CNFRegTableLabel frame](v6, "frame");
    v10 = objc_msgSend(v9, "initWithFrame:");
    label = v6->_label;
    v6->_label = (UILabel *)v10;

    objc_msgSend(v7, "tableHeaderTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_label, "setTextColor:", v12);

    -[UILabel setNumberOfLines:](v6->_label, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v6->_label, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v6->_label, "setBackgroundColor:", v13);

    objc_msgSend(v7, "tableHeaderTextShadowColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setShadowColor:](v6->_label, "setShadowColor:", v14);

    objc_msgSend(v7, "tableHeaderTextShadowOffset");
    -[UILabel setShadowOffset:](v6->_label, "setShadowOffset:");
    -[UILabel setAutoresizingMask:](v6->_label, "setAutoresizingMask:", 18);
    -[CNFRegTableLabel addSubview:](v6, "addSubview:", v6->_label);
    -[CNFRegTableLabel updateLabelText](v6, "updateLabelText");

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CNFRegLearnMoreButton removeTarget:action:forControlEvents:](self->_urlButton, "removeTarget:action:forControlEvents:", self, sel__handleUrlTapped_, 64);
  self->_cnfreg_tableView = 0;
  v3.receiver = self;
  v3.super_class = (Class)CNFRegTableLabel;
  -[CNFRegTableLabel dealloc](&v3, sel_dealloc);
}

- (void)clearSpecifier
{
  PSSpecifier *specifier;

  specifier = self->_specifier;
  self->_specifier = 0;

}

- (double)_labelInset
{
  float v2;
  float v3;
  float v4;

  PreferencesTableViewCellLeftPad();
  v3 = v2;
  PreferencesTableViewCellRightPad();
  return fmaxf(v3, v4);
}

- (double)_topPadding
{
  _BOOL4 v2;
  void *v3;
  uint64_t v4;
  float v5;
  float v6;

  v2 = -[CNFRegTableLabel isTopmostHeader](self, "isTopmostHeader");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 7.0;
  if (v4 == 1)
    v5 = 5.0;
  v6 = 17.0;
  if (v4 == 1)
    v6 = 26.0;
  if (v2)
    return v6;
  return v5;
}

- (double)_bottomPadding
{
  return 8.0;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CNFRegLearnMoreButton *urlButton;
  int64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double MinX;
  double MaxX;
  double MidX;
  CGFloat v47;
  CGFloat v48;
  CGFloat rect;
  uint64_t v50;
  _QWORD v51[2];
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v51[1] = *MEMORY[0x24BDAC8D0];
  -[CNFRegTableLabel bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UITableView _backgroundInset](self->_cnfreg_tableView, "_backgroundInset");
  v12 = v11;
  -[CNFRegTableLabel _labelInset](self, "_labelInset");
  v14 = v12 + v13;
  v52.origin.x = v4;
  v52.origin.y = v6;
  v52.size.width = v8;
  v52.size.height = v10;
  v53 = CGRectInset(v52, v14, 0.0);
  x = v53.origin.x;
  y = v53.origin.y;
  width = v53.size.width;
  height = v53.size.height;
  v19 = CGRectGetWidth(v53);
  -[UILabel text](self->_label, "text");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20
    && (v21 = (void *)v20,
        -[UILabel text](self->_label, "text"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "length"),
        v22,
        v21,
        v23))
  {
    v50 = *MEMORY[0x24BEBB360];
    -[UILabel font](self->_label, "font");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel text](self->_label, "text");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "boundingRectWithSize:options:attributes:context:", 1, v25, 0, v19, 1.79769313e308);
    v27 = y;
    v29 = v28;

    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 4);
    v30 = ceil(v29);
    y = v27;
    v54.origin.x = x;
    v54.origin.y = v27;
    v54.size.width = width;
    v54.size.height = height;
    if (v30 >= CGRectGetHeight(v54))
    {
      v30 = height;
      v32 = v27;
    }
    else
    {
      -[CNFRegTableLabel _topPadding](self, "_topPadding");
      v32 = v31;
    }

    v33 = x;
    v34 = width;
  }
  else
  {
    v33 = x;
    x = *MEMORY[0x24BDBF090];
    v32 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v34 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v30 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  -[UILabel setFrame:](self->_label, "setFrame:", x, v32, v34, v30);
  urlButton = self->_urlButton;
  if (urlButton)
  {
    v47 = y;
    v48 = width;
    rect = height;
    -[CNFRegLearnMoreButton sizeToFit](urlButton, "sizeToFit");
    v36 = -[CNFRegTableLabel _labelTextAlignment](self, "_labelTextAlignment");
    -[CNFRegLearnMoreButton bounds](self->_urlButton, "bounds");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v55.origin.x = x;
    v55.origin.y = v32;
    v55.size.width = v34;
    v55.size.height = v30;
    v43 = CGRectGetMaxY(v55) + 5.0;
    if (v36 == 2)
    {
      v57.origin.x = v33;
      v57.origin.y = v47;
      v57.size.width = v48;
      v57.size.height = rect;
      MaxX = CGRectGetMaxX(v57);
      v58.origin.x = v38;
      v58.origin.y = v43;
      v58.size.width = v40;
      v58.size.height = v42;
      MinX = MaxX - CGRectGetWidth(v58);
    }
    else if (v36 == 1)
    {
      v59.origin.x = v33;
      v59.origin.y = v47;
      v59.size.width = v48;
      v59.size.height = rect;
      MidX = CGRectGetMidX(v59);
      v60.origin.x = v38;
      v60.origin.y = v43;
      v60.size.width = v40;
      v60.size.height = v42;
      MinX = MidX + CGRectGetWidth(v60) * -0.5;
    }
    else
    {
      if (v36)
      {
LABEL_16:
        -[CNFRegLearnMoreButton setFrame:](self->_urlButton, "setFrame:", v38, v43, v40, v42);
        return;
      }
      v56.origin.x = v33;
      v56.origin.y = v47;
      v56.size.width = v48;
      v56.size.height = rect;
      MinX = CGRectGetMinX(v56);
    }
    v38 = floor(MinX);
    goto LABEL_16;
  }
}

- (id)_labelText
{
  return 0;
}

- (int64_t)_labelTextAlignment
{
  return 4;
}

- (id)_URLText
{
  return 0;
}

- (id)_URLTarget
{
  return 0;
}

- (void)_urlTapped:(id)a3
{
  void *v3;
  void *v4;

  -[CNFRegTableLabel _URLTarget](self, "_URLTarget", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "openURL:withCompletionHandler:", v3, 0);
    v3 = v4;
  }

}

- (void)updateLabelText
{
  void *v3;
  CNFRegLearnMoreButton *urlButton;
  uint64_t v5;
  void *v6;
  CNFRegLearnMoreButton *v7;
  CNFRegLearnMoreButton *v8;
  CNFRegLearnMoreButton *v9;
  id v10;

  -[CNFRegTableLabel _labelText](self, "_labelText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_label, "setText:", v3);

  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", -[CNFRegTableLabel _labelTextAlignment](self, "_labelTextAlignment"));
  -[CNFRegLearnMoreButton removeTarget:action:forControlEvents:](self->_urlButton, "removeTarget:action:forControlEvents:", self, sel__urlTapped_, 64);
  -[CNFRegLearnMoreButton removeFromSuperview](self->_urlButton, "removeFromSuperview");
  urlButton = self->_urlButton;
  self->_urlButton = 0;

  -[CNFRegTableLabel _URLText](self, "_URLText");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFRegTableLabel _URLTarget](self, "_URLTarget");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v10 && v5)
  {
    -[CNFRegTableLabel setURLText:](self, "setURLText:", v10);
    -[CNFRegTableLabel setURLTarget:](self, "setURLTarget:", v6);
    v7 = [CNFRegLearnMoreButton alloc];
    v8 = -[CNFRegLearnMoreButton initWithFrame:style:text:](v7, "initWithFrame:style:text:", 1, v10, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v9 = self->_urlButton;
    self->_urlButton = v8;

    -[CNFRegLearnMoreButton addTarget:action:forControlEvents:](self->_urlButton, "addTarget:action:forControlEvents:", self, sel__urlTapped_, 64);
    -[CNFRegTableLabel addSubview:](self, "addSubview:", self->_urlButton);
  }
  else
  {
    -[CNFRegTableLabel setURLText:](self, "setURLText:", 0);
    -[CNFRegTableLabel setURLTarget:](self, "setURLTarget:", 0);
  }
  -[CNFRegTableLabel setNeedsLayout](self, "setNeedsLayout");

}

- (double)preferredHeightForWidth:(double)a3
{
  double v4;
  uint64_t v5;
  UITableView *cnfreg_tableView;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CNFRegLearnMoreButton *urlButton;
  double v27;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  if (a3 == 0.0)
    v4 = 320.0;
  else
    v4 = a3;
  v5 = MEMORY[0x24BDBF148];
  cnfreg_tableView = self->_cnfreg_tableView;
  v7 = 0.0;
  if (cnfreg_tableView)
  {
    -[UITableView _backgroundInset](cnfreg_tableView, "_backgroundInset");
    v7 = v8;
  }
  v9 = *(double *)(v5 + 8);
  -[CNFRegTableLabel _labelInset](self, "_labelInset");
  v11 = v7 + v10;
  v12 = v11 + v11;
  v13 = v4 + v11 * -2.0;
  if (v4 >= v12)
    v14 = v13;
  else
    v14 = 0.0;
  -[UILabel text](self->_label, "text");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[UILabel text](self->_label, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      v29 = *MEMORY[0x24BEBB360];
      -[UILabel font](self->_label, "font");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[UILabel text](self->_label, "text");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "boundingRectWithSize:options:attributes:context:", 1, v20, 0, v14, 1.79769313e308);
      v9 = v22;

    }
  }
  if (v9 > 0.0)
  {
    -[CNFRegTableLabel _topPadding](self, "_topPadding");
    v24 = v9 + v23;
    -[CNFRegTableLabel _bottomPadding](self, "_bottomPadding");
    v9 = v24 + v25;
  }
  urlButton = self->_urlButton;
  if (urlButton)
  {
    -[CNFRegLearnMoreButton sizeToFit](urlButton, "sizeToFit");
    -[CNFRegLearnMoreButton sizeThatFits:](self->_urlButton, "sizeThatFits:", v4, 1.79769313e308);
    v9 = v9 + v27 + 5.0;
  }
  return ceil(v9);
}

- (UITableView)cnfreg_tableView
{
  return self->_cnfreg_tableView;
}

- (void)setCnfreg_tableView:(id)a3
{
  self->_cnfreg_tableView = (UITableView *)a3;
}

- (BOOL)isTopmostHeader
{
  return self->_isTopmostHeader;
}

- (void)setIsTopmostHeader:(BOOL)a3
{
  self->_isTopmostHeader = a3;
}

- (NSString)URLText
{
  return self->_URLText;
}

- (void)setURLText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSURL)URLTarget
{
  return self->_URLTarget;
}

- (void)setURLTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLTarget, 0);
  objc_storeStrong((id *)&self->_URLText, 0);
  objc_storeStrong((id *)&self->_urlButton, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
