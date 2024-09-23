@implementation ZL13isSWAllowListv

void *___ZL13isSWAllowListv_block_invoke()
{
  void *result;
  void *v1;

  result = (void *)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  if (result)
  {
    v1 = result;
    if (objc_msgSend((id)objc_msgSend(result, "processName"), "containsString:", CFSTR("ControlStrip")))
      isSWAllowList(void)::allowed = 1;
    result = (void *)objc_msgSend((id)objc_msgSend(v1, "processName"), "containsString:", CFSTR("UserNotificationCenter"));
    if ((_DWORD)result)
      isSWAllowList(void)::allowed = 1;
  }
  return result;
}

@end
