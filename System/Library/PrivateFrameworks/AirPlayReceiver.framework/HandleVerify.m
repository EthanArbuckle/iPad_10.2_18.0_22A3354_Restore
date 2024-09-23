@implementation HandleVerify

uint64_t __coreUtilsPairing_HandleVerify_block_invoke_2()
{
  return APSPairingAuthenticationCoreUtilsVerifySignatureForSameAccount();
}

uint64_t __coreUtilsPairing_HandleVerify_block_invoke()
{
  return APSPairingAuthenticationCoreUtilsSignBytesForSelfIdentity();
}

@end
