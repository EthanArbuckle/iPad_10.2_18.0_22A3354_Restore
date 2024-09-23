@implementation AFPairedBluetoothDevicesObserver

- (AFPairedBluetoothDevicesObserver)init
{
  AFPairedBluetoothDevicesObserver *v2;
  AFPairedBluetoothDevicesObserver *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AFPairedBluetoothDevicesObserver;
  v2 = -[AFPairedBluetoothDevicesObserver init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_pairedDevicesLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getBluetoothPairedStatusChangedNotification();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_updatePairedDevices_, v5, 0);

    -[AFPairedBluetoothDevicesObserver updatePairedDevices:](v3, "updatePairedDevices:", 0);
  }
  return v3;
}

- (void)updatePairedDevices:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *pairedDevices;

  objc_msgSend(getBluetoothManagerClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairedDevices");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_pairedDevicesLock);
  pairedDevices = self->_pairedDevices;
  self->_pairedDevices = v5;

  os_unfair_lock_unlock(&self->_pairedDevicesLock);
}

- (id)pairedBluetoothDevices
{
  os_unfair_lock_s *p_pairedDevicesLock;
  NSArray *v4;

  p_pairedDevicesLock = &self->_pairedDevicesLock;
  os_unfair_lock_lock(&self->_pairedDevicesLock);
  v4 = self->_pairedDevices;
  os_unfair_lock_unlock(p_pairedDevicesLock);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDevices, 0);
}

+ (id)sharedObserver
{
  if (sharedObserver_onceToken_40026 != -1)
    dispatch_once(&sharedObserver_onceToken_40026, &__block_literal_global_381);
  return (id)sharedObserver_sBTObserver;
}

void __50__AFPairedBluetoothDevicesObserver_sharedObserver__block_invoke()
{
  AFPairedBluetoothDevicesObserver *v0;
  void *v1;

  v0 = objc_alloc_init(AFPairedBluetoothDevicesObserver);
  v1 = (void *)sharedObserver_sBTObserver;
  sharedObserver_sBTObserver = (uint64_t)v0;

}

@end
