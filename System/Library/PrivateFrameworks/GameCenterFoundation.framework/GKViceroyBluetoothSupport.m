@implementation GKViceroyBluetoothSupport

+ (int)status
{
  return objc_msgSend(MEMORY[0x1E0D25C58], "bluetoothStatus");
}

+ (void)turnOnAndObserveWith:(id)a3 selector:(SEL)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a3;
  objc_msgSend(v5, "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", v6, a4, *MEMORY[0x1E0D25B70], 0);

  objc_msgSend(MEMORY[0x1E0D25C58], "turnBluetoothOn");
}

@end
