@implementation TabDragDropInteractionController

- (TabDragDropInteractionController)initWithDataSource:(id)a3 dropHandler:(id)a4
{
  id v6;
  id v7;
  TabDragDropInteractionController *v8;
  TabDragDropInteractionController *v9;
  uint64_t v10;
  NSMapTable *sessionToPlaceholderItemMap;
  uint64_t v12;
  NSMapTable *insertedTabsForDragItems;
  uint64_t v14;
  NSMapTable *hasHiddenDocumentsForDragSessions;
  uint64_t v16;
  NSMutableSet *tabViewsPendingActivation;
  TabDragDropInteractionController *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TabDragDropInteractionController;
  v8 = -[TabDragDropInteractionController init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v9->_dropHandler, a4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    sessionToPlaceholderItemMap = v9->_sessionToPlaceholderItemMap;
    v9->_sessionToPlaceholderItemMap = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    insertedTabsForDragItems = v9->_insertedTabsForDragItems;
    v9->_insertedTabsForDragItems = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    hasHiddenDocumentsForDragSessions = v9->_hasHiddenDocumentsForDragSessions;
    v9->_hasHiddenDocumentsForDragSessions = (NSMapTable *)v14;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    tabViewsPendingActivation = v9->_tabViewsPendingActivation;
    v9->_tabViewsPendingActivation = (NSMutableSet *)v16;

    v18 = v9;
  }

  return v9;
}

