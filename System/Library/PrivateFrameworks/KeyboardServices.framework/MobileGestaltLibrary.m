@implementation MobileGestaltLibrary

void __MobileGestaltLibrary_block_invoke()
{
  MobileGestaltLibrary_sLib = (uint64_t)dlopen("/usr/lib//libMobileGestalt.dylib", 2);
  if (!MobileGestaltLibrary_sLib)
    NSLog(CFSTR("Failed to softlink library /libMobileGestalt.dylib"));
}

void __MobileGestaltLibrary_block_invoke_0()
{
  MobileGestaltLibrary_sLib_0 = (uint64_t)dlopen("/usr/lib//libMobileGestalt.dylib", 2);
  if (!MobileGestaltLibrary_sLib_0)
    NSLog(CFSTR("Failed to softlink library /libMobileGestalt.dylib"));
}

@end
