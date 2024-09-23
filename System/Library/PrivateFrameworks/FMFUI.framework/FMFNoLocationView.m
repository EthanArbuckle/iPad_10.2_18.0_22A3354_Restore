@implementation FMFNoLocationView

- (FMFNoLocationView)initWithFrame:(CGRect)a3
{
  FMFNoLocationView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)FMFNoLocationView;
  v3 = -[FMFNoLocationView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[FMFNoLocationView bounds](v3, "bounds");
    v5 = (void *)objc_msgSend(v4, "initWithFrame:");
    -[FMFNoLocationView setBlur:](v3, "setBlur:", v5);

    v6 = (void *)MEMORY[0x24BDF6950];
    v7 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("bg_grid"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithPatternImage:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_blur, "setBackgroundColor:", v10);

    -[FMFNoLocationView addSubview:](v3, "addSubview:", v3->_blur);
    -[FMFNoLocationView sendSubviewToBack:](v3, "sendSubviewToBack:", v3->_blur);
    v11 = objc_alloc(MEMORY[0x24BDF6AE8]);
    -[FMFNoLocationView offlineProfileImage](v3, "offlineProfileImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithImage:", v12);
    -[FMFNoLocationView setOfflineProfileImageView:](v3, "setOfflineProfileImageView:", v13);

    -[FMFNoLocationView addSubview:](v3, "addSubview:", v3->_offlineProfileImageView);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
    -[FMFNoLocationView setPersonImageView:](v3, "setPersonImageView:", v14);

    -[FMFNoLocationView addSubview:](v3, "addSubview:", v3->_personImageView);
    v15 = objc_alloc(MEMORY[0x24BDF6B68]);
    v16 = *MEMORY[0x24BDBF090];
    v17 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v19 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v20 = (void *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x24BDBF090], v17, v18, v19);
    -[FMFNoLocationView setDetailsLabel:](v3, "setDetailsLabel:", v20);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 15.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_detailsLabel, "setFont:", v21);

    -[UILabel setTextAlignment:](v3->_detailsLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.623529434, 0.611764729, 0.592156887, 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_detailsLabel, "setTextColor:", v22);

    -[FMFNoLocationView addSubview:](v3, "addSubview:", v3->_detailsLabel);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v16, v17, v18, v19);
    -[FMFNoLocationView setInsetView:](v3, "setInsetView:", v23);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_insetView, "setBackgroundColor:", v24);

    -[FMFNoLocationView addSubview:](v3, "addSubview:", v3->_insetView);
    -[FMFNoLocationView addLayoutConstraints](v3, "addLayoutConstraints");
    -[FMFNoLocationView setAlpha:](v3, "setAlpha:", 0.0);
    -[FMFNoLocationView updateLabel](v3, "updateLabel");
    -[FMFNoLocationView updatePersonImageViewImage](v3, "updatePersonImageViewImage");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v3, sel_updateLabelNotification_, CFSTR("locatingInProgressChanged"), 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("locatingInProgressChanged"), 0);

  v4.receiver = self;
  v4.super_class = (Class)FMFNoLocationView;
  -[FMFNoLocationView dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[FMFNoLocationView updateLabel](self, "updateLabel");
}

- (void)addLayoutConstraints
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

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_offlineProfileImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_personImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_detailsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_blur, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_insetView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_blur, 3, 0, self, 3, 1.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v3);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_blur, 4, 0, self, 4, 1.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v4);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_blur, 1, 0, self, 1, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v5);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_blur, 2, 0, self, 2, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v6);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_offlineProfileImageView, 9, 0, self, 9, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v7);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_offlineProfileImageView, 10, 0, self->_insetView, 10, 1.0, -10.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v8);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_personImageView, 9, 0, self->_offlineProfileImageView, 9, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v9);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_personImageView, 10, 0, self->_offlineProfileImageView, 10, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v10);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_personImageView, 7, 0, 0, 7, 1.0, 60.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v11);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_personImageView, 8, 0, 0, 8, 1.0, 60.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v12);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_insetView, 3, 0, self, 3, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView setTopInsetConstraint:](self, "setTopInsetConstraint:", v13);

  -[FMFNoLocationView addConstraint:](self, "addConstraint:", self->_topInsetConstraint);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 0, self->_insetView, 4, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView setBottomInsetConstraint:](self, "setBottomInsetConstraint:", v14);

  -[FMFNoLocationView addConstraint:](self, "addConstraint:", self->_bottomInsetConstraint);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_insetView, 1, 0, self, 1, 1.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v15);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_insetView, 2, 0, self, 2, 1.0, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v16);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_detailsLabel, 3, 0, self->_offlineProfileImageView, 4, 1.0, -3.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v17);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_detailsLabel, 9, 0, self, 9, 1.0, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v18);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_detailsLabel, 8, 1, 0, 8, 1.0, 20.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFNoLocationView addConstraint:](self, "addConstraint:", v19);

  -[FMFNoLocationView updateConstriantsForInsets](self, "updateConstriantsForInsets");
}

- (void)updateConstriantsForInsets
{
  double v3;
  id v4;

  -[FMFNoLocationView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "edgeInsets");
  -[NSLayoutConstraint setConstant:](self->_topInsetConstraint, "setConstant:");
  objc_msgSend(v4, "edgeInsets");
  -[NSLayoutConstraint setConstant:](self->_bottomInsetConstraint, "setConstant:", v3);

}

