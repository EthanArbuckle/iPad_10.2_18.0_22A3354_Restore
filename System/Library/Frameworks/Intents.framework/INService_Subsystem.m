@implementation INService_Subsystem

+ (id)initForPlugInKit
{
  objc_msgSend(MEMORY[0x1E0CB3B70], "_startListening");
  return objc_alloc_init((Class)a1);
}

@end
