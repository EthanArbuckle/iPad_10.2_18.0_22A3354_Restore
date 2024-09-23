@implementation HUAnnouncementGlobeView

- (HUAnnouncementGlobeView)initWithAnnouncementPayload:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  HUAnnouncementGlobeView *v8;
  HUAnnouncementGlobeView *v9;
  void *v10;
  uint64_t v11;
  NSString *announcementGroupID;
  uint64_t v13;
  NSMutableDictionary *announcementsInfo;
  uint64_t v15;
  NSMutableArray *announcementIDs;
  uint64_t v17;
  NSMutableArray *currentlyDisplayedAnnouncements;
  uint64_t v19;
  NSMutableArray *visitedAnnouncements;
  uint64_t v21;
  UITapGestureRecognizer *tapGestureRecognizer;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *dataSourceUpdateQueue;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HUAnnouncementGlobeView;
  v8 = -[HUAnnouncementGlobeView initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_globeViewDelegate, v7);
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A08]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7C90]);
    v11 = objc_claimAutoreleasedReturnValue();
    announcementGroupID = v9->_announcementGroupID;
    v9->_announcementGroupID = (NSString *)v11;

    v13 = objc_opt_new();
    announcementsInfo = v9->_announcementsInfo;
    v9->_announcementsInfo = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    announcementIDs = v9->_announcementIDs;
    v9->_announcementIDs = (NSMutableArray *)v15;

    v17 = objc_opt_new();
    currentlyDisplayedAnnouncements = v9->_currentlyDisplayedAnnouncements;
    v9->_currentlyDisplayedAnnouncements = (NSMutableArray *)v17;

    v19 = objc_opt_new();
    visitedAnnouncements = v9->_visitedAnnouncements;
    v9->_visitedAnnouncements = (NSMutableArray *)v19;

    -[NSMutableDictionary setObject:forKey:](v9->_announcementsInfo, "setObject:forKey:", &unk_1E7041050, *MEMORY[0x1E0CF7CC0]);
    -[NSMutableDictionary setObject:forKey:](v9->_announcementsInfo, "setObject:forKey:", v6, v10);
    -[NSMutableArray addObject:](v9->_announcementIDs, "addObject:", v10);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v9, sel__togglePlayback_);
    tapGestureRecognizer = v9->_tapGestureRecognizer;
    v9->_tapGestureRecognizer = (UITapGestureRecognizer *)v21;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("com.apple.dataSourceUpdateQueue", v23);
    dataSourceUpdateQueue = v9->_dataSourceUpdateQueue;
    v9->_dataSourceUpdateQueue = (OS_dispatch_queue *)v24;

    v9->_totalNumberOfAnnouncements = 1;
    v9->_seedOnceToken = 0;
    v9->_displayVisitedOnceToken = 0;
    -[HUAnnouncementGlobeView _setupSubviewsForAnnouncementInfo:](v9, "_setupSubviewsForAnnouncementInfo:", v6);
    -[HUAnnouncementGlobeView _setupIncomingAnnouncementSession](v9, "_setupIncomingAnnouncementSession");

  }
  return v9;
}

- (BOOL)hasActivePlaybackSession
{
  void *v2;
  BOOL v3;

  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_setupSubviewsForAnnouncementInfo:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *backgroundView;
  HUAnnouncementPlaybackView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  UIView *v17;
  UIView *tappableCoverView;
  void *v19;
  void *v20;
  void *v21;
  UIImageView *v22;
  UIImageView *playImageView;
  void *v24;
  void *v25;
  void *v26;
  UIImageView *v27;
  void *v28;
  HUAnnouncementPlaybackView *v29;

  v4 = (objc_class *)MEMORY[0x1E0CEABE8];
  v5 = a3;
  v6 = [v4 alloc];
  -[HUAnnouncementGlobeView _blurEffectForCurrentInterfaceStyle](self, "_blurEffectForCurrentInterfaceStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (UIVisualEffectView *)objc_msgSend(v6, "initWithEffect:", v7);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v8;

  -[HUAnnouncementGlobeView _configureVisualStyleForBackgroundView](self, "_configureVisualStyleForBackgroundView");
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVisualEffectView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 0);
  -[HUAnnouncementGlobeView addSubview:](self, "addSubview:", self->_backgroundView);
  v10 = [HUAnnouncementPlaybackView alloc];
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v29 = -[HUAnnouncementPlaybackView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
  -[HUAnnouncementPlaybackView setAnnouncementInfo:](v29, "setAnnouncementInfo:", v5);

  -[HUAnnouncementPlaybackView setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HUAnnouncementPlaybackView setUserInteractionEnabled:](v29, "setUserInteractionEnabled:", 0);
  -[UIVisualEffectView contentView](self->_backgroundView, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v29);

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v29);

  v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v11, v12, v13, v14);
  tappableCoverView = self->_tappableCoverView;
  self->_tappableCoverView = v17;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_tappableCoverView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_tappableCoverView, "setBackgroundColor:", v19);

  -[UIView addGestureRecognizer:](self->_tappableCoverView, "addGestureRecognizer:", self->_tapGestureRecognizer);
  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStopPlayback_AX_Label_Title"), CFSTR("HUAnnounceStopPlayback_AX_Label_Title"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setAccessibilityLabel:](self->_tappableCoverView, "setAccessibilityLabel:", v20);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStopPlayback_AX_Label_Hint"), CFSTR("HUAnnounceStopPlayback_AX_Label_Hint"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setAccessibilityHint:](self->_tappableCoverView, "setAccessibilityHint:", v21);

  -[UIView setIsAccessibilityElement:](self->_tappableCoverView, "setIsAccessibilityElement:", 1);
  -[HUAnnouncementGlobeView addSubview:](self, "addSubview:", self->_tappableCoverView);
  v22 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v11, v12, v13, v14);
  playImageView = self->_playImageView;
  self->_playImageView = v22;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_playImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("play.fill"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB538], -1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "imageWithConfiguration:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView setContentMode:](self->_playImageView, "setContentMode:", 1);
  -[UIImageView setImage:](self->_playImageView, "setImage:", v26);
  v27 = self->_playImageView;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](v27, "setTintColor:", v28);

  -[UIImageView setAlpha:](self->_playImageView, "setAlpha:", 0.0);
  -[UIView addSubview:](self->_tappableCoverView, "addSubview:", self->_playImageView);

}

- (void)updateConstraints
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
  void *v12;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)HUAnnouncementGlobeView;
  -[HUAnnouncementGlobeView updateConstraints](&v58, sel_updateConstraints);
  v3 = (void *)objc_opt_new();
  -[UIVisualEffectView centerXAnchor](self->_backgroundView, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView centerXAnchor](self, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[UIVisualEffectView centerYAnchor](self->_backgroundView, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView centerYAnchor](self, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  -[UIVisualEffectView heightAnchor](self->_backgroundView, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView heightAnchor](self, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  -[UIVisualEffectView widthAnchor](self->_backgroundView, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView heightAnchor](self->_backgroundView, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView centerXAnchor](self->_backgroundView, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCenterXConstraint:", v20);

  objc_msgSend(v17, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView centerYAnchor](self->_backgroundView, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCenterYConstraint:", v23);

  objc_msgSend(v17, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 120.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHeightConstraint:", v25);

  objc_msgSend(v17, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWidthConstraint:", v28);

  objc_msgSend(v17, "centerXConstraint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  objc_msgSend(v17, "centerYConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  objc_msgSend(v17, "heightConstraint");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v31);

  objc_msgSend(v17, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v34);

  -[UIView centerXAnchor](self->_tappableCoverView, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView centerXAnchor](self, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v37);

  -[UIView centerYAnchor](self->_tappableCoverView, "centerYAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView centerYAnchor](self, "centerYAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v40);

  -[UIView heightAnchor](self->_tappableCoverView, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView heightAnchor](self, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v43);

  -[UIView widthAnchor](self->_tappableCoverView, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView heightAnchor](self, "heightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v46);

  -[UIImageView centerXAnchor](self->_playImageView, "centerXAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_tappableCoverView, "centerXAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v49);

  -[UIImageView centerYAnchor](self->_playImageView, "centerYAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_tappableCoverView, "centerYAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v52);

  -[UIImageView heightAnchor](self->_playImageView, "heightAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToConstant:", 44.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v54);

  -[UIImageView widthAnchor](self->_playImageView, "widthAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView heightAnchor](self->_playImageView, "heightAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v57);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
  objc_msgSend(v17, "setNeedsUpdateConstraints");

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAnnouncementGlobeView;
  -[HUAnnouncementGlobeView layoutSubviews](&v6, sel_layoutSubviews);
  -[HUAnnouncementGlobeView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 1);

  -[HUAnnouncementGlobeView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView bounds](self, "bounds");
  objc_msgSend(v4, "setCornerRadius:", v5 * 0.5);

}

- (void)skipToNextAnnouncement
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaying");

  if (v4)
  {
    -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stop");

    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "playbackStopped");
    -[HUAnnouncementGlobeView _playNextAnnouncement](self, "_playNextAnnouncement");

  }
}

- (void)stopPlayback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[HUAnnouncementGlobeView playImageView](self, "playImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStartPlayback_AX_Label_Title"), CFSTR("HUAnnounceStartPlayback_AX_Label_Title"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView tappableCoverView](self, "tappableCoverView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceResumePlayback_AX_Label_Hint"), CFSTR("HUAnnounceResumePlayback_AX_Label_Hint"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView tappableCoverView](self, "tappableCoverView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityHint:", v7);

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "playbackStopped");
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v17++), "setAlpha:", 0.5);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

    -[HUAnnouncementGlobeView globeViewDelegate](self, "globeViewDelegate");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[HUAnnouncementGlobeView globeViewDelegate](self, "globeViewDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        -[HUAnnouncementGlobeView globeViewDelegate](self, "globeViewDelegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "announcementInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "didSelectItemWithInfo:totalNumberOfAnnouncements:", v23, -[HUAnnouncementGlobeView totalNumberOfAnnouncements](self, "totalNumberOfAnnouncements"));

      }
    }

  }
  -[HUAnnouncementGlobeView setAudioPlayer:](self, "setAudioPlayer:", 0);
  -[HUAnnouncementGlobeView announceRemotePlaybackSession](self, "announceRemotePlaybackSession");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView lastPlayedAnnouncementID](self, "lastPlayedAnnouncementID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPlaybackStoppedForAnnouncement:", v25);

}

