@implementation HMAccessoryManager

- (HMAccessoryManager)init
{
  HMAccessoryManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  void *v6;
  uint64_t v7;
  BluetoothManager *bluetoothManager;
  HMAccessoryManager *v9;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HMAccessoryManager;
  v2 = -[HMAccessoryManager init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("HearingModeAccessoryManager", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    if (gLogCategory_HMAccessoryManager <= 30
      && (gLogCategory_HMAccessoryManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "connectedDevices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance", v11);
    v7 = objc_claimAutoreleasedReturnValue();
    bluetoothManager = v2->_bluetoothManager;
    v2->_bluetoothManager = (BluetoothManager *)v7;

    v9 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPeripheral, 0);
  objc_storeStrong((id *)&self->_selectedDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

@end
