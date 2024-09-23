@implementation IMDLocalDaemon

+ (IMLocalDaemonProtocol)sharedDaemon
{
  return (IMLocalDaemonProtocol *)(id)qword_1ED936250;
}

+ (void)setSharedDaemon:(id)a3
{
  objc_storeStrong((id *)&qword_1ED936250, a3);
}

@end
