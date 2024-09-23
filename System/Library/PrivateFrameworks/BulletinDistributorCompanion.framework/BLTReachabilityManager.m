@implementation BLTReachabilityManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__BLTReachabilityManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance___sharedInstance_0;
}

void __40__BLTReachabilityManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v1;

}

- (BLTReachabilityManager)init
{
  BLTReachabilityManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *updateQueue;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 *p_internetReachable;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)BLTReachabilityManager;
  v2 = -[BLTReachabilityManager init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.bulletindistributor.reachability-updates", v3);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x24BE71A00], "sharedInstanceForIdentifier:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addDelegate:queue:", v2, v2->_updateQueue);

    objc_msgSend(MEMORY[0x24BE71A00], "sharedInstanceForIdentifier:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDelegate:queue:", v2, v2->_updateQueue);

    objc_msgSend(MEMORY[0x24BE71A00], "sharedInstanceForIdentifier:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isInternetReachable"))
    {
      v2->_internetReachable = 1;
      p_internetReachable = (unsigned __int8 *)&v2->_internetReachable;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE71A00], "sharedInstanceForIdentifier:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_internetReachable = objc_msgSend(v10, "isInternetReachable");
      p_internetReachable = (unsigned __int8 *)&v2->_internetReachable;

    }
    blt_ids_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BE71A00], "sharedInstanceForIdentifier:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE71A00], "sharedInstanceForIdentifier:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *p_internetReachable);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_2173D9000, v11, OS_LOG_TYPE_DEFAULT, "according to sPCInterfaceMonitorWWAN=%@ sPCInterfaceMonitorNonCellular=%@ internet reachability = %@", buf, 0x20u);

    }
  }
  return v2;
}

- (void)interfaceReachabilityChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = 1;
  objc_msgSend(MEMORY[0x24BE71A00], "sharedInstanceForIdentifier:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isInternetReachable") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE71A00], "sharedInstanceForIdentifier:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isInternetReachable");

  }
  if (self->_internetReachable != (_DWORD)v5)
  {
    blt_ids_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_internetReachable);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v4;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Internet reachability via %@ changed from %@ to %@", (uint8_t *)&v12, 0x20u);

    }
    -[BLTReachabilityManager setInternetReachable:](self, "setInternetReachable:", v5);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("BLTIDSDeviceConnectionStatusChangedNotification"), 0);

  }
}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  blt_ids_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v5, "linkQuality"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_2173D9000, v6, OS_LOG_TYPE_INFO, "interfaceLinkQualityChanged %@ previousLinkQuality %@ currentLinkQuality %@", (uint8_t *)&v9, 0x20u);

  }
}

- (void)interfaceRadioHotnessChanged:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  blt_ids_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isRadioHot"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_2173D9000, v4, OS_LOG_TYPE_INFO, "interfaceLinkQualityChanged %@ hotness %@", (uint8_t *)&v6, 0x16u);

  }
}

- (BOOL)isInternetReachable
{
  return self->_internetReachable;
}

- (void)setInternetReachable:(BOOL)a3
{
  self->_internetReachable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateQueue, 0);
}

@end
