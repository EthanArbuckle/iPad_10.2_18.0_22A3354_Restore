@implementation FigPowerLogRegisterEvent

void __FigPowerLogRegisterEvent_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const void *v6;
  CFTypeID v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x193FFC34C]();
  v8 = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D87D60], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x1E0D87D78], "identifierWithPid:", *(unsigned int *)(a1 + 48)), &v8);
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(v3, "identity");
    v6 = (const void *)objc_msgSend(v5, "embeddedApplicationIdentifier");
    if (v6 || (v6 = (const void *)objc_msgSend(v5, "xpcServiceIdentifier")) != 0)
    {
      objc_autoreleasePoolPop(v2);
    }
    else
    {
      v6 = (const void *)objc_msgSend((id)objc_msgSend(v4, "bundle"), "identifier");
      objc_autoreleasePoolPop(v2);
      if (!v6)
        goto LABEL_8;
    }
    v7 = CFGetTypeID(v6);
    if (v7 == CFStringGetTypeID())
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), CFSTR("clientDisplayID"), v6);
  }
  else
  {
    objc_autoreleasePoolPop(v2);
  }
LABEL_8:
  figPLLogRegisteredEvent(28, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
  CFRelease(*(CFTypeRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

dispatch_queue_t __FigPowerLogRegisterEvent_block_invoke_2()
{
  dispatch_queue_t result;

  result = FigDispatchQueueCreateWithPriority("com.apple.coremedia.powerlogprocessing", 0, 0);
  sPowerLogProcessingQueue = (uint64_t)result;
  return result;
}

uint64_t __FigPowerLogRegisterEvent_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
