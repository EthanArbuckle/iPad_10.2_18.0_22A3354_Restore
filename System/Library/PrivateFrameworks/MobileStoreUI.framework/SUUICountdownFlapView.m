@implementation SUUICountdownFlapView

- (SUUICountdownFlapView)initWithPosition:(int64_t)a3 flapTopColor:(id)a4 flapBottomColor:(id)a5
{
  id v9;
  id v10;
  SUUICountdownFlapView *v11;
  SUUICountdownFlapView *v12;
  uint64_t v13;
  UILabel *labelTop;
  UIView *v15;
  UIView *backgroundViewTop;
  uint64_t v17;
  UILabel *labelBot;
  UIView *v19;
  UIView *backgroundViewBot;
  uint64_t v21;
  UILabel *labelTransitionTop;
  UIImageView *v23;
  UIImageView *backgroundViewTransitionTop;
  void *v25;
  uint64_t v26;
  UILabel *labelTransitionBot;
  UIImageView *v28;
  UIImageView *backgroundViewTransitionBot;
  void *v30;
  objc_super v32;

  v9 = a4;
  v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)SUUICountdownFlapView;
  v11 = -[SUUICountdownFlapView init](&v32, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_factor = 0.0;
    v11->_position = a3;
    objc_storeStrong((id *)&v11->_flapTopColor, a4);
    objc_storeStrong((id *)&v12->_flapBottomColor, a5);
    v13 = -[SUUICountdownFlapView _newLabel](v12, "_newLabel");
    labelTop = v12->_labelTop;
    v12->_labelTop = (UILabel *)v13;

    v15 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    backgroundViewTop = v12->_backgroundViewTop;
    v12->_backgroundViewTop = v15;

    -[SUUICountdownFlapView addSubview:](v12, "addSubview:", v12->_backgroundViewTop);
    -[UIView addSubview:](v12->_backgroundViewTop, "addSubview:", v12->_labelTop);
    -[UIView setClipsToBounds:](v12->_backgroundViewTop, "setClipsToBounds:", 1);
    v17 = -[SUUICountdownFlapView _newLabel](v12, "_newLabel");
    labelBot = v12->_labelBot;
    v12->_labelBot = (UILabel *)v17;

    v19 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    backgroundViewBot = v12->_backgroundViewBot;
    v12->_backgroundViewBot = v19;

    -[SUUICountdownFlapView addSubview:](v12, "addSubview:", v12->_backgroundViewBot);
    -[UIView addSubview:](v12->_backgroundViewBot, "addSubview:", v12->_labelBot);
    -[UIView setClipsToBounds:](v12->_backgroundViewBot, "setClipsToBounds:", 1);
    v21 = -[SUUICountdownFlapView _newLabel](v12, "_newLabel");
    labelTransitionTop = v12->_labelTransitionTop;
    v12->_labelTransitionTop = (UILabel *)v21;

    v23 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    backgroundViewTransitionTop = v12->_backgroundViewTransitionTop;
    v12->_backgroundViewTransitionTop = v23;

    -[UIImageView addSubview:](v12->_backgroundViewTransitionTop, "addSubview:", v12->_labelTransitionTop);
    -[UIImageView setHidden:](v12->_backgroundViewTransitionTop, "setHidden:", 1);
    -[UIImageView setClipsToBounds:](v12->_backgroundViewTransitionTop, "setClipsToBounds:", 1);
    -[UIImageView layer](v12->_backgroundViewTransitionTop, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setZPosition:", 100.0);

    -[SUUICountdownFlapView addSubview:](v12, "addSubview:", v12->_backgroundViewTransitionTop);
    v26 = -[SUUICountdownFlapView _newLabel](v12, "_newLabel");
    labelTransitionBot = v12->_labelTransitionBot;
    v12->_labelTransitionBot = (UILabel *)v26;

    v28 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    backgroundViewTransitionBot = v12->_backgroundViewTransitionBot;
    v12->_backgroundViewTransitionBot = v28;

    -[UIImageView addSubview:](v12->_backgroundViewTransitionBot, "addSubview:", v12->_labelTransitionBot);
    -[UIImageView setHidden:](v12->_backgroundViewTransitionBot, "setHidden:", 1);
    -[UIImageView setClipsToBounds:](v12->_backgroundViewTransitionBot, "setClipsToBounds:", 1);
    -[UIImageView layer](v12->_backgroundViewTransitionBot, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setZPosition:", 100.0);

    -[SUUICountdownFlapView addSubview:](v12, "addSubview:", v12->_backgroundViewTransitionBot);
  }

  return v12;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t position;
  double factor;
  float v13;
  float v14;
  float v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;

  -[SUUICountdownFlapView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v3;
  position = self->_position;
  if (position)
  {
    if (position != 2)
    {
      factor = self->_factor;
      v16 = 0.0;
      goto LABEL_7;
    }
    factor = self->_factor;
    v13 = factor + factor;
    v14 = -roundf(v13);
  }
  else
  {
    factor = self->_factor;
    v15 = factor + factor;
    v14 = roundf(v15);
  }
  v16 = v14;
LABEL_7:
  v17 = v3 * 0.5;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  *(float *)&v19 = factor * v19;
  v20 = roundf(*(float *)&v19);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scale");
  v23 = v17 - v20 / v22;

  -[UIView setFrame:](self->_backgroundViewTop, "setFrame:", v5, v7, v9, v23);
  v24 = v5 + v16;
  -[UILabel setFrame:](self->_labelTop, "setFrame:", v5 + v16, v7, v9, v10);
  v25 = self->_factor;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "scale");
  *(float *)&v27 = v25 * v27;
  v28 = roundf(*(float *)&v27);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "scale");
  v31 = v17 - v28 / v30;

  v32 = self->_factor;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "scale");
  *(float *)&v34 = v32 * v34;
  v35 = roundf(*(float *)&v34);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "scale");
  v38 = v17 + v35 / v37;

  -[UIView setFrame:](self->_backgroundViewBot, "setFrame:", v5, v38, v9, v31);
  v39 = self->_factor;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "scale");
  *(float *)&v41 = v39 * v41;
  v42 = roundf(*(float *)&v41);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "scale");
  v45 = v7 - (v17 + v42 / v44);

  -[UILabel setFrame:](self->_labelBot, "setFrame:", v24, v45, v9, v10);
  v46 = self->_factor;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "scale");
  *(float *)&v48 = v46 * v48;
  v49 = roundf(*(float *)&v48);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "scale");
  v52 = v17 - v49 / v51;

  -[UIImageView setFrame:](self->_backgroundViewTransitionTop, "setFrame:", v5, v7, v9, v52);
  -[UILabel setFrame:](self->_labelTransitionTop, "setFrame:", v24, v7, v9, v10);
  v53 = self->_factor;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "scale");
  *(float *)&v55 = v53 * v55;
  v56 = roundf(*(float *)&v55);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "scale");
  v59 = v17 - v56 / v58;

  v60 = self->_factor;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "scale");
  *(float *)&v62 = v60 * v62;
  v63 = roundf(*(float *)&v62);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "scale");
  v66 = v17 + v63 / v65;

  -[UIImageView setFrame:](self->_backgroundViewTransitionBot, "setFrame:", v5, v66, v9, v59);
  v67 = self->_factor;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "scale");
  *(float *)&v69 = v67 * v69;
  v70 = roundf(*(float *)&v69);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "scale");
  v73 = v7 - (v17 + v70 / v72);

  -[UILabel setFrame:](self->_labelTransitionBot, "setFrame:", v24, v73, v9, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  float width;
  double v4;
  int64_t position;
  double v6;
  float v7;
  double v8;
  float height;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = roundf(width);
  position = self->_position;
  switch(position)
  {
    case 0:
      goto LABEL_4;
    case 3:
      v6 = 4.0;
      goto LABEL_6;
    case 2:
LABEL_4:
      v6 = 2.0;
LABEL_6:
      v4 = v4 + v4 / 14.0 * v6;
      break;
  }
  v7 = v4;
  v8 = roundf(v7);
  height = a3.height;
  v10 = roundf(height);
  result.height = v10;
  result.width = v8;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double width;
  double factor;
  int64_t position;
  UIImageView *backgroundViewTransitionTop;
  id v8;
  UIImageView *backgroundViewTransitionBot;
  id v10;
  id v11;
  float v12;
  void *v13;
  UILabel *labelBot;
  UILabel *labelTransitionBot;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _QWORD v26[4];
  _BYTE v27[128];
  uint64_t v28;

  width = a3.size.width;
  v28 = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)SUUICountdownFlapView;
  -[SUUICountdownFlapView setFrame:](&v25, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  factor = self->_factor;
  position = self->_position;
  switch(position)
  {
    case 0:
      goto LABEL_4;
    case 3:
      width = width * 14.0 / 18.0;
      break;
    case 2:
LABEL_4:
      width = width * 14.0 * 0.0625;
      break;
  }
  self->_factor = width / 14.0;
  if (width / 14.0 != factor && width / 14.0 != 0.0)
  {
    backgroundViewTransitionTop = self->_backgroundViewTransitionTop;
    v8 = -[SUUICountdownFlapView _newBackgroundImageForTop:](self, "_newBackgroundImageForTop:", 1);
    -[UIImageView setImage:](backgroundViewTransitionTop, "setImage:", v8);

    backgroundViewTransitionBot = self->_backgroundViewTransitionBot;
    v10 = -[SUUICountdownFlapView _newBackgroundImageForTop:](self, "_newBackgroundImageForTop:", 0);
    -[UIImageView setImage:](backgroundViewTransitionBot, "setImage:", v10);

    v11 = -[SUUICountdownFlapView _newBackgroundImageForTop:](self, "_newBackgroundImageForTop:", 0xFFFFFFFFLL);
    -[SUUICountdownFlapView setImage:](self, "setImage:", v11);

    v12 = self->_factor * 24.0;
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithName:size:", CFSTR("HelveticaNeue-CondensedBold"), roundf(v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    labelBot = self->_labelBot;
    v26[0] = self->_labelTop;
    v26[1] = labelBot;
    labelTransitionBot = self->_labelTransitionBot;
    v26[2] = self->_labelTransitionTop;
    v26[3] = labelTransitionBot;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "setFont:", v13);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v18);
    }

    -[SUUICountdownFlapView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setString:(id)a3
{
  id v5;
  NSString **p_string;
  NSString *string;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  _BYTE v20[136];

  v5 = a3;
  p_string = &self->_string;
  string = self->_string;
  if (!string)
  {
    objc_storeStrong((id *)&self->_string, a3);
    -[UILabel setText:](self->_labelTop, "setText:", *p_string);
    -[UILabel setText:](self->_labelBot, "setText:", *p_string);
    string = *p_string;
  }
  if ((objc_msgSend(v5, "isEqualToString:", string) & 1) == 0)
  {
    v8 = *p_string;
    objc_storeStrong((id *)&self->_string, a3);
    -[UIImageView layer](self->_backgroundViewTransitionTop, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllAnimations");

    -[UIImageView layer](self->_backgroundViewTransitionBot, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllAnimations");

    -[UILabel setText:](self->_labelTop, "setText:", *p_string);
    -[UILabel setText:](self->_labelBot, "setText:", v8);
    -[UILabel setText:](self->_labelTransitionTop, "setText:", v8);
    -[UILabel setText:](self->_labelTransitionBot, "setText:", *p_string);
    -[UIImageView setHidden:](self->_backgroundViewTransitionTop, "setHidden:", 0);
    -[UIImageView setHidden:](self->_backgroundViewTransitionBot, "setHidden:", 1);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 11; ++i)
    {
      v14 = (void *)MEMORY[0x24BDD1968];
      -[SUUICountdownFlapView _transformForAngle:isTop:](self, "_transformForAngle:isTop:", 1, (float)((float)i / 10.0) * 3.14159265 * 0.5);
      objc_msgSend(v14, "valueWithCATransform3D:", v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);

      *(float *)&v16 = (float)i / 10.0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v17);

    }
    v18 = objc_alloc_init(MEMORY[0x24BDE56C0]);
    objc_msgSend(v18, "setKeyPath:", CFSTR("transform"));
    objc_msgSend(v18, "setValues:", v11);
    objc_msgSend(v18, "setKeyTimes:", v12);
    objc_msgSend(v18, "setRemovedOnCompletion:", 0);
    objc_msgSend(v18, "setFillMode:", *MEMORY[0x24BDE5978]);
    objc_msgSend(v18, "setDuration:", 0.200000003);
    objc_msgSend(v18, "setDelegate:", self);
    -[UIImageView layer](self->_backgroundViewTransitionTop, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAnimation:forKey:", v18, CFSTR("top"));

  }
}

- (void)setTextColor:(id)a3
{
  UIColor *v5;
  UIColor **p_textColor;
  UILabel *labelTop;
  void *v8;
  UILabel *labelBot;
  void *v10;
  UILabel *labelTransitionTop;
  void *v12;
  UILabel *labelTransitionBot;
  void *v14;
  UIColor *v15;

  v5 = (UIColor *)a3;
  p_textColor = &self->_textColor;
  if (self->_textColor != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_textColor, a3);
    labelTop = self->_labelTop;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](self->_labelTop, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](labelTop, "setTextColor:", v8);

    }
    labelBot = self->_labelBot;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](self->_labelBot, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](labelBot, "setTextColor:", v10);

    }
    labelTransitionTop = self->_labelTransitionTop;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](self->_labelTransitionTop, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](labelTransitionTop, "setTextColor:", v12);

    }
    labelTransitionBot = self->_labelTransitionBot;
    if (*p_textColor)
    {
      -[UILabel setTextColor:](labelTransitionBot, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](labelTransitionBot, "setTextColor:", v14);

    }
    v5 = v15;
  }

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;

  v5 = a3;
  -[UIImageView layer](self->_backgroundViewTransitionTop, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationForKey:", CFSTR("top"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    -[UIImageView setHidden:](self->_backgroundViewTransitionTop, "setHidden:", 1);
    -[UIImageView setHidden:](self->_backgroundViewTransitionBot, "setHidden:", 0);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 11; ++i)
    {
      v11 = (void *)MEMORY[0x24BDD1968];
      -[SUUICountdownFlapView _transformForAngle:isTop:](self, "_transformForAngle:isTop:", 0, (float)(1.0 - (float)((float)i / 10.0)) * 3.14159265 * 0.5);
      objc_msgSend(v11, "valueWithCATransform3D:", &v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v12);

      *(float *)&v13 = (float)i / 10.0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v14);

    }
    v15 = objc_alloc_init(MEMORY[0x24BDE56C0]);
    objc_msgSend(v15, "setKeyPath:", CFSTR("transform"));
    objc_msgSend(v15, "setValues:", v8);
    objc_msgSend(v15, "setKeyTimes:", v9);
    objc_msgSend(v15, "setRemovedOnCompletion:", 0);
    objc_msgSend(v15, "setFillMode:", *MEMORY[0x24BDE5978]);
    objc_msgSend(v15, "setDuration:", 0.200000003);
    objc_msgSend(v15, "setDelegate:", self);
    -[UIImageView layer](self->_backgroundViewTransitionBot, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAnimation:forKey:", v15, CFSTR("bot"));

  }
  else
  {
    -[UILabel setText:](self->_labelBot, "setText:", self->_string);
    -[UIImageView setHidden:](self->_backgroundViewTransitionTop, "setHidden:", 1);
    -[UIImageView setHidden:](self->_backgroundViewTransitionBot, "setHidden:", 1);
  }

}

