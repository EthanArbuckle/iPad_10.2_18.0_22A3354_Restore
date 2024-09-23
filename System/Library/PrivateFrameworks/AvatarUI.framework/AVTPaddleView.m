@implementation AVTPaddleView

+ (double)defaultPadding
{
  return 14.0;
}

- (AVTPaddleView)initWithLayoutDirection:(int64_t)a3
{
  return -[AVTPaddleView initWithLayoutDirection:symbolConfiguration:](self, "initWithLayoutDirection:symbolConfiguration:", a3, 0);
}

- (AVTPaddleView)initWithLayoutDirection:(int64_t)a3 symbolConfiguration:(id)a4
{
  id v6;
  AVTPaddleView *v7;
  double v8;
  void *v9;
  uint64_t v10;
  AVTUILogger *logger;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AVTPaddleView;
  v7 = -[AVTPaddleView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "defaultPadding");
    v7->_padding = v8;
    v7->_layoutDirection = a3;
    +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    logger = v7->_logger;
    v7->_logger = (AVTUILogger *)v10;

    -[AVTPaddleView _configureWithSymbolConfiguration:](v7, "_configureWithSymbolConfiguration:", v6);
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[AVTPaddleView stopPlayingIfNecessary](self, "stopPlayingIfNecessary");
  -[AVTPaddleView tapGestureRecognizer](self, "tapGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPaddleView removeGestureRecognizer:](self, "removeGestureRecognizer:", v3);

  -[AVTPaddleView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPaddleView dismissGestureRecognizer](self, "dismissGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", v5);

  -[AVTPaddleView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", 0);
  -[AVTPaddleView setDismissGestureRecognizer:](self, "setDismissGestureRecognizer:", 0);
  v6.receiver = self;
  v6.super_class = (Class)AVTPaddleView;
  -[AVTPaddleView dealloc](&v6, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = objc_msgSend(a3, "isEqualToString:", CFSTR("status"));
  v9 = v13;
  if (v8)
  {
    v10 = v13;
    if (objc_msgSend(v10, "status") == 2)
    {
      -[AVTPaddleView logger](self, "logger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logPaddleViewVideoPlayerFailed:", v12);

      -[AVTPaddleView stopPlayingIfNecessary](self, "stopPlayingIfNecessary");
      -[AVTPaddleView startPlayingIfNecessary](self, "startPlayingIfNecessary");
    }

    v9 = v13;
  }

}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVTPaddleView;
  -[AVTPaddleView layoutSubviews](&v2, sel_layoutSubviews);
}

- (void)_configureWithSymbolConfiguration:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIView *v16;
  UIView *videoViewContainer;
  void *v18;
  AVPlayerViewController *v19;
  AVPlayerViewController *videoController;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UIView *v25;
  void *v26;
  UIView *v27;
  UIView *addButtonViewContainer;
  void *v29;
  AVTCircularButton *v30;
  AVTCircularButton *addButton;
  AVTCircularButton *v32;
  AVTTouchDownGestureRecognizer *v33;
  AVTTouchDownGestureRecognizer *tapGestureRecognizer;
  AVTTouchDownGestureRecognizer *v35;
  AVTTouchDownGestureRecognizer *dismissGestureRecognizer;
  void *v37;
  id v38;

  v38 = a3;
  self->_automaticallyStartsPlaying = 1;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPaddleView setBackgroundColor:](self, "setBackgroundColor:", v4);

  -[AVTPaddleView setAutoresizingMask:](self, "setAutoresizingMask:", 0);
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[AVTPaddleView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShadowOffset:", v5, v6);

  -[AVTPaddleView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowRadius:", 40.0);

  -[AVTPaddleView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1047233823;
  objc_msgSend(v9, "setShadowOpacity:", v10);

  v11 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16 = (UIView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
  videoViewContainer = self->_videoViewContainer;
  self->_videoViewContainer = v16;

  -[UIView setAutoresizingMask:](self->_videoViewContainer, "setAutoresizingMask:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_videoViewContainer, "setBackgroundColor:", v18);

  -[AVTPaddleView addSubview:](self, "addSubview:", self->_videoViewContainer);
  v19 = (AVPlayerViewController *)objc_alloc_init(MEMORY[0x1E0C8B448]);
  videoController = self->_videoController;
  self->_videoController = v19;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewController view](self->_videoController, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v21);

  -[AVPlayerViewController setShowsPlaybackControls:](self->_videoController, "setShowsPlaybackControls:", 0);
  -[AVPlayerViewController setUpdatesNowPlayingInfoCenter:](self->_videoController, "setUpdatesNowPlayingInfoCenter:", 0);
  -[AVPlayerViewController player](self->_videoController, "player");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAllowsExternalPlayback:", 0);

  -[AVPlayerViewController view](self->_videoController, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAutoresizingMask:", 0);

  v25 = self->_videoViewContainer;
  -[AVPlayerViewController view](self->_videoController, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v25, "addSubview:", v26);

  v27 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v12, v13, v14, v15);
  addButtonViewContainer = self->_addButtonViewContainer;
  self->_addButtonViewContainer = v27;

  -[UIView setAutoresizingMask:](self->_addButtonViewContainer, "setAutoresizingMask:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_addButtonViewContainer, "setBackgroundColor:", v29);

  -[AVTPaddleView addSubview:](self, "addSubview:", self->_addButtonViewContainer);
  +[AVTCircularButton buttonWithType:](AVTCircularButton, "buttonWithType:", 0);
  v30 = (AVTCircularButton *)objc_claimAutoreleasedReturnValue();
  addButton = self->_addButton;
  self->_addButton = v30;

  v32 = self->_addButton;
  if (v38)
    -[AVTCircularButton setSymbolImageWithName:configuration:](v32, "setSymbolImageWithName:configuration:", CFSTR("plus"), v38);
  else
    -[AVTCircularButton setSymbolImageWithName:](v32, "setSymbolImageWithName:", CFSTR("plus"));
  -[AVTCircularButton setAutoresizingMask:](self->_addButton, "setAutoresizingMask:", 0);
  -[UIView addSubview:](self->_addButtonViewContainer, "addSubview:", self->_addButton);
  v33 = -[AVTTouchDownGestureRecognizer initWithTarget:action:]([AVTTouchDownGestureRecognizer alloc], "initWithTarget:action:", self, sel_handleTapGesture);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v33;

  -[AVTPaddleView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
  v35 = -[AVTTouchDownGestureRecognizer initWithTarget:action:]([AVTTouchDownGestureRecognizer alloc], "initWithTarget:action:", self, sel_handleDismissGesture);
  dismissGestureRecognizer = self->_dismissGestureRecognizer;
  self->_dismissGestureRecognizer = v35;

  -[AVTTouchDownGestureRecognizer requireGestureRecognizerToFail:](self->_dismissGestureRecognizer, "requireGestureRecognizerToFail:", self->_tapGestureRecognizer);
  -[AVTPaddleView superview](self, "superview");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addGestureRecognizer:", self->_dismissGestureRecognizer);

  -[AVTPaddleView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTPaddleView;
  -[AVTPaddleView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[AVTPaddleView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)updateLayoutFromPlusButtonView:(id)a3 videoView:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double Width;
  double Height;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double MinY;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  int64_t v64;
  double v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double MaxX;
  CGFloat v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  double MaxY;
  double v103;
  double v104;
  CGFloat rect;
  double rect_8;
  double rect_16;
  CGFloat rect_24;
  CGFloat rect_24a;
  double v110;
  double v111;
  double v112;
  double v113;
  id v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;

  v114 = a4;
  v6 = a3;
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[AVTPaddleView superview](self, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertRect:toView:", v16, v9, v11, v13, v15);
  v110 = v17;
  v19 = v18;
  v115 = v21;
  v117 = v20;

  objc_msgSend(v6, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  -[AVTPaddleView padding](self, "padding");
  v31 = v27 + v30 * 2.0;
  -[AVTPaddleView padding](self, "padding");
  v33 = v29 + v32 * 2.0;
  v119.origin.x = v23;
  v119.origin.y = v25;
  v119.size.width = v31;
  v119.size.height = v33;
  Width = CGRectGetWidth(v119);
  v120.origin.x = v23;
  v120.origin.y = v25;
  v120.size.width = v31;
  v113 = v33;
  v120.size.height = v33;
  Height = CGRectGetHeight(v120);
  -[AVTPaddleView padding](self, "padding");
  v112 = v31;
  if (v114)
  {
    objc_msgSend(v114, "superview");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "frame");
    v39 = v38;
    rect_24 = v19;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    -[AVTPaddleView superview](self, "superview");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "convertRect:toView:", v46, v39, v41, v43, v45);
    v48 = v47;
    rect = v47;
    v50 = v49;
    v52 = v51;
    v54 = v53;

    v121.origin.x = v48;
    v121.origin.y = v50;
    v121.size.width = v52;
    v121.size.height = v54;
    rect_8 = v23;
    MinY = CGRectGetMinY(v121);
    v122.origin.y = rect_24;
    v122.origin.x = v110;
    v122.size.width = v117;
    v122.size.height = v115;
    v56 = MinY - CGRectGetMaxY(v122);
    v123.origin.x = v110;
    v123.origin.y = rect_24;
    v123.size.width = v117;
    v123.size.height = v115;
    v57 = CGRectGetMinY(v123);
    v124.origin.x = rect;
    v124.origin.y = v50;
    v116 = v52;
    v118 = v54;
    v124.size.width = v52;
    v124.size.height = v54;
    v19 = rect_24;
    v58 = v57 - CGRectGetMaxY(v124);
    v23 = rect_8;
    if (v58 < v56)
      v58 = v56;
    v59 = fmax(v58, 0.0);
  }
  else
  {
    v59 = v36;
    v116 = Width + Width;
    v118 = Height + Height;
  }
  -[AVTPaddleView padding](self, "padding", *(_QWORD *)&rect);
  v61 = v60;
  -[AVTPaddleView padding](self, "padding");
  v63 = v19 - v62;
  v64 = -[AVTPaddleView layoutDirection](self, "layoutDirection");
  v65 = v113;
  if (v64 == 1)
  {
    v66 = v23;
    v67 = v25;
    v68 = v31;
    v69 = v59 + CGRectGetMaxY(*(CGRect *)(&v65 - 3));
    v70 = v116;
    v71 = v118;
  }
  else
  {
    v125.origin.x = 0.0;
    v125.origin.y = 0.0;
    v70 = v116;
    v71 = v118;
    v125.size.width = v116;
    v125.size.height = v118;
    v25 = v59 + CGRectGetMaxY(v125);
    v72 = v59 + v118;
    v69 = 0.0;
    v63 = v63 - v72;
  }
  v73 = v110 - v61;
  v111 = v63;
  if (-[AVTPaddleView isRTL](self, "isRTL"))
  {
    v126.origin.x = 0.0;
    v126.origin.y = v69;
    v126.size.width = v70;
    v126.size.height = v71;
    v74 = v73;
    MaxX = CGRectGetMaxX(v126);
    v127.origin.x = v23;
    v127.origin.y = v25;
    v127.size.width = v31;
    v127.size.height = v113;
    v76 = CGRectGetWidth(v127);
    v77 = v31;
    v78 = MaxX - v76;
    rect_16 = v74 - (v70 - v77);
  }
  else
  {
    v78 = v23;
    rect_16 = v73;
  }
  -[AVTPaddleView videoViewContainer](self, "videoViewContainer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setFrame:", 0.0, v69, v70, v71);

  -[AVTPaddleView videoViewContainer](self, "videoViewContainer");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPaddleView frameForVideoInCoordinateSpace:](self, "frameForVideoInCoordinateSpace:", v80);
  v82 = v81;
  rect_24a = v69;
  v84 = v83;
  v86 = v85;
  v88 = v87;
  -[AVTPaddleView videoController](self, "videoController");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "view");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setFrame:", v82, v84, v86, v88);

  -[AVTPaddleView addButtonViewContainer](self, "addButtonViewContainer");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setFrame:", v78, v25, v112, v113);

  -[AVTPaddleView addButtonViewContainer](self, "addButtonViewContainer");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPaddleView frameForAddButtonInCoordinateSpace:](self, "frameForAddButtonInCoordinateSpace:", v92);
  v94 = v93;
  v96 = v95;
  v98 = v97;
  v100 = v99;
  -[AVTPaddleView addButton](self, "addButton");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setFrame:", v94, v96, v98, v100);

  v128.origin.x = 0.0;
  v128.origin.y = rect_24a;
  v128.size.height = v71;
  v128.size.width = v70;
  MaxY = CGRectGetMaxY(v128);
  v129.origin.x = v78;
  v129.origin.y = v25;
  v129.size.width = v112;
  v129.size.height = v113;
  v103 = CGRectGetMaxY(v129);
  if (MaxY >= v103)
    v104 = MaxY;
  else
    v104 = v103;
  -[AVTPaddleView setFrame:](self, "setFrame:", rect_16, v111, v70, v104);
  -[AVTPaddleView setNeedsDisplay](self, "setNeedsDisplay");

}

- (CGRect)frameForAddButtonInCoordinateSpace:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  void *v7;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  double v13;
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
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  v4 = a3;
  -[AVTPaddleView padding](self, "padding");
  v6 = v5;
  -[AVTPaddleView addButtonViewContainer](self, "addButtonViewContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v26 = CGRectInset(v25, v6, v6);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;

  -[AVTPaddleView addButtonViewContainer](self, "addButtonViewContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertRect:fromCoordinateSpace:", v12, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)frameForVideoInCoordinateSpace:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double x;
  double y;
  double width;
  double height;
  void *v12;
  double v13;
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
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  v4 = a3;
  -[AVTPaddleView padding](self, "padding");
  if (v5 >= 12.0)
    v6 = v5;
  else
    v6 = 12.0;
  -[AVTPaddleView videoViewContainer](self, "videoViewContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v26 = CGRectInset(v25, v6, v6);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;

  -[AVTPaddleView videoViewContainer](self, "videoViewContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertRect:fromCoordinateSpace:", v12, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)handleTapAddButton
{
  void *v3;
  id v4;

  -[AVTPaddleView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTPaddleView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paddleViewTapped:", self);

  }
}

- (void)handleTapGesture
{
  void *v3;
  id v4;

  -[AVTPaddleView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTPaddleView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paddleViewTapped:", self);

  }
}

- (void)handleDismissGesture
{
  void *v3;
  id v4;

  -[AVTPaddleView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTPaddleView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paddleViewWantsToBeDismissed:", self);

  }
}

- (BOOL)isPointInsideTransparentRegion:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  _BOOL4 v7;
  void *v8;
  CGPoint v10;
  CGPoint v11;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  -[AVTPaddleView addButtonViewContainer](self, "addButtonViewContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v10.x = x;
  v10.y = y;
  if (CGRectContainsPoint(v12, v10))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    -[AVTPaddleView videoViewContainer](self, "videoViewContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v11.x = x;
    v11.y = y;
    v7 = !CGRectContainsPoint(v13, v11);

  }
  return v7;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  _BOOL4 v7;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)AVTPaddleView;
  v7 = -[AVTPaddleView pointInside:withEvent:](&v9, sel_pointInside_withEvent_, a4);
  if (v7)
    LOBYTE(v7) = !-[AVTPaddleView isPointInsideTransparentRegion:](self, "isPointInsideTransparentRegion:", x, y);
  return v7;
}

- (void)attachVideoController:(id)a3
{
  AVPlayerViewController *v4;
  AVPlayer *v5;
  AVPlayer *player;
  AVPlayerViewController *videoController;
  AVPlayerViewController *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  UIView *videoViewContainer;
  id v20;

  v4 = (AVPlayerViewController *)a3;
  -[AVTPaddleView stopPlayingIfNecessary](self, "stopPlayingIfNecessary");
  -[AVPlayerViewController player](v4, "player");
  v5 = (AVPlayer *)objc_claimAutoreleasedReturnValue();
  player = self->_player;
  self->_player = v5;

  -[AVPlayer setAllowsExternalPlayback:](self->_player, "setAllowsExternalPlayback:", 0);
  -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, 0);
  videoController = self->_videoController;
  self->_videoController = v4;
  v8 = v4;

  -[AVTPaddleView frameForVideoInCoordinateSpace:](self, "frameForVideoInCoordinateSpace:", self->_videoViewContainer);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[AVPlayerViewController view](self->_videoController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  -[AVPlayerViewController view](self->_videoController, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAutoresizingMask:", 18);

  videoViewContainer = self->_videoViewContainer;
  -[AVPlayerViewController view](self->_videoController, "view");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](videoViewContainer, "addSubview:", v20);

}

- (void)startPlayingIfNecessary
{
  AVPlayer *v3;
  AVPlayer *player;
  AVPlayer *v5;
  id v6;

  if (!self->_player)
  {
    objc_msgSend((id)objc_opt_class(), "videoItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (AVPlayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B350]), "initWithPlayerItem:", v6);
    -[AVPlayer setPreventsDisplaySleepDuringVideoPlayback:](v3, "setPreventsDisplaySleepDuringVideoPlayback:", 0);
    -[AVPlayer addObserver:forKeyPath:options:context:](v3, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, 0);
    player = self->_player;
    self->_player = v3;
    v5 = v3;

    -[AVPlayer setAllowsExternalPlayback:](self->_player, "setAllowsExternalPlayback:", 0);
    -[AVPlayerViewController setPlayer:](self->_videoController, "setPlayer:", self->_player);
    -[AVPlayer play](self->_player, "play");

  }
}

- (void)stopPlayingIfNecessary
{
  AVPlayer *player;
  AVPlayer *v4;

  player = self->_player;
  if (player)
  {
    -[AVPlayer removeObserver:forKeyPath:](player, "removeObserver:forKeyPath:", self, CFSTR("status"));
    -[AVPlayer pause](self->_player, "pause");
    -[AVPlayerViewController setPlayer:](self->_videoController, "setPlayer:", 0);
    v4 = self->_player;
    self->_player = 0;

  }
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AVTPaddleView;
  -[AVTPaddleView didMoveToWindow](&v18, sel_didMoveToWindow);
  -[AVTPaddleView dismissGestureRecognizer](self, "dismissGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPaddleView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[AVTPaddleView dismissGestureRecognizer](self, "dismissGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPaddleView dismissGestureRecognizer](self, "dismissGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:", v8);

    -[AVTPaddleView superview](self, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPaddleView dismissGestureRecognizer](self, "dismissGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addGestureRecognizer:", v10);

  }
  objc_initWeak(&location, self);
  -[AVTPaddleView preCommitBlock](self, "preCommitBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __32__AVTPaddleView_didMoveToWindow__block_invoke;
    v15 = &unk_1EA51D7E8;
    objc_copyWeak(&v16, &location);
    -[AVTPaddleView setPreCommitBlock:](self, "setPreCommitBlock:", &v12);
    objc_msgSend(MEMORY[0x1E0CD28B0], "addCommitHandler:forPhase:", self->_preCommitBlock, 1, v12, v13, v14, v15);
    objc_destroyWeak(&v16);
  }
  objc_destroyWeak(&location);
}

void __32__AVTPaddleView_didMoveToWindow__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    if (objc_msgSend(WeakRetained, "automaticallyStartsPlaying"))
      objc_msgSend(WeakRetained, "startPlayingIfNecessary");
  }
  else
  {
    objc_msgSend(WeakRetained, "stopPlayingIfNecessary");
  }
  objc_msgSend(WeakRetained, "setPreCommitBlock:", 0);

}

- (void)showAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _QWORD v6[5];

  v3 = a3;
  -[AVTPaddleView setAlpha:](self, "setAlpha:", 0.0);
  v5 = 0.2;
  if (!v3)
    v5 = 0.0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__AVTPaddleView_showAnimated___block_invoke;
  v6[3] = &unk_1EA51D188;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v6, 0, v5);
}

uint64_t __30__AVTPaddleView_showAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)dismissAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];
  _QWORD v5[5];

  v3 = 0.2;
  if (!a3)
    v3 = 0.0;
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVTPaddleView_dismissAnimated___block_invoke;
  v5[3] = &unk_1EA51D188;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__AVTPaddleView_dismissAnimated___block_invoke_2;
  v4[3] = &unk_1EA51D250;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v5, v4, v3);
}

