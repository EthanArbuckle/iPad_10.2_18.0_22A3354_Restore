@implementation DARunLoopRegistry

+ (NSRunLoop)sharedRunLoop
{
  return (NSRunLoop *)objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
}

@end
