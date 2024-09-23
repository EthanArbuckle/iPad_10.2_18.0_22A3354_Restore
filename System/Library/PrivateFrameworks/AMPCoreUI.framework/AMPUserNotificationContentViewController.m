@implementation AMPUserNotificationContentViewController

- (AMPUserNotificationContentViewController)initWithNotification:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  AMPUserNotificationContentViewController *v9;
  AMPUserNotificationContentViewController *v10;
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
  void *v48;
  void *v49;
  void *v50;
  UILabel *v51;
  UILabel *textLabel;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t);
  void *v60;
  id v61;
  AMPUserNotificationContentViewController *v62;
  objc_super v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE buf[24];
  void *v69;
  uint64_t *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v63.receiver = self;
  v63.super_class = (Class)AMPUserNotificationContentViewController;
  v9 = -[AMPUserNotificationContentViewController initWithNibName:bundle:](&v63, sel_initWithNibName_bundle_, 0, 0);
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

    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BE08260]), "initWithContainerID:bag:", CFSTR("com.apple.AppleMediaServices"), v18);
    metrics = v10->_metrics;
    v10->_metrics = (AMSMetrics *)v19;

    objc_msgSend(v7, "artworkUrl");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = objc_alloc(MEMORY[0x24BDF6AE8]);
      v23 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      imageView = v10->_imageView;
      v10->_imageView = (UIImageView *)v23;

      dispatch_get_global_queue(2, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v57 = MEMORY[0x24BDAC760];
      v58 = 3221225472;
      v59 = __74__AMPUserNotificationContentViewController_initWithNotification_delegate___block_invoke;
      v60 = &unk_24F966D78;
      v61 = v7;
      v62 = v10;
      dispatch_async(v25, &v57);

    }
    objc_msgSend(v7, "videoUrl", v57, v58, v59, v60);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v64 = 0;
      v65 = &v64;
      v66 = 0x2050000000;
      v27 = (void *)getAVPlayerItemClass_softClass;
      v67 = getAVPlayerItemClass_softClass;
      if (!getAVPlayerItemClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getAVPlayerItemClass_block_invoke;
        v69 = &unk_24F966CF8;
        v70 = &v64;
        __getAVPlayerItemClass_block_invoke((uint64_t)buf);
        v27 = (void *)v65[3];
      }
      v28 = objc_retainAutorelease(v27);
      _Block_object_dispose(&v64, 8);
      objc_msgSend(v7, "videoUrl");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "playerItemWithURL:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = 0;
      v65 = &v64;
      v66 = 0x2050000000;
      v31 = (void *)getAVPlayerViewControllerClass_softClass;
      v67 = getAVPlayerViewControllerClass_softClass;
      if (!getAVPlayerViewControllerClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getAVPlayerViewControllerClass_block_invoke;
        v69 = &unk_24F966CF8;
        v70 = &v64;
        __getAVPlayerViewControllerClass_block_invoke((uint64_t)buf);
        v31 = (void *)v65[3];
      }
      v32 = objc_retainAutorelease(v31);
      _Block_object_dispose(&v64, 8);
      v33 = (AVPlayerViewController *)objc_alloc_init(v32);
      videoPlayerController = v10->_videoPlayerController;
      v10->_videoPlayerController = v33;

      v64 = 0;
      v65 = &v64;
      v66 = 0x2050000000;
      v35 = (void *)getAVPlayerClass_softClass;
      v67 = getAVPlayerClass_softClass;
      if (!getAVPlayerClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getAVPlayerClass_block_invoke;
        v69 = &unk_24F966CF8;
        v70 = &v64;
        __getAVPlayerClass_block_invoke((uint64_t)buf);
        v35 = (void *)v65[3];
      }
      v36 = objc_retainAutorelease(v35);
      _Block_object_dispose(&v64, 8);
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
        _os_log_impl(&dword_22D90B000, v42, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Loading rich notification video", buf, 0x16u);

      }
    }
    v46 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v46;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v10->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v10->_titleLabel, "setTextAlignment:", 4);
    -[UILabel setLineBreakMode:](v10->_titleLabel, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_titleLabel, "setFont:", v48);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v10->_titleLabel, "setBackgroundColor:", v49);

    objc_msgSend(v7, "title");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10->_titleLabel, "setText:", v50);

    v51 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    textLabel = v10->_textLabel;
    v10->_textLabel = v51;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v10->_textLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v10->_textLabel, "setTextAlignment:", 4);
    -[UILabel setLineBreakMode:](v10->_textLabel, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_textLabel, "setFont:", v53);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v10->_textLabel, "setBackgroundColor:", v54);

    objc_msgSend(v7, "informativeText");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10->_textLabel, "setText:", v55);

  }
  return v10;
}

