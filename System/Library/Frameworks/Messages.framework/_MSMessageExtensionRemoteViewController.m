@implementation _MSMessageExtensionRemoteViewController

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)_MSMessageExtensionRemoteViewController;
  -[_MSMessageExtensionRemoteViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[_MSMessageExtensionRemoteViewController view](self, "view", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setUserInteractionEnabled:", 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[_MSMessageExtensionRemoteViewController requestUUID](self, "requestUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_MSMessageExtensionRemoteViewController weakExtension](self, "weakExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelExtensionRequestWithIdentifier:", v3);

  }
  v5.receiver = self;
  v5.super_class = (Class)_MSMessageExtensionRemoteViewController;
  -[_UIRemoteViewController dealloc](&v5, sel_dealloc);
}

- (BOOL)_shouldRemoteViewControllerFenceOriginChanges
{
  return self->_intent != 1;
}

- (BOOL)_allowsShielding
{
  return (unint64_t)(self->_intent - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (NSExtension)weakExtension
{
  return (NSExtension *)objc_loadWeakRetained((id *)&self->_weakExtension);
}

- (void)setWeakExtension:(id)a3
{
  objc_storeWeak((id *)&self->_weakExtension, a3);
}

- (BOOL)providesExplicitSizeSnapshot
{
  return self->_providesExplicitSizeSnapshot;
}

- (void)setProvidesExplicitSizeSnapshot:(BOOL)a3
{
  self->_providesExplicitSizeSnapshot = a3;
}

- (BOOL)needsSizeMatchBeforeSnapshotSwap
{
  return self->_needsSizeMatchBeforeSnapshotSwap;
}

- (void)setNeedsSizeMatchBeforeSnapshotSwap:(BOOL)a3
{
  self->_needsSizeMatchBeforeSnapshotSwap = a3;
}

- (BOOL)isReadyToDisplay
{
  return self->_readyToDisplay;
}

- (void)setReadyToDisplay:(BOOL)a3
{
  self->_readyToDisplay = a3;
}

- (int64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(int64_t)a3
{
  self->_intent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakExtension);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end
