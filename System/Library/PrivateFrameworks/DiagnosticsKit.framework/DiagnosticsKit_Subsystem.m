@implementation DiagnosticsKit_Subsystem

+ (id)initForPlugInKit
{
  objc_msgSend(MEMORY[0x24BDD19B0], "_startListening");
  return (id)objc_opt_new();
}

@end
