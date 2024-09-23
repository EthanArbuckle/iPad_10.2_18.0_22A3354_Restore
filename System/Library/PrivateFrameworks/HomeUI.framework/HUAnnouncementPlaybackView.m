@implementation HUAnnouncementPlaybackView

- (HUAnnouncementPlaybackView)initWithFrame:(CGRect)a3
{
  HUAnnouncementPlaybackView *v3;
  HUAnnouncementPlaybackView *v4;
  uint64_t v5;
  NSMutableArray *audioWaveLayers;
  CNAvatarView *v7;
  CNAvatarView *avatarView;
  UIImageView *v9;
  UIImageView *genericAvatarView;
  id v11;
  uint64_t v12;
  HUIconView *iconView;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUAnnouncementPlaybackView;
  v3 = -[HUAnnouncementPlaybackView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_currentWaveLayerIndex = 0;
    v3->_playbackFractionComplete = 0.0;
    v5 = objc_opt_new();
    audioWaveLayers = v4->_audioWaveLayers;
    v4->_audioWaveLayers = (NSMutableArray *)v5;

    v7 = (CNAvatarView *)objc_alloc_init(MEMORY[0x1E0C97468]);
    avatarView = v4->_avatarView;
    v4->_avatarView = v7;

    -[CNAvatarView setUserInteractionEnabled:](v4->_avatarView, "setUserInteractionEnabled:", 0);
    -[CNAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v4->_avatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNAvatarView setAlpha:](v4->_avatarView, "setAlpha:", 0.0);
    -[HUAnnouncementPlaybackView addSubview:](v4, "addSubview:", v4->_avatarView);
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    genericAvatarView = v4->_genericAvatarView;
    v4->_genericAvatarView = v9;

    -[UIImageView setUserInteractionEnabled:](v4->_genericAvatarView, "setUserInteractionEnabled:", 0);
    -[UIImageView setContentMode:](v4->_genericAvatarView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_genericAvatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUAnnouncementPlaybackView addSubview:](v4, "addSubview:", v4->_genericAvatarView);
    v11 = objc_alloc(MEMORY[0x1E0D33720]);
    v12 = objc_msgSend(v11, "initWithFrame:contentMode:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    iconView = v4->_iconView;
    v4->_iconView = (HUIconView *)v12;

    -[HUIconView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUIconView setAlpha:](v4->_iconView, "setAlpha:", 0.0);
    -[HUAnnouncementPlaybackView addSubview:](v4, "addSubview:", v4->_iconView);
    -[HUAnnouncementPlaybackView setNeedsUpdateConstraints](v4, "setNeedsUpdateConstraints");
  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HUAnnouncementPlaybackView announcementInfo](self, "announcementInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A08]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView announcementInfo](self, "announcementInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7CC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUAnnouncementPlaybackView fullyPlayed](self, "fullyPlayed");
  -[HUAnnouncementPlaybackView audioPlayer](self, "audioPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ID [%@], index [%@] - isFullyPlayed [%d] - isPlaying [%d]"), v5, v7, v8, objc_msgSend(v9, "isPlaying"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  CGAffineTransform v56;
  CGAffineTransform v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)HUAnnouncementPlaybackView;
  -[HUAnnouncementPlaybackView updateConstraints](&v58, sel_updateConstraints);
  v3 = (void *)objc_opt_new();
  -[HUAnnouncementPlaybackView avatarView](self, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView centerXAnchor](self, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[HUAnnouncementPlaybackView avatarView](self, "avatarView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView centerYAnchor](self, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  -[HUAnnouncementPlaybackView avatarView](self, "avatarView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView heightAnchor](self, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  -[HUAnnouncementPlaybackView avatarView](self, "avatarView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView avatarView](self, "avatarView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);

  -[HUAnnouncementPlaybackView genericAvatarView](self, "genericAvatarView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView centerXAnchor](self, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  -[HUAnnouncementPlaybackView genericAvatarView](self, "genericAvatarView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView centerYAnchor](self, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  -[HUAnnouncementPlaybackView genericAvatarView](self, "genericAvatarView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "widthAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView heightAnchor](self, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v32);

  -[HUAnnouncementPlaybackView genericAvatarView](self, "genericAvatarView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView genericAvatarView](self, "genericAvatarView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "widthAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v37);

  -[HUAnnouncementPlaybackView iconView](self, "iconView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView centerXAnchor](self, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v41);

  -[HUAnnouncementPlaybackView iconView](self, "iconView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView centerYAnchor](self, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v45);

  -[HUAnnouncementPlaybackView iconView](self, "iconView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "widthAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView heightAnchor](self, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v49);

  -[HUAnnouncementPlaybackView iconView](self, "iconView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "heightAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAnnouncementPlaybackView iconView](self, "iconView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "widthAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v54);

  CGAffineTransformMakeScale(&v57, 0.75, 0.75);
  -[HUAnnouncementPlaybackView iconView](self, "iconView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v57;
  objc_msgSend(v55, "setTransform:", &v56);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
}

- (void)_configureAnnounceSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  uint64_t v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUAnnouncementPlaybackView avatarView](self, "avatarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    -[HUAnnouncementPlaybackView genericAvatarView](self, "genericAvatarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    -[HUAnnouncementPlaybackView iconView](self, "iconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

    -[HUAnnouncementPlaybackView avatarView](self, "avatarView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContact:", v4);
  }
  else
  {
    if (-[HUAnnouncementPlaybackView isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
    {
      HFLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Now Configuring AvatarView for SiriEndpointAccessory", (uint8_t *)&v30, 2u);
      }

      -[HUAnnouncementPlaybackView avatarView](self, "avatarView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", 0.0);

      -[HUAnnouncementPlaybackView iconView](self, "iconView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAlpha:", 0.0);

      -[HUAnnouncementPlaybackView genericAvatarView](self, "genericAvatarView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAlpha:", 1.0);

      -[HUAnnouncementPlaybackView announcementInfo](self, "announcementInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D58]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUAnnouncementPlaybackView _imageOrViewForServiceType:](self, "_imageOrViewForServiceType:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HFLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 138412546;
        v31 = v8;
        v32 = 2112;
        v33 = v14;
        _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "imageOrViewForServiceType [%@] = [%@]", (uint8_t *)&v30, 0x16u);
      }

      objc_opt_class();
      v16 = v14;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      objc_opt_class();
      v19 = v16;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "hu_circleImageWithDiameter:", 120.0);
        v22 = objc_claimAutoreleasedReturnValue();

        -[HUAnnouncementPlaybackView _updateIconViewForServiceType:](self, "_updateIconViewForServiceType:", v8);
        -[HUAnnouncementPlaybackView iconView](self, "iconView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setAlpha:", 1.0);

        v18 = (id)v22;
      }
      -[HUAnnouncementPlaybackView genericAvatarView](self, "genericAvatarView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setImage:", v18);

    }
    else
    {
      -[HUAnnouncementPlaybackView avatarView](self, "avatarView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAlpha:", 0.0);

      -[HUAnnouncementPlaybackView iconView](self, "iconView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAlpha:", 0.0);

      -[HUAnnouncementPlaybackView genericAvatarView](self, "genericAvatarView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setAlpha:", 1.0);

      objc_msgSend(MEMORY[0x1E0CEA638], "hu_avatarImageWithSymbolNamed:textStyle:scale:diameter:", CFSTR("person.circle"), *MEMORY[0x1E0CEB580], 3, 120.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HUAnnouncementPlaybackView _isProductTypeHomePod](self, "_isProductTypeHomePod"))
      {
        if (-[HUAnnouncementPlaybackView productType](self, "productType") == 3348380076)
          v28 = CFSTR("Intercom-HomePod-Mini-Light");
        else
          v28 = CFSTR("Intercom-HomePod-Original-Light");
        HUImageNamed(v28);
        v29 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v29;
      }
      -[HUAnnouncementPlaybackView genericAvatarView](self, "genericAvatarView");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setImage:", v8);
    }

  }
  -[HUAnnouncementPlaybackView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setAnnouncementInfo:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _DWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_announcementInfo, a3);
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAnnouncementPlaybackView setAnnouncementURL:](self, "setAnnouncementURL:", v8);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A78]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = objc_msgSend(v11, "isEqualToString:", &stru_1E6F60E80) ^ 1;
  else
    v12 = 0;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D38]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAnnouncementPlaybackView setIsSiriEndpointAccessory:](self, "setIsSiriEndpointAccessory:", objc_msgSend(v13, "integerValue") == 1);

  }
  else
  {
    -[HUAnnouncementPlaybackView setIsSiriEndpointAccessory:](self, "setIsSiriEndpointAccessory:", 0);
  }
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = 67109120;
    v22[1] = -[HUAnnouncementPlaybackView isSiriEndpointAccessory](self, "isSiriEndpointAccessory");
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "isSiriEndpointAccessory = %{BOOL}d", (uint8_t *)v22, 8u);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7D28]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  if ((v12 & 1) != 0)
  {
    if (objc_msgSend(v11, "hf_isEmail"))
    {
      objc_msgSend(MEMORY[0x1E0D31320], "defaultStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementPlaybackView _requiredKeyDescriptors](self, "_requiredKeyDescriptors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contactForEmailAddress:withKeys:", v11, v18);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v11, "hf_isPhoneNumber"))
      {
        v21 = 0;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0D31320], "defaultStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAnnouncementPlaybackView _requiredKeyDescriptors](self, "_requiredKeyDescriptors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contactForPhoneNumber:withKeys:", v11, v18);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v19;

LABEL_24:
    -[HUAnnouncementPlaybackView _configureAnnounceSender:](self, "_configureAnnounceSender:", v21);

    goto LABEL_25;
  }
  if (v16 <= 3348380075)
  {
    if (v16 != 1540760353)
    {
      v20 = 2702125347;
      goto LABEL_20;
    }
LABEL_21:
    -[HUAnnouncementPlaybackView setProductType:](self, "setProductType:", v16);
    goto LABEL_22;
  }
  if (v16 == 4240173202)
    goto LABEL_21;
  v20 = 3348380076;
LABEL_20:
  if (v16 == v20)
    goto LABEL_21;
LABEL_22:
  -[HUAnnouncementPlaybackView _configureAnnounceSender:](self, "_configureAnnounceSender:", 0);
LABEL_25:

}

- (void)didUpdateAveragePower:(double)a3
{
  void *v5;
  uint64_t v6;

  -[HUAnnouncementPlaybackView audioWaveLayers](self, "audioWaveLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    -[HUAnnouncementPlaybackView _setupAudioWaveLayers](self, "_setupAudioWaveLayers");
    -[HUAnnouncementPlaybackView _generateRippleForAveragePower:](self, "_generateRippleForAveragePower:", a3);
  }
}

- (void)playbackStopped
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HUAnnouncementPlaybackView audioWaveLayers](self, "audioWaveLayers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "removeAllAnimations");
        objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[HUAnnouncementPlaybackView audioWaveLayers](self, "audioWaveLayers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

  -[HUAnnouncementPlaybackView audioWaveLayers](self, "audioWaveLayers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

- (void)resumePlaybackAnimation
{
  -[HUAnnouncementPlaybackView _setupAudioWaveLayers](self, "_setupAudioWaveLayers");
  -[HUAnnouncementPlaybackView _generateRippleForAveragePower:](self, "_generateRippleForAveragePower:", 0.5);
}

- (BOOL)_isProductTypeHomePod
{
  return -[HUAnnouncementPlaybackView productType](self, "productType") == 4240173202
      || -[HUAnnouncementPlaybackView productType](self, "productType") == 2702125347
      || -[HUAnnouncementPlaybackView productType](self, "productType") == 3348380076
      || -[HUAnnouncementPlaybackView productType](self, "productType") == 1540760353;
}

- (id)_requiredKeyDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97468], "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setupAudioWaveLayers
{
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  HUAnnouncementPlaybackView *v17;

  v17 = self;
  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v4 = *MEMORY[0x1E0CD3010];
  v5 = 3;
  do
  {
    v6 = (void *)objc_opt_new();
    v7 = (void *)MEMORY[0x1E0CEA390];
    -[HUAnnouncementPlaybackView bounds](v17, "bounds");
    objc_msgSend(v7, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v2, v3, v8 * 0.5, 0.0, 6.28318531);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setPath:", objc_msgSend(v9, "CGPath"));
    objc_msgSend(v6, "setLineWidth:", 2.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setFillColor:", objc_msgSend(v11, "CGColor"));

    objc_msgSend(v6, "setLineCap:", v4);
    -[HUAnnouncementPlaybackView frame](v17, "frame");
    v13 = v12 * 0.5;
    -[HUAnnouncementPlaybackView frame](v17, "frame");
    objc_msgSend(v6, "setPosition:", v13, v14 * 0.5);
    -[HUAnnouncementPlaybackView layer](v17, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSublayer:", v6);

    -[HUAnnouncementPlaybackView audioWaveLayers](v17, "audioWaveLayers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v6);

    --v5;
  }
  while (v5);

}

- (void)_generateRippleForAveragePower:(double)a3
{
  dispatch_time_t v5;
  _QWORD v6[6];

  -[HUAnnouncementPlaybackView _animateLayerWaveAtIndex:forAveragePower:](self, "_animateLayerWaveAtIndex:forAveragePower:", 0);
  v5 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 400000000);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HUAnnouncementPlaybackView__generateRippleForAveragePower___block_invoke;
  v6[3] = &unk_1E6F4CE48;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_after(v5, MEMORY[0x1E0C80D38], v6);
}

void __61__HUAnnouncementPlaybackView__generateRippleForAveragePower___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[6];

  objc_msgSend(*(id *)(a1 + 32), "_animateLayerWaveAtIndex:forAveragePower:", 1, *(double *)(a1 + 40));
  v2 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 600000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__HUAnnouncementPlaybackView__generateRippleForAveragePower___block_invoke_2;
  v3[3] = &unk_1E6F4CE48;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = *(_QWORD *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);
}

uint64_t __61__HUAnnouncementPlaybackView__generateRippleForAveragePower___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_animateLayerWaveAtIndex:forAveragePower:", 2, *(double *)(a1 + 40));
}

- (void)_animateLayerWaveAtIndex:(unint64_t)a3 forAveragePower:(double)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  -[HUAnnouncementPlaybackView audioWaveLayers](self, "audioWaveLayers", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a3)
  {
    -[HUAnnouncementPlaybackView audioWaveLayers](self, "audioWaveLayers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removeAllAnimations");
    -[HUAnnouncementPlaybackView traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v11, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDuration:", 1.0);
    objc_msgSend(v12, "setFromValue:", &unk_1E70433D8);
    objc_msgSend(v12, "setToValue:", &unk_1E70433E8);
    objc_msgSend(v12, "setRepeatCount:", 3.53369517e72);
    v13 = *MEMORY[0x1E0CD3050];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTimingFunction:", v14);

    objc_msgSend(v9, "addAnimation:forKey:", v12, CFSTR("scale"));
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDuration:", 1.0);
    objc_msgSend(v15, "setValues:", &unk_1E7042960);
    objc_msgSend(v15, "setKeyTimes:", &unk_1E7042978);
    objc_msgSend(v15, "setRepeatCount:", 3.53369517e72);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTimingFunction:", v16);

    objc_msgSend(v9, "addAnimation:forKey:", v15, CFSTR("opacity"));
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("lineWidth"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDuration:", 1.0);
    objc_msgSend(v17, "setValues:", &unk_1E7042990);
    objc_msgSend(v17, "setKeyTimes:", &unk_1E70429A8);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTimingFunction:", v18);

    objc_msgSend(v17, "setRepeatCount:", 3.53369517e72);
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = v15;
    v21[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAnimations:", v20);

    objc_msgSend(v9, "addAnimation:forKey:", v19, CFSTR("groupAnimation"));
  }
}

- (id)_imageOrViewForServiceType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_avatarImageWithSymbolNamed:textStyle:scale:diameter:", CFSTR("hifispeaker.fill"), *MEMORY[0x1E0CEB580], 3, 120.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_14;
  objc_msgSend(MEMORY[0x1E0D317C8], "defaultIconDescriptorForServiceType:serviceSubtype:", v4, *MEMORY[0x1E0CB9988]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "imageIdentifierForSize:", *MEMORY[0x1E0D30850]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    HUImageNamed(v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_13:

    v5 = (id)v8;
LABEL_14:
    v5 = v5;
    v12 = v5;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if (objc_msgSend(v7, "isSystemImage"))
    {
      objc_msgSend(v7, "imageSymbolConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 6, 36.0);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = v11;

      v14 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(v7, "imageIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "systemImageNamed:withConfiguration:", v15, v13);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v15;
    }
    else
    {
      objc_msgSend(v7, "imageIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HUImageNamed(v13);
      v8 = objc_claimAutoreleasedReturnValue();
    }

    v5 = v13;
    goto LABEL_13;
  }
  -[HUAnnouncementPlaybackView iconView](self, "iconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v12;
}

- (void)_updateIconViewForServiceType:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D317C8], "defaultIconDescriptorForServiceType:serviceSubtype:", a3, *MEMORY[0x1E0CB9988]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (objc_class *)MEMORY[0x1E0D311C8];
    v5 = v10;
    v6 = [v4 alloc];
    objc_msgSend(v5, "packageIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v6, "initWithPackageIdentifier:state:", v7, *MEMORY[0x1E0D304D8]);
    -[HUAnnouncementPlaybackView iconView](self, "iconView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateWithIconDescriptor:displayStyle:animated:", v8, 1, 1);

  }
  else
  {
    -[HUAnnouncementPlaybackView iconView](self, "iconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateWithIconDescriptor:displayStyle:animated:", v10, 1, 1);
  }

}

- (NSDictionary)announcementInfo
{
  return self->_announcementInfo;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (NSLayoutConstraint)centerXConstraint
{
  return self->_centerXConstraint;
}

- (void)setCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_centerXConstraint, a3);
}

- (NSLayoutConstraint)centerYConstraint
{
  return self->_centerYConstraint;
}

- (void)setCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_centerYConstraint, a3);
}

- (BOOL)fullyPlayed
{
  return self->_fullyPlayed;
}

- (void)setFullyPlayed:(BOOL)a3
{
  self->_fullyPlayed = a3;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UIImageView)genericAvatarView
{
  return self->_genericAvatarView;
}

- (void)setGenericAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_genericAvatarView, a3);
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (double)playbackFractionComplete
{
  return self->_playbackFractionComplete;
}

- (void)setPlaybackFractionComplete:(double)a3
{
  self->_playbackFractionComplete = a3;
}

- (NSURL)announcementURL
{
  return self->_announcementURL;
}

- (void)setAnnouncementURL:(id)a3
{
  objc_storeStrong((id *)&self->_announcementURL, a3);
}

- (int)productType
{
  return *(_QWORD *)&self->_productType;
}

- (void)setProductType:(int)a3
{
  *(_QWORD *)&self->_productType = *(_QWORD *)&a3;
}

- (HFAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (NSMutableArray)audioWaveLayers
{
  return self->_audioWaveLayers;
}

- (void)setAudioWaveLayers:(id)a3
{
  objc_storeStrong((id *)&self->_audioWaveLayers, a3);
}

- (unint64_t)currentWaveLayerIndex
{
  return self->_currentWaveLayerIndex;
}

- (void)setCurrentWaveLayerIndex:(unint64_t)a3
{
  self->_currentWaveLayerIndex = a3;
}

- (BOOL)isSiriEndpointAccessory
{
  return self->_isSiriEndpointAccessory;
}

- (void)setIsSiriEndpointAccessory:(BOOL)a3
{
  self->_isSiriEndpointAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioWaveLayers, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_announcementURL, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_genericAvatarView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_centerYConstraint, 0);
  objc_storeStrong((id *)&self->_centerXConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_announcementInfo, 0);
}

@end
