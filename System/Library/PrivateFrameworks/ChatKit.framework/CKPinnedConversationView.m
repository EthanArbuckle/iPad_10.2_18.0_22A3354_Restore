@implementation CKPinnedConversationView

- (CKPinnedConversationView)init
{
  return -[CKPinnedConversationView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (CKPinnedConversationView)initWithFrame:(CGRect)a3
{
  CKPinnedConversationView *v3;
  CKPinnedConversationView *v4;
  CKAvatarView *v5;
  CKAvatarView *avatarView;
  CKLabel *v7;
  CKLabel *titleLabel;
  UIImageView *v9;
  UIImageView *unreadIndicator;
  UIImageView *v11;
  UIImageView *radiantShadowImageView;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKPinnedConversationView;
  v3 = -[CKPinnedConversationView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_preferShortConversationName = 1;
    v5 = objc_alloc_init(CKAvatarView);
    avatarView = v4->_avatarView;
    v4->_avatarView = v5;

    v7 = objc_alloc_init(CKLabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v7;

    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    unreadIndicator = v4->_unreadIndicator;
    v4->_unreadIndicator = v9;

    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    radiantShadowImageView = v4->_radiantShadowImageView;
    v4->_radiantShadowImageView = v11;

    v4->_activityItemTopInset = 0.0;
    -[CKPinnedConversationView addSubview:](v4, "addSubview:", v4->_avatarView);
    -[CKPinnedConversationView addSubview:](v4, "addSubview:", v4->_titleLabel);
    -[CKPinnedConversationView addSubview:](v4, "addSubview:", v4->_unreadIndicator);
    -[CKPinnedConversationView addSubview:](v4, "addSubview:", v4->_radiantShadowImageView);
    -[CKPinnedConversationView _updateTitleLabelFont](v4, "_updateTitleLabelFont");
    -[CKPinnedConversationView _updateTitleLabelColor](v4, "_updateTitleLabelColor");
    -[CKLabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    -[CKLabel setAllowsDefaultTighteningForTruncation:](v4->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UIImageView setHidden:](v4->_unreadIndicator, "setHidden:", 1);
    -[CNAvatarView setAsynchronousRendering:](v4->_avatarView, "setAsynchronousRendering:", 1);
    -[CKAvatarView setUserInteractionEnabled:](v4->_avatarView, "setUserInteractionEnabled:", 0);
    -[CNAvatarView setShowsContactOnTap:](v4->_avatarView, "setShowsContactOnTap:", 0);
    -[CNAvatarView setDelegate:](v4->_avatarView, "setDelegate:", v4);
    -[CNAvatarView setThreeDTouchEnabled:](v4->_avatarView, "setThreeDTouchEnabled:", 0);
    -[UIImageView setContentMode:](v4->_radiantShadowImageView, "setContentMode:", 2);
    -[CKPinnedConversationView _updateRadiantShadowAffineTranform](v4, "_updateRadiantShadowAffineTranform");
    -[CKPinnedConversationView _updateRadiantShadowImageView](v4, "_updateRadiantShadowImageView");
    -[UIImageView layer](v4->_radiantShadowImageView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShouldRasterize:", 1);

    -[UIImageView layer](v4->_radiantShadowImageView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRasterizationScale:", 0.5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v4, sel_contentSizeCategoryChanged_, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v4;
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    if (-[CKPinnedConversationView _activityIsSuppressedForLayoutStyle:](self, "_activityIsSuppressedForLayoutStyle:"))
      -[CKPinnedConversationView beginSuppressingActivityWithReason:animated:completion:](self, "beginSuppressingActivityWithReason:animated:completion:", CFSTR("LayoutStyle"), 0, 0);
    else
      -[CKPinnedConversationView endSuppressingActivityWithReason:animated:completion:](self, "endSuppressingActivityWithReason:animated:completion:", CFSTR("LayoutStyle"), 0, 0);
    -[CKPinnedConversationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowsLiveActivity:(BOOL)a3
{
  CKPinnedConversationActivityView *v4;
  CKPinnedConversationActivityView *activityView;
  CKPinnedConversationActivityView *v6;

  if (self->_showsLiveActivity != a3)
  {
    self->_showsLiveActivity = a3;
    if (a3)
    {
      v4 = objc_alloc_init(CKPinnedConversationActivityView);
      activityView = self->_activityView;
      self->_activityView = v4;

      -[CKPinnedConversationView addSubview:](self, "addSubview:", self->_activityView);
      -[CKPinnedConversationView _updateAvatarMouthRegion](self, "_updateAvatarMouthRegion");
      -[CKPinnedConversationView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[CKPinnedConversationActivityView removeFromSuperview](self->_activityView, "removeFromSuperview");
      v6 = self->_activityView;
      self->_activityView = 0;

    }
  }
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
  -[CKPinnedConversationView _updateTitleLabel](self, "_updateTitleLabel");
  -[CKPinnedConversationView _updateUnreadIndicator](self, "_updateUnreadIndicator");
  -[CKPinnedConversationView _updateAvatarView](self, "_updateAvatarView");
  -[CKPinnedConversationView _updateAvatarMouthRegion](self, "_updateAvatarMouthRegion");
}

- (void)setRecentMessagesInPinnedConversations:(id)a3
{
  NSArray *v4;
  NSArray *recentMessagesInPinnedConversations;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  recentMessagesInPinnedConversations = self->_recentMessagesInPinnedConversations;
  self->_recentMessagesInPinnedConversations = v4;

}

- (void)setUnreadIndicatorHidden:(BOOL)a3
{
  -[CKPinnedConversationView setUnreadIndicatorHidden:animated:](self, "setUnreadIndicatorHidden:animated:", a3, 0);
}

- (void)setUnreadIndicatorHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  _QWORD v16[4];
  id v17;
  BOOL v18;
  id location;

  v4 = a3;
  if (a4)
  {
    if (!a3)
    {
      -[CKPinnedConversationView unreadIndicator](self, "unreadIndicator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isHidden");

      if (v7)
      {
        -[CKPinnedConversationView unreadIndicator](self, "unreadIndicator");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAlpha:", 0.0);

        -[CKPinnedConversationView unreadIndicator](self, "unreadIndicator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHidden:", 0);

      }
    }
    location = 0;
    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E0CEABB0];
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__CKPinnedConversationView_setUnreadIndicatorHidden_animated___block_invoke;
    v16[3] = &unk_1E2756438;
    objc_copyWeak(&v17, &location);
    v18 = v4;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __62__CKPinnedConversationView_setUnreadIndicatorHidden_animated___block_invoke_2;
    v13[3] = &unk_1E2759540;
    objc_copyWeak(&v14, &location);
    v15 = v4;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v16, v13, 0.300000012);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    -[CKPinnedConversationView unreadIndicator](self, "unreadIndicator");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", v4);

  }
}

void __62__CKPinnedConversationView_setUnreadIndicatorHidden_animated___block_invoke(uint64_t a1)
{
  double v1;
  void *v2;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "unreadIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

void __62__CKPinnedConversationView_setUnreadIndicatorHidden_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  v1 = *(unsigned __int8 *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "unreadIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", v1);

}

- (BOOL)isUnreadIndicatorHidden
{
  void *v2;
  char v3;

  -[CKPinnedConversationView unreadIndicator](self, "unreadIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setIsFilteredByFocus:(BOOL)a3
{
  -[CKPinnedConversationView setIsFilteredByFocus:animated:](self, "setIsFilteredByFocus:animated:", a3, 0);
}

- (void)setIsFilteredByFocus:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isFilteredByFocus != a3)
  {
    self->_isFilteredByFocus = a3;
    if (a3)
      -[CKPinnedConversationView beginSuppressingActivityWithReason:animated:completion:](self, "beginSuppressingActivityWithReason:animated:completion:", CFSTR("FilteredByFocus"), a4, 0);
    else
      -[CKPinnedConversationView endSuppressingActivityWithReason:animated:completion:](self, "endSuppressingActivityWithReason:animated:completion:", CFSTR("FilteredByFocus"), a4, 0);
    -[CKPinnedConversationView _updateUnreadIndicator](self, "_updateUnreadIndicator");
  }
}

- (void)setAvatarSnapshot:(id)a3
{
  UIImage *v5;
  UIImageView *avatarSnapshotImageView;
  id v7;
  void *v8;
  UIImageView *v9;
  UIImageView *v10;
  UIImageView *v11;
  void *v12;
  void *v13;
  void *v14;
  UIImageView *v15;
  void *v16;
  void *v17;
  void *v18;
  UIImage *v19;

  v5 = (UIImage *)a3;
  if (self->_avatarSnapshot != v5)
  {
    v19 = v5;
    objc_storeStrong((id *)&self->_avatarSnapshot, a3);
    avatarSnapshotImageView = self->_avatarSnapshotImageView;
    if (v19)
    {
      if (!avatarSnapshotImageView)
      {
        v7 = objc_alloc(MEMORY[0x1E0CEA658]);
        -[CKPinnedConversationView avatarView](self, "avatarView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "frame");
        v9 = (UIImageView *)objc_msgSend(v7, "initWithFrame:");
        v10 = self->_avatarSnapshotImageView;
        self->_avatarSnapshotImageView = v9;

        v11 = self->_avatarSnapshotImageView;
        -[CKPinnedConversationView avatarView](self, "avatarView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKPinnedConversationView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v11, v12);

      }
      -[CKPinnedConversationView avatarView](self, "avatarView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

      -[CKPinnedConversationView avatarSnapshotImageView](self, "avatarSnapshotImageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImage:", v19);
    }
    else
    {
      -[UIImageView removeFromSuperview](avatarSnapshotImageView, "removeFromSuperview");
      v15 = self->_avatarSnapshotImageView;
      self->_avatarSnapshotImageView = 0;

      -[CKPinnedConversationView avatarView](self, "avatarView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHidden:", 0);

      -[CKPinnedConversationView avatarView](self, "avatarView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contentImage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKPinnedConversationView radiantShadowImageView](self, "radiantShadowImageView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setImage:", v17);

    }
    -[CKPinnedConversationView _updateRadiantShadowImageView](self, "_updateRadiantShadowImageView");
    -[CKPinnedConversationView setNeedsLayout](self, "setNeedsLayout");
    v5 = v19;
  }

}

- (void)setActivityItemOriginationDirection:(int64_t)a3
{
  id v4;

  -[CKPinnedConversationView activityView](self, "activityView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivityItemOriginationDirection:", a3);

}

- (int64_t)activityItemOriginationDirection
{
  void *v2;
  int64_t v3;

  -[CKPinnedConversationView activityView](self, "activityView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activityItemOriginationDirection");

  return v3;
}

- (void)beginSuppressingActivityWithReason:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  NSMutableArray *activeActivitySuppressionReasons;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = a5;
  activeActivitySuppressionReasons = self->_activeActivitySuppressionReasons;
  if (!activeActivitySuppressionReasons)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = self->_activeActivitySuppressionReasons;
    self->_activeActivitySuppressionReasons = v10;

    activeActivitySuppressionReasons = self->_activeActivitySuppressionReasons;
  }
  -[NSMutableArray addObject:](activeActivitySuppressionReasons, "addObject:", v13);
  -[CKPinnedConversationView activityView](self, "activityView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSuppressingActivity:animated:completion:", 1, v6, v8);

}

- (void)endSuppressingActivityWithReason:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  NSMutableArray *activeActivitySuppressionReasons;
  id v9;
  _BOOL8 v10;
  id v11;

  v5 = a4;
  activeActivitySuppressionReasons = self->_activeActivitySuppressionReasons;
  v9 = a5;
  -[NSMutableArray removeObject:](activeActivitySuppressionReasons, "removeObject:", a3);
  v10 = -[NSMutableArray count](self->_activeActivitySuppressionReasons, "count") != 0;
  -[CKPinnedConversationView activityView](self, "activityView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSuppressingActivity:animated:completion:", v10, v5, v9);

}

- (BOOL)isSuppressingActivity
{
  void *v2;
  char v3;

  -[CKPinnedConversationView activityView](self, "activityView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuppressingActivity");

  return v3;
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    if (a3)
      -[CKPinnedConversationView dimAvatarView](self, "dimAvatarView");
    else
      -[CKPinnedConversationView removeDimmingFilter](self, "removeDimmingFilter");
  }
}

- (void)dimAvatarView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "conversationPinningTouchdownDimEnabled") & 1) != 0)
  {
    -[CKPinnedConversationView dimmingFilter](self, "dimmingFilter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKPinnedConversationView setDimmingFilter:](self, "setDimmingFilter:", v4);

      -[CKPinnedConversationView dimmingFilter](self, "dimmingFilter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.6, 1.0);
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = objc_msgSend(v6, "CGColor");
      objc_msgSend(v5, "setValue:forKey:", v7, *MEMORY[0x1E0CD2D00]);

      -[CKPinnedConversationView avatarView](self, "avatarView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKPinnedConversationView dimmingFilter](self, "dimmingFilter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFilters:", v11);

    }
  }
  else
  {

  }
}

- (void)removeDimmingFilter
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conversationPinningTouchdownDimEnabled");

  if (v4)
  {
    -[CKPinnedConversationView avatarView](self, "avatarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", 0);

    -[CKPinnedConversationView setDimmingFilter:](self, "setDimmingFilter:", 0);
  }
}

- (void)setActivityItemBoundingFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_activityItemBoundingFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_activityItemBoundingFrame = &self->_activityItemBoundingFrame;
  if (!CGRectEqualToRect(self->_activityItemBoundingFrame, a3))
  {
    p_activityItemBoundingFrame->origin.x = x;
    p_activityItemBoundingFrame->origin.y = y;
    p_activityItemBoundingFrame->size.width = width;
    p_activityItemBoundingFrame->size.height = height;
    -[CKPinnedConversationView setNeedsLayout](self, "setNeedsLayout");
  }
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double MidX;
  double MidY;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  int v61;
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
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  int v77;
  double v78;
  double v79;
  CGFloat v80;
  double v81;
  double MinY;
  double v83;
  double v84;
  double MinX;
  double v86;
  double MaxX;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  CGFloat v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  void *v128;
  double v129;
  double v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  CGFloat v136;
  CGFloat v137;
  CGFloat v138;
  double v139;
  double v140;
  double v141;
  double v142;
  CGFloat v143;
  CGFloat v144;
  CGFloat v145;
  double v146;
  double v147;
  double v148;
  CGFloat rect;
  double recta;
  double rect_8;
  double rect_16;
  double rect_24;
  CGFloat rect_24a;
  objc_super v155;
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
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;

  v155.receiver = self;
  v155.super_class = (Class)CKPinnedConversationView;
  -[CKPinnedConversationView layoutSubviews](&v155, sel_layoutSubviews);
  -[CKPinnedConversationView bounds](self, "bounds");
  v4 = v3;
  v148 = v5;
  rect = v3;
  rect_24 = v6;
  v7 = v5;
  v9 = v8;
  v147 = v8;
  -[CKPinnedConversationView avatarViewFrameForSize:layoutStyle:](self, "avatarViewFrameForSize:layoutStyle:", self->_layoutStyle, v5, v8);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[CKPinnedConversationView avatarView](self, "avatarView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  -[CKPinnedConversationView conversation](self, "conversation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isBusinessConversation"))
    v20 = 0.0;
  else
    v20 = v17 * 0.5;
  -[CKPinnedConversationView avatarView](self, "avatarView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", v20);

  -[CKPinnedConversationView avatarSnapshotImageView](self, "avatarSnapshotImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v11, v13, v15, v17);

  -[CKPinnedConversationView activityView](self, "activityView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v4, rect_24, v7, v9);

  -[CKPinnedConversationView activityView](self, "activityView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationView convertRect:toView:](self, "convertRect:toView:", v25, v11, v13, v15, v17);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[CKPinnedConversationView activityView](self, "activityView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAvatarFrame:", v27, v29, v31, v33);

  -[CKPinnedConversationView radiantShadowImageView](self, "radiantShadowImageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setBounds:", 0.0, 0.0, v15, v17);

  v156.origin.x = v11;
  v156.origin.y = v13;
  v156.size.width = v15;
  v156.size.height = v17;
  MidX = CGRectGetMidX(v156);
  v144 = v13;
  v145 = v11;
  v157.origin.x = v11;
  v157.origin.y = v13;
  rect_8 = v17;
  rect_16 = v15;
  v157.size.width = v15;
  v157.size.height = v17;
  MidY = CGRectGetMidY(v157);
  -[CKPinnedConversationView radiantShadowImageView](self, "radiantShadowImageView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setPosition:", MidX, MidY);

  -[CKPinnedConversationView radiantShadowImageView](self, "radiantShadowImageView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setZPosition:", -1.0);

  -[CKPinnedConversationView _updateRadiantShadowAffineTranform](self, "_updateRadiantShadowAffineTranform");
  -[CKPinnedConversationView titleLabelSizeFittingSize:](self, "titleLabelSizeFittingSize:", v148, v147);
  v44 = v43;
  v46 = v45;
  objc_msgSend((id)objc_opt_class(), "titleLabelVerticalPadding");
  v48 = v47;
  UIRoundToViewScale();
  v50 = v49;
  v158.origin.x = rect;
  v158.origin.y = rect_24;
  v158.size.width = v148;
  v158.size.height = v147;
  v51 = CGRectGetMaxY(v158) - v46 - v48;
  -[CKPinnedConversationView titleLabel](self, "titleLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", v50, v51, v44, v46);

  -[CKPinnedConversationView unreadIndicatorSize](self, "unreadIndicatorSize");
  v54 = v53;
  v56 = v55;
  -[CKPinnedConversationView unreadIndicatorPreferredPadding](self, "unreadIndicatorPreferredPadding");
  v58 = v57;
  -[CKPinnedConversationView unreadIndicatorMinimumPadding](self, "unreadIndicatorMinimumPadding");
  v60 = v59;
  v61 = -[CKPinnedConversationView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v62 = v50;
  v63 = v51;
  v64 = v44;
  v65 = v46;
  if (v61)
  {
    v66 = v58 + CGRectGetMaxX(*(CGRect *)&v62);
    v159.size.width = v148;
    v159.origin.x = rect;
    v159.origin.y = rect_24;
    v159.size.height = v147;
    v67 = CGRectGetMaxX(v159) - v60 - v54;
    if (v67 >= v66)
      v68 = v66;
    else
      v68 = v67;
  }
  else
  {
    v69 = CGRectGetMinX(*(CGRect *)&v62) - v58 - v54;
    v160.size.width = v148;
    v160.origin.x = rect;
    v160.origin.y = rect_24;
    v160.size.height = v147;
    v70 = v60 + CGRectGetMinX(v160);
    if (v70 >= v69)
      v68 = v70;
    else
      v68 = v69;
  }
  v137 = v51;
  v138 = v50;
  v161.origin.x = v50;
  v161.origin.y = v51;
  v161.size.width = v44;
  v161.size.height = v46;
  CGRectGetMidY(v161);
  UIRoundToViewScale();
  v72 = v71;
  -[CKPinnedConversationView unreadIndicator](self, "unreadIndicator");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setFrame:", v68, v72, v54, v56);

  v74 = *MEMORY[0x1E0C9D648];
  v75 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v76 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v141 = v76;
  v142 = v75;
  v139 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v140 = *MEMORY[0x1E0C9D648];
  v146 = v139;
  if (!CGRectIsEmpty(self->_activityItemBoundingFrame))
  {
    v77 = CKIsRunningInMacCatalyst();
    v78 = 5.0;
    if (!v77)
      v78 = 0.0;
    v74 = self->_activityItemBoundingFrame.origin.x + 8.0;
    v146 = self->_activityItemBoundingFrame.origin.y + v78;
    v75 = self->_activityItemBoundingFrame.size.width + -16.0;
    v76 = self->_activityItemBoundingFrame.size.height - v78;
  }
  v143 = v75;
  v162.origin.x = v145;
  v162.origin.y = v144;
  v162.size.width = rect_16;
  v162.size.height = rect_8;
  v79 = CGRectGetMinX(v162) + -8.0;
  v163.origin.x = v145;
  v163.origin.y = v144;
  v163.size.width = rect_16;
  v163.size.height = rect_8;
  v80 = v75;
  v81 = CGRectGetMaxX(v163) + 8.0;
  v164.size.width = v148;
  v164.origin.x = rect;
  v164.origin.y = rect_24;
  v164.size.height = v147;
  MinY = CGRectGetMinY(v164);
  v165.origin.y = v137;
  v165.origin.x = v138;
  v165.size.width = v44;
  v165.size.height = v46;
  v83 = v81 - v79;
  v84 = CGRectGetMinY(v165) - MinY;
  v166.origin.x = v74;
  v166.origin.y = v146;
  v166.size.width = v80;
  v166.size.height = v76;
  rect_24a = v84;
  if (!CGRectIsEmpty(v166))
  {
    v167.origin.x = v79;
    v167.origin.y = MinY;
    v167.size.width = v81 - v79;
    v167.size.height = v84;
    MinX = CGRectGetMinX(v167);
    v168.origin.x = v74;
    v168.origin.y = v146;
    v168.size.width = v80;
    v168.size.height = v76;
    v86 = CGRectGetMinX(v168);
    if (MinX < v86)
      MinX = v86;
    v169.origin.x = v79;
    v169.origin.y = MinY;
    v169.size.width = v81 - v79;
    v169.size.height = rect_24a;
    MaxX = CGRectGetMaxX(v169);
    v170.origin.x = v74;
    v170.origin.y = v146;
    v170.size.width = v80;
    v170.size.height = v76;
    v88 = CGRectGetMaxX(v170);
    if (MaxX < v88)
      v88 = MaxX;
    v83 = v88 - MinX;
    v79 = MinX;
    v84 = rect_24a;
  }
  v89 = MinY;
  if (self->_activityItemTopInset != 0.0)
  {
    v171.origin.x = v79;
    v171.origin.y = MinY;
    v171.size.width = v83;
    v171.size.height = v84;
    v89 = CGRectGetMinY(v171) + self->_activityItemTopInset;
    v172.origin.x = v79;
    v172.origin.y = MinY;
    v172.size.width = v83;
    v172.size.height = v84;
    v84 = CGRectGetHeight(v172) - self->_activityItemTopInset;
  }
  -[CKPinnedConversationView activityView](self, "activityView", *(_QWORD *)&v74);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setInnerContentAlignmentFrame:", v79, v89, v83, v84);

  v173.origin.x = v145;
  v173.origin.y = v144;
  v173.size.width = rect_16;
  v173.size.height = rect_8;
  v91 = CGRectGetMinX(v173);
  v174.origin.x = v145;
  v174.origin.y = v144;
  v174.size.width = rect_16;
  v174.size.height = rect_8;
  v92 = CGRectGetMinX(v174) - v91 - v91;
  v175.origin.x = v145;
  v175.origin.y = v144;
  v175.size.width = rect_16;
  v175.size.height = rect_8;
  v93 = v91 + v91 + CGRectGetMaxX(v175) + 0.0 - v92;
  v176.origin.x = v136;
  v176.origin.y = v146;
  v176.size.width = v143;
  v176.size.height = v76;
  if (CGRectIsEmpty(v176))
  {
    v94 = MinY;
  }
  else
  {
    v177.origin.x = v92;
    v177.origin.y = MinY;
    v177.size.width = v93;
    v177.size.height = rect_24a;
    v95 = CGRectGetMinX(v177);
    v178.origin.x = v136;
    v178.origin.y = v146;
    v178.size.width = v143;
    v178.size.height = v76;
    v96 = CGRectGetMinX(v178);
    if (v95 >= v96)
      v96 = v95;
    recta = v96;
    v179.origin.x = v92;
    v94 = MinY;
    v179.origin.y = MinY;
    v179.size.width = v93;
    v179.size.height = rect_24a;
    v97 = CGRectGetMaxX(v179);
    v180.origin.x = v136;
    v180.origin.y = v146;
    v180.size.width = v143;
    v180.size.height = v76;
    v98 = CGRectGetMaxX(v180);
    if (v97 < v98)
      v98 = v97;
    v92 = recta;
    v93 = v98 - recta;
  }
  v100 = v139;
  v99 = v140;
  if (self->_activityItemTopInset == 0.0)
  {
    v102 = rect_24a;
    v101 = v94;
  }
  else
  {
    v181.origin.x = v92;
    v181.origin.y = v94;
    v181.size.width = v93;
    v181.size.height = rect_24a;
    v101 = CGRectGetMinY(v181) + self->_activityItemTopInset;
    v182.origin.x = v92;
    v182.origin.y = v94;
    v182.size.width = v93;
    v182.size.height = rect_24a;
    v102 = CGRectGetHeight(v182) - self->_activityItemTopInset;
  }
  -[CKPinnedConversationView activityView](self, "activityView");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setOuterContentAlignmentFrame:", v92, v101, v93, v102);

  -[CKPinnedConversationView conversation](self, "conversation");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v104, "isAdHocGroupConversation"))
    goto LABEL_36;
  -[CKPinnedConversationView avatarView](self, "avatarView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "contacts");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "count");

  if (v107)
  {
    -[CKPinnedConversationView avatarView](self, "avatarView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationView activityView](self, "activityView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "frameForAvatarAtIndex:inView:", 0, v108);
    v99 = v109;
    v100 = v110;
    v141 = v112;
    v142 = v111;

LABEL_36:
  }
  -[CKPinnedConversationView activityView](self, "activityView");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setActivityItemOriginationSubAvatarFrame:", v99, v100, v142, v141);

  v115 = *MEMORY[0x1E0C9D538];
  v114 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v116 = *MEMORY[0x1E0C9D538];
  v117 = v114;
  if (self->_avatarMouthRegion)
  {
    -[CKPinnedConversationView _centerPointOfFaceLandmarkRegion:inImageOfSize:](self, "_centerPointOfFaceLandmarkRegion:inImageOfSize:", rect_16, rect_8);
    v120 = v119;
    v121 = v118;
    if (v119 != v115 || (v116 = v115, v117 = v114, v118 != v114))
    {
      -[CKPinnedConversationView avatarView](self, "avatarView");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKPinnedConversationView activityView](self, "activityView");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "convertPoint:toView:", v123, v120, v121);
      v116 = v124;
      v117 = v125;

    }
  }
  if (v116 == v115 && v117 == v114)
  {
    v183.origin.x = v99;
    v183.origin.y = v100;
    v183.size.width = v142;
    v183.size.height = v141;
    v116 = CGRectGetMidX(v183);
    v184.origin.x = v99;
    v184.origin.y = v100;
    v184.size.width = v142;
    v184.size.height = v141;
    v117 = CGRectGetMidY(v184);
  }
  if (v116 == v115 && v117 == v114)
  {
    v185.origin.x = v145;
    v185.origin.y = v144;
    v185.size.width = rect_16;
    v185.size.height = rect_8;
    v126 = CGRectGetMidX(v185);
    v186.origin.x = v145;
    v186.origin.y = v144;
    v186.size.width = rect_16;
    v186.size.height = rect_8;
    v127 = CGRectGetMidY(v186);
    -[CKPinnedConversationView activityView](self, "activityView");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationView convertPoint:toView:](self, "convertPoint:toView:", v128, v126, v127);
    v116 = v129;
    v117 = v130;

  }
  -[CKPinnedConversationView activityView](self, "activityView");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setActivityItemOriginationPoint:", v116, v117);

  -[CKPinnedConversationView avatarView](self, "avatarView");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "layer");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "setZPosition:", 0.0);

  -[CKPinnedConversationView radiantShadowImageView](self, "radiantShadowImageView");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "layer");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setZPosition:", -1.0);

}

- (void)_updateRadiantShadowAffineTranform
{
  void *v3;
  double v4;
  CGFloat v5;
  void *v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  -[CKPinnedConversationView avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4 * 0.136363636;

  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, 0.875, 0.875);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeTranslation(&v13, 0.0, v5);
  t1 = v14;
  memset(&v12, 0, sizeof(v12));
  t2 = v13;
  CGAffineTransformConcat(&v12, &t1, &t2);
  v9 = v12;
  -[CKPinnedConversationView radiantShadowImageView](self, "radiantShadowImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v7, "setAffineTransform:", &v8);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
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
  CGSize result;

  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "avatarViewSizeFittingSize:layoutStyle:", self->_layoutStyle, a3.width, 1.79769313e308);
  v6 = v5;
  -[CKPinnedConversationView titleLabelSizeFittingSize:](self, "titleLabelSizeFittingSize:", width, 1.79769313e308);
  v8 = v7;
  objc_msgSend((id)objc_opt_class(), "avatarViewPadding");
  v10 = v9;
  v12 = v11;
  objc_msgSend((id)objc_opt_class(), "titleLabelVerticalPadding");
  v15 = v14 + v8 + v12 + v6 + v10 + v13;
  v16 = width;
  result.height = v15;
  result.width = v16;
  return result;
}

+ (CGSize)avatarViewSizeFittingSize:(CGSize)a3 layoutStyle:(int64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(a1, "_maximumAvatarViewWidthFittingSize:", a3.width, a3.height);
  v7 = v6;
  objc_msgSend(a1, "_preferredAvatarViewDiameterForLayoutStyle:", a4);
  if (v7 < v8)
    v8 = v7;
  v9 = v8;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (double)_maximumAvatarViewWidthFittingSize:(CGSize)a3
{
  double width;
  double v4;
  double v5;

  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "avatarViewPadding");
  return width - v4 - v5;
}

+ (double)_preferredAvatarViewDiameterForLayoutStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)a3 <= 6)
    return dbl_18E7CBF10[a3];
  return result;
}

