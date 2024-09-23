@implementation PUEditingExtensionUndoAdapter

- (PUEditingExtensionUndoAdapter)initWithButtonHost:(id)a3
{
  id v5;
  PUEditingExtensionUndoAdapter *v6;
  PUEditingExtensionUndoAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUEditingExtensionUndoAdapter;
  v6 = -[PUEditingExtensionUndoAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_buttonHost, a3);

  return v7;
}

- (void)setUndoManager:(id)a3
{
  NSUndoManager *v5;
  NSUndoManager *v6;
  NSUndoManager *undoManager;
  void *v8;
  NSUndoManager *v9;

  v5 = (NSUndoManager *)a3;
  v6 = v5;
  undoManager = self->_undoManager;
  if (undoManager != v5)
  {
    v9 = v5;
    if (undoManager)
      -[PUEditingExtensionUndoAdapter _unregisterForUndoManagerNotifications:](self, "_unregisterForUndoManagerNotifications:");
    objc_storeStrong((id *)&self->_undoManager, a3);
    -[PUEditingExtensionUndoAdapter buttonHost](self, "buttonHost");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShowUndoRedo:", v9 != 0);

    -[PUEditingExtensionUndoAdapter _updateButtonState](self, "_updateButtonState");
    v6 = v9;
    if (v9)
    {
      -[PUEditingExtensionUndoAdapter _registerForUndoManagerNotifications:](self, "_registerForUndoManagerNotifications:", v9);
      v6 = v9;
    }
  }

}

- (void)performUndo
{
  PLDispatchOnMainQueue();
}

- (void)performRedo
{
  PLDispatchOnMainQueue();
}

- (void)_registerForUndoManagerNotifications:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__updateButtonState, *MEMORY[0x24BDD13A8], v5);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__updateButtonState, *MEMORY[0x24BDD13B8], v5);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__updateButtonState, *MEMORY[0x24BDD13B0], v5);

}

- (void)_unregisterForUndoManagerNotifications:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDD13A8], v5);
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDD13B8], v5);
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDD13B0], v5);

}

- (void)_updateButtonState
{
  void *v3;
  id v4;

  -[PUEditingExtensionUndoAdapter buttonHost](self, "buttonHost");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUEditingExtensionUndoAdapter undoManager](self, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUndoEnabled:redoEnabled:", objc_msgSend(v3, "canUndo"), objc_msgSend(v3, "canRedo"));

}

- (PUEditingExtensionUndoButtonHost)buttonHost
{
  return self->_buttonHost;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_buttonHost, 0);
}

void __44__PUEditingExtensionUndoAdapter_performRedo__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "undoManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "redo");

}

void __44__PUEditingExtensionUndoAdapter_performUndo__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "undoManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "undo");

}

@end