void __74__AMPUserNotificationContentViewController_initWithNotification_delegate___block_invoke(uint64_t a1)
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
  block[2] = __74__AMPUserNotificationContentViewController_initWithNotification_delegate___block_invoke_2;
  block[3] = &unk_24F966D50;
  v10 = v6;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __74__AMPUserNotificationContentViewController_initWithNotification_delegate___block_invoke_2(uint64_t a1)
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
  v2 = (void *)MEMORY[0x24BDF6AC8];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
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
      _os_log_impl(&dword_22D90B000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to find artwork at url", (uint8_t *)&v12, 0x16u);

    }
  }

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
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AMPUserNotificationContentViewController;
  -[AMPUserNotificationContentViewController loadView](&v23, sel_loadView);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPUserNotificationContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[AMPUserNotificationContentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPUserNotificationContentViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[AMPUserNotificationContentViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMPUserNotificationContentViewController textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMPUserNotificationContentViewController addChildViewController:](self, "addChildViewController:", v10);

    -[AMPUserNotificationContentViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v13);

    -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "didMoveToParentViewController:", self);

    -[AMPUserNotificationContentViewController imageView](self, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      return;
    -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentOverlayView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMPUserNotificationContentViewController imageView](self, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

  }
  else
  {
    -[AMPUserNotificationContentViewController imageView](self, "imageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      return;
    -[AMPUserNotificationContentViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMPUserNotificationContentViewController imageView](self, "imageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v21);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_imageViewTapped_);
    -[AMPUserNotificationContentViewController imageView](self, "imageView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addGestureRecognizer:", v16);

    -[AMPUserNotificationContentViewController imageView](self, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUserInteractionEnabled:", 1);
  }

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
  v7.super_class = (Class)AMPUserNotificationContentViewController;
  -[AMPUserNotificationContentViewController setPreferredContentSize:](&v7, sel_setPreferredContentSize_);
  -[AMPUserNotificationContentViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didUpdatePreferredContentSize:", self, width, height);

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
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGSize result;

  -[AMPUserNotificationContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[AMPUserNotificationContentViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  v8 = v7;

  -[AMPUserNotificationContentViewController textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  v11 = v10;

  -[AMPUserNotificationContentViewController imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0.0;
  v15 = 0.0;
  if (v13)
  {
    -[AMPUserNotificationContentViewController imageView](self, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "size");
    v19 = v18;
    -[AMPUserNotificationContentViewController imageView](self, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "image");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "size");
    v23 = v19 / v22;

    v15 = v5 * v23;
  }
  -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "videoBounds");
    v27 = v26;
    v29 = v28;

    if (v27 <= 0.0)
    {
      v14 = v5 * 9.0 * 0.0625;
      v15 = 0.0;
    }
    else
    {
      v15 = 0.0;
      v14 = v5 * v29 / v27;
    }
  }
  v30 = v11 + v8 + v15 + v14 + 16.0 + 16.0;
  v31 = v5;
  result.height = v30;
  result.width = v31;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMPUserNotificationContentViewController;
  -[AMPUserNotificationContentViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (!-[AMPUserNotificationContentViewController hasAppeared](self, "hasAppeared"))
  {
    v4 = (void *)MEMORY[0x24BE08438];
    -[AMPUserNotificationContentViewController userNotification](self, "userNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventForContentEngagementWithNotification:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[AMPUserNotificationContentViewController metrics](self, "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enqueueEvent:", v6);

  }
  -[AMPUserNotificationContentViewController setHasAppeared:](self, "setHasAppeared:", 1);
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
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double MaxY;
  void *v52;
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v53.receiver = self;
  v53.super_class = (Class)AMPUserNotificationContentViewController;
  -[AMPUserNotificationContentViewController viewWillLayoutSubviews](&v53, sel_viewWillLayoutSubviews);
  -[AMPUserNotificationContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  v6 = v5 + -32.0;
  -[AMPUserNotificationContentViewController titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  v9 = v8;

  -[AMPUserNotificationContentViewController textLabel](self, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeThatFits:", v5 + -32.0, 3.40282347e38);
  v12 = v11;

  -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "videoBounds");
    v16 = v15;
    v18 = v17;

    if (v16 <= 0.0)
      v19 = v5 * 9.0 * 0.0625;
    else
      v19 = v5 * v18 / v16;
    -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", 0.0, 0.0, v5, v19);

    -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "frame");
    v35 = CGRectGetMaxY(v54) + 16.0;

    -[AMPUserNotificationContentViewController imageView](self, "imageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bounds");
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
      -[AMPUserNotificationContentViewController imageView](self, "imageView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setFrame:", v40, v42, v44, v46);

LABEL_13:
    }
  }
  else
  {
    -[AMPUserNotificationContentViewController imageView](self, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[AMPUserNotificationContentViewController imageView](self, "imageView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "image");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[AMPUserNotificationContentViewController imageView](self, "imageView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "image");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "size");
        v26 = v25;
        -[AMPUserNotificationContentViewController imageView](self, "imageView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "image");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "size");
        v30 = v26 / v29;

      }
      else
      {
        v30 = 0.0;
      }

      -[AMPUserNotificationContentViewController imageView](self, "imageView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setFrame:", 0.0, 0.0, v5, v5 * v30);

      -[AMPUserNotificationContentViewController imageView](self, "imageView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "frame");
      v35 = CGRectGetMaxY(v55) + 16.0;
      goto LABEL_13;
    }
    v35 = 16.0;
  }
  -[AMPUserNotificationContentViewController titleLabel](self, "titleLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", 16.0, v35, v6, v9);

  -[AMPUserNotificationContentViewController titleLabel](self, "titleLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "frame");
  MaxY = CGRectGetMaxY(v56);
  -[AMPUserNotificationContentViewController textLabel](self, "textLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", 16.0, MaxY, v6, v12);

  -[AMPUserNotificationContentViewController expectedContentSize](self, "expectedContentSize");
  -[AMPUserNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)imageViewTapped:(id)a3
{
  id v3;

  -[AMPUserNotificationContentViewController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openNotification");

}

- (void)mediaPause
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pause");

  objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AMPUserNotificationContentViewController audioSessionCategory](self, "audioSessionCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCategory:withOptions:error:", v5, -[AMPUserNotificationContentViewController audioSessionCategoryOptions](self, "audioSessionCategoryOptions"), 0);

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
  -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "player");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v10)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("status")))
    {
      -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "player");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "status");

      if (v16 == 1)
      {
        -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "player");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setMuted:", 0);

        -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAllowsEnteringFullScreen:", 0);

        objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "category");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMPUserNotificationContentViewController setAudioSessionCategory:](self, "setAudioSessionCategory:", v21);

        objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMPUserNotificationContentViewController setAudioSessionCategoryOptions:](self, "setAudioSessionCategoryOptions:", objc_msgSend(v22, "categoryOptions"));

        -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "player");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setAllowsExternalPlayback:", 0);

        -[AMPUserNotificationContentViewController expectedContentSize](self, "expectedContentSize");
        -[AMPUserNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
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
          -[AMPUserNotificationContentViewController userNotification](self, "userNotification");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "logKey");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v51 = 138543618;
          *(_QWORD *)&v51[4] = v27;
          *(_WORD *)&v51[12] = 2114;
          *(_QWORD *)&v51[14] = v30;
          _os_log_impl(&dword_22D90B000, v26, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Ready to play rich notification video", v51, 0x16u);

        }
      }
      -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
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
          -[AMPUserNotificationContentViewController userNotification](self, "userNotification");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "logKey");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v51 = 138543618;
          *(_QWORD *)&v51[4] = v36;
          *(_WORD *)&v51[12] = 2114;
          *(_QWORD *)&v51[14] = v39;
          _os_log_impl(&dword_22D90B000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to load video at url", v51, 0x16u);

        }
      }
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("timeControlStatus")))
    {
      -[AMPUserNotificationContentViewController videoPlayerController](self, "videoPlayerController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "player");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "timeControlStatus") == 2;

      if (v42)
      {
        -[AMPUserNotificationContentViewController imageView](self, "imageView");
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
          -[AMPUserNotificationContentViewController observeValueForKeyPath:ofObject:change:context:].cold.1();
        objc_msgSend(v44, "setCategory:withOptions:error:", *v45, 1, 0, *(_QWORD *)v51);

        if (!-[AMPUserNotificationContentViewController hasPlayedVideo](self, "hasPlayedVideo"))
        {
          v47 = (void *)MEMORY[0x24BE08438];
          -[AMPUserNotificationContentViewController userNotification](self, "userNotification");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "eventForVideoPlaybackForNotification:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          -[AMPUserNotificationContentViewController metrics](self, "metrics");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "enqueueEvent:", v49);

        }
        -[AMPUserNotificationContentViewController setHasPlayedVideo:](self, "setHasPlayedVideo:", 1);
      }
    }
  }

}

- (AMSUserNotification)userNotification
{
  return self->_userNotification;
}

- (AMPUserNotificationContentDelegate)delegate
{
  return (AMPUserNotificationContentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (AVPlayerViewController)videoPlayerController
{
  return self->_videoPlayerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayerController, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userNotification, 0);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  dlerror();
  abort_report_np();
  __getAVPlayerItemClass_block_invoke_cold_1();
}

@end
