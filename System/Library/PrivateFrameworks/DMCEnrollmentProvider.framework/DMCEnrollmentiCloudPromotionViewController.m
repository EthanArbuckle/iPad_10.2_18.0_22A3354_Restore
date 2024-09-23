@implementation DMCEnrollmentiCloudPromotionViewController

- (DMCEnrollmentiCloudPromotionViewController)initWithType:(unint64_t)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  DMCEnrollmentiCloudPromotionViewController *v9;
  DMCEnrollmentiCloudPromotionViewController *v10;
  objc_super v12;

  v6 = a4;
  DMCLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 > 1)
  {
    v8 = 0;
  }
  else
  {
    DMCLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12.receiver = self;
  v12.super_class = (Class)DMCEnrollmentiCloudPromotionViewController;
  v9 = -[DMCEnrollmentTemplateTableViewController initWithIconNames:title:subTitle:](&v12, sel_initWithIconNames_title_subTitle_, &unk_24D548708, v7, v8);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    objc_storeWeak((id *)&v9->_delegate, v6);
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentiCloudPromotionViewController;
  -[DMCEnrollmentTemplateTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if ((-[DMCEnrollmentiCloudPromotionViewController isBeingPresented](self, "isBeingPresented") & 1) != 0
    || -[DMCEnrollmentiCloudPromotionViewController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    -[DMCEnrollmentiCloudPromotionViewController _setupUIForType:](self, "_setupUIForType:", -[DMCEnrollmentiCloudPromotionViewController type](self, "type"));
  }
}

- (void)_setupUIForType:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  DMCEnrollmentTableViewPromotionCell *v8;
  void *v9;
  void *v10;
  void *v11;
  DMCEnrollmentTableViewPromotionCell *v12;
  void *v13;
  void *v14;
  DMCEnrollmentTableViewPromotionCell *v15;
  void *v16;
  void *v17;
  DMCEnrollmentTableViewPromotionCell *v18;
  void *v19;
  DMCEnrollmentTableViewPromotionCell *v20;
  void *v21;
  void *v22;
  void *v23;
  DMCEnrollmentTableViewPromotionCell *v24;
  unint64_t v25;
  void *v26;
  DMCEnrollmentTableViewPromotionCell *v27;
  void *v28;
  void *v29;
  void *v30;
  DMCEnrollmentTableViewPromotionCell *v31;
  void *v32;
  DMCEnrollmentTableViewPromotionCell *v33;
  void *v34;
  void *v35;
  void *v36;
  DMCEnrollmentTableViewPromotionCell *v37;
  void *v38;
  DMCEnrollmentTableViewPlatterCell *v39;
  void *v40;
  DMCEnrollmentTableViewPlatterCell *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  DMCEnrollmentTableViewPlatterCell *v56;
  DMCEnrollmentTableViewPromotionCell *v57;
  DMCEnrollmentTableViewPromotionCell *v58;
  DMCEnrollmentTableViewPromotionCell *v59;
  DMCEnrollmentTableViewPromotionCell *v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x24BDAC8D0];
  -[DMCEnrollmentiCloudPromotionViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesBackButton:", 1);

  v6 = (void *)objc_opt_new();
  v7 = 0x24BDBC000uLL;
  if (a3 == 1)
  {
    -[DMCEnrollmentiCloudPromotionViewController quotaString](self, "quotaString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    DMCLocalizedFormat();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = [DMCEnrollmentTableViewPromotionCell alloc];
    DMCLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMCIconFactory iCloudIcon](DMCIconFactory, "iCloudIcon", v50);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[DMCEnrollmentTableViewPromotionCell initWithTitle:subtitle:icon:](v15, "initWithTitle:subtitle:icon:", v14, v16, v17);
    v60 = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v19);

    v7 = 0x24BDBC000uLL;
  }
  else if (!a3)
  {
    v8 = [DMCEnrollmentTableViewPromotionCell alloc];
    DMCLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DMCLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMCIconFactory iCloudIcon](DMCIconFactory, "iCloudIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[DMCEnrollmentTableViewPromotionCell initWithTitle:subtitle:icon:](v8, "initWithTitle:subtitle:icon:", v9, v10, v11);
    v61[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v13);

    v7 = 0x24BDBC000;
    -[DMCEnrollmentTemplateTableViewController updateNavBarButtonType:forButtonPosition:enabled:](self, "updateNavBarButtonType:forButtonPosition:enabled:", 1, 0, 1);
    -[DMCEnrollmentiCloudPromotionViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  }
  v20 = [DMCEnrollmentTableViewPromotionCell alloc];
  DMCLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  DMCLocalizedString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[DMCIconFactory iCloudCollaborationIcon](DMCIconFactory, "iCloudCollaborationIcon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[DMCEnrollmentTableViewPromotionCell initWithTitle:subtitle:icon:](v20, "initWithTitle:subtitle:icon:", v21, v22, v23);
  v59 = v24;
  objc_msgSend(*(id *)(v7 + 3632), "arrayWithObjects:count:", &v59, 1);
  v25 = v7;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v26);

  v27 = [DMCEnrollmentTableViewPromotionCell alloc];
  DMCLocalizedString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  DMCLocalizedString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[DMCIconFactory notesIcon](DMCIconFactory, "notesIcon");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[DMCEnrollmentTableViewPromotionCell initWithTitle:subtitle:icon:](v27, "initWithTitle:subtitle:icon:", v28, v29, v30);
  v58 = v31;
  objc_msgSend(*(id *)(v25 + 3632), "arrayWithObjects:count:", &v58, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v32);

  if (-[DMCEnrollmentiCloudPromotionViewController type](self, "type") == 1)
  {
    v33 = [DMCEnrollmentTableViewPromotionCell alloc];
    DMCLocalizedString();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    DMCLocalizedString();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMCIconFactory workBadgeIcon](DMCIconFactory, "workBadgeIcon");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[DMCEnrollmentTableViewPromotionCell initWithTitle:subtitle:icon:](v33, "initWithTitle:subtitle:icon:", v34, v35, v36);
    v57 = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v38);

  }
  if (objc_msgSend(MEMORY[0x24BE2A818], "isPad"))
  {
    v39 = [DMCEnrollmentTableViewPlatterCell alloc];
    -[DMCEnrollmentTemplateTableViewController tableView](self, "tableView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[DMCEnrollmentTableViewPlatterCell initWithCellData:parentTableView:useShadow:](v39, "initWithCellData:parentTableView:useShadow:", v6, v40, 0);

    -[DMCEnrollmentTableViewPlatterCell tableViewController](v41, "tableViewController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCustomTopMargin:", &unk_24D548798);

    -[DMCEnrollmentTableViewPlatterCell setCustomHorizontalMargin:](v41, "setCustomHorizontalMargin:", &unk_24D5487A8);
    -[DMCEnrollmentTableViewPlatterCell tableViewController](v41, "tableViewController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setNeedsLayout");

    v56 = v41;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTemplateTableViewController addSectionWithCellData:animated:](self, "addSectionWithCellData:animated:", v45, 0);

  }
  else
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v41 = v6;
    v46 = -[DMCEnrollmentTableViewPlatterCell countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v52 != v48)
            objc_enumerationMutation(v41);
          -[DMCEnrollmentTemplateTableViewController addSectionWithCellData:animated:](self, "addSectionWithCellData:animated:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i), 0);
        }
        v47 = -[DMCEnrollmentTableViewPlatterCell countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v47);
    }
  }

  -[DMCEnrollmentiCloudPromotionViewController _setupBottomViewForType:](self, "_setupBottomViewForType:", a3);
}

