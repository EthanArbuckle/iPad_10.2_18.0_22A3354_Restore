@implementation RegisterForScreenIsBlankedByProximitySensorNotification

uint64_t __cmsmdevicestate_RegisterForScreenIsBlankedByProximitySensorNotification_block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(dword_1EE2B29FC, &state64);
  if ((_DWORD)result)
    v1 = 1;
  else
    v1 = state64 == 0;
  v2 = !v1;
  byte_1EE2B29F8 = v2;
  return result;
}

@end
