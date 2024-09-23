@implementation SPXcodeSupport

- (void)applicationIdentifierWithReply:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("com.apple.dt.xcode"));
}

@end
