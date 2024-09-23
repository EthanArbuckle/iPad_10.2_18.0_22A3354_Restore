@implementation AUAudioUnitService_Subsystem

+ (id)initForPlugInKit
{
  objc_msgSend(MEMORY[0x1E0CB3B70], "_startListening");
  return (id)objc_opt_new();
}

@end
