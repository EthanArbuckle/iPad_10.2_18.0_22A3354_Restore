@implementation CKMediaObjectAssetActionManager

- (CKMediaObjectAssetActionManager)initWithChatItem:(id)a3 presentedFromInlineReply:(BOOL)a4 chatActionHelper:(id)a5 selectionManager:(id)a6
{
  id v11;
  id v12;
  CKMediaObjectAssetActionManager *v13;
  CKMediaObjectAssetActionManager *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *performerClassByType;
  objc_super v18;

  v11 = a3;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CKMediaObjectAssetActionManager;
  v13 = -[PXAssetActionManager initWithSelectionManager:](&v18, sel_initWithSelectionManager_, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_chatItem, a3);
    objc_storeWeak((id *)&v14->_chatActionHelper, v12);
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    performerClassByType = v14->_performerClassByType;
    v14->_performerClassByType = v15;

    if (!a4)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14->_performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D7C0C0]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14->_performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D7BF98]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14->_performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D7BFC8]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14->_performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D7C140]);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14->_performerClassByType, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x1E0D7BFB0]);
  }

  return v14;
}

- (UIMenu)actionContextMenu
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKMediaObjectAssetActionManager previewActionForActionType:](self, "previewActionForActionType:", *MEMORY[0x1E0D7C0C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[CKMediaObjectAssetActionManager previewActionForActionType:](self, "previewActionForActionType:", *MEMORY[0x1E0D7BFB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[CKMediaObjectAssetActionManager previewActionForActionType:](self, "previewActionForActionType:", *MEMORY[0x1E0D7BFC8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIMenu *)v7;
}

- (BOOL)shouldHideInteractions
{
  CKMediaObjectAssetActionManager *v2;
  void *v3;

  v2 = self;
  -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "shouldHideInteractionsForActionManager:", v2);

  return (char)v2;
}

- (BOOL)supportsActionType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[CKMediaObjectAssetActionManager performerClassByType](self, "performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  return v6 != 0;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4
    && -[PXActionManager isActionTypeAllowed:](self, "isActionTypeAllowed:", v4)
    && (-[CKMediaObjectAssetActionManager performerClassByType](self, "performerClassByType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v5,
        v6))
  {
    v7 = objc_msgSend(v6, "canPerformWithActionManager:", self);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (-[CKMediaObjectAssetActionManager canPerformActionType:](self, "canPerformActionType:", v4)
    && (-[CKMediaObjectAssetActionManager performerClassByType](self, "performerClassByType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = (objc_class *)objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v5,
        v6))
  {
    v7 = (void *)objc_msgSend([v6 alloc], "initWithActionType:", v4);
    -[CKMediaObjectAssetActionManager _selectionSnapshotForPerformerClass:](self, "_selectionSnapshotForPerformerClass:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectionSnapshot:", v8);

    -[PXAssetActionManager selectionManager](self, "selectionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectionManager:", v9);

    -[CKMediaObjectAssetActionManager chatItem](self, "chatItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setChatItem:", v10);

    -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setChatActionHelper:", v11);

    -[PXActionManager performerDelegate](self, "performerDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v12);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)barButtonItemForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const char *v7;

  v4 = a3;
  -[CKMediaObjectAssetActionManager performerClassByType](self, "performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  v7 = -[CKMediaObjectAssetActionManager _barButtonSelectorByActionType:](self, "_barButtonSelectorByActionType:", v4);
  return (id)objc_msgSend(v6, "createBarButtonItemWithTarget:action:actionManager:", self, v7, self);
}

- (id)previewActionForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (-[CKMediaObjectAssetActionManager canPerformActionType:](self, "canPerformActionType:", v4)
    && (-[CKMediaObjectAssetActionManager performerClassByType](self, "performerClassByType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v5,
        v6))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__CKMediaObjectAssetActionManager_previewActionForActionType___block_invoke;
    v9[3] = &unk_1E274F768;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v6, "createPreviewActionWithActionManager:handler:", self, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __62__CKMediaObjectAssetActionManager_previewActionForActionType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePreviewAction:actionType:", a2, *(_QWORD *)(a1 + 40));
}

- (id)contextMenu
{
  void *v3;
  id v4;
  void *v5;
  id v7;

  v7 = 0;
  -[CKMediaObjectAssetActionManager _currentlySelectedChatItemsOutCursorItem:](self, "_currentlySelectedChatItemsOutCursorItem:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (objc_msgSend(v3, "count"))
  {
    -[CKMediaObjectAssetActionManager contextMenuForChatItems:cursorChatItem:isCMM:](self, "contextMenuForChatItems:cursorChatItem:isCMM:", v3, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)supportsContextMenu
{
  return 1;
}

- (id)actionKeyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0, sel__keyCommandQuickLook_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB720], 0, sel__keyCommandDelete_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("r"), 0x100000, sel__keyCommandReply_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("t"), 0x100000, sel__keyCommandTapback_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("a"), 0x100000, sel__keyCommandSelectAll_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("c"), 0x100000, sel__keyCommandCopy_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v10;

  -[PXAssetActionManager selectionManager](self, "selectionManager", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (sel__keyCommandQuickLook_ == a3 || sel__keyCommandDelete_ == a3 || sel__keyCommandCopy_ == a3)
  {
    LOBYTE(v8) = objc_msgSend(v7, "isAnyItemSelected");
  }
  else if (sel__keyCommandReply_ == a3 || sel__keyCommandTapback_ == a3)
  {
    objc_msgSend(v7, "selectedIndexPaths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 1)
      v8 = !-[CKMediaObjectAssetActionManager shouldHideInteractions](self, "shouldHideInteractions");
    else
      LOBYTE(v8) = 0;

  }
  else
  {
    LOBYTE(v8) = sel__keyCommandSelectAll_ == a3;
  }

  return v8;
}

- (void)_keyCommandQuickLook:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;

  v7 = 0;
  v4 = -[CKMediaObjectAssetActionManager _currentlySelectedChatItemsOutCursorItem:](self, "_currentlySelectedChatItemsOutCursorItem:", &v7);
  v5 = v7;
  if (v5)
  {
    -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject actionManager:quickLookChatItem:](v6, "actionManager:quickLookChatItem:", self, v5);
  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectAssetActionManager _keyCommandQuickLook:].cold.1();
  }

}

- (void)_keyCommandReply:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;

  v7 = 0;
  v4 = -[CKMediaObjectAssetActionManager _currentlySelectedChatItemsOutCursorItem:](self, "_currentlySelectedChatItemsOutCursorItem:", &v7);
  v5 = v7;
  if (v5)
  {
    -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject actionManager:presentInlineReplyControllerForChatItem:](v6, "actionManager:presentInlineReplyControllerForChatItem:", self, v5);
  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectAssetActionManager _keyCommandReply:].cold.1();
  }

}

- (void)_keyCommandTapback:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;

  v7 = 0;
  v4 = -[CKMediaObjectAssetActionManager _currentlySelectedChatItemsOutCursorItem:](self, "_currentlySelectedChatItemsOutCursorItem:", &v7);
  v5 = v7;
  if (v5)
  {
    -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject actionManager:tapbackChatItem:](v6, "actionManager:tapbackChatItem:", self, v5);
  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectAssetActionManager _keyCommandTapback:].cold.1();
  }

}

- (void)_keyCommandSelectAll:(id)a3
{
  id v4;

  -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectAllForActionManager:", self);

}

- (void)_keyCommandCopy:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;

  -[CKMediaObjectAssetActionManager _currentlySelectedChatItemsOutCursorItem:](self, "_currentlySelectedChatItemsOutCursorItem:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionManager:copyChatItems:", self, v4);

  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectAssetActionManager _keyCommandCopy:].cold.1();

  }
}

