@implementation DUXPCServerRequestHandler

- (DUXPCServerRequestHandler)initWithManager:(id)a3
{
  id v5;
  DUXPCServerRequestHandler *v6;
  DUXPCServerRequestHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DUXPCServerRequestHandler;
  v6 = -[DUXPCServerRequestHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_textUnderstandingManager, a3);

  return v7;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  -[TextUnderstandingManager addOrUpdateSearchableItems:bundleID:completion:](self->_textUnderstandingManager, "addOrUpdateSearchableItems:bundleID:completion:", a3, a4, a5);
}

- (void)addSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
  -[TextUnderstandingManager addSerializedDocument:documentType:completion:](self->_textUnderstandingManager, "addSerializedDocument:documentType:completion:", a3, a4, a5);
}

- (void)foundInEventResultWithSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
  -[TextUnderstandingManager foundInEventResultWithSerializedDocument:documentType:completion:](self->_textUnderstandingManager, "foundInEventResultWithSerializedDocument:documentType:completion:", a3, a4, a5);
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_PASBundleIdResolver)bundleIdResolver
{
  return self->_bundleIdResolver;
}

- (void)setBundleIdResolver:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdResolver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdResolver, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_textUnderstandingManager, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

@end
