@implementation IMSandboxingUtils

+ (OS_os_log)logger
{
  if (qword_1ECFC7248 != -1)
    dispatch_once(&qword_1ECFC7248, &unk_1E3FB35E8);
  return (OS_os_log *)(id)qword_1EE503EA0;
}

- (id)logger
{
  return (id)objc_msgSend((id)objc_opt_class(), "logger");
}

+ (BOOL)enterSandboxWithBundleIdentifier:(const char *)a3
{
  return 1;
}

@end
