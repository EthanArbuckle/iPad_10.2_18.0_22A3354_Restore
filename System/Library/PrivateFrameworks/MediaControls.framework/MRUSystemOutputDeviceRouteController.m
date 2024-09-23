@implementation MRUSystemOutputDeviceRouteController

- (BOOL)isSplitRoute
{
  return self->_isSplitRoute;
}

- (MPAVOutputDeviceRoute)primaryOutputDeviceRoute
{
  return self->_primaryOutputDeviceRoute;
}

+ (MRUSystemOutputDeviceRouteController)sharedController
{
  if (sharedController___once != -1)
    dispatch_once(&sharedController___once, &__block_literal_global_1);
  return (MRUSystemOutputDeviceRouteController *)(id)sharedController___sharedController;
}

void __56__MRUSystemOutputDeviceRouteController_sharedController__block_invoke()
{
  MRUSystemOutputDeviceRouteController *v0;
  void *v1;

  v0 = objc_alloc_init(MRUSystemOutputDeviceRouteController);
  v1 = (void *)sharedController___sharedController;
  sharedController___sharedController = (uint64_t)v0;

}

- (MRUSystemOutputDeviceRouteController)init
{
  MRUSystemOutputDeviceRouteController *v2;
  uint64_t v3;
  NSHashTable *observers;
  uint64_t v5;
  MPAVEndpointRoute *systemRoute;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MRUSystemOutputDeviceRouteController;
  v2 = -[MRUSystemOutputDeviceRouteController init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0CC2318], "systemRoute");
    v5 = objc_claimAutoreleasedReturnValue();
    systemRoute = v2->_systemRoute;
    v2->_systemRoute = (MPAVEndpointRoute *)v5;

    +[MRUCallMonitor sharedMonitor](MRUCallMonitor, "sharedMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", v2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_routeDidChangeNotification, *MEMORY[0x1E0CC1CD0], v2->_systemRoute);

    -[MRUSystemOutputDeviceRouteController updateOutputDevices](v2, "updateOutputDevices");
  }
  return v2;
}

- (MRUOutputDeviceAsset)systemOutputDeviceAsset
{
  MRUOutputDeviceAsset *v3;

  if (-[MPAVEndpointRoute isSplitRoute](self->_systemRoute, "isSplitRoute"))
  {
    +[MRUOutputDeviceAsset sharingAsset](MRUOutputDeviceAsset, "sharingAsset");
    v3 = (MRUOutputDeviceAsset *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = -[MRUOutputDeviceAsset initWithOutputDeviceRoute:]([MRUOutputDeviceAsset alloc], "initWithOutputDeviceRoute:", self->_systemOutputDeviceRoute);
  }
  return v3;
}

- (MRUOutputDeviceAsset)systemOutputDeviceAssetWithInCall
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  BOOL v7;

  -[MPAVOutputDeviceRoute outputDevice](self->_systemOutputDeviceRoute, "outputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deviceType");

  +[MRUCallMonitor sharedMonitor](MRUCallMonitor, "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOnCall");

  if (v6)
    v7 = v4 == 4;
  else
    v7 = 0;
  if (v7)
    +[MRUOutputDeviceAsset inCallAsset](MRUOutputDeviceAsset, "inCallAsset");
  else
    -[MRUSystemOutputDeviceRouteController systemOutputDeviceAsset](self, "systemOutputDeviceAsset");
  return (MRUOutputDeviceAsset *)(id)objc_claimAutoreleasedReturnValue();
}

- (MRUOutputDeviceAsset)primaryOutputDeviceAsset
{
  return -[MRUOutputDeviceAsset initWithOutputDeviceRoute:]([MRUOutputDeviceAsset alloc], "initWithOutputDeviceRoute:", self->_primaryOutputDeviceRoute);
}

- (MRUOutputDeviceAsset)secondaryOutputDeviceAsset
{
  return -[MRUOutputDeviceAsset initWithOutputDeviceRoute:]([MRUOutputDeviceAsset alloc], "initWithOutputDeviceRoute:", self->_secondaryOutputDeviceRoute);
}

+ (id)outputContextDescription
{
  void *v2;
  void *v3;
  void *v4;

  MRAVOutputContextGetSharedAudioPresentationContext();
  v2 = (void *)MRAVOutputContextCopyOutputDevices();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceType");
  v4 = (void *)MRAVOutputDeviceTypeCopyDescription();

  return v4;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)routeDidChangeNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MRUSystemOutputDeviceRouteController_routeDidChangeNotification__block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __66__MRUSystemOutputDeviceRouteController_routeDidChangeNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateOutputDevices");
}

