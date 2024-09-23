@implementation CKTUConversationBalloonView

+ (BOOL)_shouldUseStackedLayout
{
  void *v2;
  char v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAccessibilityPreferredContentSizeCategory");

  return v3;
}

+ (BOOL)_shouldAlwaysHideSessionImageView
{
  void *v2;
  char v3;

  CKPreferredContentSizeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEB3C8]) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CEB3C0]);

  return v3;
}

- (CKTUConversationBalloonView)initWithFrame:(CGRect)a3
{
  CKTUConversationBalloonView *v3;
  CKTUConversationBalloonView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  CKAvatarView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CKTUConversationBalloonView;
  v3 = -[CKColoredBalloonView initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_state = 1;
    v5 = objc_alloc(MEMORY[0x1E0CEA658]);
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    objc_msgSend(v10, "setContentMode:", 2);
    -[CKTUConversationBalloonView addSubview:](v4, "addSubview:", v10);
    -[CKTUConversationBalloonView setSessionImageView:](v4, "setSessionImageView:", v10);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v6, v7, v8, v9);
    objc_msgSend(v11, "setContentMode:", 2);
    -[CKTUConversationBalloonView addSubview:](v4, "addSubview:", v11);
    -[CKTUConversationBalloonView setIconView:](v4, "setIconView:", v11);
    v12 = -[CKAvatarView initWithFrame:]([CKAvatarView alloc], "initWithFrame:", v6, v7, v8, v9);
    -[CKAvatarView setContentMode:](v12, "setContentMode:", 2);
    -[CKTUConversationBalloonView addSubview:](v4, "addSubview:", v12);
    -[CKTUConversationBalloonView setAvatarView:](v4, "setAvatarView:", v12);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v7, v8, v9);
    v14 = (void *)MEMORY[0x1E0DC1350];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tuConversationBalloonTitleFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "__ck_emphasizedFontFromFont:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v17);

    objc_msgSend(v13, "setLineBreakMode:", 4);
    objc_msgSend(v13, "setNumberOfLines:", 2);
    -[CKTUConversationBalloonView addSubview:](v4, "addSubview:", v13);
    -[CKTUConversationBalloonView setTitleLabel:](v4, "setTitleLabel:", v13);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v7, v8, v9);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tuConversationBalloonSubtitleFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFont:", v20);

    objc_msgSend(v18, "setLineBreakMode:", 4);
    objc_msgSend(v18, "setNumberOfLines:", 2);
    -[CKTUConversationBalloonView addSubview:](v4, "addSubview:", v18);
    -[CKTUConversationBalloonView setSubtitleLabel1:](v4, "setSubtitleLabel1:", v18);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v6, v7, v8, v9);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tuConversationBalloonSubtitleFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v23);

    objc_msgSend(v21, "setLineBreakMode:", 4);
    objc_msgSend(v21, "setNumberOfLines:", 2);
    -[CKTUConversationBalloonView addSubview:](v4, "addSubview:", v21);
    -[CKTUConversationBalloonView setSubtitleLabel2:](v4, "setSubtitleLabel2:", v21);
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addTarget:action:forControlEvents:", v4, sel__joinButtonTapped_, 64);
    if (CKIsRunningInMacCatalyst())
    {
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v4, sel_didHoverOverCell_);
      objc_msgSend(v24, "addGestureRecognizer:", v25);

    }
    -[CKTUConversationBalloonView addSubview:](v4, "addSubview:", v24);
    -[CKTUConversationBalloonView setJoinButton:](v4, "setJoinButton:", v24);
    -[CKBalloonView tapGestureRecognizer](v4, "tapGestureRecognizer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTUConversationBalloonView removeGestureRecognizer:](v4, "removeGestureRecognizer:", v26);

    -[CKBalloonView doubleTapGestureRecognizer](v4, "doubleTapGestureRecognizer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTUConversationBalloonView removeGestureRecognizer:](v4, "removeGestureRecognizer:", v27);

    -[CKBalloonView longPressGestureRecognizer](v4, "longPressGestureRecognizer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTUConversationBalloonView removeGestureRecognizer:](v4, "removeGestureRecognizer:", v28);

    -[CKTUConversationBalloonView setState:](v4, "setState:", 1);
    -[CKTUConversationBalloonView configureForCurrentStateWithLayoutPass:](v4, "configureForCurrentStateWithLayoutPass:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v4, sel__multiWayCallStateChanged_, *MEMORY[0x1E0D35410], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v4, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v4, sel_chatParticipantsChanged_, *MEMORY[0x1E0D35418], 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKTUConversationBalloonView;
  -[CKColoredBalloonView layoutSubviews](&v5, sel_layoutSubviews);
  if (!-[CKTUConversationBalloonView animating](self, "animating"))
  {
    -[CKTUConversationBalloonView bounds](self, "bounds");
    -[CKTUConversationBalloonView layoutSizeForSize:applyLayout:](self, "layoutSizeForSize:applyLayout:", 1, v3, v4);
  }
}

- (CGSize)layoutSizeForSize:(CGSize)a3 applyLayout:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double v8;
  double v9;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  if (objc_msgSend((id)objc_opt_class(), "_shouldUseStackedLayout"))
    -[CKTUConversationBalloonView stackedLayoutSizeForSize:applyLayout:](self, "stackedLayoutSizeForSize:applyLayout:", v4, width, height);
  else
    -[CKTUConversationBalloonView standardLayoutSizeForSize:applyLayout:](self, "standardLayoutSizeForSize:applyLayout:", v4, width, height);
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)_preferredSessionImageViewSize
{
  void *v3;
  char v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if ((v4 & 1) == 0 && (objc_msgSend((id)objc_opt_class(), "_shouldAlwaysHideSessionImageView") & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0D35818];
    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "activeTUConversationHasActivitySession:", v8);

    if ((_DWORD)v7)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tuConversationBalloonImageDimensions");
      v5 = v10;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tuConversationBalloonImageDimensions");
      v6 = v12;

    }
    else
    {
      -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
      v5 = v13;
      v6 = v14;
    }

  }
  v15 = v5;
  v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)_preferredJoinButtonSize
{
  void *v3;
  int v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[CKTUConversationBalloonView joinButton](self, "joinButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if (v4)
  {
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[CKTUConversationBalloonView joinButton](self, "joinButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
    v5 = v8;
    v6 = v9;

    if (!-[CKTUConversationBalloonView shouldRenderJoinButtonAsIcon](self, "shouldRenderJoinButtonAsIcon")
      || CKIsRunningInMacCatalyst())
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tuConversationBalloonJoinButtonMinWidth");
      v12 = v11;

      if (v5 < v12)
        v5 = v12;
    }
  }
  v13 = v5;
  v14 = v6;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)stackedLayoutSizeForSize:(CGSize)a3 applyLayout:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  char v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  char v47;
  double v48;
  double v49;
  void *v50;
  double MinY;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  double MinX;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double MaxY;
  double v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  void *v80;
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
  double y;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double rect;
  double v104;
  double v105;
  CGFloat v106;
  CGFloat v107;
  double v108;
  double v109;
  CGSize result;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;

  v4 = a4;
  v6 = -[CKTUConversationBalloonView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", a3.width, a3.height);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTUConversationBalloonView bounds](self, "bounds");
  -[CKTUConversationBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v106 = v9;
  v107 = v8;
  v11 = v10;
  -[CKTUConversationBalloonView _preferredSessionImageViewSize](self, "_preferredSessionImageViewSize");
  v104 = v12;
  v109 = v13;
  v14 = (void *)MEMORY[0x1E0CEA3A0];
  -[CKTUConversationBalloonView _textJoinButtonConfiguration](self, "_textJoinButtonConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "buttonWithConfiguration:primaryAction:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  objc_msgSend(v16, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), v17);
  -[CKTUConversationBalloonView setShouldRenderJoinButtonAsIcon:](self, "setShouldRenderJoinButtonAsIcon:", v18 > v11);
  -[CKTUConversationBalloonView configureJoinButton](self, "configureJoinButton");
  -[CKTUConversationBalloonView configureImageView](self, "configureImageView");
  -[CKTUConversationBalloonView _preferredJoinButtonSize](self, "_preferredJoinButtonSize");
  v20 = v19;
  v105 = v21;
  -[CKTUConversationBalloonView titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sizeThatFits:", v11, v17);
  v24 = v23;
  v26 = v25;

  -[CKTUConversationBalloonView subtitleLabel1](self, "subtitleLabel1");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sizeThatFits:", v11, v17);
  v29 = v28;
  v31 = v30;

  -[CKTUConversationBalloonView subtitleLabel2](self, "subtitleLabel2");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sizeThatFits:", v11, v17);
  v34 = v33;
  v36 = v35;

  if (v24 >= v29)
    v37 = v24;
  else
    v37 = v29;
  if (v37 < v34)
    v37 = v34;
  v100 = v20;
  v101 = v36;
  if (v37 >= v20)
    v38 = v37;
  else
    v38 = v20;
  v102 = v31;
  rect = v26;
  objc_msgSend(v7, "tuConversationBalloonContentTopPadding");
  v40 = v39;
  -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isHidden");

  if ((v42 & 1) == 0)
  {
    objc_msgSend(v7, "tuConversationBalloonContentBottomPadding");
    v40 = v109 + v40 + v43;
  }
  objc_msgSend(v7, "tuConversationBalloonContentBottomPadding");
  v45 = v26 + v31 + v36 + v40 + v44;
  -[CKTUConversationBalloonView joinButton](self, "joinButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "isHidden");

  if ((v47 & 1) == 0)
  {
    objc_msgSend(v7, "tuConversationBalloonContentBottomPadding");
    v45 = v105 + v45 + v48;
  }
  if (objc_msgSend((id)objc_opt_class(), "_shouldAlwaysHideSessionImageView"))
  {
    objc_msgSend(v7, "tuConversationBalloonContentBottomPadding");
    v45 = v45 + v49;
  }
  if (v4)
  {
    -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v50, "isHidden"))
    {
      v111.origin.y = v106;
      v111.origin.x = v107;
      v111.size.width = v11;
      v111.size.height = v45;
      MinY = CGRectGetMinY(v111);
    }
    else
    {
      objc_msgSend(v7, "tuConversationBalloonContentTopPadding");
      v53 = v52;
      v112.origin.y = v106;
      v112.origin.x = v107;
      v112.size.width = v11;
      v112.size.height = v45;
      MinY = v53 + CGRectGetMinY(v112);
    }

    v99 = v38;
    v55 = v106;
    v54 = v107;
    v56 = v11;
    v57 = v45;
    if (v6)
      MinX = CGRectGetMaxX(*(CGRect *)&v54) - v104;
    else
      MinX = CGRectGetMinX(*(CGRect *)&v54);
    -[CKTUConversationBalloonView sessionAccessoryView](self, "sessionAccessoryView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "frame");
    v61 = v60;
    v96 = v62;

    v113.origin.x = MinX;
    v113.origin.y = MinY;
    v113.size.width = v104;
    v113.size.height = v109;
    v94 = CGRectGetMaxX(v113) - v61;
    v114.origin.x = MinX;
    v114.origin.y = MinY;
    v114.size.width = v104;
    v114.size.height = v109;
    v97 = v61;
    v63 = CGRectGetMaxY(v114) - v61;
    v115.origin.x = MinX;
    v115.origin.y = MinY;
    v115.size.width = v104;
    v115.size.height = v109;
    MaxY = CGRectGetMaxY(v115);
    objc_msgSend(v7, "tuConversationBalloonContentBottomPadding");
    v98 = MaxY + v65;
    if (v6)
    {
      v116.origin.y = v106;
      v116.origin.x = v107;
      v116.size.width = v11;
      v116.size.height = v45;
      v66 = v99;
      v67 = CGRectGetMaxX(v116) - v99;
    }
    else
    {
      v117.origin.x = MinX;
      v117.origin.y = MinY;
      v117.size.width = v104;
      v117.size.height = v109;
      v67 = CGRectGetMinX(v117);
      v66 = v99;
    }
    v91 = v63 + 4.0;
    v92 = v94 + 4.0;
    v118.origin.x = v67;
    v118.origin.y = v98;
    v118.size.width = v66;
    v118.size.height = v26;
    v68 = CGRectGetMaxY(v118);
    v119.origin.x = v67;
    v119.origin.y = v68;
    v119.size.width = v66;
    v119.size.height = v102;
    v120.origin.y = CGRectGetMaxY(v119);
    v120.origin.x = v67;
    y = v120.origin.y;
    v120.size.width = v66;
    v120.size.height = v101;
    v69 = CGRectGetMaxY(v120);
    objc_msgSend(v7, "tuConversationBalloonContentBottomPadding");
    v95 = v69 + v70;
    if (v6)
    {
      v121.origin.y = v106;
      v121.origin.x = v107;
      v121.size.width = v11;
      v121.size.height = v45;
      v71 = v100;
      v108 = CGRectGetMaxX(v121) - v100;
      v72 = v104;
      v73 = v109;
    }
    else
    {
      v122.origin.x = MinX;
      v122.origin.y = MinY;
      v72 = v104;
      v122.size.width = v104;
      v73 = v109;
      v122.size.height = v109;
      v108 = CGRectGetMinX(v122);
      v71 = v100;
    }
    -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setFrame:", MinX, MinY, v72, v73);

    -[CKTUConversationBalloonView sessionAccessoryView](self, "sessionAccessoryView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setFrame:", v92, v91, v97, v96);

    -[CKTUConversationBalloonView titleLabel](self, "titleLabel");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setFrame:", v67, v98, v99, rect);

    -[CKTUConversationBalloonView subtitleLabel1](self, "subtitleLabel1");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setFrame:", v67, v68, v99, v102);

    -[CKTUConversationBalloonView subtitleLabel2](self, "subtitleLabel2");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v67;
    v38 = v99;
    objc_msgSend(v78, "setFrame:", v79, y, v99, v101);

    -[CKTUConversationBalloonView joinButton](self, "joinButton");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setFrame:", v108, v95, v71, v105);

  }
  -[CKColoredBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  v82 = v38 + v81;
  -[CKColoredBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  v84 = v82 + v83;
  -[CKColoredBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  v86 = v45 + v85;
  -[CKColoredBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  v88 = v86 + v87;

  v89 = v84;
  v90 = v88;
  result.height = v90;
  result.width = v89;
  return result;
}

- (CGSize)standardLayoutSizeForSize:(CGSize)a3 applyLayout:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  char v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  char v48;
  double v49;
  double v50;
  void *v51;
  char v52;
  double v53;
  void *v54;
  int v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  char v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  double v79;
  double v80;
  double v81;
  double MinX;
  double v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  CGFloat MaxY;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  uint64_t v103;
  double v104;
  double v105;
  double v106;
  CGFloat v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  uint64_t rect;
  double rect_8;
  double rect_16;
  double rect_16a;
  double rect_24;
  double rect_24a;
  CGSize result;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;

  v4 = a4;
  -[CKTUConversationBalloonView configureJoinButton](self, "configureJoinButton", a3.width, a3.height);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tuConversationBalloonContentMinHeight");
  v8 = v7;
  -[CKTUConversationBalloonView bounds](self, "bounds");
  -[CKTUConversationBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  rect = v9;
  rect_24 = v10;
  v12 = v11;
  v13 = -[CKTUConversationBalloonView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v14 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  -[CKTUConversationBalloonView titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeThatFits:", v14, v15);
  v18 = v17;

  -[CKTUConversationBalloonView subtitleLabel1](self, "subtitleLabel1");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeThatFits:", v14, v15);
  v21 = v20;

  -[CKTUConversationBalloonView subtitleLabel2](self, "subtitleLabel2");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sizeThatFits:", v14, v15);
  v24 = v23;

  if (v18 >= v21)
    v25 = v18;
  else
    v25 = v21;
  if (v25 >= v24)
    v26 = v25;
  else
    v26 = v24;
  v27 = (void *)MEMORY[0x1E0CEA3A0];
  -[CKTUConversationBalloonView _textJoinButtonConfiguration](self, "_textJoinButtonConfiguration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "buttonWithConfiguration:primaryAction:", v28, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "sizeThatFits:", v14, v15);
  v31 = v30;
  objc_msgSend(v6, "tuConversationBalloonJoinButtonMaxWidth");
  -[CKTUConversationBalloonView setShouldRenderJoinButtonAsIcon:](self, "setShouldRenderJoinButtonAsIcon:", v31 > v32);
  -[CKTUConversationBalloonView configureJoinButton](self, "configureJoinButton");
  -[CKTUConversationBalloonView configureImageView](self, "configureImageView");
  -[CKTUConversationBalloonView _preferredSessionImageViewSize](self, "_preferredSessionImageViewSize");
  v34 = v33;
  rect_16 = v35;
  -[CKTUConversationBalloonView _preferredJoinButtonSize](self, "_preferredJoinButtonSize");
  v37 = v36;
  rect_8 = v38;
  objc_msgSend(v6, "tuConversationBalloonLabelLeadingPadding");
  v40 = v39;
  -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isHidden");

  if ((v42 & 1) != 0)
  {
    v43 = 0.0;
  }
  else
  {
    v43 = v34 + 0.0;
    objc_msgSend(v6, "tuConversationBalloonSessionImageTrailingPadding");
    v40 = v44;
  }
  objc_msgSend(v6, "tuConversationBalloonLabelTrailingPadding");
  v46 = v45 + v26 + v40 + v43;
  -[CKTUConversationBalloonView joinButton](self, "joinButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isHidden");

  if ((v48 & 1) == 0)
  {
    objc_msgSend(v6, "tuConversationBalloonJoinButtonLeadingPadding");
    v46 = v37 + v46 + v49;
  }
  if (v46 >= v12)
    v50 = v12;
  else
    v50 = v46;
  -[CKTUConversationBalloonView joinButton](self, "joinButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "isHidden");

  if ((v52 & 1) == 0)
  {
    if (-[CKTUConversationBalloonView shouldRenderJoinButtonAsIcon](self, "shouldRenderJoinButtonAsIcon"))
      objc_msgSend(v6, "tuConversationBalloonContentCompressedMinWidth");
    else
      objc_msgSend(v6, "tuConversationBalloonContentStandardMinWidth");
    if (v50 < v53)
      v50 = v53;
  }
  -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "isHidden");

  v136 = v40;
  if (v55)
    v56 = v50;
  else
    v56 = v50 - v34 - v40;
  objc_msgSend(v6, "tuConversationBalloonLabelTrailingPadding");
  v58 = v56 - v57;
  -[CKTUConversationBalloonView joinButton](self, "joinButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "isHidden");

  v139 = v37;
  if ((v60 & 1) == 0)
  {
    objc_msgSend(v6, "tuConversationBalloonJoinButtonLeadingPadding");
    v58 = v58 - v61 - v37;
  }
  -[CKTUConversationBalloonView titleLabel](self, "titleLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "sizeThatFits:", v58, 1.79769313e308);
  v64 = v63;

  -[CKTUConversationBalloonView subtitleLabel1](self, "subtitleLabel1");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "sizeThatFits:", v58, 1.79769313e308);
  v67 = v66;

  -[CKTUConversationBalloonView subtitleLabel2](self, "subtitleLabel2");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "sizeThatFits:", v58, 1.79769313e308);
  v70 = v69;

  v134 = v67;
  v135 = v70;
  v140 = v64;
  v71 = v64 + v67 + v70;
  if (v71 >= rect_16)
    v72 = v71;
  else
    v72 = rect_16;
  objc_msgSend(v6, "tuConversationBalloonContentTopPadding");
  v74 = v73 + v72;
  objc_msgSend(v6, "tuConversationBalloonContentBottomPadding");
  v76 = v75 + v74;
  if (v76 >= v8)
    v8 = v76;
  if (v4)
  {
    v138 = v34;
    v132 = v50;
    v77 = rect_24 + floor((v8 - rect_16) * 0.5);
    v133 = v12;
    v78 = rect;
    v79 = rect_24;
    v80 = v12;
    v81 = v8;
    if (v13)
      MinX = CGRectGetMaxX(*(CGRect *)&v78) - v34;
    else
      MinX = CGRectGetMinX(*(CGRect *)&v78);
    v83 = v8;
    -[CKTUConversationBalloonView sessionAccessoryView](self, "sessionAccessoryView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "frame");
    v86 = v85;
    v129 = v87;

    v148.origin.x = MinX;
    v148.origin.y = v77;
    v148.size.width = v34;
    v88 = rect_16;
    v148.size.height = rect_16;
    v126 = CGRectGetMaxX(v148) - v86;
    v149.origin.x = MinX;
    v149.origin.y = v77;
    v149.size.width = v34;
    v149.size.height = rect_16;
    MaxY = CGRectGetMaxY(v149);
    v90 = v77;
    v130 = v86;
    v91 = MaxY - v86;
    v92 = rect_24 + floor((v83 - v71) * 0.5);
    v8 = v83;
    v131 = v90;
    v128 = MinX;
    v93 = MinX;
    v94 = v34;
    v95 = rect_16;
    if (v13)
      v96 = CGRectGetMinX(*(CGRect *)&v93) - v136 - v58;
    else
      v96 = v136 + CGRectGetMaxX(*(CGRect *)&v93);
    v125 = v126 + 4.0;
    v150.origin.x = v96;
    rect_16a = v92;
    v150.origin.y = v92;
    v150.size.width = v58;
    v150.size.height = v140;
    v97 = CGRectGetMaxY(v150);
    objc_msgSend(v6, "tuConversationBalloonInteritemSpacing");
    v99 = v97 + v98;
    v151.origin.x = v96;
    v151.origin.y = v99;
    v151.size.width = v58;
    v151.size.height = v134;
    v100 = CGRectGetMaxY(v151);
    objc_msgSend(v6, "tuConversationBalloonInteritemSpacing");
    v127 = v100 + v101;
    v102 = rect_24;
    v137 = rect_24 + floor((v8 - rect_8) * 0.5);
    v103 = rect;
    v104 = v133;
    v105 = v8;
    if (v13)
    {
      rect_24a = CGRectGetMinX(*(CGRect *)&v103);
      v106 = v139;
    }
    else
    {
      v106 = v139;
      v107 = CGRectGetMaxX(*(CGRect *)&v103) - v139;
      objc_msgSend(v6, "tuConversationBalloonJoinButtonTrailingPadding");
      rect_24a = v107 - v108;
    }
    -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setFrame:", v128, v131, v138, v88);

    -[CKTUConversationBalloonView sessionAccessoryView](self, "sessionAccessoryView");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setFrame:", v125, v91 + 4.0, v130, v129);

    -[CKTUConversationBalloonView titleLabel](self, "titleLabel");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setFrame:", v96, rect_16a, v58, v140);

    -[CKTUConversationBalloonView subtitleLabel1](self, "subtitleLabel1");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setFrame:", v96, v99, v58, v134);

    -[CKTUConversationBalloonView subtitleLabel2](self, "subtitleLabel2");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setFrame:", v96, v127, v58, v135);

    -[CKTUConversationBalloonView joinButton](self, "joinButton");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setFrame:", rect_24a, v137, v106, rect_8);

    v50 = v132;
  }
  -[CKColoredBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  v116 = v50 + v115;
  -[CKColoredBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  v118 = v116 + v117;
  -[CKColoredBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  v120 = v8 + v119;
  -[CKColoredBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  v122 = v120 + v121;

  v123 = v118;
  v124 = v122;
  result.height = v124;
  result.width = v123;
  return result;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTUConversationBalloonView;
  -[CKColoredBalloonView prepareForReuse](&v3, sel_prepareForReuse);
  -[CKTUConversationBalloonView setAnimating:](self, "setAnimating:", 0);
}

- (void)prepareForDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTUConversationBalloonView;
  -[CKColoredBalloonView prepareForDisplay](&v3, sel_prepareForDisplay);
  -[CKTUConversationBalloonView configureForCurrentStateWithLayoutPass:](self, "configureForCurrentStateWithLayoutPass:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKTUConversationBalloonView configureForCurrentStateWithLayoutPass:](self, "configureForCurrentStateWithLayoutPass:", 0);
  -[CKTUConversationBalloonView layoutSizeForSize:applyLayout:](self, "layoutSizeForSize:applyLayout:", 0, width, height);
  result.height = v8;
  result.width = v7;
  return result;
}

- (char)color
{
  if (-[CKTUConversationBalloonView conversationAVMode](self, "conversationAVMode"))
    return 7;
  else
    return -1;
}

- (void)setOrientation:(char)a3
{
  self->_orientation = a3;
}

- (void)setTuConversationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_tuConversationUUID, a3);
}

- (unint64_t)conversationAVMode
{
  void *v3;
  void *v4;
  uint64_t conversationAVMode;

  -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    conversationAVMode = objc_msgSend(v3, "avMode");
  else
    conversationAVMode = self->_conversationAVMode;

  return conversationAVMode;
}

- (BOOL)wantsGradient
{
  return 0;
}

- (id)tuConversation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTUConversationBalloonView tuConversationUUID](self, "tuConversationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingConversationForTelephonyConversationUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)configureForCurrentState
{
  -[CKTUConversationBalloonView configureForCurrentStateWithLayoutPass:](self, "configureForCurrentStateWithLayoutPass:", 1);
}

- (void)configureForCurrentStateWithLayoutPass:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTUConversationBalloonView setState:](self, "setState:", +[CKTUConversationViewUtilities ckTUConversationStateForTUConversation:](CKTUConversationViewUtilities, "ckTUConversationStateForTUConversation:", v5));

  -[CKTUConversationBalloonView configureImageView](self, "configureImageView");
  -[CKTUConversationBalloonView configureSessionAccessoryView](self, "configureSessionAccessoryView");
  -[CKTUConversationBalloonView configureTitle](self, "configureTitle");
  -[CKTUConversationBalloonView configureSubtitle1](self, "configureSubtitle1");
  -[CKTUConversationBalloonView configureSubtitle2](self, "configureSubtitle2");
  -[CKTUConversationBalloonView configureJoinButton](self, "configureJoinButton");
  if (v3)
  {
    -[CKTUConversationBalloonView setNeedsLayout](self, "setNeedsLayout");
    -[CKTUConversationBalloonView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (BOOL)_shouldShowSessionView
{
  void *v4;
  void *v5;

  if ((objc_msgSend((id)objc_opt_class(), "_shouldAlwaysHideSessionImageView") & 1) != 0)
    return 0;
  if (!-[CKTUConversationBalloonView _shouldShowJoinButton](self, "_shouldShowJoinButton")
    || !-[CKTUConversationBalloonView shouldRenderJoinButtonAsIcon](self, "shouldRenderJoinButtonAsIcon"))
  {
    return 1;
  }
  v4 = (void *)MEMORY[0x1E0D35818];
  -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "activeTUConversationHasActivitySession:", v5);

  return (char)v4;
}

- (void)configureImageView
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[CKTUConversationBalloonView _shouldShowSessionView](self, "_shouldShowSessionView");
  -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setHidden:", 0);

    v5 = (void *)MEMORY[0x1E0D35818];
    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "activeTUConversationHasActivitySession:", v6);

    if ((_DWORD)v5)
      -[CKTUConversationBalloonView formatImageViewForActivity](self, "formatImageViewForActivity");
    else
      -[CKTUConversationBalloonView formatImageViewForFaceTime](self, "formatImageViewForFaceTime");
  }
  else
  {
    objc_msgSend(v4, "setHidden:", 1);

  }
}

- (void)configureIconView
{
  unint64_t state;
  BOOL v3;
  unint64_t v4;

  state = self->_state;
  v3 = state >= 3;
  v4 = state - 3;
  if (v3)
  {
    if (v4 < 2)
      -[CKTUConversationBalloonView formatIconViewForActivity](self, "formatIconViewForActivity");
  }
  else
  {
    -[CKTUConversationBalloonView formatIconViewForFaceTime](self, "formatIconViewForFaceTime");
  }
}

- (void)configureSessionAccessoryView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CKTUConversationBalloonView sessionAccessoryView](self, "sessionAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)MEMORY[0x1E0D35818];
  -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isScreenShareActivityForTUConversation:", v5);

  if ((_DWORD)v4)
  {
    -[CKTUConversationBalloonView avatarView](self, "avatarView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D35818];
    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "activeTUConversationHasActivitySession:", v8);

    if (!(_DWORD)v7)
      return;
    -[CKTUConversationBalloonView configureIconView](self, "configureIconView");
    -[CKTUConversationBalloonView iconView](self, "iconView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;
  -[CKTUConversationBalloonView setSessionAccessoryView:](self, "setSessionAccessoryView:", v6);

  -[CKTUConversationBalloonView sessionAccessoryView](self, "sessionAccessoryView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CKTUConversationBalloonView addSubview:](self, "addSubview:", v10);

}

- (void)configureTitle
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t state;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = -[CKTUConversationBalloonView conversationAVMode](self, "conversationAVMode");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "multiwayTitleTextColor");
  else
    objc_msgSend(v5, "sharePlayTitleTextColor");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[CKTUConversationBalloonView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v18);

  state = self->_state;
  if (state - 1 < 2)
  {
    -[CKTUConversationBalloonView titleLabel](self, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities activityTitleForTUConversation:](CKTUConversationViewUtilities, "activityTitleForTUConversation:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v17 = (void *)v16;
    objc_msgSend(v12, "setText:", v16);

LABEL_14:
    goto LABEL_15;
  }
  if (state - 3 < 2)
  {
    v9 = (void *)MEMORY[0x1E0D35818];
    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isScreenShareActivityForTUConversation:", v10);

    -[CKTUConversationBalloonView titleLabel](self, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v11)
      v15 = CFSTR("EXPANSE_SCREENSHARE_DEFAULT");
    else
      v15 = CFSTR("EXPANSE_DEFAULT");
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E276D870, CFSTR("ChatKit"));
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!state)
  {
    -[CKTUConversationBalloonView titleLabel](self, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities titleForAVMode:](CKTUConversationViewUtilities, "titleForAVMode:", -[CKTUConversationBalloonView conversationAVMode](self, "conversationAVMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v14);
    goto LABEL_14;
  }
LABEL_15:

}

- (id)subtitleColor
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = -[CKTUConversationBalloonView conversationAVMode](self, "conversationAVMode");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
    objc_msgSend(v4, "multiwayCaptionTextColor");
  else
    objc_msgSend(v4, "sharePlayCaptionTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)configureSubtitle1
{
  void *v3;
  void *v4;
  unint64_t state;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  id v16;

  -[CKTUConversationBalloonView subtitleColor](self, "subtitleColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTUConversationBalloonView subtitleLabel1](self, "subtitleLabel1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  state = self->_state;
  if (state - 1 < 2)
  {
    -[CKTUConversationBalloonView subtitleLabel1](self, "subtitleLabel1");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities joinStateStatusStringForTUConversation:](CKTUConversationViewUtilities, "joinStateStatusStringForTUConversation:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v9 = (void *)v10;
    objc_msgSend(v16, "setText:", v10);
LABEL_15:

    return;
  }
  if (state - 3 < 2)
  {
    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities activityTitleForTUConversation:](CKTUConversationViewUtilities, "activityTitleForTUConversation:", v6);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities activityTextForTUConversation:](CKTUConversationViewUtilities, "activityTextForTUConversation:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKTUConversationBalloonView subtitleLabel1](self, "subtitleLabel1");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ ⋅ %@"), v16, v8);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v16, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v14);

    goto LABEL_15;
  }
  if (!state)
  {
    v11 = -[CKTUConversationBalloonView conversationAVMode](self, "conversationAVMode");
    -[CKTUConversationBalloonView subtitleLabel1](self, "subtitleLabel1");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if (v11)
      v13 = CFSTR("CALL_ENDED");
    else
      v13 = CFSTR("ENDED");
    objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("ChatKit"));
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
}

- (void)configureSubtitle2
{
  void *v3;
  void *v4;
  unint64_t state;
  BOOL v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[CKTUConversationBalloonView subtitleColor](self, "subtitleColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTUConversationBalloonView subtitleLabel2](self, "subtitleLabel2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  state = self->_state;
  v6 = state >= 3;
  v7 = state - 3;
  if (v6)
  {
    if (v7 >= 2)
      return;
    -[CKTUConversationBalloonView subtitleLabel2](self, "subtitleLabel2");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

    -[CKTUConversationBalloonView subtitleLabel2](self, "subtitleLabel2");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities joinStateStatusStringForTUConversation:](CKTUConversationViewUtilities, "joinStateStatusStringForTUConversation:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

  }
  else
  {
    -[CKTUConversationBalloonView subtitleLabel2](self, "subtitleLabel2");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

    -[CKTUConversationBalloonView subtitleLabel2](self, "subtitleLabel2");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", 0);
  }

}

- (void)configureJoinButton
{
  unint64_t state;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  state = self->_state;
  if (state <= 4)
  {
    if (((1 << state) & 0x15) != 0)
    {
      -[CKTUConversationBalloonView joinButton](self, "joinButton");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 1);
    }
    else
    {
      -[CKTUConversationBalloonView joinButton](self, "joinButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHidden:", 0);

      -[CKTUConversationBalloonView joinButton](self, "joinButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("JOIN"), &stru_1E276D870, CFSTR("ChatKit"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAccessibilityLabel:", v7);

      if (-[CKTUConversationBalloonView shouldRenderJoinButtonAsIcon](self, "shouldRenderJoinButtonAsIcon"))
        -[CKTUConversationBalloonView _iconJoinButtonConfiguration](self, "_iconJoinButtonConfiguration");
      else
        -[CKTUConversationBalloonView _textJoinButtonConfiguration](self, "_textJoinButtonConfiguration");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[CKTUConversationBalloonView joinButton](self, "joinButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setConfiguration:", v9);

    }
  }
}

- (BOOL)_shouldShowJoinButton
{
  return ((self->_state - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)_textJoinButtonConfiguration
{
  int v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = CKIsRunningInMacCatalyst();
  objc_msgSend(MEMORY[0x1E0CEA3A8], "filledButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setMacIdiomStyle:", 1);
  }
  else
  {
    objc_msgSend(v4, "setButtonSize:", 1);
    objc_msgSend(v5, "setCornerStyle:", 4);
  }
  v6 = objc_msgSend((id)objc_opt_class(), "_shouldUseStackedLayout");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "tuConversationBalloonContentStackedLayoutJoinButtonInsets");
  else
    objc_msgSend(v7, "tuConversationBalloonContentStandardLayoutJoinButtonInsets");
  objc_msgSend(v5, "setContentInsets:");

  -[CKTUConversationBalloonView _joinButtonText](self, "_joinButtonText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v9);
  v11 = *MEMORY[0x1E0DC1138];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tuConversationBalloonActionButtonFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAttribute:value:range:", v11, v13, 0, objc_msgSend(v9, "length"));

  objc_msgSend(v5, "setAttributedTitle:", v10);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "theme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "multiwayButtonColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBaseBackgroundColor:", v16);

  return v5;
}

- (id)_iconJoinButtonConfiguration
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  double v28;

  v3 = (void *)MEMORY[0x1E0D35818];
  -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "conversationIsVideoCall:", v4);

  v6 = (void *)MEMORY[0x1E0D35818];
  -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "conversationIsAVLessSharePlay:", v7);

  v9 = *MEMORY[0x1E0CEB580];
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CEA3A8], "filledButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMacIdiomStyle:", 1);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "theme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "multiwayButtonColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBaseBackgroundColor:", v13);

    v14 = CFSTR("phone.fill");
    if (v5)
      v14 = CFSTR("video.fill");
    if (v8)
      v14 = CFSTR("shareplay");
    v15 = v14;
    v16 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", v9, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "systemImageNamed:withConfiguration:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "imageWithRenderingMode:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageWithTintColor:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = CFSTR("phone.circle.fill");
  if (v5)
    v22 = CFSTR("video.circle.fill");
  v23 = (void *)MEMORY[0x1E0CEA638];
  v24 = (void *)MEMORY[0x1E0CEA650];
  v25 = v22;
  objc_msgSend(v24, "configurationWithTextStyle:scale:", v9, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "systemImageNamed:withConfiguration:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "imageWithRenderingMode:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v20, "size");
    -[CKTUConversationBalloonView _sharePlayImageWithDiameter:](self, "_sharePlayImageWithDiameter:", v28);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_11:

    v20 = (void *)v21;
  }
  objc_msgSend(v10, "setImage:", v20);
  objc_msgSend(v10, "setContentInsets:", *MEMORY[0x1E0CEA080], *(double *)(MEMORY[0x1E0CEA080] + 8), *(double *)(MEMORY[0x1E0CEA080] + 16), *(double *)(MEMORY[0x1E0CEA080] + 24));

  return v10;
}

- (id)_sharePlayImageWithDiameter:(double)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", a3, a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CKTUConversationBalloonView__sharePlayImageWithDiameter___block_invoke;
  v7[3] = &__block_descriptor_40_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v7[4] = a3;
  objc_msgSend(v4, "imageWithActions:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __59__CKTUConversationBalloonView__sharePlayImageWithDiameter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  CGContext *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;
  CGRect v13;

  v3 = (void *)MEMORY[0x1E0CEA478];
  v4 = a2;
  objc_msgSend(v3, "systemGreenColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFill");

  v6 = (CGContext *)objc_msgSend(v4, "CGContext");
  v13.size.width = *(CGFloat *)(a1 + 32);
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.height = v13.size.width;
  CGContextFillEllipseInRect(v6, v13);
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("shareplay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "size");
  v10 = v9;
  objc_msgSend(v12, "size");
  objc_msgSend(v12, "drawInRect:", (*(double *)(a1 + 32) - v10 / v11 * (*(double *)(a1 + 32) * 0.43)) * 0.5, (*(double *)(a1 + 32) - *(double *)(a1 + 32) * 0.43) * 0.5 + *(double *)(a1 + 32) * 0.43 * -0.16);

}

- (void)formatImageViewForFaceTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (-[CKTUConversationBalloonView conversationAVMode](self, "conversationAVMode"))
  {
    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities faceTimeIconForTUConversation:](CKTUConversationViewUtilities, "faceTimeIconForTUConversation:", v3);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  }
  else
  {
    +[CKTUConversationViewUtilities sharePlayIcon](CKTUConversationViewUtilities, "sharePlayIcon");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v15);

  -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v8 = v7;
  objc_msgSend(v15, "size");
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v8, v9);

  -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", 0);

  -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v4);

  -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setCornerRadius:", 0.0);

  -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClipsToBounds:", 1);

  -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentMode:", 4);

}

- (void)formatImageViewForActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  if (-[CKTUConversationBalloonView isUnknownSender](self, "isUnknownSender"))
  {
    -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHidden:", 1);
  }
  else
  {
    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKTUConversationViewUtilities activityImageForTUConversation:](CKTUConversationViewUtilities, "activityImageForTUConversation:", v3);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tuConversationBalloonImageDimensions");
      +[CKTUConversationViewUtilities activityIconForTUConversation:iconSize:](CKTUConversationViewUtilities, "activityIconForTUConversation:iconSize:", v4);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v22);

    v7 = (void *)MEMORY[0x1E0D35818];
    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isScreenShareActivityForTUConversation:", v8);

    -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkGrayColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v12);

      -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v13 = 4;
    }
    else
    {
      v13 = 2;
    }
    objc_msgSend(v10, "setContentMode:", v13);

    -[CKTUConversationBalloonView imageViewSize](self, "imageViewSize");
    v15 = v14;
    v17 = v16;
    -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBounds:", 0.0, 0.0, v15, v17);

    -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setCornerRadius:", 5.0);

    -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setClipsToBounds:", 1);

    -[CKTUConversationBalloonView sessionImageView](self, "sessionImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 0);

  }
}

