@implementation SiriUICoreLibrary

void *__SiriUICoreLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SiriUICore.framework/SiriUICore", 2);
  SiriUICoreLibrary_sLib = (uint64_t)result;
  return result;
}

@end
