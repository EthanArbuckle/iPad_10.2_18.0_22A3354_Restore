@implementation SSUSandboxDirectories

- (NSURL)installedAppsDirectoryURL
{
  return self->_installedAppsDirectoryURL;
}

- (void)setInstalledAppsDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_installedAppsDirectoryURL, a3);
}

- (NSURL)cacheDirectoryURL
{
  return self->_cacheDirectoryURL;
}

- (void)setCacheDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDirectoryURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_installedAppsDirectoryURL, 0);
}

@end
