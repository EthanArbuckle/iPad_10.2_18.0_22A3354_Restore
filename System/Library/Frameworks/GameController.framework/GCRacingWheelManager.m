@implementation GCRacingWheelManager

void __29___GCRacingWheelManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CFMutableDictionaryRef v5;
  IONotificationPort *v6;
  const __CFDictionary *v7;
  NSObject *v8;
  _QWORD *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  io_iterator_t v13;
  io_iterator_t notification;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = IOServiceMatching("IOHIDDevice");
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  notification = 0;
  v6 = *(IONotificationPort **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = v4;
  if (!IOServiceAddMatchingNotification(v6, "IOServiceFirstMatch", v7, (IOServiceMatchingCallback)DeviceMatched, *(void **)(a1 + 32), &notification))
  {
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), (const void *)notification);
    v9 = *(_QWORD **)(a1 + 32);
    v10 = v9[1];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __29___GCRacingWheelManager_init__block_invoke_58;
    v11[3] = &unk_24D2B2D08;
    v12 = v9;
    v13 = notification;
    dispatch_async(v10, v11);
    IOObjectRelease(notification);
    v8 = v12;
LABEL_6:

    goto LABEL_7;
  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __29___GCRacingWheelManager_init__block_invoke_cold_1((uint64_t)v3, v8);
    goto LABEL_6;
  }
LABEL_7:

}

void __29___GCRacingWheelManager_init__block_invoke_58(uint64_t a1)
{
  DeviceMatched(*(void **)(a1 + 32), *(_DWORD *)(a1 + 40));
}

void __29___GCRacingWheelManager_init__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215181000, a2, OS_LOG_TYPE_ERROR, "Failed to create notification for matching: %@", (uint8_t *)&v2, 0xCu);
}

@end
