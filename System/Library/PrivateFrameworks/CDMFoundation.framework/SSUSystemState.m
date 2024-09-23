@implementation SSUSystemState

- (SSUSystemState)initWithCacheDirectoryProvider:(id)a3 installedAppProvider:(id)a4
{
  SSUCacheDirectoryProvider *v6;
  SSUInstalledAppProvider *v7;
  SSUSystemState *v8;
  SSUCacheDirectoryProvider *cacheDirectoryProvider;
  SSUCacheDirectoryProvider *v10;
  SSUInstalledAppProvider *installedAppProvider;
  objc_super v13;

  v6 = (SSUCacheDirectoryProvider *)a3;
  v7 = (SSUInstalledAppProvider *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SSUSystemState;
  v8 = -[SSUSystemState init](&v13, sel_init);
  cacheDirectoryProvider = v8->_cacheDirectoryProvider;
  v8->_cacheDirectoryProvider = v6;
  v10 = v6;

  installedAppProvider = v8->_installedAppProvider;
  v8->_installedAppProvider = v7;

  return v8;
}

- (SSUCacheDirectoryProvider)cacheDirectoryProvider
{
  return self->_cacheDirectoryProvider;
}

- (SSUInstalledAppProvider)installedAppProvider
{
  return self->_installedAppProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedAppProvider, 0);
  objc_storeStrong((id *)&self->_cacheDirectoryProvider, 0);
}

@end
