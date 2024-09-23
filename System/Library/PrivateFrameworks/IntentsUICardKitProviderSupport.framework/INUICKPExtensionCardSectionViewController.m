@implementation INUICKPExtensionCardSectionViewController

- (void)desiresInteractivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INUICKPSynchronousRemoteViewController remoteViewController](self, "remoteViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "desiresInteractivity:", v4);

}

- (void)remoteViewController:(id)a3 requestsHandlingOfIntent:(id)a4
{
  id v5;
  id v6;

  -[INUICKPExtensionCardSectionViewController cardSectionViewControllingDelegate](self, "cardSectionViewControllingDelegate", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BE15510]);
  objc_msgSend(v6, "performCommand:forViewController:", v5, self);

}

- (void)remoteViewControllerWillBeginEditing:(id)a3
{
  id v4;
  id v5;

  -[INUICKPExtensionCardSectionViewController cardSectionViewControllingDelegate](self, "cardSectionViewControllingDelegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BE154D0]);
  objc_msgSend(v5, "performCommand:forViewController:", v4, self);

}

- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id touchDeliveryPolicyAssertion;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[INUICKPSynchronousRemoteViewController remoteViewController](self, "remoteViewController", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    switch(a3)
    {
      case 3uLL:
        -[INUICKPSynchronousRemoteViewController remoteViewController](self, "remoteViewController");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "requestCancellation");

        break;
      case 4uLL:
        -[INUICKPSynchronousRemoteViewController remoteViewController](self, "remoteViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v8, "disconnect");

        -[INUICKPSynchronousRemoteViewController setRemoteViewController:](self, "setRemoteViewController:", 0);
        break;
      case 5uLL:
        -[INUICKPSynchronousRemoteViewController remoteViewController](self, "remoteViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_cancelTouchesForCurrentEventInHostedContent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        touchDeliveryPolicyAssertion = self->_touchDeliveryPolicyAssertion;
        self->_touchDeliveryPolicyAssertion = v11;

        v13 = (void *)*MEMORY[0x24BE15490];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
        {
          v14 = v13;
          -[INUICKPSynchronousRemoteViewController remoteViewController](self, "remoteViewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = self->_touchDeliveryPolicyAssertion;
          *(_DWORD *)buf = 138412546;
          v24 = v15;
          v25 = 2112;
          v26 = v16;
          _os_log_impl(&dword_222C18000, v14, OS_LOG_TYPE_INFO, "CRKEventScrollingStarted, cancelling touches for %@ with assertion %@", buf, 0x16u);

        }
        break;
      case 6uLL:
        v17 = (void *)*MEMORY[0x24BE15490];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
        {
          v18 = v17;
          -[INUICKPSynchronousRemoteViewController remoteViewController](self, "remoteViewController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = self->_touchDeliveryPolicyAssertion;
          *(_DWORD *)buf = 138412546;
          v24 = v19;
          v25 = 2112;
          v26 = v20;
          _os_log_impl(&dword_222C18000, v18, OS_LOG_TYPE_INFO, "CRKEventScrollingEnded, resuming touches for %@ by invalidating assertion %@", buf, 0x16u);

        }
        objc_msgSend(self->_touchDeliveryPolicyAssertion, "invalidate");
        v21 = self->_touchDeliveryPolicyAssertion;
        self->_touchDeliveryPolicyAssertion = 0;

        break;
      default:
        return;
    }
  }
}

- (CRKCardSectionViewControllingDelegate)cardSectionViewControllingDelegate
{
  return (CRKCardSectionViewControllingDelegate *)objc_loadWeakRetained((id *)&self->_cardSectionViewControllingDelegate);
}

- (void)setCardSectionViewControllingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cardSectionViewControllingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cardSectionViewControllingDelegate);
  objc_storeStrong(&self->_touchDeliveryPolicyAssertion, 0);
}

@end
