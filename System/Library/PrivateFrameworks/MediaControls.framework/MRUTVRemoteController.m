@implementation MRUTVRemoteController

- (MRUTVRemoteController)initWithEndpointController:(id)a3
{
  id v5;
  MRUTVRemoteController *v6;
  MRUTVRemoteController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUTVRemoteController;
  v6 = -[MRUTVRemoteController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointController, a3);
    -[MRUEndpointController addObserver:](v7->_endpointController, "addObserver:", v7);
    -[MRUTVRemoteController updateShowTVRemote](v7, "updateShowTVRemote");
  }

  return v7;
}

- (id)mediaRemoteIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MRUEndpointController route](self->_endpointController, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isAppleTVRoute") & 1) != 0
    || objc_msgSend(v2, "containsDeviceWithSubtype:", 18))
  {
    objc_msgSend((id)objc_msgSend(v2, "endpoint"), "externalDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)airplayIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  _BOOL4 v9;

  -[MRUEndpointController route](self->_endpointController, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v2, "endpoint"), "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isAppleTVRoute") & 1) != 0
    || objc_msgSend(v2, "isTVRoute") && objc_msgSend(v4, "isAddedToHomeKit"))
  {
    objc_msgSend(v2, "groupLeaderAirplayIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v2, "isDeviceRoute")
      || !objc_msgSend(v2, "isAirPlayingToDevice")
      || objc_msgSend(v3, "count") != 1
      || (objc_msgSend(v4, "deviceSubtype") != 13 ? (v7 = 0) : (v7 = objc_msgSend(v4, "supportsRapport")),
          objc_msgSend(v4, "deviceSubtype") != 11
       && objc_msgSend(v4, "deviceSubtype") != 17
       && objc_msgSend(v4, "deviceSubtype") != 16
        ? (v8 = 0)
        : (v8 = objc_msgSend(v4, "isAddedToHomeKit")),
          objc_msgSend(v4, "deviceSubtype") != 15 ? (v9 = 0) : (v9 = objc_msgSend(v4, "clusterType") == 2),
          ((v7 | v8) & 1) == 0 && !v9))
    {
      v6 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v4, "uid");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_22:

  return v6;
}

- (BOOL)transportSupportsTVRemote
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[MRUEndpointController route](self->_endpointController, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v2, "endpoint"), "outputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "transportType") == 1;

  return v5;
}

- (void)prewarmIfNeeded
{
  id v2;

  if (self->_showTVRemote)
  {
    objc_msgSend(MEMORY[0x1E0DB1FD0], "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "prewarm");

  }
}

- (void)presentTVRemoteUsingApp:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[MRUTVRemoteController mediaRemoteIdentifier](self, "mediaRemoteIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 0;
    v14 = (id)v5;
  }
  else
  {
    -[MRUTVRemoteController airplayIdentifier](self, "airplayIdentifier");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  -[MRUEndpointController route](self->_endpointController, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTVRoute");

  v9 = -[MRUTVRemoteController launchContext](self, "launchContext");
  v10 = v14;
  if (v14)
  {
    if (v8)
      v11 = 2;
    else
      v11 = 1;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1FC8]), "initWithDeviceIdentifier:identifierType:deviceType:launchContext:launchMethod:", v14, v6, v11, v9, v3);
    objc_msgSend(MEMORY[0x1E0DB1FD0], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentWithContext:", v12);

    v10 = v14;
  }

}

- (void)updateShowTVRemote
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id WeakRetained;

  if (-[MRUTVRemoteController transportSupportsTVRemote](self, "transportSupportsTVRemote"))
  {
    -[MRUTVRemoteController mediaRemoteIdentifier](self, "mediaRemoteIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = 1;
    }
    else
    {
      -[MRUTVRemoteController airplayIdentifier](self, "airplayIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v5 != 0;

    }
  }
  else
  {
    v4 = 0;
  }
  if (self->_showTVRemote != v4)
  {
    self->_showTVRemote = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "tvRemoteController:didChangeShowTVRemote:", self, v4);

  }
}

- (int64_t)launchContext
{
  unint64_t v2;

  v2 = self->_context - 1;
  if (v2 > 6)
    return 0;
  else
    return qword_1AAAD6428[v2];
}

- (id)_stateDumpObject
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("airplayIdentifier");
  -[MRUTVRemoteController airplayIdentifier](self, "airplayIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("<NONE>");
  v11[1] = CFSTR("mediaRemoteIdentifier");
  v12[0] = v5;
  -[MRUTVRemoteController mediaRemoteIdentifier](self, "mediaRemoteIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("<NONE>");
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MRUEndpointController)endpointController
{
  return self->_endpointController;
}

- (MRUTVRemoteControllerDelegate)delegate
{
  return (MRUTVRemoteControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showTVRemote
{
  return self->_showTVRemote;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endpointController, 0);
}

@end
