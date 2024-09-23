@implementation SOSCachedNotification

+ (id)notificationName:(const char *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
}

@end
