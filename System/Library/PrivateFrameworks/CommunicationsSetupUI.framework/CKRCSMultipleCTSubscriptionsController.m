@implementation CKRCSMultipleCTSubscriptionsController

- (CKRCSMultipleCTSubscriptionsController)init
{
  CKRCSMultipleCTSubscriptionsController *v2;
  CKLazuliEnablementManager *v3;
  CKLazuliEnablementProtocol *lazuliEnablementManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKRCSMultipleCTSubscriptionsController;
  v2 = -[CKRCSMultipleCTSubscriptionsController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CKLazuliEnablementManager);
    lazuliEnablementManager = v2->_lazuliEnablementManager;
    v2->_lazuliEnablementManager = (CKLazuliEnablementProtocol *)v3;

  }
  return v2;
}

- (id)isEnabledForSubscription:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKRCSMultipleCTSubscriptionsController lazuliEnablementManager](self, "lazuliEnablementManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isRCSEnabled:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setEnabledForSubscription:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[CKRCSMultipleCTSubscriptionsController lazuliEnablementManager](self, "lazuliEnablementManager");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setRCSEnabled:specifier:](v8, "setRCSEnabled:specifier:", v6, v7);
  }
  else
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_4;
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_INFO, "Ignoring attempt to set RCS enablement to NULL", v9, 2u);
    }
  }

LABEL_4:
}

- (CKLazuliEnablementProtocol)lazuliEnablementManager
{
  return self->_lazuliEnablementManager;
}

- (void)setLazuliEnablementManager:(id)a3
{
  objc_storeStrong((id *)&self->_lazuliEnablementManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazuliEnablementManager, 0);
}

@end
