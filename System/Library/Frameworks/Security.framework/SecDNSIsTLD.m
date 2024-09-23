@implementation SecDNSIsTLD

void *__SecDNSIsTLD_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CFNetwork.framework/CFNetwork", 1);
  if (result)
  {
    result = dlsym(result, "_CFHostIsDomainTopLevelForCertificatePolicy");
    SecDNSIsTLD_CFNIsDomainTopLevelFunctionPtr = result;
  }
  return result;
}

@end