- (void)updateLabelNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__FMFNoLocationView_updateLabelNotification___block_invoke;
  block[3] = &unk_24C877CC8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __45__FMFNoLocationView_updateLabelNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLabel");
}

- (void)updateLabel
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!-[FMFNoLocationView blockLabelUpdates](self, "blockLabelUpdates"))
  {
    -[FMFNoLocationView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handlesShowingLocations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v5 = v4;
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v24;
        while (2)
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v24 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
            objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance", (_QWORD)v23);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "cachedLocationForHandle:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v12)
            {
              LogCategory_Daemon();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_20DD58000, v15, OS_LOG_TYPE_DEFAULT, "No location received from service yet.", buf, 2u);
              }

LABEL_19:
              goto LABEL_20;
            }
            if (objc_msgSend(v12, "isLocatingInProgress"))
              goto LABEL_19;
            objc_msgSend(v12, "location");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
              goto LABEL_20;
            ++v9;
          }
          while (v7 != v9);
          v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v7)
            continue;
          break;
        }
      }
      v14 = 0;
    }
    else
    {
      LogCategory_Daemon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DD58000, v5, OS_LOG_TYPE_DEFAULT, "No handles received from service yet.", buf, 2u);
      }
LABEL_20:
      v14 = 1;
    }

    LogCategory_Daemon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "handlesShowingLocations");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v28 = v14;
      v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_20DD58000, v16, OS_LOG_TYPE_DEFAULT, "Updating labels for FMFNoLocationView isLocating: %d handles: %@", buf, 0x12u);

    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v14)
      v20 = CFSTR("LOCATING");
    else
      v20 = CFSTR("LOCATION_NOT_AVAILABLE");
    objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_24C878158, CFSTR("LocalizableUI"), (_QWORD)v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[FMFNoLocationView detailsLabel](self, "detailsLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);

    -[UILabel sizeToFit](self->_detailsLabel, "sizeToFit");
    -[UILabel invalidateIntrinsicContentSize](self->_detailsLabel, "invalidateIntrinsicContentSize");

  }
}

- (void)setAlpha:(double)a3
{
  double v5;
  double v6;
  objc_super v7;

  -[FMFNoLocationView alpha](self, "alpha");
  v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)FMFNoLocationView;
  -[FMFNoLocationView setAlpha:](&v7, sel_setAlpha_, a3);
  if (v6 != a3)
    -[FMFNoLocationView updateConstriantsForInsets](self, "updateConstriantsForInsets");
}

- (void)updatePersonImageViewImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("person_noloc"), v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[FMFNoLocationView personImageView](self, "personImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

}

- (UIImage)offlineProfileImage
{
  UIImage *offlineProfileImage;
  void *v4;
  void *v5;
  void *v6;

  offlineProfileImage = self->_offlineProfileImage;
  if (!offlineProfileImage)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("profile"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFNoLocationView setOfflineProfileImage:](self, "setOfflineProfileImage:", v6);

    offlineProfileImage = self->_offlineProfileImage;
  }
  return offlineProfileImage;
}

- (id)accessibilityLabel
{
  return 0;
}

- (FMFNoLocationViewDelegate)delegate
{
  return (FMFNoLocationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)blockLabelUpdates
{
  return self->_blockLabelUpdates;
}

- (void)setBlockLabelUpdates:(BOOL)a3
{
  self->_blockLabelUpdates = a3;
}

- (NSLayoutConstraint)topInsetConstraint
{
  return self->_topInsetConstraint;
}

- (void)setTopInsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topInsetConstraint, a3);
}

- (NSLayoutConstraint)bottomInsetConstraint
{
  return self->_bottomInsetConstraint;
}

- (void)setBottomInsetConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomInsetConstraint, a3);
}

- (void)setOfflineProfileImage:(id)a3
{
  objc_storeStrong((id *)&self->_offlineProfileImage, a3);
}

- (UIImageView)offlineProfileImageView
{
  return self->_offlineProfileImageView;
}

- (void)setOfflineProfileImageView:(id)a3
{
  objc_storeStrong((id *)&self->_offlineProfileImageView, a3);
}

- (UIImageView)personImageView
{
  return self->_personImageView;
}

- (void)setPersonImageView:(id)a3
{
  objc_storeStrong((id *)&self->_personImageView, a3);
}

- (UILabel)detailsLabel
{
  return self->_detailsLabel;
}

- (void)setDetailsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailsLabel, a3);
}

- (UIView)blur
{
  return self->_blur;
}

- (void)setBlur:(id)a3
{
  objc_storeStrong((id *)&self->_blur, a3);
}

- (UIView)insetView
{
  return self->_insetView;
}

- (void)setInsetView:(id)a3
{
  objc_storeStrong((id *)&self->_insetView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insetView, 0);
  objc_storeStrong((id *)&self->_blur, 0);
  objc_storeStrong((id *)&self->_detailsLabel, 0);
  objc_storeStrong((id *)&self->_personImageView, 0);
  objc_storeStrong((id *)&self->_offlineProfileImageView, 0);
  objc_storeStrong((id *)&self->_offlineProfileImage, 0);
  objc_storeStrong((id *)&self->_bottomInsetConstraint, 0);
  objc_storeStrong((id *)&self->_topInsetConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
