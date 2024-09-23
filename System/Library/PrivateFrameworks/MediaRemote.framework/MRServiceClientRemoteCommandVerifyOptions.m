@implementation MRServiceClientRemoteCommandVerifyOptions

uint64_t ___MRServiceClientRemoteCommandVerifyOptions_block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "mr_isCommandSupportedAndEnabled:", *(unsigned int *)(a1 + 40)) & 1) != 0)
    return 1;
  result = +[MRCommandInfo isCommandActuallySupportedEvenWhenDisabled:](MRCommandInfo, "isCommandActuallySupportedEvenWhenDisabled:", *(unsigned int *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "mr_isCommandSupported:", *(unsigned int *)(a1 + 40));
  return result;
}

@end