+ (BOOL)canDelegateDragDropForTabCollectionView:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_opt_respondsToSelector();
  }
  else
  {
    v4 = 0;
  }

  return v4 & 1;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5;
  void *v6;
  char v7;
  BOOL v8;

  v5 = a4;
  tabViewFromInteraction(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "hidesInactiveTabs"))
    v7 = objc_msgSend(MEMORY[0x1E0D4EF70], "canCreateNavigationIntentForDropSession:", v5);
  else
    v7 = +[TabDocumentDropHandler canHandleSession:](TabDocumentDropHandler, "canHandleSession:", v5);
  v8 = v7;

  return v8;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  tabViewFromInteraction(v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "searchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isSearching"))
    {
      objc_msgSend(v8, "searchTerm");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (!v10)
        objc_msgSend(v8, "endSearching");
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "didBeginTrackingSession:", v6);

  -[TabDragDropInteractionController _autoscrollerForInteraction:](self, "_autoscrollerForInteraction:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "beginInteraction");
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  unint64_t v23;
  _BOOL4 v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void (**v29)(void *, void *, void *);
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v34;
  double v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  id v46;
  _BOOL4 v47;
  id v48;
  _QWORD aBlock[4];
  id v50;
  id v51;
  id v52;
  id v53;
  TabDragDropInteractionController *v54;
  id v55;
  double v56;
  double v57;
  BOOL v58;
  _QWORD v59[4];
  id v60;
  CGRect v61;
  CGRect v62;

  v6 = a3;
  v7 = a4;
  tabViewFromInteraction(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v8, "presentationState") != 2)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 0);
    goto LABEL_37;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v8, "hidesInactiveTabs"))
  {
    objc_msgSend(v8, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v14);
    v16 = v15;
    v18 = v17;

    -[TabDragDropInteractionController _autoscrollerForInteraction:](self, "_autoscrollerForInteraction:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateInteractionAtPoint:", v16, v18);

    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (-[TabDragDropInteractionController _tabViewIsFilteringTabs:](self, "_tabViewIsFilteringTabs:", v8))
    {
      objc_msgSend(v7, "localDragSession");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabDragDropInteractionController _unhideTabsForLocalDragSession:](self, "_unhideTabsForLocalDragSession:", v21);

      -[NSMapTable objectForKey:](self->_sessionToPlaceholderItemMap, "objectForKey:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(WeakRetained, "removePlaceholderItem:", v22);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 1);
      goto LABEL_35;
    }
    v23 = +[TabDocumentDropHandler proposedOperationForSession:intoWindowWithPrivateBrowsingEnabled:](TabDocumentDropHandler, "proposedOperationForSession:intoWindowWithPrivateBrowsingEnabled:", v7, objc_msgSend(WeakRetained, "privateBrowsingEnabled"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", v23);
    if (v23 == 1)
    {
LABEL_36:

      goto LABEL_37;
    }
    v24 = +[TabDocumentDropHandler canPinAllItemsInSession:](TabDocumentDropHandler, "canPinAllItemsInSession:", v7);
    -[NSMapTable objectForKey:](self->_sessionToPlaceholderItemMap, "objectForKey:", v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__TabDragDropInteractionController_dropInteraction_sessionDidUpdate___block_invoke_2;
    aBlock[3] = &unk_1E9CFA258;
    v26 = v8;
    v50 = v26;
    v56 = v16;
    v57 = v18;
    v47 = v24;
    v58 = v24;
    v48 = v25;
    v51 = v48;
    v46 = WeakRetained;
    v52 = v46;
    v27 = v7;
    v53 = v27;
    v54 = self;
    v28 = v6;
    v55 = v28;
    v29 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
    if (-[TabDragDropInteractionController _canOpenInCurrentTabForSession:tabView:](self, "_canOpenInCurrentTabForSession:tabView:", v27, v26))
    {
      objc_msgSend(v26, "targetItemForDropAtPoint:", v16, v18);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frameForItem:");
      x = v61.origin.x;
      y = v61.origin.y;
      width = v61.size.width;
      height = v61.size.height;
      CGRectGetMinX(v61);
      v62.origin.x = x;
      v62.origin.y = y;
      v62.size.width = width;
      v62.size.height = height;
      CGRectGetMaxX(v62);
      _SFClampPercent();
      v35 = v34;
      if (v34 > 0.15 && v34 < 0.85)
      {
        -[NSMapTable objectForKey:](self->_sessionToPlaceholderItemMap, "objectForKey:", v27);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          objc_msgSend(v46, "removePlaceholderItem:", v36);
          -[NSMapTable removeObjectForKey:](self->_sessionToPlaceholderItemMap, "removeObjectForKey:", v27);
        }
        v22 = v48;
        v37 = v45;
        goto LABEL_34;
      }
      -[TabDragDropInteractionController _insertPlaceholderIfNeededForSession:interaction:](self, "_insertPlaceholderIfNeededForSession:interaction:", v27, v28);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v45;
      v29[2](v29, v36, v45);
      if (((objc_msgSend(v45, "isPinned") ^ 1 | v47) & 1) != 0)
      {
        v22 = v48;
        if (v35 < 0.15)
        {
          v39 = v46;
          v40 = v36;
          v41 = v45;
          goto LABEL_29;
        }
        goto LABEL_34;
      }
      v42 = v46;
      v43 = v36;
    }
    else
    {
      -[TabDragDropInteractionController _insertPlaceholderIfNeededForSession:interaction:](self, "_insertPlaceholderIfNeededForSession:interaction:", v27, v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "targetItemForDropAtPoint:", v16, v18);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v29[2](v29, v37, v36);
      if (((objc_msgSend(v36, "isPinned") ^ 1 | v47) & 1) != 0)
      {
        if (-[TabDragDropInteractionController _shouldMovePlaceholderItem:overTargetItem:withDropLocation:interaction:](self, "_shouldMovePlaceholderItem:overTargetItem:withDropLocation:interaction:", v37, v36, v28, v16, v18))
        {
          v38 = -[TabDragDropInteractionController _placeholderMoveSatisfiesDelay](self, "_placeholderMoveSatisfiesDelay");
          v22 = v48;
          if (v38)
          {
            v39 = v46;
            v40 = v37;
            v41 = v36;
LABEL_29:
            objc_msgSend(v39, "movePlaceholder:overTabItem:", v40, v41);
          }
LABEL_34:

LABEL_35:
          goto LABEL_36;
        }
LABEL_33:
        v22 = v48;
        goto LABEL_34;
      }
      v42 = v46;
      v43 = v37;
    }
    objc_msgSend(v42, "movePlaceholderToEndOfPinnedTabs:", v43);
    goto LABEL_33;
  }
  objc_msgSend(v7, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __69__TabDragDropInteractionController_dropInteraction_sessionDidUpdate___block_invoke;
  v59[3] = &unk_1E9CFA230;
  v60 = v8;
  v10 = objc_msgSend(v9, "safari_containsObjectPassingTest:", v59);

  v11 = objc_alloc(MEMORY[0x1E0DC3788]);
  if (v10)
    v12 = 0;
  else
    v12 = 2;
  v13 = (void *)objc_msgSend(v11, "initWithDropOperation:", v12);

LABEL_37:
  return v13;
}

BOOL __69__TabDragDropInteractionController_dropInteraction_sessionDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "safari_localSourceTabView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __69__TabDragDropInteractionController_dropInteraction_sessionDidUpdate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(*(id *)(a1 + 32), "shouldPinItemsDroppedAtPoint:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  else
    v6 = 0;
  if (*(_BYTE *)(a1 + 96))
  {
    v7 = objc_msgSend(v5, "isPinned") | v6;
    if (objc_msgSend(v12, "isPinned") != (_DWORD)v7)
      goto LABEL_9;
LABEL_8:
    if (*(id *)(a1 + 40) == v12)
      goto LABEL_12;
    goto LABEL_9;
  }
  v7 = 0;
  if ((objc_msgSend(v12, "isPinned") & 1) == 0)
    goto LABEL_8;
LABEL_9:
  objc_msgSend(v12, "setPinned:", v7);
  objc_msgSend(*(id *)(a1 + 48), "movePlaceholderToEndOfPinnedTabs:", v12);
  objc_msgSend(*(id *)(a1 + 56), "localDragSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "safari_dragPreviewRequiresUpdateForTabView:pinned:", *(_QWORD *)(a1 + 32), v7);

  if ((v11 & 1) != 0 || (_DWORD)v7 != objc_msgSend(v12, "isPinned"))
    objc_msgSend(*(id *)(a1 + 64), "_updatePreviewsForInteraction:session:pinned:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), v7);
LABEL_12:

}

- (BOOL)_canOpenInCurrentTabForSession:(id)a3 tabView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 1 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v7, "canDragOntoActiveTab"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (+[TabDocumentDropHandler proposedOperationForSession:intoWindowWithPrivateBrowsingEnabled:](TabDocumentDropHandler, "proposedOperationForSession:intoWindowWithPrivateBrowsingEnabled:", v6, objc_msgSend(WeakRetained, "privateBrowsingEnabled")) == 2)
    {
      objc_msgSend(v7, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationInView:", v11);
      v13 = v12;
      v15 = v14;

      objc_msgSend(v7, "targetItemForDropAtPoint:", v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "tabWithUUID:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v18, "isActive");
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)_shouldMovePlaceholderItem:(id)a3 overTargetItem:(id)a4 withDropLocation:(CGPoint)a5 interaction:(id)a6
{
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double Width;
  double Height;
  char v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double MaxX;
  double v44;
  double v45;
  double MinX;
  double v48;
  double v49;
  double rect;
  CGFloat recta;
  double v52;
  double v53;
  CGFloat v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  y = a5.y;
  x = a5.x;
  v10 = a3;
  v11 = a4;
  tabViewFromInteraction(a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v12, "isStandalone"))
      {
        objc_msgSend(v10, "secondaryItem");
        v13 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v13;
      }
    }
  }
  v14 = 0;
  if (v11 && v10 != v11)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v12, "presentationState") != 2)
      goto LABEL_29;
    v52 = x;
    v53 = y;
    objc_msgSend(v12, "frameForItem:", v10);
    objc_msgSend(v12, "frameForItem:", v11);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    UIRectGetCenter();
    v24 = v23;
    v26 = v25;
    UIRectGetCenter();
    rect = v27;
    v29 = v28 - v26;
    v55.origin.x = v16;
    v55.origin.y = v18;
    v55.size.width = v20;
    v55.size.height = v22;
    Width = CGRectGetWidth(v55);
    v56.origin.x = v16;
    v56.origin.y = v18;
    v56.size.width = v20;
    v56.size.height = v22;
    Height = CGRectGetHeight(v56);
    v32 = (objc_opt_respondsToSelector() & 1) != 0 ? objc_msgSend(v12, "layoutAxes") : 3;
    if (v29 == 0.0 && (v32 & 2) != 0)
    {
      v48 = v24;
      v57.origin.x = v16;
      v57.origin.y = v18;
      v57.size.width = v20;
      v57.size.height = v22;
      if (v53 < CGRectGetMinY(v57))
        goto LABEL_28;
      v58.origin.x = v16;
      v58.origin.y = v18;
      v58.size.width = v20;
      v58.size.height = v22;
      if (v53 > CGRectGetMaxY(v58))
        goto LABEL_28;
    }
    v33 = Height / 3.0;
    if (v29 > 0.0)
    {
      v59.origin.x = v16;
      v59.origin.y = v18;
      v59.size.width = v20;
      v59.size.height = v22;
      if (v53 > CGRectGetMaxY(v59) - v33)
        goto LABEL_28;
    }
    if (v29 < 0.0)
    {
      v60.origin.x = v16;
      v60.origin.y = v18;
      v60.size.width = v20;
      v60.size.height = v22;
      if (v53 < v33 + CGRectGetMinY(v60))
        goto LABEL_28;
    }
    v34 = rect - v24;
    if (rect - v24 == 0.0 && (v32 & 1) != 0)
    {
      v61.origin.x = v16;
      v61.origin.y = v18;
      v61.size.width = v20;
      v61.size.height = v22;
      if (v52 < CGRectGetMinX(v61))
        goto LABEL_28;
      v62.origin.x = v16;
      v62.origin.y = v18;
      v62.size.width = v20;
      v62.size.height = v22;
      if (v53 > CGRectGetMaxX(v62))
        goto LABEL_28;
    }
    v35 = Width / 3.0;
    objc_msgSend(v12, "view", *(_QWORD *)&v48);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    v38 = v37;
    v40 = v39;
    v54 = v41;
    recta = v42;

    if (v34 > 0.0)
    {
      v63.origin.x = v16;
      v63.origin.y = v18;
      v63.size.width = v20;
      v63.size.height = v22;
      v49 = v35;
      MaxX = CGRectGetMaxX(v63);
      v64.origin.x = v38;
      v64.origin.y = v40;
      v64.size.width = v54;
      v64.size.height = recta;
      v44 = fmin(MaxX, CGRectGetMaxX(v64) + -100.0);
      v35 = v49;
      if (v52 > v44 - v49)
        goto LABEL_28;
    }
    if (v34 >= 0.0)
      goto LABEL_29;
    v65.origin.x = v16;
    v65.origin.y = v18;
    v65.size.width = v20;
    v65.size.height = v22;
    v45 = v35;
    MinX = CGRectGetMinX(v65);
    v66.origin.x = v38;
    v66.origin.y = v40;
    v66.size.width = v54;
    v66.size.height = recta;
    if (v52 < v45 + fmax(MinX, CGRectGetMinX(v66) + 100.0))
LABEL_28:
      v14 = 1;
    else
LABEL_29:
      v14 = 0;
  }

  return v14;
}

