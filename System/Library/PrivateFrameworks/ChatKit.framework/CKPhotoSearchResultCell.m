@implementation CKPhotoSearchResultCell

- (CKPhotoSearchResultCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKPhotoSearchResultCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)CKPhotoSearchResultCell;
  v7 = -[CKPhotoSearchResultCell initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", x, y, width, height);
    objc_msgSend(v8, "setContentMode:", 2);
    objc_msgSend(v8, "setClipsToBounds:", 1);
    -[CKEditableSearchResultCell setImageView:](v7, "setImageView:", v8);
    -[CKPhotoSearchResultCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__thumbnailGenerated_, CFSTR("CKSearchThumbnailDidChange"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__livePhotoUpdated_, CFSTR("CKSearchLivePhotoStatusDidChange"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__videoDurationUpdated_, CFSTR("CKSearchVideoDurationDidChange"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__spatialStatusUpdated_, CFSTR("CKSearchSpatialStatusDidChange"), 0);

  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double Width;
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v31;
  uint64_t v32;
  void *v33;
  void *v34;
  CGFloat v35;
  void *v36;
  void *v37;
  void *v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL8 v67;
  void *v68;
  void *v69;
  _BOOL8 v70;
  void *v71;
  CGFloat v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  CGFloat v78;
  double v79;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double Height;
  double v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  CGFloat rect;
  objc_super v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  v102.receiver = self;
  v102.super_class = (Class)CKPhotoSearchResultCell;
  -[CKEditableSearchResultCell layoutSubviews](&v102, sel_layoutSubviews);
  -[CKPhotoSearchResultCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKEditableSearchResultCell imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = -[CKPhotoSearchResultCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CKEditableSearchResultCell imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKPhotoSearchResultCell livePhotoImage](self, "livePhotoImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CKPhotoSearchResultCell livePhotoImage](self, "livePhotoImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sizeToFit");

    -[CKPhotoSearchResultCell livePhotoImage](self, "livePhotoImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v25 = 8.0;
    if (v13)
    {
      v103.origin.x = v5;
      v103.origin.y = v7;
      v103.size.width = v9;
      v103.size.height = v11;
      Width = CGRectGetWidth(v103);
      v104.origin.y = 8.0;
      v104.origin.x = v20;
      v104.size.width = v22;
      v104.size.height = v24;
      v25 = Width - CGRectGetWidth(v104) + -8.0;
    }
    -[CKPhotoSearchResultCell livePhotoImage](self, "livePhotoImage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrame:", v25, 8.0, v22, v24);

    -[CKPhotoSearchResultCell livePhotoImage](self, "livePhotoImage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v31 = !self->_isLivePhoto || v15 == 0;
    objc_msgSend(v28, "setHidden:", v31);

  }
  -[CKPhotoSearchResultCell durationLabel](self, "durationLabel");
  v32 = objc_claimAutoreleasedReturnValue();
  rect = v11;
  if (v32)
  {
    v33 = (void *)v32;
    -[CKPhotoSearchResultCell durationGradientImage](self, "durationGradientImage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v105.origin.x = v5;
      v105.origin.y = v7;
      v105.size.width = v9;
      v105.size.height = v11;
      v35 = CGRectGetMaxY(v105) + -25.0;
      -[CKPhotoSearchResultCell durationGradientImage](self, "durationGradientImage");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setFrame:", v5, v35, v9, 25.0);

      -[CKPhotoSearchResultCell durationLabel](self, "durationLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "sizeToFit");

      -[CKPhotoSearchResultCell durationLabel](self, "durationLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "frame");
      v39 = v11;
      v40 = v7;
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;

      v49 = v5;
      v50 = v40;
      v51 = v9;
      v52 = v39;
      if ((v13 & 1) != 0)
      {
        v53 = CGRectGetMinX(*(CGRect *)&v49) + 5.0;
      }
      else
      {
        v100 = v9;
        v54 = v5;
        v55 = v40;
        v56 = v39;
        v57 = CGRectGetMaxX(*(CGRect *)&v49) + -5.0;
        v106.origin.x = v42;
        v106.origin.y = v44;
        v106.size.width = v46;
        v106.size.height = v48;
        v53 = v57 - CGRectGetWidth(v106);
        v39 = v56;
        v40 = v55;
        v5 = v54;
        v9 = v100;
      }
      v107.origin.x = v5;
      v107.origin.y = v40;
      v107.size.width = v9;
      v107.size.height = v39;
      v58 = CGRectGetMaxY(v107) + -3.0;
      v108.origin.x = v53;
      v108.origin.y = v44;
      v108.size.width = v46;
      v108.size.height = v48;
      v59 = v58 - CGRectGetHeight(v108);
      -[CKPhotoSearchResultCell durationLabel](self, "durationLabel");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setFrame:", v53, v59, v46, v48);

      -[CKPhotoSearchResultCell contentView](self, "contentView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKPhotoSearchResultCell durationGradientImage](self, "durationGradientImage");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "bringSubviewToFront:", v62);

      -[CKPhotoSearchResultCell contentView](self, "contentView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKPhotoSearchResultCell durationLabel](self, "durationLabel");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "bringSubviewToFront:", v64);

      -[CKPhotoSearchResultCell durationLabel](self, "durationLabel");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      if (v15)
        v67 = !self->_isVideo;
      else
        v67 = 1;
      objc_msgSend(v65, "setHidden:", v67, *(_QWORD *)&v100);

      -[CKPhotoSearchResultCell durationGradientImage](self, "durationGradientImage");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      if (v15)
        v70 = !self->_isVideo;
      else
        v70 = 1;
      objc_msgSend(v68, "setHidden:", v70);

      v7 = v40;
    }
  }
  -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    v72 = v7;
    -[UILabel setHidden:](self->_durationLabel, "setHidden:", 1);
    -[UIImageView setHidden:](self->_durationGradientImage, "setHidden:", 1);
    -[CKPhotoSearchResultCell contentView](self, "contentView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "bringSubviewToFront:", v74);

    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "sizeToFit");

    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "frame");
    v78 = v77;
    v80 = v79;
    v82 = v81;
    v84 = v83;

    v85 = 4.0;
    if ((v13 & 1) == 0)
    {
      v109.origin.x = v5;
      v109.origin.y = v72;
      v109.size.width = v9;
      v109.size.height = rect;
      v86 = CGRectGetWidth(v109);
      v110.origin.x = v78;
      v110.origin.y = v80;
      v110.size.width = v82;
      v110.size.height = v84;
      v85 = v86 - CGRectGetWidth(v110) + -4.0;
    }
    v111.origin.x = v5;
    v111.origin.y = v72;
    v111.size.width = v9;
    v111.size.height = rect;
    Height = CGRectGetHeight(v111);
    v112.origin.x = v85;
    v112.origin.y = v80;
    v112.size.width = v82;
    v112.size.height = v84;
    v88 = Height - CGRectGetHeight(v112) + -4.0;
    -[CKEditableSearchResultCell checkmarkView](self, "checkmarkView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setFrame:", v85, v88, v82, v84);

  }
  -[CKPhotoSearchResultCell spatialBadgeView](self, "spatialBadgeView");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    -[CKPhotoSearchResultCell bounds](self, "bounds");
    v92 = v91;
    v94 = v93;
    v96 = v95;
    v98 = v97;
    -[CKPhotoSearchResultCell spatialBadgeView](self, "spatialBadgeView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setFrame:", v92, v94, v96, v98);

  }
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKPhotoSearchResultCell;
  -[CKEditableSearchResultCell prepareForReuse](&v6, sel_prepareForReuse);
  -[CKPhotoSearchResultCell setIsLivePhoto:](self, "setIsLivePhoto:", 0);
  -[CKPhotoSearchResultCell setIsVideo:](self, "setIsVideo:", 0);
  -[CKPhotoSearchResultCell setIsSpatial:](self, "setIsSpatial:", 0);
  if (self->_durationLabel)
  {
    -[CKPhotoSearchResultCell durationLabel](self, "durationLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

  }
  if (self->_durationGradientImage)
  {
    -[CKPhotoSearchResultCell durationGradientImage](self, "durationGradientImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

  }
  -[CKEditableSearchResultCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);

  -[CKPhotoSearchResultCell setResultIdentifier:](self, "setResultIdentifier:", 0);
}

- (void)setIsLivePhoto:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  if (self->_isLivePhoto != a3)
  {
    self->_isLivePhoto = a3;
    -[CKPhotoSearchResultCell livePhotoImage](self, "livePhotoImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v5;
    if (a3)
    {

      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("livephoto"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "imageWithSymbolConfiguration:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v8);
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTintColor:", v10);

        -[CKPhotoSearchResultCell contentView](self, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", v9);

        -[CKPhotoSearchResultCell setLivePhotoImage:](self, "setLivePhotoImage:", v9);
        objc_msgSend(v9, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v12, "setShadowColor:", objc_msgSend(v13, "CGColor"));

        objc_msgSend(v9, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = *(_DWORD *)"333?";
        objc_msgSend(v14, "setShadowOpacity:", v15);

        objc_msgSend(v9, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setShadowOffset:", 0.0, 1.0);

        objc_msgSend(v9, "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setShadowRadius:", 4.0);

        -[CKPhotoSearchResultCell setNeedsLayout](self, "setNeedsLayout");
      }
      -[CKPhotoSearchResultCell livePhotoImage](self, "livePhotoImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v5;
      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    objc_msgSend(v5, "setHidden:", v18);

  }
}

- (void)setIsVideo:(BOOL)a3
{
  void *v5;
  void *v6;
  UILabel *v7;
  UILabel *durationLabel;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIImageView *v19;
  UIImageView *durationGradientImage;
  UIImageView *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;

  if (self->_isVideo != a3)
  {
    self->_isVideo = a3;
    -[CKPhotoSearchResultCell durationLabel](self, "durationLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a3)
    {

      if (!v6)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
        durationLabel = self->_durationLabel;
        self->_durationLabel = v7;

        v9 = self->_durationLabel;
        objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

        v11 = self->_durationLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v11, "setFont:", v12);

        v13 = self->_durationLabel;
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v13, "setTextColor:", v14);

        -[UILabel setTextAlignment:](self->_durationLabel, "setTextAlignment:", 4);
        -[CKPhotoSearchResultCell contentView](self, "contentView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSubview:", self->_durationLabel);

        -[CKPhotoSearchResultCell setNeedsLayout](self, "setNeedsLayout");
      }
      -[CKPhotoSearchResultCell durationGradientImage](self, "durationGradientImage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("CKAssetsSceneBadgeBannerGradient"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "resizableImageWithCapInsets:resizingMode:", 0, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v18);
        durationGradientImage = self->_durationGradientImage;
        self->_durationGradientImage = v19;
        v21 = v19;

        -[CKPhotoSearchResultCell contentView](self, "contentView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addSubview:", v21);

        -[CKPhotoSearchResultCell setNeedsLayout](self, "setNeedsLayout");
      }
      -[CKPhotoSearchResultCell durationLabel](self, "durationLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setHidden:", 0);

      -[CKPhotoSearchResultCell durationGradientImage](self, "durationGradientImage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
      v25 = 0;
    }
    else
    {
      objc_msgSend(v5, "setHidden:", 1);

      -[CKPhotoSearchResultCell durationGradientImage](self, "durationGradientImage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
      v25 = 1;
    }
    objc_msgSend(v24, "setHidden:", v25);

  }
}

- (void)setIsSpatial:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_isSpatial != a3)
  {
    v3 = a3;
    self->_isSpatial = a3;
    -[CKPhotoSearchResultCell spatialBadgeView](self, "spatialBadgeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {

      if (!v6)
      {
        +[CKMonoskiBadgeViewFactory badgeViewWithSupportsGradient:](_TtC7ChatKit25CKMonoskiBadgeViewFactory, "badgeViewWithSupportsGradient:", 1);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        -[CKPhotoSearchResultCell addSubview:](self, "addSubview:", v8);
        -[CKPhotoSearchResultCell setSpatialBadgeView:](self, "setSpatialBadgeView:", v8);

      }
    }
    else
    {

      if (v6)
      {
        -[CKPhotoSearchResultCell spatialBadgeView](self, "spatialBadgeView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeFromSuperview");

        -[CKPhotoSearchResultCell setSpatialBadgeView:](self, "setSpatialBadgeView:", 0);
      }
    }
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKPhotoSearchResultCell;
  -[CKPhotoSearchResultCell dealloc](&v4, sel_dealloc);
}

+ (id)reuseIdentifier
{
  return CFSTR("PhotoSearchCell");
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  objc_msgSend(v36, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPhotoSearchResultCell setResultIdentifier:](self, "setResultIdentifier:", v7);

  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasCachedPreviewForQueryResult:", v36);

  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v10, "generatePreviewForQueryResult:", v36);
    v12 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v10, "cachedPreviewForQueryResult:", v36);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CKEditableSearchResultCell imageView](self, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:", v12);

    if (CKIsRunningInMacCatalyst())
    {
      -[CKEditableSearchResultCell imageView](self, "imageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setContentMode:", 2);

      -[CKEditableSearchResultCell imageView](self, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClipsToBounds:", 1);
LABEL_6:

    }
  }
  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "queryResultHasLivePhoto:", v36);

  -[CKPhotoSearchResultCell setIsLivePhoto:](self, "setIsLivePhoto:", v16);
  if ((v16 & 1) != 0)
  {
    -[CKPhotoSearchResultCell setIsVideo:](self, "setIsVideo:", 0);
  }
  else
  {
    +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "queryResultIsVideo:", v36);

    -[CKPhotoSearchResultCell setIsVideo:](self, "setIsVideo:", v18);
    if ((_DWORD)v18)
      -[CKPhotoSearchResultCell _configureDurationLabelForResult:](self, "_configureDurationLabelForResult:", v36);
  }
  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "queryResultIsSpatial:", v36);

  -[CKPhotoSearchResultCell setIsSpatial:](self, "setIsSpatial:", v20);
  v21 = CKIsRunningInMacCatalyst();
  if (a5 == 1 || v21)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "searchPhotosCellZKWAndDetailsCornerRadius");
    v27 = v26;

    -[CKEditableSearchResultCell imageView](self, "imageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCornerRadius:", v27);

    -[CKPhotoSearchResultCell livePhotoImage](self, "livePhotoImage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCornerRadius:", v27);

    -[CKPhotoSearchResultCell durationGradientImage](self, "durationGradientImage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMasksToBounds:", 1);

    -[CKPhotoSearchResultCell durationGradientImage](self, "durationGradientImage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCornerRadius:", v27);

    -[CKPhotoSearchResultCell durationLabel](self, "durationLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCornerRadius:", v27);
    goto LABEL_16;
  }
  if (!CKIsRunningInMacCatalyst())
  {
    -[CKEditableSearchResultCell imageView](self, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "searchPhotosCellCornerRadius");
    objc_msgSend(v23, "setCornerRadius:");

LABEL_16:
  }

}

- (void)_thumbnailGenerated:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "object");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPhotoSearchResultCell resultIdentifier](self, "resultIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedPreviewForQueryResult:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CKEditableSearchResultCell imageView](self, "imageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImage:", v8);

      if (CKIsRunningInMacCatalyst())
      {
        -[CKEditableSearchResultCell imageView](self, "imageView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setContentMode:", 2);

        -[CKEditableSearchResultCell imageView](self, "imageView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setClipsToBounds:", 1);

      }
      -[CKPhotoSearchResultCell setNeedsLayout](self, "setNeedsLayout");
    }

  }
}

- (void)_livePhotoUpdated:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPhotoSearchResultCell resultIdentifier](self, "resultIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "queryResultHasLivePhoto:", v9);

    -[CKPhotoSearchResultCell setIsLivePhoto:](self, "setIsLivePhoto:", v8);
    -[CKPhotoSearchResultCell setIsVideo:](self, "setIsVideo:", 0);
  }

}

