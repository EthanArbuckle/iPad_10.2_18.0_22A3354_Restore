@implementation MRUNowPlayingLabelView

- (MRUNowPlayingLabelView)initWithFrame:(CGRect)a3
{
  MRUNowPlayingLabelView *v3;
  UIView *v4;
  UIView *contentView;
  void *v6;
  MPRouteLabel *v7;
  MPRouteLabel *routeLabel;
  UILabel *v9;
  UILabel *heightSizingLabel;
  MRUMarqueeLabel *v11;
  MRUMarqueeLabel *titleMarqueeView;
  MRUMarqueeLabel *v13;
  MRUMarqueeLabel *subtitleMarqueeView;
  MRUMarqueeLabel *v15;
  MRUMarqueeLabel *placeholderMarqueeView;
  UIImageView *v17;
  UIImageView *deviceImageView;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MRUNowPlayingLabelView;
  v3 = -[MRUNowPlayingLabelView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v3->_contentView;
    v3->_contentView = v4;

    -[UIView layer](v3->_contentView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

    -[UIView setUserInteractionEnabled:](v3->_contentView, "setUserInteractionEnabled:", 0);
    -[MRUNowPlayingLabelView addSubview:](v3, "addSubview:", v3->_contentView);
    v7 = (MPRouteLabel *)objc_alloc_init(MEMORY[0x1E0CC24F8]);
    routeLabel = v3->_routeLabel;
    v3->_routeLabel = v7;

    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_routeLabel);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    heightSizingLabel = v3->_heightSizingLabel;
    v3->_heightSizingLabel = v9;

    -[UILabel setSizingRule:](v3->_heightSizingLabel, "setSizingRule:", 1);
    v11 = objc_alloc_init(MRUMarqueeLabel);
    titleMarqueeView = v3->_titleMarqueeView;
    v3->_titleMarqueeView = v11;

    -[MRUMarqueeLabel setContentGap:](v3->_titleMarqueeView, "setContentGap:", 26.0);
    -[MRUMarqueeLabel setAnimationReferenceView:](v3->_titleMarqueeView, "setAnimationReferenceView:", v3);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_titleMarqueeView);
    v13 = objc_alloc_init(MRUMarqueeLabel);
    subtitleMarqueeView = v3->_subtitleMarqueeView;
    v3->_subtitleMarqueeView = v13;

    -[MRUMarqueeLabel setContentGap:](v3->_subtitleMarqueeView, "setContentGap:", 26.0);
    -[MRUMarqueeLabel addCoordinatedMarqueeView:](v3->_subtitleMarqueeView, "addCoordinatedMarqueeView:", v3->_titleMarqueeView);
    -[MRUMarqueeLabel setAnimationReferenceView:](v3->_subtitleMarqueeView, "setAnimationReferenceView:", v3);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_subtitleMarqueeView);
    v15 = objc_alloc_init(MRUMarqueeLabel);
    placeholderMarqueeView = v3->_placeholderMarqueeView;
    v3->_placeholderMarqueeView = v15;

    -[MRUMarqueeLabel setContentGap:](v3->_placeholderMarqueeView, "setContentGap:", 26.0);
    -[MRUMarqueeLabel setAnimationReferenceView:](v3->_placeholderMarqueeView, "setAnimationReferenceView:", v3);
    -[MRUMarqueeLabel setWantsContentAwareTypesettingLanguage:](v3->_placeholderMarqueeView, "setWantsContentAwareTypesettingLanguage:", 1);
    -[MRUMarqueeLabel setSizingRule:](v3->_placeholderMarqueeView, "setSizingRule:", 1);
    -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_placeholderMarqueeView);
    v17 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    deviceImageView = v3->_deviceImageView;
    v3->_deviceImageView = v17;

    -[MRUNowPlayingLabelView addSubview:](v3, "addSubview:", v3->_deviceImageView);
    v3->_contentScale = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v3, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v3, sel_updateVisualStyling, *MEMORY[0x1E0DC4508], 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v3, sel_updateVisualStyling, *MEMORY[0x1E0DC45B8], 0);
    v3->_showRoute = 1;
    v3->_showSubtitle = 1;
    v3->_adjustsLabelsWhenHighlighted = 1;
    v3->_disablesLabelsLayoutAnimation = 1;
    -[MRUNowPlayingLabelView setMarqueeFadeEdgeInsets:](v3, "setMarqueeFadeEdgeInsets:", 0.0, 3.0, 0.0, 3.0);
    -[MRUNowPlayingLabelView updateContentSizeCategory](v3, "updateContentSizeCategory");
    -[MRUNowPlayingLabelView updateVisibility](v3, "updateVisibility");

  }
  return v3;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUNowPlayingLabelView;
  -[MRUNowPlayingLabelView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[MRUNowPlayingLabelView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[MRUNowPlayingLabelView setMarqueeEnabled:](self, "setMarqueeEnabled:", 0);
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
  void *v11;
  uint64_t v12;
  uint64_t v13;
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
  int64_t layout;
  double v25;
  NSUInteger v26;
  _BOOL4 v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  MRUMarqueeLabel *subtitleMarqueeView;
  double v38;
  double v39;
  NSUInteger v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
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
  double v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  double v79;
  double v80;
  double v81;
  double v82;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  CGFloat MinY;
  double v89;
  CGFloat v90;
  double v91;
  double v92;
  double v93;
  double v94;
  CGFloat v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  CGFloat v109;
  CGFloat v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  double v115;
  double rect;
  double recta;
  double rect_8;
  double rect_16;
  double rect_24;
  double v121;
  CGFloat v122;
  double v123;
  _QWORD v124[5];
  objc_super v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;

  v125.receiver = self;
  v125.super_class = (Class)MRUNowPlayingLabelView;
  -[MRUNowPlayingLabelView layoutSubviews](&v125, sel_layoutSubviews);
  -[MRUNowPlayingLabelView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUNowPlayingLabelView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", v8, v10);
  rect = v14;
  v16 = v15;
  -[MRUNowPlayingLabelView sizeForTextInLabel:availableSize:](self, "sizeForTextInLabel:availableSize:", self->_placeholderMarqueeView, v8, v10);
  rect_8 = v17;
  v121 = v18;
  -[MRUNowPlayingLabelView sizeForTextInLabel:availableSize:](self, "sizeForTextInLabel:availableSize:", self->_titleMarqueeView, v8, v10);
  v20 = v19;
  v22 = v21;
  -[MRUNowPlayingLabelView sizeForTextInLabel:availableSize:](self, "sizeForTextInLabel:availableSize:", self->_subtitleMarqueeView, v8, v10);
  v123 = v23;
  layout = self->_layout;
  rect_16 = v20;
  rect_24 = v25;
  if ((unint64_t)(layout - 4) >= 2)
  {
    v112 = v13;
    if (layout)
    {
      v40 = -[NSString length](self->_title, "length");
      v115 = v16;
      if (!self->_showPlaceholder && self->_showSubtitle)
        -[NSString length](self->_subtitle, "length");
      v114 = v22;
      v155.origin.x = v4;
      v155.origin.y = v6;
      v155.size.width = v8;
      v155.size.height = v10;
      CGRectGetHeight(v155);
      UIRoundToViewScale();
      UIRectInset();
      x = v156.origin.x;
      y = v156.origin.y;
      width = v156.size.width;
      height = v156.size.height;
      MinX = CGRectGetMinX(v156);
      v157.origin.x = x;
      v157.origin.y = y;
      v157.size.width = width;
      v157.size.height = height;
      MinY = CGRectGetMinY(v157);
      v158.origin.x = x;
      v158.origin.y = y;
      v158.size.width = width;
      v158.size.height = height;
      v89 = CGRectGetWidth(v158);
      if (rect >= v89)
        v90 = v89;
      else
        v90 = rect;
      if (self->_textAlignment == 1)
      {
        v111 = v112;
        UIRectCenteredXInRectScale();
        MinX = v91;
        MinY = v92;
        v90 = v93;
        v95 = v94;
      }
      else
      {
        v95 = v115;
      }
      -[MRUNowPlayingLabelView bounds](self, "bounds", v111);
      MPRectByApplyingUserInterfaceLayoutDirectionInRect();
      -[MPRouteLabel setFrame:](self->_routeLabel, "setFrame:");
      if (self->_showRoute)
      {
        v159.origin.x = MinX;
        v159.origin.y = MinY;
        v159.size.width = v90;
        v159.size.height = v95;
        CGRectGetHeight(v159);
        UIRectInset();
        x = v96;
        y = v97;
        width = v98;
        height = v99;
      }
      v160.origin.x = x;
      v160.origin.y = y;
      v160.size.width = width;
      v160.size.height = height;
      v100 = CGRectGetMinX(v160);
      v161.origin.x = x;
      v161.origin.y = y;
      v161.size.width = width;
      v161.size.height = height;
      v101 = CGRectGetMinY(v161);
      v162.origin.x = x;
      v162.origin.y = y;
      v162.size.width = width;
      v162.size.height = height;
      -[MRUMarqueeLabel setFrame:](self->_placeholderMarqueeView, "setFrame:", v100, v101, CGRectGetWidth(v162), v121);
      -[MRUMarqueeLabel setContentSize:](self->_placeholderMarqueeView, "setContentSize:", rect_8, v121);
      v163.origin.x = x;
      v163.origin.y = y;
      v163.size.width = width;
      v163.size.height = height;
      v102 = CGRectGetMinX(v163);
      v164.origin.x = x;
      v164.origin.y = y;
      v164.size.width = width;
      v164.size.height = height;
      v103 = CGRectGetMinY(v164);
      v165.origin.x = x;
      v165.origin.y = y;
      v165.size.width = width;
      v165.size.height = height;
      v104 = CGRectGetWidth(v165);
      -[MRUMarqueeLabel setFrame:](self->_titleMarqueeView, "setFrame:", v102, v103, v104, v114);
      -[MRUMarqueeLabel setContentSize:](self->_titleMarqueeView, "setContentSize:", rect_16, v114);
      if (v40)
      {
        v166.origin.x = v102;
        v166.origin.y = v103;
        v166.size.width = v104;
        v166.size.height = v114;
        CGRectGetHeight(v166);
        UIRectInset();
        x = v105;
        y = v106;
        width = v107;
        height = v108;
      }
      v167.origin.x = x;
      v167.origin.y = y;
      v167.size.width = width;
      v167.size.height = height;
      v109 = CGRectGetMinX(v167);
      v168.origin.x = x;
      v168.origin.y = y;
      v168.size.width = width;
      v168.size.height = height;
      v110 = CGRectGetMinY(v168);
      v169.origin.x = x;
      v169.origin.y = y;
      v169.size.width = width;
      v169.size.height = height;
      v36 = CGRectGetWidth(v169);
      subtitleMarqueeView = self->_subtitleMarqueeView;
      v38 = v109;
      v39 = v110;
    }
    else
    {
      v126.origin.x = v4;
      v126.origin.y = v6;
      v126.size.width = v8;
      v126.size.height = v10;
      CGRectGetMinY(v126);
      v127.origin.x = v4;
      v127.origin.y = v6;
      v127.size.width = v8;
      v127.size.height = v10;
      CGRectGetWidth(v127);
      UIRectCenteredXInRectScale();
      -[MPRouteLabel setFrame:](self->_routeLabel, "setFrame:", v13);
      v128.origin.x = v4;
      v128.origin.y = v6;
      v128.size.width = v8;
      v128.size.height = v10;
      recta = CGRectGetMinX(v128);
      v129.origin.x = v4;
      v129.origin.y = v6;
      v129.size.width = v8;
      v129.size.height = v10;
      v28 = CGRectGetMinY(v129);
      v130.origin.x = v4;
      v130.origin.y = v6;
      v130.size.width = v8;
      v130.size.height = v10;
      v29 = CGRectGetWidth(v130);
      -[MRUMarqueeLabel setFrame:](self->_titleMarqueeView, "setFrame:", recta, v28, v29, v22);
      -[MRUMarqueeLabel setContentSize:](self->_titleMarqueeView, "setContentSize:", v20, v22);
      v131.origin.x = v4;
      v131.origin.y = v6;
      v131.size.width = v8;
      v131.size.height = v10;
      CGRectGetMinX(v131);
      v132.origin.x = v4;
      v132.origin.y = v6;
      v132.size.width = v8;
      v132.size.height = v10;
      CGRectGetWidth(v132);
      UIRectCenteredYInRectScale();
      -[MRUMarqueeLabel setFrame:](self->_placeholderMarqueeView, "setFrame:", v112);
      -[MRUMarqueeLabel setContentSize:](self->_placeholderMarqueeView, "setContentSize:", rect_8, v121);
      v133.origin.x = recta;
      v133.origin.y = v28;
      v133.size.width = v29;
      v133.size.height = v22;
      CGRectGetHeight(v133);
      UIRectInset();
      v30 = v134.origin.x;
      v31 = v134.origin.y;
      v32 = v134.size.width;
      v33 = v134.size.height;
      v34 = CGRectGetMinX(v134);
      v135.origin.x = v30;
      v135.origin.y = v31;
      v135.size.width = v32;
      v135.size.height = v33;
      v35 = CGRectGetMinY(v135);
      v136.origin.x = v30;
      v136.origin.y = v31;
      v136.size.width = v32;
      v136.size.height = v33;
      v36 = CGRectGetWidth(v136);
      subtitleMarqueeView = self->_subtitleMarqueeView;
      v38 = v34;
      v39 = v35;
    }
    -[MRUMarqueeLabel setFrame:](subtitleMarqueeView, "setFrame:", v38, v39, v36, v123);
    -[MRUMarqueeLabel setContentSize:](self->_subtitleMarqueeView, "setContentSize:", rect_24, v123);
  }
  else
  {
    v26 = -[NSString length](self->_title, "length");
    v27 = self->_showSubtitle && -[NSString length](self->_subtitle, "length") != 0;
    v113 = v22;
    v41 = v121;
    v137.origin.x = v4;
    v137.origin.y = v6;
    v137.size.width = v8;
    v137.size.height = v10;
    CGRectGetHeight(v137);
    UIRoundToViewScale();
    UIRectInset();
    v42 = v138.origin.x;
    v43 = v138.origin.y;
    v44 = v138.size.width;
    v45 = v138.size.height;
    v46 = CGRectGetMinX(v138);
    v139.origin.x = v42;
    v139.origin.y = v43;
    v139.size.width = v44;
    v139.size.height = v45;
    v47 = CGRectGetMinY(v139);
    v140.origin.x = v42;
    v140.origin.y = v43;
    v140.size.width = v44;
    v140.size.height = v45;
    v48 = CGRectGetWidth(v140);
    if (self->_showRoute)
    {
      v49 = v121;
    }
    else
    {
      UIRectCenteredYInRect();
      v46 = v50;
      v47 = v51;
      v48 = v52;
    }
    v122 = v49;
    -[MRUMarqueeLabel setFrame:](self->_placeholderMarqueeView, "setFrame:", v46, v47, v48);
    -[MRUMarqueeLabel setContentSize:](self->_placeholderMarqueeView, "setContentSize:", rect_8, v41);
    if (self->_showPlaceholder)
    {
      v141.origin.x = v46;
      v141.origin.y = v47;
      v141.size.width = v48;
      v141.size.height = v122;
      CGRectGetHeight(v141);
      UIRectInset();
      v42 = v53;
      v43 = v54;
      v44 = v55;
      v45 = v56;
    }
    v142.origin.x = v42;
    v142.origin.y = v43;
    v142.size.width = v44;
    v142.size.height = v45;
    v57 = CGRectGetMinX(v142);
    v143.origin.x = v42;
    v143.origin.y = v43;
    v143.size.width = v44;
    v143.size.height = v45;
    v58 = CGRectGetMinY(v143);
    v144.origin.x = v42;
    v144.origin.y = v43;
    v144.size.width = v44;
    v144.size.height = v45;
    v59 = CGRectGetWidth(v144);
    -[MRUMarqueeLabel setFrame:](self->_titleMarqueeView, "setFrame:", v57, v58, v59, v113);
    -[MRUMarqueeLabel setContentSize:](self->_titleMarqueeView, "setContentSize:", rect_16, v113);
    if (v26)
    {
      v145.origin.x = v57;
      v145.origin.y = v58;
      v145.size.width = v59;
      v145.size.height = v113;
      CGRectGetHeight(v145);
      UIRectInset();
      v42 = v60;
      v43 = v61;
      v44 = v62;
      v45 = v63;
    }
    v146.origin.x = v42;
    v146.origin.y = v43;
    v146.size.width = v44;
    v146.size.height = v45;
    v64 = CGRectGetMinX(v146);
    v147.origin.x = v42;
    v147.origin.y = v43;
    v147.size.width = v44;
    v147.size.height = v45;
    v65 = CGRectGetMinY(v147);
    v148.origin.x = v42;
    v148.origin.y = v43;
    v148.size.width = v44;
    v148.size.height = v45;
    v66 = CGRectGetWidth(v148);
    -[MRUMarqueeLabel setFrame:](self->_subtitleMarqueeView, "setFrame:", v64, v65, v66, v123);
    -[MRUMarqueeLabel setContentSize:](self->_subtitleMarqueeView, "setContentSize:", rect_24, v123);
    if (v27)
    {
      v149.origin.x = v64;
      v149.origin.y = v65;
      v149.size.width = v66;
      v149.size.height = v123;
      CGRectGetHeight(v149);
      UIRectInset();
      v42 = v67;
      v43 = v68;
      v44 = v69;
      v45 = v70;
    }
    -[UIImageView sizeThatFits:](self->_deviceImageView, "sizeThatFits:", v44, v45);
    v150.origin.x = v42;
    v150.origin.y = v43;
    v150.size.width = v44;
    v150.size.height = v45;
    CGRectGetMinX(v150);
    UIRectCenteredYInRect();
    v72 = v71;
    v74 = v73;
    v76 = v75;
    v78 = v77;
    -[MRUNowPlayingLabelView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[UIImageView setFrame:](self->_deviceImageView, "setFrame:");
    if (self->_showDevice)
    {
      v151.origin.x = v72;
      v151.origin.y = v74;
      v151.size.width = v76;
      v151.size.height = v78;
      CGRectGetWidth(v151);
      UIRectInset();
      v42 = v79;
      v43 = v80;
      v44 = v81;
      v45 = v82;
    }
    v152.origin.x = v42;
    v152.origin.y = v43;
    v152.size.width = v44;
    v152.size.height = v45;
    CGRectGetMinX(v152);
    v153.origin.x = v42;
    v153.origin.y = v43;
    v153.size.width = v44;
    v153.size.height = v45;
    CGRectGetMinY(v153);
    v154.origin.x = v42;
    v154.origin.y = v43;
    v154.size.width = v44;
    v154.size.height = v45;
    CGRectGetWidth(v154);
    -[MRUNowPlayingLabelView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MPRouteLabel setFrame:](self->_routeLabel, "setFrame:");
  }
  if (self->_disablesLabelsLayoutAnimation)
  {
    v124[0] = MEMORY[0x1E0C809B0];
    v124[1] = 3221225472;
    v124[2] = __40__MRUNowPlayingLabelView_layoutSubviews__block_invoke;
    v124[3] = &unk_1E5818C88;
    v124[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v124);
  }
}

uint64_t __40__MRUNowPlayingLabelView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "layoutIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "layoutIfNeeded");
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[MPRouteLabel sizeThatFits:](self->_routeLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v4 = v3;
  -[MRUNowPlayingLabelView sizeForTextInLabel:availableSize:](self, "sizeForTextInLabel:availableSize:", self->_placeholderMarqueeView, 1.79769313e308, 1.79769313e308);
  v6 = v5;
  -[MRUNowPlayingLabelView sizeForTextInLabel:availableSize:](self, "sizeForTextInLabel:availableSize:", self->_titleMarqueeView, 1.79769313e308, 1.79769313e308);
  v8 = v7;
  -[MRUNowPlayingLabelView sizeForTextInLabel:availableSize:](self, "sizeForTextInLabel:availableSize:", self->_subtitleMarqueeView, 1.79769313e308, 1.79769313e308);
  -[MRUNowPlayingLabelView sizeThatFits:](self, "sizeThatFits:", fmax(fmax(fmax(v8, v9), v4), v6), 1.79769313e308);
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  if (self->_layout)
  {
    -[MPRouteLabel titleLabel](self->_routeLabel, "titleLabel", a3.width, a3.height);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lineHeight");

    -[MRUNowPlayingLabelView heightForTextInLabel:](self, "heightForTextInLabel:", self->_titleMarqueeView);
  }
  else
  {
    -[MRUNowPlayingLabelView heightForTextInLabel:](self, "heightForTextInLabel:", self->_titleMarqueeView, a3.width, a3.height);
  }
  -[MRUNowPlayingLabelView heightForTextInLabel:](self, "heightForTextInLabel:", self->_subtitleMarqueeView);
  UICeilToViewScale();
  v8 = v7;
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)sizeForTextInLabel:(id)a3 availableSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend(v7, "sizeThatFits:", width, height);
  if (v8 >= width)
    v9 = width;
  else
    v9 = v8;
  if (self->_layout >= 2uLL)
    v10 = v8;
  else
    v10 = v9;
  -[MRUNowPlayingLabelView heightForTextInLabel:](self, "heightForTextInLabel:", v7);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)heightForTextInLabel:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "text"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", &stru_1E581FBA8),
        v7,
        v6,
        !v8))
  {
    objc_msgSend(v4, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_heightSizingLabel, "setFont:", v12);

    objc_msgSend(v4, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_heightSizingLabel, "setText:", v13);

    -[UILabel sizeThatFits:](self->_heightSizingLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v11 = v14;
  }
  else
  {
    objc_msgSend(v4, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lineHeight");
    UICeilToViewScale();
    v11 = v10;

  }
  return v11;
}

- (double)intrinsicHeightForTextInLabel:(id)a3
{
  double v3;

  objc_msgSend(a3, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  return v3;
}

- (BOOL)isLabelOversized:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[MRUNowPlayingLabelView heightForTextInLabel:](self, "heightForTextInLabel:", v4);
  v6 = v5;
  -[MRUNowPlayingLabelView intrinsicHeightForTextInLabel:](self, "intrinsicHeightForTextInLabel:", v4);
  v8 = v7;

  return v6 > v8;
}

- (id)viewForFirstBaselineLayout
{
  void *v2;
  uint64_t v3;

  if (!self->_layout)
  {
    if (self->_showPlaceholder)
    {
      v3 = 584;
LABEL_7:
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v3), "viewForFirstBaselineLayout");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    }
LABEL_6:
    v3 = 568;
    goto LABEL_7;
  }
  if (!self->_showRoute)
    goto LABEL_6;
  -[MPRouteLabel titleLabel](self->_routeLabel, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  return v2;
}