- (id)_newLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BEBD708]);
  v4 = v3;
  if (self->_textColor)
  {
    objc_msgSend(v3, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v5);

  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  objc_msgSend(v4, "setTextAlignment:", 1);
  return v4;
}

- (id)_newBackgroundImageForTop:(int)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double factor;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  CGFloat v31;
  CGContext *CurrentContext;
  double v33;
  float v34;
  CGFloat v35;
  float v36;
  CGFloat v37;
  int64_t position;
  float v40;
  CGFloat v41;
  float v42;
  CGFloat v43;
  CGColorSpace *DeviceRGB;
  UIColor *flapTopColor;
  void *v46;
  CGColorRef v47;
  UIColor *flapBottomColor;
  void *v49;
  CGColorRef v50;
  const __CFArray *v51;
  CGGradient *v52;
  void *v53;
  const void *v55[2];
  CGFloat locations[3];
  uint64_t v57;
  CGSize v58;
  CGPoint v59;
  CGPoint v60;

  v57 = *MEMORY[0x24BDAC8D0];
  -[SUUICountdownFlapView frame](self, "frame");
  v7 = v6;
  v8 = v5;
  if (a3 == 1)
  {
    factor = self->_factor;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scale");
    *(float *)&v25 = factor * v25;
    v26 = roundf(*(float *)&v25);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scale");
    v15 = v8 * 0.5 - v26 / v28;

  }
  else
  {
    if (!a3)
    {
      v9 = self->_factor;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scale");
      *(float *)&v11 = v9 * v11;
      v12 = roundf(*(float *)&v11);
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scale");
      v15 = v8 * 0.5 - v12 / v14;

      v16 = self->_factor;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scale");
      *(float *)&v18 = v16 * v18;
      v19 = roundf(*(float *)&v18);
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scale");
      v22 = v8 * -0.5 - v19 / v21;

      goto LABEL_7;
    }
    v15 = v5;
  }
  v22 = 0.0;
