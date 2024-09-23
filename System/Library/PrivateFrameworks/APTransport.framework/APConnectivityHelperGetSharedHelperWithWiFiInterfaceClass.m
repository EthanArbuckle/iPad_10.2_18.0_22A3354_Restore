@implementation APConnectivityHelperGetSharedHelperWithWiFiInterfaceClass

uint64_t __APConnectivityHelperGetSharedHelperWithWiFiInterfaceClass_block_invoke()
{
  uint64_t result;

  result = FigSimpleMutexCreate();
  APConnectivityHelperGetSharedHelperWithWiFiInterfaceClass_sMutex = result;
  return result;
}

@end
