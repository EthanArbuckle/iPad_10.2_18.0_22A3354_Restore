@implementation _BRObservableFilePresenter

- (void)presentedItemDidChange
{
  id v2;

  -[_BRObservableFilePresenter parent](self, "parent");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_presenterDidChange");

}

- (void)presentedItemUbiquityDidChange
{
  id v2;

  -[_BRObservableFilePresenter parent](self, "parent");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_presenterDidChange");

}

- (void)presentedItemDidMoveToURL:(id)a3
{
  id v4;

  -[_BRObservableFilePresenter setPresentedItemURL:](self, "setPresentedItemURL:", a3);
  -[_BRObservableFilePresenter parent](self, "parent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_presenterDidChange");

}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  -[_BRObservableFilePresenter setPresentedItemURL:](self, "setPresentedItemURL:", 0);
  -[_BRObservableFilePresenter parent](self, "parent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_presenterDidChange");

  v5[2](v5, 0);
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPresentedItemURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPresentedItemOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BRObservableFile)parent
{
  return (BRObservableFile *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
  objc_storeStrong((id *)&self->_presentedItemURL, 0);
}

@end
