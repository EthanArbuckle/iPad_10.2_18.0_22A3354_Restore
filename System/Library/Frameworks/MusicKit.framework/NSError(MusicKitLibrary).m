@implementation NSError(MusicKitLibrary)

+ (uint64_t)musicKit_defaultLibraryError
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MusicKitLibraryErrorDomain"), 1, 0);
}

@end
