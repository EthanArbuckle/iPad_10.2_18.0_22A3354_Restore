@implementation HUPlaybackInfluencesViewController

- (HUPlaybackInfluencesViewController)initWithAccessoryGroupItem:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessoryGroupItem_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPlaybackInfluencesViewController.m"), 33, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPlaybackInfluencesViewController initWithAccessoryGroupItem:]",
    v6);

  return 0;
}

- (HUPlaybackInfluencesViewController)initWithAccessorySettingItem:(id)a3
{
  id v4;
  HUPlaybackInfluencesItemManager *v5;
  HUPlaybackInfluencesViewController *v6;
  HUPlaybackInfluencesViewController *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[HUPlaybackInfluencesItemManager initWithDelegate:settingItem:]([HUPlaybackInfluencesItemManager alloc], "initWithDelegate:settingItem:", self, v4);

  v9.receiver = self;
  v9.super_class = (Class)HUPlaybackInfluencesViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v9, sel_initWithItemManager_tableViewStyle_, v5, 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_playbackInfluencesItemManager, v5);

  return v7;
}

- (HUPlaybackInfluencesViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v6;
  id v7;
  HUPlaybackInfluencesItemManager *v8;
  HUPlaybackInfluencesViewController *v9;
  HUPlaybackInfluencesViewController *v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v8 = -[HUPlaybackInfluencesItemManager initWithDelegate:module:homeKitAccessorySettingItem:]([HUPlaybackInfluencesItemManager alloc], "initWithDelegate:module:homeKitAccessorySettingItem:", self, v6, v7);

  v12.receiver = self;
  v12.super_class = (Class)HUPlaybackInfluencesViewController;
  v9 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v12, sel_initWithItemManager_tableViewStyle_, v8, 1);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_playbackInfluencesItemManager, v8);

  return v10;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v6 = a3;
  objc_opt_class();
  v9 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "setDelegate:", self);
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  id v7;

  v4 = a4;
  -[HUPlaybackInfluencesViewController playbackInfluencesItemManager](self, "playbackInfluencesItemManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateUseListeningHistorySetting:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (id)objc_msgSend(v7, "addFailureBlock:", &__block_literal_global_120);
}

void __59__HUPlaybackInfluencesViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  void *v4;
  id v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "na_isCancelledError");
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "logError:operationDescription:", v2, CFSTR("Updating playback influences setting failed."));
  else
    objc_msgSend(v4, "handleError:", v2);

}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUPlaybackInfluencesViewController;
  -[HUItemTableViewController tableView:viewForFooterInSection:](&v11, sel_tableView_viewForFooterInSection_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "messageTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textDragInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  return v5;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  HUPlaybackInfluencesViewController *v11;
  HUPlaybackInfluencesViewController *v12;
  void *v13;
  void *v14;
  int v16;
  HUPlaybackInfluencesViewController *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v16, 0x16u);
  }

  -[HUPlaybackInfluencesViewController navigationController](self, "navigationController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (HUPlaybackInfluencesViewController *)v9;
  else
    v11 = self;
  v12 = v11;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", *MEMORY[0x1E0D651D0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "splashController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDisplayDeviceType:", 6);

  objc_msgSend(v13, "setPresentingViewController:", v12);
  objc_msgSend(v13, "present");

  return 0;
}

- (void)dismissPrivacyController
{
  -[HUPlaybackInfluencesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (HUPlaybackInfluencesItemManager)playbackInfluencesItemManager
{
  return self->_playbackInfluencesItemManager;
}

- (void)setPlaybackInfluencesItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_playbackInfluencesItemManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackInfluencesItemManager, 0);
}

@end
