@implementation BKDeviceManager

+ (void)initialize
{
  if (initializeOSLog_onceToken != -1)
    dispatch_once(&initializeOSLog_onceToken, &__block_literal_global_1);
}

+ (id)availableDevices
{
  return +[BKDeviceManager availableDevicesWithFailure:](BKDeviceManager, "availableDevicesWithFailure:", 0);
}

+ (id)availableDevicesWithFailure:(BOOL *)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL *v8;
  void *v9;
  NSObject *v10;
  BOOL v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v4 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v5, OS_LOG_TYPE_DEFAULT, "BKDeviceManager::availableDevicesWithFailure\n", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (+[BKDeviceTouchID deviceAvailableWithFailure:](BKDeviceTouchID, "deviceAvailableWithFailure:", &v12))
  {
    +[BKDeviceDescriptor deviceDescriptorForType:](BKDeviceDescriptor, "deviceDescriptorForType:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  if (v12)
    v8 = 0;
  else
    v8 = &v12;
  if (+[BKDevicePearl deviceAvailableWithFailure:](BKDevicePearl, "deviceAvailableWithFailure:", v8))
  {
    +[BKDeviceDescriptor deviceDescriptorForType:](BKDeviceDescriptor, "deviceDescriptorForType:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  if (a3)
    *a3 = v12;
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = v4;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 1024;
    v16 = v12;
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKDeviceManager::availableDevicesWithFailure -> %@ (%u)\n", buf, 0x12u);
  }
  objc_msgSend(v6, "count");
  kdebug_trace();
  return v6;
}

@end