- (CGRect)avatarViewFrameForSize:(CGSize)a3 layoutStyle:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  objc_msgSend((id)objc_opt_class(), "avatarViewSizeFittingSize:layoutStyle:", a4, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "avatarViewPadding");
  v9 = v8;
  UIRoundToViewScale();
  v11 = v9;
  v12 = v5;
  v13 = v7;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGSize)titleLabelSizeFittingSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIImageView image](self->_unreadIndicator, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKPinnedConversationView unreadIndicatorSize](self, "unreadIndicatorSize");
    v8 = v7;
    -[CKPinnedConversationView unreadIndicatorMinimumPadding](self, "unreadIndicatorMinimumPadding");
    v11 = v10 + v8 + v9;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pinnedConversationViewTitleLabelToEdgePaddingWhenNoUnreadIndicator");
    v11 = v13;

  }
  v14 = width + v11 * -2.0;
  -[CKPinnedConversationView titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeThatFits:", v14, height);
  v17 = v16;
  v19 = v18;

  if (v14 >= v17)
    v20 = v17;
  else
    v20 = v14;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)didEndDisplaying
{
  -[CKPinnedConversationActivityView resetToEmptySnapshot](self->_activityView, "resetToEmptySnapshot");
  -[CKPinnedConversationView setAvatarSnapshot:](self, "setAvatarSnapshot:", 0);
}

