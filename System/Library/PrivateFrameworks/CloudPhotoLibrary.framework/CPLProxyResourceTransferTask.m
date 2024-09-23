@implementation CPLProxyResourceTransferTask

- (void)cancelTask
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLProxyResourceTransferTask;
  -[CPLResourceTransferTask cancelTask](&v3, sel_cancelTask);
  -[CPLProxyLibraryManager cancelTask:](self->_proxyLibraryManager, "cancelTask:", self);
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
