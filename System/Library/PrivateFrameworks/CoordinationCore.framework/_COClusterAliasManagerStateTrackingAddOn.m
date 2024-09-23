@implementation _COClusterAliasManagerStateTrackingAddOn

- (void)didStopMeshController:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[_COClusterAliasManagerStateTrackingAddOn aliasManager](self, "aliasManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didStopMeshController:", v4);

  v6.receiver = self;
  v6.super_class = (Class)_COClusterAliasManagerStateTrackingAddOn;
  -[COMeshAddOn didStopMeshController:](&v6, sel_didStopMeshController_, v4);

}

- (COClusterAliasManager)aliasManager
{
  return (COClusterAliasManager *)objc_loadWeakRetained((id *)&self->_aliasManager);
}

- (void)setAliasManager:(id)a3
{
  objc_storeWeak((id *)&self->_aliasManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_aliasManager);
}

@end