- (void)teardownAnnouncements
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaying");

  -[HUAnnouncementGlobeView announceRemotePlaybackSession](self, "announceRemotePlaybackSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endSession");

  -[HUAnnouncementGlobeView setAnnounceRemotePlaybackSession:](self, "setAnnounceRemotePlaybackSession:", 0);
  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stop");

  if (v4)
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "announcementInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A08]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAnnouncementGlobeView _submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:forAnnouncementID:interruptedByUser:](self, "_submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:forAnnouncementID:interruptedByUser:", 1, v10, 1);
  }
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[HUAnnouncementGlobeView announcementIDs](self, "announcementIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

  -[HUAnnouncementGlobeView announcementsInfo](self, "announcementsInfo");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

}

- (void)_configureVisualStyleForBackgroundView
{
  void *v3;
  void *v4;
  void *v5;
  UIVisualEffectView *backgroundView;
  id v7;

  -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView _blurEffectForCurrentInterfaceStyle](self, "_blurEffectForCurrentInterfaceStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEffect:", v4);

  -[HUAnnouncementGlobeView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInterfaceStyle");

  backgroundView = self->_backgroundView;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.882352941, 0.88627451, 0.894117647, 1.0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundColor:](backgroundView, "setBackgroundColor:", v7);

}

- (void)_setupIncomingAnnouncementSession
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  -[HUAnnouncementGlobeView announcementGroupID](self, "announcementGroupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CF7E78]);
    -[HUAnnouncementGlobeView setAnnounceRemotePlaybackSession:](self, "setAnnounceRemotePlaybackSession:", v4);

    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Now setting up Announce Remote Playback Session", buf, 2u);
    }

    -[HUAnnouncementGlobeView announceRemotePlaybackSession](self, "announceRemotePlaybackSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementGlobeView announcementGroupID](self, "announcementGroupID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__HUAnnouncementGlobeView__setupIncomingAnnouncementSession__block_invoke;
    v8[3] = &unk_1E6F50650;
    v8[4] = self;
    objc_msgSend(v6, "startSessionForGroupID:announcementsHandler:", v7, v8);

  }
}

void __60__HUAnnouncementGlobeView__setupIncomingAnnouncementSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dataSourceUpdateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HUAnnouncementGlobeView__setupIncomingAnnouncementSession__block_invoke_2;
  v7[3] = &unk_1E6F4C638;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __60__HUAnnouncementGlobeView__setupIncomingAnnouncementSession__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v24 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Received announcements handler callback with [%lu] announcements", buf, 0xCu);
  }

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v24 = v19;
    _os_log_debug_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEBUG, "Received announcements handler callback with announcements = %@", buf, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = 0;
    v8 = *MEMORY[0x1E0CF7CC0];
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contextDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, v8);

      objc_msgSend(v9, "announcementID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v11, v13);

      objc_msgSend(v9, "announcementID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v14);

      ++v7;
    }
    while (v7 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  objc_msgSend(*(id *)(a1 + 40), "setAnnouncementsInfo:", v3);
  objc_msgSend(*(id *)(a1 + 40), "setAnnouncementIDs:", v2);
  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "announcementsInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = (uint64_t)v16;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "New Announcement Info %@", buf, 0xCu);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HUAnnouncementGlobeView__setupIncomingAnnouncementSession__block_invoke_33;
  block[3] = &unk_1E6F4E020;
  block[4] = *(_QWORD *)(a1 + 40);
  v21 = v2;
  v22 = v3;
  v17 = v3;
  v18 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __60__HUAnnouncementGlobeView__setupIncomingAnnouncementSession__block_invoke_33(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v2, "_appendAnnouncements:withInfo:", v4, v3);

}

- (void)_appendAnnouncements:(id)a3 withInfo:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  id v46;
  unint64_t v47;
  NSObject *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  unint64_t v53;
  SEL aSelector;
  const char *aSelectora;
  unint64_t v56;
  _QWORD v57[5];
  id v58;
  SEL v59;
  unint64_t v60;
  uint8_t buf[4];
  HUAnnouncementGlobeView *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  unint64_t v66;
  __int16 v67;
  unint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[HUAnnouncementGlobeView _seedVisitedAnouncements:withInfo:](self, "_seedVisitedAnouncements:withInfo:", v7, v8);
  -[HUAnnouncementGlobeView setTotalNumberOfAnnouncements:](self, "setTotalNumberOfAnnouncements:", objc_msgSend(v7, "count"));
  v9 = -[HUAnnouncementGlobeView _indexOfLatestCachedAnnouncementFromIDs:](self, "_indexOfLatestCachedAnnouncementFromIDs:", v7);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_29;
  v10 = v9;
  v11 = objc_msgSend(v7, "count") + ~v9;
  v12 = -[HUAnnouncementGlobeView _numberOfSlotsAvailableForNewAnnouncements:](self, "_numberOfSlotsAvailableForNewAnnouncements:", v7);
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v62 = self;
    v63 = 2112;
    v64 = v14;
    v65 = 2048;
    v66 = v11;
    v67 = 2048;
    v68 = v12;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ New Announcements count = %lu, Free slots = %lu", buf, 0x2Au);

  }
  if (v11 && v12)
  {
    v15 = (void *)objc_opt_new();
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v12 >= v11)
      v18 = v11;
    else
      v18 = v12;
    if (v17 == 3)
    {
      aSelector = a2;
      v56 = v18;
      if (v18 <= 2)
      {
        v19 = 2 - v18;
        v20 = 2;
        do
        {
          -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements", aSelector);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "insertObject:atIndex:", v22, 0);

          objc_msgSend(v15, "addObject:", v22);
          --v20;
        }
        while (v20 > v19);
      }
      -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements", aSelector);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeObjectsInArray:", v15);

      HFLogForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      a2 = aSelectora;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(aSelectora);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v62 = self;
        v63 = 2112;
        v64 = v26;
        v65 = 2112;
        v66 = (unint64_t)v15;
        _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@ [Insert-Operation] Removing and Pushing back views into visited announcements = %@", buf, 0x20u);

      }
      v27 = v56;
    }
    else
    {
      v27 = 0;
    }
    -[HUAnnouncementGlobeView _addOrInsertAnnouncementsFromIDs:withInfo:withinRange:inFreeSlots:](self, "_addOrInsertAnnouncementsFromIDs:withInfo:withinRange:inFreeSlots:", v7, v8, v10);
    -[HUAnnouncementGlobeView _addVisitedAnnouncementsToDisplayQueueIfNeeded](self, "_addVisitedAnnouncementsToDisplayQueueIfNeeded");
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAnnouncementGlobeView _setupConstrainstsForPlaybackViews](self, "_setupConstrainstsForPlaybackViews");
    -[HUAnnouncementGlobeView globeViewDelegate](self, "globeViewDelegate");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v41 = (void *)v40;
      -[HUAnnouncementGlobeView globeViewDelegate](self, "globeViewDelegate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_opt_respondsToSelector();

      if ((v43 & 1) != 0)
      {
        -[HUAnnouncementGlobeView globeViewDelegate](self, "globeViewDelegate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "announcementInfo");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "didSelectItemWithInfo:totalNumberOfAnnouncements:", v45, -[HUAnnouncementGlobeView totalNumberOfAnnouncements](self, "totalNumberOfAnnouncements"));

      }
    }
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __57__HUAnnouncementGlobeView__appendAnnouncements_withInfo___block_invoke;
    v57[3] = &unk_1E6F55748;
    v57[4] = self;
    v58 = v15;
    v59 = a2;
    v60 = v27;
    v46 = v15;
    -[HUAnnouncementGlobeView _layoutPlaybackViewsWithAnimationDuration:completion:](self, "_layoutPlaybackViewsWithAnimationDuration:completion:", v57, 0.5);

    goto LABEL_29;
  }
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v28, "count"))
    goto LABEL_19;
  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {

LABEL_19:
    goto LABEL_20;
  }
  v47 = -[HUAnnouncementGlobeView _numberOfUnplayedAnnouncements](self, "_numberOfUnplayedAnnouncements");

  if (!v47)
  {
LABEL_20:
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAnnouncementGlobeView globeViewDelegate](self, "globeViewDelegate");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)v32;
      -[HUAnnouncementGlobeView globeViewDelegate](self, "globeViewDelegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_opt_respondsToSelector();

      if ((v35 & 1) != 0)
      {
        -[HUAnnouncementGlobeView globeViewDelegate](self, "globeViewDelegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "announcementInfo");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "didSelectItemWithInfo:totalNumberOfAnnouncements:", v37, -[HUAnnouncementGlobeView totalNumberOfAnnouncements](self, "totalNumberOfAnnouncements"));

      }
    }

    goto LABEL_29;
  }
  HFLogForCategory();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[HUAnnouncementGlobeView _numberOfUnplayedAnnouncements](self, "_numberOfUnplayedAnnouncements");
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v62 = self;
    v63 = 2112;
    v64 = v49;
    v65 = 2048;
    v66 = v50;
    v67 = 2112;
    v68 = (unint64_t)v51;
    _os_log_impl(&dword_1B8E1E000, v48, OS_LOG_TYPE_DEFAULT, "%@:%@ Now Playing [%lu] unplayed announcements [%@]....", buf, 0x2Au);

  }
  -[HUAnnouncementGlobeView _addVisitedAnnouncementsToDisplayQueueIfNeeded](self, "_addVisitedAnnouncementsToDisplayQueueIfNeeded");
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "count");

  if (v53 >= 2)
  {
    -[HUAnnouncementGlobeView _setupConstrainstsForPlaybackViews](self, "_setupConstrainstsForPlaybackViews");
    -[HUAnnouncementGlobeView _layoutPlaybackViewsWithAnimationDuration:completion:](self, "_layoutPlaybackViewsWithAnimationDuration:completion:", 0, 0.5);
  }
  -[HUAnnouncementGlobeView _togglePlayback:](self, "_togglePlayback:", 0);