- (BOOL)_placeholderMoveSatisfiesDelay
{
  return 1;
}

- (BOOL)_tabViewIsFilteringTabs:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "searchController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isSearching"))
    {
      objc_msgSend(v4, "searchController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchTerm");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length") != 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  -[TabDragDropInteractionController _cleanUpDropPlaceholderForSession:interaction:](self, "_cleanUpDropPlaceholderForSession:interaction:", a4, a3);
}

- (void)_cleanUpDropPlaceholderForSession:(id)a3 interaction:(id)a4
{
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v10 = a3;
  -[TabDragDropInteractionController _autoscrollerForInteraction:](self, "_autoscrollerForInteraction:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endInteraction");

  -[NSMapTable objectForKey:](self->_sessionToPlaceholderItemMap, "objectForKey:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__TabDragDropInteractionController__cleanUpDropPlaceholderForSession_interaction___block_invoke;
    v11[3] = &unk_1E9CF2990;
    v11[4] = self;
    v12 = v7;
    v9 = v10;
    v13 = v9;
    objc_msgSend(WeakRetained, "performBatchUpdatesWithBlock:", v11);

    -[NSMapTable removeObjectForKey:](self->_sessionToPlaceholderItemMap, "removeObjectForKey:", v9);
  }

}

void __82__TabDragDropInteractionController__cleanUpDropPlaceholderForSession_interaction___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "removePlaceholderItem:", *(_QWORD *)(a1 + 40));

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "localDragSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_unhideTabsForLocalDragSession:", v4);

}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  TabDocumentDropHandler *dropHandler;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  tabViewFromInteraction(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "hidesInactiveTabs");
  else
    v8 = 0;
  if (-[TabDragDropInteractionController _canOpenInCurrentTabForSession:tabView:](self, "_canOpenInCurrentTabForSession:tabView:", v6, v7))
  {
    -[NSMapTable objectForKey:](self->_sessionToPlaceholderItemMap, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

  }
  else
  {
    v10 = 0;
  }
  if ((v8 | v10) == 1)
  {
    objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke;
    v16[3] = &unk_1E9CF2D70;
    v17 = v7;
    objc_msgSend(v11, "buildNavigationIntentForDropSession:completionHandler:", v6, v16);

    v12 = v17;
  }
  else
  {
    dropHandler = self->_dropHandler;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke_2;
    v14[3] = &unk_1E9CF58F8;
    v14[4] = self;
    v15 = v6;
    -[TabDocumentDropHandler dropItemsForSession:withInsertionHandler:](dropHandler, "dropItemsForSession:withInsertionHandler:", v15, v14);
    v12 = v15;
  }

}

