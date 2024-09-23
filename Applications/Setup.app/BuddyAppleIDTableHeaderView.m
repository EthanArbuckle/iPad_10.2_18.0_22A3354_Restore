@implementation BuddyAppleIDTableHeaderView

+ (void)initialize
{
  id v3;
  uint64_t v4;

  v3 = (id)objc_opt_class(BuddyAppleIDTableHeaderView);
  if (a1 == v3)
  {
    if ((BFFIsiPad(v3, v4) & 1) != 0)
    {
      qword_1002EEB10 = 15.0;
      qword_1002EEB18 = 0;
    }
    else
    {
      qword_1002EEB10 = -1.0;
      qword_1002EEB18 = -1.0;
    }
  }
}

+ (id)defaultTitleTextAttributes
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EEB28;
  location = 0;
  objc_storeStrong(&location, &stru_100283618);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EEB20;
}

+ (id)defaultDetailTextAttributes
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EEB38;
  location = 0;
  objc_storeStrong(&location, &stru_100283638);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EEB30;
}

- (BuddyAppleIDTableHeaderView)initWithFrame:(CGRect)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  UIFont *v10;
  char *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BuddyAppleIDTableHeaderView *v19;
  double v21;
  objc_super v22;
  SEL v23;
  id location;
  CGRect v25;

  v25 = a3;
  v23 = a2;
  location = 0;
  v22.receiver = self;
  v22.super_class = (Class)BuddyAppleIDTableHeaderView;
  location = -[BuddyAppleIDTableHeaderView initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v4 = (void *)*((_QWORD *)location + 4);
    *((_QWORD *)location + 4) = v3;

    objc_msgSend(*((id *)location + 4), "setNumberOfLines:", 0);
    v5 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    objc_msgSend(v5, "applyThemeToTitleLabel:", *((_QWORD *)location + 4));

    objc_msgSend(location, "addSubview:", *((_QWORD *)location + 4));
    v6 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v7 = (void *)*((_QWORD *)location + 5);
    *((_QWORD *)location + 5) = v6;

    objc_msgSend(*((id *)location + 5), "setNumberOfLines:", 0);
    v8 = +[UIColor _labelColor](UIColor, "_labelColor");
    objc_msgSend(*((id *)location + 5), "setTextColor:", v8);

    v9 = +[UIColor _systemBackgroundColor](UIColor, "_systemBackgroundColor");
    objc_msgSend(*((id *)location + 5), "setBackgroundColor:", v9);

    v10 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
    objc_msgSend(*((id *)location + 5), "setFont:", v10);

    objc_msgSend(*((id *)location + 5), "setTextAlignment:", 1);
    objc_msgSend(location, "addSubview:", *((_QWORD *)location + 5));
    *((double *)location + 6) = -1.0;
    v11 = (char *)location + 80;
    *((_QWORD *)location + 10) = *(_QWORD *)&CGSizeZero.width;
    *((_QWORD *)v11 + 1) = *(_QWORD *)&CGSizeZero.height;
    if (sub_10012A424())
    {
      v21 = sub_100147434();
      objc_msgSend(location, "setLayoutMargins:", v21, v12, v13, v14);
    }
    else
    {
      v15 = sub_100147434();
      objc_msgSend(location, "setLayoutMargins:", v15, v16, v17, v18, *(_QWORD *)&v15, *(_QWORD *)&v16, *(_QWORD *)&v17, *(_QWORD *)&v18, *(_QWORD *)&v15, *(_QWORD *)&v16, *(_QWORD *)&v17, *(_QWORD *)&v18);
    }
  }
  v19 = (BuddyAppleIDTableHeaderView *)location;
  objc_storeStrong(&location, 0);
  return v19;
}

- (double)bottomPadding
{
  double v2;

  -[BuddyAppleIDTableHeaderView layoutMargins](self, "layoutMargins");
  return v2;
}

- (void)setBottomPadding:(double)a3
{
  double v3;
  double v4;
  double v5;

  -[BuddyAppleIDTableHeaderView layoutMargins](self, "layoutMargins");
  -[BuddyAppleIDTableHeaderView setLayoutMargins:](self, "setLayoutMargins:", v3, v4, a3, v5, *(_QWORD *)&v3, *(_QWORD *)&v4, *(_QWORD *)&a3, *(_QWORD *)&v5, *(_QWORD *)&v3, *(_QWORD *)&v4, *(_QWORD *)&a3, *(_QWORD *)&v5, *(_QWORD *)&v3, *(_QWORD *)&v4, *(_QWORD *)&a3, *(_QWORD *)&v5);
}

