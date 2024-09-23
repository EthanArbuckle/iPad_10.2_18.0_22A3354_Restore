@implementation RegisterForScreenIsBlankedNotification

uint64_t __cmsmdevicestate_RegisterForScreenIsBlankedNotification_block_invoke()
{
  uint64_t v0;
  uint64_t result;
  BOOL v2;
  char v3;
  uint64_t state64;

  v0 = byte_1EE2B29E0;
  state64 = 0;
  result = notify_get_state(dword_1EE2B29E4, &state64);
  if ((_DWORD)result)
    v2 = 1;
  else
    v2 = state64 == 0;
  v3 = !v2;
  byte_1EE2B29E0 = v3;
  if (off_1EE2B29F0)
    return ((uint64_t (*)(uint64_t))off_1EE2B29F0)(v0);
  return result;
}

@end