- (void)callMonitorDidUpdateOnCall:(id)a3 isOnCall:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", a3, a4, 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:", self);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)updateOutputDevices
{
  void *v3;
  void *v4;
  MPAVOutputDeviceRoute *v5;
  MPAVOutputDeviceRoute *systemOutputDeviceRoute;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  MPAVOutputDeviceRoute *v13;
  MPAVOutputDeviceRoute *primaryOutputDeviceRoute;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  MPAVOutputDeviceRoute *v22;
  MPAVOutputDeviceRoute *secondaryOutputDeviceRoute;
  void *v24;
  char v25;
  MPAVOutputDeviceRoute *v26;
  MPAVOutputDeviceRoute *v27;
  MPAVOutputDeviceRoute *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  _BOOL4 isSplitRoute;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  void *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  -[MPAVEndpointRoute endpointObject](self->_systemRoute, "endpointObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_30;
  if (-[MPAVEndpointRoute isSplitRoute](self->_systemRoute, "isSplitRoute"))
  {
    isSplitRoute = self->_isSplitRoute;
    if (!self->_isSplitRoute)
      self->_isSplitRoute = 1;
    v5 = (MPAVOutputDeviceRoute *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC22F8]), "initWithOutputDevices:", v4);
    systemOutputDeviceRoute = self->_systemOutputDeviceRoute;
    self->_systemOutputDeviceRoute = v5;

    -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self->_primaryOutputDeviceRoute, "logicalLeaderOutputDevice");
    v7 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();

    v10 = objc_alloc(MEMORY[0x1E0CC22F8]);
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (MPAVOutputDeviceRoute *)objc_msgSend(v10, "initWithOutputDevices:", v12);
    primaryOutputDeviceRoute = self->_primaryOutputDeviceRoute;
    self->_primaryOutputDeviceRoute = v13;

    v15 = objc_msgSend(v9, "isEqualToString:", v7);
    -[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self->_secondaryOutputDeviceRoute, "logicalLeaderOutputDevice");
    v16 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();

    v19 = objc_alloc(MEMORY[0x1E0CC22F8]);
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (MPAVOutputDeviceRoute *)objc_msgSend(v19, "initWithOutputDevices:", v21);
    secondaryOutputDeviceRoute = self->_secondaryOutputDeviceRoute;
    self->_secondaryOutputDeviceRoute = v22;

    LODWORD(v19) = objc_msgSend(v18, "isEqualToString:", v16);
    if ((_DWORD)v19 && isSplitRoute && v15)
      goto LABEL_20;
    goto LABEL_10;
  }
  self->_isSplitRoute = 0;
  -[MPAVOutputDeviceRoute outputDevices](self->_systemOutputDeviceRoute, "outputDevices");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToArray:", v4);

  v26 = (MPAVOutputDeviceRoute *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC22F8]), "initWithOutputDevices:", v4);
  v27 = self->_systemOutputDeviceRoute;
  self->_systemOutputDeviceRoute = v26;

  objc_storeStrong((id *)&self->_primaryOutputDeviceRoute, self->_systemOutputDeviceRoute);
  v28 = self->_secondaryOutputDeviceRoute;
  self->_secondaryOutputDeviceRoute = 0;

  if ((v25 & 1) == 0)
  {
LABEL_10:
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v29 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v47 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v34, "systemOutputDeviceRouteControllerDidUpdateOutputDevices:", self);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v31);
    }

  }
LABEL_20:
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v35 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v43 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v40, "systemOutputDeviceRouteControllerDidUpdateOutputDeviceProperties:", self);
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v37);
  }

LABEL_30:
}

- (MPAVEndpointRoute)systemRoute
{
  return self->_systemRoute;
}

- (MPAVOutputDeviceRoute)systemOutputDeviceRoute
{
  return self->_systemOutputDeviceRoute;
}

- (MPAVOutputDeviceRoute)secondaryOutputDeviceRoute
{
  return self->_secondaryOutputDeviceRoute;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_secondaryOutputDeviceRoute, 0);
  objc_storeStrong((id *)&self->_primaryOutputDeviceRoute, 0);
  objc_storeStrong((id *)&self->_systemOutputDeviceRoute, 0);
  objc_storeStrong((id *)&self->_systemRoute, 0);
}

@end