- (id)_currentCall
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAudioAndVideoCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "activeConversationForCall:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "isEqual:", v14);

        if (v15)
        {
          v16 = v9;

          v6 = v16;
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_joinButtonTapped:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CKBalloonView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKBalloonView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tuConversationBalloonJoinButtonTapped:", self);

  }
}

- (id)_joinButtonText
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("JOIN"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (CKIsRunningUnitTests())
  {
    -[CKTUConversationBalloonView joinButtonText_TestingOverride](self, "joinButtonText_TestingOverride");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CKTUConversationBalloonView joinButtonText_TestingOverride](self, "joinButtonText_TestingOverride");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
  }
  return v4;
}

- (BOOL)joinButtonIsShowingImageContent
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CKTUConversationBalloonView joinButton](self, "joinButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)joinButtonIsShowingTextContent
{
  void *v2;
  void *v3;

  -[CKTUConversationBalloonView joinButton](self, "joinButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (CGSize)imageViewSize
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationBalloonImageDimensions");
  v4 = v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccessibilityPreferredContentSizeCategory");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB558]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scaledValueForValue:", v4);
    v4 = v8;

  }
  v9 = v4;
  v10 = v4;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)joinButtonRenderedAsIconSize
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationBalloonButtonAsIconSize");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB580]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValueForValue:", v4);
  v7 = v6;

  v8 = v7;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (CGSize)appIconSize
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationBalloonIconDimensions");
  v4 = v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccessibilityPreferredContentSizeCategory");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB558]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scaledValueForValue:", v4);
    v4 = v8;

  }
  v9 = v4;
  v10 = v4;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)formatIconViewForFaceTime
{
  void *v3;
  id v4;

  -[CKTUConversationBalloonView iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[CKTUConversationBalloonView avatarView](self, "avatarView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)formatIconViewForActivity
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if ((objc_msgSend((id)objc_opt_class(), "_shouldUseStackedLayout") & 1) == 0)
  {
    -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[CKTUConversationViewUtilities activityHasImageForTUConversation:](CKTUConversationViewUtilities, "activityHasImageForTUConversation:", v3);

    if (v4)
    {
      -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(MEMORY[0x1E0D35818], "isScreenShareActivityForTUConversation:"))
      {
        if (!-[CKTUConversationBalloonView isUnknownSender](self, "isUnknownSender"))
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "tuConversationBalloonIconDimensions");
          +[CKTUConversationViewUtilities activityIconForTUConversation:iconSize:](CKTUConversationViewUtilities, "activityIconForTUConversation:iconSize:", v17);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          if (v6)
          {
            +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "tuConversationBalloonIconDimensions");
            v10 = v9;

            -[CKTUConversationBalloonView iconView](self, "iconView");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setHidden:", objc_msgSend(MEMORY[0x1E0D35818], "isScreenShareActivityForTUConversation:", v17));

            -[CKTUConversationBalloonView iconView](self, "iconView");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setContentMode:", 1);

            -[CKTUConversationBalloonView iconView](self, "iconView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setImage:", v6);

            -[CKTUConversationBalloonView iconView](self, "iconView");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setBounds:", 0.0, 0.0, v10, v10);

            -[CKTUConversationBalloonView iconView](self, "iconView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setBackgroundColor:", 0);
          }
          else
          {
            -[CKTUConversationBalloonView iconView](self, "iconView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setHidden:", 1);
          }

          -[CKTUConversationBalloonView avatarView](self, "avatarView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setHidden:", 1);

          goto LABEL_12;
        }
        -[CKTUConversationBalloonView iconView](self, "iconView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setHidden:", 1);

      }
      -[CKTUConversationBalloonView avatarView](self, "avatarView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHidden:", 1);
LABEL_12:

      goto LABEL_13;
    }
  }
  -[CKTUConversationBalloonView iconView](self, "iconView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", 1);
