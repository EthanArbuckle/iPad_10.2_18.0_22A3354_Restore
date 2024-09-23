@implementation SetupView

- (SetupView)initWithFrame:(CGRect)a3
{
  SetupView *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *setupSteps;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SetupView;
  v3 = -[SetupView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SetupView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[SetupView setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    setupSteps = v3->_setupSteps;
    v3->_setupSteps = v5;

    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_layoutDirection = objc_msgSend(v7, "userInterfaceLayoutDirection");

  }
  return v3;
}

- (id)_preferenceLabelWithText:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BEBD708];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  PreferencesTableViewFooterFont();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v9);

  objc_msgSend(v6, "setLineBreakMode:", 0);
  objc_msgSend(v6, "setNumberOfLines:", 0);
  objc_msgSend(v6, "setText:", v4);

  return v6;
}

- (void)setTitle:(id)a3
{
  id v4;
  UILabel *title;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  title = self->_title;
  v11 = v4;
  if (title)
  {
    -[UILabel removeFromSuperview](title, "removeFromSuperview");
    v6 = self->_title;
    self->_title = 0;

    v4 = v11;
  }
  if (v4)
  {
    -[SetupView _preferenceLabelWithText:](self, "_preferenceLabelWithText:", v11);
    v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v8 = self->_title;
    self->_title = v7;

    PreferencesTableViewHeaderFont();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_title, "setFont:", v9);

    PreferencesTableViewHeaderColor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_title, "setTextColor:", v10);

    -[SetupView addSubview:](self, "addSubview:", self->_title);
    v4 = v11;
  }

}

- (id)title
{
  return -[UILabel text](self->_title, "text");
}

- (void)setIcon:(id)a3
{
  id v4;
  UIImageView *icon;
  UIImageView *v6;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  id v11;

  v4 = a3;
  icon = self->_icon;
  v11 = v4;
  if (icon)
  {
    -[UIImageView removeFromSuperview](icon, "removeFromSuperview");
    v6 = self->_icon;
    self->_icon = 0;

    v4 = v11;
  }
  if (v4)
  {
    v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v11);
    v8 = self->_icon;
    self->_icon = v7;

    -[UIImageView setContentMode:](self->_icon, "setContentMode:", 4);
    v9 = self->_icon;
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v9, "setTintColor:", v10);

    -[SetupView addSubview:](self, "addSubview:", self->_icon);
    v4 = v11;
  }

}

- (id)icon
{
  return -[UIImageView image](self->_icon, "image");
}

- (void)addStep:(id)a3
{
  void *v4;
  NSMutableArray *setupSteps;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x24BDD17C8];
  setupSteps = self->_setupSteps;
  v6 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("STEP_%lu"), -[NSMutableArray count](setupSteps, "count") + 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v13, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SetupView _preferenceLabelWithText:](self, "_preferenceLabelWithText:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SetupView _preferenceLabelWithText:](self, "_preferenceLabelWithText:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_layoutDirection == 1)
    objc_msgSend(v10, "setTextAlignment:", 2);
  v11 = self->_setupSteps;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v9, v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v12);

  -[SetupView addSubview:](self, "addSubview:", v9);
  -[SetupView addSubview:](self, "addSubview:", v10);

}

