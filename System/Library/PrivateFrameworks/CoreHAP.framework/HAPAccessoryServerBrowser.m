@implementation HAPAccessoryServerBrowser

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)registerPairedAccessoryWithIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HAPAccessoryServerBrowser pairedAccessoryIdentifiers](self, "pairedAccessoryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableSet)pairedAccessoryIdentifiers
{
  return self->_pairedAccessoryIdentifiers;
}

- (HAPAccessoryServerBrowser)initWithQueue:(id)a3
{
  NSObject *v3;
  NSObject *v5;
  HAPAccessoryServerBrowser *v6;
  dispatch_queue_t v7;
  uint64_t v8;
  HAPKeyStore *keyStore;
  uint64_t v10;
  NSMutableSet *pairedAccessoryIdentifiers;
  uint64_t v12;
  HAPMetricsDispatcher *logEvent;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HAPAccessoryServerBrowser;
  v6 = -[HAPAccessoryServerBrowser init](&v15, sel_init);
  if (v6)
  {
    v7 = v5;
    if (!v5)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v3 = objc_claimAutoreleasedReturnValue();
      v7 = dispatch_queue_create("com.apple.HAPAccessoryBrowser", v3);
    }
    objc_storeStrong((id *)&v6->_workQueue, v7);
    if (!v5)
    {

    }
    +[HAPSystemKeychainStore systemStore](HAPSystemKeychainStore, "systemStore");
    v8 = objc_claimAutoreleasedReturnValue();
    keyStore = v6->_keyStore;
    v6->_keyStore = (HAPKeyStore *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    pairedAccessoryIdentifiers = v6->_pairedAccessoryIdentifiers;
    v6->_pairedAccessoryIdentifiers = (NSMutableSet *)v10;

    v6->_remoteBrowsingEnabled = 0;
    +[HAPMetricsDispatcher sharedInstance](HAPMetricsDispatcher, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    logEvent = v6->_logEvent;
    v6->_logEvent = (HAPMetricsDispatcher *)v12;

  }
  return v6;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)startDiscoveringAccessoryServers
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)stopDiscoveringAccessoryServers
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)setRemoteBrowsingEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_remoteBrowsingEnabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)remoteBrowsingEnabled
{
  HAPAccessoryServerBrowser *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_remoteBrowsingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  v13 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (void)deRegisterAccessoryWithIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HAPAccessoryServerBrowser pairedAccessoryIdentifiers](self, "pairedAccessoryIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)resetPairedAccessories
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HAPAccessoryServerBrowser pairedAccessoryIdentifiers](self, "pairedAccessoryIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isPaired:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  char v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HAPAccessoryServerBrowser pairedAccessoryIdentifiers](self, "pairedAccessoryIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)indicateNotificationFromServer:(id)a3 notifyType:(unint64_t)a4 withDictionary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99DA0];
  v10 = *MEMORY[0x1E0C99768];
  v11 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v13, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (void)startConfirmingPairedAccessoryReachability
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)stopConfirmingPairedAccessoryReachability
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)recommendBrowserReset
{
  return 0;
}

- (id)logIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void)setPairedAccessoryIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_pairedAccessoryIdentifiers, a3);
}

- (HAPKeyStore)keyStore
{
  return self->_keyStore;
}

- (void)setKeyStore:(id)a3
{
  objc_storeStrong((id *)&self->_keyStore, a3);
}

- (HAPMetricsDispatcher)logEvent
{
  return self->_logEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEvent, 0);
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_pairedAccessoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
