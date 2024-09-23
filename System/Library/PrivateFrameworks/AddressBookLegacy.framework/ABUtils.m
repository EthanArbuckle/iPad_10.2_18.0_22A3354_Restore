@implementation ABUtils

+ (id)mainBundleID
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
}

+ (id)processName
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
}

@end
