@implementation IMCoreAccountsMonitor

- (IMCoreAccountsMonitor)init
{
  IMCoreAccountsMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMCoreAccountsMonitor;
  v2 = -[IMCoreAccountsMonitor init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("IMCoreAccountsMonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C8F1C0];
    sub_1A211E0C4();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_accountStoreDidChange_, v6, v7);

  }
  return v2;
}

+ (IMCoreAccountsMonitor)sharedInstance
{
  if (qword_1EE65F370 != -1)
    dispatch_once(&qword_1EE65F370, &unk_1E471DA58);
  return (IMCoreAccountsMonitor *)(id)qword_1EE65F660;
}

- (BOOL)isSignedIntoiCloud
{
  void *v2;
  BOOL v3;

  -[IMCoreAccountsMonitor _cachedPrimaryAppleAccount](self, "_cachedPrimaryAppleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_cachedPrimaryAppleAccount
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1A200AEA4;
  v10 = sub_1A200ACC4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A211E250;
  v5[3] = &unk_1E471F5D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)accountStoreDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *queue;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F0F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A211E494;
    block[3] = &unk_1E471E348;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPrimaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
