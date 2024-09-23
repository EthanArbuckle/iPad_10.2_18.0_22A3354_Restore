@implementation TKTokenWatcherProxy

- (TKTokenWatcherProxy)initWithWatcher:(id)a3
{
  id v4;
  TKTokenWatcherProxy *v5;
  TKTokenWatcherProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TKTokenWatcherProxy;
  v5 = -[TKTokenWatcherProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_watcher, v4);

  return v6;
}

- (void)insertedToken:(id)a3
{
  TKTokenWatcher **p_watcher;
  id v4;
  id WeakRetained;

  p_watcher = &self->_watcher;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_watcher);
  objc_msgSend(WeakRetained, "insertedToken:", v4);

}

- (void)removedToken:(id)a3
{
  TKTokenWatcher **p_watcher;
  id v4;
  id WeakRetained;

  p_watcher = &self->_watcher;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_watcher);
  objc_msgSend(WeakRetained, "removedToken:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_watcher);
}

@end
