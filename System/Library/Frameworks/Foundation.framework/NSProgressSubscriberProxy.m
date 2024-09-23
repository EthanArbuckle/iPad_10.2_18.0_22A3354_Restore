@implementation NSProgressSubscriberProxy

- (void)setItemLocation:(id)a3
{
  NSFileAccessNode *itemLocation;

  itemLocation = self->_itemLocation;
  if (itemLocation != a3)
  {
    -[NSFileAccessNode removeProgressSubscriber:](itemLocation, "removeProgressSubscriber:", self);
    self->_itemLocation = (NSFileAccessNode *)a3;
    objc_msgSend(a3, "addProgressSubscriber:", self);
  }
}

- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5
{
  objc_msgSend((id)-[NSProgressSubscriber _unboostingRemoteObjectProxy](self->_forwarder, "_unboostingRemoteObjectProxy"), "observePublisherUserInfoForID:value:forKey:", a3, a4, a5);
}

- (NSFileAccessNode)itemLocation
{
  return self->_itemLocation;
}

- (NSProgressSubscriberProxy)initWithForwarder:(id)a3 onConnection:(id)a4 subscriberID:(id)a5 appBundleID:(id)a6
{
  NSProgressSubscriberProxy *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)NSProgressSubscriberProxy;
  v10 = -[NSProgressSubscriberProxy init](&v12, sel_init);
  if (v10)
  {
    v10->_forwarder = (NSProgressSubscriber *)a3;
    v10->_subscriberID = (id)objc_msgSend(a5, "copy");
    v10->_bundleID = (NSString *)objc_msgSend(a6, "copy");
    v10->_connection = (NSXPCConnection *)a4;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSProgressSubscriberProxy;
  -[NSProgressSubscriberProxy dealloc](&v3, sel_dealloc);
}

- (id)appBundleID
{
  return self->_bundleID;
}

- (void)addPublisher:(id)a3 forID:(id)a4 withValues:(id)a5 isOld:(BOOL)a6
{
  -[NSProgressSubscriber addPublisher:forID:withValues:isOld:](self->_forwarder, "addPublisher:forID:withValues:isOld:", a3, a4, a5, a6);
}

- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5
{
  objc_msgSend((id)-[NSProgressSubscriber _unboostingRemoteObjectProxy](self->_forwarder, "_unboostingRemoteObjectProxy"), "observePublisherForID:values:forKeys:", a3, a4, a5);
}

- (void)removePublisherForID:(id)a3
{
  -[NSProgressSubscriber removePublisherForID:](self->_forwarder, "removePublisherForID:", a3);
}

- (id)descriptionWithIndenting:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%@ %p> forwarder: %@, subscriber ID: %@\n%@location: %p"), a3, objc_opt_class(), self, self->_forwarder, self->_subscriberID, objc_msgSend(a3, "stringByAppendingString:", CFSTR("    ")), self->_itemLocation);
}

- (NSString)description
{
  return (NSString *)-[NSProgressSubscriberProxy descriptionWithIndenting:](self, "descriptionWithIndenting:", &stru_1E0F56070);
}

- (BOOL)isFromConnection:(id)a3
{
  return self->_connection == a3;
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCategory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

@end
