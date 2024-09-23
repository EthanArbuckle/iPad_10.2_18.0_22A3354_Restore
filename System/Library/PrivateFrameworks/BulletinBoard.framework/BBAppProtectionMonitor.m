@implementation BBAppProtectionMonitor

- (BBAppProtectionMonitor)initWithDelegate:(id)a3
{
  id v4;
  BBAppProtectionMonitor *v5;
  void *v6;
  uint64_t v7;
  APSubjectMonitorSubscription *subscription;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BBAppProtectionMonitor;
  v5 = -[BBAppProtectionMonitor init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE04330], "subjectMonitorRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addMonitor:subjectMask:", v5, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    subscription = v5->_subscription;
    v5->_subscription = (APSubjectMonitorSubscription *)v7;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[APSubjectMonitorSubscription invalidate](self->_subscription, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BBAppProtectionMonitor;
  -[BBAppProtectionMonitor dealloc](&v3, sel_dealloc);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id WeakRetained;
  id v6;

  objc_msgSend(a3, "bs_compactMap:", &__block_literal_global_14, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "protectionStateChangedForBundleIdentifiers:", v6);

}

id __71__BBAppProtectionMonitor_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isApplicationLocked:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  return v4;
}

- (BOOL)isApplicationHidden:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  return v4;
}

- (BOOL)shouldHideContentPreview:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isLocked");

  return v4;
}

- (BBAppProtectionMonitorDelegate)delegate
{
  return (BBAppProtectionMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (APSubjectMonitorSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
