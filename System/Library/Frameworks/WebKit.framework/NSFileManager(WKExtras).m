@implementation NSFileManager(WKExtras)

+ (uint64_t)_web_createTemporaryFileForQuickLook:()WKExtras
{
  return WebCore::createTemporaryFileForQuickLook(this, a2);
}

@end
