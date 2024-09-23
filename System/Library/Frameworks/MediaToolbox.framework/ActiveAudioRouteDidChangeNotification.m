@implementation ActiveAudioRouteDidChangeNotification

void __playerceleste_ActiveAudioRouteDidChangeNotification_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD);

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 120);
  if (v3)
    v3(v2, 0);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