LABEL_29:

}

void __57__HUAnnouncementGlobeView__appendAnnouncements_withInfo___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v18 = 138412802;
    v19 = v4;
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@:%@ Animation Complete! Removing unused views [%@] ", (uint8_t *)&v18, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "makeObjectsPerformSelector:", sel_removeFromSuperview);
  objc_msgSend(*(id *)(a1 + 32), "audioPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

    goto LABEL_6;
  }
  if (!*(_QWORD *)(a1 + 56))
  {
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "audioPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "currentlyDisplayedAnnouncements");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "resumePlaybackAnimation");
    }
    else
    {
      HFLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "currentlyDisplayedAnnouncements");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412802;
        v19 = v15;
        v20 = 2112;
        v21 = v16;
        v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Starting playback for added announcements [%@]....", (uint8_t *)&v18, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "_togglePlayback:", 0);
    }
    return;
  }
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Now Playing recently added announcements...", (uint8_t *)&v18, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_playRecentlyAddedAnnouncements");
}

- (void)_seedVisitedAnouncements:(id)a3 withInfo:(id)a4
{
  id v7;
  id v8;
  int64_t seedOnceToken;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  SEL v18;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HUAnnouncementGlobeView__seedVisitedAnouncements_withInfo___block_invoke;
  block[3] = &unk_1E6F54020;
  block[4] = self;
  v16 = v7;
  v17 = v8;
  v18 = a2;
  seedOnceToken = self->_seedOnceToken;
  v10 = v8;
  v11 = v7;
  v14 = v11;
  if (seedOnceToken == -1)
  {
    v12 = v11;
    v13 = v10;
  }
  else
  {
    dispatch_once(&self->_seedOnceToken, block);
    v12 = v16;
    v13 = v17;
  }

}

void __61__HUAnnouncementGlobeView__seedVisitedAnouncements_withInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  HUAnnouncementPlaybackView *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentlyDisplayedAnnouncements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "announcementInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7CC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6)
  {
    v7 = 0;
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      if (v7 >= objc_msgSend(*(id *)(a1 + 40), "count"))
        break;
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HUAnnouncementPlaybackView initWithFrame:]([HUAnnouncementPlaybackView alloc], "initWithFrame:", v8, v9, v10, v11);
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementPlaybackView setAnnouncementInfo:](v13, "setAnnouncementInfo:", v14);

      -[HUAnnouncementPlaybackView setFullyPlayed:](v13, "setFullyPlayed:", 1);
      -[HUAnnouncementPlaybackView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[HUAnnouncementPlaybackView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
      -[HUAnnouncementPlaybackView setAlpha:](v13, "setAlpha:", 0.0);
      objc_msgSend(*(id *)(a1 + 32), "visitedAnnouncements");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v13);

      ++v7;
    }
    while (v6 != v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "visitedAnnouncements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "visitedAnnouncements");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v19;
      v24 = 2112;
      v25 = v20;
      v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ Seeded visitedAnnouncements =  [%@]", (uint8_t *)&v22, 0x20u);

    }
  }

}

- (void)_addVisitedAnnouncementsToDisplayQueueIfNeeded
{
  int64_t *p_displayVisitedOnceToken;
  _QWORD block[5];

  p_displayVisitedOnceToken = &self->_displayVisitedOnceToken;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HUAnnouncementGlobeView__addVisitedAnnouncementsToDisplayQueueIfNeeded__block_invoke;
  block[3] = &unk_1E6F4D988;
  block[4] = self;
  if (*p_displayVisitedOnceToken != -1)
    dispatch_once(p_displayVisitedOnceToken, block);
}

void __73__HUAnnouncementGlobeView__addVisitedAnnouncementsToDisplayQueueIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "visitedAnnouncements");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
    goto LABEL_10;
  objc_msgSend(*(id *)(a1 + 32), "currentlyDisplayedAnnouncements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 <= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "visitedAnnouncements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    objc_msgSend(*(id *)(a1 + 32), "currentlyDisplayedAnnouncements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 3 - objc_msgSend(v6, "count");

    v8 = v5 >= v7 ? v7 : v5;
    if (v8)
    {
      for (i = 0; i != v8; ++i)
      {
        objc_msgSend(*(id *)(a1 + 32), "visitedAnnouncements");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "currentlyDisplayedAnnouncements");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v11);

        objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v11, "setUserInteractionEnabled:", 0);
        objc_msgSend(*(id *)(a1 + 32), "backgroundView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", v11);

      }
      objc_msgSend(*(id *)(a1 + 32), "visitedAnnouncements");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectsInRange:", 0, v8);
LABEL_10:

    }
  }
}

- (void)_setupConstrainstsForPlaybackViews
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  HUAnnouncementGlobeView *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") < 3)
  {
    v11 = 0;
  }
  else
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HUAnnouncementGlobeView _layoutPlaybackViewCenteredIfNeeded:](self, "_layoutPlaybackViewCenteredIfNeeded:", v5);
  -[HUAnnouncementGlobeView _setupConstraintsForPlaybackViewIfNeeded:slotPosition:](self, "_setupConstraintsForPlaybackViewIfNeeded:slotPosition:", v7, 2);
  -[HUAnnouncementGlobeView _setupConstraintsForPlaybackViewIfNeeded:slotPosition:](self, "_setupConstraintsForPlaybackViewIfNeeded:slotPosition:", v11, 3);
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Setup complete for All Playback views. Animation Begins!", (uint8_t *)&v16, 0x16u);

  }
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "pausePlaybackAnimation");
}

- (void)_layoutPlaybackViewsWithAnimationDuration:(double)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  SEL v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;

  v7 = a4;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__16;
  v27[4] = __Block_byref_object_dispose__16;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") <= 1)
  {
    v28 = 0;
  }
  else
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v28 = (id)objc_claimAutoreleasedReturnValue();

  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__16;
  v25[4] = __Block_byref_object_dispose__16;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "count") < 3)
  {
    v26 = 0;
  }
  else
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  v14 = MEMORY[0x1E0C809B0];
  v15 = (void *)MEMORY[0x1E0CEABB0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__HUAnnouncementGlobeView__layoutPlaybackViewsWithAnimationDuration_completion___block_invoke;
  v20[3] = &unk_1E6F55770;
  v20[4] = self;
  v16 = v9;
  v21 = v16;
  v22 = v27;
  v23 = v25;
  v24 = a2;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __80__HUAnnouncementGlobeView__layoutPlaybackViewsWithAnimationDuration_completion___block_invoke_37;
  v18[3] = &unk_1E6F4D410;
  v18[4] = self;
  v17 = v7;
  v19 = v17;
  objc_msgSend(v15, "animateWithDuration:animations:completion:", v20, v18, a3);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);

}

