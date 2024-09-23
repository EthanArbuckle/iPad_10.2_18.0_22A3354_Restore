@implementation WebArchive(WKFoundationSupport)

+ (uint64_t)bundleForClass
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", NSClassFromString(CFSTR("WKWebView")));
}

@end