- (void)_videoDurationUpdated:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPhotoSearchResultCell resultIdentifier](self, "resultIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    -[CKPhotoSearchResultCell setIsVideo:](self, "setIsVideo:", 1);
    -[CKPhotoSearchResultCell setIsLivePhoto:](self, "setIsLivePhoto:", 0);
    -[CKPhotoSearchResultCell _configureDurationLabelForResult:](self, "_configureDurationLabelForResult:", v7);
  }

}

- (void)_configureDurationLabelForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v4 = a3;
  if (_configureDurationLabelForResult___pred_CMTimeGetSecondsCoreMedia != -1)
    dispatch_once(&_configureDurationLabelForResult___pred_CMTimeGetSecondsCoreMedia, &__block_literal_global_271);
  v13 = 0uLL;
  v14 = 0;
  +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "durationForVideoResult:", v4);
  }
  else
  {
    v13 = 0uLL;
    v14 = 0;
  }

  if ((BYTE12(v13) & 1) != 0)
  {
    v11 = v13;
    v12 = v14;
    objc_msgSend(MEMORY[0x1E0CEA780], "timeStringForSeconds:forceFullWidthComponents:isElapsed:", (int)rint(_configureDurationLabelForResult___CMTimeGetSeconds(&v11)), 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPhotoSearchResultCell durationLabel](self, "durationLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[CKPhotoSearchResultCell durationLabel](self, "durationLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

    -[CKPhotoSearchResultCell durationGradientImage](self, "durationGradientImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 0);

  }
  else
  {
    -[UILabel setHidden:](self->_durationLabel, "setHidden:", 1);
    -[UIImageView setHidden:](self->_durationGradientImage, "setHidden:", 1);
  }
  -[CKPhotoSearchResultCell setNeedsLayout](self, "setNeedsLayout");

}

void *__60__CKPhotoSearchResultCell__configureDurationLabelForResult___block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CMTimeGetSeconds", CFSTR("CoreMedia"));
  _configureDurationLabelForResult___CMTimeGetSeconds = result;
  return result;
}