LABEL_13:

}

- (void)_multiWayCallStateChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D35408]);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingConversationForTelephonyConversationUUID:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTUConversationBalloonView tuConversation](self, "tuConversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
    -[CKTUConversationBalloonView configureForCurrentState](self, "configureForCurrentState");

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  -[CKTUConversationBalloonView setNeedsLayout](self, "setNeedsLayout", a3);
  -[CKTUConversationBalloonView layoutIfNeeded](self, "layoutIfNeeded");
}

- (char)orientation
{
  return self->_orientation;
}

- (void)setConversationAVMode:(unint64_t)a3
{
  self->_conversationAVMode = a3;
}

- (NSUUID)tuConversationUUID
{
  return self->_tuConversationUUID;
}

- (BOOL)isUnknownSender
{
  return self->_unknownSender;
}

- (void)setUnknownSender:(BOOL)a3
{
  self->_unknownSender = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (UIImageView)sessionImageView
{
  return self->_sessionImageView;
}

- (void)setSessionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_sessionImageView, a3);
}

- (UIView)sessionAccessoryView
{
  return self->_sessionAccessoryView;
}

- (void)setSessionAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_sessionAccessoryView, a3);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel1
{
  return self->_subtitleLabel1;
}

- (void)setSubtitleLabel1:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel1, a3);
}

