@implementation MFDropTarget

- (MFDropTarget)initWithView:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  MFDropTarget *v8;
  MFDropTarget *v9;
  uint64_t v10;
  UIDropInteraction *dropInteraction;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFDropTarget;
  v8 = -[MFDropTarget init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MFDropTarget setTargetView:](v8, "setTargetView:", v6);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", v9);
    dropInteraction = v9->_dropInteraction;
    v9->_dropInteraction = (UIDropInteraction *)v10;

    objc_msgSend(v6, "addInteraction:", v9->_dropInteraction);
    -[MFDropTarget setDelegate:](v9, "setDelegate:", v7);
    -[MFDropTarget _updateDelegateFlags](v9, "_updateDelegateFlags");
  }

  return v9;
}

- (void)_updateDelegateFlags
{
  id v3;

  -[MFDropTarget delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_delegateFlags.respondsToCanDropDraggedItemsAtPoint = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDragEntered = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDragExited = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDragDidMoveToPoint = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDidDropItemsAtPoint = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.respondsToDataOwner = objc_opt_respondsToSelector() & 1;

}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint8_t v13[16];

  v5 = a4;
  MFLogGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "#DragAndDrop Dragging entered", v13, 2u);
  }

  if (self->_delegateFlags.respondsToDragEntered)
  {
    -[MFDropTarget delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDropTarget targetView](self, "targetView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    objc_msgSend(v7, "dropTarget:dragEnteredAtPoint:", self, v10, v12);
  }

}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "#DragAndDrop Dragging exited", v7, 2u);
  }

  if (self->_delegateFlags.respondsToDragExited)
  {
    -[MFDropTarget delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dropTargetDragExited:", self);

  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  if (-[MFDropTarget _delegateHandlesDrops](self, "_delegateHandlesDrops"))
    v6 = -[MFDropTarget _sessionContainsOnlyAcceptableTypeIdentifiers:](self, "_sessionContainsOnlyAcceptableTypeIdentifiers:", v5);
  else
    v6 = 0;

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
    -[MFDropTarget targetView](self, "targetView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    -[MFDropTarget delegate](self, "delegate");
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
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", v15);

  return v16;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a4;
  MFLogGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "#DragAndDrop Items dropped", v7, 2u);
  }

  -[MFDropTarget _delegateDidDropItemsWithDropSession:](self, "_delegateDidDropItemsWithDropSession:", v5);
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v5;
  id WeakRetained;
  int64_t v7;

  v5 = a4;
  if (self->_delegateFlags.respondsToDataOwner)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_msgSend(WeakRetained, "dropTarget:dataOwnerForSession:", self, v5);

  }
  else
  {
    v7 = 3;
  }

  return v7;
}

- (BOOL)_sessionContainsOnlyAcceptableTypeIdentifiers:(id)a3
{
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  objc_msgSend(a3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__MFDropTarget__sessionContainsOnlyAcceptableTypeIdentifiers___block_invoke;
  v6[3] = &unk_1E5A67250;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  LOBYTE(v4) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v4;
}

void __62__MFDropTarget__sessionContainsOnlyAcceptableTypeIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "itemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registeredTypeIdentifiers");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "acceptableUTIs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v9, "intersectsSet:", v10);

  if ((v8 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (void)_delegateDidDropItemsWithDropSession:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[MFDropTarget targetView](self, "targetView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  -[MFDropTarget delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dropTarget:didDropDragItems:atPoint:", self, v10, v6, v8);

}

- (BOOL)_delegateHandlesDrops
{
  return self->_delegateFlags.respondsToDidDropItemsAtPoint != 0;
}

- (BOOL)_delegateCanDropItemsWithDropSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;

  v4 = a3;
  if (self->_delegateFlags.respondsToCanDropDraggedItemsAtPoint)
  {
    -[MFDropTarget delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDropTarget targetView](self, "targetView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v6);
    v8 = v7;
    v10 = v9;

    v11 = objc_msgSend(v5, "dropTarget:canDropDraggedItemsAtPoint:", self, v8, v10);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (NSSet)acceptableUTIs
{
  return self->_acceptableUTIs;
}

- (void)setAcceptableUTIs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIView)targetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_targetView);
}

- (void)setTargetView:(id)a3
{
  objc_storeWeak((id *)&self->_targetView, a3);
}

- (MFDropTargetDelegate)delegate
{
  return (MFDropTargetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

@end