uint64_t __80__HUAnnouncementGlobeView__layoutPlaybackViewsWithAnimationDuration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "playImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "currentlyDisplayedAnnouncements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "centerXConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constant");
    v6 = v5;

    if (v6 == 0.0)
    {
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 40);
        v12 = 138412802;
        v13 = v8;
        v14 = 2112;
        v15 = v9;
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating constraints for view [%@] to display in the first slot", (uint8_t *)&v12, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "_updateLayoutAndAppearanceForPlaybackView:atSlotPosition:", *(_QWORD *)(a1 + 40), 1);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "_updateLayoutAndAppearanceForPlaybackView:atSlotPosition:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 2);
  objc_msgSend(*(id *)(a1 + 32), "_updateLayoutAndAppearanceForPlaybackView:atSlotPosition:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 3);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __80__HUAnnouncementGlobeView__layoutPlaybackViewsWithAnimationDuration_completion___block_invoke_37(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t result;

  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStartPlayback_AX_Label_Title"), CFSTR("HUAnnounceStartPlayback_AX_Label_Title"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tappableCoverView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStartPlayback_AX_Label_Hint"), CFSTR("HUAnnounceStartPlayback_AX_Label_Hint"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tappableCoverView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityHint:", v6);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (unint64_t)_indexOfLatestCachedAnnouncementFromIDs:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  HUAnnouncementGlobeView *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = 0;
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = self;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    v11 = *MEMORY[0x1E0CF7A08];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "announcementInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v4, "indexOfObject:", v14);
        if (v15 <= v6)
          v16 = v6;
        else
          v16 = v15;
        if (v6 != 0x7FFFFFFFFFFFFFFFLL)
          v6 = v16;

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  -[HUAnnouncementGlobeView visitedAnnouncements](v26, "visitedAnnouncements");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[HUAnnouncementGlobeView visitedAnnouncements](v26, "visitedAnnouncements");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "announcementInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A08]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v4, "indexOfObject:", v22);

    if (v23 <= v6)
      v24 = v6;
    else
      v24 = v23;
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      v6 = v24;

  }
  return v6;
}

- (unint64_t)_numberOfSlotsAvailableForNewAnnouncements:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  HUAnnouncementGlobeView *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 3)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v23 = self;
      v10 = *(_QWORD *)v27;
      v11 = *MEMORY[0x1E0CF7A08];
      v12 = 3;
      while (2)
      {
        v13 = 0;
        v25 = v12;
        v24 = v12 - v9;
        do
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
          objc_msgSend(v14, "announcementInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v4, "indexOfObject:", v16);

          if (!v17)
          {
            -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](v23, "currentlyDisplayedAnnouncements");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v25 - v13;
            if (objc_msgSend(v20, "isEqual:", v14))
            {
              v21 = -[HUAnnouncementGlobeView hasActivePlaybackSession](v23, "hasActivePlaybackSession");

              if (v21)
                v18 = 0;
            }
            else
            {

            }
            goto LABEL_18;
          }
          ++v13;
        }
        while (v9 != v13);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        v18 = v24;
        v12 = v24;
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v18 = 3;
    }
LABEL_18:

  }
  else
  {
    v18 = 3 - v6;
  }

  return v18;
}

- (void)_addOrInsertAnnouncementsFromIDs:(id)a3 withInfo:(id)a4 withinRange:(_NSRange)a5 inFreeSlots:(unint64_t)a6
{
  NSUInteger location;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  HUAnnouncementPlaybackView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  NSUInteger length;
  NSUInteger v42;
  id v43;
  uint8_t buf[4];
  HUAnnouncementGlobeView *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  _BYTE v49[14];
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  length = a5.length;
  location = a5.location;
  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v43 = a4;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "announcementInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A08]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "indexOfObject:", v14);

  v36 = v12;
  if (v15)
    v16 = 0;
  else
    v16 = objc_msgSend(v12, "fullyPlayed");
  v17 = location + 1;
  v42 = location + length;
  if (location + 1 <= location + length)
  {
    v18 = 0;
    v19 = 0;
    v20 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v37 = a6 - 3;
    v38 = a6 - 2;
    v39 = v10;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v17 + v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[HUAnnouncementPlaybackView initWithFrame:]([HUAnnouncementPlaybackView alloc], "initWithFrame:", v20, v21, v22, v23);
      objc_msgSend(v43, "objectForKeyedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementPlaybackView setAnnouncementInfo:](v25, "setAnnouncementInfo:", v26);

      -[HUAnnouncementPlaybackView setTranslatesAutoresizingMaskIntoConstraints:](v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[HUAnnouncementPlaybackView setUserInteractionEnabled:](v25, "setUserInteractionEnabled:", 0);
      -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "contentView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addSubview:", v25);

      -[HUAnnouncementPlaybackView setAlpha:](v25, "setAlpha:", 0.0);
      if (v16)
      {
        if (length + v18 <= 1)
          goto LABEL_15;
        -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count") - 1;

        if ((v30 & 0x8000000000000000) == 0)
          goto LABEL_16;
      }
      else
      {
        if (length - 1 == v19 && v38 == v19)
        {
          v30 = 1;
LABEL_16:
          HFLogForCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(a2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v45 = self;
            v46 = 2112;
            v47 = v32;
            v48 = 1024;
            *(_DWORD *)v49 = v16;
            *(_WORD *)&v49[4] = 2112;
            *(_QWORD *)&v49[6] = v25;
            v50 = 2048;
            v51 = v30;
            _os_log_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@ [Insert-Operation-DM] InsertInFirstSlot = [%d] Inserting [%@] at index = [%ld]", buf, 0x30u);

            v10 = v39;
          }

          -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "insertObject:atIndex:", v25, v30);
          goto LABEL_22;
        }
        if (length != v19 && v37 == v19)
        {
LABEL_15:
          v30 = 0;
          goto LABEL_16;
        }
      }
      HFLogForCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v45 = self;
        v46 = 2112;
        v47 = v35;
        v48 = 2112;
        *(_QWORD *)v49 = v25;
        _os_log_impl(&dword_1B8E1E000, v34, OS_LOG_TYPE_DEFAULT, "%@:%@ [Append-Operation-DM] Appending [%@] to displayed announcements", buf, 0x20u);

        v10 = v39;
      }

      -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v25);
LABEL_22:

      ++v19;
      --v18;
    }
    while (v17 + v19 <= v42);
  }

}

- (void)_showVisitedAnnouncementsView
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD *v47;
  SEL v48;
  _QWORD v49[4];
  id v50;
  HUAnnouncementGlobeView *v51;
  id v52;
  id v53;
  _QWORD *v54;
  _QWORD v55[5];
  id v56;
  uint8_t buf[4];
  HUAnnouncementGlobeView *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__16;
  v55[4] = __Block_byref_object_dispose__16;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v56 = (id)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  }
  else
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") < 3)
  {

  }
  else
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_11;
  }
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (unint64_t)objc_msgSend(v11, "count") > 1;

  if (v12)
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
LABEL_11:
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v14, "count") < 3)
  {
    v17 = 0;
    goto LABEL_15;
  }
  -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count") == 0;

  if (!v16)
  {
    -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  v17 = 0;
LABEL_16:
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeAllObjects");

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "na_safeAddObject:", v7);

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "na_safeAddObject:", v10);

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "na_safeAddObject:", v17);

  HFLogForCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v58 = self;
    v59 = 2112;
    v60 = v23;
    v61 = 2112;
    v62 = v24;
    _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@ Updated data model to display announcements =  [%@]....", buf, 0x20u);

  }
  -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    HFLogForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v58 = self;
      v59 = 2112;
      v60 = v28;
      v61 = 2112;
      v62 = v30;
      _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@ Removing oldest visited announcement since we already pulled it in to display = %@.", buf, 0x20u);

    }
    -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeObjectAtIndex:", 0);

  }
  if (v17)
  {
    objc_msgSend(v17, "superview");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 == 0;

    if (v33)
    {
      v34 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v17, "constraints");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "deactivateConstraints:", v35);

      -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "contentView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addSubview:", v17);

      objc_msgSend(v17, "setAlpha:", 0.0);
      -[HUAnnouncementGlobeView _setupConstraintsForPlaybackViewIfNeeded:slotPosition:](self, "_setupConstraintsForPlaybackViewIfNeeded:slotPosition:", v17, 3);
    }
  }
  HFLogForCategory();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v58 = self;
    v59 = 2112;
    v60 = v39;
    _os_log_impl(&dword_1B8E1E000, v38, OS_LOG_TYPE_DEFAULT, "%@:%@ Begin animating announcements", buf, 0x16u);

  }
  v40 = (void *)MEMORY[0x1E0CEABB0];
  v41 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __56__HUAnnouncementGlobeView__showVisitedAnnouncementsView__block_invoke;
  v49[3] = &unk_1E6F55798;
  v42 = v10;
  v50 = v42;
  v51 = self;
  v52 = v7;
  v43 = v17;
  v53 = v43;
  v54 = v55;
  v45[0] = v41;
  v45[1] = 3221225472;
  v45[2] = __56__HUAnnouncementGlobeView__showVisitedAnnouncementsView__block_invoke_2;
  v45[3] = &unk_1E6F557C0;
  v47 = v55;
  v48 = a2;
  v45[4] = self;
  v44 = v52;
  v46 = v44;
  objc_msgSend(v40, "animateWithDuration:animations:completion:", v49, v45, 0.25);

  _Block_object_dispose(v55, 8);
}