- (void)prepareForReuse
{
  -[CKPinnedConversationView setAvatarSnapshot:](self, "setAvatarSnapshot:", 0);
  -[CKPinnedConversationActivityView resetToEmptySnapshot](self->_activityView, "resetToEmptySnapshot");
  -[NSMutableArray removeAllObjects](self->_activeActivitySuppressionReasons, "removeAllObjects");
}

+ (UIEdgeInsets)avatarViewPadding
{
  int v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = CKIsRunningInMacCatalyst();
  v3 = 10.0;
  v4 = 8.0;
  if (v2)
    v4 = 10.0;
  else
    v3 = 5.0;
  v5 = 0.0;
  v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (void)setNeedsUnreadIndicatorLeadingEdgePadding:(BOOL)a3
{
  if (self->_needsUnreadIndicatorLeadingEdgePadding != a3)
  {
    self->_needsUnreadIndicatorLeadingEdgePadding = a3;
    -[CKPinnedConversationView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)_unreadIndicatorLeadingEdgePadding
{
  void *v2;
  double v3;
  double v4;

  if (!self->_needsUnreadIndicatorLeadingEdgePadding)
    return 0.0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationListCellHighlightViewToUnreadIndicatorPadding");
  v4 = v3;

  return v4;
}

+ (UIEdgeInsets)titleLabelVerticalPadding
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationListPinnedCellTitleLabelVerticalPadding");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)unreadIndicatorSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unreadIndicatorImageViewSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSDirectionalEdgeInsets)unreadIndicatorPreferredPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  -[CKPinnedConversationView _unreadIndicatorLeadingEdgePadding](self, "_unreadIndicatorLeadingEdgePadding");
  v3 = v2;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 3.0;
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v3;
  result.top = v4;
  return result;
}

- (NSDirectionalEdgeInsets)unreadIndicatorMinimumPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  -[CKPinnedConversationView _unreadIndicatorLeadingEdgePadding](self, "_unreadIndicatorLeadingEdgePadding");
  v3 = v2;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 1.0;
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v3;
  result.top = v4;
  return result;
}

- (void)updateActivityViewAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  void *v8;
  CKPinnedConversationActivitySnapshot *v9;
  void *v10;
  CKPinnedConversationActivitySnapshot *v11;
  id v12;
  id v13;

  if (self->_activityView)
  {
    v4 = a3;
    v6 = a4;
    -[CKPinnedConversationView conversation](self, "conversation");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "previousPinnedConversationActivitySnapshotForConversation:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v9 = [CKPinnedConversationActivitySnapshot alloc];
      -[CKPinnedConversationView recentMessagesInPinnedConversations](self, "recentMessagesInPinnedConversations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CKPinnedConversationActivitySnapshot initWithConversation:recentMessagesInPinnedConversations:previousSnapshot:](v9, "initWithConversation:recentMessagesInPinnedConversations:previousSnapshot:", v13, v10, v8);

    }
    else
    {
      +[CKPinnedConversationActivitySnapshot emptySnapshot](CKPinnedConversationActivitySnapshot, "emptySnapshot");
      v11 = (CKPinnedConversationActivitySnapshot *)objc_claimAutoreleasedReturnValue();
    }
    -[CKPinnedConversationActivityView applySnapshot:animated:completion:](self->_activityView, "applySnapshot:animated:completion:", v11, v4, v6);

    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "pinnedConversationView:didUpdateWithActivitySnapshot:", self, v11);

    if (objc_msgSend(v13, "isAdHocGroupConversation"))
      -[CKPinnedConversationView _updateAvatarView](self, "_updateAvatarView");

  }
}

