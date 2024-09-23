@implementation AMSUIUserNotificationContentViewController

- (AMSUIUserNotificationContentViewController)initWithNotification:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  AMSUIUserNotificationContentViewController *v9;
  AMSUIUserNotificationContentViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  AMSMetrics *metrics;
  void *v21;
  id v22;
  uint64_t v23;
  UIImageView *imageView;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  AVPlayerViewController *v33;
  AVPlayerViewController *videoPlayerController;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  UILabel *v46;
  UILabel *titleLabel;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  UILabel *v52;
  UILabel *subtitleLabel;
  void *v54;
  void *v55;
  void *v56;
  UILabel *v57;
  UILabel *textLabel;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t);
  void *v66;
  id v67;
  AMSUIUserNotificationContentViewController *v68;
  objc_super v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE buf[24];
  void *v75;
  uint64_t *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v69.receiver = self;
  v69.super_class = (Class)AMSUIUserNotificationContentViewController;
  v9 = -[AMSUIUserNotificationContentViewController initWithNibName:bundle:](&v69, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_userNotification, a3);
    v11 = (void *)MEMORY[0x24BE08060];
    objc_msgSend(MEMORY[0x24BE08260], "bagKeySet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE08260], "bagSubProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE08260], "bagSubProfileVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerBagKeySet:forProfile:profileVersion:", v12, v13, v14);

    v15 = (void *)MEMORY[0x24BE08050];
    objc_msgSend(MEMORY[0x24BE08260], "bagSubProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE08260], "bagSubProfileVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bagForProfile:profileVersion:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE08260], "internalInstanceUsingBag:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    metrics = v10->_metrics;
    v10->_metrics = (AMSMetrics *)v19;

    objc_msgSend(v7, "artworkUrl");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = objc_alloc(MEMORY[0x24BEBD668]);
      v23 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      imageView = v10->_imageView;
      v10->_imageView = (UIImageView *)v23;

      dispatch_get_global_queue(2, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v63 = MEMORY[0x24BDAC760];
      v64 = 3221225472;
      v65 = __76__AMSUIUserNotificationContentViewController_initWithNotification_delegate___block_invoke;
      v66 = &unk_24CB4F4C0;
      v67 = v7;
      v68 = v10;
      dispatch_async(v25, &v63);

    }
    objc_msgSend(v7, "videoUrl", v63, v64, v65, v66);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v70 = 0;
      v71 = &v70;
      v72 = 0x2050000000;
      v27 = (void *)getAVPlayerItemClass_softClass;
      v73 = getAVPlayerItemClass_softClass;
      if (!getAVPlayerItemClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getAVPlayerItemClass_block_invoke;
        v75 = &unk_24CB4F3E8;
        v76 = &v70;
        __getAVPlayerItemClass_block_invoke((uint64_t)buf);
        v27 = (void *)v71[3];
      }
      v28 = objc_retainAutorelease(v27);
      _Block_object_dispose(&v70, 8);
      objc_msgSend(v7, "videoUrl");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "playerItemWithURL:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v70 = 0;
      v71 = &v70;
      v72 = 0x2050000000;
      v31 = (void *)getAVPlayerViewControllerClass_softClass;
      v73 = getAVPlayerViewControllerClass_softClass;
      if (!getAVPlayerViewControllerClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getAVPlayerViewControllerClass_block_invoke;
        v75 = &unk_24CB4F3E8;
        v76 = &v70;
        __getAVPlayerViewControllerClass_block_invoke((uint64_t)buf);
        v31 = (void *)v71[3];
      }
      v32 = objc_retainAutorelease(v31);
      _Block_object_dispose(&v70, 8);
      v33 = (AVPlayerViewController *)objc_alloc_init(v32);
      videoPlayerController = v10->_videoPlayerController;
      v10->_videoPlayerController = v33;

      v70 = 0;
      v71 = &v70;
      v72 = 0x2050000000;
      v35 = (void *)getAVPlayerClass_softClass;
      v73 = getAVPlayerClass_softClass;
      if (!getAVPlayerClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getAVPlayerClass_block_invoke;
        v75 = &unk_24CB4F3E8;
        v76 = &v70;
        __getAVPlayerClass_block_invoke((uint64_t)buf);
        v35 = (void *)v71[3];
      }
      v36 = objc_retainAutorelease(v35);
      _Block_object_dispose(&v70, 8);
      objc_msgSend(v36, "playerWithPlayerItem:", v30);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerViewController setPlayer:](v10->_videoPlayerController, "setPlayer:", v37);

      -[AVPlayerViewController player](v10->_videoPlayerController, "player");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObserver:forKeyPath:options:context:", v10, CFSTR("status"), 1, 0);

      -[AVPlayerViewController player](v10->_videoPlayerController, "player");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObserver:forKeyPath:options:context:", v10, CFSTR("timeControlStatus"), 1, 0);

      -[AVPlayerViewController player](v10->_videoPlayerController, "player");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "replaceCurrentItemWithPlayerItem:", v30);

      -[AVPlayerViewController setUpdatesNowPlayingInfoCenter:](v10->_videoPlayerController, "setUpdatesNowPlayingInfoCenter:", 0);
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v41)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v41, "OSLogObject");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = (void *)objc_opt_class();
        v44 = v43;
        objc_msgSend(v7, "logKey");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v45;
        _os_log_impl(&dword_211102000, v42, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Loading rich notification video", buf, 0x16u);

      }
    }
    v46 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v46;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v10->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v10->_titleLabel, "setTextAlignment:", 4);
    -[UILabel setLineBreakMode:](v10->_titleLabel, "setLineBreakMode:", 0);
    v48 = *MEMORY[0x24BEBE200];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_titleLabel, "setFont:", v49);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v10->_titleLabel, "setBackgroundColor:", v50);

    objc_msgSend(v7, "title");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10->_titleLabel, "setText:", v51);

    v52 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    subtitleLabel = v10->_subtitleLabel;
    v10->_subtitleLabel = v52;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v10->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v10->_subtitleLabel, "setTextAlignment:", 4);
    -[UILabel setLineBreakMode:](v10->_subtitleLabel, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v48);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_subtitleLabel, "setFont:", v54);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v10->_subtitleLabel, "setBackgroundColor:", v55);

    objc_msgSend(v7, "subtitle");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10->_subtitleLabel, "setText:", v56);

    v57 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    textLabel = v10->_textLabel;
    v10->_textLabel = v57;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v10->_textLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v10->_textLabel, "setTextAlignment:", 4);
    -[UILabel setLineBreakMode:](v10->_textLabel, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_textLabel, "setFont:", v59);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v10->_textLabel, "setBackgroundColor:", v60);

    objc_msgSend(v7, "informativeText");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10->_textLabel, "setText:", v61);

  }
  return v10;
}

