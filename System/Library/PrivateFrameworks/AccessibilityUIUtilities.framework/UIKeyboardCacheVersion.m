@implementation UIKeyboardCacheVersion

void __UIKeyboardCacheVersion_block_invoke()
{
  void *v0;

  v0 = (void *)MGCopyAnswerWithError();
  UIKeyboardCacheVersion_buildVersion = objc_msgSend(v0, "hash");

}

@end