- (id)contextMenuForChatItems:(id)a3 cursorChatItem:(id)a4 isCMM:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CKMediaObjectAssetMenuBuilder *menuBuilder;
  CKMediaObjectAssetMenuBuilder *v11;
  CKMediaObjectAssetMenuBuilder *v12;
  void *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  menuBuilder = self->_menuBuilder;
  if (!menuBuilder)
  {
    v11 = objc_alloc_init(CKMediaObjectAssetMenuBuilder);
    v12 = self->_menuBuilder;
    self->_menuBuilder = v11;

    -[CKMediaObjectAssetMenuBuilder setDelegate:](self->_menuBuilder, "setDelegate:", self);
    menuBuilder = self->_menuBuilder;
  }
  -[CKMediaObjectAssetMenuBuilder contextMenuForChatItems:cursorChatItem:isCMM:](menuBuilder, "contextMenuForChatItems:cursorChatItem:isCMM:", v8, v9, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)menuBuilder:(id)a3 quickLookChatItem:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a4;
  if (v5)
  {
    -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionManager:quickLookChatItem:", self, v5);

  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectAssetActionManager menuBuilder:quickLookChatItem:].cold.1();

  }
}

- (void)menuBuilder:(id)a3 tapbackChatItem:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a4;
  if (v5)
  {
    -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionManager:tapbackChatItem:", self, v5);

  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectAssetActionManager menuBuilder:tapbackChatItem:].cold.1();

  }
}

