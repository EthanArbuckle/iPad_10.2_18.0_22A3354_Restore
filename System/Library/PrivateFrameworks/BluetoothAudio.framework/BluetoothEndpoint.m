@implementation BluetoothEndpoint

void __BluetoothEndpoint_Disassociate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t);

  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v3)
    v3(v2);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
