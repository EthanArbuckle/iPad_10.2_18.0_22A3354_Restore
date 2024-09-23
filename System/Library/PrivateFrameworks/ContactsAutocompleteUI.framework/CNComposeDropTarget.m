@implementation CNComposeDropTarget

+ (id)os_log
{
  if (os_log_cn_once_token_2_0 != -1)
    dispatch_once(&os_log_cn_once_token_2_0, &__block_literal_global_18);
  return (id)os_log_cn_once_object_2_0;
}

void __29__CNComposeDropTarget_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "composedroptarget");
  v1 = (void *)os_log_cn_once_object_2_0;
  os_log_cn_once_object_2_0 = (uint64_t)v0;

}

- (CNComposeDropTarget)initWithView:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  CNComposeDropTarget *v8;
  CNComposeDropTarget *v9;
  uint64_t v10;
  UIDropInteraction *dropInteraction;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNComposeDropTarget;
  v8 = -[CNComposeDropTarget init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_targetView, v6);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA588]), "initWithDelegate:", v9);
    dropInteraction = v9->_dropInteraction;
    v9->_dropInteraction = (UIDropInteraction *)v10;

    objc_msgSend(v6, "addInteraction:", v9->_dropInteraction);
    objc_storeWeak((id *)&v9->_delegate, v7);
    -[CNComposeDropTarget _updateDelegateFlags](v9, "_updateDelegateFlags");
  }

  return v9;
}

