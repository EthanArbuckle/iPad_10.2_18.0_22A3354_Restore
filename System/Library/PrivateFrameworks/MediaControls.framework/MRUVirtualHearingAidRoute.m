@implementation MRUVirtualHearingAidRoute

- (MRUVirtualHearingAidRoute)initWithHearingDeviceName:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MRUVirtualHearingAidDevice *v11;
  void *v12;
  void *v13;
  MRUVirtualHearingAidRoute *v14;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (void *)MEMORY[0x1E0CB3A28];
  v6 = a3;
  objc_msgSend(v5, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-tlea"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C4F0]), "initWithDeviceType:deviceSubtype:uid:name:", 2, 9, v9, v6);
  v11 = -[MRUVirtualHearingAidDevice initWithDeviceDescription:]([MRUVirtualHearingAidDevice alloc], "initWithDeviceDescription:", v10);
  objc_msgSend(MEMORY[0x1E0D2F9D0], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)MRUVirtualHearingAidRoute;
  v14 = -[MPAVOutputDeviceRoute initWithOutputDevices:](&v16, sel_initWithOutputDevices_, v13);

  return v14;
}

- (void)connect
{
  NSObject *v3;
  void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MPAVOutputDeviceRoute outputDevice](self, "outputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "MRUVirtualHearingAidRoute connect Hearing Aid device: %@", (uint8_t *)&v7, 0xCu);

  }
  self->_isConnecting = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0D2F9C8], 0, 0, 1u);
}

- (void)disconnect
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MPAVOutputDeviceRoute outputDevice](self, "outputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "MRUVirtualHearingAidRoute disconnect Hearing Aid device: %@", (uint8_t *)&v6, 0xCu);

  }
  self->_isConnecting = 0;
  objc_msgSend((id)objc_opt_class(), "disconnect");
}

+ (void)disconnect
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  MCLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AA991000, v2, OS_LOG_TYPE_DEFAULT, "MRUVirtualHearingAidRoute disconnect Hearing Aid", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D2F9D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelHearingAidConnectionRequest");

}

- (void)hearingAidConnectionDidChange:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  self->_isConnecting = 0;
  MCLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "MRUVirtualHearingAidRoute hearingAidConnectionDidChange connected: %@", buf, 0xCu);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MRUVirtualHearingAidRoute_hearingAidConnectionDidChange___block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __59__MRUVirtualHearingAidRoute_hearingAidConnectionDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "hearingAidDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "hearingAidDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hearingAidConnectionDidChange");

  }
}

- (BOOL)isConnecting
{
  return self->_isConnecting;
}

- (MRUVirtualHearingAidRouteObserver)hearingAidDelegate
{
  return (MRUVirtualHearingAidRouteObserver *)objc_loadWeakRetained((id *)&self->_hearingAidDelegate);
}

- (void)setHearingAidDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hearingAidDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hearingAidDelegate);
}

@end
