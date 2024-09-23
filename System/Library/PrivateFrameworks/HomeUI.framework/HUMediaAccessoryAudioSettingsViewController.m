@implementation HUMediaAccessoryAudioSettingsViewController

- (HUMediaAccessoryAudioSettingsViewController)initWithMediaSystemBuilder:(id)a3 mediaAccessoryItem:(id)a4
{
  id v8;
  id v9;
  HUMediaAccessoryAudioSettingsItemManager *v10;
  HUMediaAccessoryAudioSettingsViewController *v11;
  HUMediaAccessoryAudioSettingsViewController *v12;
  void *v13;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMediaAccessoryAudioSettingsViewController.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaSystemBuilder"));

  }
  v10 = -[HUMediaAccessoryAudioSettingsItemManager initWithMediaSystemBuilder:sourceItem:delegate:]([HUMediaAccessoryAudioSettingsItemManager alloc], "initWithMediaSystemBuilder:sourceItem:delegate:", v8, v9, self);
  v16.receiver = self;
  v16.super_class = (Class)HUMediaAccessoryAudioSettingsViewController;
  v11 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v16, sel_initWithItemManager_tableViewStyle_, v10, 1);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaSystemBuilder, a3);
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaAccessoryAudioSettingsViewControllerTitle"), CFSTR("HUMediaAccessoryAudioSettingsViewControllerTitle"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaAccessoryAudioSettingsViewController setTitle:](v12, "setTitle:", v13);

  }
  return v12;
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 0;
}

- (id)item
{
  void *v2;
  void *v3;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "audioSettingsItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    objc_opt_class();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v7 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioSettingsItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    v10 = v15;
    objc_opt_class();
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sourceItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    objc_msgSend(v10, "setHomePodVariant:", objc_msgSend(v14, "homePodVariant"));
    objc_msgSend(v10, "finishSetupWithDelegate:selectionStyle:homePodVariant:", self, 0, objc_msgSend(v14, "homePodVariant"));

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  objc_super v14;

  v6 = a6;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUMediaAccessoryAudioSettingsViewController;
  v11 = a4;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v14, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUItemTableViewController itemManager](self, "itemManager", v14.receiver, v14.super_class);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "audioSettingsItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v11)
    -[HUMediaAccessoryAudioSettingsViewController _updateSwapperCell:](self, "_updateSwapperCell:", v10);

}

- (void)didTapSpeaker:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  int v21;
  _BYTE v22[22];
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "mediaSystemRole");
    v9 = CFSTR("right");
    *(_DWORD *)v22 = 138412802;
    *(_QWORD *)&v22[4] = self;
    *(_WORD *)&v22[12] = 2112;
    if (v8 == 1)
      v9 = CFSTR("left");
    *(_QWORD *)&v22[14] = v7;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped speaker icon: %@", v22, 0x20u);

  }
  -[HUMediaAccessoryAudioSettingsViewController accessoryIdentifyFuture](self, "accessoryIdentifyFuture");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10,
        -[HUMediaAccessoryAudioSettingsViewController accessoryIdentifyFuture](self, "accessoryIdentifyFuture"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isFinished"),
        v12,
        v11,
        (v13 & 1) == 0))
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUMediaAccessoryAudioSettingsViewController accessoryIdentifyFuture](self, "accessoryIdentifyFuture");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[HUMediaAccessoryAudioSettingsViewController accessoryIdentifyFuture](self, "accessoryIdentifyFuture");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isFinished");
      *(_DWORD *)v22 = 138413058;
      *(_QWORD *)&v22[4] = self;
      *(_WORD *)&v22[12] = 2112;
      *(_QWORD *)&v22[14] = v18;
      v23 = 2112;
      v24 = v19;
      v25 = 1024;
      v26 = v21;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Ignoring because previous Identify future not completed: %@ isFinished = %{BOOL}d", v22, 0x26u);

    }
  }
  else
  {
    if (objc_msgSend(v5, "mediaSystemRole", *(_OWORD *)v22) == 1)
      objc_msgSend(MEMORY[0x1E0CBA688], "leftRole");
    else
      objc_msgSend(MEMORY[0x1E0CBA688], "rightRole");
    v14 = objc_claimAutoreleasedReturnValue();
    -[HUMediaAccessoryAudioSettingsViewController mediaSystemBuilder](self, "mediaSystemBuilder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessoryForRole:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "hf_identifyHomePod");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaAccessoryAudioSettingsViewController setAccessoryIdentifyFuture:](self, "setAccessoryIdentifyFuture:", v17);

  }
}

- (void)didPressSwapButton:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  HUMediaAccessoryAudioSettingsViewController *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped speaker swapper", buf, 0x16u);

  }
  -[HUMediaAccessoryAudioSettingsViewController mediaSystemBuilder](self, "mediaSystemBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "swapRoles");

  objc_msgSend(v5, "swapButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);

  objc_initWeak((id *)buf, self);
  -[HUMediaAccessoryAudioSettingsViewController mediaSystemBuilder](self, "mediaSystemBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commitItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HUMediaAccessoryAudioSettingsViewController_didPressSwapButton___block_invoke;
  v14[3] = &unk_1E6F4DB40;
  objc_copyWeak(&v16, (id *)buf);
  v12 = v5;
  v15 = v12;
  v13 = (id)objc_msgSend(v11, "addCompletionBlock:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __66__HUMediaAccessoryAudioSettingsViewController_didPressSwapButton___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateSwapperCell:", 0);
  objc_msgSend(*(id *)(a1 + 32), "swapButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

}

- (void)_updateSwapperCell:(id)a3
{
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
  id v20;

  v20 = a3;
  if (!v20)
  {
    -[HUMediaAccessoryAudioSettingsViewController _homePodStereoSwapperCell](self, "_homePodStereoSwapperCell");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[HUMediaAccessoryAudioSettingsViewController mediaSystemBuilder](self, "mediaSystemBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA688], "leftRole");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryForRole:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUMediaAccessoryAudioSettingsViewController mediaSystemBuilder](self, "mediaSystemBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA688], "rightRole");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryForRole:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hf_serviceNameComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leftHomePod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUnitName:", v11);

  objc_msgSend(v9, "hf_serviceNameComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serviceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rightHomePod");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUnitName:", v14);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v17, "hf_currentUserIsOwner");

  if ((_DWORD)v15)
  {
    objc_msgSend(v20, "leftHomePod");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", self);

    objc_msgSend(v20, "rightHomePod");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", self);

  }
}

- (id)_homePodStereoSwapperCell
{
  void *v2;
  void *v3;
  void *v4;

  -[HUMediaAccessoryAudioSettingsViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __72__HUMediaAccessoryAudioSettingsViewController__homePodStereoSwapperCell__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (HFMediaSystemBuilder)mediaSystemBuilder
{
  return self->_mediaSystemBuilder;
}

- (NAFuture)accessoryIdentifyFuture
{
  return self->_accessoryIdentifyFuture;
}

- (void)setAccessoryIdentifyFuture:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifyFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifyFuture, 0);
  objc_storeStrong((id *)&self->_mediaSystemBuilder, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
