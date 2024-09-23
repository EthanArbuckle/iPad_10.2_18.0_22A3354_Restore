@implementation MBDeviceUDID

id __MBDeviceUDID_Legacy_client_block_invoke()
{
  void *v0;
  void *v1;
  id result;

  v0 = MBGetGestaltValueForKey();
  if (!v0)
    objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 1, CFSTR("Error getting %@ from MobileGestalt"), CFSTR("UniqueDeviceID")));
  v1 = v0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __MBDeviceUDID_Legacy_client_block_invoke_cold_1();
  result = v1;
  MBDeviceUDID_Legacy_client_sDeviceUDID = (uint64_t)result;
  return result;
}

void __MBDeviceUDID_Legacy_client_block_invoke_cold_1()
{
  __assert_rtn("MBDeviceUDID_Legacy_client_block_invoke", "MBConstants.m", 261, "[value isKindOfClass:[NSString class]]");
}

@end