- (void)reapplyPreviouslyDisplayedActivitySnapshot:(id)a3
{
  if (a3)
    -[CKPinnedConversationActivityView applySnapshot:animated:completion:](self->_activityView, "applySnapshot:animated:completion:", a3, 0, 0);
}

- (void)setPreferShortConversationName:(BOOL)a3
{
  if (self->_preferShortConversationName != a3)
  {
    self->_preferShortConversationName = a3;
    -[CKPinnedConversationView _updateTitleLabel](self, "_updateTitleLabel");
  }
}

- (void)_updateTitleLabelWithText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKPinnedConversationView titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

+ (int64_t)_titleIconImageTypeForConversation:(id)a3
{
  return objc_msgSend(a3, "shouldShowVerifiedCheckmark");
}

- (void)_updateTitleLabel
{
  void *v3;
  id v4;

  -[CKConversation pinnedConversationDisplayNamePreferringShortName:](self->_conversation, "pinnedConversationDisplayNamePreferringShortName:", -[CKPinnedConversationView preferShortConversationName](self, "preferShortConversationName"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationView _updateTitleLabelWithText:](self, "_updateTitleLabelWithText:", v4);
  -[CKPinnedConversationView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleIconImageType:", +[CKPinnedConversationView _titleIconImageTypeForConversation:](CKPinnedConversationView, "_titleIconImageTypeForConversation:", self->_conversation));

}

- (void)_updateTitleLabelFont
{
  void *v3;
  void *v4;
  id v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationListPinnedConversationNameFont");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CKPinnedConversationView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

}

- (void)setIsSelectedWithDarkAppearance:(BOOL)a3
{
  if (self->_isSelectedWithDarkAppearance != a3)
  {
    self->_isSelectedWithDarkAppearance = a3;
    -[CKPinnedConversationView _updateTitleLabelColor](self, "_updateTitleLabelColor");
    -[CKPinnedConversationView _updateUnreadIndicator](self, "_updateUnreadIndicator");
  }
}

- (void)_updateTitleLabelColor
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[CKPinnedConversationView isSelectedWithDarkAppearance](self, "isSelectedWithDarkAppearance");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "conversationListPinnedConversationNameSelectedColor");
  else
    objc_msgSend(v5, "conversationListPinnedConversationNameColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CKLabel setColor:](self->_titleLabel, "setColor:", v7);
}

- (void)_updateUnreadIndicator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[CKPinnedConversationView _unreadIndicatorImage](self, "_unreadIndicatorImage");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationView unreadIndicator](self, "unreadIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v10)
  {
    objc_msgSend(v3, "setImage:", v10);

    -[CKPinnedConversationView _unreadIndicatorColor](self, "_unreadIndicatorColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationView unreadIndicator](self, "unreadIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", v5);

    -[CKPinnedConversationView unreadIndicator](self, "unreadIndicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v3, "setImage:", 0);

    -[CKPinnedConversationView unreadIndicator](self, "unreadIndicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1;
  }
  objc_msgSend(v7, "setHidden:", v9);

}

- (id)_unreadIndicatorImage
{
  void *v3;
  int v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (v4)
    v5 = -[CKPinnedConversationView _shouldShowSummaryForSatelliteMessages](self, "_shouldShowSummaryForSatelliteMessages");
  else
    v5 = 0;
  v6 = -[CKConversation hasUnreadMessages](self->_conversation, "hasUnreadMessages");
  if (-[CKPinnedConversationView isFilteredByFocus](self, "isFilteredByFocus"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pinnedConversationFilteredByFocusIndicatorImage");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6 && !v5)
    {
      v9 = 0;
      return v9;
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unreadIndicatorUntintedImage");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (BOOL)_shouldShowSummaryForSatelliteMessages
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSatelliteConnectionActive");

  if (v4)
  {
    -[CKPinnedConversationView conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CKPinnedConversationView conversation](self, "conversation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "chat");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "pendingIncomingSatelliteMessageCount"))
        LODWORD(v5) = objc_msgSend(v7, "isDownloadingPendingSatelliteMessages") ^ 1;
      else
        LOBYTE(v5) = 0;

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (id)_unreadIndicatorColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;

  if (-[CKPinnedConversationView isFilteredByFocus](self, "isFilteredByFocus"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "theme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationListPinnedConversationFilteredByFocusIndicatorColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = -[CKPinnedConversationView isSelectedWithDarkAppearance](self, "isSelectedWithDarkAppearance");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (v6)
      objc_msgSend(v7, "readSelectedIndicatorColor");
    else
      objc_msgSend(v7, "unreadIndicatorColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v5;

  return v8;
}

- (BOOL)_activityIsSuppressedForLayoutStyle:(int64_t)a3
{
  return a3 == 4;
}

- (void)configureAsPrototypeCell
{
  -[CKPinnedConversationView _updateTitleLabelWithText:](self, "_updateTitleLabelWithText:", CFSTR("Prototype"));
}

- (void)_updateAvatarMouthRegion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VNFaceLandmarkRegion2D *v7;
  VNFaceLandmarkRegion2D *avatarMouthRegion;
  void *v9;
  void *v10;
  id v11;
  id v12;
  VNFaceLandmarkRegion2D *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  id v20;
  id location;

  if (objc_msgSend((id)objc_opt_class(), "_mouthRegionDetectionEnabled"))
  {
    -[CKPinnedConversationView conversation](self, "conversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CKPinnedConversationView showsLiveActivity](self, "showsLiveActivity")
      && objc_msgSend(v3, "recipientCount") == 1)
    {
      objc_msgSend(v3, "recipient");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_requiredContactKeys");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cnContactWithKeys:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_cachedMouthRegionForContact:", v6);
      v7 = (VNFaceLandmarkRegion2D *)objc_claimAutoreleasedReturnValue();
      avatarMouthRegion = self->_avatarMouthRegion;
      self->_avatarMouthRegion = v7;

      objc_msgSend((id)objc_opt_class(), "_mouthRegionForContactImageCacheKeyForContact:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      location = 0;
      objc_initWeak(&location, self);
      v10 = (void *)objc_opt_class();
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __52__CKPinnedConversationView__updateAvatarMouthRegion__block_invoke;
      v17 = &unk_1E2759568;
      objc_copyWeak(&v20, &location);
      v11 = v6;
      v18 = v11;
      v12 = v9;
      v19 = v12;
      objc_msgSend(v10, "_updateCachedMouthRegionIfNecessaryForContact:completion:", v11, &v14);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);

    }
    else
    {
      v13 = self->_avatarMouthRegion;
      self->_avatarMouthRegion = 0;

    }
    -[CKPinnedConversationView setNeedsLayout](self, "setNeedsLayout", v14, v15, v16, v17);

  }
}

void __52__CKPinnedConversationView__updateAvatarMouthRegion__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v12 = a2;
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "avatarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend((id)objc_opt_class(), "_mouthRegionForContactImageCacheKeyForContact:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40)))
    {
      v10 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v10, "setAvatarMouthRegion:", v12);

      v11 = objc_loadWeakRetained(v3);
      objc_msgSend(v11, "setNeedsLayout");

    }
  }

}

- (void)_updateAvatarView
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  -[CKPinnedConversationView conversation](self, "conversation");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "avatarViewAllowsStaleRendering"))
  {
    v4 = -[CNAvatarView isDisplayingContent](self->_avatarView, "isDisplayingContent");

    if (v4)
      -[CNAvatarView setAllowStaleRendering:](self->_avatarView, "setAllowStaleRendering:", 1);
  }
  else
  {

  }
  objc_msgSend(v16, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarView _ck_setContextToken:](self->_avatarView, "_ck_setContextToken:", v6);

  v7 = objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars");
  v8 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v16, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationActivityView displayedContacts](self->_activityView, "displayedContacts");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v8;
  v13 = v12;

  objc_msgSend(v9, "ck_contactInstancesMatchingContacts:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[CNAvatarView updateViewWithGroupIdentity:maskingContacts:](self->_avatarView, "updateViewWithGroupIdentity:maskingContacts:", v9, v14);
  -[CNAvatarView setStyle:](self->_avatarView, "setStyle:", objc_msgSend(v16, "shouldHaveRoundRectAvatar"));
  -[CKPinnedConversationView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateRadiantShadowImageView
{
  _BOOL4 v3;
  BOOL v4;
  void *v5;
  UIImage *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  UIImage *avatarSnapshot;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _OWORD v21[5];

  v3 = -[CKConversation isAdHocGroupConversation](self->_conversation, "isAdHocGroupConversation");
  v4 = v3;
  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pinnedAdHocConversationRadiantShadowImage");
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conversationListPinnedAdHocConversationRadiantShadowColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 1.0;
  }
  else
  {
    avatarSnapshot = self->_avatarSnapshot;
    if (avatarSnapshot)
    {
      v6 = avatarSnapshot;
    }
    else
    {
      -[CKPinnedConversationView avatarView](self, "avatarView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentImage");
      v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
    v10 = 0.3;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKeyPath:", CFSTR("low"), *MEMORY[0x1E0CD2D88]);
  objc_msgSend(v14, "setValue:forKeyPath:", &unk_1E2871720, *MEMORY[0x1E0CD2D90]);
  v15 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v14, "setValue:forKeyPath:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD2D58]);
  objc_msgSend(v14, "setValue:forKeyPath:", v15, *MEMORY[0x1E0CD2D70]);
  objc_msgSend(v14, "setValue:forKeyPath:", v15, *MEMORY[0x1E0CD2D28]);
  objc_msgSend(v14, "setValue:forKeyPath:", v15, *MEMORY[0x1E0CD2D68]);
  objc_msgSend(v13, "addObject:", v14);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValue:forKeyPath:", &unk_1E2871730, *MEMORY[0x1E0CD2CB8]);
    objc_msgSend(v13, "addObject:", v16);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = xmmword_18E7CBED0;
    v21[1] = xmmword_18E7CBEE0;
    v21[2] = xmmword_18E7CBEF0;
    v21[3] = xmmword_18E7CBF00;
    v21[4] = xmmword_18E7CAF70;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forKey:", v18, *MEMORY[0x1E0CD2D20]);
    objc_msgSend(v13, "addObject:", v17);

  }
  -[UIImageView setAlpha:](self->_radiantShadowImageView, "setAlpha:", v10);
  -[UIImageView setImage:](self->_radiantShadowImageView, "setImage:", v6);
  -[UIImageView setTintColor:](self->_radiantShadowImageView, "setTintColor:", v9);
  v19 = (void *)objc_msgSend(v13, "copy");
  -[UIImageView layer](self->_radiantShadowImageView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFilters:", v19);

}

+ (id)_requiredContactKeys
{
  uint64_t v2;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "_mouthRegionDetectionEnabled"))
  {
    v2 = *MEMORY[0x1E0C96890];
    v5[0] = *MEMORY[0x1E0C96710];
    v5[1] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  return 0;
}

+ (id)_mouthRegionForContactImageCache
{
  if (_mouthRegionForContactImageCache_onceToken != -1)
    dispatch_once(&_mouthRegionForContactImageCache_onceToken, &__block_literal_global_232);
  return (id)_mouthRegionForContactImageCache_mouthRegionCache;
}

void __60__CKPinnedConversationView__mouthRegionForContactImageCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_mouthRegionForContactImageCache_mouthRegionCache;
  _mouthRegionForContactImageCache_mouthRegionCache = (uint64_t)v0;

}

+ (id)_mouthRegionDetectionDispatchQueue
{
  if (_mouthRegionDetectionDispatchQueue_onceToken != -1)
    dispatch_once(&_mouthRegionDetectionDispatchQueue_onceToken, &__block_literal_global_62_1);
  return (id)_mouthRegionDetectionDispatchQueue_queue;
}

void __62__CKPinnedConversationView__mouthRegionDetectionDispatchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.messages.mouth-region-detection", v2);
  v1 = (void *)_mouthRegionDetectionDispatchQueue_queue;
  _mouthRegionDetectionDispatchQueue_queue = (uint64_t)v0;

}