- (void)_updateDelegateFlags
{
  id v3;

  -[CNComposeDropTarget delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_delegateFlags.respondsToCanDropDraggedItemsAtPoint = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDragEntered = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDragExited = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDragDidMoveToPoint = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDidDropItemsAtPoint = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDataOwner = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToShouldHandleDroppedContacts = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToSendingAddressForTargetView = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToAddressKind = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToComposeRecipientsForDroppedContacts = objc_opt_respondsToSelector() & 1;

}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CNComposeDropTarget dropInteraction:sessionDidEnter:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  if (self->_delegateFlags.respondsToDragEntered)
  {
    -[CNComposeDropTarget delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeDropTarget targetView](self, "targetView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v15);
    v17 = v16;
    v19 = v18;

    objc_msgSend(v14, "dropTarget:dragEnteredAtPoint:", self, v17, v19);
  }

}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend((id)objc_opt_class(), "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CNComposeDropTarget dropInteraction:sessionDidExit:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  if (self->_delegateFlags.respondsToDragExited)
  {
    -[CNComposeDropTarget delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dropTargetDragExited:", self);

  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  v6 = (-[CNComposeDropTarget _delegateHandlesDrops](self, "_delegateHandlesDrops")
     || -[CNComposeDropTarget shouldHandleContactItemsFromSession:](self, "shouldHandleContactItemsFromSession:", v5))
    && -[CNComposeDropTarget _sessionContainsOnlyAcceptableTypeIdentifiers:](self, "_sessionContainsOnlyAcceptableTypeIdentifiers:", v5);

  return v6;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (self->_delegateFlags.respondsToDragDidMoveToPoint)
  {
    -[CNComposeDropTarget targetView](self, "targetView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    -[CNComposeDropTarget delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dropTarget:dragDidMoveToPoint:", self, v10, v12);

  }
  if (objc_msgSend(v7, "allowsMoveOperation"))
  {
    objc_msgSend(v7, "localDragSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = 3;
    else
      v15 = 2;

  }
  else
  {
    v15 = 2;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA590]), "initWithDropOperation:", v15);

  return v16;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CNComposeDropTarget dropInteraction:performDrop:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  -[CNComposeDropTarget _delegateDidDropItemsWithDropSession:](self, "_delegateDidDropItemsWithDropSession:", v5);
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  CNComposeDropTargetDelegate **p_delegate;
  id v6;
  id WeakRetained;
  int64_t v8;

  if (!self->_delegateFlags.respondsToDataOwner)
    return 3;
  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_msgSend(WeakRetained, "dropTarget:dataOwnerForSession:", self, v6);

  return v8;
}

- (BOOL)_sessionContainsOnlyAcceptableTypeIdentifiers:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__CNComposeDropTarget__sessionContainsOnlyAcceptableTypeIdentifiers___block_invoke;
  v7[3] = &unk_1E62C0260;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

void __69__CNComposeDropTarget__sessionContainsOnlyAcceptableTypeIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "itemProvider");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "registeredTypeIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "acceptableUTIs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "intersectsSet:", v10);

  if ((v7 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (void)_delegateDidDropItemsWithDropSession:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[CNComposeDropTarget shouldHandleContactItemsFromSession:](self, "shouldHandleContactItemsFromSession:")
    && (objc_msgSend(v12, "localDragSession"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    -[CNComposeDropTarget addContactItemsToTargetViewFromSession:](self, "addContactItemsToTargetViewFromSession:", v12);
  }
  else if (-[CNComposeDropTarget _delegateHandlesDrops](self, "_delegateHandlesDrops"))
  {
    -[CNComposeDropTarget targetView](self, "targetView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    -[CNComposeDropTarget delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dropTarget:didDropDragItems:atPoint:", self, v11, v7, v9);

  }
}

- (BOOL)_delegateHandlesDrops
{
  return self->_delegateFlags.respondsToDidDropItemsAtPoint != 0;
}

- (BOOL)_delegateCanDropItemsWithDropSession:(id)a3
{
  CNComposeDropTarget *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (!self->_delegateFlags.respondsToCanDropDraggedItemsAtPoint)
    return 1;
  v3 = self;
  v4 = a3;
  -[CNComposeDropTarget delegate](v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeDropTarget targetView](v3, "targetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  LOBYTE(v3) = objc_msgSend(v5, "dropTarget:canDropDraggedItemsAtPoint:", v3, v8, v10);
  return (char)v3;
}

- (BOOL)handlesDroppedContacts
{
  return -[CNComposeDropTarget shouldHandleContactItemsFromSession:](self, "shouldHandleContactItemsFromSession:", 0);
}

- (BOOL)shouldHandleContactItemsFromSession:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  BOOL v8;

  v4 = a3;
  if (self->_delegateFlags.respondsToShouldHandleDroppedContacts
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        -[CNComposeDropTarget targetView](self, "targetView"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(WeakRetained, "dropTarget:shouldAddDroppedContactsToTargetView:forSession:", self, v6, v4),
        v6,
        WeakRetained,
        v7))
  {
    if (v4)
      v8 = -[CNComposeDropTarget canLoadContactObjectsFromSession:](self, "canLoadContactObjectsFromSession:", v4);
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)canLoadContactObjectsFromSession:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "canLoadObjectsOfClass:", objc_opt_class());

  return v4;
}

- (void)addContactItemsToTargetViewFromSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  objc_opt_class();
  -[CNComposeDropTarget targetView](self, "targetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C97530];
    v9 = (void *)MEMORY[0x1E0C97200];
    +[CNComposeRecipient descriptorsForRequiredKeysForContact](CNComposeRecipient, "descriptorsForRequiredKeysForContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CNComposeDropTarget addContactItemsToTargetViewFromSession:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptorWithKeyDescriptors:description:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__CNComposeDropTarget_addContactItemsToTargetViewFromSession___block_invoke;
    v13[3] = &unk_1E62C0288;
    v13[4] = self;
    v14 = v7;
    v15 = v4;
    objc_msgSend(v8, "provideContactsForDropSession:withKeys:completionBlock:", v15, v12, v13);

  }
}

uint64_t __62__CNComposeDropTarget_addContactItemsToTargetViewFromSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addDroppedContacts:toTargetView:forSession:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)addDroppedContacts:(id)a3 toTargetView:(id)a4 forSession:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];

  v8 = a4;
  v14 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__CNComposeDropTarget_addDroppedContacts_toTargetView_forSession___block_invoke;
  v17[3] = &unk_1E62C02B0;
  v17[4] = self;
  objc_msgSend(a3, "_cn_map:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_delegateFlags.respondsToComposeRecipientsForDroppedContacts)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dropTarget:proposedRecipientsForDroppedContacts:forSession:", self, v10, v14);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __66__CNComposeDropTarget_addDroppedContacts_toTargetView_forSession___block_invoke_2;
  v15[3] = &unk_1E62C0218;
  v16 = v8;
  v13 = v8;
  objc_msgSend(v10, "_cn_each:", v15);

}

uint64_t __66__CNComposeDropTarget_addDroppedContacts_toTargetView_forSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "emailRecipientForContact:", a2);
}

void __66__CNComposeDropTarget_addDroppedContacts_toTargetView_forSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__CNComposeDropTarget_addDroppedContacts_toTargetView_forSession___block_invoke_3;
  v5[3] = &unk_1E62BF0D0;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __66__CNComposeDropTarget_addDroppedContacts_toTargetView_forSession___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRecipient:", *(_QWORD *)(a1 + 40));
}

- (void)handleDropOfContactItemProviders:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v7 = a3;
  if (-[CNComposeDropTarget shouldHandleContactItemsFromSession:](self, "shouldHandleContactItemsFromSession:", 0)
    && ((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    objc_opt_class();
    -[CNComposeDropTarget targetView](self, "targetView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    if (v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __56__CNComposeDropTarget_handleDropOfContactItemProviders___block_invoke;
      v8[3] = &unk_1E62C0300;
      v8[4] = self;
      v9 = v6;
      objc_msgSend(v7, "_cn_each:", v8);

    }
  }

}

void __56__CNComposeDropTarget_handleDropOfContactItemProviders___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  if (objc_msgSend(v3, "canLoadObjectOfClass:", objc_opt_class()))
  {
    v4 = objc_opt_class();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__CNComposeDropTarget_handleDropOfContactItemProviders___block_invoke_2;
    v7[3] = &unk_1E62C02D8;
    v5 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v6 = (id)objc_msgSend(v3, "loadObjectOfClass:completionHandler:", v4, v7);

  }
}