uint64_t __56__HUAnnouncementGlobeView__showVisitedAnnouncementsView__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  CGAffineTransform v9;
  CGAffineTransform v10;
  _OWORD v11[3];

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "_updateLayoutAndAppearanceForPlaybackView:atSlotPosition:", *(_QWORD *)(a1 + 48), 1);
  v2 = *(void **)(a1 + 48);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v11[0] = *MEMORY[0x1E0C9BAA8];
  v11[1] = v3;
  v11[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v11);
  objc_msgSend(*(id *)(a1 + 48), "setNeedsUpdateConstraints");
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.5);
  objc_msgSend(*(id *)(a1 + 40), "_updateLayoutAndAppearanceForPlaybackView:atSlotPosition:", *(_QWORD *)(a1 + 32), 2);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateConstraints");
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.5);
  v4 = *(void **)(a1 + 56);
  if (v4)
  {
    objc_msgSend(v4, "alpha");
    if (v5 == 0.0)
    {
      CGAffineTransformMakeScale(&v10, 0.1, 0.1);
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v9 = v10;
      objc_msgSend(v6, "setTransform:", &v9);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setAlpha:", 0.0);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateLayoutAndAppearanceForPlaybackView:atSlotPosition:", *(_QWORD *)(a1 + 56), 3);
  objc_msgSend(*(id *)(a1 + 56), "setAlpha:", 0.5);
  objc_msgSend(*(id *)(a1 + 40), "playImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 40), "setLastPlayedAnnouncementID:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

void __56__HUAnnouncementGlobeView__showVisitedAnnouncementsView__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStartPlayback_AX_Label_Title"), CFSTR("HUAnnounceStartPlayback_AX_Label_Title"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tappableCoverView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v3);

    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceResumePlayback_AX_Label_Hint"), CFSTR("HUAnnounceResumePlayback_AX_Label_Hint"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tappableCoverView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityHint:", v5);

    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Finished animating announcements.\nTearing down audio player. Updating UI state to playback stopped.", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setAudioPlayer:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "alpha");
    if (v10 == 0.0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "globeViewDelegate");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(*(id *)(a1 + 32), "globeViewDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "globeViewDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "announcementInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "didSelectItemWithInfo:totalNumberOfAnnouncements:", v16, objc_msgSend(*(id *)(a1 + 32), "totalNumberOfAnnouncements"));

      }
    }
  }
}

- (void)_layoutPlaybackViewCenteredIfNeeded:(id)a3
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  NSObject *v29;
  void *v30;
  int v31;
  HUAnnouncementGlobeView *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "alpha");
    if (v7 == 0.0)
    {
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v6, "setUserInteractionEnabled:", 0);
      -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v6);

      objc_msgSend(v6, "centerXAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "centerXAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCenterXConstraint:", v13);

      objc_msgSend(v6, "centerYAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "centerYAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 0.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCenterYConstraint:", v17);

      objc_msgSend(v6, "heightAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToConstant:", 120.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHeightConstraint:", v19);

      objc_msgSend(v6, "widthAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "heightAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWidthConstraint:", v22);

      v23 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v6, "centerXConstraint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v24;
      objc_msgSend(v6, "centerYConstraint");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v25;
      objc_msgSend(v6, "heightConstraint");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v26;
      objc_msgSend(v6, "widthConstraint");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37[3] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activateConstraints:", v28);

      -[HUAnnouncementGlobeView layoutIfNeeded](self, "layoutIfNeeded");
      HFLogForCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138412802;
        v32 = self;
        v33 = 2112;
        v34 = v30;
        v35 = 2112;
        v36 = v6;
        _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEFAULT, "%@:%@ Playback View layout in center/default position complete for view [%@]", (uint8_t *)&v31, 0x20u);

      }
    }
  }

}

- (void)_setupConstraintsForPlaybackViewIfNeeded:(id)a3 slotPosition:(unint64_t)a4
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
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
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  int v37;
  HUAnnouncementGlobeView *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  unint64_t v44;
  _QWORD v45[5];

  v45[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "alpha");
    if (v9 == 0.0)
    {
      -[HUAnnouncementGlobeView _xCoordinateForPlaybackViewInSlotPosition:](self, "_xCoordinateForPlaybackViewInSlotPosition:", a4);
      v11 = v10;
      -[HUAnnouncementGlobeView _yCoordinateForPlaybackViewInSlotPosition:](self, "_yCoordinateForPlaybackViewInSlotPosition:", a4);
      v13 = v12;
      -[HUAnnouncementGlobeView _radiusOfPlaybackViewInSlotPosition:](self, "_radiusOfPlaybackViewInSlotPosition:", a4);
      v15 = v14;
      objc_msgSend(v8, "centerXAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "centerXAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCenterXConstraint:", v19);

      objc_msgSend(v8, "centerYAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "centerYAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCenterYConstraint:", v23);

      objc_msgSend(v8, "heightAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToConstant:", v15 * 0.5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHeightConstraint:", v25);

      objc_msgSend(v8, "widthAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "heightAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWidthConstraint:", v28);

      v29 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v8, "centerXConstraint");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v30;
      objc_msgSend(v8, "centerYConstraint");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v31;
      objc_msgSend(v8, "heightConstraint");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v45[2] = v32;
      objc_msgSend(v8, "widthConstraint");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v45[3] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "activateConstraints:", v34);

      objc_msgSend(v8, "setNeedsUpdateConstraints");
      -[HUAnnouncementGlobeView layoutIfNeeded](self, "layoutIfNeeded");
      HFLogForCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138413058;
        v38 = self;
        v39 = 2112;
        v40 = v36;
        v41 = 2112;
        v42 = v8;
        v43 = 2048;
        v44 = a4;
        _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "%@:%@ Setting up playback view [%@] to display in slot [%lu]", (uint8_t *)&v37, 0x2Au);

      }
    }
  }

}

- (void)_updateLayoutAndAppearanceForPlaybackView:(id)a3 atSlotPosition:(unint64_t)a4
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  __int128 v19;
  NSObject *v20;
  void *v21;
  _OWORD v22[3];
  uint8_t buf[4];
  HUAnnouncementGlobeView *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[HUAnnouncementGlobeView _xCoordinateForPlaybackViewInSlotPosition:](self, "_xCoordinateForPlaybackViewInSlotPosition:", a4);
  v9 = v8;
  -[HUAnnouncementGlobeView _yCoordinateForPlaybackViewInSlotPosition:](self, "_yCoordinateForPlaybackViewInSlotPosition:", a4);
  v11 = v10;
  -[HUAnnouncementGlobeView _radiusOfPlaybackViewInSlotPosition:](self, "_radiusOfPlaybackViewInSlotPosition:", a4);
  v13 = v12;
  objc_msgSend(v7, "centerXConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConstant:", v9);

  objc_msgSend(v7, "centerYConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", v11);

  objc_msgSend(v7, "heightConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConstant:", v13 + v13);

  v17 = objc_msgSend(v7, "fullyPlayed");
  v18 = 1.0;
  if (v17)
    v18 = 0.5;
  objc_msgSend(v7, "setAlpha:", v18);
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v22[0] = *MEMORY[0x1E0C9BAA8];
  v22[1] = v19;
  v22[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v7, "setTransform:", v22);
  HFLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v24 = self;
    v25 = 2112;
    v26 = v21;
    v27 = 2112;
    v28 = v7;
    v29 = 2048;
    v30 = a4;
    _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating constraints and alpha for playback view [%@] in Slot Position [%lu]", buf, 0x2Au);

  }
}

