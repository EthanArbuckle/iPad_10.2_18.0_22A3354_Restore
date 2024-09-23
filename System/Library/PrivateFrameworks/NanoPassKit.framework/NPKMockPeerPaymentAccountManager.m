@implementation NPKMockPeerPaymentAccountManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__NPKMockPeerPaymentAccountManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, block);
  return (id)sharedInstance_sharedInstance_6;
}

void __50__NPKMockPeerPaymentAccountManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance_6;
  sharedInstance_sharedInstance_6 = (uint64_t)v0;

}

- (NPKMockPeerPaymentAccountManager)initWithPeerPaymentService:(id)a3
{
  NPKMockPeerPaymentAccountManager *v3;
  NPKMockPeerPaymentAccountManager *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *accountQueue;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PKPeerPaymentAccount *mockAccount;
  objc_super v14;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)NPKMockPeerPaymentAccountManager;
  v3 = -[NPKPeerPaymentAccountManager initWithPeerPaymentService:](&v14, sel_initWithPeerPaymentService_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_balanceOffset = 0;
    v5 = dispatch_queue_create("com.apple.mockPeerPaymentAccountManager", 0);
    accountQueue = v4->_accountQueue;
    v4->_accountQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), 0x406900A3D70A3D71);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BE6EDC8]);
    v15[0] = CFSTR("currentBalance");
    v15[1] = CFSTR("currency");
    v16[0] = v7;
    v16[1] = CFSTR("USD");
    v15[2] = CFSTR("minimumTransferAmounts");
    v15[3] = CFSTR("maximumTransferAmounts");
    v16[2] = &unk_24D056748;
    v16[3] = &unk_24D056770;
    v15[4] = CFSTR("state");
    v16[4] = CFSTR("active");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithDictionary:lastUpdated:", v9, v10);
    mockAccount = v4->_mockAccount;
    v4->_mockAccount = (PKPeerPaymentAccount *)v11;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NPKMockPeerPaymentAccountManager;
  -[NPKMockPeerPaymentAccountManager dealloc](&v2, sel_dealloc);
}

- (void)_updateMockBalance
{
  unint64_t balanceOffset;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  PKPeerPaymentAccount *v9;
  PKPeerPaymentAccount *mockAccount;
  PKPeerPaymentAccount *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  balanceOffset = self->_balanceOffset;
  v4 = (balanceOffset + 100) % 0x12C;
  self->_balanceOffset = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), (double)balanceOffset + 200.02);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BE6EDC8]);
    v13[0] = CFSTR("currentBalance");
    v13[1] = CFSTR("currency");
    v14[0] = v5;
    v14[1] = CFSTR("USD");
    v13[2] = CFSTR("minimumTransferAmounts");
    v13[3] = CFSTR("maximumTransferAmounts");
    v14[2] = &unk_24D056798;
    v14[3] = &unk_24D0567C0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (PKPeerPaymentAccount *)objc_msgSend(v6, "initWithDictionary:lastUpdated:", v7, v8);
    mockAccount = self->_mockAccount;
    self->_mockAccount = v9;

  }
  else
  {
    v11 = self->_mockAccount;
    self->_mockAccount = 0;

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("NPKPeerPaymentAccountManagerAccountDidChangeNotification"), self);

}

- (id)account
{
  NSObject *accountQueue;
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
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__NPKMockPeerPaymentAccountManager_account__block_invoke;
  v5[3] = &unk_24CFE8318;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__NPKMockPeerPaymentAccountManager_account__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountQueue, 0);
  objc_storeStrong((id *)&self->_mockAccount, 0);
}

@end
