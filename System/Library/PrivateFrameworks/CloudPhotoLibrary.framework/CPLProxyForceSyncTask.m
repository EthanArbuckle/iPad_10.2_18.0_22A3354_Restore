@implementation CPLProxyForceSyncTask

- (void)cancelTask
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLProxyForceSyncTask;
  -[CPLForceSyncTask cancelTask](&v3, sel_cancelTask);
  -[CPLProxyLibraryManager cancelSyncTask:](self->_proxyLibraryManager, "cancelSyncTask:", self);
}

- (CPLProxyLibraryManager)proxyLibraryManager
{
  return self->_proxyLibraryManager;
}

- (void)setProxyLibraryManager:(id)a3
{
  objc_storeStrong((id *)&self->_proxyLibraryManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyLibraryManager, 0);
}

@end