void __76__AMSUIUserNotificationContentViewController_initWithNotification_delegate___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "artworkUrl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startAccessingSecurityScopedResource");

  v4 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(*(id *)(a1 + 32), "artworkUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithContentsOfURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "artworkUrl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopAccessingSecurityScopedResource");

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__AMSUIUserNotificationContentViewController_initWithNotification_delegate___block_invoke_2;
  block[3] = &unk_24CB4F370;
  v10 = v6;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __76__AMSUIUserNotificationContentViewController_initWithNotification_delegate___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BEBD640];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  objc_msgSend(v2, "imageWithData:scale:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1008), "setImage:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1008), "setClipsToBounds:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1008), "setContentMode:", 2);
    objc_msgSend(*(id *)(a1 + 40), "expectedContentSize");
    objc_msgSend(*(id *)(a1 + 40), "setPreferredContentSize:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(void **)(a1 + 48);
      v10 = v8;
      objc_msgSend(v9, "logKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to find artwork at url", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[AVPlayerViewController player](self->_videoPlayerController, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("status"));

  -[AVPlayerViewController player](self->_videoPlayerController, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("timeControlStatus"));

  v5.receiver = self;
  v5.super_class = (Class)AMSUIUserNotificationContentViewController;
  -[AMSUIUserNotificationContentViewController dealloc](&v5, sel_dealloc);
}

- (void)loadView
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
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)AMSUIUserNotificationContentViewController;
  -[AMSUIUserNotificationContentViewController loadView](&v25, sel_loadView);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIUserNotificationContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[AMSUIUserNotificationContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIUserNotificationContentViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[AMSUIUserNotificationContentViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIUserNotificationContentViewController subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[AMSUIUserNotificationContentViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIUserNotificationContentViewController textLabel](self, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_viewTapped_);
  objc_msgSend(v11, "setDelegate:", self);
  -[AMSUIUserNotificationContentViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addGestureRecognizer:", v11);

  -[AMSUIUserNotificationContentViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserInteractionEnabled:", 1);

  -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIUserNotificationContentViewController addChildViewController:](self, "addChildViewController:", v15);

    -[AMSUIUserNotificationContentViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v18);

    -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "didMoveToParentViewController:", self);

    -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contentOverlayView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v23);

LABEL_6:
    }
  }
  else
  {
    -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[AMSUIUserNotificationContentViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v22);
      goto LABEL_6;
    }
  }
  -[AMSUIUserNotificationContentViewController _setupAccessibility](self, "_setupAccessibility");

}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  objc_super v7;

  height = a3.height;
  width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)AMSUIUserNotificationContentViewController;
  -[AMSUIUserNotificationContentViewController setPreferredContentSize:](&v7, sel_setPreferredContentSize_);
  -[AMSUIUserNotificationContentViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didUpdatePreferredContentSize:", self, width, height);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double MaxY;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  objc_super v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v64.receiver = self;
  v64.super_class = (Class)AMSUIUserNotificationContentViewController;
  -[AMSUIUserNotificationContentViewController viewWillLayoutSubviews](&v64, sel_viewWillLayoutSubviews);
  -[AMSUIUserNotificationContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  v6 = v5 + -32.0;
  -[AMSUIUserNotificationContentViewController titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  v9 = v8;

  -[AMSUIUserNotificationContentViewController subtitleLabel](self, "subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  v12 = v11;

  -[AMSUIUserNotificationContentViewController textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  v15 = v14;

  -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "videoBounds");
    v19 = v18;
    v21 = v20;

    if (v19 <= 0.0)
      v22 = v5 * 9.0 * 0.0625;
    else
      v22 = v5 * v21 / v19;
    -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", 0.0, 0.0, v5, v22);

    -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "frame");
    v38 = CGRectGetMaxY(v65) + 16.0;

    -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "bounds");
      v43 = v42;
      v45 = v44;
      v63 = v6;
      v46 = v9;
      v47 = v12;
      v48 = v15;
      v50 = v49;
      v52 = v51;
      -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v50;
      v15 = v48;
      v12 = v47;
      v9 = v46;
      v6 = v63;
      objc_msgSend(v53, "setFrame:", v43, v45, v54, v52);

LABEL_13:
    }
  }
  else
  {
    -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "image");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "image");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "size");
        v29 = v28;
        -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "image");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "size");
        v33 = v29 / v32;

      }
      else
      {
        v33 = 0.0;
      }

      -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setFrame:", 0.0, 0.0, v5, v5 * v33);

      -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "frame");
      v38 = CGRectGetMaxY(v66) + 16.0;
      goto LABEL_13;
    }
    v38 = 16.0;
  }
  -[AMSUIUserNotificationContentViewController titleLabel](self, "titleLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setFrame:", 16.0, v38, v6, v9);

  -[AMSUIUserNotificationContentViewController titleLabel](self, "titleLabel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "frame");
  MaxY = CGRectGetMaxY(v67);
  -[AMSUIUserNotificationContentViewController subtitleLabel](self, "subtitleLabel");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setFrame:", 16.0, MaxY, v6, v12);

  -[AMSUIUserNotificationContentViewController subtitleLabel](self, "subtitleLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "frame");
  v61 = CGRectGetMaxY(v68);
  -[AMSUIUserNotificationContentViewController textLabel](self, "textLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFrame:", 16.0, v61, v6, v15);

  -[AMSUIUserNotificationContentViewController expectedContentSize](self, "expectedContentSize");
  -[AMSUIUserNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMSUIUserNotificationContentViewController;
  -[AMSUIUserNotificationContentViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (!-[AMSUIUserNotificationContentViewController hasAppeared](self, "hasAppeared"))
  {
    v4 = (void *)MEMORY[0x24BE08438];
    -[AMSUIUserNotificationContentViewController userNotification](self, "userNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventForContentEngagementWithNotification:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMSUIUserNotificationContentViewController metrics](self, "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enqueueEvent:", v6);

  }
  -[AMSUIUserNotificationContentViewController setHasAppeared:](self, "setHasAppeared:", 1);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _BYTE v51[24];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "player");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v10)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("status")))
    {
      -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "player");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "status");

      if (v16 == 1)
      {
        -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "player");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setMuted:", 0);

        -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAllowsEnteringFullScreen:", 0);

        objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "category");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIUserNotificationContentViewController setAudioSessionCategory:](self, "setAudioSessionCategory:", v21);

        objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIUserNotificationContentViewController setAudioSessionCategoryOptions:](self, "setAudioSessionCategoryOptions:", objc_msgSend(v22, "categoryOptions"));

        -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "player");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setAllowsExternalPlayback:", 0);

        -[AMSUIUserNotificationContentViewController expectedContentSize](self, "expectedContentSize");
        -[AMSUIUserNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v25, "OSLogObject");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = (void *)objc_opt_class();
          v28 = v27;
          -[AMSUIUserNotificationContentViewController userNotification](self, "userNotification");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "logKey");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v51 = 138543618;
          *(_QWORD *)&v51[4] = v27;
          *(_WORD *)&v51[12] = 2114;
          *(_QWORD *)&v51[14] = v30;
          _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Ready to play rich notification video", v51, 0x16u);

        }
      }
      -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "player");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "status") == 2;

      if (v33)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v34)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v34, "OSLogObject");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = (void *)objc_opt_class();
          v37 = v36;
          -[AMSUIUserNotificationContentViewController userNotification](self, "userNotification");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "logKey");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v51 = 138543618;
          *(_QWORD *)&v51[4] = v36;
          *(_WORD *)&v51[12] = 2114;
          *(_QWORD *)&v51[14] = v39;
          _os_log_impl(&dword_211102000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to load video at url", v51, 0x16u);

        }
      }
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("timeControlStatus")))
    {
      -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "player");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "timeControlStatus") == 2;

      if (v42)
      {
        -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "removeFromSuperview");

        objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v51 = 0;
        *(_QWORD *)&v51[8] = v51;
        *(_QWORD *)&v51[16] = 0x2020000000;
        v45 = (_QWORD *)getAVAudioSessionCategoryPlaybackSymbolLoc_ptr;
        v52 = getAVAudioSessionCategoryPlaybackSymbolLoc_ptr;
        if (!getAVAudioSessionCategoryPlaybackSymbolLoc_ptr)
        {
          v46 = (void *)AVFoundationLibrary();
          v45 = dlsym(v46, "AVAudioSessionCategoryPlayback");
          *(_QWORD *)(*(_QWORD *)&v51[8] + 24) = v45;
          getAVAudioSessionCategoryPlaybackSymbolLoc_ptr = (uint64_t)v45;
        }
        _Block_object_dispose(v51, 8);
        if (!v45)
          getAIDAServiceTypeCloud_cold_1();
        objc_msgSend(v44, "setCategory:withOptions:error:", *v45, 1, 0, *(_QWORD *)v51);

        if (!-[AMSUIUserNotificationContentViewController hasPlayedVideo](self, "hasPlayedVideo"))
        {
          v47 = (void *)MEMORY[0x24BE08438];
          -[AMSUIUserNotificationContentViewController userNotification](self, "userNotification");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "eventForVideoPlaybackForNotification:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          -[AMSUIUserNotificationContentViewController metrics](self, "metrics");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "enqueueEvent:", v49);

        }
        -[AMSUIUserNotificationContentViewController setHasPlayedVideo:](self, "setHasPlayedVideo:", 1);
      }
    }
  }

}

