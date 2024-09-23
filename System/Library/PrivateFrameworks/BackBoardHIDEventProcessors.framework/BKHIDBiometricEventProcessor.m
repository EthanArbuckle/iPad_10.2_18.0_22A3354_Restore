@implementation BKHIDBiometricEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v6;
  id v7;
  unsigned int IntegerValue;
  const void *Copy;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  unsigned int v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a5;
  IntegerValue = IOHIDEventGetIntegerValue();
  if (IntegerValue > 3)
  {
    BKLogHID();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v22 = IntegerValue;
      _os_log_error_impl(&dword_21B642000, v10, OS_LOG_TYPE_ERROR, "Dropping unknown biometric event type %d ", buf, 8u);
    }
  }
  else
  {
    Copy = (const void *)IOHIDEventCreateCopy();
    objc_msgSend(v7, "destinationsForEvent:fromSender:", Copy, v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
          objc_msgSend(v6, "eventSource");
          BKSHIDEventSetSimpleDeliveryInfo();
          objc_msgSend(v7, "postEvent:toDestination:", Copy, v15);
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v12);
    }
    CFRelease(Copy);
  }

  return 1;
}

@end
