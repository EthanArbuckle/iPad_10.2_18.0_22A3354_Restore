@implementation BDSSecureManager

- (BCCloudSecureUserDataManager)userDataManager
{
  return (BCCloudSecureUserDataManager *)((uint64_t (*)(_TtC13BookDataStore23CloudSecureManagerProxy *, char *))MEMORY[0x24BEDD108])(self->_secureManager, sel_userDataManager);
}

+ (id)sharedManager
{
  if (qword_253F3C6A0 != -1)
    dispatch_once(&qword_253F3C6A0, &unk_24F08B1C8);
  return (id)qword_253F3C618;
}

- (BDSSecureManager)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BDSSecureManager *v6;
  uint64_t v7;
  _TtC13BookDataStore23CloudSecureManagerProxy *secureManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BDSSecureManager;
  v6 = -[BDSSecureManager init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_sharedManager(_TtC13BookDataStore23CloudSecureManagerProxy, v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    secureManager = v6->_secureManager;
    v6->_secureManager = (_TtC13BookDataStore23CloudSecureManagerProxy *)v7;

  }
  return v6;
}

- (BDSSecureEngagementManaging)engagementManager
{
  return (BDSSecureEngagementManaging *)((uint64_t (*)(_TtC13BookDataStore23CloudSecureManagerProxy *, char *))MEMORY[0x24BEDD108])(self->_secureManager, sel_engagementManager);
}

- (void)handleRemoteNotification:(id)a3
{
  ((void (*)(_TtC13BookDataStore23CloudSecureManagerProxy *, char *, id))MEMORY[0x24BEDD108])(self->_secureManager, sel_handleRemoteNotification_, a3);
}

- (void)handleRemoteCKNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_handleRemoteCKNotification_(self->_secureManager, a2, (uint64_t)a3, v3, v4);
}

- (void)setEnableCloudSync:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_setEnableCloudSync_(self->_secureManager, a2, a3, v3, v4);
}

- (_TtC13BookDataStore23CloudSecureManagerProxy)secureManager
{
  return self->_secureManager;
}

- (void)setSecureManager:(id)a3
{
  objc_storeStrong((id *)&self->_secureManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureManager, 0);
}

@end