- (CGSize)expectedContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGSize result;

  -[AMSUIUserNotificationContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[AMSUIUserNotificationContentViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  v8 = v7;

  -[AMSUIUserNotificationContentViewController subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  v11 = v10;

  -[AMSUIUserNotificationContentViewController textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  v14 = v13;

  -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0.0;
  v18 = 0.0;
  if (v16)
  {
    -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "size");
    v22 = v21;
    -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "size");
    v26 = v22 / v25;

    v18 = v5 * v26;
  }
  -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "videoBounds");
    v30 = v29;
    v32 = v31;

    if (v30 <= 0.0)
    {
      v17 = v5 * 9.0 * 0.0625;
      v18 = 0.0;
    }
    else
    {
      v18 = 0.0;
      v17 = v5 * v32 / v30;
    }
  }
  v33 = v14 + v11 + v8 + v18 + v17 + 16.0 + 16.0;
  v34 = v5;
  result.height = v33;
  result.width = v34;
  return result;
}

- (void)mediaPause
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pause");

  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIUserNotificationContentViewController audioSessionCategory](self, "audioSessionCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCategory:withOptions:error:", v5, -[AMSUIUserNotificationContentViewController audioSessionCategoryOptions](self, "audioSessionCategoryOptions"), 0);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 == v7;
}

