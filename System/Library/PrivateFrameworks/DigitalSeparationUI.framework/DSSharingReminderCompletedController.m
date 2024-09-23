@implementation DSSharingReminderCompletedController

- (DSSharingReminderCompletedController)init
{
  void *v3;
  DSSharingReminderCompletedController *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("checklist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)DSSharingReminderCompletedController;
  v4 = -[DSSharingReminderCompletedController initWithTitle:detailText:icon:](&v6, sel_initWithTitle_detailText_icon_, &stru_24EFF4790, &stru_24EFF4790, v3);

  return v4;
}

- (void)viewDidLoad
{
  DSSharingReminderCompletedController *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char *v13;
  DSSharingReminderCompletedController *v14;
  void *v15;
  DSSharingReminderCompletedController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)DSSharingReminderCompletedController;
  -[DSOBWelcomeController viewDidLoad](&v23, sel_viewDidLoad);
  -[DSSharingReminderCompletedController delegate](self, "delegate");
  v3 = (DSSharingReminderCompletedController *)objc_claimAutoreleasedReturnValue();
  -[DSSharingReminderCompletedController unpairedComputers](v3, "unpairedComputers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[DSSharingReminderCompletedController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    DSUILocStringForKey(CFSTR("SHARING_REMINDER_WIFI_SYNC_TITLE_CHANGED"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);

    -[DSSharingReminderCompletedController headerView](self, "headerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("SHARING_REMINDER_WIFI_SYNC_DETAIL_CHANGED"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDetailText:", v9);

    DSUILocStringForKey(CFSTR("CONTINUE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v10, v3, sel_goToCustomizeSharing);

    DSUILocStringForKey(CFSTR("DONE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = sel_done;
    v14 = self;
    v15 = v12;
    v16 = self;
  }
  else
  {
    DSUILocStringForKey(CFSTR("SHARING_REMINDER_WIFI_SYNC_TITLE_NO_CHANGE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v17);

    -[DSSharingReminderCompletedController headerView](self, "headerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("SHARING_REMINDER_WIFI_SYNC_DETAIL_NO_CHANGE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDetailText:", v19);

    DSUILocStringForKey(CFSTR("DONE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v20, self, sel_done);

    DSUILocStringForKey(CFSTR("SHARING_REMINDER_EXPLORE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = sel_goToCustomizeSharing;
    v14 = self;
    v15 = v12;
    v16 = v3;
  }
  v22 = +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", v14, v15, v16, v13);

}

- (void)done
{
  -[DSSharingReminderCompletedController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
