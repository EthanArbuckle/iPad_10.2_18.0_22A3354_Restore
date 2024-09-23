@implementation CNComposeDragSource

- (CNComposeDragSource)initWithView:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  CNComposeDragSource *v8;
  CNComposeDragSource *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNComposeDragSource;
  v8 = -[CNComposeDragSource init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_sourceView, v6);
    -[CNComposeDragSource setDelegate:](v9, "setDelegate:", v7);
    v9->_delegateFlags.respondsToTeamDataForItem = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToLocalObjectForItem = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToTargetedPreviewForItem = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToPreviewForItem = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToSuggestedNameForItem = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToDragWillEnd = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToAllowsMoveOperation = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToIsRestrictedToMail = objc_opt_respondsToSelector() & 1;
    v9->_delegateFlags.respondsToDataOwner = objc_opt_respondsToSelector() & 1;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA550]), "initWithDelegate:", v9);
    -[CNComposeDragSource setDragInteraction:](v9, "setDragInteraction:", v10);

    -[CNComposeDragSource sourceView](v9, "sourceView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeDragSource dragInteraction](v9, "dragInteraction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addInteraction:", v12);

    -[CNComposeDragSource setAllowsDragOverridingMasterSwitch:](v9, "setAllowsDragOverridingMasterSwitch:", 0);
  }

  return v9;
}

- (void)setAllowsDragOverridingMasterSwitch:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (self->_allowsDragOverridingMasterSwitch != a3)
  {
    self->_allowsDragOverridingMasterSwitch = a3;
    v4 = objc_msgSend(MEMORY[0x1E0CEA550], "isEnabledByDefault") | a3;
    -[CNComposeDragSource dragInteraction](self, "dragInteraction");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v4);

  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;

  v6 = a4;
  objc_msgSend(a3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  -[CNComposeDragSource delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dragSource:draggableItemsAtPoint:", self, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__CNComposeDragSource_dragInteraction_itemsForBeginningSession___block_invoke;
  v17[3] = &unk_1E62BEEA0;
  v17[4] = self;
  v18 = v12;
  v14 = v12;
  objc_msgSend(v13, "_cn_map:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __64__CNComposeDragSource_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BYTE *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v4);
  v6 = *(_BYTE **)(a1 + 32);
  if (v6[12])
  {
    objc_msgSend(*(id *)(a1 + 40), "dragSource:localObjectForDraggableItem:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalObject:", v7);

    v6 = *(_BYTE **)(a1 + 32);
  }
  if (v6[8])
  {
    objc_msgSend(*(id *)(a1 + 40), "dragSource:teamDataForDraggableItem:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTeamData:", v8);

    v6 = *(_BYTE **)(a1 + 32);
  }
  if (v6[11])
  {
    objc_msgSend(*(id *)(a1 + 40), "dragSource:suggestedNameForDraggableItem:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSuggestedName:", v10);

  }
  return v5;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  _OWORD v28[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_delegateFlags.respondsToTargetedPreviewForItem)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "localObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "dragSource:targetedPreviewForDraggableItem:", self, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (self->_delegateFlags.respondsToPreviewForItem)
  {
    -[CNComposeDragSource delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dragSource:previewForDraggableItem:", self, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA90]), "initWithView:", v16);
    }
    else
    {
      v18 = objc_alloc(MEMORY[0x1E0CEA570]);
      objc_msgSend(v8, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "center");
      v21 = v20;
      v23 = v22;
      if (v16)
        objc_msgSend(v16, "transform");
      else
        memset(v28, 0, sizeof(v28));
      v24 = (void *)objc_msgSend(v18, "initWithContainer:center:transform:", v19, v28, v21, v23);

      v25 = objc_alloc_init(MEMORY[0x1E0CEA568]);
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBackgroundColor:", v26);

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA90]), "initWithView:parameters:target:", v16, v25, v24);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  CNComposeDragSourceDelegate **p_delegate;
  id v8;
  void *v9;
  id WeakRetained;

  if (self->_delegateFlags.respondsToDragWillEnd)
  {
    p_delegate = &self->_delegate;
    v8 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "dragSource:willEndInteractionWithItems:dropOperation:", self, v9, a5);
  }
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  CNComposeDragSource *v4;
  id v5;
  void *v6;

  if (!self->_delegateFlags.respondsToAllowsMoveOperation)
    return 1;
  v4 = self;
  v5 = a4;
  -[CNComposeDragSource delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "dragSource:sessionAllowsMoveOperation:", v4, v5);

  return (char)v4;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  CNComposeDragSource *v4;
  id v5;
  void *v6;

  if (!self->_delegateFlags.respondsToIsRestrictedToMail)
    return 0;
  v4 = self;
  v5 = a4;
  -[CNComposeDragSource delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "dragSource:sessionIsRestrictedToMail:", v4, v5);

  return (char)v4;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  CNComposeDragSourceDelegate **p_delegate;
  id v6;
  id WeakRetained;
  int64_t v8;

  if (!self->_delegateFlags.respondsToDataOwner)
    return 3;
  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_msgSend(WeakRetained, "dragSource:dataOwnerForSession:", self, v6);

  return v8;
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (BOOL)allowsDragOverridingMasterSwitch
{
  return self->_allowsDragOverridingMasterSwitch;
}

- (CNComposeDragSourceDelegate)delegate
{
  return (CNComposeDragSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dragInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sourceView);
}

@end