uint64_t __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "performDropWithNavigationIntent:", a2);
  return result;
}

void __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__14;
  v22 = __Block_byref_object_dispose__14;
  v23 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke_54;
  v13[3] = &unk_1E9CFA280;
  v5 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v17 = &v18;
  v6 = WeakRetained;
  v15 = v6;
  v7 = v3;
  v16 = v7;
  objc_msgSend(v6, "performBatchUpdatesWithBlock:", v13);
  objc_msgSend((id)v19[5], "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "webExtensionsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "tabIDToTabPositionForTabsInTransit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D8ADC8], "tabIDToTabPositionDictionaryForTabs:", v19[5]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fireAppropriateTabMovementEventForTabState:", v12);

  }
  _Block_object_dispose(&v18, 8);

}

void __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke_54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "replacePlaceholderItem:withTabsForDropSession:dragItems:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(a1 + 56);
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke_2_55;
  v44[3] = &unk_1E9CF4560;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  v45 = v7;
  v46 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v44);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v29 = a1;
  obj = *(id *)(a1 + 56);
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(obj);
        v31 = v9;
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(*(id *)(*(_QWORD *)(v29 + 32) + 16), "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v37;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v37 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v15);
              objc_msgSend(v10, "_sf_localBookmark");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v17, "isFolder"))
                v18 = 3;
              else
                v18 = 2;

              v34 = 0u;
              v35 = 0u;
              v32 = 0u;
              v33 = 0u;
              objc_msgSend(v16, "tabCollectionItems");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(_QWORD *)v33;
                do
                {
                  v23 = 0;
                  do
                  {
                    if (*(_QWORD *)v33 != v22)
                      objc_enumerationMutation(v19);
                    objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v23++), "setDragState:", v18);
                  }
                  while (v21 != v23);
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
                }
                while (v21);
              }

              ++v15;
            }
            while (v15 != v13);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          }
          while (v13);
        }

        v9 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v30);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v29 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(v29 + 40));
  v24 = *(void **)(v29 + 32);
  objc_msgSend(*(id *)(v29 + 40), "localDragSession");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_unhideTabsForLocalDragSession:", v25);

}

