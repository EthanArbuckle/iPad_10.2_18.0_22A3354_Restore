@implementation __IMDPersistenceServiceListenerImpl

- (void)resume
{
  void *v3;
  __IMDPersistenceServiceListenerImpl *v4;
  id v5;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_serviceListener);
  objc_msgSend(v5, sel_setDelegate_, v4);
  objc_msgSend(v5, sel_resume);

}

- (__IMDPersistenceServiceListenerImpl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MessagesPersistenceServiceListener();
  return -[__IMDPersistenceServiceListenerImpl init](&v3, sel_init);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  __IMDPersistenceServiceListenerImpl *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1ABC4E3F8(v7);

  return v9 & 1;
}

@end
