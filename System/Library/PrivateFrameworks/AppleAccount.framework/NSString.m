@implementation NSString

void __43__NSString_AAMessage___phoneNumberDetector__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 2048, 0);
  v1 = (void *)_phoneNumberDetector;
  _phoneNumberDetector = v0;

}

@end
