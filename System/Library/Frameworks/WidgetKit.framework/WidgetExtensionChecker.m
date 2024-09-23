@implementation WidgetExtensionChecker

+ (BOOL)isExtensionSubsystemInitialized
{
  Class v2;

  v2 = NSClassFromString(CFSTR("EXSwiftUI_Subsystem"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[objc_class initialized](v2, "initialized");
  else
    return 0;
}

@end