- (CGSize)sizeThatFits:(CGSize)a3 shouldSetSize:(BOOL)a4
{
  double width;
  SetupView *v5;
  double v6;
  double v7;
  double v8;
  int64_t layoutDirection;
  double x;
  double y;
  double v12;
  double height;
  UIImageView *icon;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  UILabel *title;
  uint64_t *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  SetupView *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  BOOL v63;
  double v64;
  double v65;
  double v66;
  double v67;
  float v68;
  float v69;
  uint64_t v70;
  double v71;
  double v72;
  uint64_t v73;
  double v74;
  int64_t v75;
  _BOOL4 v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  _QWORD v84[3];
  CGSize result;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v76 = a4;
  width = a3.width;
  v5 = self;
  v84[1] = *MEMORY[0x24BDAC8D0];
  -[UIImageView frame](self->_icon, "frame", a3.width, a3.height);
  if (width >= v6 + 20.0 + 15.0)
  {
    layoutDirection = v5->_layoutDirection;
    v86.size.height = 1.79769313e308;
    v86.origin.x = 5.0;
    v86.origin.y = 0.0;
    v71 = width;
    v86.size.width = width;
    v87 = CGRectInset(v86, 10.0, 5.0);
    x = v87.origin.x;
    y = v87.origin.y;
    v12 = v87.size.width;
    height = v87.size.height;
    icon = v5->_icon;
    if (icon)
    {
      -[UIImageView frame](icon, "frame");
      v16 = v15;
      v17 = x;
      if (layoutDirection == 1)
      {
        -[UIImageView frame](v5->_icon, "frame");
        v17 = v12 - v18;
      }
      if (v76)
      {
        v88.size.width = 40.0;
        v88.origin.x = v17;
        v88.origin.y = y;
        v88.size.height = v16;
        v89 = CGRectIntegral(v88);
        -[UIImageView setFrame:](v5->_icon, "setFrame:", v89.origin.x, v89.origin.y, v89.size.width, v89.size.height);
      }
      if (layoutDirection != 1)
        x = v17 + 40.0 + 15.0;
      v12 = v12 + -40.0 + -15.0;
    }
    title = v5->_title;
    v20 = (uint64_t *)MEMORY[0x24BEBB360];
    v21 = 0x24BDBC000uLL;
    if (title)
    {
      -[UILabel text](title, "text");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = *v20;
      -[UILabel font](v5->_title, "font");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, &v83, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "boundingRectWithSize:options:attributes:context:", 1, v24, 0, v12, height);
      v26 = v25;
      v28 = v27;

      if (v76)
      {
        v29 = v12 - v26;
        if (layoutDirection != 1)
          v29 = x;
        v30 = y;
        v31 = v26;
        v32 = v28;
        v90 = CGRectIntegral(*(CGRect *)&v29);
        -[UILabel setFrame:](v5->_title, "setFrame:", v90.origin.x, v90.origin.y, v90.size.width, v90.size.height);
      }
      y = y + v28 + 5.0;
      height = height - v28 + -5.0;
    }
    if (-[NSMutableArray count](v5->_setupSteps, "count", 432))
    {
      v72 = x;
      v75 = layoutDirection;
      v33 = 0;
      v34 = *v20;
      v35 = 1;
      v74 = v12;
      v73 = *v20;
      do
      {
        v36 = v5;
        -[NSMutableArray objectAtIndex:](v5->_setupSteps, "objectAtIndex:", v33);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndex:", 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectAtIndex:", 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "text");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v34;
        objc_msgSend(v38, "font");
        v41 = v34;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v42;
        objc_msgSend(*(id *)(v21 + 3696), "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v43 = v21;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "boundingRectWithSize:options:attributes:context:", 0, v44, 0, v12, height);
        v46 = v45;
        v48 = v47;

        if (v75 == 1)
        {
          v49 = v12 - v46;
          objc_msgSend(v39, "text");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v41;
          objc_msgSend(v39, "font");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = v51;
          objc_msgSend(*(id *)(v43 + 3696), "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "boundingRectWithSize:options:attributes:context:", 1, v52, 0, v12 - v46 + -10.0, height);
          v54 = v53;
          v56 = v55;

          v57 = v49 - v54 + -5.0;
        }
        else
        {
          v49 = v72;
          v57 = v72 + v46 + 5.0;
          objc_msgSend(v39, "text");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v41;
          objc_msgSend(v39, "font");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v59;
          objc_msgSend(*(id *)(v43 + 3696), "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "boundingRectWithSize:options:attributes:context:", 1, v60, 0, v12 - v46 + -5.0, height);
          v54 = v61;
          v56 = v62;

        }
        v5 = v36;
        if (v76)
        {
          v91.origin.x = v49;
          v91.origin.y = y;
          v91.size.width = v46;
          v91.size.height = v48;
          v92 = CGRectIntegral(v91);
          objc_msgSend(v38, "setFrame:", v92.origin.x, v92.origin.y, v92.size.width, v92.size.height);
          v93.origin.x = v57;
          v93.origin.y = y;
          v93.size.width = v54;
          v93.size.height = v56;
          v94 = CGRectIntegral(v93);
          objc_msgSend(v39, "setFrame:", v94.origin.x, v94.origin.y, v94.size.width, v94.size.height);
        }
        y = y + v56 + 5.0;
        height = height - v56 + -5.0;

        v33 = v35;
        v63 = -[NSMutableArray count](v36->_setupSteps, "count") > (unint64_t)v35++;
        v12 = v74;
        v21 = 0x24BDBC000;
        v34 = v73;
      }
      while (v63);
    }
    objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v70), "frame");
    v65 = v64;
    objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v70), "frame");
    if (y >= v65 + v66)
      v67 = y;
    else
      v67 = v65 + v66;
    v68 = v71;
    v7 = ceilf(v68);
    v69 = v67 + 5.0;
    v8 = ceilf(v69);
  }
  else
  {
    v7 = *MEMORY[0x24BDBF148];
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SetupView sizeThatFits:shouldSetSize:](self, "sizeThatFits:shouldSetSize:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SetupView;
  -[SetupView layoutSubviews](&v5, sel_layoutSubviews);
  -[SetupView bounds](self, "bounds");
  -[SetupView sizeThatFits:shouldSetSize:](self, "sizeThatFits:shouldSetSize:", 1, v3, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_setupSteps, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