LABEL_7:
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "scale");
  v31 = v30;
  v58.width = v7;
  v58.height = v15;
  UIGraphicsBeginImageContextWithOptions(v58, 0, v31);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, v7 * 0.5 + 0.0, v22);
  v33 = v7 + 0.0;
  if ((self->_position & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v34 = self->_factor * 5.0;
    v35 = roundf(v34);
    CGContextAddArc(CurrentContext, v33 - v35, v22 + v35, v35, 4.71238898, 6.28318531, 0);
    v36 = self->_factor * 5.0;
    v37 = roundf(v36);
    CGContextAddArc(CurrentContext, v33 - v37, v8 + v22 - v37, v37, 0.0, 1.57079633, 0);
  }
  else
  {
    CGContextAddLineToPoint(CurrentContext, v33, v22);
    CGContextAddLineToPoint(CurrentContext, v33, v8 + v22);
  }
  position = self->_position;
  if (position == 3 || position == 0)
  {
    v40 = self->_factor * 5.0;
    v41 = roundf(v40);
    CGContextAddArc(CurrentContext, v41 + 0.0, v8 + v22 - v41, v41, 1.57079633, 3.14159265, 0);
    v42 = self->_factor * 5.0;
    v43 = roundf(v42);
    CGContextAddArc(CurrentContext, v43 + 0.0, v22 + v43, v43, 3.14159265, 4.71238898, 0);
  }
  else
  {
    CGContextAddLineToPoint(CurrentContext, 0.0, v8 + v22);
    CGContextAddLineToPoint(CurrentContext, 0.0, v22);
  }
  CGContextClosePath(CurrentContext);
  CGContextClip(CurrentContext);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)locations = xmmword_241EFBBB0;
  flapTopColor = self->_flapTopColor;
  v46 = flapTopColor;
  if (!flapTopColor)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47 = CGColorRetain((CGColorRef)objc_msgSend(objc_retainAutorelease(v46), "CGColor"));
  if (!flapTopColor)

  flapBottomColor = self->_flapBottomColor;
  v49 = flapBottomColor;
  if (!flapBottomColor)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.4, 1.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v50 = CGColorRetain((CGColorRef)objc_msgSend(objc_retainAutorelease(v49), "CGColor"));
  if (!flapBottomColor)

  v55[0] = v47;
  v55[1] = v50;
  v51 = CFArrayCreate(0, v55, 2, MEMORY[0x24BDBD690]);
  v52 = CGGradientCreateWithColors(DeviceRGB, v51, locations);
  v60.y = v8 + v22;
  v59.x = 0.0;
  v60.x = 0.0;
  v59.y = v22;
  CGContextDrawLinearGradient(CurrentContext, v52, v59, v60, 0);
  CGColorRelease(v47);
  CGColorRelease(v50);
  CGGradientRelease(v52);
  CFRelease(v51);
  CGColorSpaceRelease(DeviceRGB);
  UIGraphicsGetImageFromCurrentImageContext();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v53;
}

