@implementation CSSiriBluetoothManager

- (id)_init
{
  CSSiriBluetoothManager *v2;
  CSSiriMobileBluetoothDeviceDataSource *v3;
  CSSiriMobileBluetoothDeviceDataSource *dataSource;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSSiriBluetoothManager;
  v2 = -[CSSiriBluetoothManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CSSiriMobileBluetoothDeviceDataSource);
    dataSource = v2->_dataSource;
    v2->_dataSource = v3;

  }
  return v2;
}

- (void)prewarmDeviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
    if (v5)
      -[CSSiriBluetoothManager deviceWithUID:](self, "deviceWithUID:", v5);
    else
      -[CSSiriBluetoothManager deviceWithAddress:](self, "deviceWithAddress:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prewarm");

    v4 = v7;
  }

}

- (id)deviceWithAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if ((unint64_t)objc_msgSend(v4, "length") >= 0x12)
  {
    objc_msgSend(v4, "substringToIndex:", 17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CSSiriMobileBluetoothDeviceDataSource deviceWithAddress:](self->_dataSource, "deviceWithAddress:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)deviceWithUID:(id)a3
{
  return -[CSSiriMobileBluetoothDeviceDataSource deviceWithUID:](self->_dataSource, "deviceWithUID:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_17355 != -1)
    dispatch_once(&sharedInstance_onceToken_17355, &__block_literal_global_17356);
  return (id)sharedInstance_sSharedInstance_17357;
}

void __40__CSSiriBluetoothManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CSSiriBluetoothManager _init]([CSSiriBluetoothManager alloc], "_init");
  v1 = (void *)sharedInstance_sSharedInstance_17357;
  sharedInstance_sSharedInstance_17357 = (uint64_t)v0;

}

@end