- (double)_xCoordinateForPlaybackViewInSlotPosition:(unint64_t)a3
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (a3 == 3)
  {
    -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v8 * 0.5 + -49.6;
    v7 = -0.0871557427;
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v9 * 0.5 + -44.0;
    v7 = 0.965925826;
    goto LABEL_7;
  }
  v3 = 0.0;
  if (a3 == 1)
  {
    -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5 * 0.5 + -54.0;
    v7 = -0.707106781;
LABEL_7:
    v3 = v6 * v7;

  }
  return v3;
}

- (double)_yCoordinateForPlaybackViewInSlotPosition:(unint64_t)a3
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (a3 == 3)
  {
    -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v8 * 0.5 + -49.6;
    v7 = 0.996194698;
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v9 * 0.5 + -44.0;
    v7 = 0.258819045;
    goto LABEL_7;
  }
  v3 = 0.0;
  if (a3 == 1)
  {
    -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5 * 0.5 + -54.0;
    v7 = -0.707106781;
LABEL_7:
    v3 = v6 * v7;

  }
  return v3;
}

- (double)_radiusOfPlaybackViewInSlotPosition:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 60.0;
  else
    return dbl_1B94426D0[a3 - 1];
}

- (id)_nextAnnouncementPlaybackView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HUAnnouncementPlaybackView *v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  HUAnnouncementPlaybackView *v30;
  HUAnnouncementPlaybackView *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  void *v47;
  void *v48;
  void *v49;
  _OWORD v51[3];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  HUAnnouncementGlobeView *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  HUAnnouncementPlaybackView *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") <= 2)
  {

    v11 = 0;
    v12 = 0;
    v10 = 0;
LABEL_9:
    v13 = 0;
    goto LABEL_29;
  }
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v10, "fullyPlayed") & 1) != 0)
  {
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v48 = v6;
    v49 = v4;
    v14 = (void *)objc_opt_new();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v53;
      v19 = *MEMORY[0x1E0CF7A08];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v53 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "announcementInfo");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "addObject:", v22);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v17);
    }

    -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = 0;
    }

    v47 = v25;
    objc_msgSend(v25, "announcementInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A08]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAnnouncementGlobeView _onQueue_fetchNewAnnouncementInfo:oldestVisitedAnnouncementID:](self, "_onQueue_fetchNewAnnouncementInfo:oldestVisitedAnnouncementID:", v14, v27);
    v11 = (HUAnnouncementPlaybackView *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    v6 = v48;
    v4 = v49;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v57 = self;
      v58 = 2112;
      v59 = v29;
      v60 = 2112;
      v61 = v11;
      _os_log_impl(&dword_1B8E1E000, v28, OS_LOG_TYPE_DEFAULT, "%@:%@ Next Announcement Info to bring into visibility = [%@]", buf, 0x20u);

    }
    v12 = v11 != 0;
    if (v11)
    {
      v30 = [HUAnnouncementPlaybackView alloc];
      v31 = -[HUAnnouncementPlaybackView initWithFrame:](v30, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[HUAnnouncementPlaybackView setAnnouncementInfo:](v31, "setAnnouncementInfo:", v11);
    }
    else
    {
      v31 = 0;
    }

    if (v31)
    {
      if (!v11)
        goto LABEL_45;
      goto LABEL_34;
    }
  }
  v13 = 1;
LABEL_29:
  -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (HUAnnouncementPlaybackView *)objc_msgSend(v32, "count");

  if (v31)
  {
    -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v31 = (HUAnnouncementPlaybackView *)objc_claimAutoreleasedReturnValue();

    -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "removeObjectAtIndex:", 0);

    HFLogForCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v57 = self;
      v58 = 2112;
      v59 = v36;
      v60 = 2112;
      v61 = v31;
      _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "%@:%@ No, new announcements found. Removing the oldest visited announcement [%@]", buf, 0x20u);

    }
    if ((objc_msgSend(v4, "isEqual:", v31) & 1) == 0)
    {
      -[HUAnnouncementPlaybackView setAlpha:](v31, "setAlpha:", 0.0);
      if (v6)
        v38 = 1;
      else
        v38 = v13;
      if (v10 == 0 && v6 != 0)
        v37 = 2;
      else
        v37 = 3;
      if (((v12 | v38) & 1) == 0)
        goto LABEL_45;
      goto LABEL_42;
    }
  }
  if (!v12)
    goto LABEL_45;
LABEL_34:
  v37 = 3;
LABEL_42:
  HFLogForCategory();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v57 = self;
    v58 = 2112;
    v59 = v40;
    v60 = 2048;
    v61 = (HUAnnouncementPlaybackView *)v37;
    _os_log_impl(&dword_1B8E1E000, v39, OS_LOG_TYPE_DEFAULT, "%@:%@ Now displaying the next announcement in slot position [%lu]", buf, 0x20u);

  }
  v41 = (void *)MEMORY[0x1E0CB3718];
  -[HUAnnouncementPlaybackView constraints](v31, "constraints");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "deactivateConstraints:", v42);

  -[HUAnnouncementPlaybackView setTranslatesAutoresizingMaskIntoConstraints:](v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HUAnnouncementPlaybackView setUserInteractionEnabled:](v31, "setUserInteractionEnabled:", 0);
  -[HUAnnouncementGlobeView backgroundView](self, "backgroundView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addSubview:", v31);

  -[HUAnnouncementPlaybackView setAlpha:](v31, "setAlpha:", 0.0);
  v45 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v51[0] = *MEMORY[0x1E0C9BAA8];
  v51[1] = v45;
  v51[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[HUAnnouncementPlaybackView setTransform:](v31, "setTransform:", v51);
  -[HUAnnouncementGlobeView _setupConstraintsForPlaybackViewIfNeeded:slotPosition:](self, "_setupConstraintsForPlaybackViewIfNeeded:slotPosition:", v31, v37);
LABEL_45:

  return v31;
}

- (void)_togglePlayback:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPlaying");

    if ((v8 & 1) != 0)
    {
      if (a3)
      {
        -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "announcementInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A08]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUAnnouncementGlobeView _submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:forAnnouncementID:interruptedByUser:](self, "_submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:forAnnouncementID:interruptedByUser:", 1, v12, 1);
      }
      -[HUAnnouncementGlobeView stopPlayback](self, "stopPlayback");
      return;
    }
  }
  -[HUAnnouncementGlobeView lastPlayedAnnouncementID](self, "lastPlayedAnnouncementID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[HUAnnouncementGlobeView announcementsInfo](self, "announcementsInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementGlobeView lastPlayedAnnouncementID](self, "lastPlayedAnnouncementID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  }
  else
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "announcementInfo");
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A90]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileURLWithPath:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D311B0]), "initWithAudioFileURL:audioSessionOptions:delegate:", v20, 2, self);
    -[HUAnnouncementGlobeView setAudioPlayer:](self, "setAudioPlayer:", v21);

  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v47 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        -[HUAnnouncementGlobeView lastPlayedAnnouncementID](self, "lastPlayedAnnouncementID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          if (objc_msgSend(v27, "fullyPlayed"))
            v29 = 0.5;
          else
            v29 = 1.0;
        }
        else
        {
          if (!a3)
            continue;
          objc_msgSend(v27, "setFullyPlayed:", 0);
          v29 = 1.0;
        }
        objc_msgSend(v27, "setAlpha:", v29);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v24);
  }

  -[HUAnnouncementGlobeView lastPlayedAnnouncementID](self, "lastPlayedAnnouncementID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "makeObjectsPerformSelector:withObject:", sel_setFullyPlayed_, MEMORY[0x1E0C9AAA0]);

  }
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_msgSend(v33, "fullyPlayed");
  v35 = 1.0;
  if (v34)
    v35 = 0.5;
  objc_msgSend(v33, "setAlpha:", v35);
  -[HUAnnouncementGlobeView _playAnnouncementWithInfo:](self, "_playAnnouncementWithInfo:", v16);
  -[HUAnnouncementGlobeView playImageView](self, "playImageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAlpha:", 0.0);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStopPlayback_AX_Label_Title"), CFSTR("HUAnnounceStopPlayback_AX_Label_Title"), 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView tappableCoverView](self, "tappableCoverView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAccessibilityLabel:", v37);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStopPlayback_AX_Label_Hint"), CFSTR("HUAnnounceStopPlayback_AX_Label_Hint"), 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView tappableCoverView](self, "tappableCoverView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAccessibilityHint:", v39);

  -[HUAnnouncementGlobeView globeViewDelegate](self, "globeViewDelegate");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[HUAnnouncementGlobeView globeViewDelegate](self, "globeViewDelegate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_opt_respondsToSelector();

    if ((v44 & 1) != 0)
    {
      -[HUAnnouncementGlobeView globeViewDelegate](self, "globeViewDelegate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "didSelectItemWithInfo:totalNumberOfAnnouncements:", v16, -[HUAnnouncementGlobeView totalNumberOfAnnouncements](self, "totalNumberOfAnnouncements"));

    }
  }

}

