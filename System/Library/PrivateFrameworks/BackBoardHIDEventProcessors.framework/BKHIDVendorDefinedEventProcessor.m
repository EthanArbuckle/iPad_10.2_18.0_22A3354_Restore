@implementation BKHIDVendorDefinedEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v7;
  id v8;
  __IOHIDEvent *v9;
  uint64_t IntegerValue;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = *a3;
  IntegerValue = IOHIDEventGetIntegerValue();
  v11 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 65292)
  {
    BKLogMotionEvents();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_5;
    *(_DWORD *)buf = 134218240;
    v26 = 65292;
    v27 = 2048;
    v28 = v11;
    v13 = "Motion event usagePage:0x%lX usage:%ld ";
  }
  else
  {
    BKLogHID();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_5;
    *(_DWORD *)buf = 134218240;
    v26 = IntegerValue;
    v27 = 2048;
    v28 = v11;
    v13 = "VendorDefinedEvent usagePage:0x%lX usage:%ld ";
  }
  _os_log_debug_impl(&dword_21B642000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 0x16u);
LABEL_5:

  objc_msgSend(v8, "destinationsForEvent:fromSender:", v9, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v8, "postEvent:toDestination:", v9, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

  return 1;
}

@end
