@implementation AXSSMotionTrackingUtilities

+ (NSDictionary)axss_xPositionElementMatchingDict
{
  if (axss_xPositionElementMatchingDict_onceToken != -1)
    dispatch_once(&axss_xPositionElementMatchingDict_onceToken, &__block_literal_global_10);
  return (NSDictionary *)(id)axss_xPositionElementMatchingDict_s_XPositionElementMatchingDict;
}

void __64__AXSSMotionTrackingUtilities_axss_xPositionElementMatchingDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UsagePage");
  v2[1] = CFSTR("Usage");
  v3[0] = &unk_1E5FA8AD0;
  v3[1] = &unk_1E5FA8AE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)axss_xPositionElementMatchingDict_s_XPositionElementMatchingDict;
  axss_xPositionElementMatchingDict_s_XPositionElementMatchingDict = v0;

}

+ (NSDictionary)axss_yPositionElementMatchingDict
{
  if (axss_yPositionElementMatchingDict_onceToken != -1)
    dispatch_once(&axss_yPositionElementMatchingDict_onceToken, &__block_literal_global_6);
  return (NSDictionary *)(id)axss_yPositionElementMatchingDict_s_YPositionElementMatchingDict;
}

void __64__AXSSMotionTrackingUtilities_axss_yPositionElementMatchingDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UsagePage");
  v2[1] = CFSTR("Usage");
  v3[0] = &unk_1E5FA8AD0;
  v3[1] = &unk_1E5FA8B00;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)axss_yPositionElementMatchingDict_s_YPositionElementMatchingDict;
  axss_yPositionElementMatchingDict_s_YPositionElementMatchingDict = v0;

}

+ (NSDictionary)axss_statusElementMatchingDict
{
  if (axss_statusElementMatchingDict_onceToken != -1)
    dispatch_once(&axss_statusElementMatchingDict_onceToken, &__block_literal_global_8);
  return (NSDictionary *)(id)axss_statusElementMatchingDict_s_YPositionElementMatchingDict;
}

void __61__AXSSMotionTrackingUtilities_axss_statusElementMatchingDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UsagePage");
  v2[1] = CFSTR("Usage");
  v3[0] = &unk_1E5FA8AD0;
  v3[1] = &unk_1E5FA8B18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)axss_statusElementMatchingDict_s_YPositionElementMatchingDict;
  axss_statusElementMatchingDict_s_YPositionElementMatchingDict = v0;

}

+ (NSDictionary)axss_frequencyElementMatchingDict
{
  if (axss_frequencyElementMatchingDict_onceToken != -1)
    dispatch_once(&axss_frequencyElementMatchingDict_onceToken, &__block_literal_global_10);
  return (NSDictionary *)(id)axss_frequencyElementMatchingDict_s_YPositionElementMatchingDict;
}

void __64__AXSSMotionTrackingUtilities_axss_frequencyElementMatchingDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UsagePage");
  v2[1] = CFSTR("Usage");
  v3[0] = &unk_1E5FA8AD0;
  v3[1] = &unk_1E5FA8B30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)axss_frequencyElementMatchingDict_s_YPositionElementMatchingDict;
  axss_frequencyElementMatchingDict_s_YPositionElementMatchingDict = v0;

}

+ (BOOL)axss_HIDDeviceIsMFiAuthenticated:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "propertyForKey:", CFSTR("Authenticated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "BOOLValue") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend((id)objc_opt_class(), "_axss_iAPInterfaceExistsForHIDDeviceService:", objc_msgSend(v3, "service"));

  return v5;
}

+ (BOOL)_axss_iAPInterfaceExistsForHIDDeviceService:(unsigned int)a3
{
  NSObject *v3;
  uint64_t v4;
  BOOLean_t v5;
  BOOL v6;
  NSObject *v7;
  BOOL v8;
  io_object_t v10;
  io_registry_entry_t v11;
  const __CFAllocator *v12;
  kern_return_t v13;
  CFMutableDictionaryRef v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  CFMutableDictionaryRef v21;
  io_iterator_t object;
  io_iterator_t iterator;

  iterator = 0;
  if (MEMORY[0x1B5DF9440](*(_QWORD *)&a3, "IOService", 3, &iterator))
  {
    AXSSLogForCategory(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[AXSSMotionTrackingUtilities _axss_iAPInterfaceExistsForHIDDeviceService:].cold.1();

    return 0;
  }
  if (!IOIteratorIsValid(iterator))
    MEMORY[0x1B5DF9410](iterator);
  v4 = IOIteratorNext(iterator);
  if ((_DWORD)v4)
  {
    do
    {
      v5 = IOObjectConformsTo(v4, "IOUSBDevice");
      v6 = v5 == 0;
      if (v5)
        break;
      IOObjectRelease(v4);
      v4 = IOIteratorNext(iterator);
    }
    while ((_DWORD)v4);
  }
  else
  {
    v6 = 1;
  }
  if (iterator)
    IOObjectRelease(iterator);
  if (v6)
    return 0;
  object = 0;
  if (MEMORY[0x1B5DF9440](v4, "IOService", 1, &object))
  {
    AXSSLogForCategory(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[AXSSMotionTrackingUtilities _axss_iAPInterfaceExistsForHIDDeviceService:].cold.1();

    return 0;
  }
  if (!IOIteratorIsValid(object))
    MEMORY[0x1B5DF9410](object);
  IOObjectRelease(v4);
  v10 = IOIteratorNext(object);
  v8 = v10 != 0;
  if (v10)
  {
    v11 = v10;
    v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    while (1)
    {
      v21 = 0;
      v13 = IORegistryEntryCreateCFProperties(v11, &v21, v12, 0);
      IOObjectRelease(v11);
      v14 = v21;
      if (v21)
      {
        if (!v13)
        {
          -[__CFDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("bInterfaceClass"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedIntValue");

          -[__CFDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("bInterfaceSubClass"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "unsignedIntValue");

          -[__CFDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("bInterfaceProtocol"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "unsignedIntValue");

          if (v16 == 255 && v18 == 240 && !v20)
            break;
        }
      }

      v11 = IOIteratorNext(object);
      v8 = v11 != 0;
      if (!v11)
        goto LABEL_33;
    }

  }
LABEL_33:
  if (object)
    IOObjectRelease(object);
  return v8;
}

+ (void)_axss_iAPInterfaceExistsForHIDDeviceService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_1AF5CC000, v0, v1, "%s: cannot create parent iterator: error 0x%08X (%d)", v2, v3, v4, v5, 2u);
}

@end
