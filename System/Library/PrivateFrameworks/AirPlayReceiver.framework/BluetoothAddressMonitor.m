@implementation BluetoothAddressMonitor

- (void)invalidate
{
  -[CBPeripheralManager removeObserver:forKeyPath:context:](self->_cbManager, "removeObserver:forKeyPath:context:", self, CFSTR("advertisingAddress"), 0);
}

- (void)dealloc
{
  NSObject *queue;
  OpaqueFigCFWeakReferenceHolder *systemInfoWeak;
  objc_super v5;

  self->_cbManager = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  systemInfoWeak = self->_systemInfoWeak;
  if (systemInfoWeak)
  {
    CFRelease(systemInfoWeak);
    self->_systemInfoWeak = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)BluetoothAddressMonitor;
  -[BluetoothAddressMonitor dealloc](&v5, sel_dealloc);
}

- (BluetoothAddressMonitor)initWithSystemInfo:(OpaqueAPReceiverSystemInfo *)a3 queue:(id)a4
{
  BluetoothAddressMonitor *v5;
  uint64_t v6;
  CBPeripheralManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BluetoothAddressMonitor;
  v5 = -[BluetoothAddressMonitor init](&v9, sel_init);
  if (v5)
  {
    v6 = FigCFWeakReferenceHolderCreateWithReferencedObject();
    v5->_systemInfoWeak = (OpaqueFigCFWeakReferenceHolder *)v6;
    if (v6 && (v5->_queue = (OS_dispatch_queue *)a4) != 0)
    {
      dispatch_retain((dispatch_object_t)a4);
      v7 = (CBPeripheralManager *)objc_opt_new();
      v5->_cbManager = v7;
      -[CBPeripheralManager addObserver:forKeyPath:options:context:](v7, "addObserver:forKeyPath:options:context:", v5, CFSTR("advertisingAddress"), 5, 0);
    }
    else
    {
      APSLogErrorAt();
      return 0;
    }
  }
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7;
  const void *v8;
  id v9;
  id v10;
  NSObject *queue;
  _QWORD v12[6];

  v7 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v7)
  {
    v8 = (const void *)v7;
    v9 = (id)-[CBPeripheralManager nonConnectableAdvertisingAddress](self->_cbManager, "nonConnectableAdvertisingAddress");
    if (v9)
    {
      CFRetain(v8);
      v10 = v9;
      queue = self->_queue;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __74__BluetoothAddressMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v12[3] = &unk_24E21FD90;
      v12[4] = v9;
      v12[5] = v8;
      dispatch_async(queue, v12);
    }

    CFRelease(v8);
  }
  else
  {

  }
}

void __74__BluetoothAddressMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFData *v3;
  const __CFData *v4;
  BOOL v5;
  const __CFData *v6;
  const void *v7;
  __CFDictionary *Mutable;
  __CFDictionary *v9;

  v3 = *(const __CFData **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(const __CFData **)(v2 + 720);
  if (v4 != v3)
  {
    v5 = !v3 || v4 == 0;
    if (v5 || !CFEqual(v4, v3))
    {
      if (gLogCategory_APReceiverSystemInfo <= 50
        && (gLogCategory_APReceiverSystemInfo != -1 || _LogCategory_Initialize()))
      {
        IsAppleInternalBuild();
        IsAppleInternalBuild();
        v6 = *(const __CFData **)(v2 + 720);
        if (v6)
          CFDataGetBytePtr(v6);
        IsAppleInternalBuild();
        IsAppleInternalBuild();
        if (v3)
          CFDataGetBytePtr(v3);
        LogPrintF();
      }
      v7 = *(const void **)(v2 + 720);
      if (v3)
        CFRetain(v3);
      *(_QWORD *)(v2 + 720) = v3;
      if (v7)
        CFRelease(v7);
      sysInfo_updateAdvertiserInfoAndNotify(v2, (uint64_t)CFSTR("BluetoothAddressChanged"));
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (Mutable)
      {
        v9 = Mutable;
        CFDictionarySetValue(Mutable, CFSTR("NonUrgent"), (const void *)*MEMORY[0x24BDBD270]);
        sysInfo_updateAdvertiserInfoAndNotify(v2, (uint64_t)CFSTR("AdvertisingParameterChanged"));
        CFRelease(v9);
      }
      else
      {
        APSLogErrorAt();
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));

}

@end
