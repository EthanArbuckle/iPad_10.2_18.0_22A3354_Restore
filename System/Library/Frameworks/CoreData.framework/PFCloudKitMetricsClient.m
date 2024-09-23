@implementation PFCloudKitMetricsClient

- (void)logMetric:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (void *)MEMORY[0x18D76B4E4]();
    v4 = (void *)objc_msgSend(a2, "name");
    v5 = (void *)objc_msgSend(a2, "payload");
    if (!objc_msgSend(v4, "length") || !objc_msgSend(v5, "count"))
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid metric sent to PFCloudKitMetricsClient: %@");
      _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)a2);
      v13 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = a2;
        _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Invalid metric sent to PFCloudKitMetricsClient: %@", buf, 0xCu);
      }
    }
    softLinkAnalyticsSendEvent[0]();
    objc_autoreleasePoolPop(v3);
  }
}

@end
