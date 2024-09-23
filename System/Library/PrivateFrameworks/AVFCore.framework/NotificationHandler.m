@implementation NotificationHandler

void __NotificationHandler_block_invoke(uint64_t a1)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x1E0CC3ED8]))
  {
    teardown(*(_QWORD *)(a1 + 32));
    setup(*(_QWORD *)(a1 + 32));
  }
  else if (CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x1E0CA3248]))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVExternalProtectionMonitorExternalProtectionStateChangedNotification"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
