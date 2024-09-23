@implementation DADeviceLocalRemoteRunner

- (id)_createDeviceConnection
{
  return +[DARemoteRunnerManager sharedInstance](DARemoteRunnerManager, "sharedInstance");
}

@end
