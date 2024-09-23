@implementation HMSetupAccessoryPayload(HFAdditions)

- (uint64_t)hf_requiresEthernet
{
  uint64_t result;

  if (objc_msgSend(a1, "communicationProtocol") == 2)
    return 0;
  result = objc_msgSend(a1, "supportsIP");
  if ((_DWORD)result)
    return objc_msgSend(a1, "supportsWAC") ^ 1;
  return result;
}

@end
