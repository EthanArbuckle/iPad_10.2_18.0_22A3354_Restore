@implementation BluetoothEndpointCollectionMarkEndpointForRemoval

void __BluetoothEndpointCollectionMarkEndpointForRemoval_block_invoke(uint64_t a1)
{
  const void **EntryForDescription;
  const void **v3;
  NSObject *v4;
  const void *Value;
  CFIndex v6;
  uint8_t buf[4];
  const void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = -1;
  EntryForDescription = (const void **)collection_findEntryForDescription(*(_QWORD *)(a1 + 40), *(const __CFDictionary **)(a1 + 48), &v6);
  if (EntryForDescription)
  {
    v3 = EntryForDescription;
    v4 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), CFSTR("DeviceID"));
      *(_DWORD *)buf = 138412290;
      v8 = Value;
      _os_log_impl(&dword_21B151000, v4, OS_LOG_TYPE_DEFAULT, "Removing %@", buf, 0xCu);
    }
    collection_removeEntry(*(_QWORD *)(a1 + 40), v3, v6);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    **(_BYTE **)(a1 + 56) = 1;
  }
}

@end