- (void)_playRecentlyAddedAnnouncements
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  HUAnnouncementGlobeView *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isPlaying"),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = self;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Not playing the next announcement since audio player is busy playing", buf, 0x16u);

    }
  }
  else
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "announcementInfo");
    v26 = (id)objc_claimAutoreleasedReturnValue();

    -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A90]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fileURLWithPath:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D311B0]), "initWithAudioFileURL:audioSessionOptions:delegate:", v15, 2, self);
      -[HUAnnouncementGlobeView setAudioPlayer:](self, "setAudioPlayer:", v16);

    }
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "fullyPlayed");
    v20 = 1.0;
    if (v19)
      v20 = 0.5;
    objc_msgSend(v18, "setAlpha:", v20);
    -[HUAnnouncementGlobeView _playAnnouncementWithInfo:](self, "_playAnnouncementWithInfo:", v26);
    -[HUAnnouncementGlobeView playImageView](self, "playImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAlpha:", 0.0);

    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStopPlayback_AX_Label_Title"), CFSTR("HUAnnounceStopPlayback_AX_Label_Title"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementGlobeView tappableCoverView](self, "tappableCoverView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAccessibilityLabel:", v22);

    _HULocalizedStringWithDefaultValue(CFSTR("HUAnnounceStopPlayback_AX_Label_Hint"), CFSTR("HUAnnounceStopPlayback_AX_Label_Hint"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementGlobeView tappableCoverView](self, "tappableCoverView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAccessibilityHint:", v24);

  }
}

- (void)_playAnnouncementWithInfo:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HUAnnouncementGlobeView *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  HUAnnouncementGlobeView *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v7);

  if ((v10 & 1) == 0)
  {
    -[HUAnnouncementGlobeView visitedAnnouncements](self, "visitedAnnouncements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v7);

    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = self;
      v30 = 2112;
      v31 = v13;
      v32 = 2112;
      v33 = v7;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Adding and Playing announcement to visited list [%@]", buf, 0x20u);

    }
  }
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "announcementInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v29 = self;
    v30 = 2112;
    v31 = v15;
    v32 = 2112;
    v33 = v16;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Now Playing announcement with Info [%@]", buf, 0x20u);

  }
  v17 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A90]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fileURLWithPath:", v18);
  v19 = (HUAnnouncementGlobeView *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateAudioFileURL:", v19);

  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v21, "prepareToPlay:", &v27);
  v22 = v27;

  if (v22)
  {
    HFLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v19;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "Audio Player Failed to prepare for announcement URL [%@] with reason[%@]", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A08]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementGlobeView setLastPlayedAnnouncementID:](self, "setLastPlayedAnnouncementID:", v24);

    -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "play");

    -[HUAnnouncementGlobeView announceRemotePlaybackSession](self, "announceRemotePlaybackSession");
    v23 = objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementGlobeView lastPlayedAnnouncementID](self, "lastPlayedAnnouncementID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPlaybackStartedForAnnouncement:](v23, "setPlaybackStartedForAnnouncement:", v26);

  }
}

- (void)_playNextAnnouncement
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  HUAnnouncementGlobeView *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2
    || !-[HUAnnouncementGlobeView _numberOfUnplayedAnnouncements](self, "_numberOfUnplayedAnnouncements"))
  {

    goto LABEL_9;
  }
  v4 = -[HUAnnouncementGlobeView _isNextAnnouncementTheOldest](self, "_isNextAnnouncementTheOldest");

  if (v4)
  {
LABEL_9:
    -[HUAnnouncementGlobeView _showVisitedAnnouncementsView](self, "_showVisitedAnnouncementsView");
    return;
  }
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") < 3)
  {
    v12 = 0;
  }
  else
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HUAnnouncementGlobeView _nextAnnouncementPlaybackView](self, "_nextAnnouncementPlaybackView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v13);

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectAtIndex:", 0);

  v16 = MEMORY[0x1E0C809B0];
  v17 = (void *)MEMORY[0x1E0CEABB0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __48__HUAnnouncementGlobeView__playNextAnnouncement__block_invoke;
  v26[3] = &unk_1E6F557E8;
  v26[4] = self;
  v27 = v8;
  v28 = v13;
  v29 = v6;
  v30 = v12;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __48__HUAnnouncementGlobeView__playNextAnnouncement__block_invoke_2;
  v22[3] = &unk_1E6F54048;
  v23 = v29;
  v24 = self;
  v25 = v27;
  v18 = v27;
  v19 = v29;
  v20 = v12;
  v21 = v13;
  objc_msgSend(v17, "animateWithDuration:animations:completion:", v26, v22, 0.5);

}

uint64_t __48__HUAnnouncementGlobeView__playNextAnnouncement__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CGAffineTransform *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  void *v10;
  int v11;
  double v12;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;

  objc_msgSend(*(id *)(a1 + 32), "_updateLayoutAndAppearanceForPlaybackView:atSlotPosition:", *(_QWORD *)(a1 + 40), 1);
  if (objc_msgSend(*(id *)(a1 + 48), "isEqual:", *(_QWORD *)(a1 + 56)))
  {
    if (*(_QWORD *)(a1 + 64))
      v2 = 3;
    else
      v2 = 2;
    objc_msgSend(*(id *)(a1 + 32), "_updateLayoutAndAppearanceForPlaybackView:atSlotPosition:", *(_QWORD *)(a1 + 48), v2);
    CGAffineTransformMakeScale(&v19, 1.0, 1.0);
    v3 = *(void **)(a1 + 48);
    v18 = v19;
    v4 = &v18;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "setAlpha:", 0.0);
    CGAffineTransformMakeScale(&v17, 0.1, 0.1);
    v5 = *(void **)(a1 + 56);
    v16 = v17;
    objc_msgSend(v5, "setTransform:", &v16);
    objc_msgSend(*(id *)(a1 + 48), "heightConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", 35.2);

    v7 = *(void **)(a1 + 48);
    v8 = objc_msgSend(v7, "fullyPlayed");
    v9 = 1.0;
    if (v8)
      v9 = 0.5;
    objc_msgSend(v7, "setAlpha:", v9);
    CGAffineTransformMakeScale(&v15, 1.0, 1.0);
    v3 = *(void **)(a1 + 48);
    v14 = v15;
    v4 = &v14;
  }
  objc_msgSend(v3, "setTransform:", v4, *(_OWORD *)&v14.a, *(_OWORD *)&v14.c, *(_OWORD *)&v14.tx);
  objc_msgSend(*(id *)(a1 + 32), "_updateLayoutAndAppearanceForPlaybackView:atSlotPosition:", *(_QWORD *)(a1 + 64), 2);
  v10 = *(void **)(a1 + 40);
  v11 = objc_msgSend(v10, "fullyPlayed");
  v12 = 1.0;
  if (v11)
    v12 = 0.5;
  objc_msgSend(v10, "setAlpha:", v12);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __48__HUAnnouncementGlobeView__playNextAnnouncement__block_invoke_2(id *a1, int a2)
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  if (a2)
  {
    objc_msgSend(a1[4], "alpha");
    if (v3 == 0.0)
      objc_msgSend(a1[4], "removeFromSuperview");
    objc_msgSend(a1[5], "globeViewDelegate");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(a1[5], "globeViewDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        objc_msgSend(a1[5], "globeViewDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "announcementInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "didSelectItemWithInfo:totalNumberOfAnnouncements:", v9, objc_msgSend(a1[5], "totalNumberOfAnnouncements"));

      }
    }
    v10 = a1[5];
    objc_msgSend(a1[6], "announcementInfo");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_playAnnouncementWithInfo:", v11);

  }
}

- (unint64_t)_numberOfUnplayedAnnouncements
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (v8)
          v5 += objc_msgSend(v8, "fullyPlayed") ^ 1;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isNextAnnouncementTheOldest
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
    return 1;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "announcementInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7CC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = v9 == 0;
  return v10;
}

- (id)_onQueue_fetchNewAnnouncementInfo:(id)a3 oldestVisitedAnnouncementID:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  SEL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16;
  v23 = __Block_byref_object_dispose__16;
  v24 = 0;
  -[HUAnnouncementGlobeView dataSourceUpdateQueue](self, "dataSourceUpdateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__HUAnnouncementGlobeView__onQueue_fetchNewAnnouncementInfo_oldestVisitedAnnouncementID___block_invoke;
  block[3] = &unk_1E6F55810;
  block[4] = self;
  v15 = v7;
  v17 = &v19;
  v18 = a2;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(v9, block);

  v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __89__HUAnnouncementGlobeView__onQueue_fetchNewAnnouncementInfo_oldestVisitedAnnouncementID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "announcementIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "indexOfObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "announcementIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "announcementIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "indexOfObject:", v9);

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "announcementIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexOfObject:", *(_QWORD *)(a1 + 48));

  }
  else
  {
    v12 = 0;
  }
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138413570;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2048;
    v30 = v4;
    v31 = 2048;
    v32 = v7;
    v33 = 2048;
    v34 = v10;
    v35 = 2048;
    v36 = v12;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ Displayed announcement indexes = [%lu, %lu, %lu] & Oldest Visited Index = %lu", (uint8_t *)&v25, 0x3Eu);

  }
  if (v4 <= v10)
    v16 = v10;
  else
    v16 = v4;
  v17 = v16 + 1;
  if (v16 + 1 != v12 && (v17 != v10 && v4 >= v10 && v17 != v7 || v10 >= v4 && v17 != v4 && v17 != v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "announcementIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count") > v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "announcementIDs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", v17);
      v20 = objc_claimAutoreleasedReturnValue();

      if (!v20)
        return;
      objc_msgSend(*(id *)(a1 + 32), "announcementsInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v20);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      v18 = (void *)v20;
    }

  }
}

