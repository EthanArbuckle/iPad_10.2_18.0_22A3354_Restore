@implementation MRUEndpointController

+ (id)localEndpointController
{
  MediaControlsEndpointController *v3;
  void *v4;
  MediaControlsEndpointController *v5;
  void *v6;

  v3 = [MediaControlsEndpointController alloc];
  objc_msgSend(MEMORY[0x1E0CC2318], "systemRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MediaControlsEndpointController initWithEndpoint:](v3, "initWithEndpoint:", v4);

  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEndpointController:", v5);
  return v6;
}

+ (id)userSelectedEndpointController
{
  MediaControlsActiveEndpointController *v3;
  void *v4;

  v3 = -[MediaControlsActiveEndpointController initWithActiveEndpointType:]([MediaControlsActiveEndpointController alloc], "initWithActiveEndpointType:", 0);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEndpointController:", v3);

  return v4;
}

+ (id)proactiveEndpointController
{
  MediaControlsActiveEndpointController *v3;
  void *v4;

  v3 = -[MediaControlsActiveEndpointController initWithActiveEndpointType:]([MediaControlsActiveEndpointController alloc], "initWithActiveEndpointType:", 1);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEndpointController:", v3);

  return v4;
}

+ (id)proactiveUserSelectedEndpointController
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportManyRecommendationsPlatters");

  if (v4)
    objc_msgSend(a1, "userSelectedEndpointController");
  else
    objc_msgSend(a1, "proactiveEndpointController");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)proactiveRecommendedEndpointController
{
  MediaControlsActiveEndpointController *v3;
  void *v4;

  v3 = -[MediaControlsActiveEndpointController initWithActiveEndpointType:]([MediaControlsActiveEndpointController alloc], "initWithActiveEndpointType:", 3);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEndpointController:", v3);

  return v4;
}

- (MRUEndpointController)initWithEndpointController:(id)a3
{
  id v5;
  MRUEndpointController *v6;
  uint64_t v7;
  NSHashTable *observers;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRUEndpointController;
  v6 = -[MRUEndpointController init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_endpointController, a3);
    -[MediaControlsEndpointController setDelegate:](v6->_endpointController, "setDelegate:", v6);
  }

  return v6;
}

- (MRUEndpointController)initWithRouteUID:(id)a3 client:(id)a4 player:(id)a5
{
  id v8;
  id v9;
  id v10;
  MediaControlsStandaloneEndpointController *v11;
  MRUEndpointController *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[MediaControlsStandaloneEndpointController initWithRouteUID:client:player:]([MediaControlsStandaloneEndpointController alloc], "initWithRouteUID:client:player:", v10, v9, v8);

  v12 = -[MRUEndpointController initWithEndpointController:](self, "initWithEndpointController:", v11);
  return v12;
}

- (MPCPlayerResponse)response
{
  return -[MediaControlsEndpointController response](self->_endpointController, "response");
}

- (NSString)routeUID
{
  void *v2;
  void *v3;

  -[MediaControlsEndpointController route](self->_endpointController, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "routeUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (MPAVEndpointRoute)route
{
  return -[MediaControlsEndpointController route](self->_endpointController, "route");
}

- (int64_t)state
{
  int64_t result;

  result = -[MediaControlsEndpointController state](self->_endpointController, "state");
  if ((unint64_t)result >= 4)
    return -1;
  return result;
}

- (BOOL)isEndpointDiscovered
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[MRUEndpointController endpointController](self, "endpointController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 1;
  -[MRUEndpointController endpointController](self, "endpointController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEndpointDiscovered");

  return v6;
}

- (BOOL)isAirPlaying
{
  return -[MediaControlsEndpointController isAirPlaying](self->_endpointController, "isAirPlaying");
}

- (BOOL)isDeviceSystemRoute
{
  return -[MediaControlsEndpointController isDeviceSystemRoute](self->_endpointController, "isDeviceSystemRoute");
}

- (BOOL)updatesActiveEndpointInPlace
{
  return -[MediaControlsEndpointController isMemberOfClass:](self->_endpointController, "isMemberOfClass:", objc_opt_class());
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)containsOutputDeviceWithRouteUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MediaControlsEndpointController route](self->_endpointController, "route", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v5, "endpoint"), "outputDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "containsUID:", v4) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)connectAllowingAuthenticationWithCompletion:(id)a3
{
  -[MediaControlsEndpointController connectAllowingAuthenticationWithCompletion:](self->_endpointController, "connectAllowingAuthenticationWithCompletion:", a3);
}

- (void)launchNowPlayingApp
{
  -[MediaControlsEndpointController launchNowPlayingApp](self->_endpointController, "launchNowPlayingApp");
}

- (void)endpointController:(id)a3 didLoadNewResponse:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "endpointController:didChangeResponse:", self, v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)endpointControllerDidChangeState:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", a3, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "endpointController:didChangeState:", self, -[MRUEndpointController state](self, "state"));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)notifyObserversRouteDidUpdate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[MRUEndpointController route](self, "route");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "endpointController:didChangeRoute:", self, v9);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (MediaControlsEndpointController)endpointController
{
  return self->_endpointController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