void __64__TabDragDropInteractionController_dropInteraction_performDrop___block_invoke_2_55(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "arrayByAddingObject:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKey:", v9, v6);

}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "didEndTrackingSession:", v7);

  -[TabDragDropInteractionController _cleanUpDropPlaceholderForSession:interaction:](self, "_cleanUpDropPlaceholderForSession:interaction:", v7, v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v7, "items", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[NSMapTable removeObjectForKey:](self->_insertedTabsForDragItems, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat x;
  double v18;
  CGFloat y;
  double v20;
  CGFloat width;
  double v22;
  CGFloat height;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  CGAffineTransform v46;
  CGAffineTransform v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  tabViewFromInteraction(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v10, "hidesInactiveTabs") & 1) != 0
    || (-[NSMapTable objectForKey:](self->_insertedTabsForDragItems, "objectForKey:", v8),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count"),
        v11,
        !v12))
  {
    v41 = 0;
  }
  else
  {
    -[NSMapTable objectForKey:](self->_insertedTabsForDragItems, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "itemForTabCollectionView:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v13, "count") < 2)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (objc_msgSend(v10, "targetedDragPreviewForDroppingItem:", v15),
            (v41 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v10, "supportsDropTransitionToItemView"))
        {
          -[TabDragDropInteractionController _viewForTransitionToItem:withTabCollectionView:](self, "_viewForTransitionToItem:withTabCollectionView:", v15, v10);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            v43 = objc_alloc_init(MEMORY[0x1E0DC3768]);
            objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setBackgroundColor:", v44);

            v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:", v42, v43);
          }
          else
          {
            v41 = 0;
          }

        }
        else
        {
          v41 = 0;
        }
      }
    }
    else
    {
      objc_msgSend(v10, "frameForItem:", v15);
      x = v16;
      y = v18;
      width = v20;
      height = v22;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v13, "count") - 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v49 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "itemForTabCollectionView:", v10);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "frameForItem:", v29);
            v56.origin.x = v30;
            v56.origin.y = v31;
            v56.size.width = v32;
            v56.size.height = v33;
            v54.origin.x = x;
            v54.origin.y = y;
            v54.size.width = width;
            v54.size.height = height;
            v55 = CGRectUnion(v54, v56);
            x = v55.origin.x;
            y = v55.origin.y;
            width = v55.size.width;
            height = v55.size.height;

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        }
        while (v26);
      }

      UIRectGetCenter();
      v35 = v34;
      v37 = v36;
      memset(&v47, 0, sizeof(v47));
      CGAffineTransformMakeScale(&v47, 0.0, 0.0);
      v38 = objc_alloc(MEMORY[0x1E0DC3770]);
      objc_msgSend(v10, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v47;
      v40 = (void *)objc_msgSend(v38, "initWithContainer:center:transform:", v39, &v46, v35, v37);
      objc_msgSend(v9, "retargetedPreviewWithTarget:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v41;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  TabDragDropInteractionController *v29;
  id obj;
  id v31;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v31 = a5;
  tabViewFromInteraction(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self;
  v25 = v8;
  -[NSMapTable objectForKey:](self->_insertedTabsForDragItems, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  v13 = MEMORY[0x1E0C809B0];
  v14 = &unk_1E9CF4900;
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v39;
    v26 = v11;
    v27 = *(_QWORD *)v39;
    do
    {
      v17 = 0;
      v28 = v15;
      do
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v17);
        objc_msgSend(v18, "itemForTabCollectionView:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v13;
        v37[1] = 3221225472;
        v37[2] = __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
        v37[3] = v14;
        v37[4] = v18;
        objc_msgSend(v31, "addCompletion:", v37);
        if (v11 <= 1)
        {
          -[TabDragDropInteractionController _viewForTransitionToItem:withTabCollectionView:](v29, "_viewForTransitionToItem:withTabCollectionView:", v19, v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            v22 = v14;
            v23 = (void *)MEMORY[0x1E0DC3F10];
            v35[0] = v13;
            v35[1] = 3221225472;
            v35[2] = __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_2;
            v35[3] = &unk_1E9CF1900;
            v24 = v20;
            v36 = v24;
            objc_msgSend(v23, "performWithoutAnimation:", v35);
            v33[0] = v13;
            v33[1] = 3221225472;
            v33[2] = __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_3;
            v33[3] = &unk_1E9CF1900;
            v34 = v24;
            objc_msgSend(v31, "addAnimations:", v33);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v9, "willAnimateDropForItem:withAnimator:", v19, v31);

            v14 = v22;
            v15 = v28;
            v11 = v26;
            v16 = v27;
          }

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v15);
  }

  ++v29->_dropAnimationCount;
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_4;
  v32[3] = v14;
  v32[4] = v29;
  objc_msgSend(v31, "addCompletion:", v32);

}

void __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "tabCollectionItems", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setDragState:", 0);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __85__TabDragDropInteractionController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_4(uint64_t result)
{
  --*(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return 3;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIDragSession *pendingDragSession;
  id v17;

  v6 = a4;
  v7 = a3;
  tabViewFromInteraction(v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didStartDragWithDragContentType:", objc_msgSend(v17, "itemDragContentType"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "willBeginDragSession:", v6);

  objc_msgSend(v6, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TabDocumentDropHandler tabsForDragItems:](TabDocumentDropHandler, "tabsForDragItems:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8ADC8], "tabIDToTabPositionDictionaryForTabs:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v11, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "webExtensionsController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTabIDToTabPositionForTabsInTransit:", v13);

  pendingDragSession = self->_pendingDragSession;
  self->_pendingDragSession = 0;

  -[TabDragDropInteractionController _transitionToDragState:fromDragState:forTabCollectionItemsInSession:interaction:](self, "_transitionToDragState:fromDragState:forTabCollectionItemsInSession:interaction:", 1, -1, v6, v7);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (self->_pendingDragSession || self->_dropAnimationCount)
  {
    v8 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    tabViewFromInteraction(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet containsObject:](self->_tabViewsPendingActivation, "containsObject:", v10) & 1) != 0
      || (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v10, "lastDecelerationWasInterrupted") & 1) != 0)
    {
      v8 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_storeStrong((id *)&self->_pendingDragSession, a4);
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "locationInView:", v11);
      v8 = -[TabDragDropInteractionController _newDragItemsAtPoint:excludingTabUUIDs:interaction:session:](self, "_newDragItemsAtPoint:excludingTabUUIDs:interaction:session:", 0, v6, v7);

    }
  }

  return v8;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  y = a5.y;
  x = a5.x;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v9, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v9, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v19, "safari_localWBTab");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v19, "safari_localWBTab");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v22);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v16);
  }

  objc_msgSend(v10, "convertPoint:toView:", v10, x, y);
  v23 = -[TabDragDropInteractionController _newDragItemsAtPoint:excludingTabUUIDs:interaction:session:](self, "_newDragItemsAtPoint:excludingTabUUIDs:interaction:session:", v13, v8, v9);

  return v23;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "safari_localWBTab");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_localTabItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v8 && v9)
  {
    tabViewFromInteraction(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v11, "targetedDragPreviewForLiftingItem:", v9),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "viewForItem:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:", v12);

      }
      else
      {
        v10 = 0;
      }
    }

  }
  return v10;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  TabDragDropDataSource **p_dataSource;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  p_dataSource = &self->_dataSource;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(WeakRetained, "willEndDragSession:", v8);

  objc_msgSend(v8, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[TabDocumentDropHandler tabsForDragItems:](TabDocumentDropHandler, "tabsForDragItems:", v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "webExtensionsController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTabIDToTabPositionForTabsInTransit:", 0);

  -[TabDragDropInteractionController _transitionToDragState:fromDragState:forTabCollectionItemsInSession:interaction:](self, "_transitionToDragState:fromDragState:forTabCollectionItemsInSession:interaction:", 0, 1, v8, v9);
  -[NSMapTable removeObjectForKey:](self->_hasHiddenDocumentsForDragSessions, "removeObjectForKey:", v8);
  -[TabDragDropInteractionController _cleanUpDragPreviewForSesssion:](self, "_cleanUpDragPreviewForSesssion:", v8);

}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  id v19;

  v19 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[TabDocumentDropHandler tabsForDragItems:](TabDocumentDropHandler, "tabsForDragItems:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8ADC8], "tabIDToTabPositionDictionaryForTabs:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "webExtensionsController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tabIDToTabPositionForTabsInTransit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addEntriesFromDictionary:", v13);

  -[TabDragDropInteractionController _transitionToDragState:fromDragState:forTabCollectionItemsInSession:interaction:](self, "_transitionToDragState:fromDragState:forTabCollectionItemsInSession:interaction:", 1, -1, v9, v10);
  -[NSMapTable objectForKey:](self->_hasHiddenDocumentsForDragSessions, "objectForKey:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v17, "BOOLValue");
  if ((_DWORD)v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "hideTabsForDragItems:", v19);

  }
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  UIDragSession *pendingDragSession;

  -[TabDragDropInteractionController _cleanUpDragPreviewForSesssion:](self, "_cleanUpDragPreviewForSesssion:", self->_pendingDragSession);
  pendingDragSession = self->_pendingDragSession;
  self->_pendingDragSession = 0;

}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (void)_cleanUpDragPreviewForSesssion:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "items", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "safari_localSourceTabView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "safari_localTabItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "cleanUpDragPreviewForItem:", v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return 3;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  return 3;
}

