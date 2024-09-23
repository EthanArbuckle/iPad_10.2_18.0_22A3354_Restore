@implementation SetDiscoveryMode

void __manager_SetDiscoveryMode_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const void *v4;
  int v5;
  const void *v6;
  NSObject *v7;
  CFTypeRef v8;
  const void *v9;
  const void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[4];
  int8x16_t v14;
  _QWORD v15[4];
  int8x16_t v16;
  char v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = BluetoothEndpointManagerLogComponent;
  if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v19 = v3;
    _os_log_impl(&dword_21B151000, v2, OS_LOG_TYPE_DEFAULT, "Discovery Mode set to %{public}@", buf, 0xCu);
  }
  CFRetain(*(CFTypeRef *)(a1 + 40));
  v4 = (const void *)*MEMORY[0x24BDC0E68];
  v5 = CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)*MEMORY[0x24BDC0E68]);
  v6 = *(const void **)(*(_QWORD *)(a1 + 48) + 24);
  if (v5)
  {
    if (v6)
      CFRelease(v6);
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24) = CFRetain(v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __manager_SetDiscoveryMode_block_invoke_13;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    v14 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    dispatch_async(v7, block);

  }
  else
  {
    v8 = CFRetain(v6);
    v9 = *(const void **)(*(_QWORD *)(a1 + 48) + 24);
    if (v9)
      CFRelease(v9);
    v10 = (const void *)*MEMORY[0x24BDC0E58];
    if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)*MEMORY[0x24BDC0E58]))
    {
      CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)*MEMORY[0x24BDC0E70]);
      v10 = (const void *)*MEMORY[0x24BDC0E60];
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24) = CFRetain(v10);
    CFEqual(v8, v4);
    if (CFEqual(v8, *(CFTypeRef *)(*(_QWORD *)(a1 + 48) + 24)))
    {
      v11 = BluetoothEndpointManagerLogComponent;
      if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B151000, v11, OS_LOG_TYPE_DEFAULT, "Not changing scan parameters", buf, 2u);
      }
      CFRelease(*(CFTypeRef *)(a1 + 40));
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "queue");
      v12 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __manager_SetDiscoveryMode_block_invoke_11;
      v15[3] = &__block_descriptor_49_e5_v8__0l;
      v17 = 0;
      v16 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
      dispatch_async(v12, v15);

    }
    CFRelease(v8);
  }
  if (!CFEqual(*(CFTypeRef *)(a1 + 32), v4))
  {
    if (BluetoothEndpointCollectionGetCount(*(NSObject ***)(*(_QWORD *)(a1 + 48) + 32)))
      manager_postEndpointsChangedNotification(*(const void **)(a1 + 40));
  }
}

void __manager_SetDiscoveryMode_block_invoke_11(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "startLEScanning:", *(unsigned __int8 *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __manager_SetDiscoveryMode_block_invoke_13(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "stopLEScanning");
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