+ (id)_mouthRegionForContactImageCacheKeyForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "imageHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

+ (id)_cachedMouthRegionForContact:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "_mouthRegionForContactImageCacheKeyForContact:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mouthRegionForContactImageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x193FF3C18](CFSTR("VNFaceLandmarkRegion2D"), CFSTR("Vision"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

+ (void)_updateCachedMouthRegionIfNecessaryForContact:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_mouthRegionForContactImageCacheKeyForContact:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mouthRegionForContactImageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    MEMORY[0x193FF3C18](CFSTR("VNFaceLandmarkRegion2D"), CFSTR("Vision"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v7;
      v12 = v10;
    }
    else
    {
      v11 = v7;
      v12 = 0;
    }
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v11, v12, 0);
  }
  else
  {
    objc_msgSend(a1, "_mouthRegionDetectionDispatchQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__CKPinnedConversationView__updateCachedMouthRegionIfNecessaryForContact_completion___block_invoke;
    block[3] = &unk_1E2759600;
    v19 = a1;
    v15 = v6;
    v16 = v9;
    v17 = v8;
    v18 = v7;
    dispatch_async(v13, block);

  }
}

void __85__CKPinnedConversationView__updateCachedMouthRegionIfNecessaryForContact_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 64);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__CKPinnedConversationView__updateCachedMouthRegionIfNecessaryForContact_completion___block_invoke_2;
  v4[3] = &unk_1E27595D8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_determineMouthRegionForContact:completion:", v3, v4);

}

