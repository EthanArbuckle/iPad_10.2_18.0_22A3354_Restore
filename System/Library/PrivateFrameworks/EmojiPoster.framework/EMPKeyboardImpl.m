@implementation EMPKeyboardImpl

+ (void)releaseSharedInstance
{
  objc_msgSend(MEMORY[0x1E0DC3958], "releaseSharedInstance");
}

+ (void)purgeImageCache
{
  objc_msgSend(MEMORY[0x1E0DC3958], "purgeImageCache");
}

@end
