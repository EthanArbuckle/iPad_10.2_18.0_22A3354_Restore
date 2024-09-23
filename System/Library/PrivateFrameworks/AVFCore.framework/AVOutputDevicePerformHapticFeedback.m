@implementation AVOutputDevicePerformHapticFeedback

uint64_t __AVOutputDevicePerformHapticFeedback_block_invoke(uint64_t a1, signed int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = AVLocalizedErrorWithUnderlyingOSStatus(a2, 0);
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

@end
