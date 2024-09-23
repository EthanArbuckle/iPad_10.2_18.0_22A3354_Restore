@implementation _MPMusicPlayerQueueItemsProxy

- (_MPMusicPlayerQueueItemsProxy)initWithController:(id)a3
{
  id v4;
  _MPMusicPlayerQueueItemsProxy *v5;
  _MPMusicPlayerQueueItemsProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MPMusicPlayerQueueItemsProxy;
  v5 = -[_MPMusicPlayerQueueItemsProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_controller, v4);

  return v6;
}

- (unint64_t)count
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v3 = objc_msgSend(WeakRetained, "numberOfItems");

  return v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  id WeakRetained;
  void *v5;
  _MPMusicPlayerMediaItemProxy *v6;
  _MPMusicPlayerMediaItemProxy *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "nowPlayingAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "item");
  v6 = (_MPMusicPlayerMediaItemProxy *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [_MPMusicPlayerMediaItemProxy alloc];
    objc_msgSend(v5, "itemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_MPMusicPlayerMediaItemProxy initWithItemIdentifier:item:](v7, "initWithItemIdentifier:item:", v8, v9);

  }
  return v6;
}

- (MPMusicPlayerApplicationController)controller
{
  return (MPMusicPlayerApplicationController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

@end
