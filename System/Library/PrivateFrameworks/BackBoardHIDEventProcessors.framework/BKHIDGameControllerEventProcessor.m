@implementation BKHIDGameControllerEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *Copy;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  _BKHIDNoteUserEventOccurredOnDisplay();
  BKLogIdleTimer();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_21B642000, v9, OS_LOG_TYPE_DEBUG, "game controller event occurred; notifying user event timer",
      buf,
      2u);
  }

  objc_msgSend(v8, "destinationsForEvent:fromSender:", *a3, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        Copy = (const void *)IOHIDEventCreateCopy();
        objc_msgSend(v7, "eventSource");
        BKSHIDEventSetSimpleDeliveryInfo();
        objc_msgSend(v8, "postEvent:toDestination:", Copy, v15);
        CFRelease(Copy);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v12);
  }

  return 1;
}

@end
