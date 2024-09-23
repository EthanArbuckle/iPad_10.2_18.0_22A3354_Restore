@implementation DDURLSchemeIsKnown

uint64_t __DDURLSchemeIsKnown_block_invoke_3(_QWORD *a1)
{
  id v2;
  uint64_t result;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = (id)DDURLSchemeIsKnown_sPublicSchemes;
  result = objc_msgSend((id)DDURLSchemeIsKnown_sPublicSchemes, "containsObject:", a1[4]);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    v4 = (id)qword_1EE40D4C8;
    result = objc_msgSend((id)qword_1EE40D4C8, "containsObject:", a1[4]);
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"), "isApplicationAvailableToOpenURL:error:", a1[5], 0);
      if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      {
        if (!v2)
        {
          v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          DDURLSchemeIsKnown_sPublicSchemes = (uint64_t)v2;
        }
        v5 = a1[4];
        v6 = v2;
      }
      else
      {
        if (!v4)
        {
          v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          qword_1EE40D4C8 = (uint64_t)v4;
        }
        v5 = a1[4];
        v6 = v4;
      }
      return objc_msgSend(v6, "addObject:", v5);
    }
  }
  return result;
}

void __DDURLSchemeIsKnown_block_invoke()
{
  NSObject *v0;
  __CFNotificationCenter *DarwinNotifyCenter;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qword_1EE40D4D0 = (uint64_t)dispatch_queue_create("com.apple.datadetectorscore.schemes", v0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, &DDURLSchemeIsKnown_sPublicSchemes, (CFNotificationCallback)publicSchemesUpdatedCB, (CFStringRef)*MEMORY[0x1E0CA5828], 0, (CFNotificationSuspensionBehavior)0);
  dispatch_sync((dispatch_queue_t)qword_1EE40D4D0, &__block_literal_global_2);
}

void __DDURLSchemeIsKnown_block_invoke_2()
{
  updatePublicSchemes((uint64_t)&DDURLSchemeIsKnown_sPublicSchemes);
}

@end