- (void)setRoute:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_route, a3);
  v5 = a3;
  -[MPRouteLabel setRoute:](self->_routeLabel, "setRoute:", v5);

  -[MRUNowPlayingLabelView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MRUNowPlayingLabelView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  title = self->_title;
  self->_title = v5;

  -[MRUMarqueeLabel setText:](self->_titleMarqueeView, "setText:", v4);
  -[MRUNowPlayingLabelView updateFonts](self, "updateFonts");
  -[MRUNowPlayingLabelView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MRUNowPlayingLabelView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubtitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *subtitle;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v5;

  -[MRUMarqueeLabel setText:](self->_subtitleMarqueeView, "setText:", v4);
  -[MRUNowPlayingLabelView updateFonts](self, "updateFonts");
  -[MRUNowPlayingLabelView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MRUNowPlayingLabelView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPlaceholder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *placeholder;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  placeholder = self->_placeholder;
  self->_placeholder = v5;

  -[MRUMarqueeLabel setText:](self->_placeholderMarqueeView, "setText:", v4);
  -[MRUNowPlayingLabelView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[MRUNowPlayingLabelView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDeviceImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_deviceImage, a3);
  v5 = a3;
  -[UIImageView setImage:](self->_deviceImageView, "setImage:", v5);

  -[MRUNowPlayingLabelView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowRoute:(BOOL)a3
{
  if (self->_showRoute != a3)
  {
    self->_showRoute = a3;
    -[MRUNowPlayingLabelView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingLabelView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowSubtitle:(BOOL)a3
{
  if (self->_showSubtitle != a3)
  {
    self->_showSubtitle = a3;
    -[MRUNowPlayingLabelView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingLabelView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowPlaceholder:(BOOL)a3
{
  if (self->_showPlaceholder != a3)
  {
    self->_showPlaceholder = a3;
    -[MRUNowPlayingLabelView updateVisualStyling](self, "updateVisualStyling");
    -[MRUNowPlayingLabelView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingLabelView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowDevice:(BOOL)a3
{
  if (self->_showDevice != a3)
  {
    self->_showDevice = a3;
    -[MRUNowPlayingLabelView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingLabelView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMarqueeEnabled:(BOOL)a3
{
  if (self->_marqueeEnabled != a3)
  {
    self->_marqueeEnabled = a3;
    -[MRUNowPlayingLabelView updateMarquee](self, "updateMarquee");
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[MPRouteLabel setTextAlignment:](self->_routeLabel, "setTextAlignment:");
    -[MRUMarqueeLabel setTextAlignment:](self->_titleMarqueeView, "setTextAlignment:", a3);
    -[MRUMarqueeLabel setTextAlignment:](self->_subtitleMarqueeView, "setTextAlignment:", a3);
    -[MRUNowPlayingLabelView updatePlaceholderTextAlignment](self, "updatePlaceholderTextAlignment");
    -[MRUNowPlayingLabelView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUNowPlayingLabelView updateContentSizeCategory](self, "updateContentSizeCategory");
    -[MRUNowPlayingLabelView updateMarquee](self, "updateMarquee");
    -[MRUNowPlayingLabelView updateVisualStyling](self, "updateVisualStyling");
    -[MRUNowPlayingLabelView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingLabelView updatePlaceholderTextAlignment](self, "updatePlaceholderTextAlignment");
    -[MRUNowPlayingLabelView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMarqueeFadeEdgeInsets:(UIEdgeInsets)a3
{
  double v4;
  double v5;

  self->_marqueeFadeEdgeInsets = a3;
  v4 = fabs(a3.left);
  v5 = fabs(a3.right);
  -[MRUMarqueeLabel setFadeEdgeInsets:](self->_titleMarqueeView, "setFadeEdgeInsets:", 0.0, v4, 0.0, v5);
  -[MRUMarqueeLabel setFadeEdgeInsets:](self->_subtitleMarqueeView, "setFadeEdgeInsets:", 0.0, v4, 0.0, v5);
  -[MRUMarqueeLabel setFadeEdgeInsets:](self->_placeholderMarqueeView, "setFadeEdgeInsets:", 0.0, v4, 0.0, v5);
}

- (void)setMarqueeContentGap:(double)a3
{
  self->_marqueeContentGap = a3;
  -[MRUMarqueeLabel setContentGap:](self->_titleMarqueeView, "setContentGap:");
  -[MRUMarqueeLabel setContentGap:](self->_subtitleMarqueeView, "setContentGap:", a3);
  -[MRUMarqueeLabel setContentGap:](self->_placeholderMarqueeView, "setContentGap:", a3);
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUNowPlayingLabelView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUNowPlayingLabelView;
  -[MRUNowPlayingLabelView setHighlighted:](&v7, sel_setHighlighted_);
  if (self->_adjustsLabelsWhenHighlighted)
  {
    if (v3)
    {
      -[MRUNowPlayingLabelView contentView](self, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAlpha:", 0.2);

    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __41__MRUNowPlayingLabelView_setHighlighted___block_invoke;
      v6[3] = &unk_1E5818C88;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.25);
    }
  }
}

void __41__MRUNowPlayingLabelView_setHighlighted___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (double)estimatedHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double result;

  -[MRUMarqueeLabel font](self->_titleMarqueeView, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");

  -[MRUMarqueeLabel font](self->_subtitleMarqueeView, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");

  if (self->_layout)
  {
    -[MPRouteLabel titleLabel](self->_routeLabel, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lineHeight");

  }
  UICeilToViewScale();
  return result;
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUNowPlayingLabelView updateContentSizeCategory](self, "updateContentSizeCategory");
  }
}

- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3
{
  return 1;
}

- (BOOL)_increaseContrast
{
  return UIAccessibilityDarkerSystemColorsEnabled() || UIAccessibilityIsReduceTransparencyEnabled();
}

- (void)updateVisualStyling
{
  MRUVisualStylingProvider *stylingProvider;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  stylingProvider = self->_stylingProvider;
  if (self->_layout == 3)
  {
    if (self->_showPlaceholder)
    {
      if (-[MRUNowPlayingLabelView _increaseContrast](self, "_increaseContrast"))
        v4 = 1;
      else
        v4 = 2;
    }
    else
    {
      v4 = 1;
    }
    -[MPRouteLabel contentView](self->_routeLabel, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUVisualStylingProvider applyStyle:toView:](stylingProvider, "applyStyle:toView:", v4, v8);

    v5 = 2;
  }
  else
  {
    v5 = 1;
    if (-[MRUNowPlayingLabelView _increaseContrast](self, "_increaseContrast"))
      v6 = 1;
    else
      v6 = 2;
    -[MPRouteLabel contentView](self->_routeLabel, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUVisualStylingProvider applyStyle:toView:](stylingProvider, "applyStyle:toView:", v6, v7);

    -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 2, self->_deviceImageView);
  }
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 0, self->_titleMarqueeView);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", v5, self->_subtitleMarqueeView);
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 1, self->_placeholderMarqueeView);
}

- (void)updateContentSizeCategory
{
  UIFont *v3;
  UIFont *v4;
  UIFont *v5;
  UIFont *v6;
  void *v7;
  void *v8;
  UIFont *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  UIFont *routeFont;
  UIFont *titleFont;
  UIFont *v15;
  UIFont *placeholderFont;
  UIFont *v17;
  UIFont *subtitleFont;
  UIFont *v19;

  switch(self->_layout)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_routeFont");
      v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_smallTitleFont");
      v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_smallSubtitleFont");
      v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_smallTitleFont");
      v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_titleFont");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_subtitleFont");
      v3 = (UIFont *)(id)objc_claimAutoreleasedReturnValue();
      v6 = v8;
      v4 = v6;
      v5 = v3;
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_expandedRouteFont");
      v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_expandedTitleFont");
      v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_expandedSubtitleFont");
      v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_expandedTitleFont");
      v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_ambientTitleFont");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_ambientSubtitleFont");
      v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_titleFont");
      v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_controlCenterMediumTitleFontWithScale:", self->_contentScale);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_controlCenterMediumSubtitleFontWithScale:", self->_contentScale);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5:
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_controlCenterLargeTitleFontWithScale:", self->_contentScale);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_controlCenterLargeSubtitleFontWithScale:", self->_contentScale);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v12 = (void *)v11;
      v4 = v10;
      v3 = v12;
      v5 = v3;
      v9 = v4;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_routeFont");
      v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_titleFont");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "mru_subtitleFont");
      v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = v7;
      v4 = v6;
LABEL_8:
      v9 = v6;
      break;
  }
  routeFont = self->_routeFont;
  self->_routeFont = v3;
  v19 = v3;

  titleFont = self->_titleFont;
  self->_titleFont = v4;
  v15 = v4;

  placeholderFont = self->_placeholderFont;
  self->_placeholderFont = v9;
  v17 = v9;

  subtitleFont = self->_subtitleFont;
  self->_subtitleFont = v5;

  -[MRUNowPlayingLabelView updateFonts](self, "updateFonts");
}

- (void)updateFonts
{
  void *v3;
  int v4;
  UIFont *titleFont;
  double v6;
  void *v7;
  UIFont *subtitleFont;
  double v9;
  id v10;

  -[MPRouteLabel setFont:](self->_routeLabel, "setFont:", self->_routeFont);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", self->_routeFont, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setSymbolConfiguration:](self->_deviceImageView, "setSymbolConfiguration:", v3);

  -[MRUMarqueeLabel setFont:](self->_placeholderMarqueeView, "setFont:", self->_placeholderFont);
  if (-[MRUNowPlayingLabelView isLabelOversized:](self, "isLabelOversized:", self->_titleMarqueeView))
    LOBYTE(v4) = 0;
  else
    v4 = !-[MRUNowPlayingLabelView isLabelOversized:](self, "isLabelOversized:", self->_subtitleMarqueeView);
  titleFont = self->_titleFont;
  if (self->_layout || (v4 & 1) != 0)
  {
    -[MRUMarqueeLabel setFont:](self->_titleMarqueeView, "setFont:", self->_titleFont);
    -[MRUMarqueeLabel setFont:](self->_subtitleMarqueeView, "setFont:", self->_subtitleFont);
  }
  else
  {
    -[UIFont pointSize](self->_titleFont, "pointSize");
    -[UIFont fontWithSize:](titleFont, "fontWithSize:", v6 * 0.9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUMarqueeLabel setFont:](self->_titleMarqueeView, "setFont:", v7);

    subtitleFont = self->_subtitleFont;
    -[UIFont pointSize](subtitleFont, "pointSize");
    -[UIFont fontWithSize:](subtitleFont, "fontWithSize:", 0.9 * v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[MRUMarqueeLabel setFont:](self->_subtitleMarqueeView, "setFont:", v10);

  }
}

- (void)updateMarquee
{
  _BOOL8 marqueeEnabled;

  if (self->_layout > 1uLL)
  {
    -[MRUMarqueeLabel setMarqueeEnabled:](self->_titleMarqueeView, "setMarqueeEnabled:", self->_marqueeEnabled);
    -[MRUMarqueeLabel setMarqueeEnabled:](self->_subtitleMarqueeView, "setMarqueeEnabled:", self->_marqueeEnabled);
    marqueeEnabled = self->_marqueeEnabled;
  }
  else
  {
    -[MRUMarqueeLabel setMarqueeEnabled:](self->_titleMarqueeView, "setMarqueeEnabled:", 0);
    -[MRUMarqueeLabel setMarqueeEnabled:](self->_subtitleMarqueeView, "setMarqueeEnabled:", 0);
    marqueeEnabled = 0;
  }
  -[MRUMarqueeLabel setMarqueeEnabled:](self->_placeholderMarqueeView, "setMarqueeEnabled:", marqueeEnabled);
}

- (void)updateVisibility
{
  double v3;
  _BOOL8 v4;

  v3 = 1.0;
  if (!self->_showRoute)
    v3 = 0.0;
  -[MPRouteLabel setAlpha:](self->_routeLabel, "setAlpha:", v3);
  -[MRUMarqueeLabel setHidden:](self->_titleMarqueeView, "setHidden:", self->_showPlaceholder);
  v4 = self->_showPlaceholder || !self->_showSubtitle;
  -[MRUMarqueeLabel setHidden:](self->_subtitleMarqueeView, "setHidden:", v4);
  -[MRUMarqueeLabel setHidden:](self->_placeholderMarqueeView, "setHidden:", !self->_showPlaceholder);
  -[UIImageView setHidden:](self->_deviceImageView, "setHidden:", !self->_showDevice);
}

- (void)updatePlaceholderTextAlignment
{
  int64_t textAlignment;

  if (self->_layout)
    textAlignment = self->_textAlignment;
  else
    textAlignment = 1;
  -[MRUMarqueeLabel setTextAlignment:](self->_placeholderMarqueeView, "setTextAlignment:", textAlignment);
}

- (MPAVRoute)route
{
  return self->_route;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (int64_t)layout
{
  return self->_layout;
}

- (UIEdgeInsets)marqueeFadeEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_marqueeFadeEdgeInsets.top;
  left = self->_marqueeFadeEdgeInsets.left;
  bottom = self->_marqueeFadeEdgeInsets.bottom;
  right = self->_marqueeFadeEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)marqueeContentGap
{
  return self->_marqueeContentGap;
}

- (BOOL)showRoute
{
  return self->_showRoute;
}

- (BOOL)showSubtitle
{
  return self->_showSubtitle;
}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (BOOL)showDevice
{
  return self->_showDevice;
}

- (BOOL)isMarqueeEnabled
{
  return self->_marqueeEnabled;
}

- (BOOL)adjustsLabelsWhenHighlighted
{
  return self->_adjustsLabelsWhenHighlighted;
}

- (void)setAdjustsLabelsWhenHighlighted:(BOOL)a3
{
  self->_adjustsLabelsWhenHighlighted = a3;
}

- (BOOL)disablesLabelsLayoutAnimation
{
  return self->_disablesLabelsLayoutAnimation;
}

- (void)setDisablesLabelsLayoutAnimation:(BOOL)a3
{
  self->_disablesLabelsLayoutAnimation = a3;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (MPRouteLabel)routeLabel
{
  return self->_routeLabel;
}

- (void)setRouteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_routeLabel, a3);
}

- (MRUMarqueeLabel)titleMarqueeView
{
  return self->_titleMarqueeView;
}

- (void)setTitleMarqueeView:(id)a3
{
  objc_storeStrong((id *)&self->_titleMarqueeView, a3);
}

- (MRUMarqueeLabel)subtitleMarqueeView
{
  return self->_subtitleMarqueeView;
}

- (void)setSubtitleMarqueeView:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleMarqueeView, a3);
}

- (MRUMarqueeLabel)placeholderMarqueeView
{
  return self->_placeholderMarqueeView;
}

- (void)setPlaceholderMarqueeView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderMarqueeView, a3);
}

- (UIImageView)deviceImageView
{
  return self->_deviceImageView;
}

- (void)setDeviceImageView:(id)a3
{
  objc_storeStrong((id *)&self->_deviceImageView, a3);
}

- (UILabel)heightSizingLabel
{
  return self->_heightSizingLabel;
}

- (void)setHeightSizingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_heightSizingLabel, a3);
}

- (UIFont)routeFont
{
  return self->_routeFont;
}

- (void)setRouteFont:(id)a3
{
  objc_storeStrong((id *)&self->_routeFont, a3);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (UIFont)placeholderFont
{
  return self->_placeholderFont;
}

- (void)setPlaceholderFont:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderFont, a3);
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setSubtitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_placeholderFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_routeFont, 0);
  objc_storeStrong((id *)&self->_heightSizingLabel, 0);
  objc_storeStrong((id *)&self->_deviceImageView, 0);
  objc_storeStrong((id *)&self->_placeholderMarqueeView, 0);
  objc_storeStrong((id *)&self->_subtitleMarqueeView, 0);
  objc_storeStrong((id *)&self->_titleMarqueeView, 0);
  objc_storeStrong((id *)&self->_routeLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_deviceImage, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