- (void)_setupBottomViewForType:(unint64_t)a3
{
  DMCEnrollmentConfirmationView *v4;
  void *v5;
  id *v6;
  uint64_t v7;
  DMCEnrollmentConfirmationView *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  if (a3 == 1)
  {
    objc_initWeak(&location, self);
    v8 = [DMCEnrollmentConfirmationView alloc];
    DMCLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__DMCEnrollmentiCloudPromotionViewController__setupBottomViewForType___block_invoke_3;
    v10[3] = &unk_24D52E7F8;
    v6 = &v11;
    objc_copyWeak(&v11, &location);
    v7 = -[DMCEnrollmentConfirmationView initWithConfirmationText:cancelText:confirmationAction:cancelAction:](v8, "initWithConfirmationText:cancelText:confirmationAction:cancelAction:", v5, CFSTR(" "), v10, &__block_literal_global_41);
  }
  else
  {
    if (a3)
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_initWeak(&location, self);
    v4 = [DMCEnrollmentConfirmationView alloc];
    DMCLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __70__DMCEnrollmentiCloudPromotionViewController__setupBottomViewForType___block_invoke;
    v12[3] = &unk_24D52E7F8;
    v6 = &v13;
    objc_copyWeak(&v13, &location);
    v7 = -[DMCEnrollmentConfirmationView initWithConfirmationText:cancelText:confirmationAction:cancelAction:](v4, "initWithConfirmationText:cancelText:confirmationAction:cancelAction:", v5, CFSTR(" "), v12, &__block_literal_global_2);
  }
  v9 = (void *)v7;

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
LABEL_7:
  -[DMCEnrollmentTemplateTableViewController addBottomView:](self, "addBottomView:", v9);

}

void __70__DMCEnrollmentiCloudPromotionViewController__setupBottomViewForType___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "iCloudPromotionViewController:didReceiveUserAction:", v3, 1);

    WeakRetained = v3;
  }

}

void __70__DMCEnrollmentiCloudPromotionViewController__setupBottomViewForType___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "iCloudPromotionViewController:didReceiveUserAction:", v3, 1);

    WeakRetained = v3;
  }

}

- (void)leftBarButtonTapped:(id)a3
{
  id v4;

  -[DMCEnrollmentiCloudPromotionViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iCloudPromotionViewController:didReceiveUserAction:", self, 0);

}

- (void)viewControllerHasBeenDismissed
{
  id v3;

  -[DMCEnrollmentiCloudPromotionViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iCloudPromotionViewController:didReceiveUserAction:", self, 0);

}

- (NSString)quotaString
{
  return self->_quotaString;
}

- (void)setQuotaString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (DMCEnrollmentiCloudPromotionViewControllerDelegate)delegate
{
  return (DMCEnrollmentiCloudPromotionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_quotaString, 0);
}

@end
