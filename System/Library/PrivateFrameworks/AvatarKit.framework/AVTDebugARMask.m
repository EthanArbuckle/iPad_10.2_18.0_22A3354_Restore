@implementation AVTDebugARMask

void __AVTDebugARMask_block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  AVTDebugARMask_debugMode = objc_msgSend(v0, "BOOLForKey:", CFSTR("avatarKit.showARLayers"));

}

@end
