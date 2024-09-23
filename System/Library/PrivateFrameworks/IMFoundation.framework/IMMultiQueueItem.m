@implementation IMMultiQueueItem

- (IMMultiQueueItem)initWithBlock:(id)a3 GUID:(id)a4 description:(id)a5
{
  id v9;
  id v10;
  id v11;
  IMMultiQueueItem *v12;
  IMMultiQueueItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMMultiQueueItem;
  v12 = -[IMMultiQueueItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_block, a3);
    objc_storeStrong((id *)&v13->_GUID, a4);
    objc_storeStrong((id *)&v13->_describer, a5);
  }

  return v13;
}

- (id)block
{
  return self->_block;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSString)describer
{
  return self->_describer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_describer, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