- (double)leftPadding
{
  double v2;

  -[BuddyAppleIDTableHeaderView layoutMargins](self, "layoutMargins");
  return v2;
}

- (void)setLeftPadding:(double)a3
{
  double v3;
  double v4;
  double v5;

  -[BuddyAppleIDTableHeaderView layoutMargins](self, "layoutMargins");
  -[BuddyAppleIDTableHeaderView setLayoutMargins:](self, "setLayoutMargins:", v3, a3, v4, v5, *(_QWORD *)&v3, *(_QWORD *)&a3, *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&v3, *(_QWORD *)&a3, *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&v3, *(_QWORD *)&a3, *(_QWORD *)&v4, *(_QWORD *)&v5);
}

- (double)rightPadding
{
  double v2;

  -[BuddyAppleIDTableHeaderView layoutMargins](self, "layoutMargins");
  return v2;
}

- (void)setRightPadding:(double)a3
{
  double v3;
  double v4;
  double v5;

  -[BuddyAppleIDTableHeaderView layoutMargins](self, "layoutMargins");
  -[BuddyAppleIDTableHeaderView setLayoutMargins:](self, "setLayoutMargins:", v3, v4, v5, a3, *(_QWORD *)&v3, *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&a3, *(_QWORD *)&v3, *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&a3, *(_QWORD *)&v3, *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&a3);
}

- (NSString)linkButtonTitle
{
  return -[UIButton titleForState:](self->_linkButton, "titleForState:", 0, a2, self);
}

- (void)setLinkButtonTitle:(id)a3
{
  UIButton *v3;
  UIButton *linkButton;
  UIFont *v5;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  id location[2];
  BuddyAppleIDTableHeaderView *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0] && !v10->_linkButton)
  {
    v3 = +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
    linkButton = v10->_linkButton;
    v10->_linkButton = v3;

    v5 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
    v6 = -[UIButton titleLabel](v10->_linkButton, "titleLabel");
    -[UILabel setFont:](v6, "setFont:", v5);

    v7 = -[UIButton titleLabel](v10->_linkButton, "titleLabel");
    -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 0);

    v8 = -[UIButton titleLabel](v10->_linkButton, "titleLabel");
    -[UILabel setTextAlignment:](v8, "setTextAlignment:", 1);

    -[BuddyAppleIDTableHeaderView addSubview:](v10, "addSubview:", v10->_linkButton);
  }
  -[UIButton setTitle:forState:](v10->_linkButton, "setTitle:forState:", location[0], 0);
  -[BuddyAppleIDTableHeaderView setNeedsLayout](v10, "setNeedsLayout");
  objc_storeStrong(location, 0);
}

