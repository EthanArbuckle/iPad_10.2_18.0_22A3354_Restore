@implementation NPKPeerPaymentAccountManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__NPKPeerPaymentAccountManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, block);
  return (id)sharedInstance_sharedInstance_2;
}

void __46__NPKPeerPaymentAccountManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;

}

- (NPKPeerPaymentAccountManager)initWithPeerPaymentService:(id)a3
{
  id v4;
  NPKPeerPaymentAccountManager *v5;
  PKPeerPaymentService *v6;
  void *peerPaymentService;
  uint64_t v8;
  PKPeerPaymentService *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKPeerPaymentAccountManager;
  v5 = -[NPKPeerPaymentAccountManager init](&v13, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (PKPeerPaymentService *)v4;
      peerPaymentService = v5->_peerPaymentService;
      v5->_peerPaymentService = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE6EE00], "sharedService");
      peerPaymentService = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(peerPaymentService, "peerPaymentService");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v5->_peerPaymentService;
      v5->_peerPaymentService = (PKPeerPaymentService *)v8;

    }
    -[PKPeerPaymentService account](v5->_peerPaymentService, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPeerPaymentAccountManager setAccount:](v5, "setAccount:", v10);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v5, sel__handleAccountChanged_, *MEMORY[0x24BE6F798], v5->_peerPaymentService);

    -[NPKPeerPaymentAccountManager _updateAccount](v5, "_updateAccount");
  }

  return v5;
}

- (NPKPeerPaymentAccountManager)init
{
  return -[NPKPeerPaymentAccountManager initWithPeerPaymentService:](self, "initWithPeerPaymentService:", 0);
}

- (void)_updateAccount
{
  void *v3;
  _QWORD v4[5];

  -[NPKPeerPaymentAccountManager peerPaymentService](self, "peerPaymentService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__NPKPeerPaymentAccountManager__updateAccount__block_invoke;
  v4[3] = &unk_24CFEAC98;
  v4[4] = self;
  objc_msgSend(v3, "accountWithCompletion:", v4);

}

void __46__NPKPeerPaymentAccountManager__updateAccount__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setAccount:", a2);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("NPKPeerPaymentAccountManagerAccountDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (PKPeerPaymentAccount)account
{
  return (PKPeerPaymentAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
}

@end
