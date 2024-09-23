@implementation GKUtils

+ (BOOL)applicationLinkedOnOrAfter:(unsigned int)a3 macVersion:(unsigned int)a4
{
  return dyld_program_sdk_at_least();
}

@end
