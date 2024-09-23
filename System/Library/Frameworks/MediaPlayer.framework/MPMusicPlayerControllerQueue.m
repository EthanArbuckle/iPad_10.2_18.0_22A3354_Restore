@implementation MPMusicPlayerControllerQueue

- (MPMusicPlayerControllerQueue)initWithController:(id)a3
{
  id v4;
  MPMusicPlayerControllerQueue *v5;
  _MPMusicPlayerQueueItemsProxy *v6;
  NSArray *items;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerControllerQueue;
  v5 = -[MPMusicPlayerControllerQueue init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_MPMusicPlayerQueueItemsProxy initWithController:]([_MPMusicPlayerQueueItemsProxy alloc], "initWithController:", v4);
    items = v5->_items;
    v5->_items = &v6->super;

  }
  return v5;
}

- (NSArray)items
{
  return self->_items;
}

- (void)fault
{
  NSArray *v3;
  NSArray *items;
  id v5;

  -[NSArray objectEnumerator](self->_items, "objectEnumerator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  self->_items = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