void __85__CKPinnedConversationView__updateCachedMouthRegionIfNecessaryForContact_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__CKPinnedConversationView__updateCachedMouthRegionIfNecessaryForContact_completion___block_invoke_3;
  block[3] = &unk_1E27595B0;
  v11 = v5;
  v12 = a1[4];
  v13 = a1[5];
  v7 = a1[6];
  v14 = v6;
  v15 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __85__CKPinnedConversationView__updateCachedMouthRegionIfNecessaryForContact_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

+ (void)_determineMouthRegionForContact:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, id);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(id, _QWORD, id);
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD, id))a4;
  v7 = objc_alloc_init((Class)MEMORY[0x193FF3C18](CFSTR("VNDetectFaceLandmarksRequest"), CFSTR("Vision")));
  objc_msgSend(v7, "setRevision:", 3);
  objc_msgSend(v7, "setConstellation:", 2);
  objc_msgSend(v5, "thumbnailImageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)MEMORY[0x193FF3C18](CFSTR("VNImageRequestHandler"), CFSTR("Vision"))), "initWithData:orientation:options:", v8, 4, MEMORY[0x1E0C9AA70]);
  if (_IMWillLog())
  {
    objc_msgSend(v5, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

  }
  v40[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1, v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v11 = objc_msgSend(v9, "performRequests:error:", v10, &v38);
  v12 = v38;

  if (_IMWillLog())
  {
    objc_msgSend(v5, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

  }
  if (v11)
  {
    v30 = v9;
    v31 = v8;
    v32 = v6;
    v33 = v5;
    objc_msgSend(v7, "results");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          MEMORY[0x193FF3C18](CFSTR("VNFaceObservation"), CFSTR("Vision"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v14, "addObject:", v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v17);
    }

    if (objc_msgSend(v14, "count") == 1)
    {
      objc_msgSend(v14, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "landmarks");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "outerLips");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = _IMWillLog();
      v6 = v32;
      v5 = v33;
      if (v23)
      {
        if (v24)
        {
          objc_msgSend(v33, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          _IMAlwaysLog();

        }
        ((void (**)(id, void *, id))v32)[2](v32, v23, 0);
      }
      else
      {
        if (v24)
        {
          objc_msgSend(v33, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          _IMAlwaysLog();

        }
        v32[2](v32, 0, 0);
      }

    }
    else
    {
      v6 = v32;
      v5 = v33;
      if (_IMWillLog())
      {
        objc_msgSend(v33, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        _IMAlwaysLog();

      }
      v32[2](v32, 0, 0);
    }

    v9 = v30;
    v8 = v31;
  }
  else
  {
    _IMWarn();
    v6[2](v6, 0, v12);
  }

}

- (CGPoint)_centerPointOfFaceLandmarkRegion:(id)a3 inImageOfSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float64x2_t v10;
  float64x2_t v11;
  double v12;
  double v13;
  float64x2_t v14;
  CGPoint result;

  height = a4.height;
  width = a4.width;
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "pointsInImageOfSize:", width, height);
  v8 = objc_msgSend(v6, "pointCount");
  if (v7 && v8 >= 1)
  {
    v9 = 0;
    v10 = 0uLL;
    do
      v10 = vaddq_f64(v10, *(float64x2_t *)(v7 + 16 * v9++));
    while (v8 != v9);
    v11 = vdivq_f64(v10, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v8), 0));
  }
  else
  {
    v11 = *(float64x2_t *)MEMORY[0x1E0C9D538];
  }
  v14 = v11;

  v13 = v14.f64[1];
  v12 = v14.f64[0];
  result.y = v13;
  result.x = v12;
  return result;
}

+ (BOOL)_mouthRegionDetectionEnabled
{
  if (_mouthRegionDetectionEnabled_onceToken != -1)
    dispatch_once(&_mouthRegionDetectionEnabled_onceToken, &__block_literal_global_88_2);
  return _mouthRegionDetectionEnabled_mouthRegionDetectionEnabled;
}

uint64_t __56__CKPinnedConversationView__mouthRegionDetectionEnabled__block_invoke()
{
  uint64_t result;

  result = IMGetCachedDomainBoolForKeyWithDefaultValue();
  _mouthRegionDetectionEnabled_mouthRegionDetectionEnabled = result;
  return result;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (NSArray)recentMessagesInPinnedConversations
{
  return self->_recentMessagesInPinnedConversations;
}

- (BOOL)showsLiveActivity
{
  return self->_showsLiveActivity;
}

- (BOOL)preferShortConversationName
{
  return self->_preferShortConversationName;
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UIImage)avatarSnapshot
{
  return self->_avatarSnapshot;
}

- (CKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)unreadIndicator
{
  return self->_unreadIndicator;
}

- (void)setUnreadIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_unreadIndicator, a3);
}

