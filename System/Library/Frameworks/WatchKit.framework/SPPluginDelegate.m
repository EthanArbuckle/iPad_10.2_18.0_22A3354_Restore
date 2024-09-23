@implementation SPPluginDelegate

- (id)rootObjectForPlugIn:(id)a3
{
  return +[SPRemoteInterface startRemoteInterface](SPRemoteInterface, "startRemoteInterface", a3);
}

@end
