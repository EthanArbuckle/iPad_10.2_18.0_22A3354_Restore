@implementation CNAutocompleteGroupDetailViewController

- (CNAutocompleteGroupDetailViewController)initWithStyle:(int64_t)a3
{
  CNAutocompleteGroupDetailViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CNAutocompleteGroupDetailViewController;
  v3 = -[CNAutocompleteGroupDetailViewController initWithStyle:](&v16, sel_initWithStyle_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("RECENT_TITLE"), &stru_1E62C0368, CFSTR("Main"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteGroupDetailViewController navigationItem](v3, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v5);

    -[CNAutocompleteGroupDetailViewController tableView](v3, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    +[CNComposeRecipientTableViewCell identifier](CNComposeRecipientTableViewCell, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", v8, v9);

    v10 = objc_alloc(MEMORY[0x1E0CEA380]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("REMOVE_TITLE"), &stru_1E62C0368, CFSTR("Main"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v12, 0, v3, sel__removeButtonTapped_);

    -[CNAutocompleteGroupDetailViewController navigationItem](v3, "navigationItem");
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
  v5.super_class = (Class)CNAutocompleteGroupDetailViewController;
  -[CNAutocompleteGroupDetailViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "autocompleteGroupDetailViewControllerDidCancel:", self);

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
  CNAutocompleteGroupDetailViewController *v26;

  v4 = (void *)MEMORY[0x1E0CEA2E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECENT_GROUP_CONFIRM"), &stru_1E62C0368, CFSTR("Main"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setModalPresentationStyle:", 7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECENT"), &stru_1E62C0368, CFSTR("Main"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __63__CNAutocompleteGroupDetailViewController__removeButtonTapped___block_invoke;
  v24 = &unk_1E62BEDF0;
  v25 = WeakRetained;
  v26 = self;
  v12 = WeakRetained;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 2, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v13, v21, v22, v23, v24);

  v14 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E62C0368, CFSTR("Main"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v17);

  objc_msgSend(v7, "popoverPresentationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteGroupDetailViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rightBarButtonItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBarButtonItem:", v20);

  objc_msgSend(v18, "setPermittedArrowDirections:", 3);
  -[CNAutocompleteGroupDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

void __63__CNAutocompleteGroupDetailViewController__removeButtonTapped___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "autocompleteGroupDetailViewController:didAskToRemoveGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1024));
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CNComposeRecipientGroup children](self->_group, "children", a3, a4);
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
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  +[CNComposeRecipientTableViewCell identifier](CNComposeRecipientTableViewCell, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNComposeRecipientGroup children](self->_group, "children");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccessoryType:", 1);
  objc_msgSend(v9, "setShouldHighlightCompleteMatches:", 0);
  objc_msgSend(v9, "recipient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != v12)
    objc_msgSend(v9, "setRecipient:", v12);

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
    -[CNComposeRecipientGroup children](self->_group, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v8, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "autocompleteGroupDetailViewController:didTapComposeRecipient:", self, v7);

  }
}

- (CNAutocompleteGroupDetailViewControllerDelegate)delegate
{
  return (CNAutocompleteGroupDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNRecentComposeRecipientGroup)group
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