void __56__CNComposeDropTarget_handleDropOfContactItemProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C97530];
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C97200];
    +[CNComposeRecipient descriptorsForRequiredKeysForContact](CNComposeRecipient, "descriptorsForRequiredKeysForContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CNComposeDropTarget handleDropOfContactItemProviders:]_block_invoke_2");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptorWithKeyDescriptors:description:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactsFromDraggingContacts:withKeys:", v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addDroppedContacts:toTargetView:forSession:", v13, *(_QWORD *)(a1 + 40), 0);
  }

}

- (id)emailRecipientForContact:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  CNComposeRecipient *v7;
  void *v8;
  CNComposeRecipient *v9;

  v4 = a3;
  v5 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v4, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((_DWORD)v5)
  {
    v7 = [CNComposeRecipient alloc];
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNComposeRecipient initWithContact:address:kind:](v7, "initWithContact:address:kind:", v4, v8, 0);

  }
  else
  {
    -[CNComposeDropTarget unifiedEmailRecipientForContact:](self, "unifiedEmailRecipientForContact:", v4);
    v9 = (CNComposeRecipient *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)unifiedEmailRecipientForContact:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  CNUnifiedComposeRecipient *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  CNComposeDropTarget *v29;
  uint64_t v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D135E8], "factoryWithPriorityDomain:sendingAddress:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_delegateFlags.respondsToAddressKind)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[CNComposeDropTarget targetView](self, "targetView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(WeakRetained, "addressKindForDropTarget:withTargetView:", self, v7);

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "emailAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __55__CNComposeDropTarget_unifiedEmailRecipientForContact___block_invoke;
  v26[3] = &unk_1E62C0328;
  v11 = v5;
  v27 = v11;
  v12 = v4;
  v28 = v12;
  v29 = self;
  v30 = v8;
  objc_msgSend(v9, "_cn_map:", v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_delegateFlags.respondsToSendingAddressForTargetView)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    -[CNComposeDropTarget targetView](self, "targetView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendingAddressForDropTarget:withTargetView:", self, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(MEMORY[0x1E0D1E450], "rangeOfAddressDomainFromAddress:", v16);
    objc_msgSend(v16, "substringWithRange:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C97348], "bestGuessEmailAddressForContact:sendingAddressDomain:", v12, v19);
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __55__CNComposeDropTarget_unifiedEmailRecipientForContact___block_invoke_2;
  v24[3] = &unk_1E62BEE78;
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v25;
  objc_msgSend(v13, "_cn_firstObjectPassingTest:", v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[CNUnifiedComposeRecipient initWithChildren:defaultChild:]([CNUnifiedComposeRecipient alloc], "initWithChildren:defaultChild:", v13, v21);

  return v22;
}

CNComposeRecipient *__55__CNComposeDropTarget_unifiedEmailRecipientForContact___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNComposeRecipient *v10;
  uint64_t v11;
  void *v12;
  CNComposeRecipient *v13;

  v3 = (objc_class *)MEMORY[0x1E0D135F0];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAddress:", v6);

  objc_msgSend(v5, "setAddressType:", 1);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localContactResultWithDisplayName:value:nameComponents:contactIdentifier:", 0, v5, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [CNComposeRecipient alloc];
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[CNComposeRecipient initWithContact:address:kind:](v10, "initWithContact:address:kind:", v11, v12, objc_msgSend(*(id *)(a1 + 48), "composeAddressKind:", *(_QWORD *)(a1 + 56)));
  -[CNComposeRecipient setAutocompleteResult:](v13, "setAutocompleteResult:", v9);

  return v13;
}

uint64_t __55__CNComposeDropTarget_unifiedEmailRecipientForContact___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (unint64_t)composeAddressKind:(unint64_t)a3
{
  if (a3)
    return 5;
  else
    return 0;
}

- (NSSet)acceptableUTIs
{
  return self->_acceptableUTIs;
}

- (void)setAcceptableUTIs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIView)targetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_targetView);
}

- (void)setTargetView:(id)a3
{
  objc_storeWeak((id *)&self->_targetView, a3);
}

- (CNComposeDropTargetDelegate)delegate
{
  return (CNComposeDropTargetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setDropInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dropInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_targetView);
  objc_storeStrong((id *)&self->_acceptableUTIs, 0);
}

- (void)dropInteraction:(uint64_t)a3 sessionDidEnter:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B10FF000, a1, a3, "Dragging entered", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)dropInteraction:(uint64_t)a3 sessionDidExit:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B10FF000, a1, a3, "Dragging exited", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)dropInteraction:(uint64_t)a3 performDrop:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B10FF000, a1, a3, "Items dropped", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

@end
