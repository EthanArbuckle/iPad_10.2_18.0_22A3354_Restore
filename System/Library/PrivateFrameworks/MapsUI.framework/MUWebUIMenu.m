@implementation MUWebUIMenu

- (MUWebUIMenu)initWithFrame:(CGRect)a3
{
  MUWebUIMenu *v3;
  MUWebUIMenu *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUWebUIMenu;
  v3 = -[MUWebUIMenu initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUWebUIMenu setContextMenuInteractionEnabled:](v3, "setContextMenuInteractionEnabled:", 1);
    -[MUWebUIMenu setShowsMenuAsPrimaryAction:](v4, "setShowsMenuAsPrimaryAction:", 1);
    -[MUWebUIMenu setIsAccessibilityElement:](v4, "setIsAccessibilityElement:", 1);
    -[MUWebUIMenu setAccessibilityTraits:](v4, "setAccessibilityTraits:", *MEMORY[0x1E0DC4660]);
    -[MUWebUIMenu setAccessibilityLabel:](v4, "setAccessibilityLabel:", CFSTR("UIMenu"));
    -[MUWebUIMenu setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("UIMenu"));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebUIMenu setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__MUWebUIMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v5[3] = &unk_1E2E02D00;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __69__MUWebUIMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  id v13;
  id location;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "menuItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __69__MUWebUIMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7;
  v10 = &unk_1E2E02CD8;
  objc_copyWeak(&v13, &location);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = &v15;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v7);

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v16[5], v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __69__MUWebUIMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  v3 = a2;
  if (objc_msgSend(v3, "hasDisplayName"))
  {
    objc_msgSend(v3, "symbolImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DC3870];
    if (v4)
    {
      objc_msgSend(v3, "symbolImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_systemImageNamed:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0DC3870]);
    }

    v8 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(v3, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "menuItemId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__MUWebUIMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v14[3] = &unk_1E2E01D30;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    v11 = v3;
    v12 = *(_QWORD *)(a1 + 32);
    v15 = v11;
    v16 = v12;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, v7, v10, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v13);
    objc_destroyWeak(&v17);

  }
}

void __69__MUWebUIMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "menuActionManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performActionUsingArguments:contextMenu:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_20);

    WeakRetained = v4;
  }

}

- (MUWebMenuButton)menuButton
{
  return self->_menuButton;
}

- (void)setMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->_menuButton, a3);
}

- (MUWebUIMenuActionManager)menuActionManager
{
  return self->_menuActionManager;
}

- (void)setMenuActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_menuActionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuActionManager, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
}

@end
