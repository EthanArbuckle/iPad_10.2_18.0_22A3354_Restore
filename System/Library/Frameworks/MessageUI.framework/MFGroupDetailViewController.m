@implementation MFGroupDetailViewController

- (MFGroupDetailViewController)initWithStyle:(int64_t)a3
{
  MFGroupDetailViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MFGroupDetailViewController;
  v3 = -[MFGroupDetailViewController initWithStyle:](&v16, sel_initWithStyle_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("RECENT_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFGroupDetailViewController navigationItem](v3, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v5);

    -[MFGroupDetailViewController tableView](v3, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setMarginWidth:", 16.0);

    -[MFGroupDetailViewController tableView](v3, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFRecipientTableViewCell height](MFRecipientTableViewCell, "height");
    objc_msgSend(v8, "setEstimatedRowHeight:");

    -[MFGroupDetailViewController tableView](v3, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRowHeight:", *MEMORY[0x1E0DC53D8]);

    v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("REMOVE_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v12, 0, v3, sel__removeButtonTapped_);

    -[MFGroupDetailViewController navigationItem](v3, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightBarButtonItem:", v13);

  }
  return v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFGroupDetailViewController;
  -[MFGroupDetailViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "groupDetailViewControllerDidCancel:", self);

}

- (void)_removeButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  MFGroupDetailViewController *v26;

  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECENT_CONFIRM"), &stru_1E5A6A588, CFSTR("Main"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setModalPresentationStyle:", 7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECENT"), &stru_1E5A6A588, CFSTR("Main"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __51__MFGroupDetailViewController__removeButtonTapped___block_invoke;
  v24 = &unk_1E5A67358;
  v12 = WeakRetained;
  v25 = v12;
  v26 = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 2, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v13, v21, v22, v23, v24);

  v14 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v17);

  objc_msgSend(v7, "popoverPresentationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFGroupDetailViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rightBarButtonItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBarButtonItem:", v20);

  objc_msgSend(v18, "setPermittedArrowDirections:", 3);
  -[MFGroupDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

void __51__MFGroupDetailViewController__removeButtonTapped___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "groupDetailViewController:didAskToRemoveGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1024));
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[MFComposeRecipientGroup children](self->_group, "children", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MFRecipientTableViewCell *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  +[MFRecipientTableViewCell identifier](MFRecipientTableViewCell, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeRecipientGroup children](self->_group, "children");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v12 = -[MFRecipientTableViewCell initWithStyle:reuseIdentifier:]([MFRecipientTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, v8);
    -[MFRecipientTableViewCell setAccessoryType:](v12, "setAccessoryType:", 1);
    v9 = v12;
    -[MFRecipientTableViewCell setShouldHighlightCompleteMatches:](v12, "setShouldHighlightCompleteMatches:", 0);
  }
  objc_msgSend(v9, "recipient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != v11)
    objc_msgSend(v9, "setRecipient:", v11);

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MFComposeRecipientGroup children](self->_group, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v8, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "groupDetailViewController:didTapComposeRecipient:", self, v7);

  }
}

- (MFGroupDetailViewControllerDelegate)delegate
{
  return (MFGroupDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MFRecentComposeRecipientGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