- (id)_newDragItemsAtPoint:(CGPoint)a3 excludingTabUUIDs:(id)a4 interaction:(id)a5 session:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v27;
  _QWORD v28[2];

  y = a3.y;
  x = a3.x;
  v28[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[TabDragDropInteractionController _tabCollectionItemAtPoint:interaction:](self, "_tabCollectionItemAtPoint:interaction:", v12, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && !objc_msgSend(v14, "dragState"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v15, "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "tabWithUUID:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "wbTab");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_13;
    objc_msgSend(v20, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v11, "containsObject:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_13;
    objc_msgSend(v13, "items");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = +[TabDocumentDropHandler canAddTab:toSessionWithDragItems:](TabDocumentDropHandler, "canAddTab:toSessionWithDragItems:", v20, v23);

    if (v24)
    {
      tabViewFromInteraction(v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v25, "presentationState") != 2
        || objc_msgSend(v20, "isBlank")
        && (objc_opt_respondsToSelector() & 1) != 0
        && (objc_msgSend(v25, "hidesInactiveTabs") & 1) != 0)
      {
        v16 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        objc_msgSend(WeakRetained, "dragItemForTab:tabItem:", v20, v15);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
LABEL_13:
      v16 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (id)_tabCollectionItemAtPoint:(CGPoint)a3 interaction:(id)a4
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  tabViewFromInteraction(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_unhideTabsForLocalDragSession:(id)a3
{
  TabDragDropDataSource **p_dataSource;
  id WeakRetained;
  void *v6;
  id v7;

  if (a3)
  {
    p_dataSource = &self->_dataSource;
    v7 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v7, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "unhideTabsForDragItems:", v6);

    -[NSMapTable setObject:forKey:](self->_hasHiddenDocumentsForDragSessions, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v7);
  }
}

- (id)_viewForTransitionToItem:(id)a3 withTabCollectionView:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "supportsDropTransitionToItemView"))
  {
    objc_msgSend(v6, "viewForItem:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_insertPlaceholderIfNeededForSession:(id)a3 interaction:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  TabDragDropInteractionController *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__14;
  v22 = __Block_byref_object_dispose__14;
  -[NSMapTable objectForKey:](self->_sessionToPlaceholderItemMap, "objectForKey:", v6);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v19[5] && objc_msgSend(WeakRetained, "isPlaceholderItemValid:"))
  {
    v9 = (id)v19[5];
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__TabDragDropInteractionController__insertPlaceholderIfNeededForSession_interaction___block_invoke;
    v12[3] = &unk_1E9CFA2A8;
    v17 = &v18;
    v13 = WeakRetained;
    v14 = v7;
    v10 = v6;
    v15 = v10;
    v16 = self;
    objc_msgSend(v13, "performBatchUpdatesWithBlock:", v12);
    -[NSMapTable setObject:forKey:](self->_sessionToPlaceholderItemMap, "setObject:forKey:", v19[5], v10);
    v9 = (id)v19[5];

  }
  _Block_object_dispose(&v18, 8);

  return v9;
}

void __85__TabDragDropInteractionController__insertPlaceholderIfNeededForSession_interaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 32), "removePlaceholderItem:");
  tabViewFromInteraction(*(void **)(a1 + 40));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 48);
  objc_msgSend(v12, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationInView:", v3);
  objc_msgSend(v12, "targetItemForDropAtPoint:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "localDragSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hideTabsForDragItems:", v8);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "setObject:forKey:", MEMORY[0x1E0C9AAB0], v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "insertPlaceholderAfterTabItem:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (void)_transitionToDragState:(int64_t)a3 fromDragState:(int64_t)a4 forTabCollectionItemsInSession:(id)a5 interaction:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  id v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v24 = a6;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(a5, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v13, "safari_localTabItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v13, "safari_localTabItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          -[NSMapTable objectForKey:](self->_insertedTabsForDragItems, "objectForKey:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v28 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              if (a4 == -1 || objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "dragState") == a4)
                objc_msgSend(v22, "setDragState:", a3);
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v19);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v10);
  }

  objc_msgSend(v24, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNeedsLayout");

}

- (id)_autoscrollerForInteraction:(id)a3
{
  void *v3;
  void *v4;

  tabViewFromInteraction(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "reorderingAutoscroller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updatePreviewsForInteraction:(id)a3 session:(id)a4 pinned:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  tabViewFromInteraction(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v7;
    objc_msgSend(v7, "localDragSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v15, "safari_localTabItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "safari_localSourceTabView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v18 = objc_opt_class();
            if (v18 == objc_opt_class())
            {
              objc_msgSend(v8, "dragPreviewForItem:pinned:", v16, v5);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v19;
              if (v19)
              {
                v22[0] = MEMORY[0x1E0C809B0];
                v22[1] = 3221225472;
                v22[2] = __81__TabDragDropInteractionController__updatePreviewsForInteraction_session_pinned___block_invoke;
                v22[3] = &unk_1E9CF2D48;
                v23 = v19;
                objc_msgSend(v15, "setPreviewProvider:", v22);

              }
            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

    v7 = v21;
  }

}

id __81__TabDragDropInteractionController__updatePreviewsForInteraction_session_pinned___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  TabContextMenuIdentifier *v19;
  void *v20;
  TabContextMenuIdentifier *v21;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  tabViewFromInteraction(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_tabViewsPendingActivation, "containsObject:", v8) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    -[TabDragDropInteractionController _tabCollectionItemAtPoint:interaction:](self, "_tabCollectionItemAtPoint:interaction:", v7, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10
      || objc_msgSend(v10, "dragState")
      || (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "lastDecelerationWasInterrupted") & 1) != 0
      || (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v8, "presentationState") != 2)
    {
      v9 = 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(v11, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "tabWithUUID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v16 = objc_msgSend(v8, "contextMenuOptionsForItem:", v11);
        else
          v16 = 4470;
        objc_msgSend(WeakRetained, "tabMenuProviderDataSource");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[TabMenuProvider actionProviderForTab:dataSource:options:](TabMenuProvider, "actionProviderForTab:dataSource:options:", v15, v17, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "willBeginShowingContextMenuForItem:", v11);
          v19 = [TabContextMenuIdentifier alloc];
          objc_msgSend(v11, "UUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[TabContextMenuIdentifier initWithTabUUID:sourceItem:](v19, "initWithTabUUID:sourceItem:", v20, v11);

          objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", v21, 0, v18);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
  }

  return v9;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a5;
  tabViewFromInteraction(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v7, "targetedDragPreviewForLiftingItem:", v8),
          (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v7, "viewForItem:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v10);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  tabViewFromInteraction(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v10, "sourceItem"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "targetedPreviewForDismissingMenuForItem:", v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    -[TabDragDropInteractionController contextMenuInteraction:configuration:highlightPreviewForItemWithIdentifier:](self, "contextMenuInteraction:configuration:highlightPreviewForItemWithIdentifier:", v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a5;
  v9 = a4;
  tabViewFromInteraction(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NSMutableSet addObject:](self->_tabViewsPendingActivation, "addObject:", v10);
    objc_msgSend(v8, "setPreferredCommitStyle:", 0);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __117__TabDragDropInteractionController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v13[3] = &unk_1E9CF2990;
    v13[4] = self;
    v14 = v10;
    v15 = v12;
    objc_msgSend(v8, "addCompletion:", v13);

  }
}

uint64_t __117__TabDragDropInteractionController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "activateItem:", *(_QWORD *)(a1 + 48));
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  tabViewFromInteraction(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sourceItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __92__TabDragDropInteractionController_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
      v12[3] = &unk_1E9CF1830;
      v13 = v9;
      v14 = v11;
      objc_msgSend(v8, "addCompletion:", v12);

    }
  }

}

uint64_t __92__TabDragDropInteractionController_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndShowingContextMenuForItem:", *(_QWORD *)(a1 + 40));
}

- (TabDragDropDataSource)dataSource
{
  return (TabDragDropDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (TabDocumentDropHandler)dropHandler
{
  return self->_dropHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropHandler, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_tabViewsPendingActivation, 0);
  objc_storeStrong((id *)&self->_pendingDragSession, 0);
  objc_storeStrong((id *)&self->_hasHiddenDocumentsForDragSessions, 0);
  objc_storeStrong((id *)&self->_insertedTabsForDragItems, 0);
  objc_storeStrong((id *)&self->_sessionToPlaceholderItemMap, 0);
}

@end