- (id)_blurEffectForCurrentInterfaceStyle
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  -[HUAnnouncementGlobeView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == 2)
    v4 = 2;
  else
    v4 = 1;
  return (id)objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", v4);
}

- (void)audioPlayer:(id)a3 didUpdateAveragePower:(double)a4
{
  void *v6;
  id v7;

  if (objc_msgSend(a3, "isPlaying"))
  {
    -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "didUpdateAveragePower:", a4);
  }
}

- (void)audioPlayer:(id)a3 didPausePlaybackWithReason:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  HUAnnouncementGlobeView *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = self;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Playback paused with reason [%@]", (uint8_t *)&v13, 0x20u);

  }
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "announcementInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A08]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementGlobeView _submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:forAnnouncementID:interruptedByUser:](self, "_submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:forAnnouncementID:interruptedByUser:", 1, v12, 0);
  -[HUAnnouncementGlobeView stopPlayback](self, "stopPlayback");

}

- (void)audioPlayerDidFinishPlayback:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  int v18;
  HUAnnouncementGlobeView *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HUAnnouncementGlobeView currentlyDisplayedAnnouncements](self, "currentlyDisplayedAnnouncements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setFullyPlayed:", 1);
  objc_msgSend(v8, "playbackStopped");
  objc_msgSend(v8, "announcementInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A08]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementGlobeView announceRemotePlaybackSession](self, "announceRemotePlaybackSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlaybackStoppedForAnnouncement:", v10);

  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v13)
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138413058;
      v19 = self;
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v6;
      v15 = "%@:%@ Error finishing playing announcement [%@] - Error %@";
      v16 = v12;
      v17 = 42;
LABEL_6:
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, v17);

    }
  }
  else if (v13)
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v8;
    v15 = "%@:%@ Successfully Finished playing announcement [%@]";
    v16 = v12;
    v17 = 32;
    goto LABEL_6;
  }

  -[HUAnnouncementGlobeView _submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:forAnnouncementID:interruptedByUser:](self, "_submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:forAnnouncementID:interruptedByUser:", v6 == 0, v10, 0);
  -[HUAnnouncementGlobeView _playNextAnnouncement](self, "_playNextAnnouncement");

}

- (void)_submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:(BOOL)a3 forAnnouncementID:(id)a4 interruptedByUser:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
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
  id v26;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playerStopSource");

  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "duration");
  v13 = v12;

  v26 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v14, *MEMORY[0x1E0D30200]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v15, *MEMORY[0x1E0D30208]);

  objc_msgSend(v26, "setObject:forKey:", v8, *MEMORY[0x1E0D301F8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v16, *MEMORY[0x1E0D30220]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v10 & 0xFFFFFFFFFFFFFFFELL) == 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v17, *MEMORY[0x1E0D30218]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10 == 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v18, *MEMORY[0x1E0D30210]);

  -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "routeChangeReason");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HUAnnouncementGlobeView audioPlayer](self, "audioPlayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "routeChangeReason");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v22, *MEMORY[0x1E0D30438]);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSShowAudioTranscriptions());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v23, *MEMORY[0x1E0D302B0]);

  v24 = (void *)MEMORY[0x1E0D31170];
  v25 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(v24, "sendEvent:withData:", 19, v25);

}

- (NSString)selectedAnnouncementID
{
  return self->_selectedAnnouncementID;
}

- (void)setSelectedAnnouncementID:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAnnouncementID, a3);
}

- (CGSize)playbackBoundingBoxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_playbackBoundingBoxSize.width;
  height = self->_playbackBoundingBoxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPlaybackBoundingBoxSize:(CGSize)a3
{
  self->_playbackBoundingBoxSize = a3;
}

- (void)setHasActivePlaybackSession:(BOOL)a3
{
  self->_hasActivePlaybackSession = a3;
}

- (NSMutableDictionary)announcementsInfo
{
  return self->_announcementsInfo;
}

- (void)setAnnouncementsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_announcementsInfo, a3);
}

- (NSMutableArray)announcementIDs
{
  return self->_announcementIDs;
}

- (void)setAnnouncementIDs:(id)a3
{
  objc_storeStrong((id *)&self->_announcementIDs, a3);
}

- (NSMutableArray)currentlyDisplayedAnnouncements
{
  return self->_currentlyDisplayedAnnouncements;
}

- (void)setCurrentlyDisplayedAnnouncements:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyDisplayedAnnouncements, a3);
}

- (NSMutableArray)visitedAnnouncements
{
  return self->_visitedAnnouncements;
}

- (void)setVisitedAnnouncements:(id)a3
{
  objc_storeStrong((id *)&self->_visitedAnnouncements, a3);
}

- (NSString)announcementGroupID
{
  return self->_announcementGroupID;
}

- (void)setAnnouncementGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_announcementGroupID, a3);
}

- (ANRemotePlaybackSession)announceRemotePlaybackSession
{
  return self->_announceRemotePlaybackSession;
}

- (void)setAnnounceRemotePlaybackSession:(id)a3
{
  objc_storeStrong((id *)&self->_announceRemotePlaybackSession, a3);
}

- (OS_dispatch_queue)dataSourceUpdateQueue
{
  return self->_dataSourceUpdateQueue;
}

- (void)setDataSourceUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceUpdateQueue, a3);
}

- (HUAnnouncementsGlobeViewDelegate)globeViewDelegate
{
  return (HUAnnouncementsGlobeViewDelegate *)objc_loadWeakRetained((id *)&self->_globeViewDelegate);
}

- (void)setGlobeViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_globeViewDelegate, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (NSString)lastPlayedAnnouncementID
{
  return self->_lastPlayedAnnouncementID;
}

- (void)setLastPlayedAnnouncementID:(id)a3
{
  objc_storeStrong((id *)&self->_lastPlayedAnnouncementID, a3);
}

- (HFAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)tappableCoverView
{
  return self->_tappableCoverView;
}

- (void)setTappableCoverView:(id)a3
{
  objc_storeStrong((id *)&self->_tappableCoverView, a3);
}

- (UIImageView)playImageView
{
  return self->_playImageView;
}

- (void)setPlayImageView:(id)a3
{
  objc_storeStrong((id *)&self->_playImageView, a3);
}

- (UILabel)announcementsProgressLabel
{
  return self->_announcementsProgressLabel;
}

- (void)setAnnouncementsProgressLabel:(id)a3
{
  objc_storeStrong((id *)&self->_announcementsProgressLabel, a3);
}

- (unint64_t)totalNumberOfAnnouncements
{
  return self->_totalNumberOfAnnouncements;
}

- (void)setTotalNumberOfAnnouncements:(unint64_t)a3
{
  self->_totalNumberOfAnnouncements = a3;
}

- (int64_t)seedOnceToken
{
  return self->_seedOnceToken;
}

- (void)setSeedOnceToken:(int64_t)a3
{
  self->_seedOnceToken = a3;
}

- (int64_t)displayVisitedOnceToken
{
  return self->_displayVisitedOnceToken;
}

- (void)setDisplayVisitedOnceToken:(int64_t)a3
{
  self->_displayVisitedOnceToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_announcementsProgressLabel, 0);
  objc_storeStrong((id *)&self->_playImageView, 0);
  objc_storeStrong((id *)&self->_tappableCoverView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_lastPlayedAnnouncementID, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_globeViewDelegate);
  objc_storeStrong((id *)&self->_dataSourceUpdateQueue, 0);
  objc_storeStrong((id *)&self->_announceRemotePlaybackSession, 0);
  objc_storeStrong((id *)&self->_announcementGroupID, 0);
  objc_storeStrong((id *)&self->_visitedAnnouncements, 0);
  objc_storeStrong((id *)&self->_currentlyDisplayedAnnouncements, 0);
  objc_storeStrong((id *)&self->_announcementIDs, 0);
  objc_storeStrong((id *)&self->_announcementsInfo, 0);
  objc_storeStrong((id *)&self->_selectedAnnouncementID, 0);
}

@end