uint64_t __33__AVTPaddleView_dismissAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __33__AVTPaddleView_dismissAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)playVideo
{
  -[AVPlayer play](self->_player, "play");
}

- (void)pauseVideo
{
  -[AVPlayer pause](self->_player, "pause");
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  -[AVTPaddleView videoViewContainer](self, "videoViewContainer", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[AVTPaddleView addButtonViewContainer](self, "addButtonViewContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  +[AVTUIColorRepository paddleViewBackgroundColor](AVTUIColorRepository, "paddleViewBackgroundColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTPaddleView traitCollection](self, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resolvedColorWithTraitCollection:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFill");

  +[AVTPaddlePathGenerator paddlePathWithBaseRect:contentRect:radius:topToBottom:rightToLeft:](AVTPaddlePathGenerator, "paddlePathWithBaseRect:contentRect:radius:topToBottom:rightToLeft:", -[AVTPaddleView layoutDirection](self, "layoutDirection") == 1, -[AVTPaddleView isRTL](self, "isRTL"), v15, v17, v19, v21, v6, v8, v10, v12, 0x4028000000000000);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fill");

}

- (BOOL)automaticallyStartsPlaying
{
  return self->_automaticallyStartsPlaying;
}

- (void)setAutomaticallyStartsPlaying:(BOOL)a3
{
  self->_automaticallyStartsPlaying = a3;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (AVTPaddleViewDelegate)delegate
{
  return (AVTPaddleViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)videoViewContainer
{
  return self->_videoViewContainer;
}

- (void)setVideoViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_videoViewContainer, a3);
}

- (UIView)addButtonViewContainer
{
  return self->_addButtonViewContainer;
}

- (void)setAddButtonViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_addButtonViewContainer, a3);
}

- (AVTCircularButton)addButton
{
  return self->_addButton;
}

- (void)setAddButton:(id)a3
{
  objc_storeStrong((id *)&self->_addButton, a3);
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (AVPlayerViewController)videoController
{
  return self->_videoController;
}

- (void)setVideoController:(id)a3
{
  objc_storeStrong((id *)&self->_videoController, a3);
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeConstraints, a3);
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (AVTTouchDownGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (AVTTouchDownGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, a3);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (id)preCommitBlock
{
  return self->_preCommitBlock;
}

- (void)setPreCommitBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preCommitBlock, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_videoController, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_addButtonViewContainer, 0);
  objc_storeStrong((id *)&self->_videoViewContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
