@implementation _FPFilePresenterObserver

- (void)observePresentedFilesDidChange:(id)a3
{
  NSFileProviderManager **p_parentConnection;
  id v4;
  id WeakRetained;

  p_parentConnection = &self->_parentConnection;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parentConnection);
  objc_msgSend(WeakRetained, "setPresentedFiles:", v4);

}

- (NSFileProviderManager)parentConnection
{
  return (NSFileProviderManager *)objc_loadWeakRetained((id *)&self->_parentConnection);
}

- (void)setParentConnection:(id)a3
{
  objc_storeWeak((id *)&self->_parentConnection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentConnection);
}

@end
