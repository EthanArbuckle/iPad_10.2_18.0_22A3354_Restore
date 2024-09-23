@implementation PreviewTableViewController

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PreviewTableViewController;
  -[PreviewTableViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PreviewTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView safari_dismissContextMenu](v4);

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0DC36B8];
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__PreviewTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v18[3] = &unk_1E9CF57D8;
  objc_copyWeak(&v20, &location);
  v11 = v8;
  v19 = v11;
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __88__PreviewTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v15[3] = &unk_1E9CF5800;
  objc_copyWeak(&v17, &location);
  v12 = v11;
  v16 = v12;
  objc_msgSend(v9, "configurationWithIdentifier:previewProvider:actionProvider:", v12, v18, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v13;
}

id __88__PreviewTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(WeakRetained + 127);
    objc_msgSend(v4, "previewTableViewController:URLForRowAtIndexPath:", v3, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_loadWeakRetained(v3 + 128);
    objc_msgSend(v6, "linkPreviewViewControllerForURL:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __88__PreviewTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(WeakRetained + 127);
    objc_msgSend(v4, "previewTableViewController:menuForRowAtIndexPath:", v3, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v7);
  return v8;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  PreviewTableViewController *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "setPreferredCommitStyle:", 1);
  objc_msgSend(v10, "previewViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__PreviewTableViewController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
  v15[3] = &unk_1E9CF2AF8;
  v16 = v8;
  v17 = v11;
  v18 = self;
  v19 = v9;
  v12 = v9;
  v13 = v11;
  v14 = v8;
  objc_msgSend(v10, "addAnimations:", v15);

}

void __98__PreviewTableViewController_tableView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  void *WeakRetained;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 1024));
    objc_msgSend(WeakRetained, "commitLinkPreviewViewController:", *(_QWORD *)(a1 + 40));
LABEL_5:

    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableView:didSelectRowAtIndexPath:", v3, WeakRetained);
    goto LABEL_5;
  }
LABEL_6:

}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
  objc_msgSend(WeakRetained, "linkPreviewProviderWillDismissPreview");

  return 0;
}

- (PreviewTableViewControllerDelegate)previewDelegate
{
  return (PreviewTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_previewDelegate);
}

- (void)setPreviewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_previewDelegate, a3);
}

- (LinkPreviewProvider)linkPreviewProvider
{
  return (LinkPreviewProvider *)objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
}

- (void)setLinkPreviewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_linkPreviewProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_previewDelegate);
}

@end
