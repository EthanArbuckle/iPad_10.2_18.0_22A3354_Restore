@implementation NSLayoutConstraint(MobileSafariFrameworkExtras)

- (void)sf_withPriority:()MobileSafariFrameworkExtras
{
  objc_msgSend(a1, "setPriority:");
  return a1;
}

+ (uint64_t)sf_setConstraints:()MobileSafariFrameworkExtras active:
{
  if (a4)
    return objc_msgSend(a1, "activateConstraints:");
  else
    return objc_msgSend(a1, "deactivateConstraints:");
}

@end
