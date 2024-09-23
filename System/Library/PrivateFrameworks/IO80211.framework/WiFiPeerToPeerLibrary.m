@implementation WiFiPeerToPeerLibrary

void *__WiFiPeerToPeerLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/WiFiPeerToPeer.framework/WiFiPeerToPeer", 2);
  WiFiPeerToPeerLibrary_sLib = (uint64_t)result;
  return result;
}

@end
