@implementation WTFWebFileManagerDelegate

- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 movingItemAtURL:(id)a5 toURL:(id)a6
{
  return objc_msgSend(a4, "code", a3) == 516;
}

@end
