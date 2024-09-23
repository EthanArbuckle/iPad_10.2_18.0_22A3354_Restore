@implementation CEUpgradeFlowManager

- (CEUpgradeFlowManager)init
{
  CEUpgradeFlowManager *v2;
  void *v3;
  objc_class *v4;
  ICQOffer *v5;
  ICQOffer *offer;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)CEUpgradeFlowManager;
  v2 = -[CEUpgradeFlowManager init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getICQOfferClass_softClass;
    v13 = getICQOfferClass_softClass;
    if (!getICQOfferClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getICQOfferClass_block_invoke;
      v9[3] = &unk_2509E7FC8;
      v9[4] = &v10;
      __getICQOfferClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (ICQOffer *)objc_alloc_init(v4);
    offer = v2->_offer;
    v2->_offer = v5;

  }
  return v2;
}

- (void)beginLiftUIUpgradeFlowWithPresenter:(id)a3 url:(id)a4
{
  ICQOffer *offer;
  id v7;
  id v8;
  ICQUpgradeFlowManager *upgradeFlowManager;
  ICQUpgradeFlowManager *v10;
  ICQUpgradeFlowManager *v11;
  id v12;

  if (a4)
  {
    offer = self->_offer;
    v7 = a4;
    v8 = a3;
    -[ICQOffer _updateRequestedServerUIURLWithURL:](offer, "_updateRequestedServerUIURLWithURL:", v7);
    upgradeFlowManager = self->_upgradeFlowManager;
    if (!upgradeFlowManager)
    {
      v10 = (ICQUpgradeFlowManager *)objc_msgSend(objc_alloc((Class)getICQUpgradeFlowManagerClass()), "initWithOffer:", self->_offer);
      v11 = self->_upgradeFlowManager;
      self->_upgradeFlowManager = v10;

      upgradeFlowManager = self->_upgradeFlowManager;
    }
    -[ICQUpgradeFlowManager setDelegate:](upgradeFlowManager, "setDelegate:", self);
    v12 = (id)objc_msgSend(objc_alloc((Class)getICQLinkClass()), "initWithAction:url:", 115, v7);

    -[ICQUpgradeFlowManager beginRemoteUpgradeFlowWithICQLink:presenter:](self->_upgradeFlowManager, "beginRemoteUpgradeFlowWithICQLink:presenter:", v12, v8);
  }
}

- (void)beginRemoteUIUpgradeFlowWithPresenter:(id)a3 url:(id)a4
{
  ICQOffer *offer;
  id v7;
  id v8;
  ICQUpgradeFlowManager *upgradeFlowManager;
  ICQUpgradeFlowManager *v10;
  ICQUpgradeFlowManager *v11;
  id v12;

  if (a4)
  {
    offer = self->_offer;
    v7 = a4;
    v8 = a3;
    -[ICQOffer _updateRequestedServerUIURLWithURL:](offer, "_updateRequestedServerUIURLWithURL:", v7);
    upgradeFlowManager = self->_upgradeFlowManager;
    if (!upgradeFlowManager)
    {
      v10 = (ICQUpgradeFlowManager *)objc_msgSend(objc_alloc((Class)getICQUpgradeFlowManagerClass()), "initWithOffer:", self->_offer);
      v11 = self->_upgradeFlowManager;
      self->_upgradeFlowManager = v10;

      upgradeFlowManager = self->_upgradeFlowManager;
    }
    -[ICQUpgradeFlowManager setDelegate:](upgradeFlowManager, "setDelegate:", self);
    v12 = (id)objc_msgSend(objc_alloc((Class)getICQLinkClass()), "initWithAction:url:", 112, v7);

    -[ICQUpgradeFlowManager beginRemoteUpgradeFlowWithICQLink:presenter:](self->_upgradeFlowManager, "beginRemoteUpgradeFlowWithICQLink:presenter:", v12, v8);
  }
}

- (void)beginAppleOneUpgradeFlowWithPresenter:(id)a3 url:(id)a4
{
  ICQOffer *offer;
  id v7;
  id v8;
  ICQUpgradeFlowManager *upgradeFlowManager;
  ICQUpgradeFlowManager *v10;
  ICQUpgradeFlowManager *v11;
  id v12;

  if (a4)
  {
    offer = self->_offer;
    v7 = a4;
    v8 = a3;
    -[ICQOffer _updateRequestedServerUIURLWithURL:](offer, "_updateRequestedServerUIURLWithURL:", v7);
    upgradeFlowManager = self->_upgradeFlowManager;
    if (!upgradeFlowManager)
    {
      v10 = (ICQUpgradeFlowManager *)objc_msgSend(objc_alloc((Class)getICQUpgradeFlowManagerClass()), "initWithOffer:", self->_offer);
      v11 = self->_upgradeFlowManager;
      self->_upgradeFlowManager = v10;

      upgradeFlowManager = self->_upgradeFlowManager;
    }
    -[ICQUpgradeFlowManager setDelegate:](upgradeFlowManager, "setDelegate:", self);
    v12 = (id)objc_msgSend(objc_alloc((Class)getICQLinkClass()), "initWithAction:url:", 122, v7);

    -[ICQUpgradeFlowManager beginRemoteUpgradeFlowWithICQLink:presenter:](self->_upgradeFlowManager, "beginRemoteUpgradeFlowWithICQLink:presenter:", v12, v8);
  }
}

- (void)upgradeFlowManager:(id)a3 didPresentViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CEUpgradeFlowManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "upgradeFlowManager:didPresentViewController:", self, v5);

}

- (void)upgradeFlowManagerDidFail:(id)a3 error:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CEUpgradeFlowManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "upgradeFlowManagerDidFail:error:", self, v5);

}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v4;

  -[CEUpgradeFlowManager delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "upgradeFlowManagerDidComplete:", self);

}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v4;

  -[CEUpgradeFlowManager delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "upgradeFlowManagerDidCancel:", self);

}

- (CEUpgradeFlowManagerDelegate)delegate
{
  return (CEUpgradeFlowManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
  objc_storeStrong((id *)&self->_offer, a3);
}

- (ICQUpgradeFlowManager)upgradeFlowManager
{
  return self->_upgradeFlowManager;
}

- (void)setUpgradeFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_upgradeFlowManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
