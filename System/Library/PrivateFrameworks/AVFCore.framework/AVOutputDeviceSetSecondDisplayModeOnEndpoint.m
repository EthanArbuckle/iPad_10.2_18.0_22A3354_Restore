@implementation AVOutputDeviceSetSecondDisplayModeOnEndpoint

uint64_t __AVOutputDeviceSetSecondDisplayModeOnEndpoint_block_invoke(uint64_t a1, signed int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v3 = AVLocalizedErrorWithUnderlyingOSStatus(a2, 0);
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    v5 = v2;
    v6 = 0;
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    v5 = *(_QWORD *)(a1 + 40);
    v3 = 0;
  }
  return v4(v5, v6, v3);
}

@end
