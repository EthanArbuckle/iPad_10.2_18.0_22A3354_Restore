@implementation HUMediaSourceListViewController

- (id)initForMediaProfileContainers:(id)a3 forTarget:(unint64_t)a4
{
  id v6;
  id v7;
  HUMediaSourceListViewController *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = -[HUMediaSourceListItemManager initForMediaProfileContainers:delegate:forTarget:]([HUMediaSourceListItemManager alloc], "initForMediaProfileContainers:delegate:forTarget:", v6, self, a4);

  v21.receiver = self;
  v21.super_class = (Class)HUMediaSourceListViewController;
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v21, sel_initWithItemManager_tableViewStyle_, v7, 0);
  if (v8)
  {
    HFLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaSourceListViewController navigationItem](v8, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v9);

    v11 = objc_alloc(MEMORY[0x1E0CEA380]);
    HFLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v12, 0, v8, sel_dismissViewController);
    -[HUMediaSourceListViewController navigationItem](v8, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeftBarButtonItem:", v13);

    -[HUMediaSourceListViewController tableView](v8, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSectionHeaderTopPadding:", 0.0);

    -[HUMediaSourceListViewController tableView](v8, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "separatorColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 0.0, 0.5);
    objc_msgSend(v18, "setBackgroundColor:", v17);
    -[HUMediaSourceListViewController tableView](v8, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTableHeaderView:", v18);

  }
  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUMediaSourceListViewController;
  -[HUItemTableViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[HUMediaSourceListViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrefersLargeTitles:", 1);

}

- (void)dismissViewController
{
  id v2;

  -[HUMediaSourceListViewController navigationController](self, "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setIconDisplayStyle:", 1);
  objc_msgSend(v6, "contentMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIconSize:", 32.0, 32.0);

  objc_msgSend(v6, "setHideDescriptionIcon:", 1);
  objc_msgSend(v6, "setSeparatorInsetLinesUpWithText:", 1);

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  objc_super v11;

  v6 = a6;
  v10 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUMediaSourceListViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v11, sel_updateCell_forItem_indexPath_animated_, v10, a4, a5, v6);
  objc_msgSend(v10, "updateUIWithAnimation:", v6);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  NSObject *v34;
  objc_super v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)HUMediaSourceListViewController;
  v6 = a4;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v35, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v35.receiver, v35.super_class);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    if (objc_msgSend(v12, "success"))
    {
      objc_msgSend(v12, "pickerViewController");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v12, "setDelegate:", self);
        if (objc_msgSend(v12, "continuousPicker"))
        {
          -[HUMediaSourceListViewController view](self, "view");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "frame");
          v17 = v16;
          v19 = v18;
          v21 = v20;
          v23 = v22;
          objc_msgSend(v14, "view");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

          -[HUMediaSourceListViewController navigationController](self, "navigationController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "pushViewController:animated:", v14, 1);

LABEL_24:
          goto LABEL_25;
        }
        objc_msgSend(v14, "setModalPresentationStyle:", 2);
        -[HUMediaSourceListViewController view](self, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "frame");
        objc_msgSend(v14, "setPreferredContentSize:", v32, v33);

LABEL_18:
        -[HUMediaSourceListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
        goto LABEL_24;
      }
      HFLogForCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v12;
        _os_log_impl(&dword_1B8E1E000, v28, OS_LOG_TYPE_DEFAULT, "Media source %@ resolved successfully, but no picker view controller", buf, 0xCu);
      }

      objc_msgSend(v12, "resolveError");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUMediaSourceListViewController errorAlertControllerForResolveError:](self, "errorAlertControllerForResolveError:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        -[HUMediaSourceListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v30, 1, 0);
      }
      else
      {
        HFLogForCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v12;
          _os_log_impl(&dword_1B8E1E000, v34, OS_LOG_TYPE_DEFAULT, "Media source %@ failed to resolve, but no alert view controller for the error", buf, 0xCu);
        }

      }
    }
    else
    {
      objc_msgSend(v12, "resolveError");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUMediaSourceListViewController errorAlertControllerForResolveError:](self, "errorAlertControllerForResolveError:", v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        goto LABEL_18;
      HFLogForCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v12;
        _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "Media source %@ failed to resolve, but no alert view controller for the error", buf, 0xCu);
      }

    }
    v14 = 0;
    goto LABEL_24;
  }
LABEL_25:

}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (id)errorAlertControllerForResolveError:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v3;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Media source failed to resolve, show alert view controller for parameters %@", buf, 0xCu);
    }

    objc_opt_class();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HUMediaPickerUnavailablePromptActionTitleKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HUMediaPickerUnavailablePromptMessageKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (!(v7 | v8))
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUUnknownError"), CFSTR("HUUnknownError"), 1);
      v7 = objc_claimAutoreleasedReturnValue();
      HFLocalizedString();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v13);

    objc_opt_class();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HUMediaPickerUnavailablePromptActionTitleKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_opt_class();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HUMediaPickerUnavailablePromptActionURLKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    if (v16 && v19)
    {
      v20 = (void *)MEMORY[0x1E0CEA2E0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __71__HUMediaSourceListViewController_errorAlertControllerForResolveError___block_invoke;
      v23[3] = &unk_1E6F4C6E0;
      v24 = v19;
      objc_msgSend(v20, "actionWithTitle:style:handler:", v16, 0, v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v21);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __71__HUMediaSourceListViewController_errorAlertControllerForResolveError___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "openURL:", *(_QWORD *)(a1 + 32));

}

- (void)mediaPickerDidPickPlaybackArchive:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUMediaSourceListViewController presentedViewController](self, "presentedViewController");

  -[HUMediaSourceListViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaPickerDidPickPlaybackArchive:", v4);

}

- (void)mediaPickerDidCancel
{
  void *v3;
  id v4;

  -[HUMediaSourceListViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUMediaSourceListViewController presentedViewController](self, "presentedViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (HUMediaSourceListDelegate)delegate
{
  return (HUMediaSourceListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MPPlaybackArchive)currentPlaybackSelection
{
  return (MPPlaybackArchive *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setCurrentPlaybackSelection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPlaybackSelection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
