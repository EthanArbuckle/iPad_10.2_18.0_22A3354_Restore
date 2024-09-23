@implementation FPUIAuthenticationServerInfoViewController

- (FPUIAuthenticationServerInfoViewController)initWithServerRepresentation:(id)a3
{
  id v5;
  FPUIAuthenticationServerInfoViewController *v6;
  FPUIAuthenticationServerInfoViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPUIAuthenticationServerInfoViewController;
  v6 = -[FPUIAuthenticationTableViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serverRepresentation, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FPUIAuthenticationServerInfoViewController;
  -[FPUIAuthenticationTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[FPUIAuthenticationServerRepresentation displayName](self->_serverRepresentation, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setTitle:](self, "setTitle:", v3);

}

- (void)setupTableViewSections
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD v22[5];
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  FPUILoc(CFSTR("SERVER"), v4, v5, v6, v7, v8, v9, v10, v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHeaderTitle:", v11);

  objc_msgSend(v3, "setHeaderHeight:", *MEMORY[0x24BDF7DE0]);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setCellReuseIdentifier:", CFSTR("ServerAddress"));
  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __68__FPUIAuthenticationServerInfoViewController_setupTableViewSections__block_invoke;
  v22[3] = &unk_24EFEE168;
  v22[4] = self;
  objc_msgSend(v12, "setCellCustomizationHandler:", v22);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setHeaderHeight:", 36.0);
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setCellReuseIdentifier:", CFSTR("Button"));
  objc_msgSend(v15, "setCellClass:", objc_opt_class());
  objc_msgSend(v15, "setCellSelectionStyle:", 2);
  objc_msgSend(v15, "setCellCustomizationHandler:", &__block_literal_global_2);
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __68__FPUIAuthenticationServerInfoViewController_setupTableViewSections__block_invoke_3;
  v21[3] = &unk_24EFEE1D0;
  v21[4] = self;
  objc_msgSend(v15, "setSelectionHandler:", v21);
  objc_msgSend(v15, "setShouldHighlight:", 1.0);
  v27[0] = v3;
  v27[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setSectionDescriptors:](self, "setSectionDescriptors:", v16);

  v24 = v12;
  v25[0] = &unk_24EFF2778;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = &unk_24EFF2790;
  v26[0] = v17;
  v23 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setRowDescriptors:](self, "setRowDescriptors:", v19);

}

void __68__FPUIAuthenticationServerInfoViewController_setupTableViewSections__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1048);
  v3 = a2;
  objc_msgSend(v2, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  FPUITableCellServerIcon();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setImage:", v7);
}

void __68__FPUIAuthenticationServerInfoViewController_setupTableViewSections__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v2 = a2;
  FPUILoc(CFSTR("REMOVE"), v3, v4, v5, v6, v7, v8, v9, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(MEMORY[0x24BDF6950], "redColor");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setTextColor:", v14);
}

void __68__FPUIAuthenticationServerInfoViewController_setupTableViewSections__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "removeButtonTapped:", v4);
}

- (void)removeButtonTapped:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41[5];
  _QWORD v42[5];

  v9 = (void *)MEMORY[0x24BDF67F0];
  FPUILoc(CFSTR("REMOVE_SERVER"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, v41[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FPUILoc(CFSTR("REMOVE_SERVER_ALERT_MESSAGE"), v11, v12, v13, v14, v15, v16, v17, v41[0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDF67E8];
  FPUILoc(CFSTR("CANCEL_ALERT_OPTION"), v21, v22, v23, v24, v25, v26, v27, v41[0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v28, 1, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x24BDF67E8];
  FPUILoc(CFSTR("REMOVE"), v31, v32, v33, v34, v35, v36, v37, v41[0]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = MEMORY[0x24BDAC760];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __65__FPUIAuthenticationServerInfoViewController_removeButtonTapped___block_invoke;
  v42[3] = &unk_24EFEE1F8;
  v42[4] = self;
  objc_msgSend(v30, "actionWithTitle:style:handler:", v38, 2, v42);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "addAction:", v29);
  objc_msgSend(v19, "addAction:", v40);
  v41[0] = v39;
  v41[1] = 3221225472;
  v41[2] = (uint64_t)__65__FPUIAuthenticationServerInfoViewController_removeButtonTapped___block_invoke_3;
  v41[3] = (uint64_t)&unk_24EFEDFA0;
  v41[4] = (uint64_t)self;
  -[FPUIAuthenticationServerInfoViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, v41);

}

void __65__FPUIAuthenticationServerInfoViewController_removeButtonTapped___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  _QWORD v11[5];

  objc_msgSend(*(id *)(a1 + 32), "authenticationDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "authenticationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v3 & 1) != 0)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 1048);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__FPUIAuthenticationServerInfoViewController_removeButtonTapped___block_invoke_2;
    v11[3] = &unk_24EFEDF28;
    v11[4] = v7;
    objc_msgSend(v5, "removeRecentServerWithRepresentation:completion:", v8, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10.receiver = v4;
    v10.super_class = (Class)FPUIAuthenticationServerInfoViewController;
    objc_msgSendSuper2(&v10, sel_authenticationDelegate_didEncounterError_, v6, v9);

  }
}

void __65__FPUIAuthenticationServerInfoViewController_removeButtonTapped___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "authenticationDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8.receiver = v4;
    v8.super_class = (Class)FPUIAuthenticationServerInfoViewController;
    objc_msgSendSuper2(&v8, sel_authenticationDelegate_didEncounterError_, v5, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "serverInfoDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeServerWithRepresentation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);
  }

}

void __65__FPUIAuthenticationServerInfoViewController_removeButtonTapped___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathForSelectedRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v3, 1);

}

- (id)defaultLeftBarButtonItem
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("ServerAddress"), "isEqualToString:", v5);

  return v6;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return sel_copy_ == a4;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  void *v6;
  id v7;

  if (sel_copy_ == a4)
  {
    -[FPUIAuthenticationServerRepresentation displayName](self->_serverRepresentation, "displayName", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setString:", v7);

  }
}

- (FPUIAuthenticationServerInfoDelegate)serverInfoDelegate
{
  return (FPUIAuthenticationServerInfoDelegate *)objc_loadWeakRetained((id *)&self->_serverInfoDelegate);
}

- (void)setServerInfoDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_serverInfoDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serverInfoDelegate);
  objc_storeStrong((id *)&self->_serverRepresentation, 0);
}

@end