- (void)_setupAccessibility
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AMSUIUserNotificationContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("userNotificationContent"));

  -[AMSUIUserNotificationContentViewController titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("titleLabel"));

  -[AMSUIUserNotificationContentViewController textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("textLabel"));

  -[AMSUIUserNotificationContentViewController subtitleLabel](self, "subtitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("subtitleLabel"));

  -[AMSUIUserNotificationContentViewController imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("imageView"));

  -[AMSUIUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("videoPlayer"));

}

- (void)viewTapped:(id)a3
{
  id v3;

  -[AMSUIUserNotificationContentViewController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openNotification");

}

- (AMSUIUserNotificationContentDelegate)delegate
{
  return (AMSUIUserNotificationContentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMSUserNotification)userNotification
{
  return self->_userNotification;
}

- (NSString)audioSessionCategory
{
  return self->_audioSessionCategory;
}

- (void)setAudioSessionCategory:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionCategory, a3);
}

- (unint64_t)audioSessionCategoryOptions
{
  return self->_audioSessionCategoryOptions;
}

- (void)setAudioSessionCategoryOptions:(unint64_t)a3
{
  self->_audioSessionCategoryOptions = a3;
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setHasAppeared:(BOOL)a3
{
  self->_hasAppeared = a3;
}

- (BOOL)hasPlayedVideo
{
  return self->_hasPlayedVideo;
}

- (void)setHasPlayedVideo:(BOOL)a3
{
  self->_hasPlayedVideo = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (AMSMetrics)metrics
{
  return self->_metrics;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (AVPlayerViewController)videoPlayerController
{
  return self->_videoPlayerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayerController, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
