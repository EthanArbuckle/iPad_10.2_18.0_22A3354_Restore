@implementation CNUICoreScreentimePasscodeInspector

- (unint64_t)screentimePasscodeStatus
{
  if (-[objc_class isRestrictionsPasscodeSet](getSTRemotePasscodeControllerClass(), "isRestrictionsPasscodeSet"))return 2;
  else
    return 1;
}

- (unint64_t)screentimePasscodeStatusOfDelegateWithInfo:(id)a3
{
  if (a3)
    return 0;
  else
    return -[CNUICoreScreentimePasscodeInspector screentimePasscodeStatus](self, "screentimePasscodeStatus");
}

@end
