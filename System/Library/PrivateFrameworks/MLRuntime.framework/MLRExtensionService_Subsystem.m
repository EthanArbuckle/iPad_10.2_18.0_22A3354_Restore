@implementation MLRExtensionService_Subsystem

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__MLRExtensionService_Subsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (id)sharedInstance___instance;
}

+ (id)initForPlugInKit
{
  return +[MLRExtensionService_Subsystem sharedInstance](MLRExtensionService_Subsystem, "sharedInstance");
}

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  objc_msgSend(MEMORY[0x24BDD19B0], "_startListening:", 1, a4);
}

@end
