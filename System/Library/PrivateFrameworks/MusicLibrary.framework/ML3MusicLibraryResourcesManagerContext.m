@implementation ML3MusicLibraryResourcesManagerContext

- (BOOL)isMultiUserSupported
{
  return self->_multiUserSupported;
}

- (_MSVAccountInformationProviding)accountInfo
{
  return self->_accountInfo;
}

- (NSString)libraryContainerIdentifier
{
  return self->_libraryContainerIdentifier;
}

+ (id)contextForAutoupdatingSharedLibrary
{
  _BOOL8 v3;
  _BOOL8 v4;
  uint64_t v5;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = +[ML3MusicLibrary deviceSupportsMultipleLibraries](ML3MusicLibrary, "deviceSupportsMultipleLibraries");
  v4 = v3;
  v5 = __daemonProcessInfo;
  if (v3 && __daemonProcessInfo == 0)
  {
    +[MLMediaLibraryResourcesServiceClient sharedService](MLMediaLibraryResourcesServiceClient, "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v9 = 0;
    v8 = 0;
    goto LABEL_13;
  }
  if (__daemonProcessInfo)
    v7 = v3;
  else
    v7 = 0;
  if (!v7)
  {
    v10 = 0;
    goto LABEL_12;
  }
  +[ML3AccountStore defaultStore](ML3AccountStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy](ML3MusicLibraryAccountChangeObserverProxy, "sharedProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
LABEL_13:
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResourcesService:accountInfo:libraryContainerIdentifier:accountChangeObserver:supportsMultiUsers:runningInDaemon:", v10, v8, 0, v9, v4, v5 != 0);

  return v11;
}

- (id)_initWithResourcesService:(id)a3 accountInfo:(id)a4 libraryContainerIdentifier:(id)a5 accountChangeObserver:(id)a6 supportsMultiUsers:(BOOL)a7 runningInDaemon:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  ML3MusicLibraryResourcesManagerContext *v19;
  ML3MusicLibraryResourcesManagerContext *v20;
  uint64_t v21;
  NSString *libraryContainerIdentifier;
  objc_super v24;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ML3MusicLibraryResourcesManagerContext;
  v19 = -[ML3MusicLibraryResourcesManagerContext init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_resourcesService, a3);
    objc_storeStrong((id *)&v20->_accountInfo, a4);
    objc_storeStrong((id *)&v20->_accountChangeObserver, a6);
    v20->_multiUserSupported = a7;
    v20->_runningInDaemon = a8;
    v21 = objc_msgSend(v17, "copy");
    libraryContainerIdentifier = v20->_libraryContainerIdentifier;
    v20->_libraryContainerIdentifier = (NSString *)v21;

  }
  return v20;
}

- (BOOL)isRunningInDaemon
{
  return self->_runningInDaemon;
}

- (MLMediaLibraryResourcesServiceProtocol)resourcesService
{
  return self->_resourcesService;
}

- (MLMediaLibraryAccountChangeObserver)accountChangeObserver
{
  return self->_accountChangeObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_accountChangeObserver, 0);
  objc_storeStrong((id *)&self->_accountInfo, 0);
  objc_storeStrong((id *)&self->_resourcesService, 0);
}

+ (id)contextForSingleUserLibraryWithAccountInfo:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResourcesService:accountInfo:libraryContainerIdentifier:accountChangeObserver:supportsMultiUsers:runningInDaemon:", 0, v4, 0, 0, 0, 0);

  return v5;
}

+ (id)contextForSingleUserLibraryWithLibraryContainerIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResourcesService:accountInfo:libraryContainerIdentifier:accountChangeObserver:supportsMultiUsers:runningInDaemon:", 0, 0, v4, 0, 0, 0);

  return v5;
}

+ (id)contextForMultiUserFrameworkLibraryWithService:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResourcesService:accountInfo:libraryContainerIdentifier:accountChangeObserver:supportsMultiUsers:runningInDaemon:", v4, 0, 0, 0, 1, 0);

  return v5;
}

+ (id)contextForMultiUserDaemonLibraryWithAccountInfo:(id)a3 accountChangeObserver:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResourcesService:accountInfo:libraryContainerIdentifier:accountChangeObserver:supportsMultiUsers:runningInDaemon:", 0, v7, 0, v6, 1, 1);

  return v8;
}

@end
