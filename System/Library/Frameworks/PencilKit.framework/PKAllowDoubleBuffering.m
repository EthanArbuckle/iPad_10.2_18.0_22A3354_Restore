@implementation PKAllowDoubleBuffering

void __PKAllowDoubleBuffering_block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.PencilKit"));
  _MergedGlobals_1_0 = objc_msgSend(v0, "BOOLForKey:", CFSTR("PKAllowDoubleBuffering"));

}

@end