- (UILabel)subtitleLabel2
{
  return self->_subtitleLabel2;
}

- (void)setSubtitleLabel2:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel2, a3);
}

- (UIButton)joinButton
{
  return self->_joinButton;
}

- (void)setJoinButton:(id)a3
{
  objc_storeStrong((id *)&self->_joinButton, a3);
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)shouldRenderJoinButtonAsIcon
{
  return self->_shouldRenderJoinButtonAsIcon;
}

- (void)setShouldRenderJoinButtonAsIcon:(BOOL)a3
{
  self->_shouldRenderJoinButtonAsIcon = a3;
}

- (NSString)joinButtonText_TestingOverride
{
  return self->_joinButtonText_TestingOverride;
}

- (void)setJoinButtonText_TestingOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 824);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinButtonText_TestingOverride, 0);
  objc_storeStrong((id *)&self->_joinButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel2, 0);
  objc_storeStrong((id *)&self->_subtitleLabel1, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_sessionAccessoryView, 0);
  objc_storeStrong((id *)&self->_sessionImageView, 0);
  objc_storeStrong((id *)&self->_tuConversationUUID, 0);
}

- (void)configureForTUConversationChatItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[CKTUConversationBalloonView setOrientation:](self, "setOrientation:", objc_msgSend(v4, "balloonOrientation"));
  -[CKColoredBalloonView setHasTail:](self, "setHasTail:", objc_msgSend(v4, "hasTail"));
  objc_msgSend(v4, "textAlignmentInsets");
  -[CKBalloonView setTextAlignmentInsets:](self, "setTextAlignmentInsets:");
  -[CKBalloonView setBalloonCorners:](self, "setBalloonCorners:", objc_msgSend(v4, "balloonCorners"));
  -[CKBalloonView setBalloonStyle:](self, "setBalloonStyle:", 0);
  -[CKColoredBalloonView setColor:](self, "setColor:", objc_msgSend(v4, "color"));
  objc_msgSend(v4, "tuConversationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTUConversationBalloonView setTuConversationUUID:](self, "setTuConversationUUID:", v5);

  -[CKTUConversationBalloonView setUnknownSender:](self, "setUnknownSender:", objc_msgSend(v4, "isSenderUnknown"));
  v6 = objc_msgSend(v4, "conversationAVMode");

  -[CKTUConversationBalloonView setConversationAVMode:](self, "setConversationAVMode:", v6);
}

@end