- (id)menuBuilder:(id)a3 tapbackElementsForChatItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v5 = a4;
  if (v5)
  {
    -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionManager:tapbackElementsForChatItem:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectAssetActionManager menuBuilder:tapbackElementsForChatItem:].cold.1();

    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (void)menuBuilder:(id)a3 replyChatItem:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a4;
  if (v5)
  {
    -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionManager:presentInlineReplyControllerForChatItem:", self, v5);

  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectAssetActionManager menuBuilder:replyChatItem:].cold.1();

  }
}

- (void)menuBuilder:(id)a3 copyChatItems:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionManager:copyChatItems:", self, v5);

  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectAssetActionManager menuBuilder:copyChatItems:].cold.1();

  }
}

- (void)menuBuilder:(id)a3 forwardChatItems:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;

  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    -[CKMediaObjectAssetActionManager chatActionHelper](self, "chatActionHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionManager:forwardChatItems:", self, v5);

  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectAssetActionManager menuBuilder:forwardChatItems:].cold.1();

  }
}

- (SEL)_barButtonSelectorByActionType:(id)a3
{
  id v3;
  const char *v4;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D7BF98]))
  {
    v4 = sel__handleAddToLibraryBarButtonItem_;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D7C0C0]))
  {
    v4 = sel__handleReplyBarButtonItem_;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D7C140]))
  {
    v4 = sel__handleDeleteBarButtonItem_;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_handleAddToLibraryBarButtonItem:(id)a3
{
  -[CKMediaObjectAssetActionManager executeActionForActionType:withCompletionHandler:](self, "executeActionForActionType:withCompletionHandler:", *MEMORY[0x1E0D7BF98], 0);
}

- (void)_handleReplyBarButtonItem:(id)a3
{
  -[CKMediaObjectAssetActionManager executeActionForActionType:withCompletionHandler:](self, "executeActionForActionType:withCompletionHandler:", *MEMORY[0x1E0D7C0C0], 0);
}

- (void)_handleDeleteBarButtonItem:(id)a3
{
  -[CKMediaObjectAssetActionManager executeActionForActionType:withCompletionHandler:](self, "executeActionForActionType:withCompletionHandler:", *MEMORY[0x1E0D7C140], 0);
}

- (void)executeActionForActionType:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  -[CKMediaObjectAssetActionManager actionPerformerForActionType:](self, "actionPerformerForActionType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__CKMediaObjectAssetActionManager_executeActionForActionType_withCompletionHandler___block_invoke;
  v9[3] = &unk_1E2756098;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performActionWithCompletionHandler:", v9);

}

uint64_t __84__CKMediaObjectAssetActionManager_executeActionForActionType_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_selectionSnapshotForPerformerClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;

  -[PXAssetActionManager selectionManager](self, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isAnyItemSelected") & 1) != 0
    || (-[PXAssetActionManager objectReference](self, "objectReference"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    if (-[objc_class canPerformOnImplicitSelection](a3, "canPerformOnImplicitSelection")
      && (objc_msgSend(v6, "isAnyItemSelected") & 1) == 0)
    {
      objc_msgSend(v6, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc(MEMORY[0x1E0D7B928]);
      objc_msgSend(v13, "allItemIndexPaths");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithDataSource:selectedIndexPaths:", v13, v15);

      return v16;
    }
  }
  else
  {
    objc_msgSend(v6, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "identifier");
    -[PXAssetActionManager objectReference](self, "objectReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "indexPath");
      v12 = v27;
    }
    else
    {
      v12 = 0;
      v27 = 0u;
      v28 = 0u;
    }

    if (v9 != v12)
    {
      objc_msgSend(v6, "dataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetActionManager objectReference](self, "objectReference");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectReferenceForObjectReference:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetActionManager setObjectReference:](self, "setObjectReference:", v20);

    }
    v21 = objc_alloc(MEMORY[0x1E0D7B928]);
    objc_msgSend(v6, "dataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetActionManager objectReference](self, "objectReference");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
      objc_msgSend(v23, "indexPath");
    else
      memset(v26, 0, sizeof(v26));
    v25 = objc_msgSend(v21, "initWithDataSource:selectedIndexPath:", v22, v26);

    v6 = (void *)v25;
  }
  return v6;
}

- (void)_handlePreviewAction:(id)a3 actionType:(id)a4
{
  -[CKMediaObjectAssetActionManager executeActionForActionType:withCompletionHandler:](self, "executeActionForActionType:withCompletionHandler:", a4, 0);
}

- (id)_currentlySelectedChatItemsOutCursorItem:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PXAssetActionManager selectionManager](self, "selectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v5, "selectedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v5, "allItemsEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "chatItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v15 = objc_msgSend(v8, "count");
  if (a3 && v15)
  {
    v23 = 0u;
    v24 = 0u;
    if (v5)
    {
      objc_msgSend(v5, "cursorIndexPath");
      v16 = v23;
    }
    else
    {
      v16 = 0;
    }
    if (v16 == *MEMORY[0x1E0D7C2D8])
    {
      IMLogHandleForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CKMediaObjectAssetActionManager _currentlySelectedChatItemsOutCursorItem:].cold.1();

      objc_msgSend(v8, "firstObject");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "dataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v23;
      v22[1] = v24;
      objc_msgSend(v18, "objectAtIndexPath:", v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "chatItem");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v20;

    }
  }

  return v8;
}

- (void)_runDeleteActionPerformer
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[CKMediaObjectAssetActionManager actionPerformerForActionType:](self, "actionPerformerForActionType:", *MEMORY[0x1E0D7BFC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__CKMediaObjectAssetActionManager__runDeleteActionPerformer__block_invoke;
  v5[3] = &unk_1E274B1A0;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v2, "performActionWithCompletionHandler:", v5);

}

void __60__CKMediaObjectAssetActionManager__runDeleteActionPerformer__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "selectedIndexPaths");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134217984;
      v10 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEFAULT, "Successfully deleted %lu item(s)", (uint8_t *)&v9, 0xCu);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __60__CKMediaObjectAssetActionManager__runDeleteActionPerformer__block_invoke_cold_1((uint64_t)v5, v7);
  }

}