- (void)setTopIconName:(id)a3
{
  NSString *v3;
  NSString *topIconName;
  id v5;
  id v6;
  BuddyRoundedRectImageView *v7;
  BuddyRoundedRectImageView *iconView;
  char v9;
  UIImage *v10;
  id v11;
  int v12;
  id location[2];
  BuddyAppleIDTableHeaderView *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v14->_topIconName == location[0])
  {
    v12 = 1;
  }
  else
  {
    v3 = (NSString *)objc_msgSend(location[0], "copy");
    topIconName = v14->_topIconName;
    v14->_topIconName = v3;

    if (!-[NSString length](v14->_topIconName, "length") || v14->_iconView)
    {
      if (-[NSString length](v14->_topIconName, "length") || !v14->_iconView)
      {
        if (v14->_iconView)
        {
          v9 = 0;
          if (-[NSString length](v14->_topIconName, "length"))
          {
            v10 = +[UIImage imageNamed:](UIImage, "imageNamed:", v14->_topIconName);
            v9 = 1;
          }
          -[BuddyRoundedRectImageView setImage:](v14->_iconView, "setImage:");
          if ((v9 & 1) != 0)

        }
      }
      else
      {
        -[BuddyRoundedRectImageView removeFromSuperview](v14->_iconView, "removeFromSuperview");
        objc_storeStrong((id *)&v14->_iconView, 0);
        -[BuddyAppleIDTableHeaderView setNeedsLayout](v14, "setNeedsLayout");
      }
    }
    else
    {
      v11 = +[UIImage imageNamed:](UIImage, "imageNamed:", v14->_topIconName);
      if (v14->_topIconTintColor)
      {
        v5 = objc_msgSend(v11, "_flatImageWithColor:", v14->_topIconTintColor);
        v6 = v11;
        v11 = v5;

      }
      v7 = -[BuddyRoundedRectImageView initWithImage:]([BuddyRoundedRectImageView alloc], "initWithImage:", v11);
      iconView = v14->_iconView;
      v14->_iconView = v7;

      -[BuddyRoundedRectImageView setContentMode:](v14->_iconView, "setContentMode:", 1);
      -[BuddyAppleIDTableHeaderView addSubview:](v14, "addSubview:", v14->_iconView);
      -[BuddyAppleIDTableHeaderView setNeedsLayout](v14, "setNeedsLayout");
      objc_storeStrong(&v11, 0);
    }
    -[BuddyRoundedRectImageView setUsesMask:](v14->_iconView, "setUsesMask:", v14->_topIconHasRoundedCorners);
    v12 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)setTopIconHasRoundedCorners:(BOOL)a3
{
  if (self->_topIconHasRoundedCorners != a3)
  {
    self->_topIconHasRoundedCorners = a3;
    if (self->_iconView)
      -[BuddyRoundedRectImageView setUsesMask:](self->_iconView, "setUsesMask:", self->_topIconHasRoundedCorners);
  }
}

