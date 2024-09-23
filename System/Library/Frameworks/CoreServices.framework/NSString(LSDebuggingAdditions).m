@implementation NSString(LSDebuggingAdditions)

+ (__CFString)NSStringFromLSInstallPhase:()LSDebuggingAdditions
{
  if (a3 < 5)
    return off_1E10441A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(LSInstallPhase)%llu"), a3);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (__CFString)NSStringFromLSInstallState:()LSDebuggingAdditions
{
  if (a3 < 6)
    return off_1E10441D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(LSInstallState)%llu"), a3);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (__CFString)NSStringFromLSInstallType:()LSDebuggingAdditions
{
  if (a3 < 0xB)
    return off_1E1044200[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(LSInstallType)%llu"), a3);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