- (CKMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (CKMediaObjectAssetActionHelper)chatActionHelper
{
  return (CKMediaObjectAssetActionHelper *)objc_loadWeakRetained((id *)&self->_chatActionHelper);
}

- (NSMutableDictionary)performerClassByType
{
  return self->_performerClassByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performerClassByType, 0);
  objc_destroyWeak((id *)&self->_chatActionHelper);
  objc_storeStrong((id *)&self->_chatItem, 0);
  objc_storeStrong((id *)&self->_menuBuilder, 0);
}

- (void)_keyCommandQuickLook:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "No chat item specified for key command quicklook action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_keyCommandReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "No chat item specified for key command reply action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_keyCommandTapback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "No chat item specified for key command tapback action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_keyCommandCopy:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "No chat item specified for key command copy action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)menuBuilder:quickLookChatItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "No chat item specified for context menu quicklook action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)menuBuilder:tapbackChatItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "No chat item specified for context menu tapback action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)menuBuilder:tapbackElementsForChatItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "No chat item specified for context menu tapback actions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)menuBuilder:replyChatItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "No chat item specified for context menu reply action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)menuBuilder:copyChatItems:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "No chat items specified for context menu copy action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)menuBuilder:forwardChatItems:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "No chat items specified for context menu forward action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_currentlySelectedChatItemsOutCursorItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "No cursor item for non-empty selection. Falling back to an arbitrary selected item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__CKMediaObjectAssetActionManager__runDeleteActionPerformer__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Error deleting chat items: %@", (uint8_t *)&v2, 0xCu);
}

@end