- (UIImageView)radiantShadowImageView
{
  return self->_radiantShadowImageView;
}

- (void)setRadiantShadowImageView:(id)a3
{
  objc_storeStrong((id *)&self->_radiantShadowImageView, a3);
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)needsUnreadIndicatorLeadingEdgePadding
{
  return self->_needsUnreadIndicatorLeadingEdgePadding;
}

- (BOOL)isSelectedWithDarkAppearance
{
  return self->_isSelectedWithDarkAppearance;
}

- (CGRect)activityItemBoundingFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_activityItemBoundingFrame.origin.x;
  y = self->_activityItemBoundingFrame.origin.y;
  width = self->_activityItemBoundingFrame.size.width;
  height = self->_activityItemBoundingFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)activityItemTopInset
{
  return self->_activityItemTopInset;
}

- (void)setActivityItemTopInset:(double)a3
{
  self->_activityItemTopInset = a3;
}

- (BOOL)isFilteredByFocus
{
  return self->_isFilteredByFocus;
}

- (CKPinnedConversationViewDelegate)delegate
{
  return (CKPinnedConversationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAFilter)dimmingFilter
{
  return self->_dimmingFilter;
}

- (void)setDimmingFilter:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingFilter, a3);
}

- (CKPinnedConversationActivityView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_activityView, a3);
}

- (UIImageView)avatarSnapshotImageView
{
  return self->_avatarSnapshotImageView;
}

- (void)setAvatarSnapshotImageView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarSnapshotImageView, a3);
}

- (VNFaceLandmarkRegion2D)avatarMouthRegion
{
  return self->_avatarMouthRegion;
}

- (void)setAvatarMouthRegion:(id)a3
{
  objc_storeStrong((id *)&self->_avatarMouthRegion, a3);
}

- (NSMutableArray)activeActivitySuppressionReasons
{
  return self->_activeActivitySuppressionReasons;
}

- (void)setActiveActivitySuppressionReasons:(id)a3
{
  objc_storeStrong((id *)&self->_activeActivitySuppressionReasons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeActivitySuppressionReasons, 0);
  objc_storeStrong((id *)&self->_avatarMouthRegion, 0);
  objc_storeStrong((id *)&self->_avatarSnapshotImageView, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_dimmingFilter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radiantShadowImageView, 0);
  objc_storeStrong((id *)&self->_unreadIndicator, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_avatarSnapshot, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_recentMessagesInPinnedConversations, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
