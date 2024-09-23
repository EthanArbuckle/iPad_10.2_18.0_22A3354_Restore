@implementation MUPlaceEnrichmentContextMenu

- (MUPlaceEnrichmentContextMenu)initWithFrame:(CGRect)a3
{
  MUPlaceEnrichmentContextMenu *v3;
  MUPlaceEnrichmentContextMenu *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUPlaceEnrichmentContextMenu;
  v3 = -[MUPlaceEnrichmentContextMenu initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUPlaceEnrichmentContextMenu setContextMenuInteractionEnabled:](v3, "setContextMenuInteractionEnabled:", 1);
    -[MUPlaceEnrichmentContextMenu setShowsMenuAsPrimaryAction:](v4, "setShowsMenuAsPrimaryAction:", 1);
  }
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__MUPlaceEnrichmentContextMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v5[3] = &unk_1E2E02D00;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __86__MUPlaceEnrichmentContextMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id location;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "contextMenuAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrichmentAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", 0x1E2E145E8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__MUPlaceEnrichmentContextMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_12;
  v9[3] = &unk_1E2E02D60;
  objc_copyWeak(&v10, &location);
  v9[4] = &v12;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v13[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __86__MUPlaceEnrichmentContextMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(v3, "objectForKeyedSubscript:", 0x1E2E14628);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v3, "objectForKeyedSubscript:", 0x1E2E14608);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_systemImageNamed:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", 0x1E2E14628);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __86__MUPlaceEnrichmentContextMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v15 = &unk_1E2E014E8;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  v10 = v3;
  v16 = v10;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v8, v9, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v11, v12, v13, v14, v15);
  objc_destroyWeak(&v17);

}

void __86__MUPlaceEnrichmentContextMenu_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "enrichmentActionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "performActionUsingArguments:contextMenu:completion:", v5, v6, &__block_literal_global_21);

    WeakRetained = v7;
  }

}

- (MUPlaceEnrichmentAction)contextMenuAction
{
  return self->_contextMenuAction;
}

- (void)setContextMenuAction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuAction, a3);
}

- (MUPlaceEnrichmentSectionContextMenuDelegate)contextMenuDelegate
{
  return (MUPlaceEnrichmentSectionContextMenuDelegate *)objc_loadWeakRetained((id *)&self->_contextMenuDelegate);
}

- (void)setContextMenuDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contextMenuDelegate, a3);
}

- (MUPlaceEnrichmentActionHandler)enrichmentActionDelegate
{
  return (MUPlaceEnrichmentActionHandler *)objc_loadWeakRetained((id *)&self->_enrichmentActionDelegate);
}

- (void)setEnrichmentActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_enrichmentActionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_enrichmentActionDelegate);
  objc_destroyWeak((id *)&self->_contextMenuDelegate);
  objc_storeStrong((id *)&self->_contextMenuAction, 0);
}

@end