- (CATransform3D)_transformForAngle:(SEL)a3 isTop:(double)a4
{
  double v9;
  double v10;
  double v11;
  double v12;
  double factor;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 *v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CATransform3D *result;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  CATransform3D v58;
  CATransform3D v59;

  -[SUUICountdownFlapView frame](self, "frame");
  v10 = v9;
  v12 = v11;
  if (a5)
  {
    factor = self->_factor;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    *(float *)&v15 = factor * v15;
    v16 = roundf(*(float *)&v15);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = v12 * 0.25 - v16 / v18 * 0.25;
    v20 = v10;
  }
  else
  {
    v20 = v9 * 3.0;
    v21 = self->_factor;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    *(float *)&v22 = v21 * v22;
    v23 = roundf(*(float *)&v22);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = v12 * 3.0 * 0.25 + v23 / v24 * 3.0 * 0.25;
  }

  v25 = (__int128 *)MEMORY[0x24BDE5598];
  v26 = v20 * 0.25;
  v27 = v12 * 0.5;
  v28 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v29 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v30 = v10 * 0.5;
  *(_OWORD *)&retstr->m31 = v28;
  *(_OWORD *)&retstr->m33 = v29;
  v31 = v25[6];
  v32 = v25[7];
  *(_OWORD *)&retstr->m41 = v31;
  *(_OWORD *)&retstr->m43 = v32;
  v33 = *v25;
  v34 = v25[1];
  *(_OWORD *)&retstr->m11 = *v25;
  *(_OWORD *)&retstr->m13 = v34;
  v35 = v25[2];
  v36 = v25[3];
  *(_OWORD *)&retstr->m21 = v35;
  *(_OWORD *)&retstr->m23 = v36;
  *(_OWORD *)&v58.m31 = v28;
  *(_OWORD *)&v58.m33 = v29;
  *(_OWORD *)&v58.m41 = v31;
  *(_OWORD *)&v58.m43 = v32;
  *(_OWORD *)&v58.m11 = v33;
  *(_OWORD *)&v58.m13 = v34;
  *(_OWORD *)&v58.m21 = v35;
  *(_OWORD *)&v58.m23 = v36;
  CATransform3DTranslate(&v59, &v58, v30 - v26, v27 - v19, 0.0);
  v37 = *(_OWORD *)&v59.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v59.m31;
  *(_OWORD *)&retstr->m33 = v37;
  v38 = *(_OWORD *)&v59.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v59.m41;
  *(_OWORD *)&retstr->m43 = v38;
  v39 = *(_OWORD *)&v59.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v59.m11;
  *(_OWORD *)&retstr->m13 = v39;
  v40 = *(_OWORD *)&v59.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v59.m21;
  *(_OWORD *)&retstr->m23 = v40;
  v41 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v58.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v58.m33 = v41;
  v42 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v58.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v58.m43 = v42;
  v43 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v58.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v58.m13 = v43;
  v44 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v58.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v58.m23 = v44;
  CATransform3DRotate(&v59, &v58, a4, 1.0, 0.0, 0.0);
  v45 = *(_OWORD *)&v59.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v59.m31;
  *(_OWORD *)&retstr->m33 = v45;
  v46 = *(_OWORD *)&v59.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v59.m41;
  *(_OWORD *)&retstr->m43 = v46;
  v47 = *(_OWORD *)&v59.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v59.m11;
  *(_OWORD *)&retstr->m13 = v47;
  v48 = *(_OWORD *)&v59.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v59.m21;
  *(_OWORD *)&retstr->m23 = v48;
  v49 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v58.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v58.m33 = v49;
  v50 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v58.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v58.m43 = v50;
  v51 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v58.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v58.m13 = v51;
  v52 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v58.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v58.m23 = v52;
  result = CATransform3DTranslate(&v59, &v58, v26 - v30, v19 - v27, 0.0);
  v54 = *(_OWORD *)&v59.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v59.m31;
  *(_OWORD *)&retstr->m33 = v54;
  v55 = *(_OWORD *)&v59.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v59.m41;
  *(_OWORD *)&retstr->m43 = v55;
  v56 = *(_OWORD *)&v59.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v59.m11;
  *(_OWORD *)&retstr->m13 = v56;
  v57 = *(_OWORD *)&v59.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v59.m21;
  *(_OWORD *)&retstr->m23 = v57;
  return result;
}

- (NSString)string
{
  return self->_string;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)flapTopColor
{
  return self->_flapTopColor;
}

- (UIColor)flapBottomColor
{
  return self->_flapBottomColor;
}

- (int64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_labelTransitionTop, 0);
  objc_storeStrong((id *)&self->_labelTransitionBot, 0);
  objc_storeStrong((id *)&self->_labelTop, 0);
  objc_storeStrong((id *)&self->_labelBot, 0);
  objc_storeStrong((id *)&self->_flapBottomColor, 0);
  objc_storeStrong((id *)&self->_flapTopColor, 0);
  objc_storeStrong((id *)&self->_backgroundViewTransitionTop, 0);
  objc_storeStrong((id *)&self->_backgroundViewTransitionBot, 0);
  objc_storeStrong((id *)&self->_backgroundViewTop, 0);
  objc_storeStrong((id *)&self->_backgroundViewBot, 0);
}

@end
