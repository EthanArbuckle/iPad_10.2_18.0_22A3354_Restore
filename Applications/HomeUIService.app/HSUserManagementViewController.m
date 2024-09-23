@implementation HSUserManagementViewController

- (HSUserManagementViewController)initWithRootViewController:(id)a3
{
  HSUserManagementViewController *v3;
  id v4;
  void *v5;
  HMHomeManager *v6;
  HMHomeManager *homeManager;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HSUserManagementViewController;
  v3 = -[HSUserManagementViewController initWithRootViewController:](&v9, "initWithRootViewController:", a3);
  if (v3)
  {
    v4 = objc_alloc((Class)HMHomeManager);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[HMHomeManagerConfiguration defaultPrivateConfiguration](HMHomeManagerConfiguration, "defaultPrivateConfiguration"));
    v6 = (HMHomeManager *)objc_msgSend(v4, "initWithHomeMangerConfiguration:", v5);
    homeManager = v3->_homeManager;
    v3->_homeManager = v6;

    -[HMHomeManager setDelegate:](v3->_homeManager, "setDelegate:", v3);
    v3->_didNotifyFinishLoading = 0;
  }
  return v3;
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface hm_userManagementRemoteHostInterface](NSXPCInterface, "hm_userManagementRemoteHostInterface");
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface hm_userManagementRemoteServiceInterface](NSXPCInterface, "hm_userManagementRemoteServiceInterface");
}

- (void)setHomeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_homeUUID, a3);
  -[HSUserManagementViewController _updateHome](self, "_updateHome");
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  -[HSUserManagementViewController _updateHome](self, "_updateHome", a3);
}

- (void)_updateHome
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_claimAutoreleasedReturnValue(-[HSUserManagementViewController homeUUID](self, "homeUUID"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserManagementViewController home](self, "home"));

    if (!v5)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserManagementViewController homeManager](self, "homeManager", 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homes"));

      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserManagementViewController homeUUID](self, "homeUUID"));
            v15 = objc_msgSend(v13, "isEqual:", v14);

            if (v15)
            {
              -[HSUserManagementViewController setHome:](self, "setHome:", v12);
              goto LABEL_13;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_13:

    }
  }
  -[HSUserManagementViewController _updateViewControllers](self, "_updateViewControllers");
  -[HSUserManagementViewController _notifyRemoteReadyToDisplayIfNeeded](self, "_notifyRemoteReadyToDisplayIfNeeded");
}

- (void)_notifyRemoteReadyToDisplayIfNeeded
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[HSUserManagementViewController home](self, "home"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[HSUserManagementViewController didNotifyFinishLoading](self, "didNotifyFinishLoading");

    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserManagementViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
      objc_msgSend(v6, "userManagementDidLoad");

      -[HSUserManagementViewController setDidNotifyFinishLoading:](self, "setDidNotifyFinishLoading:", 1);
    }
  }
}

- (void)_updateViewControllers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserManagementViewController viewControllers](self, "viewControllers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___HUUserManagementDelegate))
        {
          v9 = v8;
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserManagementViewController home](self, "home"));
          objc_msgSend(v9, "updateHome:", v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)addPeopleViewControllerDidCancel:(id)a3
{
  -[HSUserManagementViewController _notifyHostAndDismissWithError:](self, "_notifyHostAndDismissWithError:", 0);
}

- (void)addPeopleViewController:(id)a3 didSendInvitations:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserManagementViewController topViewController](self, "topViewController", a3, a4));
  v7 = objc_opt_class(HUAddPeopleViewController, v6);
  isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  if ((isKindOfClass & 1) != 0)
    -[HSUserManagementViewController _notifyHostAndDismissWithError:](self, "_notifyHostAndDismissWithError:", 0);
}

- (void)controllerDidDismissWithError:(id)a3
{
  -[HSUserManagementViewController _notifyHostAndDismissWithError:](self, "_notifyHostAndDismissWithError:", a3);
}

- (void)controllerDidSendInvitations:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSUserManagementViewController topViewController](self, "topViewController", a3));
  v6 = objc_opt_class(HUAddPeopleViewController, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0)
    -[HSUserManagementViewController _notifyHostAndDismissWithError:](self, "_notifyHostAndDismissWithError:", 0);
}

- (void)_notifyHostAndDismissWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HSUserManagementViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "userManagementDidFinishWithError:", v4);

}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (BOOL)didNotifyFinishLoading
{
  return self->_didNotifyFinishLoading;
}

- (void)setDidNotifyFinishLoading:(BOOL)a3
{
  self->_didNotifyFinishLoading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

@end