- (void)_getHeight:(double *)a3 forWidth:(double)a4 shouldLayoutViews:(BOOL)a5
{
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  UIFontMetrics *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CGPoint origin;
  UILabel *v22;
  UILabel *v23;
  uint64_t v24;
  uint64_t v25;
  CGFloat v26;
  CGFloat v27;
  id v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  char v35;
  double v36;
  float v37;
  CGFloat linkButtonTopPadding;
  UIButton *linkButton;
  char v40;
  double v41;
  id v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  float v49;
  double MaxY;
  char v51;
  BOOL v52;
  double v53;
  double v54;
  double v55;
  NSString *v56;
  NSUInteger v57;
  UILabel *textLabel;
  double v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  float v64;
  double v65;
  double v66;
  id v67;
  double v68;
  UILabel *detailTextLabel;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  float v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  CGRect v93;
  char v94;
  UIScreen *v95;
  double v96;
  CGRect __b;
  CGFloat v98;
  CGPoint v99;
  CGSize v100;
  CGPoint v101;
  CGSize v102;
  double v103;
  uint64_t v104;
  double v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  CGFloat v110;
  CGFloat v111;
  CGPoint v112;
  CGSize size;
  __int128 v114;
  __int128 v115;
  id location;
  double v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  uint64_t v122;
  double v123;
  uint64_t v124;
  uint64_t v125;
  double v126;
  BOOL v127;
  double v128;
  double *v129;
  SEL v130;
  BuddyAppleIDTableHeaderView *v131;
  CGRect v132;

  v131 = self;
  v130 = a2;
  v129 = a3;
  v128 = a4;
  v127 = a5;
  -[BuddyAppleIDTableHeaderView layoutMargins](self, "layoutMargins");
  v122 = v6;
  v123 = v7;
  v124 = v8;
  v125 = v9;
  v10 = a4 - v7;
  -[BuddyAppleIDTableHeaderView layoutMargins](v131, "layoutMargins");
  v118 = v11;
  v119 = v12;
  v120 = v13;
  v121 = v14;
  v126 = v10 - v14;
  v117 = 0.0;
  v15 = +[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleBody);
  location = v15;
  if (v131->_linkButton)
  {
    v17 = sub_100148618();
    *((_QWORD *)&v114 + 1) = v18;
    *(double *)&v114 = v17;
    *((_QWORD *)&v115 + 1) = v19;
    *(_QWORD *)&v115 = v20;
    size = (CGSize)0;
    v112 = (CGPoint)0;
    origin = CGRectZero.origin;
    size = CGRectZero.size;
    v112 = origin;
    v22 = -[UIButton titleLabel](v131->_linkButton, "titleLabel");
    v23 = -[UIButton titleLabel](v131->_linkButton, "titleLabel");
    -[UILabel textRectForBounds:limitedToNumberOfLines:](v22, "textRectForBounds:limitedToNumberOfLines:", -[UILabel numberOfLines](v23, "numberOfLines"), v114, v115);
    v109 = v24;
    v108 = v25;
    v111 = v26;
    v110 = v27;
    size.width = v27;
    size.height = v26;

    v28 = -[BuddyAppleIDTableHeaderView layoutMargins](v131, "layoutMargins");
    v104 = v29;
    v105 = v30;
    v106 = v31;
    v107 = v32;
    v33 = v30 + (v126 - size.width) / 2.0;
    v35 = BFFIsiPad(v28, v34);
    v36 = 1.0;
    if ((v35 & 1) == 0)
      v36 = 0.0;
    v37 = v33 - v36;
    v112.x = floorf(v37);
    v103 = 0.0;
    if (v131->_linkButtonTopPadding < 0.0)
      linkButtonTopPadding = 10.0;
    else
      linkButtonTopPadding = v131->_linkButtonTopPadding;
    v103 = linkButtonTopPadding;
    v112.y = linkButtonTopPadding;
    v132.size.height = size.height;
    v132.size.width = size.width;
    v132.origin.y = linkButtonTopPadding;
    v132.origin.x = v112.x;
    v117 = CGRectGetMaxY(v132) - v103;
    if (v127)
    {
      v102 = size;
      v101 = v112;
      linkButton = v131->_linkButton;
      v100 = size;
      v99 = v112;
      v15 = (UIFontMetrics *)-[UIButton setFrame:](linkButton, "setFrame:", v112, size);
    }
  }
  v98 = 0.0;
  v40 = BFFIsiPad(v15, v16);
  v41 = 56.0;
  if ((v40 & 1) == 0)
    v41 = 33.5;
  v42 = objc_msgSend(location, "scaledValueForValue:", v41);
  v98 = BFFRoundToPixel(v42, v117 + v43);
  memset(&__b, 0, sizeof(__b));
  __b.origin.x = CGRectZero.origin.x;
  __b.origin.y = CGRectZero.origin.y;
  __b.size = CGRectZero.size;
  if (v131->_iconView)
  {
    if (sub_100148670(v131->_iconSize.width, v131->_iconSize.height, CGSizeZero.width, CGSizeZero.height))
    {
      -[BuddyRoundedRectImageView sizeToFit](v131->_iconView, "sizeToFit");
      -[BuddyRoundedRectImageView frame](v131->_iconView, "frame");
    }
    else
    {
      v44 = sub_100148618();
    }
    __b.origin.x = v44;
    __b.origin.y = v45;
    __b.size.width = v46;
    __b.size.height = v47;
    -[BuddyAppleIDTableHeaderView layoutMargins](v131, "layoutMargins");
    v49 = v48 + (v126 - __b.size.width) / 2.0;
    __b.origin.x = floorf(v49);
    __b.origin.y = v98;
    if (v127)
      -[BuddyRoundedRectImageView setFrame:](v131->_iconView, "setFrame:", __b.origin.x, __b.origin.y, __b.size.width, __b.size.height);
  }
  v94 = 0;
  if (v131->_iconView)
  {
    MaxY = CGRectGetMaxY(__b);
    v51 = BFFIsiPhone();
    v52 = 0;
    if ((v51 & 1) != 0)
    {
      v95 = +[UIScreen mainScreen](UIScreen, "mainScreen");
      v94 = 1;
      -[UIScreen bounds](v95, "bounds");
      v52 = v53 <= 480.0;
    }
    v54 = 10.0;
    if (!v52)
      v54 = 15.0;
    v55 = MaxY + v54;
  }
  else
  {
    v55 = v98;
  }
  if ((v94 & 1) != 0)

  v96 = v55;
  v56 = -[UILabel text](v131->_textLabel, "text");
  v57 = -[NSString length](v56, "length");

  if (v57)
  {
    textLabel = v131->_textLabel;
    sub_100146A7C();
    -[UILabel sizeThatFits:](textLabel, "sizeThatFits:", v59, v60);
    v93.size.width = v61;
    v93.size.height = v62;
    -[BuddyAppleIDTableHeaderView layoutMargins](v131, "layoutMargins");
    v64 = v63 + (v126 - v93.size.width) / 2.0;
    v93.origin.x = floorf(v64);
    -[UILabel _firstBaselineOffsetFromTop](v131->_textLabel, "_firstBaselineOffsetFromTop");
    v93.origin.y = v55 - v65;
    if (v127)
      -[UILabel setFrame:](v131->_textLabel, "setFrame:", v93.origin.x, v93.origin.y, v93.size.width, v93.size.height);
    v66 = CGRectGetMaxY(v93);
    v67 = objc_msgSend(location, "scaledValueForValue:", 32.0);
    v96 = BFFRoundToPixel(v67, v66 + v68);
  }
  detailTextLabel = v131->_detailTextLabel;
  sub_100146A7C();
  -[UILabel sizeThatFits:](detailTextLabel, "sizeThatFits:", v70, v71);
  v91 = v72;
  v92 = v73;
  -[BuddyAppleIDTableHeaderView layoutMargins](v131, "layoutMargins");
  v75 = v74 + (v126 - v91) / 2.0;
  v89 = floorf(v75);
  -[UILabel _firstBaselineOffsetFromTop](v131->_detailTextLabel, "_firstBaselineOffsetFromTop");
  v90 = v96 - v76;
  if (v127)
    -[UILabel setFrame:](v131->_detailTextLabel, "setFrame:", v89, v90, v91, v92);
  if (v129)
  {
    -[BuddyAppleIDTableHeaderView layoutMargins](v131, "layoutMargins");
    v78 = v92;
    if (v77 < 0.0)
    {
      v84 = v91;
      v85 = v90;
      v86 = v89;
      v87 = CGRectGetMaxY(*(CGRect *)(&v78 - 3));
      objc_msgSend(location, "scaledValueForValue:", 16.0);
      *v129 = v87 + v88;
    }
    else
    {
      v79 = v91;
      v80 = v90;
      v81 = v89;
      v82 = CGRectGetMaxY(*(CGRect *)(&v78 - 3));
      -[BuddyAppleIDTableHeaderView layoutMargins](v131, "layoutMargins");
      *v129 = v82 + v83;
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;

  -[BuddyAppleIDTableHeaderView bounds](self, "bounds");
  -[BuddyAppleIDTableHeaderView _getHeight:forWidth:shouldLayoutViews:](self, "_getHeight:forWidth:shouldLayoutViews:", 0, 1, v5, v3, v4, *(_QWORD *)&v5, v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UIScreen *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double calculatedHeight;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double width;
  CGSize result;

  width = a3.width;
  if (a3.width == 0.0)
  {
    v3 = +[UIScreen mainScreen](UIScreen, "mainScreen");
    -[UIScreen bounds](v3, "bounds");
    v11 = v4;
    v10 = v5;
    v13 = v6;
    v12 = v7;
    width = v7;

  }
  -[BuddyAppleIDTableHeaderView _getHeight:forWidth:shouldLayoutViews:](self, "_getHeight:forWidth:shouldLayoutViews:", &self->_calculatedHeight, 0, width, v10, v11, *(_QWORD *)&v12, v13, a2);
  calculatedHeight = self->_calculatedHeight;
  v8 = width;
  result.height = calculatedHeight;
  result.width = v8;
  return result;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (double)linkButtonTopPadding
{
  return self->_linkButtonTopPadding;
}

- (void)setLinkButtonTopPadding:(double)a3
{
  self->_linkButtonTopPadding = a3;
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  height = self->_iconSize.height;
  width = self->_iconSize.width;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (UIButton)linkButton
{
  return self->_linkButton;
}

- (NSString)topIconName
{
  return self->_topIconName;
}

- (BOOL)topIconHasRoundedCorners
{
  return self->_topIconHasRoundedCorners;
}

- (UIColor)topIconTintColor
{
  return self->_topIconTintColor;
}

- (void)setTopIconTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_topIconTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topIconTintColor, 0);
  objc_storeStrong((id *)&self->_topIconName, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
