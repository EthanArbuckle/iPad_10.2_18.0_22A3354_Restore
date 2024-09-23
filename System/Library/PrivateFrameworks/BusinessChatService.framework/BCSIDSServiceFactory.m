@implementation BCSIDSServiceFactory

- (id)makeIDSService
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.biz"));
}

@end