- (void)_spatialStatusUpdated:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPhotoSearchResultCell resultIdentifier](self, "resultIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "queryResultIsSpatial:", v9);

    -[CKPhotoSearchResultCell setIsSpatial:](self, "setIsSpatial:", v8);
  }

}

- (void)setSelected:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKPhotoSearchResultCell;
  -[CKEditableSearchResultCell setSelected:](&v3, sel_setSelected_, a3);
}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->marginInsets.top;
  left = self->marginInsets.left;
  bottom = self->marginInsets.bottom;
  right = self->marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIImageView)livePhotoImage
{
  return self->_livePhotoImage;
}

- (void)setLivePhotoImage:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoImage, a3);
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setResultIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (void)setDurationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_durationLabel, a3);
}

- (UIImageView)durationGradientImage
{
  return self->_durationGradientImage;
}

- (void)setDurationGradientImage:(id)a3
{
  objc_storeStrong((id *)&self->_durationGradientImage, a3);
}

- (BOOL)isLivePhoto
{
  return self->_isLivePhoto;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)isSpatial
{
  return self->_isSpatial;
}

- (UIView)spatialBadgeView
{
  return self->_spatialBadgeView;
}

- (void)setSpatialBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_spatialBadgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialBadgeView, 0);
  objc_storeStrong((id *)&self->_durationGradientImage, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
  objc_storeStrong((id *)&self->_livePhotoImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
