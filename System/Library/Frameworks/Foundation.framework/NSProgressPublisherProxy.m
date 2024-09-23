@implementation NSProgressPublisherProxy

- (NSProgressValues)values
{
  return (NSProgressValues *)objc_getProperty(self, a2, 48, 1);
}

- (id)publisherID
{
  return self->_publisherID;
}

- (void)observeUserInfoValue:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *userInfo;

  userInfo = self->_values->_userInfo;
  if (!userInfo)
  {
    self->_values->_userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = self->_values->_userInfo;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](userInfo, "setObject:forKeyedSubscript:", a3, a4);
}

- (NSFileAccessNode)itemLocation
{
  return self->_itemLocation;
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)appWithBundleID:(id)a3 didAcknowledgeWithSuccess:(BOOL)a4
{
  -[NSProgressPublisher appWithBundleID:didAcknowledgeWithSuccess:](self->_forwarder, "appWithBundleID:didAcknowledgeWithSuccess:", a3, a4);
}

- (NSProgressPublisherProxy)initWithForwarder:(id)a3 onConnection:(id)a4 publisherID:(id)a5 values:(id)a6
{
  NSProgressPublisherProxy *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)NSProgressPublisherProxy;
  v10 = -[NSProgressPublisherProxy init](&v12, sel_init);
  if (v10)
  {
    v10->_forwarder = (NSProgressPublisher *)a3;
    v10->_publisherID = a5;
    v10->_connection = (NSXPCConnection *)a4;
    v10->_values = (NSProgressValues *)objc_msgSend(a6, "copy");
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSProgressPublisherProxy;
  -[NSProgressPublisherProxy dealloc](&v3, sel_dealloc);
}

- (void)setItemLocation:(id)a3
{
  NSFileAccessNode *itemLocation;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  itemLocation = self->_itemLocation;
  if (itemLocation != a3)
  {
    if (!a3)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __44__NSProgressPublisherProxy_setItemLocation___block_invoke;
      v6[3] = &unk_1E0F4C5D8;
      v6[4] = self;
      -[NSFileAccessNode forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:](itemLocation, "forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:", v6);
      itemLocation = self->_itemLocation;
    }
    -[NSFileAccessNode removeProgressPublisher:](itemLocation, "removeProgressPublisher:", self);
    self->_itemLocation = (NSFileAccessNode *)a3;
    objc_msgSend(a3, "addProgressPublisher:", self);
  }
}

uint64_t __44__NSProgressPublisherProxy_setItemLocation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removePublisherForID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (BOOL)isFromConnection:(id)a3
{
  return self->_connection == a3;
}

- (void)cancel
{
  -[NSProgressPublisher cancel](self->_forwarder, "cancel");
}

- (void)pause
{
  -[NSProgressPublisher pause](self->_forwarder, "pause");
}

- (void)resume
{
  -[NSProgressPublisher resume](self->_forwarder, "resume");
}

- (void)prioritize
{
  -[NSProgressPublisher prioritize](self->_forwarder, "prioritize");
}

- (id)descriptionWithIndenting:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%@ %p> forwarder: %@, publisher ID: %@\n%@location: %p"), a3, objc_opt_class(), self, self->_forwarder, self->_publisherID, objc_msgSend(a3, "stringByAppendingString:", CFSTR("    ")), self->_itemLocation);
}

- (NSString)description
{
  return (NSString *)-[NSProgressPublisherProxy descriptionWithIndenting:](self, "descriptionWithIndenting:", &stru_1E0F56070);
}

- (void)observeValues:(id)a3 forKeys:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t i;

  v7 = objc_msgSend(a3, "count");
  v8 = objc_msgSend(a4, "count");
  if (v7 && v7 == v8)
  {
    for (i = 0; i != v7; ++i)
      -[NSProgressValues setValue:forKey:](self->_values, "setValue:forKey:", objc_msgSend(a3, "objectAtIndexedSubscript:", i), objc_msgSend(a4, "objectAtIndexedSubscript:", i));
  }
}

- (void)setCategory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

@end
