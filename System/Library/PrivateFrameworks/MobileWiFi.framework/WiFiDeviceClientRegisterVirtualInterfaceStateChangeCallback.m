@implementation WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback

void __WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback_block_invoke(uint64_t a1)
{
  int v2;
  CFTypeRef v3;
  BOOL v4;
  CFTypeRef cf;

  cf = 0;
  v2 = WiFiDeviceClientCopyInterfaceStateInfo(*(_QWORD *)(a1 + 32), &cf);
  v3 = cf;
  if (cf)
    v4 = v2 == 0;
  else
    v4 = 0;
  if (v4)
  {
    _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent(*(_QWORD *)(a1 + 32), cf);
    goto LABEL_8;
  }
  if (cf)
LABEL_8:
    CFRelease(v3);
}

@end
