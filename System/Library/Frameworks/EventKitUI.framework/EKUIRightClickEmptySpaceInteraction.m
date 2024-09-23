@implementation EKUIRightClickEmptySpaceInteraction

- (void)willMoveToView:(id)a3
{
  -[UIContextMenuInteraction willMoveToView:](self->_interaction, "willMoveToView:", a3);
}

- (UIView)view
{
  return (UIView *)-[UIContextMenuInteraction view](self->_interaction, "view");
}

- (void)didMoveToView:(id)a3
{
  -[UIContextMenuInteraction didMoveToView:](self->_interaction, "didMoveToView:", a3);
}

- (EKUIRightClickEmptySpaceInteraction)initWithDelegate:(id)a3
{
  id v4;
  EKUIRightClickEmptySpaceInteraction *v5;
  EKUIRightClickEmptySpaceInteraction *v6;
  uint64_t v7;
  UIContextMenuInteraction *interaction;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKUIRightClickEmptySpaceInteraction;
  v5 = -[EKUIRightClickEmptySpaceInteraction init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[EKUIRightClickEmptySpaceInteraction setDelegate:](v5, "setDelegate:", v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", v6);
    interaction = v6->_interaction;
    v6->_interaction = (UIContextMenuInteraction *)v7;

  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)localizedPasteStringForEventCount:(unint64_t)a3 includeHere:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    v9 = CFSTR("num_events_to_paste_here");
  else
    v9 = CFSTR("num_events_to_paste");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E601DFA8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  int v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3;
  -[EKUIRightClickEmptySpaceInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v5, "locationInView:", v6);
  v12 = objc_msgSend(WeakRetained, "interaction:shouldShowMenuAtPoint:inView:", self, v6);

  if (v12 && objc_msgSend(v5, "menuAppearance") != 1)
  {
    v14 = (void *)MEMORY[0x1E0DC36B8];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v16[3] = &unk_1E601B738;
    v16[4] = self;
    v18 = v8;
    v19 = v10;
    v17 = v6;
    objc_msgSend(v14, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  __int128 *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  id v41;
  __int128 v42;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v6 = (__int128 *)(a1 + 48);
  v7 = objc_msgSend(WeakRetained, "interaction:canCreateEventAtPoint:inView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

  if (v7)
  {
    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("New Event - context menu"), CFSTR("New Event"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, *(id *)(a1 + 32));
    v10 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v39[3] = &unk_1E601B710;
    objc_copyWeak(&v41, &location);
    v42 = *v6;
    v40 = *(id *)(a1 + 40);
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v9, v11, 0, v39);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v12);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

  }
  v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v14 = objc_msgSend(v13, "interaction:canCreateReminderAtPoint:inView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

  if (v14)
  {
    EventKitUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("New Reminder - context menu"), CFSTR("New Reminder"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, *(id *)(a1 + 32));
    v17 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checklist"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
    v35[3] = &unk_1E601B710;
    objc_copyWeak(&v37, &location);
    v38 = *v6;
    v36 = *(id *)(a1 + 40);
    objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", v16, v18, 0, v35);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v19);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

  }
  v20 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v21 = objc_msgSend(v20, "interaction:canPasteEventAtPoint:inView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

  if (v21)
  {
    v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v22, "interaction:titleForPasteActionAtPoint:inView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v24, "interaction:subtitleForPasteActionAtPoint:inView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, *(id *)(a1 + 32));
    v26 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.clipboard"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
    v31[3] = &unk_1E601B710;
    objc_copyWeak(&v33, &location);
    v34 = *v6;
    v32 = *(id *)(a1 + 40);
    objc_msgSend(v26, "actionWithTitle:image:identifier:handler:", v23, v27, 0, v31);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v25, "length"))
      objc_msgSend(v28, "setDiscoverabilityTitle:", v25);
    objc_msgSend(v4, "addObject:", v28);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

void __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "interaction:createEventAtPoint:inView:", v4, *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));

    WeakRetained = v4;
  }

}

void __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "interaction:createReminderAtPoint:inView:", v4, *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));

    WeakRetained = v4;
  }

}

void __93__EKUIRightClickEmptySpaceInteraction_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "interaction:pasteEventAtPoint:inView:", v4, *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));

    WeakRetained = v4;
  }

}

- (UIContextMenuInteraction)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_interaction, a3);
}

- (EKUIRightClickEmptySpaceInteractionDelegate)delegate
{
  return (EKUIRightClickEmptySpaceInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end
