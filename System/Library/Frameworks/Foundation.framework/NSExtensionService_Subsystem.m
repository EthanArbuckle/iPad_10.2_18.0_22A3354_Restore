@implementation NSExtensionService_Subsystem

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  +[_NSExtensionContextVendor _startListening](_NSExtensionContextVendor, "_startListening", a3, a4);
}

+ (id)initForPlugInKit
{
  return +[NSExtensionService_Subsystem sharedInstance](NSExtensionService_Subsystem, "sharedInstance");
}

+ (id)sharedInstance
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__NSExtensionService_Subsystem_sharedInstance__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD0A8D0 != -1)
    dispatch_once(&qword_1ECD0A8D0, v3);
  return (id)qword_1ECD0A8C8;
}

@end
