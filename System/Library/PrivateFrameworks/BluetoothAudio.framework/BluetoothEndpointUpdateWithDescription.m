@implementation BluetoothEndpointUpdateWithDescription

void __BluetoothEndpointUpdateWithDescription_block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  const __CFAllocator *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v2, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v12, (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) == 0)
        {
          CFAutorelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 64));
          v16 = BluetoothEndpointManagerLogComponent;
          if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_DEFAULT))
          {
            v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
            *(_DWORD *)buf = 138412546;
            v24 = v17;
            v25 = 2112;
            v26 = v3;
            _os_log_impl(&dword_21B151000, v16, OS_LOG_TYPE_DEFAULT, "Battery Levels %@->%@", buf, 0x16u);
          }
          v18 = CFGetAllocator(*(CFTypeRef *)(a1 + 48));
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = CFDictionaryCreateCopy(v18, *(CFDictionaryRef *)(a1 + 40));
          **(_BYTE **)(a1 + 56) = 1;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

}

void __BluetoothEndpointUpdateWithDescription_block_invoke_40(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
